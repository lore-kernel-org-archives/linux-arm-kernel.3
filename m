Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93ED3CD5BC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 10:49:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=20x6bk/6ulOfgyNrjZnFw6yDdlvk5X5c9JtUmQUUw5I=; b=5Bh39ZCTGUUvclWCthH+HSaXxq
	oYW5fU/HtB722VkAh7dCG+lpTM+CtCTWGGeexs2P9BKxnE1Yd/9LRH02QbZ5++Kaf1VhymZsqGtIt
	JaOa6576BS9oeTsV74Fu9yUVot3tslXrJo9M1wP8koc6zpxFKRJyy46EdM0o2DxqfmGZBBTlHS++V
	mssy5ujDVoMCsarUrizsrnwSVnK3eRSkxDvSPvldZq6BAU0pph49w6eDrkumKKLyQmxExKrs4sD5v
	kKfOMQoD0y+unxzOqQU4Y1CRgxwhgy6p+syuZQnj8NkL+xchgOjemz/4+YDXiDnpTHgLr2NXaKwQ3
	XuSGaDkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJUtP-0000000AJrR-2Gue;
	Thu, 13 Nov 2025 10:49:31 +0000
Received: from mx-relay98-hz2.antispameurope.com ([94.100.136.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJUtN-0000000AJqz-3yes
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 10:49:31 +0000
ARC-Authentication-Results: i=1; mx-gate98-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com smtp.helo=smtp-out02-hz1.hornetsecurity.com;
 dmarc=pass header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=20x6bk/6ulOfgyNrjZnFw6yDdlvk5X5c9JtUmQUUw5I=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1763030959;
 b=pZfUOrAB56ugBlhYJ2DQRXpOJReF+wlK1Kk8UgfWegjJewQvWniW1tQoA+XgpmkBZv5+XdAa
 rsP6395cCG9eAz6Ab8P+u0At5Ym6Cgp6YxjckYWVsHZaLsREdLvYcQ4ZNHdnbbWXLWbXVP1JlNL
 KbEZdfhetFRuhn5I8b21D1E722b/cWysvlSD5rGOGZHkcczdcXlGlZ4fdutfLiFhIj0yofjqoH3
 o9vE2zh5WWSAJ9GyJC8R4KEpHXR0B1RzlQYWQwzp4iqQFQC2jwCmfvQ8+KLAMrDgvyh6pL+X1j3
 GXgUdQDbZMy75laDgKzszIfAK2xWtU9hImj4FrX/1ivRA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1763030959;
 b=WYLBJWk2onBB/rkxjmaYtSm1uVYIykqH00m9tkxfA77CZuh3mOO20AYevem9tLE/VdX5FJga
 WlkCgXWEQlngqYV5gOsube59mW9VBEOSAgSH/iZdh6OmqKFspsf13wnyaD28NlBgbZes0zbAYCZ
 N5+QLKXsQUj5/AFsJP66ovLIjeNUt2LijbAzcfqgVioqx2iA7cT1/bfyyL6TyYsrMHH9AyxcolC
 35gIlJcShrxXyJZajJtXsyq9iMNtIMYxLINc37zRQDpBSKsnxWDkjvwUavPBR3GuS79xPmiyKX0
 ioCMNg+EY64drX5Xs6AaYaRqsaxYw6sq/F1+mx+UcDxwg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay98-hz2.antispameurope.com;
 Thu, 13 Nov 2025 11:49:18 +0100
Received: from steina-w.tq-net.de (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by smtp-out02-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 3838D5A0ED4;
	Thu, 13 Nov 2025 11:49:04 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux@ew.tq-group.com,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] arm64: dts: mba8mx: Add MicIn routing
Date: Thu, 13 Nov 2025 11:48:54 +0100
Message-ID: <20251113104859.1354420-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-arm-kernel@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay98-hz2.antispameurope.com with 4d6cTD74cSzJT7J
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 572a54ff1f0833590d00b461732b97c6
X-cloud-security: scantime:2.040
DKIM-Signature: a=rsa-sha256;
 bh=20x6bk/6ulOfgyNrjZnFw6yDdlvk5X5c9JtUmQUUw5I=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1763030958; v=1;
 b=dkTtPSule/XkvM3gOaObDKA4VGj1xA1AGoax0cWbYKtZgYgl4/mpuH0LuUSOCLQ1jhE8INp0
 BUSINcikfxLNoIkduyUsXJ+qsb7iQSVYKSstAqNHD6+e1JLNGqoK6DMVuy0gnhfBS7npPapD7fV
 x3LLiWigB5iwncA3uLxFtrqZ2C8XuByBMAfp/Qd8bnYPK4XCajYZnQk5/rg09PnGtxr0mssPha2
 Cs44b2+McRWkIt9oB9d1Qv/G/2ha4JT46/s6FZ4vWfAb3My5zUFOdesHwt8ULLRGHNGclltz9OJ
 10yW4FOjtvl785oBQJeU6xJNqbgsqN2Ph8c1P4SGE+PBA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_024930_130568_6909107A 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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

MicIn is connected to IN3_L. Add routing including the Mic Bias.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 arch/arm64/boot/dts/freescale/mba8mx.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/mba8mx.dtsi b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
index 79daba930ad64..225cd2f1220bf 100644
--- a/arch/arm64/boot/dts/freescale/mba8mx.dtsi
+++ b/arch/arm64/boot/dts/freescale/mba8mx.dtsi
@@ -141,6 +141,13 @@ sound: sound {
 		model = "tqm-tlv320aic32";
 		ssi-controller = <&sai3>;
 		audio-codec = <&tlv320aic3x04>;
+		audio-routing =
+			"IN3_L", "Mic Jack",
+			"Mic Jack", "Mic Bias",
+			"IN1_L", "Line In Jack",
+			"IN1_R", "Line In Jack",
+			"Line Out Jack", "LOL",
+			"Line Out Jack", "LOR";
 	};
 };
 
-- 
2.43.0


