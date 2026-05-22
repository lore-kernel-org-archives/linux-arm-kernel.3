Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0137CCD5BB0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 11:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mLmi76zOx0QuQbmnSuX5CmerIhmQV2urN04KM4eTNG4=; b=kPJ7Z+N9nmBKnc0uCaEb02VW80
	00o5fT0iQeE80nD/+o6tDZm85w9NGpJnDkDbVWdWLycwwff2TrPby6TJ/h51jRpdMCHM3J0tsWs9s
	7Rscq8YtAo2Mo+n5WEHZ192Q+rUh3ziSp23wk7kjQKvAOR9LzXaLUynvc561qCAsU85uI4EYgGzrc
	tsCXuhRW25pcR2b0dM7ijG0gHIf6Fc+5Tfkc84b2D7QztApJpfQjAjd6a2DAlsDWb9H5/G7iF+Q40
	3f8SgRuwnzZsnn1qgsB4KaCBweMFGx+/JBNjuP/RjeMFUbYndofg4ca7AgCal9ZY3fm3LxluM6BA/
	lt7MsL0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQNvt-0000000Abxh-2Ohp;
	Fri, 22 May 2026 11:20:49 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQNvj-0000000Abrh-2TrD
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 11:20:40 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-490388fd0dbso16616185e9.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 May 2026 04:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779448838; x=1780053638; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLmi76zOx0QuQbmnSuX5CmerIhmQV2urN04KM4eTNG4=;
        b=m2KqUKOziCIjpICwHk2PSNDUaPfqQZELn+/tAfy/mBxFnwOFp56lguQ8DuEiEFQydz
         W3LVb19IkVZfS/JXPUyuM3pe43PmqW17gQGDKmpGcM4r1mmPex2PHARizu4lEf0BNVmW
         +3lalEmoiLcjd89bwgMdjO2R2CJMH22xinM7nf195sIo50WPJyX7qGRY4YUKS5j3G3lx
         NI5xXvm4Y11at9nib52+VJRp8W8BigGWXH+FqQ+G8TuMvCR3wdhs4Jqe/dqcr8+9Tw5z
         5NaBGFNhFBKRq8wmrnUZvd98cbSJmZcLFObYBIhQsK4FXKFDJ5GsM8joHq4NliOE7zK9
         E/qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779448838; x=1780053638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mLmi76zOx0QuQbmnSuX5CmerIhmQV2urN04KM4eTNG4=;
        b=k8zFu3t0xWBrOheXDeiuLi21XMzTsKlG3QUKvGESMie5Dxj9hqEU6eJt970/2T+a4k
         41AI7M7PfSvClwNyW1XWXiaoh3+8JrfJ1w3yhhMix28qx4ksZmUsoWwiEpgfIj19+iaS
         R+GoRz3PfzjgKGGZc8JEcUpAIL0mzshK1spiRCNUD2EOizDhQtL1YCPVISbnV0AkmXR0
         DjYGYjsRgxC1YladaEmVStmD3ExqifSebePj11HsbXaRnhJtqkNUOmXOWMtpvo4lzQao
         s/5/aSnvjxZlFKg6R7s6VwEJ69IExoqwQwJ4JsS/ufZPxR+PICUm7fLWN4Ebb46Xv6w8
         xBaQ==
X-Forwarded-Encrypted: i=1; AFNElJ/4wyD98X3dmfoKn149E3d0jOUY5jg9pQ7KOA2HgBQZzrti2TWLeA3SDBidv6qu0n5IDWDfm4k7x0g4W2d/wp28@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/l8G150sSY3D8YITUHJ694XOnrEonu+3xp0+jPVq82UbsynlN
	udC+GZPEffbaYOqr5cW+r4ask3sVI/eNOCQV1bgUvUP06pG7ahEnz+pm
X-Gm-Gg: Acq92OG8X5lPllTt29socQtgjihMKvJRH/qCsqyO2AjTATMGCk6S5xRuQwlwxtbzch7
	vOPAq+dfOEQ6vhC65SrlKKnHtd/zSXVMhZz1TxO0syYua2SVqcu9khIMVWy7nCL3I++aMfDCcxP
	nI0YGmn8kgUHCUV3RBCfSAIixvoQpoA9yNl3yd/7QZPDaPCdBJ19dllEqkw6S4UEJUgbIn5aX73
	4P3IvvW+Z5UHiIYkB7J3dgfW+Z1IfUHLT+NNsIVuNGsGN+v2fnrW8EPZT+lmoxsz9MnbD2cKejv
	Tt+L2IIbtP2dUMyK/WTzKCW7Yok4SFd1zokCrgua0yEEgGVjva/r8MPn8D/b46ZBO1P2n/nfY8r
	LqBlGn64jLS4YOXe+juUpBiNLbuts8VrDKYX3FHGD33wnMJnXQjFr03gVVMfN2mthSazQQLNrin
	yyntSy33CDW9DMFTjU71ku+Ea5FsTzuEsV2++Hxz3D5fsy6by+BQ==
X-Received: by 2002:a05:600d:8450:10b0:48e:82af:d9 with SMTP id 5b1f17b1804b1-490428cc11dmr30590335e9.29.1779448837574;
        Fri, 22 May 2026 04:20:37 -0700 (PDT)
Received: from SMW024614.wbi.nxp.com ([128.77.115.157])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904526ca21sm34388355e9.3.2026.05.22.04.20.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 04:20:37 -0700 (PDT)
From: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Fabio Estevam <festevam@gmail.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] arm64: dts: freescale: imx95-toradex-smarc: move CM7 node to SoC DTSI
Date: Fri, 22 May 2026 04:18:47 -0700
Message-ID: <20260522111849.783-4-laurentiumihalcea111@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
References: <20260522111849.783-1-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_042039_648407_8D2E6462 
X-CRM114-Status: GOOD (  12.29  )
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

From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>

The CM7 remoteproc configuration is common to multiple MX95-based
platforms (e.g. MX95-19x19-EVK, MX95-15x15-FRDM, SMARC-IMX95, etc.).
Therefore, move the node to the MX95 SoC DTSI. While at it, split the mbox
channels using <>.

Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
---
 .../boot/dts/freescale/imx95-toradex-smarc.dtsi    | 14 ++++++--------
 arch/arm64/boot/dts/freescale/imx95.dtsi           |  7 +++++++
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
index 7d760470201f..c94a63a3bf8f 100644
--- a/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95-toradex-smarc.dtsi
@@ -145,14 +145,6 @@ reg_wifi_en: regulator-wifi-en {
 		startup-delay-us = <2000>;
 	};
 
-	remoteproc-cm7 {
-		compatible = "fsl,imx95-cm7";
-		mboxes = <&mu7 0 1 &mu7 1 1 &mu7 3 1>;
-		mbox-names = "tx", "rx", "rxdb";
-		memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
-				<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
-	};
-
 	reserved-memory {
 		#address-cells = <2>;
 		#size-cells = <2>;
@@ -204,6 +196,12 @@ vdevbuffer: vdevbuffer@88020000 {
 	};
 };
 
+&cm7 {
+	memory-region = <&vdevbuffer>, <&vdev0vring0>, <&vdev0vring1>,
+			<&vdev1vring0>, <&vdev1vring1>, <&rsc_table>, <&m7_reserved>;
+	status = "okay";
+};
+
 /* SMARC GBE0 */
 &enetc_port0 {
 	pinctrl-names = "default";
diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 3e35c956a4d7..f8760ac067fa 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -272,6 +272,13 @@ opp-1000000000 {
 		};
 	};
 
+	cm7: remoteproc-cm7 {
+		compatible = "fsl,imx95-cm7";
+		mboxes = <&mu7 0 1>, <&mu7 1 1>, <&mu7 3 1>;
+		mbox-names = "tx", "rx", "rxdb";
+		status = "disabled";
+	};
+
 	clk_ext1: clock-ext1 {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
-- 
2.43.0


