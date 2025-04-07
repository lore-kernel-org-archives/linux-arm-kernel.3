Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869C1C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 13:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sUoE004pjadBnoyOzbjhr4dsGQzt+uhGUkn+RUm/jfg=; b=oz4nfkRIohK/CfArU9YrEBB/Ru
	eKlIpHfgP4PZKVFn3K0Y8aOKmm+1XzOWQVQUY6OwfFNKkSKOnqzxM5WFKqP0iylmvxiwkkQc+lHNm
	TA6RPXuupqaQ1vObEhzlOZnR2Ua1YdppG2tCSic7qkEAIhkcNxIEzwUxyETsTfmRTvvvgjn99RkH4
	q+Ddp+B290aFBvPn1Kc4rm6f/K58mSEoXHlrJgkC/NwZdv4BwoQJAK8NkYXzgPDFN8MIhkzMGhY3d
	CQwdjg6NAD/QV0vyYomvjTXRDmpsWDfI00dZauwUv2W7FlrTHedlyNxvRrUCEXdPUeJonu0OgPtOn
	pcVb03bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1mgQ-00000000Z4f-40pO;
	Mon, 07 Apr 2025 13:38:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1mXn-00000000WPy-3FEZ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 07 Apr 2025 13:29:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=sUoE004pjadBnoyOzbjhr4dsGQzt+uhGUkn+RUm/jfg=; b=DalHwLxOZJwWPZJ07y5OR5zXma
	SwklRpWR3C2hMkQr5A7zbmr3xeyj9SwbGnwVxxuKLsT9pZbedAl9GC/NHCzAVqcV8FNhG1wX9EF6h
	+SuHXBqoCdyHPgxmJg6KRqz0LfdTFVZTmNXe+NbUlJZvaBxt1nlCMhViSZAAwIV9ra2b4+AD0yj9R
	ZQOxd0SV7/qv03eXKsNWrLWI/TU4LhpkJT9xgumB0y5DSIp/qnCkLUzuG4EitpEVrRJdfrfKyBiOn
	O7D9GQoFP6/PT/GDg2D59km4MHz59G65IQv0KOBLr+SUBXFLugrrPlVrJYufs0su9D+AmoKDRBXE+
	LSsRm/Hw==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1mXk-00000007xKk-11h4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 13:29:42 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 537CPqBY020473;
	Mon, 7 Apr 2025 15:29:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	sUoE004pjadBnoyOzbjhr4dsGQzt+uhGUkn+RUm/jfg=; b=vblfh73xQqEBnvXK
	1EfmoRrNw5JfLaoipt3xkDJ7bN2SXQdXHJw5hbHO/TSMJaiXvnoUP61XXQrYcxi5
	NBDC6X8GzDq4tAfTYfr9Vo2AjVVmP1FVAdJCTBXUEIaYVe7FeutV656DdWZNWei8
	dFWQ5SnuSIW4onM37KYBAIRQgRvEFFlvXWFIA7dGSj6v20cmyKipbjhkSNvoLf+a
	3TZb0d67ALawXJIjUVFnt2tok2plhN56lVir2qWBMQj5YqghV+xs/kYQ0w1oY1ha
	KXAg5qGS9Boyyn+eDPn5afGEmIgpJZXcfV7pH+vnqBNNIrtD3CPhYS9uo6qOPLDz
	adC1Gg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45tw8p82kq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 15:29:29 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B11FB40058;
	Mon,  7 Apr 2025 15:28:35 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D13619400F3;
	Mon,  7 Apr 2025 15:27:45 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 15:27:45 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Mon, 7 Apr 2025 15:27:37 +0200
Subject: [PATCH v8 6/7] arm64: dts: st: Add SPI NOR flash support on
 stm32mp257f-ev1 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250407-upstream_ospi_v6-v8-6-7b7716c1c1f6@foss.st.com>
References: <20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com>
In-Reply-To: <20250407-upstream_ospi_v6-v8-0-7b7716c1c1f6@foss.st.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: <christophe.kerello@foss.st.com>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Patrice Chotard
	<patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_04,2025-04-03_03,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_142940_843490_56D22569 
X-CRM114-Status: UNSURE (   9.50  )
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

Add SPI NOR flash nor support on stm32mp257f-ev1 board.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 32 ++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 1b88485a62a1f837770654eee6c970208fef6edc..9d1a1155e36ccc283cb73e51b91f3200ee54a4aa 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -80,6 +80,11 @@ fw@80000000 {
 			reg = <0x0 0x80000000 0x0 0x4000000>;
 			no-map;
 		};
+
+		mm_ospi1: mm-ospi@60000000 {
+			reg = <0x0 0x60000000 0x0 0x10000000>;
+			no-map;
+		};
 	};
 };
 
@@ -190,6 +195,33 @@ &i2c8 {
 	status = "disabled";
 };
 
+&ommanager {
+	memory-region = <&mm_ospi1>;
+	pinctrl-0 = <&ospi_port1_clk_pins_a
+		     &ospi_port1_io03_pins_a
+		     &ospi_port1_cs0_pins_a>;
+	pinctrl-1 = <&ospi_port1_clk_sleep_pins_a
+		     &ospi_port1_io03_sleep_pins_a
+		     &ospi_port1_cs0_sleep_pins_a>;
+	pinctrl-names = "default", "sleep";
+	status = "okay";
+
+	spi@0 {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		memory-region = <&mm_ospi1>;
+		status = "okay";
+
+		flash0: flash@0 {
+			compatible = "jedec,spi-nor";
+			reg = <0>;
+			spi-rx-bus-width = <4>;
+			spi-tx-bus-width = <4>;
+			spi-max-frequency = <50000000>;
+		};
+	};
+};
+
 &rtc {
 	status = "okay";
 };

-- 
2.25.1


