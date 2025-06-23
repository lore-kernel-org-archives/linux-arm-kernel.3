Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4C6C77B7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 10:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SuBSodyyqcKAz1sJaFnr1XdxWrUs+npg1uqS49q9/0Y=; b=JiCjHcXnczlr2S6Dx+Pja9ZBpD
	+zwN5T2gC1UTiNFhGWX77AYfod4OLsFsI2bg5v120bRguRVIyYQ2Myp7f7rjilPw+iKf2fnIPUY2I
	8gbJ1ql8X4rzY9AX4ISep/5IQW9HTGiT4PH4QofwC5aiTDHuQ482+A/bxVhtlMi8pcKu77JsR57oh
	kphIylEmYKwJ6EVvBRujJdS0tqyYPbsei6nrIIsxeOPnVTh1OKL0mECfewZM1JsGyXseSeDsHfa4y
	h0BYbZvud/BwC84r8lzzc3z5h2TqHO9gVBuU35C5TOFd7kxOQ+5NZRI9odBcskV2y9GdzuXdCg4cy
	Wtbsx94Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeAw-00000002JNS-2BZQ;
	Mon, 23 Jun 2025 10:13:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdVG-00000002B2n-0vB6
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Jun 2025 09:30:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=SuBSodyyqcKAz1sJaFnr1XdxWrUs+npg1uqS49q9/0Y=; b=LuuX1zcChOBSSuHzGRiQCAkI0C
	Rll2pB/t+Q2l6TnAJoj3g42y2KjGkjetUxHubzSgFqw8ukOcQCB+PSXlhrndQpxzkBXxFErXPzBqN
	Wz8Hbj69Ah2TqhcmobbLBSMIaT13WQo5I+XcIJ+8mLcyt0kWOJixZRdBSmDUnLNZgyo7iNTj0U9fq
	YpnDFNY3qbz+re2D0MWRGzwUwQieEXPChimRXDZ3p5GJ5iSLmBfzWqkYYsak07v1Me83yKlds50rN
	lTBqKTy9cf0ih+uhMeO9be3ZqLKgZYiHH0ZzJC49PBIyYNo0W5RwBLJr/bvj3ovoxvDHS5fIIh8hu
	ZwG66MUA==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdVD-00000005AWF-3DIc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Jun 2025 09:30:13 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9FWgh021128;
	Mon, 23 Jun 2025 11:30:03 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	SuBSodyyqcKAz1sJaFnr1XdxWrUs+npg1uqS49q9/0Y=; b=tfTKsqoN8IhNoUxP
	RVIKVe+P/8Q9oMNMZ2lQJpg1UIpGxmqE8Wjms1EfUFDAmJd/yn56VMlGKDDEtGjg
	4+f+a0dEXakxTp4Vws/ebiPiDhpCM8I7yF64kmJAXeylzlgKvOWFhKqR71vOH1Bv
	UlbZcWgZ5CUc4rm9uRMm1nQtstBKPjRPYHWtHKy3xsSrL2FnRxh3gdS+Rpf6gmEh
	vYUak6G/PVBCVtFHDL7LgXR/cx2a9dvb4xRXHCmkAP9GqYViE/x5EqA+xIDvGLgp
	GawEqRZ/2CMhUfuqSatsBkfV+tdgPvAIv2OgcAHu82t9LfNGhQaHWROk/psZD5aQ
	bPMKYg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 47e6a6cjrb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Jun 2025 11:30:03 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2515A40054;
	Mon, 23 Jun 2025 11:28:37 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 2A1475C2DF3;
	Mon, 23 Jun 2025 11:27:31 +0200 (CEST)
Received: from localhost (10.252.18.29) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 11:27:30 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Mon, 23 Jun 2025 11:27:16 +0200
Subject: [PATCH 11/13] arm64: dts: st: add ddrperfm on stm32mp251
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250623-ddrperfm-upstream-v1-11-7dffff168090@foss.st.com>
References: <20250623-ddrperfm-upstream-v1-0-7dffff168090@foss.st.com>
In-Reply-To: <20250623-ddrperfm-upstream-v1-0-7dffff168090@foss.st.com>
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
	<gabriel.fernandez@foss.st.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-clk@vger.kernel.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-c25d1
X-Originating-IP: [10.252.18.29]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_103011_997341_4CAF884D 
X-CRM114-Status: UNSURE (   9.44  )
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

The DDRPERFM is the DDR Performance Monitor embedded in STM32MP251 SoC.

Keep the node disabled at SoC level as it requires the property
`st,dram-type` which is provided in board dtsi file.

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index 0683c2d5cb6f..7f138324610a 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1577,5 +1577,12 @@ exti2: interrupt-controller@46230000 {
 				<0>,
 				<&intc GIC_SPI 213 IRQ_TYPE_LEVEL_HIGH>;	/* EXTI_70 */
 		};
+
+		ddrperfm: perf@48041000 {
+			compatible = "st,stm32mp251-ddr-pmu";
+			reg = <0x48041000 0x400>;
+			access-controllers = <&rcc 104>;
+			status = "disabled";
+		};
 	};
 };

-- 
2.43.0


