Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B990DC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 19:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6jFgEWw4ARwHHobxDSziy501YUd5MUew54ky5yZYuxs=; b=gRtouWlNaAjm1za+so+8d6AIRm
	8QobW3eV+Mn8ygdoNqfN5lRmzuV+6gRfoUzt85BXCCfPCLjcgTYVd8Hw3lY7Oupf4VyXqsJKgzGR/
	G1CPTLiNyfohAlWqkmcUJ7uT98IEMAVUX5d4HEK4oqtSQl0v2w9+nE6ZFmz5W/BIO4zTzok1bh+go
	A1XimfPDP+PFkk4zvGWzuozuF6oJQUs0fqgmwb9O6tR4MnefCQVg6FXevXMzhFRIC6dXdCqeYWoWF
	knfFstGAI+FSWrNdyr5oCDkCl79VMVZKbaZrV/+66+ZTRaYm3l7FK/qhMTc4Y+VN5Wt1nZPKsF5iU
	l1qQYo9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP4RB-00000007tq6-2ZXf;
	Tue, 10 Jun 2025 19:15:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0mH-00000007HTU-0X3w
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 15:20:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=6jFgEWw4ARwHHobxDSziy501YUd5MUew54ky5yZYuxs=; b=W2XNLf3C2oG3RGjpoxKpXJc+YF
	slq6ml9IbQ1GnezfNKdqJDCinR8XVzAP4qxjZMcLI0Oh4k8aPQGCXKwK2Q+u+RfOOBecLf0KHxegs
	XluLBwMhvs+VnGDHth31NKbDwbdbn8SVfWtHigMioddp+W/ZWhY2w2NryNs7FriKJpisYKtL/mJXQ
	JlwwaT0TIn2Op+wTH/gu//b6MwnMB1kfbnk4S3aFIR3zCJRCgl5ylMbUyTrd85Re55P1LBBpNjfSY
	Uq2A3ZZVNoM7kcy8q//fJaEUZGnHFMAiLNHuDqffbrp2w0cJ6M42X76UIttfbE5mlaVokWtmejyb2
	WgpHcaMA==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP0mE-00000001tRt-47K3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 15:20:40 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55ACLFR2012963;
	Tue, 10 Jun 2025 17:20:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	6jFgEWw4ARwHHobxDSziy501YUd5MUew54ky5yZYuxs=; b=jMYwmn77htE4V8UU
	nGcXIOFkhTV+h1/yqiL4oZLxA77cuFLysjb22jU/rNnlO/RkibPrzctkoycqG1bp
	IUqtBMskQasxkXL5DHdx1lcdCbysClRitthSf7DpsYGEFTfqmkSyqisBysQDcAML
	0A6Xv/8L2GDXZloRzQZzfDKSlko3+jcLENKDwRRON8TW6bsH7Jw568diqVcE3TZL
	6yAu5t63wA689VY2dnHSZvMxQrHryXhA03qjabdfZcj8I1dsOT798doV7ySDL5SZ
	C3mB1ZKJQgIpj5cQAPRONseR3KhR95cmXFMg7jVmIyUYJMOp2S0D1JySbZh/G56B
	7EACpg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474aume532-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 17:20:30 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id E8F8B4004D;
	Tue, 10 Jun 2025 17:19:25 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 3F39EB74DC0;
	Tue, 10 Jun 2025 17:18:44 +0200 (CEST)
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
Subject: [PATCH v2 4/5] ARM: dts: stm32: Add leds for CM4 on stm32mp15xx-ed1 and stm32mp15xx-dkx
Date: Tue, 10 Jun 2025 17:18:36 +0200
Message-ID: <20250610151837.299244-5-antonio.borneo@foss.st.com>
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
X-CRM114-CacheID: sfid-20250610_162039_369939_C1226C39 
X-CRM114-Status: GOOD (  10.71  )
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


