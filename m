Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B674E77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jan 2025 15:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ufSZmiJg7tnVJs1W6WLAaINWDzw9jNeKjD7XxxhjWnI=; b=TS68T8gd5Ov+EjBxWP1U0lIo+X
	68sNKKh65oFq3n53mq9n5YaUZcXrFRD6FZuoOK5QtFrgUREnfX0G3I0f+fHMJqrq+0LBg7ha2Pkyl
	zLYsoC2+eUV7NpkFwhES/EPG8OnhwYsdHseY9xOS0RXsdlWiqvrvKyZudFjPyz5iDAvckQUvlMKyD
	Q6BfjONg1JKgBW995rnX8Y4kQZcQaNyjqak6s6f402vv4n/NndAHIISiWSG/UARG6RpXJ8wLkAf4B
	pPHK3ge2cYscCDh0m6m02n4gYzjy0/Izobr33lPPJZ0VsOOHpz7UW9R8kJ2siJ7O04lgyMgP4IuPM
	dGPZuESQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWzuB-00000002y4X-0NZb;
	Sun, 12 Jan 2025 15:29:35 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWzsa-00000002xnb-0iVv
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jan 2025 15:27:57 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-29fe7ff65e6so1212243fac.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jan 2025 07:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736695675; x=1737300475; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ufSZmiJg7tnVJs1W6WLAaINWDzw9jNeKjD7XxxhjWnI=;
        b=R/gJ5L2J3d5yILxQctYlFmaXJm5XHGOkXeeaE9D2NRqTXFfxu0u12Is3eWjwZJ/I35
         rXoa9A3mFk1POJe8hDi0F3nil5/zHgN4kQiVOIRW4hTY6XrlVDfz/FTJEPqfpeqn9u/j
         GyI6rEcQcEfUMnlvURpsQuumKF80vbb+ly8XNvm9P8Zg4y5LquRe9TLHF6dyICnNKfZs
         S+DNWluIWK+iID2PTZ0wCXkI0OiVYE5pxvJ3aCMHFeB18WssnCTPOXdZ7+FZc1/2Cssu
         F+h9v059Fg11AlW1RYpKcz7oC/l5Pk4O6vG8IMd1lAsKGhs0Vw98rrpTEXeIxVMv6fN3
         D7YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736695675; x=1737300475;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ufSZmiJg7tnVJs1W6WLAaINWDzw9jNeKjD7XxxhjWnI=;
        b=nFIDqcQo0mb0m9aTn1hN6CLMr/JiWZ3sRVsvxGtyWv924m4gf38+ByAKDzlV0P2jke
         XXw+6nxoLgFgeMUX9pbnlcpnmBzIIGGGze6Gc9ydTGfrm3piYNBe/GRI4ntqunZDBYdX
         kagX4n67d9AP8e2Gv4sia/FpHA3X7r6isg5E0juFXtA3qd5grHxOr/2eeJrkFm/R/dv1
         WC3wShS//2Pq+1QKr/thkQbY9AY4f2MzrqkN+U7OVCD2gD9wSSK/8DW80qoFlUiQsb1M
         ZkWIoc2wiOAXG2lcGa3W1B5Rpj7FZrGRCmlNasgqWZ8rnhwYR5KM9WdPtIfwb7/ddt5G
         A/FQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuUfmy0XL+qAIs/58VYJka2+AXvFi/8nOu0vd7jAHX2lhXmxQRj2hi93S4d/kxht/+zWzDMN3T7s8DFqzlU5Z1@lists.infradead.org
X-Gm-Message-State: AOJu0YzRT3rUvWibWfKQ+YMw5iNhWKi7uvmanra30pCZU1Gd19Tiaqij
	18JWYdaZCWX33EY3p5T0eaeyM/G6cPdnDMbVeomNaWbfJg3OTiIX
X-Gm-Gg: ASbGncsHSpKsXGxfOXjhQKiAScXPTqNIUbLOyB7GvmlUDUj8nxAroZ/Vhbebn2E42ug
	nw95VbNxWvaJUCX3vbelYICbOv/D+K141FtOqk4Os7oBqO8P0KmLPZoNGK+csvmvS/4D6bJNnjD
	27YhNq0jxnnv9Q344ZW0jpRtiGQt1AtCckXe9oLdN8cNelKAR9j68MnarZVhRLdri0VS4yVJRdZ
	aq/2dvI73Gq1ZeOtgFIsnEXMo99fGuFbeZboE+I9Hf6KpvR7C7BN5oHE94kMqW8zwLGBw==
X-Google-Smtp-Source: AGHT+IH/+RAxHFYqIOyPuZoSqSonhUnJs+lnRAyM2sKWo1AcFTT4c04wf85xXiYXKcP61dZvTha1Lw==
X-Received: by 2002:a05:6871:a08b:b0:29e:76d1:db3b with SMTP id 586e51a60fabf-2aa066470fdmr9828945fac.5.1736695675132;
        Sun, 12 Jan 2025 07:27:55 -0800 (PST)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:8c53:b609:d83:9568])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2ad80547c11sm2858083fac.18.2025.01.12.07.27.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jan 2025 07:27:53 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: shawnguo@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: [PATCH v2 1/2] ARM: dts: imx5: Fix the CCM interrupts description
Date: Sun, 12 Jan 2025 12:27:44 -0300
Message-Id: <20250112152745.1079880-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_072756_222654_EA20C649 
X-CRM114-Status: GOOD (  11.52  )
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

From: Fabio Estevam <festevam@denx.de>

On the i.MX5 chips the peripheral interrupts are represented directly only
by their interrupt numbers.

The CCM nodes are not following this format and cause the following
dt-schema warnings:

ccm@73fd4000: interrupts: [[0], [71], [4], [0], [72], [4]] is too long

Fix it by passing only the two interrupt numbers.

Run-time tested in on an imx53-qsb board.

Signed-off-by: Fabio Estevam <festevam@denx.de>
---
Changes since v1:
- Use interrupts = <71>, <72>;

 arch/arm/boot/dts/nxp/imx/imx50.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx51.dtsi | 2 +-
 arch/arm/boot/dts/nxp/imx/imx53.dtsi | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/imx/imx50.dtsi b/arch/arm/boot/dts/nxp/imx/imx50.dtsi
index 1b6f444443dd..f0b12a70f614 100644
--- a/arch/arm/boot/dts/nxp/imx/imx50.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx50.dtsi
@@ -338,7 +338,7 @@ src: reset-controller@53fd0000 {
 			clks: ccm@53fd4000 {
 				compatible = "fsl,imx50-ccm";
 				reg = <0x53fd4000 0x4000>;
-				interrupts = <0 71 0x04 0 72 0x04>;
+				interrupts = <71>, <72>;
 				#clock-cells = <1>;
 			};
 
diff --git a/arch/arm/boot/dts/nxp/imx/imx51.dtsi b/arch/arm/boot/dts/nxp/imx/imx51.dtsi
index cc88da4d7785..2bfb6baa67fc 100644
--- a/arch/arm/boot/dts/nxp/imx/imx51.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx51.dtsi
@@ -458,7 +458,7 @@ src: reset-controller@73fd0000 {
 			clks: ccm@73fd4000 {
 				compatible = "fsl,imx51-ccm";
 				reg = <0x73fd4000 0x4000>;
-				interrupts = <0 71 0x04 0 72 0x04>;
+				interrupts = <71>, <72>;
 				#clock-cells = <1>;
 			};
 		};
diff --git a/arch/arm/boot/dts/nxp/imx/imx53.dtsi b/arch/arm/boot/dts/nxp/imx/imx53.dtsi
index 845e2bf8460a..b7147cc7a316 100644
--- a/arch/arm/boot/dts/nxp/imx/imx53.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx53.dtsi
@@ -598,7 +598,7 @@ src: reset-controller@53fd0000 {
 			clks: ccm@53fd4000 {
 				compatible = "fsl,imx53-ccm";
 				reg = <0x53fd4000 0x4000>;
-				interrupts = <0 71 0x04 0 72 0x04>;
+				interrupts = <71>, <72>;
 				#clock-cells = <1>;
 			};
 
-- 
2.34.1


