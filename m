Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77AE7FCB638
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 15:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U5K4jcVb2WAVGgJfdO+e2rSdDaBiiC4SvELyV5iW+ww=; b=Vi1WSF7xEGskhgeqi/unlTg0Mk
	cfR0FmyC8SyzMAdJU98DJPqqA7EKfweuxJvg0llvP7RJuE7ocT6mcJUxNM2+MS9axEqttYqWD+REr
	jkjF3+naKYKUXe2eTEP4Z+Yk87Zoq2mEzHyvwyciquaFGtKFbXvsHfXMI/+O70c/Ih8spFg74/bN5
	1uCkPYCCfT1iAyWre8L3vrMEYUhjwZjS7NzneC2N0t3iXjrbOMMG5PFbQT2B/6j3P5nr4GrcWLS2U
	bhR+Aa2+qipPpytOEDY6MbibdoiRTz3sEFH6crZyfWdevxTMYBXNx4ARoEaeFrErvlVhuMQnWLnfQ
	L2ijfJzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyu09-00000005KF1-0xYj;
	Sat, 07 Mar 2026 15:55:37 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vytzv-00000005K2i-0MNu
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 15:55:24 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4852ff06541so4810275e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 07:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772898921; x=1773503721; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U5K4jcVb2WAVGgJfdO+e2rSdDaBiiC4SvELyV5iW+ww=;
        b=XUAZAvVs+folNW95rYJxEPf8xWmihRRfxo/7WgOu54UpuCmF93aFP2wV42reKWHT+4
         hHYPVqgAShU4iYLu7PoZ3FYe4jcF59cYVkk6ZZqSWz+R6hTsTXlB+ThaT/ujTL1BJVLZ
         2b32kvANwKcs+5lo02n7zdgCgCbIpXUA1IVGNaJvRvpNstgu06KrSQrNhyLKxc2nrOJz
         RSTgUXckwvlHgaz5Gd3utBrb/L4kuBz/1qvRBy0AkYyewU74PIBvPtYubrA7+uznfbzv
         FrVztsHMLibEdERYyZvIz14gZjtakMhmig2bnTYLIAmr2vgtXdY7HRh5u90o0G9JYIGE
         JX3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772898921; x=1773503721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U5K4jcVb2WAVGgJfdO+e2rSdDaBiiC4SvELyV5iW+ww=;
        b=QX3eebCKQnHg7TRxIazObIkKn1+Hb6RWgaZTOnMhFV+BNYgxxeS0jKjd7+creAfqfZ
         IBw4b9s2WNeixEFQAKg5XPuY2Ibc43ykqCPf0lMU0tp4WF3cbcH3R8Dpsk7Kval+38uV
         hOPMmkyhqfHnC6PxSA39GiWqEv0birxwcovHaD1HxyykqszpQmJ26OLLmjHT79ikQ4dM
         DgGeutr3gJBNW1YX0aElA9hc6DSZhDg0pgOG2r0t/6JTvIAtZzvvJerOpY3GOoXYt/Qw
         +czazXOXLeZnYMayfkCVN4g3T27KIlGspiOloIIYxLdGuV9T/pxwVXPkgS22I/opiBTl
         SFsg==
X-Forwarded-Encrypted: i=1; AJvYcCWwpgAfCyHLKem/Sbarc3mhi/uhP9WOpwKdsaFHw1Bv43f6F/p8UmbK2GNg0Ij0JYv6EqXCAp/zqb4tfvhYkYl6@lists.infradead.org
X-Gm-Message-State: AOJu0Yzp61CFDnYrukxrpwp2dq6CZ/Ea6gWa06jpKe9PkKMsXB1Jm2qI
	jxH3iQyVkKKIXS3tsGHsWyCxZf8Cc5POJG/bEElhjAc2Rqz0qxfaatbX
X-Gm-Gg: ATEYQzxA30mm5yjx0K8wtNuBfihRRfg4dGUb5CN1QKX8id3OT1UjKyf2ybxUUFzll26
	Lu97OJIccqzfpyCkUF5yfPo+GTkoZHMBMPY62keslrrQqkNQYSHpZMDs+fPKs11jfhkpj5BPo/c
	+0GIbn9M1/wnyuGp5iSBpjc8Oj0Hpj5cUM3oGG5mcC+TO/DwMt9E8aWIojXtfoZzTlHzJTjamsE
	ffKio3nw0Q6rajEO9leihKS6B+ChEimH0OMFVn6uXYMEVppAepWTFXLCNOdKyEwn0yOROQskx8+
	StVcU7UJmtpiKXWH+QF4ofDH+TPmFTRY2wmIn+kd2CV+cybcUIRs3bXpX0G0ZIODE1NDVbyQ5X9
	wiU7gH3KMbNQLwZpB3AzC90T5tcZY2ZzIQIg+LP1wfk3CQyi9WLm3psR2EMXg0a1nvz7CASSEZu
	oYoPbXzwz/FNkzazy0ILHF/j9XKjQAWQUB3Ws8HNsLMWlQ9UVxZcZOtP8MXAEku5dni7+n3PPeZ
	6mjt6QUMrKUwVdbyIMK8kC6Ew==
X-Received: by 2002:a05:600c:3b0c:b0:477:5b0a:e616 with SMTP id 5b1f17b1804b1-485269188admr96312265e9.5.1772898921081;
        Sat, 07 Mar 2026 07:55:21 -0800 (PST)
Received: from GLaDOS.lan (93-35-179-236.ip56.fastwebnet.it. [93.35.179.236])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48527681a3esm261097785e9.4.2026.03.07.07.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 07:55:20 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: [PATCH v3 09/11] arm64: dts: imx8mm-var-som-symphony: Add TPM2 support
Date: Sat,  7 Mar 2026 16:54:45 +0100
Message-ID: <72e21074031d16153460e128f8f37b8c942aaf30.1772898346.git.stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772898346.git.stefano.radaelli21@gmail.com>
References: <cover.1772898346.git.stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_075523_151932_53F7CC51 
X-CRM114-Status: GOOD (  12.13  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

Add support for the TPM2 device on the VAR-SOM Symphony carrier board.

The ST33K TPM2 is connected over I2C, and A PCA6408 GPIO expander is
used to control the reset signal required to release the TPM from reset.

This patch adds:
- The PCA6408 GPIO expander.
- The ST33K TPM2 device node.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v2->v3:
 - 

v1->v2:
 - 

 .../boot/dts/freescale/imx8mm-var-som-symphony.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
index 66c306f755af..a77085b264e5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-var-som-symphony.dts
@@ -160,6 +160,20 @@ typec1_dr_sw: endpoint {
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


