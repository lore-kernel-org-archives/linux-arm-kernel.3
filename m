Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BE79C02195
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 16:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GRCaqWuU09U3T2jXMnWL1ADrKkzTr/bvXQmYgmOjVmE=; b=SWVZju+f4vMO3dvm/pUuOi2YNL
	SIUWQS5K7eD8O6UyT7VsC5NlgvkCZcuAB9A9/1ocbn6VBkn+sH+9x2LaNWIQGIQuLmTjEjLQ2wndR
	t8zM1F6Z79UA9kSsXfWuLuAInNkBXTeO1Gfg3aflGxR/fvGYWIPTaxrPvpWn1VKA0eZu0jqIxJpau
	k8mkfSqcKz8XcZK6gZ4Id6oUgqeyV4uEqY4GorwoAgE4AN8PMYJHYEW/Kwzy8wDpcfWoromEyOBuu
	EQSxM1H/KkDfAz+nTJh4LZ7Wqvcy3inYLJi80v3M8rPGp4BBdyHo+U/q06bk0XonnCGI6xC8qz+3R
	rTeP7O+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teyuq-0000000Fwjo-2Hvv;
	Mon, 03 Feb 2025 16:03:16 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teytV-0000000FwYP-3c8K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 16:01:55 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3ce7c4115e8so17769825ab.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Feb 2025 08:01:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20230601.gappssmtp.com; s=20230601; t=1738598512; x=1739203312; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GRCaqWuU09U3T2jXMnWL1ADrKkzTr/bvXQmYgmOjVmE=;
        b=yAm5Rux0BO27sISDHE+aVuj/c+PKjSxAC1e4ch2vzRHZun/4Gtb8zjglNKp1fyNu0X
         k7KmcZ4nnDRj4UMiGQ510/PHYigtOl3tgTcrNIfsz1WYFi6f9WIHr43YUHrSZ75yS2a7
         VElJIhfdCjupMKL+QYWWSEUj/7YZVpbNQafpW778fNewbhheN/CgBeud8tvPI2vY8o3N
         FhlNZJ/9EwJUiOHl3h+TXEO2SpjOd6/8hNfM5xdVNnR6NLuw+z5TXCSPG2FmK9Pb/dx4
         GASK8K9efzAlxvF8s9n514Y2huGTXAkC1DgNwm1M6Whr3nWOXoxaRBsqweyRUi6SrEgF
         tffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738598512; x=1739203312;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GRCaqWuU09U3T2jXMnWL1ADrKkzTr/bvXQmYgmOjVmE=;
        b=ZvSPkkzsdMRZUkxw9pUYUDpjmJ3LKs0NAgjQ9IsLp/KCYUxpCSur7QRi73cDpLzpIW
         TL3Y29qunjbcFf/DzbyATBTRFI2V+gkiYBfd3WShzVvbX0tn2PQs2fcRKQJEefvj7PmD
         kTstxPrhBRWAL8ykzZcnubNG2huj9+Bk/Z58nM8nTT3hGj1lMK8vNYOj3TWzRHjcEkd+
         IL4ZMG0aoR1hQz2otRU+b038gmvtKCyVNZj0+ObA6Y0ekDEecf0KwOAkh5xWN7IQ+KT6
         5EDwW+DAIuKaHxCjuW6tmJfewKtHU/awwreYBRFkvoBoY3BiXN6nxp8sMdFIZ7EVGsNe
         BCJg==
X-Forwarded-Encrypted: i=1; AJvYcCWjPICoNOkAPwGUg5qQ5KZO7tgrbe3pXKPZeAGkxX/1Kaz/UWwau187e+0KdK1eDfHM6rN5QKlk64B4HJcyiP9e@lists.infradead.org
X-Gm-Message-State: AOJu0YyZZMnIHlW9cd1IsThfBasYwnm5MR/i0QswSoQV/BQDVdxy6Mmf
	Eh9N2GoyHfwgIyu75f0z6Uh9gViZAr/j93LFGd6doa9hVkowBJ+8Mz7s1bPoNFdk+aeTN47s15Y
	KLuakfLhip+oYppu43BzqxjpDAqzOug80UEVT1g==
X-Gm-Gg: ASbGncsi04+XajGDDjDePIcVZTogtQ6mFJN36toEE/Mep5jsI7dzDj0oiMWRKBBNsZI
	8NfN/XIMK/EjmW410/YDZhqU2iGwxvBryR6yR565BeCJNOCdirLKMIOI+RWULVMWlUr8bv4X2Ww
	==
X-Google-Smtp-Source: AGHT+IGh48EGwTYFSKrKDNbwh6iM4EsoVfBSxF4gz8U4VFmSmI9atHaxKvm8zrK7zrd+YcMu62K8X5RTMCsgFSldYNE=
X-Received: by 2002:a05:6e02:1809:b0:3cf:c7bc:4523 with SMTP id
 e9e14a558f8ab-3d008eec85emr149079765ab.6.1738598512548; Mon, 03 Feb 2025
 08:01:52 -0800 (PST)
MIME-Version: 1.0
References: <20241214172549.8842-1-apatel@ventanamicro.com> <87tt9bnmcz.ffs@tglx>
In-Reply-To: <87tt9bnmcz.ffs@tglx>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 3 Feb 2025 21:31:41 +0530
X-Gm-Features: AWEUYZlO5PZddtosW3YVPDmyhEnZw9_BooCQby6hNDlavzyqwz_yNvI7qNklqJg
Message-ID: <CAAhSdy26zZNOfD8CW_MaYq0PrZCVef6gqD7b=D1KWNZpcqYjrA@mail.gmail.com>
Subject: Re: [PATCH v2 00/11] RISC-V IMSIC driver improvements
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Anup Patel <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@atishpatra.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_080154_044898_A23D741B 
X-CRM114-Status: GOOD (  11.22  )
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

On Mon, Feb 3, 2025 at 7:47=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de>=
 wrote:
>
> Anup!
>
> On Sat, Dec 14 2024 at 22:55, Anup Patel wrote:
> > This series is based on recent discussion on LKML:
> > https://lore.kernel.org/lkml/20241114161845.502027-18-ajones@ventanamic=
ro.com/
> >
> > It primarily focuses on moving to RISC-V IMSIC driver use common MSI
> > lib and GENERIC_PENDING_IRQ.
>
> Can you please respin this series on top of rc1?

Sure, I will rebase and send v3 tomorrow.

Thanks,
Anup

