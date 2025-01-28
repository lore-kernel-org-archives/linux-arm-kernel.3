Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1FDC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 08:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7LgmonOR7Z7/zkyptgS3TI+r2weye+nRuwwPKbSKc5k=; b=R4KtiBX/WIPUTk26kHfAOHRAIK
	QYqv3SiHK+ryjfsFv84qwPVnGv4YCpBLj2AD6WYAruKrTH+EDsRa4MZ6oITTEAVIXcs+5+66kt3nt
	ulAA58aCm9A5DDTnEJ/7T6+OMJ+hoCdV9C0hCVEWuwlXi/S3u6bBT0N2M2aBp+s1XDlviNYlIT69n
	/kHaBQHBobywe7f9D0DRZhXdjS9IloWfNx8yEiD0vlDNKenXQFduWIEjnngS+uedKkdYa7OsrSgXU
	/hoSQlsd/iwTC0eTdOAahuK2/Cw7CcUOBmq++JdFjl6rX770YcLADmlVcy6BGBlUa0gd9iK9aoq28
	t7alZCVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tch0t-00000004OWW-0Ebo;
	Tue, 28 Jan 2025 08:32:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcgr4-00000004MwO-0TM9
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Jan 2025 08:21:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=7LgmonOR7Z7/zkyptgS3TI+r2weye+nRuwwPKbSKc5k=; b=SeWT6IeapcT7ne1Ff1Vx/Z4eIs
	HO3qZNWzdlKi+/gOXs5aLaw8afwjnXfd2CldYxkoSVY6viif+6AY1YvygviYeLnSSprI2qr/3ctLo
	Wax3JLt0rgK7qeJWPyosBIq7Uh03YxcvM4rp5uFuHhbQzvePo95d0wOmEjIHxKpm4VTM/gt7zGqIO
	WPgHTMV44xdRH41c4Haxgg+TrX8yy7SHo061D2SR5xSnIflFj6Gwl4KMuF7XnLgKoHFasv/+X4dSX
	mdO4GGRR/oFkkTDGylA9k5qpDs1/3hLxT9QlKwE9Ar/lqjKo9umU5/JvAkuvMU/sF7ehfZ2EXP6o3
	E7UMPwKA==;
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcgqy-0000000EsRG-2DiG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 08:21:52 +0000
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S215n7000768;
	Tue, 28 Jan 2025 09:21:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	7LgmonOR7Z7/zkyptgS3TI+r2weye+nRuwwPKbSKc5k=; b=MygitRF/uNoSrQIq
	R2MMq62eWbMhHIzgHZlIlv1iPikjg0pge8FoD7nPablu6t6c+cmwoezq0Yb0Gj+M
	usPI66Ky01bESkyGtjiEIGQKw9KCBW9fhcLyFKEpg15vVNVhbdOwGGgBV6KKgIUf
	kihCScrsDkbULLd+eoDHKgtcldo0xcfFuzHmaz9JpEBrmLkzNUyA0VxV+kJ48Nw8
	PiBm8RzSfoyQUZ6vqgfhnT6Erkckn7CONv8obdc9UnBNDLusSUds5uTS14ij3/RJ
	nRqg/LtEuqv0ypFL34KAJmQkn2HY9NBx9dsvmS4YkJE5Sh4hjrb18xw/TjU+zKbs
	+STpow==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44eeqxj1t0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Jan 2025 09:21:28 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6CCFC40054;
	Tue, 28 Jan 2025 09:20:06 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 7A56029C614;
	Tue, 28 Jan 2025 09:17:47 +0100 (CET)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.37; Tue, 28 Jan
 2025 09:17:47 +0100
From: <patrice.chotard@foss.st.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Alexandre
 Torgue <alexandre.torgue@foss.st.com>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <christophe.kerello@foss.st.com>, <patrice.chotard@foss.st.com>
Subject: [PATCH v2 7/9] arm64: dts: st: Add SPI NOR flash support on stm32mp257f-ev1 board
Date: Tue, 28 Jan 2025 09:17:29 +0100
Message-ID: <20250128081731.2284457-8-patrice.chotard@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250128081731.2284457-1-patrice.chotard@foss.st.com>
References: <20250128081731.2284457-1-patrice.chotard@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SAFCAS1NODE1.st.com (10.75.90.11) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-28_02,2025-01-27_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_082149_564781_53C19685 
X-CRM114-Status: GOOD (  11.21  )
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

From: Patrice Chotard <patrice.chotard@foss.st.com>

Add SPI NOR flash nor support on stm32mp257f-ev1 board.

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 1b88485a62a1..b9d308ea2d21 100644
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
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&ospi_port1_clk_pins_a
+		     &ospi_port1_io03_pins_a
+		     &ospi_port1_cs0_pins_a>;
+	pinctrl-1 = <&ospi_port1_clk_sleep_pins_a
+		     &ospi_port1_io03_sleep_pins_a
+		     &ospi_port1_cs0_sleep_pins_a>;
+	status = "okay";
+
+	spi@40430000 {
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


