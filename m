Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F221CC0218B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 13:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qiygrgYsO739skaoPESqIEGzSo4IJJ9SbsxwNuEpwL0=; b=tunfsJoTHtO2dYlnXfA5hWIH3X
	2L2QHAZzp2fnXSyo5Cwqhpt7WFuIvq0JRD6+92KBDs6WhNf7dHHsCx0n1LyiF+8U2xGJFco3htqEx
	gC5GSWW7C3cT2cHGLkBgmt9ldGezuEyGqPp6GrNR7dBXIgNIIBkynUD2se0fwNQxmS290YBuUVD6u
	0v4dRZQKB4MZZsAs7k5xblua1oFvc6hFlVfGcz6XPX0SX94+LXgMS+TmiRMGSo67sNgSzhXjBaXNF
	CwzQTwuEawPL5VG//GgiqNdBlCezGaew2CLh8S/e9DRpSDFGTB0UwtShswIStI2iYM2kCMLwfXG9D
	62/AAoTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tawvk-0000000CUTW-3B60;
	Thu, 23 Jan 2025 13:07:32 +0000
Received: from mail-qt1-f170.google.com ([209.85.160.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tawuS-0000000CUQZ-2WGq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 13:06:14 +0000
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4678cd314b6so8139811cf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 05:06:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737637570; x=1738242370;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qiygrgYsO739skaoPESqIEGzSo4IJJ9SbsxwNuEpwL0=;
        b=WWHLqzboUTgU8zYkYM4yXtGMBQDB9lAKPzxOV9mzd1QGX4WtfLZNo5ieXfkbgzINi8
         pDfNzDb5IIk/aHuYT08r/bQicK33STyfAmxmU1UpLMjWM9fJpMEsGGOKgfUdgvPNSJA5
         JTEUIAZLaJzH2GTE/m9J/XucVJOqpXDxysHnn++thSAjoLVrEDQOVmBwCVX2bxqArniH
         qEkWLTyPKg24r7OQZSk8UsqZVkjagUpVJJFzIqVuiQFzPKgbDsMrqESeHQAk0dX0HG8R
         w9z8kI6p0WGHWm65zkDIQLO8NazTA32XVK9PW9zpMYEhX8SyjCTkJbRYTSkV4iZoEfSb
         X14g==
X-Forwarded-Encrypted: i=1; AJvYcCXqxBQNec1eRztvc0iMOaFm83/6yPPw+bVvUzQaDj1dWlwlMeiiZFQMXB2tHdSOxVI7ywVuZWaieUxpqlNb5erg@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0hBI6SdjzpDq/iVYV7zo4+59OulrlnKkTXZl1L63LlwVEgusu
	3cek2zk0/2lFhz4EnFO/Qo4xGrbM0cLT3kOuIVVA5obtA2zTkPwCEUaITv/2
X-Gm-Gg: ASbGnctnIOFFKXAlRTAuqkPdolzEr6iAf8eNCSBDzKZrOgc2e0Bp/R+hqJ5ERUI7ahB
	xX9s/q1Y9yfJosWmrES8wb+wvOnZy6jhFyG+9fQGRuRJOXp6Uy8fE0/JSnFYCMXrO/syk08WcLk
	3exWrJsqsVHJuerP1OY2OyUX3eT4lDVv2aieG1+/sU0DoO3KpaOcQCo8VipexjR/UjB7MasCJrS
	fApRL+6aX2nl7mvK1hmA0RP1+y9hCH6IQwxvmlvg9rCtLfUhcP6sqixdkF+XA6+CSq+4b418g5q
	Nh+Jeh1UaoiyCF6JomVcYO3u/uDL/N8y0JBAq5tWMBm2vfs=
X-Google-Smtp-Source: AGHT+IG1NDGk48klJ6dA4LJvVJ/f8ecdvG0tUZ1Z3u8EgS6S+DHuG1kE9AwlHpDVxQ/S/pp5gHX4IQ==
X-Received: by 2002:a05:622a:211:b0:466:b1fb:3028 with SMTP id d75a77b69052e-46e12ad56c6mr414633611cf.4.1737637569792;
        Thu, 23 Jan 2025 05:06:09 -0800 (PST)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com. [209.85.160.176])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e102ec205sm74239491cf.11.2025.01.23.05.06.09
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 05:06:09 -0800 (PST)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-467a6781bc8so7406411cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 05:06:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXMtRE1ccb8Mfuc7o2mTzx958TReVHepw2Hd6hkgOUTRO0/5FNYG3M/wSu2f1B9I8db7Zl8IKLQ5tW1rhJ2nPdB@lists.infradead.org
X-Received: by 2002:a05:622a:211:b0:466:b1fb:3028 with SMTP id
 d75a77b69052e-46e12ad56c6mr414633151cf.4.1737637569250; Thu, 23 Jan 2025
 05:06:09 -0800 (PST)
MIME-Version: 1.0
References: <20250116153204.615736-1-niklas.soderlund+renesas@ragnatech.se>
In-Reply-To: <20250116153204.615736-1-niklas.soderlund+renesas@ragnatech.se>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Jan 2025 14:05:57 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVVZghXmA3MrmM+L=fta9Rf5tjGhrSzXFH693wKkaKBKg@mail.gmail.com>
X-Gm-Features: AWEUYZkhnBAcJOrt0LZ4LxtesBsvqH4lZK5bBapycwiiMvp-1FtOceeF8qtL8Og
Message-ID: <CAMuHMdVVZghXmA3MrmM+L=fta9Rf5tjGhrSzXFH693wKkaKBKg@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: defconfig: Supplement DTB with ATAG information
To: =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Russell King <linux@armlinux.org.uk>, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_050612_640781_B6918398 
X-CRM114-Status: GOOD (  17.23  )
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

Hi Niklas,

Thanks for your patch!

On Thu, Jan 16, 2025 at 4:33=E2=80=AFPM Niklas S=C3=B6derlund
<niklas.soderlund+renesas@ragnatech.se> wrote:
> Enable CONFIG_ARM_ATAG_DTB_COMPAT to allow u-boot to override kernel
> command line from DTB using the bootargs argument. This is needed at
> lest on H1 Marzen to control the command line from u-boot.

least

>
> Signed-off-by: Niklas S=C3=B6derlund <niklas.soderlund+renesas@ragnatech.=
se>

Thanks, this indeed makes shmobile_defconfig boot on my old Marzen.
Unfortunately this change is not sufficient for my old Lager (I guess
I should upgrade U-Boot instead ;-)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v6.15.

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

