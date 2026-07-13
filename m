Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF286C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 15:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cv3NCrUiZOIoCYhzhhtcYcbNv27YFjGW5WEfdPz9Guk=; b=DY2ACdGlQ3/36H2uEfiYIVI7IU
	zsb52HEGUwYPoqyWY0HuleA35NY8u5Mm7vD2dPSTri57rRuvpcJaioV0UDj4hJb15KSzTL9Z+lInx
	n/8ch3t90suzeS/b6mcti9KpC/5eiia9pGNaTtYoIPSxK36T5l31aeF84KabEqYDO5MzjWdxh9q1M
	OeBJoDT5p/oZtALYRLPqcnhYA8jB/7bpN/cbzq7spyQWAkcboyzeGZTSuX9Spr4FBBhVySgJYo9Zf
	pM2ilgdEZHokHUjYWT8VBfX3FAmOMlRXmw5dTaDRzvcbmI2exFJKU9U5DeqMwdAvjQ3Pp/tGA9Yug
	XPfdUjyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIFW-00000009jKR-0jw2;
	Mon, 13 Jul 2026 15:07:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIFN-00000009jEO-2WAp
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Jul 2026 15:07:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Cv3NCrUiZOIoCYhzhhtcYcbNv27YFjGW5WEfdPz9Guk=; b=pC1rWTgOJePdbUH8un9RSB3SbI
	o5EZ/H4g9yKeG09Fqd2WRCYm4oMBoRQCjgASIaeVkJgpcRgtmK9RhA2MCvOqTI/z6H+sRg0m9ThIJ
	wWB60Ul7CIeOUNdmsQ4DqfFFwcmVPyRNzSC02pjfFUGdsf8F44G8xOzTDOCLipyGDXc+dEbAP6BqY
	7FSMPzBQ78k8Fx0WjLzUDWx7C6Cu5Eup4WA/TgsRVGz6HK0jScGjx3noZtudTim/cMn77Ow+kiR4q
	GQflQhgJ5GmcoRy4IvSCaFKawYODz32wIYp4JYz/P8CFZJL2J/WQ0vEUfPVQ10pvGBLLxAvKN++Zq
	fFxEnARg==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wjIFK-0000000Bkye-2c7C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 15:07:04 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-493c733f15aso31163835e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 08:07:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783955220; x=1784560020; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cv3NCrUiZOIoCYhzhhtcYcbNv27YFjGW5WEfdPz9Guk=;
        b=tAGZRxctnovKdedGLmGUap3PghOKZBPWTgxPA/z++fs+d2+lMW7iEt6ZV+GhIgu0M7
         mTmOP+OdwQmv29rK1A4xitWUiHdsvWYs/Fhy2CVHx+nQLZ44eT3psQbHH3iu9gsgvx6o
         /OYXKQyIpttDCzLlZsVr6NihMb7s7FckBEVkE3ohZ3tx8y9YBaZiimu88sI6+qujdUfP
         Q6sgynTDvoeerRiP0ddvFrZtElCunA61kZjmienP05Z/DJ7L0a6LNAHK835zkbXecQ9K
         W8Lr2vnGkJNj7dPDFfOHCSi0uqLmw3ZDO+KYPfcEJWvQNTyF9l/paxmgyxyQYdgq09W/
         hIzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955220; x=1784560020;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cv3NCrUiZOIoCYhzhhtcYcbNv27YFjGW5WEfdPz9Guk=;
        b=NsPvP17hMlock1kFU1gbBIFRWp2mOhmb9VK+3l938L/sM3ShWYw86+3VB/1nxZyV8r
         RErqfvdvlbghQvzQvZzSw/E/qftGRwBHo3QvQqXseh2Tq6mgCIh8743SpzLuBnJbcBjm
         e8U2ZKCZDZN/knDzfmKQI94Eu7uyhlxJJqdF4hTxVD9uoscAtkj75QPpbNAYk/Yk228H
         9NAnE5mZ91H35YIjrFqhzro8wcIuV1aieRP08zi80yacKevjiRPKxLfOaETs2FqR/iXO
         jbL8VQE9+Jolssn2qRBodBYqXq1RXtiwY+5o9twmrUemSUDM9G50qRnIT5w7g7CVayPF
         cRnQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrgr/2MNd5r0KxsfqMARaivo6Grjstwap0AnPqxWwQCnfstn5FMqhuvy7Bp/RQq0+uDAiZYih7nZJ6N6yuzkRS2@lists.infradead.org
X-Gm-Message-State: AOJu0YyiuL9TrvkzPcBOQ5SlEOTO81HYKOZuR4gQWQlUHB7tmIvlN9d/
	YVTGbA269MqAVOwpA0XrJh5NquA+uy4NeLZUHUNgZU6nX1Da8U9hYYfR
X-Gm-Gg: AfdE7ckFckaUGsvmmk+IjrN85Fo4GErKnT8m2wbIIVHXu81yvLPlQRIy8y2SckqlKcG
	X/tU6+m7dUj/Sq+8GFBu6VDWYg3uWOULBJdSlTX75rBM6XUyzk2ObLrsILyqIjTYJW4V2JUSsFx
	YQhtyN1xgye5d/f112q4s2/ftxOQEJN+pQVlgjOO1jy3z0gzo2wFor5cHtr3h6Zq/dzo2/goQZN
	Do9a69MaMr1Edi6K4ZZ/riXh2TiOOlLf1S7ppK5ZKP3E9aW+YBBJZqO5EiBai3sfDOxAlRwKhIc
	ZN/S9vGccU3HHzcLUzqvym1G1jw5UL5bDdjbYI+XTPuBWefZKZBt8VnKMpX4dwYXUGwhhGbcWiv
	J4we9yL/hfCquSmkndjGWM/pCctVZ1bPCxPHWsvBFY47MvQumuuprfX7SVpv16okRyxhTba5dLg
	wfWA6u1szLIJGS6WKRxrOxG5nakymG6GH1GJumi03FXyv1gcS32HEJQX6EgWS/AWk5A8Q9PaVoL
	fowodDy6HOmwAN5
X-Received: by 2002:a05:600c:4e43:b0:495:69c:a262 with SMTP id 5b1f17b1804b1-495069ca31dmr2126545e9.13.1783955219713;
        Mon, 13 Jul 2026 08:06:59 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4635a5d7sm19389f8f.10.2026.07.13.08.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:06:58 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Mon, 13 Jul 2026 17:06:28 +0200
Subject: [PATCH 7/8] arm64: dts: freescale: imx8mm-verdin: Add Cortex-M4F
 remoteproc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-v1-verdin-imx8mm-dtbos-v1-7-4acd63db4504@toradex.com>
References: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
In-Reply-To: <20260713-v1-verdin-imx8mm-dtbos-v1-0-4acd63db4504@toradex.com>
To: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_160702_855262_49C1CA68 
X-CRM114-Status: GOOD (  10.82  )
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

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Describe the Cortex-M4F remote processor available on the Verdin iMX8M
Mini SoM.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
index 5fc177f589cb..ac450fc6cbfb 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi
@@ -52,6 +52,18 @@ hdmi_connector: hdmi-connector {
 		status = "disabled";
 	};
 
+	imx8mm-cm4 {
+		compatible = "fsl,imx8mm-cm4";
+		clocks = <&clk IMX8MM_CLK_M4_DIV>;
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu 0 1
+			  &mu 1 1
+			  &mu 3 1>;
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&rsc_table>;
+		syscon = <&src>;
+	};
+
 	/* Carrier Board Supplies */
 	reg_1p8v: regulator-1p8v {
 		compatible = "regulator-fixed";
@@ -164,6 +176,27 @@ reserved-memory {
 
 		/* Use the kernel configuration settings instead */
 		/delete-node/ linux,cma;
+
+		vdev0vring0: vdev0vring0@55000000 {
+			reg = <0 0x55000000 0 0x8000>;
+			no-map;
+		};
+
+		vdev0vring1: vdev0vring1@55008000 {
+			reg = <0 0x55008000 0 0x8000>;
+			no-map;
+		};
+
+		rsc_table: rsc-table@550ff000 {
+			reg = <0 0x550ff000 0 0x1000>;
+			no-map;
+		};
+
+		vdev0buffer: vdev0buffer@55400000 {
+			compatible = "shared-dma-pool";
+			reg = <0 0x55400000 0 0x100000>;
+			no-map;
+		};
 	};
 };
 

-- 
2.43.0


