Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD272C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 13:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JW7NRP7hVniWiGB6UL0laEFQgAVHaVo7/jjO5z8p93o=; b=gBQBxt0cDbNQmcIbOPPzeviQea
	sQKGknLoeB2KjibKsIYHaNAHNp7pq4d/RIh9hMWREBxu76HNJsFxBvfQCTiW3f3m7lV6bW4tAO+IC
	qduRRDlrxZFbUSV9uv6EjvKI1vb7KUXyi2sHzdLm5pUj4Cbp9Wd+ZiasK8VNMWrFHlWkx/YBdf7w6
	AvsrydGcyRQtIETeCn4YaaYRIlNov6WbD8JE8Ewpce7kN74LjRRCvW9iCKSRFaHucrwQsjTwv9Sdp
	A+Bifwhm+92ymldAisxYN1XXlE1uXWc6lY1qWPJJw66tvrdUFDKbSrVYJEOyWW44T2VQCUIzbqWzS
	m1ercWEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1mxh-00000000cO2-0g5A;
	Mon, 07 Apr 2025 13:56:29 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1mZw-00000000X0U-2IbZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 13:31:57 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5e614da8615so3035390a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 06:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744032715; x=1744637515; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JW7NRP7hVniWiGB6UL0laEFQgAVHaVo7/jjO5z8p93o=;
        b=V7nz4edanG1zu0gXmC1dikfadHhgGZXcn3DS/p0YQS0OXiPP377l7Go+G0Elq2QzKu
         XuaI971FatZqVAtWiIF3brGYGrbdK0vCQwkWZylZhjCt9qDINmj8+Bw83imtArNvSLmc
         7Be2dzCwNtzxtd5q4qQrxunJ1WMUWNmnJhsF8J4UlxBUzAmYif8KuNaJ2RJ9M/U++MxB
         2jfdhdsjdDqWiFX6v9/3l5CcGxaSY/xgNpj3Khvu9fvTn/LZxETcJ/8JrC294fKRqYFN
         ItKHaf+2iAP8JLIhl6dKJFWqeoC/OqP3k9AIzM3TXgPCUEwFRon4cx/6KLLyYDTKzH/1
         lX7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744032715; x=1744637515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JW7NRP7hVniWiGB6UL0laEFQgAVHaVo7/jjO5z8p93o=;
        b=T+B8f4oMgrRJ7tauDMcX65Q+zipdNbG3/JfWjzp5J2Y10h3uaq1kezxLcw0dLqoAyR
         3tIG0wBPiEXYcPeavsiHvnx9vroDsR7A5RxZbuLtceQS9jv64TKGRmXZWFime5ilfwfj
         vYLCR2KsaXaTZLgsxUChwd2hvIm3A5aweFFzpKpMU8wLc7zjQXa6WTxKlYQlsYunPjsn
         vOxBUe9RVg2wmT/nSvRNx8IsBz5/6teUPwPzf6VJ4JzbTSR4ntSH+dB3ntIH3yrWolBY
         TUhlW3f4JxCFc52sqXNCbCkiSnkTgCe2jOTyRyS8fKtIvvxmI0utSVpXQgrTLgow5iiY
         EgDQ==
X-Forwarded-Encrypted: i=1; AJvYcCV7vZ9CWHdrk7ItGtqtixywI5IixDvTxEUh+Dbf6BUzp3BiG0sXTzDn5VcWFqAJDyxlF1sbjpo48WcQYuuQte4o@lists.infradead.org
X-Gm-Message-State: AOJu0YzU3dmqUr9lWm+YyRfEXZQBMfQKXF56P2Z4XK2m5Of4nA9dAdEg
	ATqy+lc7Kc3uFInL7Ihz6bkACo/FK74IYUBTcVG0iYWkgXW/ykLJu2yf6ZEAx3VtRr4Q+xso342
	m7cAO2c55Tq6i8PM9qSueYgk6vdB9k9dmMng=
X-Gm-Gg: ASbGnctGklIOMJDuby7CfLYcgLkmm0jQCQiNQK1d5xrQT7BA4W7W/4OTIZmW8YsiBw0
	dEwyzIwMnvPVLjV4OII5cqWWZsdNz/lapE6uojz+x+Lkeknyud+Rkw/OM/ATy4IkNkVFdGBmbFz
	hBN3DGDzx4U85JgibwJSQPhX50tg==
X-Google-Smtp-Source: AGHT+IFBlB6Ga15umPa39EQLS5gekFeGZCivZxz5YF+QtcJdtzN/ayMPgiFJeUDLz8ax5kgoj5rU5Ip1Rp8qsQe8kcM=
X-Received: by 2002:a05:6402:430a:b0:5ed:19b4:98ea with SMTP id
 4fb4d7f45d1cf-5f0837374bamr13633396a12.0.1744032710021; Mon, 07 Apr 2025
 06:31:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250407092243.2207837-1-xavier_qy@163.com> <20250407112922.17766-1-ioworker0@gmail.com>
 <5e3f976f.bca1.19610528896.Coremail.xavier_qy@163.com>
In-Reply-To: <5e3f976f.bca1.19610528896.Coremail.xavier_qy@163.com>
From: Lance Yang <ioworker0@gmail.com>
Date: Mon, 7 Apr 2025 21:31:12 +0800
X-Gm-Features: ATxdqUFxa60yAB7AlomJiSWp637JosPrB4u1vsUKdG1vfTWoIp9hVXH1SuDnoCU
Message-ID: <CAK1f24=hwXCg6K8a=qoWi2DGEWFGBcenSGRoKXtJEo=iR4DtDw@mail.gmail.com>
Subject: Re: Re: [PATCH v1] mm/contpte: Optimize loop to reduce redundant operations
To: Xavier <xavier_qy@163.com>
Cc: akpm@linux-foundation.org, baohua@kernel.org, catalin.marinas@arm.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ryan.roberts@arm.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_063156_604717_55212F77 
X-CRM114-Status: GOOD (  20.36  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Apr 7, 2025 at 8:56=E2=80=AFPM Xavier <xavier_qy@163.com> wrote:
>
>
>
> Hi Lance,
>
> Thanks for your feedback, my response is as follows.
>
> --
> Thanks,
> Xavier
>
>
>
>
>
> At 2025-04-07 19:29:22, "Lance Yang" <ioworker0@gmail.com> wrote:
> >Thanks for the patch. Would the following change be better?
> >
> >diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> >index 55107d27d3f8..64eb3b2fbf06 100644
> >--- a/arch/arm64/mm/contpte.c
> >+++ b/arch/arm64/mm/contpte.c
> >@@ -174,6 +174,9 @@ pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte)
> >
> >               if (pte_young(pte))
> >                       orig_pte =3D pte_mkyoung(orig_pte);
> >+
> >+              if (pte_young(orig_pte) && pte_dirty(orig_pte))
> >+                      break;
> >       }
> >
> >       return orig_pte;
> >--
> >
> >We can check the orig_pte flags directly instead of using extra boolean
> >variables, which gives us an early-exit when both dirty and young flags
> >are set.
> Your way of writing the code is indeed more concise. However, I think
>  using boolean variables might be more efficient. Although it introduces
>  additional variables, comparing boolean values is likely to be more
>  efficient than checking bit settings.
>
> >
> >Also, is this optimization really needed for the common case?
> This function is on a high-frequency execution path. During debugging,
>  I found that in most cases, the first few pages are already marked as
>  both dirty and young. But currently, the program still has to complete
>  the entire loop of 16 ptep iterations, which seriously reduces the effic=
iency.

Hmm... agreed that this patch helps when early PTEs are dirty/young, but
for late-ones-only cases, it only introduces overhead with no benefit, IIUC=
.

So, let's wait for folks to take a look ;)

Thanks,
Lance

> >
> >Thanks,
> >Lance

