Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EADC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 09:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S4URuhOSsv1qbc8AjA0mUMbgajYr+DySa1kGTUK9qwU=; b=oV2TB8D4O/Bo9vd8j3rzjs6alq
	YK7mrvmfv/ZKEziVDObrJ2nmU/GmZSmla7A3EfrmNLZpx2AqLv/fkbO1SpFjEUQtMcJxIq6ITcfT3
	l4+yWjT2MyNLqSmFVkA8vr7REpMOw3BpiHzMmg+ts4kKBXWHLnx/RXmSy3R3+Yw5Uc9yG2/Guhr5Q
	Cd77646FQQ1zK9Pv0b94Gsn/zETnWycYX7GRKmsRywD4max3bfFbXpvUGRydt9KV7ghjGIo7jm18n
	kzgLK8z+Pg1SW1h+LGlocyCPtvdN+l1nLBTR8E7oqvIo9EE4aqkY1G69hQa/DyghNLNQrcnK1blPe
	k3sFtvgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjS-0000000C3Xm-31OW;
	Mon, 06 Jul 2026 09:35:18 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgfjE-0000000C3E3-02wk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 09:35:05 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-493d1e8aa46so13891015e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Jul 2026 02:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783330502; x=1783935302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S4URuhOSsv1qbc8AjA0mUMbgajYr+DySa1kGTUK9qwU=;
        b=B5qjK6SzQJFvQIgcCDJVh/ZHWB1elPacCSDkUP3tSl32n+WdrtyULlKvGe3iVEYG4F
         5Har+toZlwvWTSwhhBKOt74yexwbEBCiHzmlNJIOx6C8gvmW1PsqWJOnH+CbxQafipWx
         BKFtSfbHpnkQbvmuFdfh+VDpei4g0vwJLjHdWeunOljcJ4oCQ5PuY24U4Lk0JaFP0cyW
         vbvU5PJh/25jWBXN2gm3y738olfeKjdD3OTbBnZ77rjvA4eLjf8fdsei1nIUZRKxVWQG
         GNuHqcR0VuTSELbhu12Pywqblp/OjQUzpBn+WAVMvQ0TS8HXn0ZguZAHqPQNzD2va10q
         EwOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783330502; x=1783935302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=S4URuhOSsv1qbc8AjA0mUMbgajYr+DySa1kGTUK9qwU=;
        b=hLmt5kdfB4sm843p/q1MviKtbJ7KE7yMopaZXSrGZ1acrhFA24zCWMFpPWU5mQm8FE
         NdVrSK6YyxQJB7pIVHam/tesMQCPtjpAgcuqhQxldOfhV9IEjJ2pp60hYJQ8FX20Bu5l
         C+BNZtTymK/spZNM0iHLiHVSrtERxeJXZIeHdp6gL5Ybtn/mkxO79TiPqGg4ELFW98yZ
         GTb59bF49K8M6Mg55gG4BA6R1JnzSUID37QKXEArUIF+iIjClp//FQJ/MCDkbI7tY4Jf
         K+S88OQQ6CxHW5ufvUTKWI8SwrPu7/99k9t0gFS3n2COVW9K/M7DpZNUGdEGtHMrWo59
         hy0A==
X-Forwarded-Encrypted: i=1; AHgh+RqNSS6pztQsw5vGsb8qCjQgWefJ62JxIKd3qFKfZ2p5hypVRgSeWAQIxjCKwqM0kA4NBZlfHek8W1mzvUZSD2vU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0ngm46fCwcs2yINecHxSerC7s96bYJCT9nkfBWdbr8EPSnDQb
	q9w3TnYFRb6XrIfOVlIG9+VOkrpQlONriTIBuhquwqrsRyOHSvFftsx6
X-Gm-Gg: AfdE7clYCYcg75KYoJf+v44J5TvUjAqvXYVPa+0MlEq6u3GKA2vjcUjeca5//nX/Eb2
	y1tAeJe1ptre/N92caLsM27GVeLzYNk2LjMD9y5dEZcGVYAK0smtlMoDQQfcpU/4lllXNEe77Xe
	tTZeufqViDMcQcwWFZm1WlV8eE/dT+jd80ytaSHwRU2fWQWAf8TxnL/A90cPPa92DLCWl25bWyB
	FN3/P6zJxwynoNb9E/Tb2+DlMnlXXA7q1ZMXRnFB+tMJ/9M+6QRY/iL/DO2b8oSuk3CN3hTJAMd
	IDMF88RXfrhEZh2ZhvGHDeA053lKpiRAtshyRPH/VqrNUiZuz43g+WH1WWsfOaIN0sSMNilWS0w
	p62mWqofJls2GG+qDsR8aWdnjxnEBH4TW74WBLkUOfFEGJy+QBhya+gKISNRaTqaqkfvhdoU9h3
	gknXxDOE0OCuGd3hAj+69/T/IHWT6bjXO7+EH0b9BMVmpHxRlcQS3916Y2TdCjCapwFas8W7TeA
	vhGiIL6Hu0U7PKHOy1JA5mxHQ==
X-Received: by 2002:a05:600c:8715:b0:493:de4b:de17 with SMTP id 5b1f17b1804b1-493de4bde72mr8048525e9.14.1783330502365;
        Mon, 06 Jul 2026 02:35:02 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-65-248.cust.dsl.teletu.it. [93.144.65.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c6375764sm314379715e9.5.2026.07.06.02.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 02:35:01 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 10/15] arm64: dts: imx8mn-var-som-symphony: Add TPM2 support
Date: Mon,  6 Jul 2026 11:34:40 +0200
Message-ID: <7cd17d03fa70ee1f5fd5986fbb0e8a39ad7b4fbe.1783330236.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783330236.git.stefano.r@variscite.com>
References: <cover.1783330236.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_023504_160720_7645010E 
X-CRM114-Status: GOOD (  12.07  )
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

Add the PCA6408 GPIO expander and the ST33K TPM2 device node.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v1->v2:
 - 

 .../boot/dts/freescale/imx8mn-var-som-symphony.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
index 53130b521b5b..7d016ed5e911 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mn-var-som-symphony.dts
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


