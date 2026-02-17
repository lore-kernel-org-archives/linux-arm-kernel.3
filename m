Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CC9AE9A03A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 18:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GZfvx2TSwnhF6sMsrr7tpSL8G7O+D4yIrBCpFk7zB/0=; b=3dE2sIG262p7WxfptaAvsMBjYz
	KrY7VjO5cM+roOjidho3H9Wi4Vhm0UXlud1OXq8Sqa0TcIpTyk53IPyekDajOZ3T55hBkmutZlfo+
	TFYFeDgCb7WP4+Q4xmYoqX4d2VFEtngxGizr6vnfgG+UIychIqWWsKdiLBTdccaw9QoW8D5Q5q/9n
	7NZjRcw1FlSKM5YYA5fxWri4vhyTpxYfDRdmE6PlrEBLE2rnhItsMoQv/p0XiQgUEZ5JEfZBE+09g
	rzyq8Gt6PwKA+SM7oD8esZVPta7rej+mhUX+SKYj0tL5HDJpjncyKvOfVaZsUIRjYqqUfhMn0kbSQ
	fP5sGOFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQ33-00000008kW6-3WS0;
	Tue, 17 Feb 2026 18:43:49 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsQ2s-00000008kKi-0RnS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 18:43:43 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-483770e0b25so40318075e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 10:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771353816; x=1771958616; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GZfvx2TSwnhF6sMsrr7tpSL8G7O+D4yIrBCpFk7zB/0=;
        b=mSpM1XymKB3CEuXHigCqX6IT8thKnQ0MvZWlHp7M30Cx3ZHs+M/Hg3LXF4Mg9ICbMn
         y0fZinp0+HqLjzyVIfjTPWv5+V/zSz45cDJiC9Qn5OWPOOeLMEsfcAUiOQGsNcNj7jMO
         MwUs7x3Y3KnVrxp9JAqYlsXpX4tCPuerbOQ5M0FG/FO054pqnbjHWc+wBWNps7vykv7d
         T35kEpSy7/hEfMOmS59ndG7VM7CNscHJyzYCbmioXHFO7lw94dnf3ZJRg5BDflETnqPv
         ub9u976GjtS2MqsAhwg5D/A/ZLEh9zteEu1zEOJ9cwsy+E3AV9f3AqUYo+8NvB7Ty5rt
         hN2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353816; x=1771958616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GZfvx2TSwnhF6sMsrr7tpSL8G7O+D4yIrBCpFk7zB/0=;
        b=SnxGigcKwlaJqedSPTvF1fp2dUH1AIZECDu2R+PO+/YjoGXg4jzAMeDsBav2o7berY
         qBcp4OqJkZsf0bbFcrtVPSkUqn1BlVmbNRup+2D4VhPbHMmHBiv0lsANVIHRPqKZSW1D
         bBGYbIVnhmsS+QpRa+4CTjtOUsOfuLVEnnpg7XR0vBM5PuoB86T6a7SbzmAhTjtikpAr
         MwV1F5mSIbeaAm1ExJddJ7gGx8JRbIb3dxOKkUanJDf0NKhkKyJgBPNmz7REHtq3ZZWl
         01UYSyow91PAATDzkqNOoViOBf0yjq7xPj47vhzy/molKkDdZv+XgaQ8eGR1C7Q8xXUL
         Q3rQ==
X-Forwarded-Encrypted: i=1; AJvYcCUJubv/ev6Ok6fC4TyYavZJFGGyzdAy7FpCFXRXQ7+TNdA4dUyIwyovAJozoU5PrG9e/tY0wlY/NkqK38gElhMO@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/1mH1k4TkJKP1iYxEIv8Su89kKvCmxIltCdyWxBLyEtVTltFx
	AAqb/7/onZaDah7dgeWW3dPAhzyXem8oDwBlrQjTM6MneKGOTMgoQaK5
X-Gm-Gg: AZuq6aKhI//oebOsCpWz8cMTEE3SA97dihqrG6aUzOltxAaiTN5sf2DPm7/2joxq8Ql
	T8xgn2RJC1taUcUK5rcZNWMQGg574b+Ev8YVz3qvqdJ839y6jQqUu3OZEA7UxdWesDIhf4JQa8h
	DYmLHv52HfK7BWyzzVB2EMpq35zT6HBWbSodu3Vy28kAxpHl5gPpZ6Gb4bG5eKivxw8+kTwroeg
	MrIxE+xY55itkqUR1cHpC5f0w2/qunPC8HxlOA2YgUvGFg2W4YTDOl3rvyJ5mbBhsBjhRg/l1ws
	lB3Msw3eGcoLGyb1mVEhCK0EFUe5niFR8t2FB+PJ4ysbLmn5ROe9qoOqwSq8011EWKABI53HLMF
	pjeIzKofIqHB8TM/9krQNrobVG7RuRvirXtD31K1NK5Srm3DmJ0RBYovVIrLz3RJiFaRJvollsq
	3J8MOizhq/zY5Xyaez6du4tAsts//UkU91FRbzY3Dn0gZcZ5aaBcQnWWLBLgGvks8hmASttMfRM
	oI//9c4GDxkJtankEhNkQi+5Ul23CvRRSWIbWY4
X-Received: by 2002:a05:600c:3b8b:b0:471:14af:c715 with SMTP id 5b1f17b1804b1-4837104307amr310912825e9.3.1771353816025;
        Tue, 17 Feb 2026 10:43:36 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.vodafonedsl.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4839731d7c3sm1096185e9.18.2026.02.17.10.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:43:35 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v1 09/11] arm64: dts: imx8mm-var-som-symphony: Add TPM2 support
Date: Tue, 17 Feb 2026 19:42:43 +0100
Message-ID: <c48ee9db2f8c98e0836e995577da8dbb4717d9c4.1771353301.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771353301.git.stefano.r@variscite.com>
References: <cover.1771353301.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_104341_107725_9D059599 
X-CRM114-Status: GOOD (  12.72  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add support for the TPM2 device on the VAR-SOM Symphony carrier board.

The ST33K TPM2 is connected over I2C, and A PCA6408 GPIO expander is
used to control the reset signal required to release the TPM from reset.

This patch adds:
- The PCA6408 GPIO expander.
- The ST33K TPM2 device node.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../boot/dts/freescale/imx8mm-var-som-symphony.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 40ffa1f36b2f..b4dba1961eee 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -137,6 +137,20 @@ typec1_dr_sw: endpoint {
 };
 
 &i2c3 {
+	pca6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+		label = "tpm";
+		reset-gpios = <&pca6408 4 GPIO_ACTIVE_LOW>;
+	};
+
 	/* Capacitive touch controller */
 	ft5x06_ts: touchscreen@38 {
 		compatible = "edt,edt-ft5406";
-- 
2.47.3


