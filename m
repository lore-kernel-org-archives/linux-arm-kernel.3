Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B873F10FCAE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 21:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7GOwLlN10Ns683PDS/KNdu0fTgjCNY8NkrJ0V0K9rlc=; b=ihCgO8vE12d8dID2wjxDjdnbx+
	01kRcjBx/XwrTgyqLBnxnauGBrR1XOuKz+wF1ZAmMbVGi4rFKu7lfHAN+vKmfvYyaJ3AnqZ8bOfRU
	OmJr0vHCaAmoMhKCwXBNoeGo7Vmd3RfTUoX2Q4KBSNt0Zv9JlJK0GcAcz3V6ixpVU39p185dwm6Gg
	iLMQjwmeEV0ZslcTnbi+5cnRAcrelN0GrZTn/mNWigiTh387A6rc2Ro/BGYQC2c46L4zOhnrJb02w
	u8UuQBQeuUUtYFwkR6asqtfwbX6km2zFLraxQvj7KBhz47rDdG9IM/Y1fiZYYzSNq+61weNJKOi6z
	KqSLB5gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8387-0000000G7Fp-0zsO;
	Wed, 01 Apr 2026 21:29:39 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8380-0000000G7E8-3zUM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Apr 2026 21:29:37 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2aaf43014d0so1079685ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Apr 2026 14:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1775078972; x=1775683772; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7GOwLlN10Ns683PDS/KNdu0fTgjCNY8NkrJ0V0K9rlc=;
        b=t4kMQDGWzXhV6hhtd0dNU26Ps1xg8vWLJxBE+92ZCbYEAx4bj106uJX5hUm1qvOsyS
         RBsh/x1mynm89ZxdRpR1AKzTFuAqMmDGeMdMf92AsWnDQqxUMOfhMR6OoHEnUxRxBfXL
         Gt8A0abW07LT/qTyQQ4swKaDU8r0llcF7xslqQ7OSjv4jVRF/8CMjTvoW7nTK2f7uOUe
         T3DtVpTZwBES9qcystzubSEWaG4egC/KIAaWbrrtv0x0f2XYVGzioMFL+bzzR72Qn21P
         vATNFWmeMbSVB08Me824yPX5PI7NuCKtJDfMRrc2cCKHEPZmLQ7HyChuLRpVTzdzPqV8
         xYpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775078972; x=1775683772;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7GOwLlN10Ns683PDS/KNdu0fTgjCNY8NkrJ0V0K9rlc=;
        b=iR6GwoBZoQctKW6fTMrnbJftQ4KzfoAZOMYPec0D80dz3YvXGFCmYFuWDs6vZh+3dH
         w5M4ttZtZhbCW8c60NHZ/5T/yFnvKAcYLZ6olvXTTnlb++V29dfcfrvqZTbnJ8dPDGZN
         WjUrKG118ZaJ3h2sVfyy5CXHSsyrk5UGMcN54RN353Du0X9+9Jje1QySB7qBezxDaDHL
         CJ6qBNPo9sb9+2OnEZc6gABBFtgLuYri8O3dsIznRSRmgZ+SjDao8yZcqqLQgmVPfjzb
         8z7GoeSqLMXR8mx+7xjxOabvJKsk38NPkBHKxbO2zaL2/vVqrdGKUHQiadi/cVixcN0s
         vYpA==
X-Forwarded-Encrypted: i=1; AJvYcCUdk0vHqrcOvpwtIX80prxGM1DdZ/9ayFPEYPLioakMGv9taqd+JiJV1qkxUpPv4e/+UOZC7ST9AtZJVkxZX/fo@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo8zrSWGUanxGBuUCrijUf0xuuRBykbch3Fl0POm8kiU4YV7N5
	w/H+x5FiWSuTBcS7cf2NnZGUOIw4AuJ6jTDXZbm+W/0YVK4prf3CCi8KF1s+cKYSkyM3i8r1OCn
	l2xmEcpo=
X-Gm-Gg: ATEYQzyzzqqX7jpxQly0++h/rbESP8SQeuuqJJaQwNmGEXTddpSnl5eyZFQXykkR4Xr
	mVTUM8tibUjAdA+wTXEvSUTc59osg8wTEAOlyzN/mipM3RWL6ljzubzPQOhGCfN2WBGYeyqcHiZ
	rNqSYWwJQMyZ+9jDdwlF3eMk0/JTcM7mhh7HSPqRTyJqDyfrYZzwbFZivJVKVX6GW4DsTrt9jId
	8pr1sJBSXmrmOJP66aQLU2dj92bo5Arrud3I3lmQ+Mm7vVZtMhbv72a67aQMg+j0somsIZ551Vq
	A/w0OGRbqKA8AlnIE0hLXNNoWY+jeSslJZhw+/dmRBStgOfmUyCg/XeUz11cUgk6zYOTzgxOhmu
	XQ7cPNA/AOmZyfITCv3ZtD3+lIteS09fgPrVbzgpv/kDoiPxyK52wZu3WxTXRyl8Uz/yHhRTIds
	t5gWP82g+IHKoBl84vvSE=
X-Received: by 2002:a17:903:37c3:b0:2b2:52af:52b8 with SMTP id d9443c01a7336-2b275891e28mr6903115ad.11.1775078972028;
        Wed, 01 Apr 2026 14:29:32 -0700 (PDT)
Received: from localhost ([97.126.187.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cbd85sm6419405ad.74.2026.04.01.14.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 14:29:31 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: soc@lists.linux.dev
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: dts: updates for ti/omap for v7.1
Date: Wed, 01 Apr 2026 14:29:31 -0700
Message-ID: <7hqzoytlms.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_142932_992474_61F8B810 
X-CRM114-Status: GOOD (  11.35  )
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git tags/omap-for-v7.1/dt-signed

for you to fetch changes up to 2c4059f54f65ff1ee2d430fa023d25487cfb5b99:

  ARM: dts: am335x: Add Seeed Studio BeagleBone HDMI cape overlay (2026-03-31 17:15:17 -0700)

----------------------------------------------------------------
ARM: dts: updates for ti/omap for v7.1

----------------------------------------------------------------
Andrew Goodbody (1):
      ARM: dts: omap: dm816x: Correct pinctrl register

Charan Pedumuru (1):
      arm: dts: ti: omap: align node patterns with established convention

Kory Maincent (TI) (2):
      ARM: dts: ti: Enable overlays for am335x BeagleBoard devicetrees
      ARM: dts: am335x: Add Seeed Studio BeagleBone HDMI cape overlay

Mithil Bavishi (8):
      ARM: dts: twl6032: Add DTS file for TWL6032 PMIC
      dt-bindings: vendor-prefixes: Add Doestek
      dt-bindings: display: bridge: lvds-codec: add doestek,dtc34lm85am
      dt-bindings: display: panel-lvds: Add compatibles for Samsung LTN070NL01 and LTN101AL03 panels
      ARM: dts: ti: omap: espresso-common: Add common device tree for Samsung Galaxy Tab 2 series
      dt-bindings: omap: Add Samsung Galaxy Tab 2 7.0 and 10.1
      ARM: dts: ti: omap: samsung-espresso7: Add initial support for Galaxy Tab 2 7.0
      ARM: dts: ti: omap: samsung-espresso10: Add initial support for Galaxy Tab 2 10.1

 Documentation/devicetree/bindings/arm/ti/omap.yaml               |   2 +
 Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml |   1 +
 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml  |   4 +
 Documentation/devicetree/bindings/vendor-prefixes.yaml           |   2 +
 arch/arm/boot/dts/ti/omap/Makefile                               |  15 ++++
 arch/arm/boot/dts/ti/omap/am335x-bone-hdmi-00a0.dtso             | 157 ++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/ti/omap/dm816x.dtsi                            |   4 +-
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi                           |   4 +-
 arch/arm/boot/dts/ti/omap/omap4-l4.dtsi                          |   4 +-
 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi     | 744 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts           | 101 +++++++++++++++++++++
 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts            |  70 +++++++++++++++
 arch/arm/boot/dts/ti/omap/omap5-l4.dtsi                          |   2 +-
 arch/arm/boot/dts/ti/omap/twl6032.dtsi                           |  77 ++++++++++++++++
 14 files changed, 1180 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm/boot/dts/ti/omap/am335x-bone-hdmi-00a0.dtso
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso-common.dtsi
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dts
 create mode 100644 arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dts
 create mode 100644 arch/arm/boot/dts/ti/omap/twl6032.dtsi

