Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 075A0E7BD85
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 10:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P13RQBdg6K1Wy1Hr9r4bT32rks9Vl0ToNw0MIIfQKTs=; b=uOOXX705S0fJa26tPLZxR1I02C
	9euELwQG+3KhweTZli05xqBfxtX9u0cl5WKid6HeIDzb4oMKRlY+G1euMMq2etpiHOtB74weMezOz
	kKeWSxRZprF6h1WvqTb0948+kjEmDg8v4d6Yxpd9zRkB3wQNMimpM8lsaGHaegkTiA5+HDFMHoRYa
	0XwCN1qp9mop8qi3aNenQh0zHjWYfMxSXyy51Nz/Q6TyU/5yZjTR0iVWLMx3lnajkCgPN38vHdOgT
	kMlmDt+FXNt2CvwHZNku/YWWua+Bs2GKwhfIa0o1JfNbswqX6M/h8Wzoop1N0hNYjKdAucOUM6E0/
	3p1ETL3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrvay-00000006KQY-3mFq;
	Mon, 16 Feb 2026 10:12:48 +0000
Received: from mail-ua1-f42.google.com ([209.85.222.42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrvax-00000006KQC-0ylE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 10:12:48 +0000
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-94b07fddecbso1805367241.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 02:12:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771236766; x=1771841566;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P13RQBdg6K1Wy1Hr9r4bT32rks9Vl0ToNw0MIIfQKTs=;
        b=WrngHoUqC2brPOBf1E9n9I4/INzmPc1XRGmGXuYwz8w7eJBXEoGoHaHTAicjA4ikbC
         Ix7TAUr6bBGczH885DRgIwDGiwECtdBYv+HAKqePrVlSy6ewGE/sqQuuvLBGsQM+M2Gd
         Euf0PcVk4pfnue1IOwzwBY93Wlto1lMSYIDFMrMolbHz6x+DIdVk7k7+54s/ktVzTmG0
         uLvLUFocatOBM0FZw5uEIrNnq9zbyKdbrGdugQxuV3N/M/MQAW83uYT8WfGMsF5/6dMW
         l9h8moIblf7h4sq1WQdLTkaQZtE4mO70X2tzucJyb5rfOVEZ/GqT7wCMBsF98czGI6mG
         dg9w==
X-Forwarded-Encrypted: i=1; AJvYcCUJK1qyBNJc+A7/ONacD3KZxJ54o0ynU9erXvPkOm5T+aRsTMU703fX5cA7rKtmYK2CraE483VzYVOxdPw4PVnf@lists.infradead.org
X-Gm-Message-State: AOJu0YwPuxCqdwCbGYYOiGZtH96k8bnxuTy2bJE5NcPq6btBgJgC1bHf
	GJfzMLV5URVcuj0qV1Eo8O6RDy1miphTKtqM39wXhTj0O2sQOmDiBO9ykAgzWu1S
X-Gm-Gg: AZuq6aLvkNTFXjC0p2KJ2ySc3FRpJo0WBM2YM5hmggfOReciYZR74nVUW43FkgkceS2
	XztuVU7kKKumB8WVxiLrWjJ46fRMWNx2jELCCHhj4fP2/2Gma5fYIYDaK5ZQdqizQE1jpyRkA3t
	5PebljZKC4RF5DrFOma/zmxxvr8djHaEot7SbChBWrkW8MHkKdZTrnZartzOFCdMLIAQOs+mkYr
	psVDMfyN7iLT6VByoheBsY2QbH5ayTzETuHl/NZrJ0hBo/mYEgzDryMeNiVfqsZikr+HgdYpYDV
	ZRypvXIpG4GNV6iQPwn7ClmQLx2F0Q3pR2TIloXzpqZP6D37efc+oGG8SmwD21grsLHVHSd/cLF
	bpXtqD66O+GcITwTKV699K8MMFvfxN4tyS6Yfo1HRtHDAd5VtUUIsf417JCxT3LQRLw72I0Hxck
	hmLySLqvv/qAYWPW2WMhXd1hFXadH48NBRIpSSn9BTZBL/bO5y+iVrgD1blfqY56C+
X-Received: by 2002:a05:6102:ccc:b0:5ef:248b:d533 with SMTP id ada2fe7eead31-5fe2afaace7mr2729689137.31.1771236765693;
        Mon, 16 Feb 2026 02:12:45 -0800 (PST)
Received: from mail-vk1-f169.google.com (mail-vk1-f169.google.com. [209.85.221.169])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94afd37d557sm7202765241.12.2026.02.16.02.12.45
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 02:12:45 -0800 (PST)
Received: by mail-vk1-f169.google.com with SMTP id 71dfb90a1353d-56641b5a471so2310232e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Feb 2026 02:12:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVUgtvInp4IFRKFC7zOERrDlisacSTrR0CmuajK/UrPAbf0492q+v8CKVhub6IS732d5jxhbB3DZPpJpkFnWv7A@lists.infradead.org
X-Received: by 2002:a05:6122:a03:b0:559:6960:be0d with SMTP id
 71dfb90a1353d-56889c06729mr2290707e0c.13.1771236764971; Mon, 16 Feb 2026
 02:12:44 -0800 (PST)
MIME-Version: 1.0
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
 <20260215225501.6365-3-wsa+renesas@sang-engineering.com> <6e495cc2-3469-4855-8645-c5633d937f1e@omp.ru>
 <aZLVU9toZRX2vKX7@ninjato>
In-Reply-To: <aZLVU9toZRX2vKX7@ninjato>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Feb 2026 11:12:34 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWwJZ4fiNgh4DEGpr85QQrPwyA=F=RFyPq-iGzq=F5qMw@mail.gmail.com>
X-Gm-Features: AaiRm53XX8yh0yo47xtUNtlKS0oVTVKQWhwNHvxvJ08yrbcLBEFD0v6qPau1ZLw
Message-ID: <CAMuHMdWwJZ4fiNgh4DEGpr85QQrPwyA=F=RFyPq-iGzq=F5qMw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/13] hwspinlock: add callback to fill private
 data of a hwspinlock
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Sergey Shtylyov <s.shtylyov@omp.ru>, linux-renesas-soc@vger.kernel.org, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, linux-arm-kernel@lists.infradead.org, 
	Bjorn Andersson <andersson@kernel.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	linux-remoteproc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_021247_276625_C6EFC090 
X-CRM114-Status: GOOD (  19.21  )
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

Hi Wolfram,

On Mon, 16 Feb 2026 at 09:29, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> >    Don't you break the existing users of this API with this change? I s=
ee
> > you're fixing them up in the followup patches but that's not how it sho=
uld
> > be done -- the compilation shouldn't be broken...
>
> I am not breaking them. The helper is an additional feature and the old
> way still works until patch 8. Until then, all users are converted.
>
> I built tested it :)

Is that the statistically most-used response to that question? ;-)

drivers/hwspinlock/sun6i_hwspinlock.c: In function =E2=80=98sun6i_hwspinloc=
k_probe=E2=80=99:
drivers/hwspinlock/sun6i_hwspinlock.c:182:16: error: too few arguments
to function =E2=80=98devm_hwspin_lock_register=E2=80=99
  182 |         return devm_hwspin_lock_register(&pdev->dev,
priv->bank, &sun6i_hwspinlock_ops,
      |                ^~~~~~~~~~~~~~~~~~~~~~~~~
[...]

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

