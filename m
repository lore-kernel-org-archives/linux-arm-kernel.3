Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9800CA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 16:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rXNuKnioQFz3rtqWC/tP7w8NaCHmc1EB5yrCK1qULiA=; b=cj7rt1iscWPz8OtW4yhzkDauOc
	/4rEoVwQ4+wC/zY8fCetYPSHeX6Jarw9QZsLFypdz1Xwk7mNPVzKhDi7aWlka7Hs9Y4kjjwAp2PWW
	+eWZhTlPt3AMZhvJRcc78WBIbaq8Eck3BavBK7/ANfjRF7++Dak4ZX5aUjpRmqubirrBB9pVhc0zf
	w58HPWEUGD5m1KVg9Posijxz33LCSbYR0jc78CNUnA87FbVkWI4B759yrJXksYkG4eHY7RUBkSEGM
	D81FHsncKtJ8mutLpG/ZOa8XcXAFzEBSbwpFp4XEdQWHWkmJiPzuk/Zw4iKaoVdH31qMY5IZ3EHyk
	0N8pVr1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up8Ur-0000000HaPZ-2VDC;
	Thu, 21 Aug 2025 16:50:41 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up4kh-0000000GxTr-0KeM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 12:50:48 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-afcb78d5e74so143555266b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 05:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755780645; x=1756385445; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXNuKnioQFz3rtqWC/tP7w8NaCHmc1EB5yrCK1qULiA=;
        b=nJnf5D6n+Fl+nMPRMlbSbGa90w9fQTFMj1sX9Tz4VYxCGG9D8al3AkNaMEfgiXe+PV
         N64G/KeqPNSPu7/sPlwxmdleoIssk1ayzaRLbqxc+nfREaMaJ54xwGwg0QcLQG7tFzVA
         NTv/tfA+uqNGenL5YH88tkFrhrQRWJYm48y52eIuFPXWEbKhklJuK/W5d1ow55iEcbBo
         ymotC12FU+pY8VHLiyxuozRDJ4U9mHzD+f50k0ZdVaerRjbaG8ug2Na8qW61uqu3y3ne
         SdjP5fDUd/yCg1p+vSCcw2ZJCrsZPgyTaSvEyZ+LXUUPR5cut+nBsJxwUfV9lK0Qq908
         0yAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755780645; x=1756385445;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rXNuKnioQFz3rtqWC/tP7w8NaCHmc1EB5yrCK1qULiA=;
        b=Prs5lvxLglVGWskXUfgT2BwfAtK2hImXne4TJ90YNy7MX93LgPzRfxlEFu4FzX9E9q
         Z+T1BNMeQlSRq2zGSzJj5Strp8qbKn91rWoyw2j6TKcbs1km0s2ufP/sTMIuiBuEOBjo
         +uz1SDaC5mkhWta7ybg22AR5R2WvqNUHjHQsZNaB6VjTqI3C5z83NAN3K8+usbOv64QE
         8F2RZYq4eJoVorp8G6FNEj3HD+ufko0zn/JmJbOHT1fMODzh5B+E0T98RXPQPPipHbvp
         lGuWogh7Zw/Drh7x19NNkOLxEIi+z0kGImCnW6F9l58LnXaZCbMt88MzmpukrZ4KPiZB
         fjiA==
X-Forwarded-Encrypted: i=1; AJvYcCWN7LoIEoHua1BFUWYmkieBYiElcJ8RvXcKmx1ev8wH55vQkJCZHqkCCn+AjyPCgLC7IVSKlnVzW6Cl4nM0zpP9@lists.infradead.org
X-Gm-Message-State: AOJu0YxALNcpejt12pItrBiLXzbFfc5fndvO5BE7V1dyK41HSu1sQsni
	JnitcB1TFKMQIgzgRHzIPYcmD1O7KH8rUNCALLiNjplAdGolU35HdDSzqQaTMSiJHkoCn1dVK2Q
	gpyocsEQa/Yif1jxIlbYFLnrF6aYHp6Qi0DKp3/g=
X-Gm-Gg: ASbGncufJRA2psmnRMI5urc6rxGkHI36WSYFVS0bSMIhkRboq2KsrBgLZwXh6a424M6
	otUtKmTxmXVQUW7sTQKCoX6cAYQE2xazNMN6r/N2dOOUgNvelm4JN3ascCzfv2Gt/czFjQdW0Nq
	W92hLbtch7CKfjHCRwRXLC8GkqxNm1MHUCfHBJ/VxOS7Xzfg/THZgSNNFCIjTfvnP1oH+efuujy
	zq7fiV7xA==
X-Google-Smtp-Source: AGHT+IFqLJzfxlE9IzrL92NoVUr6Ne6ykptrtie8d+0UYuYwU8A8dTBLaLR16KfvelH/Vi8PA7WIvYgckc571ZyT4n8=
X-Received: by 2002:a17:906:4fc9:b0:af2:91c7:f2f8 with SMTP id
 a640c23a62f3a-afe07d3fba2mr219920066b.50.1755780645163; Thu, 21 Aug 2025
 05:50:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250820154037.22228-1-jszhang@kernel.org> <20250820154037.22228-6-jszhang@kernel.org>
 <CACRpkdYQLqDxh=zqrZ+wK_Ky2wD5AUoVLmCV_JDfmaqJC4Yzqg@mail.gmail.com>
In-Reply-To: <CACRpkdYQLqDxh=zqrZ+wK_Ky2wD5AUoVLmCV_JDfmaqJC4Yzqg@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 21 Aug 2025 15:50:07 +0300
X-Gm-Features: Ac12FXzttMVTUGZEGb0vWnktV7PySLes6yhjoNd5Y9rUABfh--T1PQfOw84YMT0
Message-ID: <CAHp75VfauP9=fkoZd8D-kGOXye_uE8TE0k47YTogPDSk18gDNA@mail.gmail.com>
Subject: Re: [PATCH 05/16] gpio: pl061: Use modern PM macros
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Michael Buesch <m@bues.ch>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Andy Shevchenko <andy@kernel.org>, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
	Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_055047_143833_A1ADCED0 
X-CRM114-Status: GOOD (  13.59  )
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

On Thu, Aug 21, 2025 at 2:52=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
> On Wed, Aug 20, 2025 at 5:58=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org=
> wrote:

...

> > The pl061_context_save_regs structure is always embedded into struct
> > pl061 to simplify code, so this brings a tiny 8 bytes memory overhead
> > for !CONFIG_PM_SLEP.
> >
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
>
> Hm true, 8 bytes is not a big deal.

It's better to double check. This data is per GPIO chip, the Q is how
many chips can be present on one system. Then the calculus will be N *
8 bytes.

Knowing gpio-dwapb (and having even a HW with it) the commit message
(there) seems like a slight manipulation as it doesn't clarify this
detail.

--=20
With Best Regards,
Andy Shevchenko

