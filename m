Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC2FDCD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 11:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMcR10Zl9ktI8NftnKtGb1nGlHMkBHUqYLOsT6sT/4k=; b=ZDnAp2fC87FnyniYan0g/v/Jqv
	bnbuxUsEJ8ypkRIiDWadluCKRE5ko1Wgolf7odI0laDInvMDLiDEfEj7cwqz9t2d4G7LAIsoZhrlg
	v4UO7st/e8L7ncRrxejLB9NjmoQopBXll1/2j2ZPn7YUa3PWx9Zuyou2xejH0O6GBWLpIjQicLk2u
	5qgdMhtu1Nf9TrLfZZ2MsowPTJAl74zsx1bbuvlAeEzmx1fJl1gOCfbgsa+FUrey80XBdefVpIB7k
	pPdT5DvutCGdaofsQz5KiE4IRCYJ4rNU/8Bw0pWQ0oBrzxrwCCg7t+H44Cvah8MVMlMl5gXWshlQp
	8tTtVmyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYM7l-0000000CDSw-31tC;
	Sat, 13 Jun 2026 11:02:01 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYM7i-0000000CDSY-1eix
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 11:01:59 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-46013161068so850726f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 13 Jun 2026 04:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781348516; x=1781953316; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pMcR10Zl9ktI8NftnKtGb1nGlHMkBHUqYLOsT6sT/4k=;
        b=lY1IPleV46v2lS77w/Yhq67N2U5hfhBIaz76DApgE4avFRND/OA3T9t+MhgHtuH3PO
         +WAOLcT/q5gzndqO2I2vZhubG6RQYYNgvR7I0BFeUvNNVyvDL9oNhJoL2bPGxlsnWnv9
         EVPDPdkwDP3J60uPACNnf2DqH1Ow+vEUR5GJvhACUlfHtkmKciwKbY9iKTAPRylsPmAo
         M/zGiCE9niOZlUlUi6pBRX9WXtrhiSfRqoPtFWrvu7D2anDFwbpvoqLia7vDSsyvGyg8
         S/Mh4W16729rOE56AYKV5hmKyyMUb0VAjb8B9CNQENdj+9k9fF5SP5PogEj2zIipiloO
         a3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781348516; x=1781953316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pMcR10Zl9ktI8NftnKtGb1nGlHMkBHUqYLOsT6sT/4k=;
        b=NuHfo2sA9s/4PaERJAdrCGofx51Bz3t8i40smtNtGl+4WXLhtN4yQN6P6VS6lnmP4K
         STDbneA8jbwtC9udbeLflPHb3aZE2z9Sms9Fc8FGxOkv+hPF8BcH/yNkH8PJilX5rmcB
         RU4WJaEX0aXgNiyUhHXDNzthff6Z9om36lvq05VHl4eKcxG/LZtZqlJFO2fsq6ddWMiJ
         u7BKEKIhC+o7EJhfDV5ci7vwTvCjYHg9pBsCwXhor+TDvZZD14HARZK8IX1bFOVGobk/
         9SyqRUC0E8Up2xQPKcbI8b1b61C3PvIo7cH3ThF5uIenK0m6lja5F9oMN1+yJQBvlY0Y
         2jXA==
X-Gm-Message-State: AOJu0YweJp353rVYbqaYc+ySB4ihWApT9j+VQorqXtq7PeWN4RKmUH3h
	kYYeXzKjxFZeaxbgHnvMv7/gFrLGwtmcABawruX85JzFmEHUKJavPbUEDs/UO6F3
X-Gm-Gg: Acq92OF+2qYJV9ReTCvDg1ECVwGC2oUHaNwVHhuQqtrHhT8F6UHGTpag/F4s4x5wT5X
	6ri6MwDTEuXyGDNP31NkXu8KsMZ2cNM653J+U2U/GrIsNSbsS6qNLcsLEl/7FYIWWJNcN5YC9nZ
	YuIQ9bOyT/RXMa8zdbtsu+2qST6xsO++CzCE+lBklTHNo9SSyZSueyatFlj6nPc0K0JouQ5ElD4
	lsXOmNR0fBW1YXXI7lJwVGrZV5oUcEZ/G2AJStBC2wHSuVxGb/R5K0Ga/qpajD4FDhor3+SBeFg
	q2487piPI6xvvocvUPjIEx0EitHHIiHz20eGSfRXp5iBb3YCiccB5MIF182zvR3yhN+C8nBwUl/
	Ry6hixw2xXC3Zd+N/aifwtDvxKqqiE4arN7ABJjfSuN6Z7fKEx4H+WDxCH4qEZYkZE9j/Ea3aLL
	jlyPHkI8vmM3OmnanKlC2DQhJEPV1tntOiLGc7hVOIXegL
X-Received: by 2002:a05:6000:188e:b0:45e:f271:5019 with SMTP id ffacd0b85a97d-4606db8c6fbmr9211591f8f.14.1781348516083;
        Sat, 13 Jun 2026 04:01:56 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm14930828f8f.1.2026.06.13.04.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 04:01:55 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Hans de Goede <hansg@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Andre Przywara <andre.przywara@arm.com>, Jun Yan <jerrysteve1101@gmail.com>,
 Lukas Schmid <lukas.schmid@netcube.li>,
 =?UTF-8?B?Si4gTmV1c2Now6RmZXI=?= <j.ne@posteo.net>,
 Eric Biggers <ebiggers@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Luca Weiss <luca@lucaweiss.eu>, Sven Peter <sven@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-input@vger.kernel.org
Subject: Re: [PATCH v4 7/7] arm64: dts: allwinner: A133: add support for Baijie Helper
 A133 board
Date: Sat, 13 Jun 2026 13:01:53 +0200
Message-ID: <rVKu3PRHTqCaxGV5Fc8kHQ@gmail.com>
In-Reply-To: <20260605070923.3045073-8-alexander.sverdlin@gmail.com>
References: <20260605070923.3045073-1-alexander.sverdlin@gmail.com>
 <20260605070923.3045073-8-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_040158_451162_ED6DB31C 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

Dne petek, 5. junij 2026 ob 09:09:21 Srednjeevropski poletni =C4=8Das je Al=
exander Sverdlin napisal(a):
> Baijie Helper A133 board is a development board around Baijie A133 Core
> SBC. Features:
>=20
> - 1/2/4GiB LPDDR4 DRAM
> - 8/16/32GiB eMMC
> - AXP707 PMIC
> - USB-C OTG port in peripheral mode (via onboard hub)
> - 2 USB 2.0 ports
> - MicroSD slot and on-board eMMC module
> - Gigabit Ethernet
> - Bluetooth
> - WiFi
>=20
> Add initial support for both the Helper and Core boards, including UART,
> PMU, eMMC, USB, Ethernet, LRADC-connected buttons.
>=20
> UART1 can only be used for Bluetooth module, but BT-WiFi combo Allwinner
> AW869A chip has no mainline driver currently.
>=20
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>

Schema validation passes, so:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



