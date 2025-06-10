Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5C7C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 19:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zgHCfxHCSrQZLBdhcD+8YVibXqq6yEAZb7msrNjGwik=; b=aS8nGAGn3oTdcDKZh+K1EiZR5L
	69+ud7Y6/LetJrojE7pmOKmZOg16H6H/qzsbZd7RciYLbX6frX7wHddUAHFlJXxzeLdtng4HUT84Q
	nSgPr/+RzwuPxyO0nk2xZLNXD6cBmkgKD4+5cUP36F49ueMcnAIlrYvx7h71q51F+wD/Mp29fdi7+
	9eR24xyYgvOoAWqO+cBSHh6+bbLfHKJXZqv5bmtNbxXaj8d4OtV1sLz9H72WikzBJqfPrRfjOmAIx
	SdB3hjbjhzZFporE0qseSpUYuWd3MEVOetxgTH4zVgHkRptAktLjKOPjHSgRnx6TwEnFZ0Pp1L+Pp
	OojRM6Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP4Gl-00000007sQd-014u;
	Tue, 10 Jun 2025 19:04:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0m5-00000007HKN-20gV
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 15:20:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zgHCfxHCSrQZLBdhcD+8YVibXqq6yEAZb7msrNjGwik=; b=I6SP5fz9V7KoOMY1caWxnWcNUo
	P1hV1HopK6FRkuIXZPolezLtx6N4nX8iL66gCuwvHYxk/YEaKnlLJyRUPxxVljHEVyCHaHGVndjOg
	8CHKm+0CGRDaQOfD70TeebtS3nJxtzSVxSTo4N8T0IMZ1vRo/lLp7aLzLrbcDJcGQVGTFtHk+8+ej
	sAogs6WcjZoDNhfo2kQmC9aXDQbAPZCDW0XOVPvi14GJhr2eVbmcLRFUef9dahmS+d73Zl4gUr9yM
	zKVhJW5gLtT4+7VHjcca5v7j7WhGlSsG1t4sXg/XxLvZM3/Hy/b2z4J31gKT6wnth7wG0wknluCPi
	MCwFnrGg==;
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0m3-00000001tPl-1Nxj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 15:20:29 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLDiq020330;
	Tue, 10 Jun 2025 17:20:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	zgHCfxHCSrQZLBdhcD+8YVibXqq6yEAZb7msrNjGwik=; b=yfULawb1xYoeXaOH
	H7Iw6CuLSzfK3VIpACq7JNmiqWLNx0hOvamJOUBoCiwREQ9UcI+RsQH9dnmh186l
	Tl0gFFn08o1E1qKOfI7Tcu2zB14z0r5ntteiwYvSUYAGNQz+Q/AaO3GA6BscJ7Vt
	30ZZRgFqp8QutVCGrLefqyVzUdvDw3/j0t68qQNsuMNeOR97J/1evh2xjUWKE96x
	b66uuLb+B/9agX2lSQ0dSg0JH4gmk51MIbBZGAsz0KAAiTMy94o7YtwbuLsWbPM1
	kRUYfUNnPLQFRg89iCfMJ1lqrsJD52dlJXWLEOFJQSRxhRpwTtxPsnDthWS/HFtw
	m4IuwA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474aja58g3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 17:20:20 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6202B40046;
	Tue, 10 Jun 2025 17:19:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A9CDFB74DC5;
	Tue, 10 Jun 2025 17:18:43 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 17:18:43 +0200
From: Antonio Borneo <antonio.borneo@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: Antonio Borneo <antonio.borneo@foss.st.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Fabien Dessenne <fabien.dessenne@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 3/5] ARM: dts: stm32: Add pinmux for CM4 leds pins
Date: Tue, 10 Jun 2025 17:18:35 +0200
Message-ID: <20250610151837.299244-4-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610151837.299244-1-antonio.borneo@foss.st.com>
References: <20250610151837.299244-1-antonio.borneo@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.86.132]
X-ClientProxiedBy: SAFCAS1NODE2.st.com (10.75.90.13) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_07,2025-06-10_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_162027_507208_774758F0 
X-CRM114-Status: GOOD (  11.95  )
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

The GPIO H7 on boards stm32mp15xx-dkx and the GPIO D8 on boards
stm32mp15xx-ed1 are used by the coprocessor Cortex-M4.
Linux running on Cortex-A should not use the GPIO and should left
it available for the coprocessor.

Add two pinmux groups, one for each families of boards, setting
the GPIO function as Reserved (RSVD).

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi b/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
index 40605ea85ee1d..835b034d0aa7e 100644
--- a/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15-pinctrl.dtsi
@@ -1304,6 +1304,20 @@ pins {
 		};
 	};
 
+	/omit-if-no-ref/
+	m4_leds_orange_pins_a: m4-leds-orange-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 7, RSVD)>;
+		};
+	};
+
+	/omit-if-no-ref/
+	m4_leds_orange_pins_b: m4-leds-orange-1 {
+		pins {
+			pinmux = <STM32_PINMUX('D', 8, RSVD)>;
+		};
+	};
+
 	/omit-if-no-ref/
 	mco1_pins_a: mco1-0 {
 		pins {
-- 
2.34.1


