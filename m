Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A112CC3ABDA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 09:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CYagY+dR/IQMge1Auis5M2jpDPCa31Qjss93MGAu7M0=; b=FjRckOLvHhVcR6qpV5UeJPJ4aa
	AUHSttd0LgF+x773OQFtfLLaSMOXJ3RgUn42X9DcYJqssrQfNttLEv79CdsrQBxcfRWY/XzJMqrFD
	Y+GRSfieouibe5a2GoZtJVoy8oOD29jDbcgzmoV9xzK1rzNs5+n7SEM0HjxMxW8OAIsGdTUdItCfF
	odIfYyAgA74XNDpqgT+tRjl2jWPXpY7CO8Jk6o12ulev2j2a7L3Udz8U46NHjblF9keSqB8t34/Yb
	rMeqtnX3+UPvl1W9KFMPqM6ApumDvSn9frLFFsah7Ua2uZhzZLjDwsJCqizAAqz5q4UQFVBLMz/1Q
	oth9V+Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF8DI-0000000EdJr-230G;
	Wed, 14 May 2025 09:15:44 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7QW-0000000EUeC-063p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 08:25:21 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-441d437cfaaso39990585e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 01:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1747211118; x=1747815918; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CYagY+dR/IQMge1Auis5M2jpDPCa31Qjss93MGAu7M0=;
        b=emYiA3WF4HJkAzRQrbgelDN2uIEkeLD6KquXNH9bHKOj0tv+ockOWA5oaABz4j/jXZ
         /NslVhdG61mkOp2UXu3Q/0BhD3COCzQYt1nQVSKzu0ol6pdhlBOje0krk33NkywElKzJ
         d61isg4hv1tuEpgv75RUp2o8SUo6hfAIbilMw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747211118; x=1747815918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYagY+dR/IQMge1Auis5M2jpDPCa31Qjss93MGAu7M0=;
        b=T+la6/9rVEpry/dbuF6Np5QmmvSGeTsKUV9hPBr7JasoKAxK93lGCpl/Yt0rhoiOAk
         867JWeO0XfOffhhvF5zgR/0CJfc3JGxm8Xy5evyYnk2kE6XHeZvGGFOlpYjLNBm1pqxX
         8jqK7f43zz3+Dnw2GJ8ZUtvO1s/E1i2saOgJQDAxiegVhrZ+yR+c6p0B76TQ8tUbel/B
         B6QS4UquPdoiYO3ALTQ9qnRayo1ATOJ98UlawZv6bb224H+hgoA7lHro4QD5mCq0ghgg
         tRqz2g+BT3WRSS+WPhMx0GXqibuqKWFfVfNY93RVkvUvN7y9RL5YDggVwQ6vuugBIZNG
         cm5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUzhQ2qVzharYnNlM8YhlTCT7O58pBOlg/+Is4zlvlhTu2kwNxEiHE5ayHjP43X0JQ6vraFq0APlNbcxRTjicdH@lists.infradead.org
X-Gm-Message-State: AOJu0YzHrQM967ZyL7Wi2jrQgoOc7Bk592GonoKYJyXc6GAzULGWS1Eh
	SDUyIP6pJnA0pqeKlvGCYDsIv1Y8YtWh/mSWym9rb1pGvcoAhtwQHPKuqBlquS8=
X-Gm-Gg: ASbGncsXLNVhY88RxGa9CONTxNC46pobA0Sw4j0LsCCa6OewPqlbPxgaiqiekGHPCnm
	Khg+B5oozFo12NUmnUVywfT5upVzLQn2LUeYsd530AOflzgomoElhaxAXfn+DI1LWjbMkMSg3Ca
	s8LixQWBgYoOEmrt+P3gW6IkHSHpmDuYwjpIIjYhJ06EUCs+lhK1cl2EsUl92/BxTq9bOGoKtZG
	GEow4wdEoV7WwchAJtY/Ju8McBaPhqk7yoikKtmeNpCLlzbMsBKZjPrxuaKF2aLzADgu1O+qMw7
	V/kSVdDgf1/6un7FnLPvZsxRuXETSF4kFQ2MmCq25Vwl5rMRSh6ZCv3FCzw442tLO65pWR4q65W
	OQ9+heyqFXR8R3IaZB8kvGdq2KLF88MlkODFYivrhIas=
X-Google-Smtp-Source: AGHT+IFleRd326SrUnZHoqkzu6suoQz94DWWC/XeS2n9NtmmwCPboKZ/eBmAx4ZEBG6Ntfy5At/YEg==
X-Received: by 2002:a05:600c:a09:b0:43c:f513:958a with SMTP id 5b1f17b1804b1-442f20d65f9mr19154735e9.13.1747211118349;
        Wed, 14 May 2025 01:25:18 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.client.m3-hotspots.de ([46.189.28.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebda7d2csm30987365e9.3.2025.05.14.01.25.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 01:25:18 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Simon Holesch <simon.holesch@bshg.com>,
	Karthikdatt Anantharamrao <karthikdatt.anantharamrao@in.bosch.com>,
	michael@amarulasolutions.com,
	linux-amarula@amarulasolutions.com,
	Wolfgang Birkner <wolfgang.birkner@bshg.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 5/9] arm64: dts: imx8mn-bsh-smm-s2-common: Pull Up Console UART pins
Date: Wed, 14 May 2025 10:24:59 +0200
Message-ID: <20250514082507.1983849-6-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
References: <20250514082507.1983849-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_012520_059842_8305DF50 
X-CRM114-Status: GOOD (  12.02  )
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

From: Simon Holesch <simon.holesch@bshg.com>

The UART pins are floating, if nothing is connected. This can trigger a
Magic SysRq (e.g. reset).

Signed-off-by: Simon Holesch <simon.holesch@bshg.com>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---

 arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
index de70cd3a392f..fd12b97525d1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mn-bsh-smm-s2-common.dtsi
@@ -386,8 +386,8 @@ MX8MN_IOMUXC_ECSPI1_SS0_UART3_DCE_RTS_B		0x040
 
 	pinctrl_uart4: uart4grp {
 		fsl,pins = <
-			MX8MN_IOMUXC_UART4_RXD_UART4_DCE_RX		0x040
-			MX8MN_IOMUXC_UART4_TXD_UART4_DCE_TX		0x040
+			MX8MN_IOMUXC_UART4_RXD_UART4_DCE_RX		0x140
+			MX8MN_IOMUXC_UART4_TXD_UART4_DCE_TX		0x140
 		>;
 	};
 
-- 
2.43.0


