Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0836EC61DE1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 18:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4Z/BxeJ8T4MCVt5zsyL/JPI0APYo+zl6RdZeA6DakAU=; b=VXWH1DSCbeIWGQtU01SsCh+Ius
	9xa+90F/cjA2Z3oW+wJHcII1X9xtLB+WZnU9cl+tciXo6C6n/1o9nX2ckx/lpuaF7qUDJtdDh+Mvm
	sRFlKHXRD1yYu1k64AjxBC3KzVyCvBjtHw5n9sp6Fsda9g5d5ct+9O+v/oL2GJvwB4FtUr5oaVoxy
	7EOOVovRJr0KY4925wwdC4Z/E50TMXTEqMM9fa+OGRvslCDJmiNtX6mkqCTHcGAe7a0vNJqdVNDXu
	1iWhp9dqAUVAIXG7sJz5g7YJNmwG3DERi/1/9w9BdGBmXnXeb+1cF/c8BJf1Sulm493VS+WzVJZF8
	F+JK4Trw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0k9D-00000007zB1-2Zrk;
	Sun, 30 Aug 2026 18:20:51 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0k9A-00000007zAM-3ZRt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 18:20:49 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-cc1bcdb3c4cso1918666a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 30 Aug 2026 11:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788114047; x=1788718847; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Z/BxeJ8T4MCVt5zsyL/JPI0APYo+zl6RdZeA6DakAU=;
        b=Grd6ymQ3oLhEP80zP8w4CR6UI+GtjfMVszFgU2Tdx80eje3NXE9afetxk2VcLfGlrn
         AtjuFtcLElJ7LYa+Qci/KG5rRrkJuBiQzHJl4QBIdaHDA8qumBca/E3bFaP0SmOvuiRR
         dLOaTBAd6x72ct3ZJqTgfaKafXzAbyQfT6dOaNeZZq4kq/cR4WaZOB/S6K3KkVN68xAO
         zvtQT8rzBMso+iE/dUFxRhjzyol2njCNG0K+X8UutvpLaagZzrOPlXatyVJnxTjEG1TK
         kJCLdaziuDzvIFfAjfox+dSMJePt9PWUSmZQ2RoYiOQF4L5cR2wrtqvDDOvkGqUXHyKf
         RpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788114047; x=1788718847;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Z/BxeJ8T4MCVt5zsyL/JPI0APYo+zl6RdZeA6DakAU=;
        b=HKiUro8VztEZn+oDPK6wxk8+Z3vGDq4LHM2Q52tx6bi4UGsvB0OGTsA/fhjtcVSUa3
         fPN301C6c7tWO7i9lilyeYhntdBtvyk2S+XufXVIkerZ5ez/VCkQDQFzwzPMB1qXG6on
         VQypS1rei5L9x+ANDEB8kA7u4VNPcZKfDBP4X2kuHZAXKOBa+A0GcAeX5n9uplReju/z
         ehKb9We2gFOpjdjHhlymueNjvIJ/e8WzLbQ1LvXozH7wrvAh04lTzYfputHcoTMIa1FE
         XHm1/UPZydpNQn585VhRjCqjukWxWy/R4+0G81N7NG3iDNDoDF8qUkQ3N8bCe3fhPNKc
         pfQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr14IsBnEdbQFj+UQmdjN3/ZUNS9/wWHbXh+7EjrPtZ+20S9Jata7fPo0aqrTSHy9l5ycZGRTm7jjxrBclhE4os@lists.infradead.org
X-Gm-Message-State: AFuF++nrK45XHUACV28y9gNSfwui+IO2uN/wbFNMY/mEDfCIdKtYiJLO
	Vtk4v23ktZB/UlkWUL/RxdpRzbF4IzsGe/NcJvhGkUszuvLIrrLuICfy
X-Gm-Gg: AR+sD12V+g+jVE7p9oMLgOyAJ1myi4mxLgOQnFoH7ecp4nZL6co5lXV3mkmTjTGjJAL
	vqsCb/MuDfSUi3GZ4J3dQW66ZmUmUV041WCCO4jcBrQgO577j5kyOzhdSvxAhrX5+I6ookeyLxu
	jHTlTCA2KtDgGISRGTvV1M1TDrr8UuckVlFwiVOiJWj8H3gcXIkBnBYUOCOyvZDlgi5WC/9zBQu
	4mPb+PM849waKZ/U0ndzwMDjMJ/x+uTXfSoRfgXYIxAmTN8+BTDfzkvxSCqaZOe94t5uCaf4SB/
	9CjgsT6cjI+/m1aWT75CjRAaQkeKurtZN7B639bNUyfA9+5t9h82s+iX53uK+W9sPXfAB+4s8hV
	RanAuoHawNUuGbUZoLpHSXytFCYcYhy8e5Tt/Tf2zyOPctybdNcbQL4fCxsOXmCerLz7JEAcFj2
	BKX6BLUJI4p4O19+W3J6YiFWugNfS3dUgGGeHuz5TLR6+nK5Y4CfSn2RG+JGDAUVo5su8isQ8Sf
	/3ogQ==
X-Received: by 2002:a05:6a21:4d07:b0:3d3:af44:ee12 with SMTP id adf61e73a8af0-3d3af44f160mr20178531637.27.1788114047417;
        Sun, 30 Aug 2026 11:20:47 -0700 (PDT)
Received: from debian.prasanth ([103.177.82.239])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3286f95a847sm21619480eec.17.2026.08.30.11.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Aug 2026 11:20:46 -0700 (PDT)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH v4 0/2] ARM: dts: aspeed: Add ASRock Rack B650D4U BMC
Date: Sun, 30 Aug 2026 23:50:34 +0530
Message-ID: <20260830182036.284736-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_112048_892688_B3D1A5A9 
X-CRM114-Status: GOOD (  10.58  )
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

Add device tree support for the ASRock Rack B650D4U BMC, which is
based on the ASPEED AST2600 SoC.

The series adds the board compatible and describes the BMC memory,
SPI NOR flash layout, UART console, and MAC0 connected to an
RTL8211F Ethernet PHY.

The MAC0 RGMII timing configuration was validated on B650D4U
hardware. With plain "rgmii", the PHY negotiated 1000baseT/Full but
received no valid packets and accumulated RX CRC errors. With
"rgmii-rxid", a 5000-packet test completed with 0% packet loss and
no RX CRC errors. "rgmii-id" was also tested successfully, but the
additional TX delay is not required, so "rgmii-rxid" is retained.

Changes in v4:
- Validate the MAC0 RGMII timing configuration on B650D4U hardware.
- Keep phy-mode = "rgmii-rxid" based on hardware A/B testing.
- Add the SPI NOR fixed partition layout validated on B650D4U
  hardware.
- Correct the BMC memory size to 512 MiB.
- Order peripheral nodes alphabetically by label.

Prasanth Kumar Padarthi (2):
  dt-bindings: arm: aspeed: Add ASRock Rack B650D4U
  ARM: dts: aspeed: Add ASRock Rack B650D4U BMC

 .../bindings/arm/aspeed/aspeed.yaml           |  1 +
 arch/arm/boot/dts/aspeed/Makefile             |  1 +
 .../dts/aspeed/aspeed-bmc-asrock-b650d4u.dts  | 95 +++++++++++++++++++
 3 files changed, 97 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-asrock-b650d4u.dts

-- 
2.47.3


