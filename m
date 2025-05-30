Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B19C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 22:24:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YqOT/fzFZhw9tODgMNpZ7Zh9gU62VfKJbyQr/u6ucPo=; b=LfYymLqT283NXFMXGfUD1pmByH
	gt11/iU5ML08+Rz/hNRJnZwaErtKGESQWS2XpCrdEiBZb0kl6r4GSxVDo98KrAXiN/xvQZXlTmbNq
	LHd/37kAPkW2T/qQrT2mO3OX578DXQQTsRtRQIVxj99jIKNGri0hyP+SpVhfPDci5TEtSgqeRpyfh
	/H2sO77cDQOGie+kwKdMCubhHp1a4VkhRcJxSEz6tREP5qwP30wXKqHi8kgSGy7TGGPv5phFkqF3W
	Roqc0h+ygB5AX5gqnr7sKYKzKCwnp1kPGCTcMi3TkbBPpjb8/KSXK/HqzB8vIXMxzkTHU0FLE2B23
	WysztjeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL88t-000000023Hv-2Ai8;
	Fri, 30 May 2025 22:23:59 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uL82Z-000000021Yc-1vHZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 22:17:28 +0000
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6fad4e6d949so5386866d6.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 May 2025 15:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748643446; x=1749248246; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YqOT/fzFZhw9tODgMNpZ7Zh9gU62VfKJbyQr/u6ucPo=;
        b=DQOkFtBqFazP1BpA0K0t1vM/60iDvAhmiHmkda2bPHTQxV4f6i6Y3VA/sW2ZqX7gdW
         R2od4cl7+wv0IADPjk4jqePfgTfE42d5yGGSMlPRLCvtTi0dWH2CMkMzhhWrQIEv52Gf
         vsMal/rTIgA7vxjx2qtyIzxJy/+be/trie6qQzaUJIDaCLSeEKs0EnnI9eQxu8v9MFXy
         bHvWV3lnc2iZUgVqifbDNsYLGKbRFqXW+HkwCcl4ZYT4sOxIxx2aeu/0oQFD/oZ5bghv
         kXqsQ2DRY+21fQsu1ZqfrVKzZvkmR7TnRsyRDrP0gCFupR8sbAQ0oS0T38QiedDOGE/z
         ckBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748643446; x=1749248246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YqOT/fzFZhw9tODgMNpZ7Zh9gU62VfKJbyQr/u6ucPo=;
        b=NMilk+TCtprL9xV+WJksyNbYxoYYMW9e7RRzxoelwiMzQDnQHYfXHCfZrqFIiMSrhu
         lfhbuBnia75cBMTXy+1rnXfpkOFxQKL0gsISeR8JlRsLMT9lc+3C+42AhXmWrduQ25nB
         9g2QF81Qi2O0Fan/fz173OaQaDPsQSweZ4AcudIdAInO0yY4pevB1smSxqqDaoV/rePM
         P6hCXH2YB5JytrEBA3xXyExtRKshSLeB27qHXC277ShDWwRJ6OnoINsAObARHtOq/g+f
         5KGLH9CV3D2IMaenngotAJ7j33s7R7U6NEUl+PfSci5K9VZGlQQUXTWDUH2pEMQzfowp
         TlzQ==
X-Gm-Message-State: AOJu0YwXsMj6XM30Uc5ZIgaF3efY9L2zrJe/aj7w3WDIWc0KylcvOHwV
	QfvOusqj5N3UpBrnlyOZu5bczYe04HFLyKe/mV8jwWRKMm5BXe5mgKhFeHA4Ew==
X-Gm-Gg: ASbGncugovl37qfqFDssITlE3cOtu6+jSV5p/d2WKT1VeGBMsVCzQTBAGGoHZZBji32
	cGj4kgPU9uQW4rEDYFbjBZyUsia6rBqR56UXP6jf1AtbarF72nubZGuKdLRDRmNphK9XfoZ8krW
	G6dwHCfDLhOYScg5EIkXd/7lwsXFA0alb3Mwt9rNM9Pkfu4WENo+OK3zjwm48ctpcz9aM9vAd3i
	b2hA5szGj/RiHiOW/J0KaJsOeQ4p7dIifX7qiWi0daLUkxnzAQPTs5a4zP6PPMcrjD8vLrS+93f
	83+j43g8dqydCnle7/ui1I8X3sDXu1P7h/IJxdQ64fxJDvWAVCqjSs2jgwpyvZhMwHcK7ziTOt7
	l6Ay8j7bLcwq8WKOwkRnSv+qvRw==
X-Google-Smtp-Source: AGHT+IG5/kDcd76kYK3js7nON8eVvFn7F/M4ye+7rDR9BOtAKIBHqXL1giHYzo1HsEvEPCKdjFVk0A==
X-Received: by 2002:a05:6214:29c7:b0:6fa:c043:7781 with SMTP id 6a1803df08f44-6fad9090d99mr2047706d6.6.1748643445856;
        Fri, 30 May 2025 15:17:25 -0700 (PDT)
Received: from aford-System-Version.. (c-75-72-162-184.hsd1.mn.comcast.net. [75.72.162.184])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fac6d4d0cesm29986866d6.35.2025.05.30.15.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 15:17:25 -0700 (PDT)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: aford@beaconembedded.com,
	m.felsch@pengutronix.de,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] arm64: dts: imx8mp: fix VPU_BUS clock setting
Date: Fri, 30 May 2025 17:17:09 -0500
Message-ID: <20250530221713.54804-3-aford173@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250530221713.54804-1-aford173@gmail.com>
References: <20250530221713.54804-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_151727_495714_93673CEB 
X-CRM114-Status: GOOD (  12.56  )
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

From: Marco Felsch <m.felsch@pengutronix.de>

The VPU_PLL clock must be set before the VPU_BUS clock which is derived
from the VPU_PLL clock else the VPU_BUS clock is 300MHz and not 600MHz.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 1bf15c502280..909555a5da4b 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -2283,8 +2283,8 @@ vpumix_blk_ctrl: blk-ctrl@38330000 {
 				 <&clk IMX8MP_CLK_VPU_G2_ROOT>,
 				 <&clk IMX8MP_CLK_VPU_VC8KE_ROOT>;
 			clock-names = "g1", "g2", "vc8000e";
-			assigned-clocks = <&clk IMX8MP_CLK_VPU_BUS>, <&clk IMX8MP_VPU_PLL>;
-			assigned-clock-parents = <&clk IMX8MP_VPU_PLL_OUT>;
+			assigned-clocks = <&clk IMX8MP_VPU_PLL>, <&clk IMX8MP_CLK_VPU_BUS>;
+			assigned-clock-parents = <0>, <&clk IMX8MP_VPU_PLL_OUT>;
 			assigned-clock-rates = <600000000>, <600000000>;
 			interconnects = <&noc IMX8MP_ICM_VPU_G1 &noc IMX8MP_ICN_VIDEO>,
 					<&noc IMX8MP_ICM_VPU_G2 &noc IMX8MP_ICN_VIDEO>,
-- 
2.48.1


