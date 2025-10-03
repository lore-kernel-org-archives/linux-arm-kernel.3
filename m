Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765D4CAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Oct 2025 12:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lYgyMG07VqTYH5jn/t5TCThG/fj6xAJlnS1AF75htXQ=; b=kEAa3LSXosJjSy+HfSpPUOw1qr
	49kPLKpipp4RuTHry4AnyZkYYOfkBHtjqhqk0GLVV3GJrr28N0/9JsExVmQzbdk85TT/EfwXE7bBG
	oLXgkoI/p1ivPb9MYz80aiqycyTmEMJtXGFSYSFK/xXS25tYS0vbtaFvpzZo3HVTF2uQtPuXLGOAu
	dL5Yns83rbZ/jUdIPmeCZwAvrZeqUVUTm8sPh2OjCByAdv7/PWbfnMC37WyNOgVoeR6DxaSZ+UjRh
	cVbSTXYAv4pcoNtk8J6GIKwputVaRZtEOFmkE1gHgvLmCHSz2qcJzz5LSPeBuFCbrZsdj32XcpzDw
	H9csZTnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4fFd-0000000CIko-0gOI;
	Fri, 03 Oct 2025 12:51:09 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4fFb-0000000CIim-0ecN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Oct 2025 12:51:08 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-46e384dfde0so24027915e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Oct 2025 05:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759495865; x=1760100665; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lYgyMG07VqTYH5jn/t5TCThG/fj6xAJlnS1AF75htXQ=;
        b=RD0s+l+KWXXDCSjX3nwdH0d/sxDsSVTaL2EE6Fre1DUPDbIi6PBeSxoul27LaS2X9l
         vZxoHmjHBA8QeY7gs45iEJ6r9F6J6v4IzMSmMGWkdMH8g/WEY55fA62TEdAqYusv7zeR
         mC1/neV5aj6cllPwmn93eS8L9Xd+nKV6N9sc6IotKkEDxWNLGOSDwykT4ZI3xcghFIjg
         Nla/lo7LDGXrGjdP1D/Ma35HIdOVII2c6VxhSPQaFMb2r9rzZte6NMDh0flsTjvYaHy0
         6lNLgXxRKADsUXCYitQOgcSbAY6G0/xLDJg79zt9YaeRohbPiAL6p/GD7ofYdI97wvbb
         hvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759495865; x=1760100665;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lYgyMG07VqTYH5jn/t5TCThG/fj6xAJlnS1AF75htXQ=;
        b=G9Z+Mi/8adE2lbss6Af8Ed8PRGoub1Ls6sCBZPngDCOfF0jecltO66+vZ6anCu+LPe
         aUoa/4Eg/+aUsAoxUQ8x5gBBZvGePbMwTx8myKZPWFLwyNT0wkIxgYZTdAMN8UgCbujo
         uDkYcbNgEKU3rlJTa1f/ZNSZbEaWs+dg0yMtqhVIub7sPaLJaZ8trgzyYZjdTAwvd0uY
         /ZWA/SUTNzNgudFijdsgYTkCJ9HPIH/mqYotk21q1C+/9V0ml4d9QBLWO1xoQfmT0OsI
         mRXHROAj50I3clIczEWTbxV7o89aUDkBsMZL1bBph45VRlTUakAUTazx0Fhd6zh6N2SF
         DJ7A==
X-Forwarded-Encrypted: i=1; AJvYcCWJpvht1OXcWqkUkCcof9FyqZN38Vslpp8Sxt3d2j/hJk7QKKmJhL6ppT9pGDQcKenxP84hW2bBb8tsrHyTD3KX@lists.infradead.org
X-Gm-Message-State: AOJu0YxHR9eXODYzCs5ygj04qJJ9+ZNvy7nrqCR0LTG2Nt6bxYATwe9f
	reQcmodbVkepBhJtfnFrkF0LvIeLcLz/zco9gaoOoh9eMmgB4evESudc
X-Gm-Gg: ASbGncsFuh4ijWhVSKUWZRc8VGiWZgEzNWgTjJEEi5/NiCBDDvRDZXT+bW+D2I3Gatf
	bdz8M30Y4b8nzw6LlyECdOifBIpUo2AcfBhXa8r1VndmQSnY0qT3bgstBO14qm0p+OtHDZxksgk
	4a0nIvqG/LbC4wZsFqW4arIIGgau+0Qg9nyr1Kngi/7PSGpKzgx0aNPU+rYWHHwvOydwJpNDAgZ
	lfxIM+P6qDfLENfL9Hoyr3+KL6UOk9lPuCfUSxAfw3tZEd96b4fQVAyI2BG6e7b+pFNkkxxXNHe
	idkt1cF0lvR1hAuegC59EY+tR5DIm5DYg8OdYGdLCW1v+3tbQuJkj7TTnD6u2NOAUj5Q7rMmrOc
	K2VXkqSEcTfUAh+c4Ouc16B7H0Zw5akK5+/Cmk+a3T5ntCnnhd0ADmxv83+DY1tfjMOZnXA==
X-Google-Smtp-Source: AGHT+IG4L2xBls0a2hrXeyuJrwzw+WfFt28AIUJ+Fp9Tp8p1FnhMDnBRj+XtHMpNn4kg611dyop0Sg==
X-Received: by 2002:a05:600c:3b08:b0:465:a51d:d4 with SMTP id 5b1f17b1804b1-46e71101a79mr23090835e9.6.1759495864829;
        Fri, 03 Oct 2025 05:51:04 -0700 (PDT)
Received: from localhost.localdomain ([37.159.33.161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5c40983asm80598605e9.3.2025.10.03.05.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Oct 2025 05:51:04 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.radaelli21@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 3/3] arm64: dts: ti: var-som-am62p: Add support for ADS7846 touchscreen
Date: Fri,  3 Oct 2025 14:50:29 +0200
Message-ID: <20251003125031.30539-4-stefano.radaelli21@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251003125031.30539-1-stefano.radaelli21@gmail.com>
References: <20251003125031.30539-1-stefano.radaelli21@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251003_055107_215006_0DDD7E08 
X-CRM114-Status: GOOD (  11.90  )
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

The VAR-SOM-AM62P integrates an ADS7846 resistive touchscreen controller.
The controller is physically located on the SOM, and its signals are
routed to the SOM pins, allowing carrier boards to make use of it.

This patch adds the ADS7846 node under the appropriate SPI controller.

Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
---
 arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
index aba72d0b767c..fc5a3942cde0 100644
--- a/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som.dtsi
@@ -322,6 +322,30 @@ &main_spi0 {
 	pinctrl-0 = <&pinctrl_spi0>;
 	ti,pindir-d0-out-d1-in;
 	status = "okay";
+
+	/* Resistive touch controller */
+	ads7846: touchscreen@0 {
+		compatible = "ti,ads7846";
+		reg = <0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_restouch>;
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <48 IRQ_TYPE_EDGE_FALLING>;
+		spi-max-frequency = <1500000>;
+		pendown-gpio = <&main_gpio0 48 GPIO_ACTIVE_LOW>;
+		ti,x-min = /bits/ 16 <125>;
+		ti,x-max = /bits/ 16 <4008>;
+		ti,y-min = /bits/ 16 <282>;
+		ti,y-max = /bits/ 16 <3864>;
+		ti,x-plate-ohms = /bits/ 16 <180>;
+		ti,pressure-max = /bits/ 16 <255>;
+		ti,debounce-max = /bits/ 16 <10>;
+		ti,debounce-tol = /bits/ 16 <3>;
+		ti,debounce-rep = /bits/ 16 <1>;
+		ti,settle-delay-usec = /bits/ 16 <150>;
+		ti,keep-vref-on;
+		wakeup-source;
+	};
 };
 
 &main_uart5 {
-- 
2.47.3


