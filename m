Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E737AFF60EE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 09:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cE0PWmhtnEqQSnWYYYOuzSEl1gB3SuYtUjjS/Ucvahw=; b=tOJjXIEPm3amRbMfXn8OmEbmAa
	Xm23vXG8ptTm9VjXnrLR6YlQt88pAx0yHGZE3EZSOEcsP8vc7aZ0uDo6mk6qDJJyiGWKd2nxRtUH0
	GudRvdnBNF9fc+eFNEuVcblIMynx4vljnIqv9W6w9vfkkO+3ooG1gnQ/WCe7M42U/w7taiWw4wRjn
	9EaQmUKwp0Ao9khb1nD6ECKY3iGB/jBXXYEDjM01DtcRBtYPaPzb/Ng9grBnW6mbPezQ26LrSmiPh
	Y3/g0JuS/9HU8GGRhPgaSVnPePS4OqvwAjp0HxNx3YB/6DBs3CtBtCZnQdbwjoPiQNb0M1E2fYAjb
	8483b0sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7VHy-0000000CgQt-49pe;
	Tue, 31 Mar 2026 09:21:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7VHy-0000000CgQm-1YeL
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 31 Mar 2026 09:21:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=cE0PWmhtnEqQSnWYYYOuzSEl1gB3SuYtUjjS/Ucvahw=; b=UYbNKMga17hMVBwkojJ5jpj7PW
	RB4rlWjJ8gkcG8Wabm/ySMTD0iNIavnpVQeA3biZd20QMNUOgdiW/wW1iNocqSjD3nEFnjBzzyWxL
	YDzvd77eGaWWBSJFQan/qdxW+zNarJS35LysHOevDOAlrYBmCiiKON5Yn4bHyNdJ4bvbZ6Yopn40C
	85flH/wNgltgWf/S5EppaVRhckvbEv1cdoq9UZIZAT2kt7AYS7wkCCdDWQb+gUKiEHYeVA1WPu2o4
	gXQYWam18uRHt4zOtU93d/2dPGHhfYy8ZrBH8l2h3JTNjF8mJ0andvHSceSN+WpO1sJk95l3teOyI
	ESsR5wjg==;
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7VHv-0000000FWMz-1D5C
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 09:21:33 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-486fb14227cso72135045e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 02:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774948889; x=1775553689; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cE0PWmhtnEqQSnWYYYOuzSEl1gB3SuYtUjjS/Ucvahw=;
        b=qJAJ12XlZ0V1CGgfgIgS+qj3eHanqri0JgLEOVtei9HXtPoqp7yd8wfBD2HLylz2cH
         riradwuDhinukGdtssbCqgBXtSMUo0SxBaLRFPRPOGOcks/nDrCexQ0YP+CC+NPj9faD
         qBznxLjlcm+lK6kpRWVB59yl/NXPCdNkkgE+HztuPndNI5Xz8kzzNdfLuxY7P3mqJke0
         pUr+VxhZjfDUplZ3tL+5vDzx/ztjoDYQizip7I7Jv1ueubk0FHVJ9p2tT8AkHebOrOia
         QmtIo5AUnlItON8kMpKIvrzQYf6ugyr2MqZrTD5LHRIInXUDYKdC1CnuhV8gaJFF2C1o
         pqDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774948889; x=1775553689;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cE0PWmhtnEqQSnWYYYOuzSEl1gB3SuYtUjjS/Ucvahw=;
        b=byztbVjIB54CmUwgheAIfRzYW2IxEQVNCg6g6cstsxxZyk0gBbSqdmvwK7UasyM8JK
         ilefDjXHRq5FVwxEZlAZkFzmh23cfiReTHLrSii0rWqmgsJKLnGuAPV+BOajhMyCKphf
         1JkYP9iUCrNePgepxvnVbVNNsn0oc23yuNl0ZJXbUj910qFBZJ8mn4AMGwcqZR1duUxO
         tkPoQMF8jWzkrQcG/ILrnfNZ1EyxvKaLvTV9WXLkk8Ls/BgQRcYyIt8BtK2SLBVKSows
         aEeo3CGkQrBz2+DMkR2gNJNChmqrQpfXepSMn1W3WaQwG+4ccrDhgYUkZXfGYHvMTut/
         0l8w==
X-Forwarded-Encrypted: i=1; AJvYcCULOX3hhJoHQqIpD3M3g+Q4s2zZ5C+bzDi7v7wnaf1Hs7iNl5ZyVN6Qd43+xfj1datFJd78EZALcuASB/hgD/oW@lists.infradead.org
X-Gm-Message-State: AOJu0YzU91l/EiHiwt8x4oDmwTrYj/LUFQLTdnEp/EFX0IPmU1RzWYMS
	cnZVwnHyQc9Z5MuhHmuKZrl40XsrdIUBj6uajI39mKPa1dUIBG2I2LPp
X-Gm-Gg: ATEYQzw1tYCiTu8RcZwJgHZaa0mjS241PBuYMDc3pJFexIFmsMhqdEj/+/JZUdpVAZY
	F/A4drAO7qXY6uSwD9KtVwLpE4q4P/xnSFob7yMyqWN/G4OlTcNOxTMd37ePWx7nA13mdXlyov9
	PjLCoO4Yj+F2h2a/W1sjkdk+SjLf7ok/G4L06Xspc62ctUyT+A+gYJOawhNWi/wQNLUn9ESl+AK
	ddn2b1i06lI3k4FDL9U8vXmNR6GTdiFHbYkMgOHO6BzQKvmZ1SSraexeopeyfS6F4q0wzbsczHC
	GEAL0zE4z6GPVPy+6a8qvNTyHUXiE54SWQLMo9f6mHnvV12cCILplf2VMDhepg/M7c4XIgayLTj
	y8dBMLimEM4xf0/pVh4Foj28AaC9ZeoNJHccUkjd7gDR72hBXhxR99JQGBd1TxjcenA3s4bgyS0
	smboRzWfXQhmcD0UajQzbiFAyP/lMfPO8qURESgF9k7iIWngH2F6iMee7DhblrlOKtYBXPX1wym
	L6Xaos8niJXZcsUn5LcQMO3JQPWJzj9Ct4lo95iImv2qG0=
X-Received: by 2002:a05:600c:4744:b0:485:4278:2558 with SMTP id 5b1f17b1804b1-48727d5a313mr266045295e9.6.1774948888897;
        Tue, 31 Mar 2026 02:21:28 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e7e96fcsm25474495e9.2.2026.03.31.02.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 02:21:28 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
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
Subject: [PATCH v2 1/1] arm64: dts: imx91-var-dart-sonata: add RGB enable supply for PCA6408
Date: Tue, 31 Mar 2026 11:21:12 +0200
Message-ID: <20260331092112.7876-1-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_102131_579245_549F0D1B 
X-CRM114-Status: GOOD (  10.28  )
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

RGB enable pin, labeled as RGBSEL, is a board-level enable signal on
the Sonata carrier board.

The two PCA6408 GPIO expanders depend on this signal being asserted, so
model it as a fixed regulator and use it as their vcc-supply.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - Fixed commit message and RGB pin references.

 arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts b/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
index afa39dab240a..3f0fd321d95f 100644
--- a/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
+++ b/arch/arm64/boot/dts/freescale/imx91-var-dart-sonata.dts
@@ -90,6 +90,13 @@ reg_vref_1v8: regulator-adc-vref {
 		regulator-max-microvolt = <1800000>;
 	};
 
+	reg_rgb_sel: regulator-rgb-enable {
+		compatible = "regulator-fixed";
+		regulator-name = "RGBSEL";
+		gpio = <&pca9534 7 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
 	reg_usdhc2_vmmc: regulator-vmmc-usdhc2 {
 		compatible = "regulator-fixed";
 		pinctrl-names = "default";
@@ -195,6 +202,7 @@ pca6408_1: gpio@20 {
 		#gpio-cells = <2>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&reg_rgb_sel>;
 	};
 
 	pca6408_2: gpio@21 {
@@ -204,6 +212,7 @@ pca6408_2: gpio@21 {
 		#gpio-cells = <2>;
 		interrupt-parent = <&gpio1>;
 		interrupts = <10 IRQ_TYPE_LEVEL_LOW>;
+		vcc-supply = <&reg_rgb_sel>;
 	};
 
 	pca9534: gpio@22 {
-- 
2.47.3


