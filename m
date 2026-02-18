Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26285E9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 15:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BM49FiMQXgN+7Fdf3v/nHey34rwS+KTTASqzDHMee7U=; b=Z3ALN/hYEcP42Q/znhqOhA6I0M
	yabq4nYLKCZTtVRkoeD5S0Ju8+BmYCNvZK+ZCIqz1YDOpIBbFF2GANH3ckUjbfVRa2rpSafoYMEv0
	n/hbbVtWZTgwLtl7/Wif0wZoFGwjF8rTy//OKCCeLvfwD5ZaZgNKjwgEL1dj7kIotasiEP3dzuRzn
	NK3fIpwwbd8VWleQWPoRWwfeNyPKtF9rbOtwZUa7dxztZAXmToR3zaHy9qqGuWCWOnkb3EJaa/UEu
	Ue8vrHFpmLtxWnRHyGIc6QsM9/VNl6Cdb6k8Tn+FxWi442h4Cxwqhb/2YZWILxNR+D38qy2hw12nR
	sCQ2cGOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsj22-00000009zDT-2cxs;
	Wed, 18 Feb 2026 15:00:02 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsj1x-00000009zAM-1D3K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 15:00:00 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4807068eacbso42334185e9.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 06:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771426795; x=1772031595; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BM49FiMQXgN+7Fdf3v/nHey34rwS+KTTASqzDHMee7U=;
        b=QTAWAci3qvYT/4yPVezZK+PKk5zha1uQweoG4x1Y3xdPvGHj0XOOuX27xIG4aa4Ha1
         iCG+0/KpgUksX45gHL4xvVKaBFlXG64jkRdZrq9tipofpYd3r4ueqgGPL8jg06flEx1X
         5WLgdTwHfBeeZ8ufPQTgGTWpPeCzSbiI7chIjTZtxb8ybrJgYdG+ZIUT5RxGqmasU7nn
         mwe5stTzN4T8wE7bjkDrkJZCMpuBvuncVuHcJ3Nvq60PrLbdLWVCwmWeJQB/r2mzXisw
         7vHy9SVEZ9sAVtsFPElmcjt2rhxnxvLwBUbs8WSxJAY3qbYtvp9Acafjbl8lfmN0DExz
         G4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771426795; x=1772031595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BM49FiMQXgN+7Fdf3v/nHey34rwS+KTTASqzDHMee7U=;
        b=svgPwAs5F+41OdMMXID2i92nUhZfMdSqD6lyL1mO0mG0S6ZKjIeq0jE4wn7KjD5mPJ
         LNRu8zMeAvZayEAwMy4yIwfbRqxs5lQC8itAuaHi2Pg5orW9hwXRHjXKrjwIsnTePvgg
         ho0nbZKFtnt8cf5cySMfkwJaMYLx96PvE9SfdQjI6TvkxRCV7L4H2Cz3/OZJDP0BphnX
         YnpHAKuVc+yFgm1EXvKMxXAbI9yQB2ipL5JteByvL+drv3DoAhh5QFN70dqbph9QkNV6
         72b/EwZTnWcstdkeyfyKDwXFhVjfGqjtmXrkUzqon43Nl7kblvkYJ7Egy6zW06BlItHd
         oLDg==
X-Forwarded-Encrypted: i=1; AJvYcCUAAAo5wXB4LarXwEmKGSSO3jwCVx9fmRFZSZNm7EcdfiuHrxcr9OH0AGlc/qv/sIp16ZotsWpVl693ldZ60KjU@lists.infradead.org
X-Gm-Message-State: AOJu0YxwXh30Rv88OaWhDeU5D9ZAjG8t3VMMrFGzu/JaairERSQlDwd9
	OU7yF44n5ZMoEr6VUjiqtu0p77EQiocdMxt8apAt8EncOC9unw6sX7+L
X-Gm-Gg: AZuq6aJYaJDKNCGbbL+RqoCpA7HRhdpCv8rTOU6/dPCZdgf0fUhR8R5Mlg3s0Dc2BIf
	x2GQ/+cQaKLrXuofQTEEwMbi0ooYyUTUlRUDUGqNIcCw38CE0LBKdTpFeGWuw2YC5r7gyb8A6FK
	Hu1qhX9E2NPPUdkhgtOiUfMoZRKxJ9O/VPXaB1rSqs+VZHVVkSpM9b8jEifMymyqq+MrBa1CrbA
	aw40TvKC5EgKcJONv0xIclVXLPA+7eFfH+iNjZ1g9JOePOlqTqfuQ6uG/ij7jCyVB38x20zLaqQ
	gBNSrJpp721hAme/aZPl57dCNa1kgRJNYFXuYw+6GdeY/q2MsHPtOinXlspb6/xu2PuMXJbjig4
	fQp6Cfazyh8qtuMVL3ZIsRO46Ho8WkVV/IpJar6RjwCW4N+tKpVsfas+fASR1DN9m37QVxh4CTp
	Q2DoOdndrNyNqk8L1Mi9W7o2VWnfDZ1FNDzO4d9rzbkoX8kEbCrvX7HfrCgfZGowTkJk096ELS0
	3bdmWL6Fk5Rq8k10yAZWOdSx1Dc7MOPaAoLhtk2m1JuPmQ=
X-Received: by 2002:a05:600c:348a:b0:46f:d682:3c3d with SMTP id 5b1f17b1804b1-48398a52fe5mr34213645e9.13.1771426795105;
        Wed, 18 Feb 2026 06:59:55 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483970ce7d2sm48744945e9.0.2026.02.18.06.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 06:59:54 -0800 (PST)
Date: Wed, 18 Feb 2026 15:59:51 +0100
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v1 03/11] arm64: dts: freescale: imx8mm-var-som: Update
 FEC support with MaxLinear PHY
Message-ID: <aZXT5wMGQgMKHCXQ@Lord-Beerus.station>
References: <cover.1771353301.git.stefano.r@variscite.com>
 <3b984b93a43a07bc9c4f6414a08a3a0f45daaaa8.1771353301.git.stefano.r@variscite.com>
 <31f30651-7c99-42cb-9e27-e4806529d137@lunn.ch>
 <aZTCGH1rKWdvYg5-@Lord-Beerus.station>
 <fceeda41-66cc-4bb2-ab53-d4b1ec25348a@lunn.ch>
 <aZV_c0lmBwjOI_Ep@Lord-Beerus.station>
 <fac81a12-92c9-4e29-96ca-473c18fca675@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fac81a12-92c9-4e29-96ca-473c18fca675@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_065957_373105_50686B95 
X-CRM114-Status: GOOD (  30.97  )
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

Hi Andrew,

On Wed, Feb 18, 2026 at 02:23:40PM +0100, Andrew Lunn wrote:
> On Wed, Feb 18, 2026 at 09:59:31AM +0100, Stefano Radaelli wrote:
> > Hi Andrew,
> > 
> > On Tue, Feb 17, 2026 at 09:43:16PM +0100, Andrew Lunn wrote:
> > > 
> > > And here you loose me. RGMII is between the MAC and the PHY. The PHY
> > > is on the SOM, so there is no need for RGMII to leave the SOM.
> > > 
> > > MDIO is can understand going to the carrier, because there can be
> > > other devices on the bus, such as an Ethernet switch.
> > > 
> > > You say the LEDs are not on the SOM. So they should not be listed in
> > > the .dtsi file for the SOM. It could be the RJ45 is a cheap one,
> > > without LEDs. The colours will depend on the RJ45 socket. It could be
> > > a single LED is connected to the front panel, which is typical of STB
> > > etc. So the LEDs are a board property, not a SOM property.
> > > 
> > > > > >   Two LEDs are defined to match the VAR-SOM carrier design:
> > > > > >     * LED@0: Yellow, netdev trigger.
> > > > > >     * LED@1: Green, netdev trigger.
> > > > > 
> > > > > Where are the LEDs? You say "carrier design", so are they on the
> > > > > carrier? The DT properties should then be in the .dts file for the
> > > > > carrier.
> > > > >
> > > > 
> > > > The LED signals are driven directly by the PHY and originate on the SOM.
> > > > They are exposed on the SOM connector and are typically routed straight
> > > > to the RJ45 integrated LEDs on the carrier.
> > > 
> > > The problem here is 'typically', not absolutely required, otherwise
> > > the magic smoke will escape making the box useless.
> > > 
> > 
> > You are right sorry for the confusion: RGMII is internal between the MAC
> > and the PHY and does not leave the SOM. What is exposed on the SOM
> > connector are the MDI pairs towards the magnetics/RJ45 and the PHY LED
> > output signals.
> 
> O.K, that is what i expected.
> 
> > Given that the actual LEDs are implemented on the carrier side (RJ45
> > with integrated LEDs, pull-ups and LED supply), would you prefer that
> > the LED description is moved out of the SOM .dtsi and into the carrier
> > .dts?
> 
> Yes please.
> 
> > My idea would be to keep the Ethernet controller/PHY node fully
> > described in the SOM .dtsi (since the PHY is on-module), and add only
> > the LED subnode/definition in the carrier .dts where the LEDs are
> > actually present.
> 
> Yes. That is good.
> 
> Thanks
>      Andrew


I will send the v2 with led descriptions in Symphony dts instead of SOM
dtsi.

Thank you again,

Best Regards,
Stefano

