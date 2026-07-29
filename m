Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BAC6C54FCD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 13:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vw1Uw662stFve8C9A4vfU5Hm7+9jYZ7QadKCZhiXKXs=; b=fp4UPjbDdr8dNDqZGzOLMqEFYy
	Ecb2AwlaDS5GsOJa4vFxXyvTDyHK76vEEPzgyOpubzGNijQaA2p5+hJDTZa5mR1/STkKxuLGlX3rs
	uro8StEGC3fvusnjGWmF6lIjj6QOmpaN3To552OAUtKYfgcsQ41l8yu4YFG6XfekFffxUkDSDAeRb
	fXg9+9YIvVDknk7fDLehXRJiWGq4fICR7PrMJL2cFiBWM1vvQp5S2UGYZvDRWhlqjOyJGGZuacetx
	iFkhfukdcb38Gnx3/ITBEmnfXFv1nliX59LfHvzjmlwPh8akNK93Cd65zRyg+afGB5UWgKIjrfOon
	xOOycf6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4MR-000000086Pd-3SJl;
	Wed, 29 Jul 2026 13:30:15 +0000
Received: from mail-oa1-x2b.google.com ([2001:4860:4864:20::2b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp4MP-000000086Nt-09oS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 13:30:15 +0000
Received: by mail-oa1-x2b.google.com with SMTP id 586e51a60fabf-446f87b6de1so462185fac.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jul 2026 06:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785331811; x=1785936611; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Vw1Uw662stFve8C9A4vfU5Hm7+9jYZ7QadKCZhiXKXs=;
        b=IavONC06vHtOFjJ26xVjpyyQ1RRnSaZkJWrz2knJC34jr4E066tAug8OWeEat/lsYu
         GO3FEFowknooHvJgj73ynTqrEW26EAC+SVpTMlgvg5WWXXcQSq29RjxaRsq+I3OCPRIN
         P6xrmn9CCbcVgHVR02RL2OagLj3V/IdlETQcw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785331811; x=1785936611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Vw1Uw662stFve8C9A4vfU5Hm7+9jYZ7QadKCZhiXKXs=;
        b=gARRdh5nczPTmewwRg3FULLFgz9ewWWpnVip1YnGtm6ZYJGC17T574S+tcSj1D2P5t
         Z9af/j1WvpOGBhWoQfZkybFhS8Aoc5IHPVDWq9Zx8+91Y4D2NvNGgmeC7w0TxKQLeihg
         CgiTy7/pAw+DxLkQ2f7mWG7lWqE/wo23sw9Q1h0aLMA5NPWEJja9CPEF2xy7l4T+p1Nd
         9Ia8yhFvSwi+FzjpdSu1pw3dGU+29uB11RTtBy57uaixuk/lzNorY4FbEslXGyvBKquf
         lzS1jsjN9YBuoeTkGbkgsTgxoNsOrePFPDCLgje6qIkQiWxfWqW0RasR9kcXko72oL3u
         T0vA==
X-Forwarded-Encrypted: i=1; AHgh+Rrm+sM2NHjqnJ9MFpKRzkafou5/o/1orYvln9mKzWY/Bv3Kb10QtZqDZm964DXoridYbwbEtXyToKBe1kpNVbyA@lists.infradead.org
X-Gm-Message-State: AOJu0YweIgR8fYf3CQLz6FRw93S2c1FRIPvje57nUAtAba4oThpRzPGl
	kpuUmShv4IPf1baGKD2JuXYQVbzW+4I8d7ZF++sxlfLVNv5R8fZOZOsJOfuz/R4LVw==
X-Gm-Gg: AR+sD10WxNd8sXamigX27gY33H1T05CFrRKz+KEvQezhNigZ8XTJKWDV2CqFvXMy5rp
	8d4Igk2t1ifmlb74quy4KnkE4A+M9isg+vTRc8wDHt2TejJH7Ox8oPL5io1ghvPBE/jXzJF0xVO
	S/mVpUdtK46AYLS/GOxFXkcAbjqfWFr1l5DZY+kHaw2G3ItPCrNEH3nV15UO3G/3oSih4/sb8/X
	MFUrN+YOsAkvzcDsi6jMP0okRlUPsg4JfIOuUCje3Kb2mC7dJiRigqAEx82364U5jep/06k1anM
	faiq7FPm+J/jzGOYHxGw84vcVedRL+UQkim3BBHYTrVDrigfQEzDhvbdn8C2r+J4BLNlGLULXz6
	OzGMGeo7DA0/oSNsfJbuUJSW6mAqQ2VLKfqii+cWZWaZTl2Hr4LB41sJsyBVq56RITe8lMgls0X
	zSnWj9dag07gyAeOr7Ffr3K4fmcwC/cZxGWKENY3xieVpE4KE2PygWWTc=
X-Received: by 2002:a05:6808:bcb:b0:496:e0:a46b with SMTP id 5614622812f47-4ad5b7fdbc6mr3443250b6e.3.1785331811275;
        Wed, 29 Jul 2026 06:30:11 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ad6ef5d650sm1712932b6e.9.2026.07.29.06.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 06:30:09 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Ye Zhang <ye.zhang@rock-chips.com>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] pinctrl: Add support for the Rockchip RV1106
Date: Wed, 29 Jul 2026 07:27:24 -0600
Message-ID: <20260729132736.3807082-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_063013_074328_B0A6446B 
X-CRM114-Status: GOOD (  14.41  )
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

This series adds pinctrl support for the Rockchip RV1106 and its
RV1103 package variant, split out from the initial RV1106 enablement
series [1] following feedback to submit per subsystem.

On this SoC each GPIO bank has a dedicated IO control (IOC) register
block, unlike earlier Rockchip designs where the registers of all
banks share a GRF region. Following Jonas's review of v1, each bank
node now references the syscon for its own IOC block through a
rockchip,grf phandle and the driver uses a separate regmap per bank,
so no regmap crosses a block boundary.

This v3 is tested on a Luckfox Pico Mini B (RV1103): pinctrl and the
four GPIO banks probe, and the sdmmc pinctrl state is applied through
the per-bank IOC regmaps, with the SD card working.

The corresponding devicetree changes are part of the main RV1106
series, which goes through the Rockchip tree.

[1] https://patchwork.kernel.org/project/linux-rockchip/list/?series=1122658

Changes in v3:
- Add new patch moving the drive-strength decoding to the get function
- Declare the 8-bit level drive type on the banks so that reads decode
  correctly
- Return an error from the iomux functions when a bank has no IOC
  regmap, rather than falling back to the shared regmap

Changes in v2:
- Add new patch for the per-bank IOC reference
- Use a separate IOC regmap per bank, taken from the rockchip,grf
  phandle of each bank node and identified by the gpio alias, with
  block-relative register offsets
- Reject drive-strength requests for GPIO0 pins above 6, which have no
  drive-strength registers
- Specify only the first iomux offset for each bank, letting the driver
  calculate the increments

Simon Glass (4):
  pinctrl: rockchip: Decode drive strength in the get function
  dt-bindings: gpio: rockchip,gpio-bank: Add rockchip,grf property
  dt-bindings: pinctrl: rockchip: Add RV1106 compatible
  pinctrl: rockchip: Add RV1106 pinctrl support

 .../bindings/gpio/rockchip,gpio-bank.yaml     |   7 +
 .../bindings/pinctrl/rockchip,pinctrl.yaml    |   1 +
 drivers/pinctrl/pinctrl-rockchip.c            | 230 ++++++++++++++++--
 drivers/pinctrl/pinctrl-rockchip.h            |   4 +
 4 files changed, 223 insertions(+), 19 deletions(-)

---
base-commit: fc02acf6ac0ccde0c805c2daa9148683cdd01ba8
branch: rv1106b3

-- 
2.43.0


