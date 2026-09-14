Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40B7C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 03:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oKKKPTctZOY62gpBWjyYhq7FRns8SufRf13oKGN+IiQ=; b=GsFq+bBQRVMXrJ4kNPN45BRcjZ
	0nHndjqq8FxwdrTz+cblg62PT38MDZc9Gq6P3slzIvUBA3myDEvw5AZCfO8Q5zdic/AlZa0lYVPY/
	RSjy6IlD8Ten3/xO8OrFoObKePW4MwKsv1nYAITkURoFVS9iGIDsq5vEXWkvZR7uRFA8M6zrEWT3o
	9VdJLWJOmieRjJhdixY/acbISK9QNn3xyVFmXqraDOCekswIm2C6PYbicQYrADnapOTNiiYdT7tuY
	BMSNpf6TDXXv/0lQVAOGeTeA2ZCtdg5GzcNqebiw/Jm9frjcUEkw3R43Fyza2q49RunRh+kct3UEi
	uWOlOHvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5xDp-00000002G4a-3jeS;
	Mon, 14 Sep 2026 03:19:09 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5xDn-00000002G3t-2wBl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 03:19:08 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2db3305f94fso43498865ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Sep 2026 20:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789355946; x=1789960746; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oKKKPTctZOY62gpBWjyYhq7FRns8SufRf13oKGN+IiQ=;
        b=EueTpOpGOHKUere58VXjVYCTLw16AmNBUQKtKnGYtDK0XpuHDMQBBvO/uZAlxa62Cg
         hMsCSv0ceUToMLA14VZOgwcZacgT0KsnriHs/mpj9raTBoRa+Sxiuoqk823MhT2eJDgN
         SmXBwwse7AgxrzQmkLwfd7JMpZraCX7bDagk3TB/TwNXh8oQ1AgkZ8giUimoJjepb6lN
         19PtgmfHW9KM8EUx6YOcOmiMQcPN8Rjd2fXAYVW4NGLp1LQGKNwsKZegmZIUcYXGHAU+
         fGUcQsWFc/RYpFbGwPmM/djaRyr0RYQSUp/bfBqP8xwJu76R5t5BPBytTIlnlwqNeTpI
         A5gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789355946; x=1789960746;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oKKKPTctZOY62gpBWjyYhq7FRns8SufRf13oKGN+IiQ=;
        b=R+UbKHd92gk9aHwhHp8OJsxhuOFkywANDYnWL81gZAa+pJqeVMb/aBH8H1VYrQRkaz
         RMJ3zk9KfOXRd4q8zD6P90UrxukctoXrTwZiDwHI2Gy4C+8j4JlfDTHP0aozPQ0e4390
         a6T5MpNashD58bwt/+q5+2vm2A2eY2tSb3hvdHT749/tcWcbSJCpzctWbvFTne0DpgG1
         rH798lIpxTMtt/h21S6Jc0M82k0VDK6fdrxQZwdTrNJ6KWPk+MGETSY9SDUy+H8y6Y/2
         9XtHDbjOdiTOGRdco/jqNdHJKoF7ib3WET0dYGEFJSCtfyIB1RvvEqg3RSGoqyUEqzJg
         4uWg==
X-Forwarded-Encrypted: i=1; AKwUvBzR6NuEDbyu9HH4toeOmdFoCqQv3/RoXiR3Hz8uBHiiE+aBr8v1lWAB7oQv8r8uy3ftxxnpUSpUypI9dqlwWx/9@lists.infradead.org
X-Gm-Message-State: AFuF++lSl45lzBWc8ULV2fYktSgvwkJjrx5pwcsc8akDC5OO8t4kgbDW
	Ffg3vE04EFwhjVEOK+UbXBAkXrnWQe3S6EkBXTEbEYQc2BWTEuMWFcZE
X-Gm-Gg: AYBFou3AIzxJ4hMk2qmBneD1vGH1w7M6iCcxsTBOuf31sRg5VR34wewFNeAlPMfC2dI
	QJXpT6lDyKLPnYm6nUTmkMvsNP3//V4fUTsJ2rPBoNWhiiJX7apAI1fFCRaLnUxMCTBhCDcY3Z4
	qfxAPnDRzuwMtACAF9wTwsQybUDEOaDPFyX4oWOBx04mryce8BVz1jxPFBWv7l2TGkqdfOqgUl1
	LIzCjyi4BwG136RtfEX+7uyiyw1rSLINFiammH3WqLYS1dHj39eqQMsjC1CJBN2EVuU95gFYQf9
	6pxzZwgDkMxNHZKRcd2MbEukvcKhdg+Kr3n3QhfD6XKyQeWL8TPZPOZ6tCrQETUnruXvQmA80kf
	IP5YR0dtK4ejEMKp/KvLy084kO/YahnhznD3aW6ESTsHUqLOtQdVKHFyGa8EcAMyIT+SgOTmC6L
	8BrFfWBJwAXqKVVRrGUiXBb69rsgG77GNIIxouYaDThcMaQCwSFxzOAmOyGblgBJqD/bAoAq7Kn
	sAgsVpf02M5J8tHXfWs6ulL8aX6h3HuaOvCCIvMzOZqQxrF//44qHHDvoX7jH4=
X-Received: by 2002:a17:903:1aeb:b0:2da:eba4:b640 with SMTP id d9443c01a7336-2dd6c5f7d4bmr16986685ad.6.1789355946130;
        Sun, 13 Sep 2026 20:19:06 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cfc2d3bsm41355145ad.48.2026.09.13.20.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 20:19:05 -0700 (PDT)
From: Joey Lu <a0987203069@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Hui-Ping Chen <hpchen0nvt@gmail.com>,
	Joey Lu <yclu4@nuvoton.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Lu <a0987203069@gmail.com>
Subject: [PATCH v5 0/3] phy: nuvoton: extend MA35D1 USB2 PHY driver for dual-port OTG support
Date: Mon, 14 Sep 2026 11:18:56 +0800
Message-ID: <20260914031859.385224-1-a0987203069@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260913_201907_736181_D5FF7BAB 
X-CRM114-Status: GOOD (  11.65  )
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

The MA35D1 SoC has two USB PHY ports managed by a shared hardware block:

  - PHY0 (USB0): OTG port shared between the DWC2 gadget controller and
    the EHCI0/OHCI0 host controllers.  A hardware mux automatically routes
    USB0 signals to the correct controller based on the USB ID pin state.

  - PHY1 (USB1): dedicated host-only port for EHCI1/OHCI1.

This series extends the existing phy-ma35d1-usb2.c driver and its binding
to cover both ports and add OTG role-switch support, while keeping full
backward compatibility with existing device trees.

Changes since v4:

  - dts: move the usb_phy node out of /soc to the top level (placed
    between timer and soc), since usb_phy has no <reg>/<ranges> and
    doesn't belong under /soc's simple-bus, which triggered DT
    validation warnings. No other changes.

Changes since v3:

  - dt-bindings: add nuvoton,rcalcode = <7 7> example to illustrate the
    optional resistor calibration property; revert redundant clock example
    change (back to USBD_GATE as in the original binding).

  - driver: handle -ENODEV from usb_role_switch_register() gracefully so
    that probe succeeds when CONFIG_USB_ROLE_SWITCH is not enabled.

Joey Lu (3):
  dt-bindings: phy: nuvoton,ma35d1-usb2-phy: extend for dual-port and
    OTG
  arm64: dts: nuvoton: ma35d1: add USB controllers and dual-port PHY
    node
  phy: nuvoton: phy-ma35d1-usb2: extend to dual-port with OTG support

 .../bindings/phy/nuvoton,ma35d1-usb2-phy.yaml |  44 ++-
 .../boot/dts/nuvoton/ma35d1-iot-512m.dts      |  36 +++
 .../boot/dts/nuvoton/ma35d1-som-256m.dts      |  36 +++
 arch/arm64/boot/dts/nuvoton/ma35d1.dtsi       |  65 ++++
 drivers/phy/nuvoton/phy-ma35d1-usb2.c         | 284 +++++++++++++-----
 5 files changed, 389 insertions(+), 76 deletions(-)


base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
-- 
2.43.0


