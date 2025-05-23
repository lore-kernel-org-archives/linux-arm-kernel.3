Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D403AC3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 12:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VsJ9BwEz1wd8EF9lpOMOQsDImQr6kHRBw5n5nBd+jPE=; b=2NPWBMvZ9jc5BBd7pVnQ+9U3aa
	gdbbUHa2mg8BF77j2KJsB0N/4u335mjDauLoEYW/ClBuQqVWlidKsmRssAtPP+bOKsWFK3jtC1xm0
	srkjO9oMa2XthzohdUvCQCGsmvc8aVtNt2y8BzznocSVzSwbT2H6wacG1kWfSZBa7P6UY3J/X3ps9
	P2dxysQXEgIrLKGZatocv9rY5dEJX9SpFVl/IlqTx6lfzU9G1rOOplMHiDVcLh/7yFjRqETn6uc9Q
	J6oPvh5H8OpO0SL8wcOdgfPy54ZMo7qe0s4fJrCRyxhE6/BX4EF6bymH20wQfKxXxZBfH3N1jRdVP
	C4Ui1Tog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIRpU-00000003qmd-45s7;
	Fri, 23 May 2025 12:48:52 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIRhS-00000003pac-45De
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 12:40:36 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NCZhFe031186;
	Fri, 23 May 2025 14:40:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	VsJ9BwEz1wd8EF9lpOMOQsDImQr6kHRBw5n5nBd+jPE=; b=dSJFUzna92t/zgBC
	S1sp7Z+NOk3Y28GTkHoqUKNtjea80RjvD3W5VSgdBGo4+YykKCHZSI36sYk2q7kz
	lmVi+14ylO8SwY4MowMF3tZihvrRw4akokVt/ROu+fVCff1X/QB2aTBBBgw5Uvlp
	Tu8In8DePdxrQbL+iD6GCCmhKxqx4H1zcPsnby0x3aU7JWHauECZwMZ9wKppbwAZ
	Mz4VdbUwVbqPoeCHBc3UxdHWfJN9+P0qXSLPF+WWbrmNQSMeRwSq1mjd3/PdQ92G
	WanmUZ2ONX6zKRS7O3ZhLlGUSCVW064eGq0/nhO+QNJ9RDcmBLlyb48g/OE4IY0S
	8ZJQvQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 46rwf4e7u6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 14:40:24 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 2D57740055;
	Fri, 23 May 2025 14:39:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id C44BEA0D6D9;
	Fri, 23 May 2025 14:38:27 +0200 (CEST)
Received: from localhost (10.48.81.67) by SHFDAG1NODE2.st.com (10.75.129.70)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 May
 2025 14:38:27 +0200
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>
Date: Fri, 23 May 2025 14:38:17 +0200
Subject: [PATCH v3 5/9] ARM: dts: stm32: add Hardware debug port (HDP) on
 stm32mp13
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID: <20250523-hdp-upstream-v3-5-bd6ca199466a@foss.st.com>
References: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
In-Reply-To: <20250523-hdp-upstream-v3-0-bd6ca199466a@foss.st.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
CC: <linux-kernel@vger.kernel.org>, <linux-gpio@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        =?utf-8?q?Cl=C3=A9ment_Le_Goffic?=
	<clement.legoffic@foss.st.com>
X-Mailer: b4 0.15-dev-6f78e
X-Originating-IP: [10.48.81.67]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_03,2025-05-22_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_054035_297021_7D82AC7F 
X-CRM114-Status: UNSURE (   9.21  )
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

Add the hdp devicetree node for stm32mp13 SoC family

Signed-off-by: Clément Le Goffic <clement.legoffic@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index 8512a6e46b33..b0537bcdb9d5 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -951,6 +951,12 @@ dts: thermal@50028000 {
 			clocks = <&rcc DTS>;
 			clock-names = "pclk";
 			#thermal-sensor-cells = <0>;
+		};
+
+		hdp: pinctrl@5002a000 {
+			compatible = "st,stm32mp131-hdp";
+			reg = <0x5002a000 0x400>;
+			clocks = <&rcc HDP>;
 			status = "disabled";
 		};
 

-- 
2.43.0


