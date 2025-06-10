Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F830C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 19:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6jFgEWw4ARwHHobxDSziy501YUd5MUew54ky5yZYuxs=; b=oENZUueXri4oao0oTNVn3yiFtx
	rOb3SHv4Qfn6hmdwSKvRa8O1a0VSuqsjJSIQiZ7Yu1cqkDYI+S3D0DlpgblBcn+FPLzaXkImfHZdC
	wQhdmKQokmLxkJtcAPaKnyildBj+jNszCxy4eP3Z3ykvVlZ/Ky8w8NOih+Wdp84t/cVhljM7w1NWL
	cvxKCMByJJqh6UNsz5/B67r5NyPXtKnAQ/NvTht/IWtzvXHIro+Y6QJ+raYrVb9+0RpR8D+Fbhs8B
	yHm6EYm1AI/s4yw6Pis9zQGBnwdvJTzN4B3jvfW+sZkE55bbmcmYWX6EYNM12I0wi+34YFjSgbA+y
	4pCJ7bzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP4VL-00000007uHX-46EL;
	Tue, 10 Jun 2025 19:19:27 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0qK-00000007Isy-30Xl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 15:24:54 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLFRk012963;
	Tue, 10 Jun 2025 17:24:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	6jFgEWw4ARwHHobxDSziy501YUd5MUew54ky5yZYuxs=; b=fRIBy1BxcpFxUqXZ
	zFzb+4hJFSEaZOpDRM+1lBrH+cRSNV1X52Jit1DkbvovitiXs6S4q5NAgdcI+nNI
	/dv13hLMhWOkVSUUQxAvyAQtzZ13rbxKZyzudUcD/rJVzbGbVBxAlnsx/2BJtLl0
	kEISu9Ow4LKrqXAS7xN2MBZ01GsDt9iOF+KNhmu8D+WxB/4wiYF1rHpuIpyrRNGA
	AZ29Zl5vVTthSC1xV5sevT4ObOStkC9HQtrI//yzLL4wa4fuvL+bB69YMIVJJj2L
	MMiVA3vT4nSvphcQn84rUh/bSA8r9+Nq4Y7cvnjcf0NDsfg+RLnRwkqbQNqK9a2Y
	DGR3cw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474aume5nh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 17:24:45 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id C9E4A40055;
	Tue, 10 Jun 2025 17:23:55 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1ED6DB79BAB;
	Tue, 10 Jun 2025 17:23:15 +0200 (CEST)
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
Subject: [RESEND PATCH v2 4/5] ARM: dts: stm32: Add leds for CM4 on stm32mp15xx-ed1 and stm32mp15xx-dkx
Date: Tue, 10 Jun 2025 17:23:08 +0200
Message-ID: <20250610152309.299438-5-antonio.borneo@foss.st.com>
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
X-CRM114-CacheID: sfid-20250610_082453_042287_85567D5A 
X-CRM114-Status: GOOD (  10.63  )
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

Add to the node m4_rproc the pinctrl property corresponding to the
orange LED.
The GPIO is reserved for the coprocessor Cortex-M4 and will be
ignored by Linux.

Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp157c-ed1.dts  | 2 ++
 arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
index 9cf5ed111b52e..f6c478dbd0418 100644
--- a/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
+++ b/arch/arm/boot/dts/st/stm32mp157c-ed1.dts
@@ -328,6 +328,8 @@ &m4_rproc {
 			<&vdev0vring1>, <&vdev0buffer>;
 	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
 	mbox-names = "vq0", "vq1", "shutdown", "detach";
+	pinctrl-names = "default";
+	pinctrl-0 = <&m4_leds_orange_pins_b>;
 	interrupt-parent = <&exti>;
 	interrupts = <68 1>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
index a5511b1f0ce30..26f36a232d42d 100644
--- a/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp15xx-dkx.dtsi
@@ -479,6 +479,8 @@ &m4_rproc {
 			<&vdev0vring1>, <&vdev0buffer>;
 	mboxes = <&ipcc 0>, <&ipcc 1>, <&ipcc 2>, <&ipcc 3>;
 	mbox-names = "vq0", "vq1", "shutdown", "detach";
+	pinctrl-names = "default";
+	pinctrl-0 = <&m4_leds_orange_pins_a>;
 	interrupt-parent = <&exti>;
 	interrupts = <68 1>;
 	status = "okay";
-- 
2.34.1


