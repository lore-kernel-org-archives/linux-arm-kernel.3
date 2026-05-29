Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092D5CD6E52
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 12:09:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ns0b+AP7a0XFNtYiOZwiqXXnknxzUGgu+QW5bEOOYco=; b=yKutmDYXYKHX08qP9cHIfN+Ffz
	2fPOVvQGi8362TumTupDWpcTDpYMkZTGjUwow/OJV2da9yG3VLJlBxMpTFxgJqV6Yo6vEbfNHPjn0
	P0bhJuQFKhg/BX2JGfTHhYsiJ8B+gqyIgWUFHwTUpOdkgkLfnYJqcyVlq1z7Rmul2dgyzzKhZeST5
	ZBxdYpaEWbg6dw5X7HEV0d8BsFreFv1TgAd5somMYEr+KAY7ucropC1toErpkSk9YFt070XiXrl1t
	QqP9GCpsDr8qi/TMAsQKL8XVwwTBDGBSnWao74tw/XF7KQFT1lUIw7uHpPJTqQB9yi3uLHt5LckaK
	P5A47Ruw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSw1t-00000007Kwl-2P4b;
	Fri, 29 May 2026 12:09:33 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSw1b-00000007KsX-0RNp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 12:09:16 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso81854765e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 05:09:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780056553; x=1780661353; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ns0b+AP7a0XFNtYiOZwiqXXnknxzUGgu+QW5bEOOYco=;
        b=Nhb2zYuHuvF4F1OrlIxFJLpWI00cfBTX+hnrgftWUUmMitqkqiayIlwXdui1FiA+Pf
         d8HGm+64nP8d/GBwSiWNxa6stOQRsIx61Vmo0wEsRGz82gGpNu7Id33bHHr3WmhFTezG
         /ZF9nk4rdAfnt7WkKgSsZif9uAvpCtM60YWtOmYBQVhmWcXWFQZ/5yQAcNqBJpYrhHTi
         UtIrEPQw1EWyhh1Oia+spuPGY5xmnAarGEiS7yO0sZPte5V7A+p2kqaCM6LYq6ZkRfoi
         jUm8B9t6qr3U4OjRtbUPXKES4QRY1B/q3xzj31thbajzoxH1YzMmyhiu7oIbBrLrUZrw
         B+wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780056553; x=1780661353;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ns0b+AP7a0XFNtYiOZwiqXXnknxzUGgu+QW5bEOOYco=;
        b=a/+mNuJi/zMa3IKYpOiXpYYHIgpz9pdHOG8YSQhh9T9Cl7i888O9+653Y/5N4aRJ1r
         WtuwT/9GE5abVVA1Szuo95nXotBVYzlHGuDod52XQd0B66cNWa5G8zLTOpg6ilxQbNoD
         GfHNnNEdABcUnZMi9N0QmZA1kBKuncUSpPMzdURaHzf0Qpdzca9kZ0hEq39LkwwmpSrf
         CMLaZZ9UmozOebEBUPYZDEcn0MR8W7gqcCOjxKBDH1h4PwyGsg7cMyJRo/36M85Lu8rC
         mAs1akmgfTjQaOf0bjEBd8rw2NI91kc6pBTFIjhxbtdeR3/U4LI73vEAFewQ3c4+lSmc
         kgiA==
X-Forwarded-Encrypted: i=1; AFNElJ9X1jECqQGFl/tGwmJ4JZxISC7iwZsri13JCPe2E35IAw/0U1IEhKQotof2lEwwze6ldDdQe/Nemg3NDzdhTUwp@lists.infradead.org
X-Gm-Message-State: AOJu0YxbL5csaxkcSUhV69SxINx+vk3w1keh656LWXSvYlTuVsAo8BV8
	c9AyYbskr5FgVD4gVCeDzSZGcvR8vKa+LRDfTH/J1d4s3H11Xt2XTcII
X-Gm-Gg: Acq92OHae3dPs339sZHob5fX2XuUcHGkf2ynDB2HYnWdYLfdLEo8CqHiSA8E68ubW2e
	OdEgA4NjiFWCuUK6OHvKXOkQXdvvYw9l8ZG6s8LNCgXc1dxPrGShrITZQYGLUq545By9FHukUPO
	7PfgryrIiJ38w5GgVbHwwIr7eZMYv34q/g2W+nmd7AZuMquhiIb2qMIqxuDWEydlL4wAeIL8KRr
	xmhXR03TIMghk+XRmi3l5ajy3qKqNiszhywctZ6zCba+jgzLL+xc1y4ReKrcy4hBVnRkdJYlYTW
	e7XRGQUX+5ngrgfJPJffJ31BgfiJRh8r8umDfZz6GH4HzmkTMhfzlFnzz5VC6cqEq8YbHje3uoe
	LjDs7f9Mv8zKV8dG0F4O6JWvMghc0zpiY0QOPv0KEhj6zyMZIcziVo5VYETGmB+5+A/Y20+O4bz
	G8hjImqMWR/zJ4O5IMrZPWYo3b78s7PwoJTvc=
X-Received: by 2002:a05:600c:8b47:b0:48f:e230:c3fb with SMTP id 5b1f17b1804b1-4909c0fa43cmr45960295e9.33.1780056553133;
        Fri, 29 May 2026 05:09:13 -0700 (PDT)
Received: from vitor-nb ([89.214.125.253])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909c0b8a11sm13586595e9.16.2026.05.29.05.09.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 05:09:12 -0700 (PDT)
From: Vitor Soares <ivitro@gmail.com>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Vitor Soares <vitor.soares@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/7] arm64: dts: ti: k3-am69-aquila: Add display and peripheral overlays
Date: Fri, 29 May 2026 13:08:52 +0100
Message-ID: <20260529120853.636015-9-ivitro@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_050915_173179_05F6024D 
X-CRM114-Status: GOOD (  10.20  )
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

From: Vitor Soares <vitor.soares@toradex.com>

This series adds device tree overlays for the Toradex Aquila AM69 carrier
boards. The overlays cover display adapters, DSI displays, and OV5640 CSI
camera modules available through the Toradex accessory ecosystem.

Display additions cover three configurations:
- DSI-to-HDMI adapter based on the LT8912B
- DSI-to-LVDS adapter based on the SN65DSI84 with the Toradex Capacitive
  Touch Display 10.1" LVDS
- DSI driving the Toradex Capacitive Touch Display 7" and 10.1" DSI

For the OV5640 camera overlays, both the current Toradex CSI Camera Set
5MP OV5640 with a 27 MHz oscillator and the legacy CSI Module 5MP OV5640
with a 24 MHz oscillator are supported.

This series depends on the Riverdi vendor prefix and panel-lvds binding
patches, which have been submitted as part of a separate series:

https://lore.kernel.org/all/20260522161105.277519-13-ivitro@gmail.com/

Vitor Soares (7):
  arm64: dts: ti: k3-am69-aquila: Add Toradex DSI to HDMI Adapter
  arm64: dts: ti: k3-am69-aquila: Add DSI to LVDS adapter with 10.1"
    display
  arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display
    10.1" DSI with adapter
  arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display
    7" DSI with adapter
  arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display
    10.1" DSI
  arm64: dts: ti: k3-am69-aquila: Add Toradex Capacitive Touch Display
    7" DSI
  arm64: dts: ti: k3-am69-aquila: Add Toradex OV5640 CSI cameras

 arch/arm64/boot/dts/ti/Makefile               |  43 +++++
 ...la-adapter-panel-cap-touch-10inch-dsi.dtso | 151 ++++++++++++++++++
 ...ila-adapter-panel-cap-touch-7inch-dsi.dtso | 151 ++++++++++++++++++
 .../ti/k3-am69-aquila-csi1-ov5640-24mhz.dtso  |  18 +++
 .../dts/ti/k3-am69-aquila-csi1-ov5640.dtsi    |  76 +++++++++
 .../dts/ti/k3-am69-aquila-csi1-ov5640.dtso    |  19 +++
 .../ti/k3-am69-aquila-csi2-ov5640-24mhz.dtso  |  18 +++
 .../dts/ti/k3-am69-aquila-csi2-ov5640.dtsi    |  76 +++++++++
 .../dts/ti/k3-am69-aquila-csi2-ov5640.dtso    |  19 +++
 .../dts/ti/k3-am69-aquila-dsi-to-hdmi.dtso    | 115 +++++++++++++
 ...la-dsi-to-lvds-panel-cap-touch-10inch.dtso | 142 ++++++++++++++++
 ...m69-aquila-panel-cap-touch-10inch-dsi.dtso | 149 +++++++++++++++++
 ...am69-aquila-panel-cap-touch-7inch-dsi.dtso | 149 +++++++++++++++++
 13 files changed, 1126 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-10inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-adapter-panel-cap-touch-7inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640-24mhz.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi1-ov5640.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640-24mhz.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-csi2-ov5640.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-hdmi.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-dsi-to-lvds-panel-cap-touch-10inch.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-10inch-dsi.dtso
 create mode 100644 arch/arm64/boot/dts/ti/k3-am69-aquila-panel-cap-touch-7inch-dsi.dtso

-- 
2.54.0


