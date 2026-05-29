Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 069BACD6E45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 10:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iBGQxOuIfjlaYF5jaV4k96kqDs0sEx4tF2C5YHnDbmQ=; b=SMkcelgu7yLf7l+UtFnqU0S1hq
	cj+vQO7CTMGJ+itz4AXZqSrp9KcuRiHbtk7WmEK7AFfQiMqSSd6SMpV8KgHzC8U3+NP6k5Ieh4MDu
	TNmWEp6XYW04gtr8pSyvVGX34N0aIu0bXzmHDTu12eSZTY64neeBcgNpOnebbzWqO/vNTl31Al83P
	xubjk5n1zoKBBLC6BRhm473DzxjSEttxiKb39rrQq1DyNFM4NyB6/PFPBGUlJMK8iUTe+ImRijmH7
	HQ6C6HFDoSk5DwnWHEHxEiZN1zAqgL1k+/81iEnJF2RF4yt4MaRmJvUE6p4YsoKBtqt5jL6QMPB9o
	pyGF/vQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuBU-0000000798p-36jf;
	Fri, 29 May 2026 10:11:20 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSuBN-0000000796R-2hXM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 May 2026 10:11:14 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-48a563e4ef7so97545445e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 29 May 2026 03:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780049472; x=1780654272; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBGQxOuIfjlaYF5jaV4k96kqDs0sEx4tF2C5YHnDbmQ=;
        b=l9V/J5mS4O6J6IUqxwvi2epx3yx3Kk2aE7qsE0xMOSjq8ZXvTzVjf7/m1U7sjn1MlR
         nm1tdDmIfEI1or12FCvq/P0uYtcqoUeP3kx5WZPHte1gy9qHeR/mK9lPpKFqLWoGvatl
         myh7AShuKPlZPGSURN0nJHmeKF+vuvS51jt4o/O3/LVHiyyraLDuzXmdmVYgIJ6z75n2
         vXKadBGdyuF3MEu/RZVzIdBj3QXLlFJdsAlWO363qdiQpUyRbi2q0ZaL2e/rYrr003XH
         J3MJtLYrFod5zsPDdZ16fwCFCWxTqEOGnNHxroqb0dbvsZzXK/Alb3Eoifp8dKKIhkz/
         KqfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780049472; x=1780654272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iBGQxOuIfjlaYF5jaV4k96kqDs0sEx4tF2C5YHnDbmQ=;
        b=oXwc8ue2vExQrG/pPjw2zJtsJwuaPLge8z+BITLdcG4K7uI8QAazDu1LQb6MTyO+Ti
         B+uO3AzaEehKFnyU2VKl7B2Dt2K8wV2Yu5S+CKtIK4mnCEIN8gOC51B4+yQ7dAOVGW0B
         IR69U0OETxs5KuybsBFf07ysoai8ehe+aJ5hGke4ch45qv5HZApRT62TSLkQK/ZM4CqI
         SUs6AR8BZGB7vY4bxoLcZKg5UO4z+X+vphpyhG8ceL3/sXkG1PIJ8/Ld1IgPEYElxFGd
         lq5Bl+Ld6MG5VBvij6/txoaQoRo79ByoLBGHAE9+sPoS7LdNvuhUP2OKGUallQlonIbo
         XSSQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ECQZreCVJsYrn68Oh/mAmAwHyLXrBdXJlbOfV2kL9AjsA1JgBtgQh+7lOshZysqj4oOd6/XdBg6C0fC6zFYt9@lists.infradead.org
X-Gm-Message-State: AOJu0YyMn3fLWgC7eZLVQWMIAiRPoE5MPXBSlMXKHN689YuiSA7AX66a
	79FLyhr0bxtfPE5TFo8O0/m49Gulc6Ec3TC8H/1lTHT9tsM8hH6t/str
X-Gm-Gg: Acq92OGxmYuHgvhogYe9w7HVocjXkRxeN/fFL1tjeEtawitxvMbeUkMPpPD+p4Z0W1R
	nYAJeuPrEbZTZa68Tu5rPrO5hD6G1GZ1k66NJ9J9mP4ygryx9BgU16V1G3u8pjLQdkROy1/5Ztc
	v3JSozeMcG27OWf3JI0aqRHz0iHGIiv1GVjQmi3vgRKrZEN0WqdyZ6LALrmaKkDc1RKTB+HhzAr
	J83D2/aXDYtFVWc1zL//uQFkEFWYzYvsdQtWDiXqhEOswFgYeGTSDtdU2JTPuwp5i2QvWR63SXW
	j5UagMn8fGhCEXQWOjbEzgkQqd3Aj8lUOuEIKSOwOMTVzVJMOvNFyoTBKy5pJyt3iVRxW7KKc5y
	zWezHlsVsCUc3skj5IR2/YCCChMcW9Ygh9f5oDxi9BnbYtp8P1yw7eOkPMVvLV7qZ30tmF9MvuX
	hQTXp+J9L6y+PKcoP0IqII5tNCyTPvZ13IsvsPVzLIiMKfDTUTtioToCY9AJ+UEom/mBxMiOTGX
	ignce4yTOHpPoLSlO0JcX/hlwzHWpzIzC/DFleaKPRQ/0k=
X-Received: by 2002:a05:600c:c168:b0:490:50eb:b777 with SMTP id 5b1f17b1804b1-4909c07267dmr44399965e9.5.1780049471356;
        Fri, 29 May 2026 03:11:11 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.dsl.teletu.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909caa7faasm34551025e9.11.2026.05.29.03.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 03:11:11 -0700 (PDT)
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
Subject: [PATCH v1 1/4] arm64: dts: imx93-var-som-symphony: add TPM support
Date: Fri, 29 May 2026 12:10:48 +0200
Message-ID: <040ad9104a8a628e3b2c18cb296a0d63d31b533c.1780049085.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1780049085.git.stefano.r@variscite.com>
References: <cover.1780049085.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_031113_703233_18DB9398 
X-CRM114-Status: GOOD (  11.92  )
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

Add the ST33KTPM2XI2C TPM device on the Symphony carrier board.

The TPM enable signal is driven through a PCAL6408 GPIO expander, so add
the expander on the I2C bus and configure the TPM enable line as a GPIO
hog.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 .../dts/freescale/imx93-var-som-symphony.dts  | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
index c0842fb3cfa3..ea996a36b022 100644
--- a/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-var-som-symphony.dts
@@ -208,6 +208,26 @@ &lpi2c1 {
 	sda-gpios = <&gpio1 1 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 
+	pca6408: gpio@21 {
+		compatible = "nxp,pcal6408";
+		reg = <0x21>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		status = "okay";
+
+		tpm-enable-hog {
+			gpio-hog;
+			gpios = <4 GPIO_ACTIVE_HIGH>;
+			output-high;
+			line-name = "tpm_en";
+		};
+	};
+
+	st33ktpm2xi2c: tpm@2e {
+		compatible = "st,st33ktpm2xi2c", "tcg,tpm-tis-i2c";
+		reg = <0x2e>;
+	};
+
 	/* Capacitive touch controller */
 	ft5x06_ts: touchscreen@38 {
 		compatible = "edt,edt-ft5206";
-- 
2.47.3


