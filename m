Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 472FDC61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Jun 2025 12:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gq6NiYoztE5n+qnbOG6J5+Yuv0005vgbJ4zJGtQw7Ug=; b=0vTIJy0T8BaxZfIZM9M9luxhUf
	jlt7c78Wu6w7YpVskUEHIrTZY7CDfp4kV3a3w0XaHbm9lks7bR/bozh+B6EQvwBCUoEpD3LxCdLsm
	lGYKQgtwxvTIWpeEiN+Ll1u3pSDJMKY6RfUHsho55I6SO4RCI6Zwc4GWaLxrTmXRuOQFRTwhp3q+N
	x1KWU5uOpZHCd+uROZiKXY4Puh+Trb2RZxWFF6qWx8ERIFDNvdRkM+mWVGuSlDWWkarkR5lW2IWZO
	EaPo6ogMjqRyhYkwqMmku4EdFUQmLogNnoty4zo6TDmrlzF0Vibo/ezjij5F7h425zIYgD/lYl0eg
	2W0n/qGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNVvd-00000000D79-1J6H;
	Fri, 06 Jun 2025 12:12:09 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNVrQ-00000000CCT-49E0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Jun 2025 12:07:50 +0000
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 556BcvJc008218;
	Fri, 6 Jun 2025 14:07:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	gq6NiYoztE5n+qnbOG6J5+Yuv0005vgbJ4zJGtQw7Ug=; b=rJxLUK8FvA1TErY3
	DLk98QrMDNTkYFElI9B4n1C7OyDmdmteVpn7WecBRjuQHqZcUagExffAZDhsq3fV
	LdLFxpOyp5ZE+hh707HqQUGIzW2qutx2DT3JmFSpAzSU9aH3UFkOzYSUJ+PB1WKi
	ZiMh3D2asltkdobendJUOQhD4/zTEdRLppRZMkuMHibdHvINyt/+w8JPyHM/+mQl
	f3YBkYvOQx9vOoz3YfCmSgCJcJAGs4KZIxRt3cV0dM3MUeikctYsauX9yFKxblyT
	vPyrc1FO9lcbgWMYKyJbYWdhw5VHcy+6IZHLXGgjF7ShLl9OMZJ6tncXREd4ZYDf
	wS1vXw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 471g8vkmmv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Jun 2025 14:07:29 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 8A05640051;
	Fri,  6 Jun 2025 14:06:16 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EC863B05FC7;
	Fri,  6 Jun 2025 14:06:11 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Jun
 2025 14:06:11 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <christian.bruel@foss.st.com>, <bhelgaas@google.com>,
        <lpieralisi@kernel.org>, <kwilczynski@kernel.org>,
        <manivannan.sadhasivam@linaro.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>,
        <p.zabel@pengutronix.de>, <quic_schintav@quicinc.com>,
        <shradha.t@samsung.com>, <cassel@kernel.org>,
        <thippeswamy.havalige@amd.com>
CC: <linux-pci@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v11 9/9] arm64: dts: st: Enable PCIe on the stm32mp257f-ev1 board
Date: Fri, 6 Jun 2025 14:04:03 +0200
Message-ID: <20250606120403.2964857-10-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250606120403.2964857-1-christian.bruel@foss.st.com>
References: <20250606120403.2964857-1-christian.bruel@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_04,2025-06-05_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250606_050749_347743_DE5EF95A 
X-CRM114-Status: UNSURE (   9.75  )
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

Add PCIe RC and EP support on stm32mp257f-ev1 board.
Default to RC mode.

Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 2f561ad40665..f97581aa0841 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -265,6 +265,27 @@ scmi_vdd_sdcard: regulator@23 {
 	};
 };
 
+&pcie_ep {
+	pinctrl-names = "default", "init";
+	pinctrl-0 = <&pcie_pins_a>;
+	pinctrl-1 = <&pcie_init_pins_a>;
+	reset-gpios = <&gpioj 8 GPIO_ACTIVE_LOW>;
+	status = "disabled";
+};
+
+&pcie_rc {
+	pinctrl-names = "default", "init", "sleep";
+	pinctrl-0 = <&pcie_pins_a>;
+	pinctrl-1 = <&pcie_init_pins_a>;
+	pinctrl-2 = <&pcie_sleep_pins_a>;
+	status = "okay";
+
+	pcie@0,0 {
+		 reset-gpios = <&gpioj 8 GPIO_ACTIVE_LOW>;
+		 wake-gpios = <&gpioh 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+	};
+};
+
 &sdmmc1 {
 	pinctrl-names = "default", "opendrain", "sleep";
 	pinctrl-0 = <&sdmmc1_b4_pins_a>;
-- 
2.34.1


