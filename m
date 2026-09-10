Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E8DDC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 15:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHoaVug1Lx4d7NCtEru06mZWP8AQ/VN7bfbLwwo+zA8=; b=osw2DXN5ex/GRF5hxa9pZY0fO8
	ZKu4nPNZJfui7Y294vmydLkn7iPXHuIP75QuqG3Aahccv0AOVDDUda0LLEzGdL6rqu2Y+s9sDHHxQ
	feS/ic2VjvXC7St/lRcDnjDbm7o0TRpZJILKW3GF0+wDbfadIuQ087dGSezkxfHlJ4U6LvN5090n5
	v31m+WQe4mdQPtkDtZa4yLxdmouFzAzRYvDSfBTfzFU4pEMdY/H1O03BZkxtDKODaKtebxnvo0riy
	f7OiYCZ4P+AASkLnw7Uw6LPD9WgQtRDAYkEzWaHQOfcCr7EBOA+1jzqc2qCXAk930x7wwQyBfnvc7
	YFslz8Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gqo-0000000Eogf-1syd;
	Thu, 10 Sep 2026 15:38:10 +0000
Received: from mail-wm1-f42.google.com ([209.85.128.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4gql-0000000EofZ-4AGZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 15:38:09 +0000
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49d0da752ffso53884605e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 08:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789054685; x=1789659485; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oHoaVug1Lx4d7NCtEru06mZWP8AQ/VN7bfbLwwo+zA8=;
        b=oQzh/VwC3LD7UK7c/J2VcnhLog7YYpZ+jxIDiDjuPtoNyUnsbA7fvpM+Y1Dw/tOR+J
         myBEll/UDljL6FU/39gUApY8yiR/I6afMCPIiraaddCnUA+E7sqm9WFMGg83kYj1rZPx
         5THTr6SjtKX86DgLbRRV+1G6PNlxOwb0LcSsqSKfc2mCCFGNx3Bu6qjPtkLPqc395vro
         FaXKNKZm1TIa3G+c9tJKnkIMcQ2jCRw4YakumKQbTNCQG3wRZHfLELrioMaiCsZZpArg
         WCJuptyvxrNg/odD0+ye+IMlfhkW2TXqDORyH+YL00N0J9JtMkuix5ueCiv2spP0QNt5
         I2JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789054685; x=1789659485;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oHoaVug1Lx4d7NCtEru06mZWP8AQ/VN7bfbLwwo+zA8=;
        b=hV771zmoSAljbfnDIoFcfucGrJ8wnGC5Sahf9POgUKGM/SkWUm+7n1bZ2NfiIRx8P7
         qZt6LiAvZwbnV1w1K68OeAzW1pvDihwwLapJm5KFg6XJIc5w1RK1lq5UZrRhTPSPrdnb
         5aUV3jhPlf8oSvaxqNDm+sgfp7EAmYP7mNwty7sdOiS9K7ZRyEw3Yltf4JUPzWJWbdg5
         f5q432MmCt87Q1SZMSkyxtJZAdShlYfC96W8kr3e6kLI2h6DOvOW8y5nyICRqTxTgH1F
         TyTMgr9m25Tri5p3Dh5EikXdzaoemDVKEmNjchjohIlVey8RL90epgTWcapHMd8KZsEI
         g6vQ==
X-Forwarded-Encrypted: i=1; AKwUvBzowiA9OOY7UKDHVvzCosPhODY88dL67pSoEUZzqnK3L+vPjnw+5bdR8U5HLQADu591SZhsgytY+zK+mj5+tTKW@lists.infradead.org
X-Gm-Message-State: AFuF++kFOystyHjigNIUnHOZB7v+d8LLKqxQ1hXsLNa0XdpcIlmri8IT
	ikVyykHbvQeVCnJwMqKL7WvqWV0S3YoLR8WaxltBSiqWeJHXFTclNoHg
X-Gm-Gg: AYBFou32FobVVZTS7ugY1slT5YKXjCkxyjrr02GgZvuYiV6uuB7b9Gp2JXTicwkkG1i
	e40bV96EktMVaJVrjW5+l8jY3PB17gtA/isBnGYGA9XLQMsbSWdzkDYptbDvj+AndsORISDup+7
	N8UbzJscnaGgLhRy1wxJp5kXBWjtdSG1KdWt1guE6u+CvrEnOItZFIE+sm9fqphSwYoXXFdI0IM
	ZQ0Fbba7q0s8KXR/CKs90/3wNCpeR3xZNJQ/E2bcRXNaStsIwY8iMW3YgVLpTvkWXSpIAVQIAYR
	anK4x49tGFH0YxoYf4hIlQPtab1OIrYW7PVMnV1LFCN0p7j2Vf0SGmuoyIH8JAMLmvwGgAMs4xv
	c0tC1QqdExGJ/Bm7VQOHor9aTRWGR+dM9fXWKSD6ail9r7x/qBFVmzCBPnyCaGpHTu8o+e+1hVO
	yA+HSrTcoTTvGMUUfl5x4k7wST80sv+O3LsaQVAASVmzHx9B8j3kqDA+BVul900KslbM2mp3EEI
	xwEhznCPwSPS7w4PFA01/iZAX3JO1DzYBqRBveiQm3/37cXZYHA/le8PoZkJcEWIRT71/NMQw==
X-Received: by 2002:a05:600c:c4a7:b0:49c:df2b:15fc with SMTP id 5b1f17b1804b1-49cf823d0dcmr440541835e9.8.1789054684861;
        Thu, 10 Sep 2026 08:38:04 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e60adaee4sm3390545e9.14.2026.09.10.08.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 08:38:04 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 10 Sep 2026 17:37:57 +0200
Subject: [PATCH 1/6] arm64: dts: freescale: imx8mp-verdin: Add Cortex-M7
 remoteproc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-verdin-imx8mp-hmp-camera-ready-v1-1-3c9349ecdb9f@toradex.com>
References: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
In-Reply-To: <20260910-verdin-imx8mp-hmp-camera-ready-v1-0-3c9349ecdb9f@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Francesco Dolcini <francesco.dolcini@toradex.com>, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_083808_050314_20A816F7 
X-CRM114-Status: GOOD (  10.87  )
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

Describe the Cortex-M7 remote processor available on the Verdin iMX8M
Plus SoM.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi | 33 ++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
index 9fee2cf9ef54..45a4713c260f 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp-verdin.dtsi
@@ -77,6 +77,18 @@ key-wakeup {
 		};
 	};
 
+	imx8mp-cm7 {
+		compatible = "fsl,imx8mp-cm7";
+		clocks = <&clk IMX8MP_CLK_M7_DIV>;
+		mbox-names = "tx", "rx", "rxdb";
+		mboxes = <&mu 0 1
+			  &mu 1 1
+			  &mu 3 1>;
+		memory-region = <&vdev0buffer>, <&vdev0vring0>, <&vdev0vring1>,
+				<&rsc_table>;
+		syscon = <&src>;
+	};
+
 	sound_hdmi: sound-hdmi {
 		compatible = "fsl,imx-audio-hdmi";
 		model = "audio-hdmi";
@@ -185,6 +197,27 @@ reserved-memory {
 
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


