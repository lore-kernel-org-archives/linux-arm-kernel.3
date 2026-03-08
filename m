Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E95F55126
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 08:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z8aMocQM9u6X2gsio5xSbmOAH1sSfPIdUgMQJD6cnQY=; b=I9GaureV8Q2M/g3JTnY+PoVADY
	vtCJyUyLLSfLWqjNCDMG5x+iGDtb5tARb7bOPniev7Ku1Rq0tTf3PNnoKQudy4EamYRBoEluZwkcZ
	RLF2NZaiwJOnizSSzPbWnv9IwoaCMlLrIl49oDNw0O+fE/VEQ+MycVQh7b3VWv3rpP0+kNquE0h9X
	poR/ftZk1pxdYm4wZOci/MKB86zabqs9fnH5/CcQ657mHpSgqMq4a6ptlWmSADzJkzckkh+GSB6Oj
	CUCJDZyHYJpAEsiCoOhLySLr+pFEECKBltZr496YmVJ47gu/jxFly8r+ciI2T6AqBoZ+lJJWGhD+2
	/Z/Z/ymw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz9Pq-00000005oAR-0vPU;
	Sun, 08 Mar 2026 08:23:10 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vz9Pm-00000005o9z-1OAC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 08:23:08 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-439b2965d4bso5994409f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Mar 2026 00:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772958183; x=1773562983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z8aMocQM9u6X2gsio5xSbmOAH1sSfPIdUgMQJD6cnQY=;
        b=bbJahniQFT9+z0IZ/YUSR72aBao/oLRRYRlenOe33CCj1Itmedi2PrTO4k0peJOVj7
         sM+0kr8NAt0T+AGUusYy9YU/Pche//o/MZIgvsXa/eU8NKc102p6szB2jQrg5hbfproZ
         zT2HWhUlchV2CWyv9Z+ZCaVeXvbZpanH1O8ocn/RGc0eSd14Ky6qMhitHG7GHW/RdWph
         tH8NVpqB1ebL/cBu78A657uKsxOX7Y7vmF3O4XKebVVYshElyZ7zRIObRQe16kW4dXWk
         +A4cLlOX5yMFnZEiaEc5nZZyfKHehkAm87DvrEBfe7bYPKCI/Ex2tPOv2BfNQ4FVqlZD
         kYsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772958183; x=1773562983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z8aMocQM9u6X2gsio5xSbmOAH1sSfPIdUgMQJD6cnQY=;
        b=ldgSNIP04No7FoOCfVm/nekgFrPL0rFi/As3pi8X53RMHXVo8li+tJoXxkoIiFRAPg
         z23lGPXfU1J5bj3FhCduK5iiCaTz/MPmx4bIV6hFV+t67EmaIFZn2rER+xXJwxCWjuQR
         jl/VaaO7Hyowv1xb9LG9lrSLqcu/HvaqnATLAkrCtjyWHJnNZGg8Dze2YT+rs5v/8g92
         +iq7y6kiIM19xr/DKCA7UqGFczDrmNrNR2aqBbHlPy9Pmczje3V3/sfI+Ed3K+WJdWbX
         SovpNgMq4gJTiGAAfIYYFVXyaD45fXziWNKdqmAWn03FolJVi7C3x4lo6qrsApCQmJjE
         E1BQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpWShYQuCXLXcqbHb95ZXfohR0a5its6f5vGwTjdb4Ela21ZQkuhRFAjmaIxmACCWJTM6Y5wbYPLwgDdGo1NNc@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5R60RZiNT0sgm3u1MLlsEEA5KCu0OHOgimhF8XDt5/qFQxw2E
	SS98iWLkCXA5Hl+ZGZfiYvDClr8Bw5QiYT7ji9lBMe9CKixFhEivavd+
X-Gm-Gg: ATEYQzyaX4wSTcUE3VzIA/Wjvxy58TQ5nFWdYiduEYGEFtD8TngjF+M2CDgVn19bWr8
	jNDK7G8RRBbnkGjzg/9kBVb58xglh/VIWftDsw73Z2Q+YhFQJ8I6kfQdL/MizO57bsuuKdAI90z
	HFIhOJbh0VHpaKlrpIpexMcKtLCDZQbdEQTeWVIY9ZPhn3ZaF24w+GmSN7/eIDQUyqeCzpW+KvP
	g7SmMewwuFn4Lz2H09RvFSpCG0rW/OrTsmJ9ZNHrHTscb/MLqrOSKWAWW67IT8uja9iY+u5hfnW
	LtuqdoOrbb4h5Ddndxugtl7w9T+2nGiZ27KTDPZvbE/BmnFhbgk2K77QoC1acF0Uvz6eioaKXOb
	WVLAVfc071PRbd12bxphOD2v310uIdEbTwdXHNa5guFF2mh4ijbXgvlISDZ0rP8PCXZHntni3/w
	drQrB4nJwnIWA4MDJtk3nXyeLKSQ9H7nsCkDmKJ5OL9m7P98KqrAT8+KdJwSANtJmGU4CAzy4On
	LsYhw==
X-Received: by 2002:a05:6000:609:b0:439:cb10:dfcd with SMTP id ffacd0b85a97d-439da67982fmr12882158f8f.39.1772958182927;
        Sun, 08 Mar 2026 00:23:02 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-12-163.dynamic.telemach.net. [86.58.12.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae2bdf8sm16891038f8f.25.2026.03.08.00.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 00:23:02 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>,
 Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Michal Piekos <michal.piekos@mmpsystems.pl>
Subject: Re: [PATCH 0/2] arm64: dts: allwinner: fix Orange Pi Zero 3 PMIC interrupt
 routing
Date: Sun, 08 Mar 2026 09:23:01 +0100
Message-ID: <3404622.44csPzL39Z@jernej-laptop>
In-Reply-To: <20260308-rc2-boot-hang-v1-0-d792d1a78dfd@mmpsystems.pl>
References: <20260308-rc2-boot-hang-v1-0-d792d1a78dfd@mmpsystems.pl>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_002307_158213_B6363777 
X-CRM114-Status: GOOD (  18.94  )
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

Hi Michal,

Dne nedelja, 8. marec 2026 ob 06:16:50 Srednjeevropski standardni =C4=8Das =
je Michal Piekos napisal(a):
> This fixes a kernel hang during boot on the Orange Pi Zero 3 caused by
> incorrect interrupt routing for the AXP313A PMIC.
>=20
> The PMIC interrupt on is connected to PL bank GPIO handled by the R_PIO
> controller. However current dts routes the interrupts to PIO controller.
> This causes the kernel to select wrong pinctrl instance when configuring
> the interrupt which leads to invalid register access and a kernel hang
> during boot.

Where did you get that info? Publicly available schematic clearly shows
PMIC interrupt pin being connected to PC9. Additionally, R_PIO controller
on H616 is very basic and has only pins PL0 and PL1, which are used for
PMIC communication already. Neither of those pins is interrupt capable.

>=20
> The problem existed previously but became visible after the commit
> 01e10d0272b9 (pinctrl: sunxi: Implement gpiochip::get_direction()),
> which causes gpiolib to call the gpiochip::get_direction() callback
> during interrupt setup.

I think proposed solution just bypasses the problem, not actually fixes
it. Can you share kernel crash report?

Sidenote: Tested-by: tag doesn't have any value if you're also the author
of the patch. It's already implied that you tested your solution/improvemen=
ts.

Best regards,
Jernej

>=20
> Patch 1 declares R_PIO node as interrupt controller so it can be used as
> interrupt parrent.
>=20
> Patch 2 fixes the board device tree by routing the interrupt to R_PIO
>=20
> ---
> Michal Piekos (2):
>       arm64: dts: allwinner: h616: declare r_pio as interrupt controller
>       arm64: dts: allwinner: orangepi-zero3: fix axp313 interrupt parrent
>=20
>  arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi               | 2 ++
>  arch/arm64/boot/dts/allwinner/sun50i-h618-orangepi-zero3.dts | 2 +-
>  2 files changed, 3 insertions(+), 1 deletion(-)
> ---
> base-commit: 4ae12d8bd9a830799db335ee661d6cbc6597f838
> change-id: 20260308-rc2-boot-hang-269e8546635b
>=20
> Best regards,
>=20





