Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 499F7CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 12:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cw9JnxKH2XB78dT3C90Gx+S2oqjKdyT1Kqbq/lUTLGQ=; b=oKfJS8nChu5hUupXC/ZynODXiI
	w6LFQxBoINGVq+1GcWtZCUzhMHTsNqnj3PLlJYQc24/S28t4yRyQA2nZ1ST6uCdtDgTi6iqhV5w4s
	kN8GtLFQ848vKIPQwGHi1G2cziemv7g0wVTro6h2l5Lt2zyWvRZXkrG7GOmh3QmgjTYqXY6Le6AfV
	uZzPlEDF1rSW6GflQfYDOe8RYEy47xEa5pPQpciHTeHCxWEYhgg3UF8ByVUhFG0N+TBEZj7hPZ9Ad
	Kdo0IrrjiilcrAV/Sw9OQ1HFDAR/AhDYVOlQ5hDRXLjaIus/Sy9GvJz6pKWIohMtaWi9/sCJC2pyr
	tlgbZLmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIQGA-00000005rrb-0oac;
	Sun, 18 Oct 2026 12:45:06 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIQG7-00000005rqM-368d
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 12:45:04 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a1ddc7c9beso4134475e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 05:45:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792327501; x=1792932301; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cw9JnxKH2XB78dT3C90Gx+S2oqjKdyT1Kqbq/lUTLGQ=;
        b=nMKUEcOt6bczLKztuzYHKcDtaM2a4lvcuV2XsowrwVwY1D0mtvsjVFnmqt+HxXYbgX
         DIlqOQc60Fv+m+LyFDHvxI6WM9H3V1/o1xr+eZ6WCS4Pig3Nzzz4XJ077NkE9N2BmKRv
         2tujPU9AXCw+mCdeZyRND+5ExCa1mUTwB+Z/K1MoQOvtwXiPkPDeAJThVJpWdI53BEE+
         SyKxcrAyveQ4aXuNwRyEZgxjG9MPTBv5HGTMVYFcFqGRGhRw1Vf0Y/3PKTUyGdSMWh0I
         s5eEPBh88CJC6nVHQFXvYc2e6lhDDatHhLv9X5y4nhY7dutTAYvNlQLWbXjRkRa5rI4D
         HpwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792327501; x=1792932301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cw9JnxKH2XB78dT3C90Gx+S2oqjKdyT1Kqbq/lUTLGQ=;
        b=mtAu0MH4592f6yYEkH9yfUSpU3WmbxcEowDzhMC2bJ3Fcuzxp6AZrkKi0jgDtcmuzw
         Dnrg2hNo/XkwcZ76zaCL96Ac5jfwmfTPE7D6czwD1qgZopEUnHh6WdUVMTHY3I5leElr
         KadJ8KmGCP2mFX420hGEhoIAy71OWx63Z8m/DRo2cPxkT1KExs5pCCzP3T7q4qjjTL0T
         t0TU5itlcsUDafJjJhGTIMp4oOMGKO/kGBBrJntzOGX1MRAb+m83AfQnv1YBVKlizZz5
         SIHXZ2snUDyVYYjl7rNX3lOzt+2ixqeuGaMng+XC3sGvqokOOqjKO6q37TGf98Viecki
         PP/A==
X-Forwarded-Encrypted: i=1; AKwUvBxEki+hvtmXiimF5U2VvdpXRExVZwp7nfmrpr7QMCYmsxd6BZ0U+4kuPsAsnhItB04J/fyq8v3rk8KoMKh0TzSH@lists.infradead.org
X-Gm-Message-State: AFq9FYLCab0on23Kw1vCmNVv0kt8RvqsSHnvRW1zlTewNkdW7tk1XGIb
	3JRimsqEXEDHg/+d/Y0im1SLGaoiZUxs5eWqvszWz7jNZM+DdbVH4t4l
X-Gm-Gg: AYBFou2pPTNz3kj7laQs8XB6F+FYBPo1R8kvwQ6/kVdcH4FZUJAFlNHpaGVOeHNm7Dk
	bJFh0FvciREi7t13CtfwVe5VOSux9N1Gc47cnxRBIQdKV7ZxBn6REuuxnfE/fT4xAxpJUEkDcCG
	abiuJSBgkVcbCDDYEIvOErlG2bre1DQ0sMWtSFJGRgI2WDZNWUNesDkJwngs2b40qFUJ50tLZHX
	bmk9/YSB7R4YZjuY6d/7CDb2X/UhwgsgCay1W1Sx3UgHU+9Lp65ZuvLI5dMosZhQXqTLDw/UWGr
	GLz5ojMPNiNb+eDVvpQzUnaSJYktcWamh/Dnfg2hbVAJUapX9IRPz0MMsj3Nj93hSFQ1C6c3Frv
	1SUOdvlxkyQfU++4tVWT90tbsWpYO86krogm56m4KdgBrcyeZw2tpoddowoebXPY+FkDO46nw3j
	ELE2g8kXfbAlXogaaSe0vhSe7/Y3K2rpiqpEGt2zv5VMeb9H4g7lJ3+qw5Wr+aoPwrQVCSYU+sJ
	OPRQR/baUuyiazrkyyhKs/Xo0RV2DFY8vvcSs9Ed5Gc8yVqEismprvj9MU7qSs2Opb8+BNDoDmr
	O9h2u3i2JMOIfQ+oZBzrdiTSWweZJ5RraovGTi0pTJplB/208JyDAz35rSj3tHmMrRGmJeWwW0l
	h1WILVabbxw2+/shuhdjkiS4=
X-Received: by 2002:a05:600c:4e03:b0:49c:fa20:cbfc with SMTP id 5b1f17b1804b1-4a1d75ffbdamr115371105e9.19.1792327501266;
        Sun, 18 Oct 2026 05:45:01 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a00-1028-8388-a84e-318a-f58b-5e43-a2b9.ipv6.o2.cz. [2a00:1028:8388:a84e:318a:f58b:5e43:a2b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd500e75sm16386408f8f.42.2026.10.18.05.45.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 18 Oct 2026 05:45:00 -0700 (PDT)
From: Josef Schlehofer <pepe.schlehofer@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] ARM: dts: samsung: Add support for Hardkernel ODROID-U2
Date: Sun, 18 Oct 2026 14:44:57 +0200
Message-ID: <20261018124459.3026-1-pepe.schlehofer@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_054503_847525_0F006905 
X-CRM114-Status: GOOD (  12.40  )
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

This series introduces device tree support for Hardkernel's ODROID-U2
single board computer, based on the Samsung Exynos4412 Prime SoC.

ODROID-U2 is the predecessor of ODROID-U3 and shares most of its hardware
design (2 GB LPDDR2 RAM, LAN9730 10/100 Ethernet on HSIC0, USB3503A hub
on HSIC1, MAX98090 audio codec with headphone jack and on-board MEMS DMIC,
MAX77686 PMIC, PWM-controlled cooling fan header, blue heartbeat LED).

Key differences from ODROID-U3:
- The micro-USB (DWC2 / hsotg) port does not have a VBUS supply switch,
  so it operates only in peripheral mode (dr_mode = "peripheral").
- The 3.5 mm jack is headphone only, and the board features an on-board
  MEMS digital microphone (DMIC) rather than an analog mic input.
- There is no expansion header with SPI.

Hardware verification was performed on a physical ODROID-U2 board running
Linux 6.12:
- DWC2 USB: verified in peripheral mode via /sys/class/udc and dmesg.
- Ethernet: SMSC LAN9730 detected on HSIC0, link up at 100 Mbps Full-Duplex.
- Storage: microSD (mmcblk2) detected and functional. eMMC was not tested,
  as no eMMC module was available.
- Thermal: /sys/class/thermal/cooling_device0/type shows pwm-fan (no fan
  was attached).
- Audio:
  * Stereo headphone playback verified with speaker-test and aplay.
  * On-board digital MEMS microphone (DMIC) recording verified with:
      amixer -c OdroidU2 cset name='DMIC Mux' DMIC
      arecord -D hw:OdroidU2,0 -f S16_LE -r 48000 -c 2 -d 5 /tmp/dmic.wav
      aplay -D hw:OdroidU2,0 /tmp/dmic.wav
    Audio routing includes "Mixer DAI RX", "HiFi Capture" connecting the
    MAX98090 codec capture to the Exynos I2S controller.
- LED: blue:heartbeat blinking with heartbeat trigger.

Josef Schlehofer (2):
  dt-bindings: arm: samsung: Add Hardkernel ODROID-U2
  ARM: dts: samsung: Add Hardkernel ODROID-U2

 .../bindings/arm/samsung/samsung-boards.yaml  |   1 +
 arch/arm/boot/dts/samsung/Makefile            |   1 +
 .../dts/samsung/exynos4412-odroid-common.dtsi |   6 +-
 .../boot/dts/samsung/exynos4412-odroidu2.dts  | 139 ++++++++++++++++++
 4 files changed, 144 insertions(+), 3 deletions(-)
 create mode 100644 arch/arm/boot/dts/samsung/exynos4412-odroidu2.dts


base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.54.0 (Apple Git-157)


