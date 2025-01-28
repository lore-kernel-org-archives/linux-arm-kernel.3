Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F6B8C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 12:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oxqz3gPKLjUeq3RC+gzdPgb15H4SWpt1bnaDWPNbrFk=; b=3AQKfEfmQm7p69BOYbcEd1fWak
	D7ClbvW2v7y696LU502gO8NJalZ4P9v/pGYmii32xxgTs3SjJotbs1T/m9ZFo+4oo/1EuFw1iR9fM
	jBYsTQf9SsG3r/Cn7WCS/QUN9R4E24fyN8OUe7cdtm5oxeyogxJ/4JXhy6Dol3q0Ttu8CELibYXlO
	jeF1hsu/ejBYDYEwboOZTNIix8INwX2DYvEx+KSorAsffAFPNnEVU38qUs5wZZm55ybkOF8o6r8HQ
	s7Xcmx/0OOzDBj74em+joX+4HpRbK7nJmSt3ULpu9Ka7mQtt4x9+uXLKcjb57q4Vc5DJ7AIVPzBOX
	qCbI9Hnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tckct-00000004sDi-1EgC;
	Tue, 28 Jan 2025 12:23:31 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tckSh-00000004qfF-39zw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 12:13:01 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50SC5I28029878;
	Tue, 28 Jan 2025 13:12:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	Oxqz3gPKLjUeq3RC+gzdPgb15H4SWpt1bnaDWPNbrFk=; b=j2A5fgq1K+lRAV71
	Fj/77JD6GIJeiRwLb8LVcN+4M4YghT7/zBeVTuOOK1mfibT0HzvJUK89hV79Iy/U
	YPRe4GxBcxNPfRzt8lbwPagac+AFfp2o3VpoxFUsFMs15nzF1BrraAgW180e6XpT
	tek6wFRE9wgxZa7VdWyZ/7oUfw3jWS0M0ltJZQ1CcPnrERWxQ1Li5N/qJELboPcb
	4o+gMrPY8xGfQ04PgSF4dwQJgFY/yCmmRBaGE8MrigKZEgndJjWGYxj0kTMKrXTq
	60x03H1OGdjW96GNB8nMZ74uSYqW70+JZhdvQmb1HNAhz3DCwZTeC8Bp685wGPV4
	YkzGQg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44exxc0128-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 13:12:49 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 9D2D340057;
	Tue, 28 Jan 2025 13:11:25 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 641042DE8A7;
	Tue, 28 Jan 2025 13:09:39 +0100 (CET)
Received: from localhost (10.129.178.212) by SHFDAG1NODE3.st.com
 (10.75.129.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 28 Jan
 2025 13:09:39 +0100
From: Christian Bruel <christian.bruel@foss.st.com>
To: <christian.bruel@foss.st.com>, <bhelgaas@google.com>,
        <lpieralisi@kernel.org>, <kw@linux.com>,
        <manivannan.sadhasivam@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <jingoohan1@gmail.com>, <p.zabel@pengutronix.de>,
        <johan+linaro@kernel.org>, <quic_schintav@quicinc.com>,
        <cassel@kernel.org>
CC: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <fabrice.gasnier@foss.st.com>
Subject: [PATCH v4 07/10] arm64: dts: st: add PCIe pinctrl entries in stm32mp25-pinctrl.dtsi
Date: Tue, 28 Jan 2025 13:07:42 +0100
Message-ID: <20250128120745.334377-8-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250128120745.334377-1-christian.bruel@foss.st.com>
References: <20250128120745.334377-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.129.178.212]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_04,2025-01-27_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_041300_077942_28A0C378 
X-CRM114-Status: UNSURE (   9.78  )
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

Add PCIe pinctrl entries in stm32mp25-pinctrl.dtsi
init: forces GPIO to low while probing so CLKREQ is low for
phy_init
default: restore the AFMUX after controller probe

Add Analog pins of PCIe to perform power cycle

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
index 8fdd5f020425..f0d814bc7c60 100644
--- a/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp25-pinctrl.dtsi
@@ -82,6 +82,26 @@ pins {
 		};
 	};
 
+	pcie_pins_a: pcie-0 {
+		pins {
+			pinmux = <STM32_PINMUX('J', 0, AF4)>;
+			bias-disable;
+		};
+	};
+
+	pcie_init_pins_a: pcie-init-0 {
+		pins {
+			pinmux = <STM32_PINMUX('J', 0, GPIO)>;
+			output-low;
+		};
+	};
+
+	pcie_sleep_pins_a: pcie-sleep-0 {
+		pins {
+			pinmux = <STM32_PINMUX('J', 0, ANALOG)>;
+		};
+	};
+
 	sdmmc1_b4_pins_a: sdmmc1-b4-0 {
 		pins1 {
 			pinmux = <STM32_PINMUX('E', 4, AF10)>, /* SDMMC1_D0 */
-- 
2.34.1


