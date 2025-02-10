Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA0DC02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 10:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rZ3rqymKTcOrRHYBOJFcKi61/VkXrUXwCyZUwPho0Fk=; b=eZu6L+ODqEiU91dXRXq+vQ5S9W
	4yczGdZMTLxIDqAJn/xCsHMbJfGOtYWXe50Zt+Gu4BEkrZn5wHfBetbB/4WIaKb0ZU8grsXl6y+O0
	h6l9LOeV6S8MJpQSkdsOsnzTJ8OQ5L4Ku4R6AQxEw/aCmMQbYKLuMCiF0atoS+quyIlMMMrz7XKkn
	3WdBh43FEohsevyri0QtsqFZU3AXDqeODLfBdstUBtYF5iG8skvN+Gl/bJzZiW7bE/nfijSgnAZWa
	W/3pPlMOC7AOHGSycDbuxr/PRmlAg0d1Uh33KcdQG+ZeCwCCrfCEbfSDLGTRvWdwpu2ntTjIQrXPe
	G4Y+kmEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thQos-0000000GxLq-1tFv;
	Mon, 10 Feb 2025 10:15:14 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thQhQ-0000000Gw0P-3EeN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 10:07:34 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9emOV003742;
	Mon, 10 Feb 2025 11:07:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	rZ3rqymKTcOrRHYBOJFcKi61/VkXrUXwCyZUwPho0Fk=; b=Jm4x1wCvVl0BJIfw
	WdaZ/oFSJeAgQwdPD8TmJ7Bl+F1CWSrqpdw7yzrIuq1XEVlnJzzrQDxaJJqPOdKY
	uwBzA1ROdhsVymQz/6U6z6j7XWZYP3li4Mp87AJni2gzut5kkR3Q5v8qabeHFrhm
	lhSUbtdu9OndZAU/X7V4ttt935HZ/QkpENx2WnnhTcHTnyYWM/UuSt+oFzJy8gEk
	dUk0h8Agk/TP0MJ/vEjVXIOsFtUPhcHwvCHFhrqIbJZX4cCzPEbDk5aBGtv43U2V
	RexB7um6WJW1tAHutQJPAtCOlS6vNjaq3pBZ78aqVm8mX1u4nnQzugZuvRkQl3c9
	lt/YCg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44phq3kvx5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 11:07:13 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B2B9A4004B;
	Mon, 10 Feb 2025 11:06:13 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AD9E82BEF84;
	Mon, 10 Feb 2025 11:05:01 +0100 (CET)
Received: from localhost (10.252.6.236) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Feb
 2025 11:05:01 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 10 Feb 2025 11:04:30 +0100
Subject: [PATCH 1/2] ARM: dts: stm32: add missing dcmipp kclk clock-names
 in stm32mp135.dtsi
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250210-6-14-stm32-media-fixes-v1-1-c64ebe9af8bb@foss.st.com>
References: <20250210-6-14-stm32-media-fixes-v1-0-c64ebe9af8bb@foss.st.com>
In-Reply-To: <20250210-6-14-stm32-media-fixes-v1-0-c64ebe9af8bb@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Vasut <marex@denx.de>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.252.6.236]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_05,2025-02-10_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_020733_105527_1E9AF660 
X-CRM114-Status: UNSURE (   9.33  )
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

The dcmipp driver requires the first clock to be named as kclk hence
add a missing kclk clock-names within the dcmipp node in stm32mp135.dtsi.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp135.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/st/stm32mp135.dtsi b/arch/arm/boot/dts/st/stm32mp135.dtsi
index 834a4d545fe448c15feea3a3acd169da1da73e91..f9a49e7ab1f697ba8b76604cbb3e584d32a937df 100644
--- a/arch/arm/boot/dts/st/stm32mp135.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp135.dtsi
@@ -14,6 +14,7 @@ dcmipp: dcmipp@5a000000 {
 			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
 			resets = <&rcc DCMIPP_R>;
 			clocks = <&rcc DCMIPP_K>;
+			clock-names = "kclk";
 			status = "disabled";
 
 			port {

-- 
2.34.1


