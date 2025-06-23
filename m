Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C422C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 07:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dqAz444oyv1tNExXQ6LB+NGBTHbnGCQW3fM6rAo+GF0=; b=OTPngy0AixtAmOMiZe+U5A4ozv
	xfjEQzfrSpbACVet1A4xIbvRW6VVLPly3IIHtAlRcqaVdEeJihIEgG9hiII4IF3fKpYFLFHuMSWOz
	OPeCvILJPnG+kSghxZYdT9+CuNgn/hCFjg8mLHB1+wWKAvqNGt2vJtXTrv3CyUSegDn1YmI68VVhO
	oIr2PqNSH944btGtf5NiXPXtIJO9d0X9LXawEW+lX8/xdjDpAd126aq3B24eDwrNzdE+0UpxwldFl
	TKJog9FAm/bo7Z1ogfOCB4a8jy4fa0PpP/ed353O2xCKaHBFZIleU4m6bBU2uyseqA4eHsrpEgGg1
	LOH63drQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTbr8-00000001tv8-1s27;
	Mon, 23 Jun 2025 07:44:42 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTbfe-00000001sPL-47fU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 07:32:52 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N6jGtP022211;
	Mon, 23 Jun 2025 09:32:41 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	dqAz444oyv1tNExXQ6LB+NGBTHbnGCQW3fM6rAo+GF0=; b=IUodyCkszPm3Lljj
	CLwFG4arSkpu9SjoWcRJfZT+sNbHV99+OANXd7jNhSWzEsLkLP9bXyFLpD0rEYR5
	wAlUVfIVXC1wzE2NeB81MXVMa6gGd5o+oFmA1yRnJ8y2KaNJoSvd92KomxS0vY8Z
	h9L7BLz4z0o97hTEFdU7gZgDmq5KyGN6AyTryYumJs+EG35nlhD7PuwiozAsJ5aI
	FRg5SRxrAdF21NTwjE07nXJARER2+1xhUqAb2Pzt+zxSx/T9feAFFjmWpfObf52H
	tKTCSCyx4QWmqngS4MJ0KRDC3jolLybkXy6GzjFwIMLRxdIjZY8mgB+jm60+7MsS
	vbWjmA==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47e6a6bxha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 09:32:41 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8636D4004D;
	Mon, 23 Jun 2025 09:31:34 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A0CFEB55595;
	Mon, 23 Jun 2025 09:29:45 +0200 (CEST)
Received: from localhost (10.252.18.29) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 09:29:45 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 23 Jun 2025 09:29:15 +0200
Subject: [PATCH v6 5/8] ARM: dts: stm32: add Hardware debug port (HDP) on
 stm32mp15
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250623-hdp-upstream-v6-5-387536f08398@foss.st.com>
References: <20250623-hdp-upstream-v6-0-387536f08398@foss.st.com>
In-Reply-To: <20250623-hdp-upstream-v6-0-387536f08398@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Antonio
 Borneo <antonio.borneo@foss.st.com>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-c25d1
X-Originating-IP: [10.252.18.29]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_02,2025-06-20_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_003251_352256_31246E82 
X-CRM114-Status: GOOD (  10.78  )
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

Add the hdp devicetree node for stm32mp15 SoC family

Keep the node disabled as HDP needs the pinctrl SoC configuration to be
able to output its mux output signal outside of the SoC, on the SoC pad.
This configuration is provided in the board dtsi file through 'pinctrl-*'
properties as well as HDP mux configuration.
Thus, if needed, HDP should be enabled in board dtsi file.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp151.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index 0daa8ffe2ff5..b1b568dfd126 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -270,6 +270,13 @@ dts: thermal@50028000 {
 			status = "disabled";
 		};
 
+		hdp: pinctrl@5002a000 {
+			compatible = "st,stm32mp151-hdp";
+			reg = <0x5002a000 0x400>;
+			clocks = <&rcc HDP>;
+			status = "disabled";
+		};
+
 		mdma1: dma-controller@58000000 {
 			compatible = "st,stm32h7-mdma";
 			reg = <0x58000000 0x1000>;

-- 
2.43.0


