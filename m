Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66EB6C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 15:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qThLZiY/wcF/wXoPU6DZ22JEMA0Tul4CRJwH6uwAl+U=; b=k/gjWd3IiOvBQ4oIjZr5aHNW8Y
	lazgYKJ7uMQPoJ0t+VK9q+ejUebGelcWfvGu0bpTh/it/FtP9zx6p0iN5xcQQx+FckhEI4zbxl68K
	M7XgG22zB4x4T34xSd8EkmcMcOBYM66qFBJ373HKUxbAmZVeGHplNYTVSxjhOgDe7R54xqMd4aHRl
	IBeZqfPUtYZ5lfMnsCq+gk1a2KrdgbxpBn3YbrjmLtINI6QaAZ1isMk5FRGcgJNBumeSZuFukCrOH
	yF3B5qNldkQ7ueBwQiDI2TwLsEP10xsVoRFGBX25ZorlNhZRer/PpgJfF8auGZCtuv8rouGVCNVMJ
	TpWwHJJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaFph-0000000FAJJ-2t8a;
	Fri, 11 Jul 2025 15:38:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaF7N-0000000F4UR-0sjd
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 11 Jul 2025 14:52:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=qThLZiY/wcF/wXoPU6DZ22JEMA0Tul4CRJwH6uwAl+U=; b=QngKKA7jhvJc/Ch3hy3jkfh81f
	OnauMbppQ+iebNqZmtUMSndcYIpV7etV5R1ogM6Qap60fBBk9ODv+Ks+j2UUDCdkP6XCj2lvFs12p
	1T5Z0uMEIkcxjgLal6mvtoGfnbdBJ0IfapNE0gRZl6cX7TqNUmTa1KdGhW9s135tLtOg7NpahUmYP
	U4jhnJ8d1DeNnhOGcBjaCk9AoB7Rt7pYXlultg4EOx/hr0I8s+TZ6sOdNAa2da8NtgTM5M1o8FVy5
	wkK+gqQyUuF+hKbak1+0B6Vo5pF6Z443t3kn9ruGOc2sGllAU8aLZlIWppcGdF+mVi7vAFQmKMC19
	tkcmSXmg==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaF7H-00000009IUn-1c6T
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 14:52:51 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BEGqSX026533;
	Fri, 11 Jul 2025 16:52:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	qThLZiY/wcF/wXoPU6DZ22JEMA0Tul4CRJwH6uwAl+U=; b=X8c6SvFgHXeRBrsL
	/EuyjhqzWS3Cycr2fujRr3oHhCx0RARhnaRISwlWBdHAC/qHPw9xtcBkeKM3yCsd
	JZCZLEIMcQ6guD6bAI1wFtt6DlLctr0Fy+DmR/EPXOF0kWTB6VyhKa2HskDwFliI
	XHa90HmHDrtOGaN3p0ZXG+D3hHzyxD8KFSi2CiBOdhE6BJKmT5HXTeW0mMIb+ybK
	9vBSzvpBG+9cuLtlK/PBD7s64/AdUJw75g8hDh33lIZ7slHgQbxTKIV5WbHf0KsF
	tvY9iwCcRmqkX+rknTFkwhqdAfXMWWGn3ysnVNHjvcf/EH4+Q1SXXb8gDFnBLB/4
	6MJxWg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47pud3qfk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Jul 2025 16:52:34 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id D237F40054;
	Fri, 11 Jul 2025 16:51:19 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2C68FB5688E;
	Fri, 11 Jul 2025 16:49:24 +0200 (CEST)
Received: from localhost (10.252.16.187) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 11 Jul
 2025 16:49:23 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 11 Jul 2025 16:49:05 +0200
Subject: [PATCH v2 13/16] ARM: dts: stm32: add ddrperfm on stm32mp151
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250711-ddrperfm-upstream-v2-13-cdece720348f@foss.st.com>
References: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
In-Reply-To: <20250711-ddrperfm-upstream-v2-0-cdece720348f@foss.st.com>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Rob
 Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor
 Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Gabriel Fernandez
	<gabriel.fernandez@foss.st.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Le
 Goffic <legoffic.clement@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-clk@vger.kernel.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-7616d
X-Originating-IP: [10.252.16.187]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_155248_146620_C082AE14 
X-CRM114-Status: UNSURE (   9.60  )
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

The DDRPERFM is the DDR Performance Monitor embedded in STM32MP151 SoC.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp151.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp151.dtsi b/arch/arm/boot/dts/st/stm32mp151.dtsi
index 0daa8ffe2ff5..e121de52a054 100644
--- a/arch/arm/boot/dts/st/stm32mp151.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp151.dtsi
@@ -383,6 +383,13 @@ usbphyc_port1: usb-phy@1 {
 			};
 		};
 
+		ddrperfm: perf@5a007000 {
+			compatible = "st,stm32mp151-ddr-pmu", "st,stm32mp131-ddr-pmu";
+			reg = <0x5a007000 0x400>;
+			clocks = <&rcc DDRPERFM>;
+			resets = <&rcc DDRPERFM_R>;
+		};
+
 		rtc: rtc@5c004000 {
 			compatible = "st,stm32mp1-rtc";
 			reg = <0x5c004000 0x400>;

-- 
2.43.0


