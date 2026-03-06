Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E088FCC062
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 19:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DQyi1SlQ7yqSFVYKOlrAnDhopzWugvynZ+QL9xEDhOk=; b=xkRkIzlhowc7tCxeAb2yenngIP
	RSorZQHHPAkWp4G9FqaVYN0reTQ0MIcjxlhGBTorde6u6x6TUTO68dSiwRZbQJ5EyqOrv4tsu378d
	CG0jmS1u9Cdu166nBgUTEGvCCCASmeTbLvz6lxcKpOIwez9YPQTDK7vlBoEP5lQS69KbSolOkwrTa
	2OJqGl5bwYp3JuP96ZjkyBYaGOJh6ACFZudXu89PxuQvkd2SjFD4i3CeqGa6irQOqkJHFakpCPI9v
	vQEEoNsnKPCF8jGQuRtmRFAd0lSYLxmfNtfa9STaJ41oKpZ+W/XdorS5RIeZvf3DYvA6zCrtfsrSJ
	VT+32F/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vybK7-00000004Qnq-0woF;
	Fri, 06 Mar 2026 19:58:59 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vybJz-00000004Qe7-0ebs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 19:58:52 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-439c5b40f60so2991810f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 11:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772827129; x=1773431929; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQyi1SlQ7yqSFVYKOlrAnDhopzWugvynZ+QL9xEDhOk=;
        b=Bx/tuAno5YDM1TbbrHkTtSrXhEP33o3Lym/7yw4/YoGh/x7kt/O2YVTgfG6ajwpAZb
         iu7v85t3qc4tYKp0dfaPbRQA+AN3rdL6BzygZHk93v+jvxpgO1E82nDTSN6CA26TUtLG
         B0FM/DAkb72k0Ju8uz6l37BFvEurnhgrLf3KI0E/112rgs25IuV5goBwOqISYS/o8odA
         e6SrEga23CL+Km1DKfFKLitKHQ5yQy+WFY4p+E3s2zQU4ge0veaQG3A65Vom7robg+5P
         K5ljjkLXCOaywkyNOKBcS9Z+Wl9aCaFDbaz7m/gMejI7FFxD1bIXcghTcM4WtLHK90JE
         Z4bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772827129; x=1773431929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DQyi1SlQ7yqSFVYKOlrAnDhopzWugvynZ+QL9xEDhOk=;
        b=LqhxVBCy36DKsPiFFvUMkLP9Wtx6DVQexntZlQcEoapQwiQX+dt8grSQYFXOIbdvI9
         JFFNRFJf4mCm5iSNz3i3zslKmuz3eiXeJyDmBeVPAJXng+4g7v9o3DuQgZQ/EXQDlZ56
         05YgZ4hpjHqvXwjWHBzASoKqxIHJv0aDkmgANlQl6QAutHuXxV8NNYEFwSTVrnJA0bvT
         jpYZ1u56V7pMj43gy/Sv7Vw0F8XTzbL8zzbuK8fYwCw/WfOmmoK8cePYy2VQFamc3kwy
         FS25RONLmSj7s8eMvP9TxA9/b8R6hWSWz/as8lmabqUsRJ75RndZsVD9V/PnbQfR11Sw
         0D0w==
X-Forwarded-Encrypted: i=1; AJvYcCVmukRQSeS2eaUi7rPRkVHuHnwmzpv6DoQR5cJRgCA0hYHL98oDndR/o7dLGbqx+jKCPwSvIlazdqaFnjOJg+7V@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi0vqx4ENwsUsL1Ks3DFl+TSpOsEc47XCkSzSaLaFJUiENb+oO
	Rfa100Wj3OuuB5oUECAxh81ANiwIci8CcJnpOWiJu+3o0twAOC19CMq0
X-Gm-Gg: ATEYQzyekeofKF70r1HcpQDYSL3lVkl9wfUEQ6qLpdh8g8ju+n7yn53gd7byiqb0FP3
	bp3sbB6xwmx2hONvxscdVANWJkuz6tm0j60XIkHAaf0sfO22qrLPHaHu/7FV0ujPoiCTEMS4yW8
	dRNwqfF7FAhGt8GvkZqV6hIlUWzOiZMVoJeGXW3isoFN/q8eRsa8a6YLwOa9WviYNGFEMipfylY
	S8TPMyqlTTrJJAGLqDGRfxZlHT0sbzJ5p2yQl1lNSWS7qA8NOFu5cKsNA7v+TTvbGzipYGRfr4R
	6tpxYGS+et2HGcotVY7yc8KNjVOQmPok4k26xXxhelOU+YgGlMUfVwvKc9OmZ98rh5Y6HXO1oIH
	sxgGhE449JaVUzmjW2Ay9Mn1MHCVKK9VVeCQ6+CH9sxdD4KNW6NHmlQldjKprgAoZwK2L2+N8iJ
	HuEVOGobyhPHkc1j7HmQxrZZrC+5pyjahBpuh3/Ud/QSbkMm3bTQjm0Uq1Lyc51dHSVM0vfVmRv
	pzr50yQEk5e74fwJ+zYGwfPRVjb9+1hvkgyzM5DRfWtORU5Nw==
X-Received: by 2002:a05:600c:1c03:b0:480:1dc6:2686 with SMTP id 5b1f17b1804b1-48526930d92mr60341145e9.13.1772827129080;
        Fri, 06 Mar 2026 11:58:49 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48523803b5fsm25167265e9.7.2026.03.06.11.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 11:58:48 -0800 (PST)
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
Subject: [PATCH v2 09/11] arm64: dts: imx8mm-var-som-symphony: Add TPM2 support
Date: Fri,  6 Mar 2026 20:58:28 +0100
Message-ID: <72e21074031d16153460e128f8f37b8c942aaf30.1772826534.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1772826534.git.stefano.r@variscite.com>
References: <cover.1772826534.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_115851_261864_EF35227D 
X-CRM114-Status: GOOD (  12.11  )
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


