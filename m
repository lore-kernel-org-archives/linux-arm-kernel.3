Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9000FD42BB7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 17:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s8kF92FLc9q8F7ms+jA4kEhMAFhcMT/yEg1qkYnhBWc=; b=PYlxVVXe0LT8HKA/ZUcnuQVkRl
	Rei9GQYOk/rNdTYE3ic6ETkT2eCzjSoeZPZ+lRjlcDyXy9tVBKE+TN6yok7fZ/3o4yepqK52ncecc
	R9qP0bPtzGlD/QS+HxC7sHr5SSni2nL8RUJHyeaO89gnKmMiAlKXo9dx48jW7BFejQWLrmZYw5S/q
	/AUb7HyIxHMEvSU3StS+gVVpJNzjF8/x8UzuUNBtHC0N9P6cWQdUn/NBxN/qn3LoBdIx5r5WxHCdC
	wQTOnqiPx+5utpKnUepN8MiDgvcSvnP5HfsEl404P9NVnV3u469UxyvZzsY538Ejs2bqAUvPStPuH
	yYZwh3iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAuo4-00000004OM1-2okJ;
	Tue, 12 Nov 2024 17:36:00 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAuPJ-00000004Ihq-1DOE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 17:10:26 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2fb5be4381dso50876971fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Nov 2024 09:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731431423; x=1732036223; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s8kF92FLc9q8F7ms+jA4kEhMAFhcMT/yEg1qkYnhBWc=;
        b=YeiJD28DPVw530rF66GUUWNz5ekWXwTwQbTKTT1noRF6wioKBsicE9asdbOh4i2kg3
         wXMz27kUxAVsaXvknoan2V53GVfIaGQSt02B9yfDS77bJLmUTCWtTy0mFyKMX6qjDAib
         kWiJ3rBct1YmndVDLlklirKvtnnX9UkfISrWZ19YDbF/O3jJ7gDATvPt3SIOrqOhv22r
         qIYCOrmNnkQO+50e2v4hOMRg/l9p1HTTMQ1Uk9KoacGaS5N/e1oasqgLbx/KFrozkXsc
         fD8roQMgWCXwmvn8Naejx+lpsLU6yML04Tz8y1jpUbOyAGBCZFjLt8ggOwDNKPz36dEr
         t+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731431423; x=1732036223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s8kF92FLc9q8F7ms+jA4kEhMAFhcMT/yEg1qkYnhBWc=;
        b=IDvPqZPtdojlUWS4jLPqR+vdo5wpDsICrc7E7hxi1m80UcLaiMBn8T5Jgxq7EO7+jn
         DZKppS5IeEbJkvnXyqpdVsZeZOyhVIowtX/OqvRYcqe+fpfaAdx0TAqiKe/uIT4x9wQW
         LHNV417NmadTTkJM0zMsgaEWP5mi6cEwoOAFBWQ4/vyBY3NNO2aO4b5/WmKMYP/Dh/kD
         qdWgZcxwlVcwMKiZp6pybI107sZcYJ5ZQyQ14VX6mCbEH6A8lFDQRtRaQe9s/ZeawcXL
         amSyheyXTcg5DGNNeCSyebNSBcdkZAwA5oRZSqL++eb4tDAe53dM1cTa9BCMAhjXIxl9
         EEFQ==
X-Gm-Message-State: AOJu0YymzA99EcVGtU7dDdhARwPUei2HdCmAcqSAfctbx2G5PdFbHnXG
	By0l5CuVlT46P2jvXJuiu9I3hTcyt0Zm/8JvkXhJkBpeNl2IsJxr
X-Google-Smtp-Source: AGHT+IGLRwzqrZD/rzM4KpYM2LYHJGEeH0ijuh3q6+s7nyrFo8hI+5aekxdh33AEdqeTJUKxuPJMww==
X-Received: by 2002:a2e:a5c5:0:b0:2fa:c014:4b6b with SMTP id 38308e7fff4ca-2ff202abbbemr77254001fa.41.1731431422563;
        Tue, 12 Nov 2024 09:10:22 -0800 (PST)
Received: from foxbook (bff246.neoplus.adsl.tpnet.pl. [83.28.43.246])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff178dfb6dsm21451531fa.20.2024.11.12.09.10.20
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 12 Nov 2024 09:10:20 -0800 (PST)
Date: Tue, 12 Nov 2024 18:10:17 +0100
From: =?UTF-8?B?TWljaGHFgg==?= Pecio <michal.pecio@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: linux-arm-kernel@lists.infradead.org, Linus Walleij
 <linus.walleij@linaro.org>
Subject: Re: cacheflush completely broken, suspecting PAN+LPAE
Message-ID: <20241112181017.03992d1f@foxbook>
In-Reply-To: <ZzMsMFNSHLOKEeEW@shell.armlinux.org.uk>
References: <20241111233817.2f824c19@foxbook>
	<ZzMsMFNSHLOKEeEW@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_091025_352447_27F8F485 
X-CRM114-Status: GOOD (  18.72  )
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

On Tue, 12 Nov 2024 10:21:36 +0000, Russell King (Oracle) wrote:
> From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> Subject: [PATCH] ARM: fix cacheflush with PAN
>=20
> It seems that the cacheflush syscall got broken when PAN was
> implemented. User access was not enabled around the cache maintenance
> instructions, causing them to fault.
>=20
> Fixes: a5e090acbf54 ("ARM: software-based priviledged-no-access support")

For the record, non-LPAE seems to be OK, so for me it was 7af5b901e847.

> Reported-by: From: Micha=C5=82 Pecio <michal.pecio@gmail.com>

"From:" perhaps not strictly necessary ;)

Tested-by: Micha=C5=82 Pecio <michal.pecio@gmail.com>

That was it. With this patch gdb starts normally, does 295 cacheflush
calls and all of them succeed, with ARM_LPAE and ARM_PAN enabled.

> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  arch/arm/kernel/traps.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
> index 54dcdcde3f77..6518771c1496 100644
> --- a/arch/arm/kernel/traps.c
> +++ b/arch/arm/kernel/traps.c
> @@ -574,6 +574,7 @@ static int bad_syscall(int n, struct pt_regs *regs)
>  static inline int
>  __do_cache_op(unsigned long start, unsigned long end)
>  {
> +	unsigned int ua_flags;
>  	int ret;
> =20
>  	do {
> @@ -582,7 +583,9 @@ __do_cache_op(unsigned long start, unsigned long end)
>  		if (fatal_signal_pending(current))
>  			return 0;
> =20
> +		ua_flags =3D uaccess_save_and_enable();
>  		ret =3D flush_icache_user_range(start, start + chunk);
> +		uaccess_restore(ua_flags);
>  		if (ret)
>  			return ret;
> =20
> --=20
> 2.30.2

