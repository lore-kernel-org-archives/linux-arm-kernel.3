Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274B3C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 11:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GPtgQI3XYwQPKh88ieAfFq0tWd9+g3Yu9Pr17lmgPPI=; b=Cme48ELmXVtCaVV6by9X4ujvok
	ifZDNAwtdF841C2OU7jPZXeniGOiBembA7FW0f2shgJwj2qI0GicnrAQCC2hRl3Gr0p2e4e0r4aET
	JUPLjKN9xis+CUAyOxrsZQzezqsDPbU6GOSB8lxECgHafH8Ob9uPsOkHUP7tvsl5fCO5xt4YtinPI
	jroLAPaQAGzs78kPQiMYTnIGAUudSrcL9le8dFp1A8MJB0zh4br5CMameHLps5upX7YqtMN1tvwRK
	7fYC/stFLYmfdSgYXBxdZ/X1umV0SH96v498Jptgp2y253ba6fwaSFF3yOcKyhzsO7hymYU8bArl5
	lcVSGqWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wisjd-00000007QFP-31BM;
	Sun, 12 Jul 2026 11:52:37 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wisjb-00000007QE1-1EYy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 11:52:36 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2caea3f742bso25188755ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 04:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783857154; x=1784461954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GPtgQI3XYwQPKh88ieAfFq0tWd9+g3Yu9Pr17lmgPPI=;
        b=PA6BoRKH6I1+1eT/LKHJRbHWx4NrfnXQvDRWJONq+Qdb6JnPrZMFZ6QnAcc+g0ydyp
         5Hfsgj2WMkIn27JayUkBGBX2FA4+l53adMXCdwwBCxxm3TvqcIxFCnHUU5nFSN13Fbb4
         mYFK5OoOTQ9u0B6pZm62vjcdR6c8SbUd5/Hhfxl6Bhi2qFmeCk3+aZm2aKgb7srTFMhr
         EDbpOYUA/54g6lVEY2I7jD7ycKEDikOlV2GbVzYSRQRNBbTa55yittJhre4+FUaprVJo
         228/7Uq7fNTnOXB0Qvyekw1BCtg73/6Ndxb4x2wBYSL15wFgQuvc6pZy7vaftt0k3hyM
         OP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783857154; x=1784461954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GPtgQI3XYwQPKh88ieAfFq0tWd9+g3Yu9Pr17lmgPPI=;
        b=LM8CSdqjv2HUmvEicglsQn9fDVxeQNGtdXFrgERhKWS6OZkRDv9YrP7Dy/1rEfezCt
         rdHMB3/xRoBz3cgBsPp7GQqWRoR91A1lBOxPtSWnj0Nho+7dNnw0Ra7/E908Lbj8kFEA
         hUUPZ899xu8utyd8fK+o8FxmqQnXP32V64heDcGHffMl1BPzyLqV4vfdj8M805zP3J3c
         D2kCD0KjCKRah+qV33CNFcsszx0pSY5S4shqkYsCs6HdwOzgL7xOfi4s2NabZ9K66wtA
         v2MG8AUFn7N0XBiegrR2inRPVYEg3ojEZf5AIyDVxQYlpjbnLOTkFQJRg6ZSAGOHkYU7
         dITw==
X-Forwarded-Encrypted: i=1; AHgh+RrDrrUF781bB+akPVbTVIzKwPqltjiUcHwzdkwitnHMNVRirDS6oAw6pCyB1w8NsZsH5WKfH2x+qfq+fnW+fTn0@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6r/R6N+JYICXjZELD6tK4D6P9IBgMa5wW5LAo0sLmdQQ5Hrv/
	rxDsB+D3Wgl/Ch3lhjO3etl10ZbzCdbGnMsU2I488z62k4XpLzQw+ySu
X-Gm-Gg: AfdE7ckEvPY1UnJYrZqY2jtrnT3cgDV+NpywvNSbqK7HEXlCW254PJ4J8dEkBuDugvG
	Ox9k2nyEt0Qny8sl917Td6cxyPBRvycqGAYIC4iQkIN61lckW9u5EPaXR5rsKsvHry+cSDsusSR
	iyCOCaQrsOidE29XZ+6btNvo6i5lF7HGHjI9XZ/Uln3MSKVRUjENuouU07ZkEJCZjWyAKEJdP7d
	C1/1YnVCjYtyzY3xV1SzFEQMyr7H2ITsHjq242uMPLRhFyE66/lSwS5HNNdvuzHw2NIRlkThDHt
	3fD2ewZ70nicxX2ESGrmAZLVGQ/luwikBDmXzZVSJbM73C5a9vj9yhIHrxvz1qqoHBEV9e1U1Tn
	Z76/JrOLxCB4PIXfy50Db8xe1E6B6qtjmS9/GhqEspn++3omzz3ioeBCqL8n2x6sqLtO9ZsH6NU
	YUrZmi8IBu4AP/rvMeY4zOEkCoR0tO6tndLXRu1E5nzkNYCJeLCw==
X-Received: by 2002:a17:902:dac6:b0:2ca:73aa:b48f with SMTP id d9443c01a7336-2ce9f154527mr49451065ad.35.1783857154348;
        Sun, 12 Jul 2026 04:52:34 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bfe040sm84538295ad.31.2026.07.12.04.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 04:52:34 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v5 5/5] arm64: dts: imx8mq-librem5: Correct link frequency list
Date: Sun, 12 Jul 2026 19:50:12 +0800
Message-ID: <20260712115012.91600-6-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260712115012.91600-1-mitltlatltl@gmail.com>
References: <20260712115012.91600-1-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_045235_336746_38BF2338 
X-CRM114-Status: GOOD (  11.93  )
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

According to the hi846 datasheet and the register lists, they are

mclk / prediv * multiplier / mipi_clk_div1 / mipi_clk_div2 =
25Mhz / 3 * 90 / 2 / {1,2} = 187.5Mhz, 375Mhz

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
v5:
- Rename post_div to mipi_clk_div
- Correct div1 number from 1 to 2
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index f5d529c5baf3..cc5604172192 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -1122,7 +1122,7 @@ port {
 			camera1_ep: endpoint {
 				data-lanes = <1 2>;
 				link-frequencies = /bits/ 64
-					<80000000 200000000 300000000>;
+					<187500000 375000000>;
 				remote-endpoint = <&mipi1_sensor_ep>;
 			};
 		};
-- 
2.54.0


