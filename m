Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15C1CC677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 18:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zgHCfxHCSrQZLBdhcD+8YVibXqq6yEAZb7msrNjGwik=; b=Cje9q7mo8IF/dgadA/rWH+o2bs
	iOGGblFzifv9ZMFiZg3R422nXaGQ1D9VNBixCpYxhE8nVfz1pL/CpevmEbsVPYmmMQFU+xMl4hnJh
	RsHgyr4BCIDW+wb/RneHb1rH14F3RdFfH5onsGYc2elw76VsfpNxWwTBVonHfoE1BmWYexU9tGU3z
	ZFdi+wECEdx2bta+OQFrhB/a1X7BnbuXPk6/XQjs5vwOun0Sk4CkbfaqbLyfxqXi0YLZE8cQt1J9d
	VLWJaZulM+yhyNWxuQL+VPAIiK+gSZYdB983EuuB43Pf6pVmJUNRHJPCymeNu7a1/rhn3fA8JeQSP
	+pZkttTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP3re-00000007ov1-3oYG;
	Tue, 10 Jun 2025 18:38:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0qO-00000007Iva-03z8
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 15:24:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=zgHCfxHCSrQZLBdhcD+8YVibXqq6yEAZb7msrNjGwik=; b=fXqkRFK1yB/UsxSJPfyOM4asHP
	rsCxx1OZvXbMJorJfB7WAvwirZEOnJvVQWwhl49UzE8cKEDog1j7xqNce++Y/juIjD/hgVlUeuC3p
	U2uFSQ6//MQ1bz2R7fhIHScCAfj0QyB2hl9e/isIxRJXXfczDLB1YaVRrgBMooBRSGfRTJgQ/VkEM
	OUw0CxhjOnCVbMRJVyLYWVSHUKDRcRxvVoeDkxzyHXeFvFx4ctKEFmONHhrr7MuGDyW0poBjGQy9F
	ZpAOcdl6W6IJFszgCxPLAl6hM73j3B4CeWzZVFCzm6R0UigJz3SCawFnU8Ld6FXrL6P55TPe9UfsM
	r/9y54rA==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0qM-00000001tlT-0NUe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 15:24:55 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLFJT028167;
	Tue, 10 Jun 2025 17:24:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	zgHCfxHCSrQZLBdhcD+8YVibXqq6yEAZb7msrNjGwik=; b=gbFNVWnDU5B4VYPw
	JLXZoZjW3QzBbTMtKQGrMLN+zbOs3B6+9b0IDIO19iZTL1e2CxTbdN/2zdpPxZEi
	HI9bKSS/7sm/Ne0h6uxWzB4t85pLsNtIM8phH2b+i3tix+fF1OFA8lSE3pZ3LM5w
	5TwSqLVCMxxyc8f0zyLHeM+EbqZ1E1+MDmgY2YFSu2tygqt/LE/kFVPQSiSgP0eY
	/0Q7kQGxQcx7H75ZQghOm95AmCAbfBJkqa/hdEhkjW8n7RYRSxHjHWxBIJjatmUX
	JCjrR4sggFJZdm5lyi7p2Yc7ZSZ/+TINYtgM+tQ2tOttYDoynbmBqToisXisUOLG
	ChaC7A==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cs2nueh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 17:24:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 443BF40052;
	Tue, 10 Jun 2025 17:23:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8B5BEB79BA8;
	Tue, 10 Jun 2025 17:23:14 +0200 (CEST)
Received: from localhost (10.48.86.132) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 10 Jun
 2025 17:23:14 +0200
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
Subject: [RESEND PATCH v2 3/5] ARM: dts: stm32: Add pinmux for CM4 leds pins
Date: Tue, 10 Jun 2025 17:23:07 +0200
Message-ID: <20250610152309.299438-4-antonio.borneo@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250610152309.299438-1-antonio.borneo@foss.st.com>
References: <20250610152309.299438-1-antonio.borneo@foss.st.com>
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
X-CRM114-CacheID: sfid-20250610_162454_271417_7F6248C4 
X-CRM114-Status: GOOD (  11.64  )
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


