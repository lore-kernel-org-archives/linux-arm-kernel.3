Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04768C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 08:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HXxUnDHaYNU0mMmrMfCxsActTXfb2hYKcIpCLaZtg2c=; b=O+FqMv22DAnCNP+msd01jEjSEf
	HCSuYdkKNTlmsInYSUDvTrm89xDYiAfwjT1HCBOdSVqHHJNdZi1rUdJtyfna4Fzu3Ks6eJ8Tnp1ky
	rIZYXNfO1Z+NqtKbx2l4/acAfvtQa5+pRJtsF+/soiHWsWNC4mxXfsFLaGiUY9J704dJtv5Yqbhfc
	X+GjxClckvPoTBr7t+vtV1Et1+Yyi4svznUxzFldeSfz4WwY4znrEOEYV85wP2NYj0O4B2hCrZ6yJ
	d35HInWVn5sdDWFnGB4qkjqAH0vbHLt7iwoRvBJaCGBDXGyexupmHIK6fjwY/wUZDmPsSIkJHvU0q
	/31TfHQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujZK0-0000000EcET-3TbU;
	Wed, 06 Aug 2025 08:16:28 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujZEz-0000000EbHD-1baB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 08:11:19 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5767po1t012123;
	Wed, 6 Aug 2025 10:11:09 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=HXxUnDHaYNU0mMmrMfCxsA
	ctTXfb2hYKcIpCLaZtg2c=; b=m6DaK9YeW5mfl4x4oa5iLccXPZ6A4nrBkmmftK
	12qzjCQ77d+4m6uWsyhI9k9oSCojdH90GjG66kwHlcI0Ncm2xsRd/P2LmxjRruqk
	TQWfZidTKkXYmyj7Kh/YRGMZPB3KTMmE04nP2/kcS+jF9//a14fEJQ1rHd9jC5d3
	d8blssokPrpQJZjbtV8XtAraQO5HlIrRZm71ZhIJwyGlT40KCMYSoaRdxbjfngLA
	5r9OPmNDUo4DhvsQiKqHQwpgazDLS2Ryr+6ZR7wbVZzaffmhcMkE9cUADBn+ppuf
	kDj3CZY+w5goj8bM7mcmnnk9UAUlpDJ+0nsN6f+j+E6d5LKg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48bpx8ac4c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Aug 2025 10:11:09 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B1CBA4004B;
	Wed,  6 Aug 2025 10:10:15 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8DD2B767CC2;
	Wed,  6 Aug 2025 10:09:37 +0200 (CEST)
Received: from localhost (10.48.87.62) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Aug
 2025 10:09:37 +0200
From: Patrice Chotard <patrice.chotard@foss.st.com>
Date: Wed, 6 Aug 2025 10:09:35 +0200
Subject: [PATCH] arm64: dts: st: Add memory-region-names property for
 stm32mp257f-ev1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250806-upstream_fix_dts_omm-v1-1-e68c15ed422d@foss.st.com>
X-B4-Tracking: v=1; b=H4sIAL4Nk2gC/x2M0QpAQBAAf0X77GpdXPgV6cLtsQ+HbpGSf3d5n
 KaZB4Qik0CbPRDpYuFtTVDkGUzLsM6k2CUGjbrCGo06dzkiDcF6vq07xG4hqAnRjKbBUvsCUrp
 HSvrfdv37fk1vT8RmAAAA
X-Change-ID: 20250806-upstream_fix_dts_omm-c006b69042f1
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.62]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_01,2025-08-04_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_011118_006073_7B0E5CD7 
X-CRM114-Status: UNSURE (   8.53  )
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

Add memory-region-names property for stm32mp257f-ev1.
This allows to identify and check memory-map area's configuration.

Cc: stable@vger.kernel.org
Fixes: cad2492de91c ("arm64: dts: st: Add SPI NOR flash support on stm32mp257f-ev1 board")

Signed-off-by: Patrice Chotard <patrice.chotard@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp257f-ev1.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
index 2f561ad4066544445e93db78557bc4be1c27095a..16309029758cf24834f406f5203046ded371a8f9 100644
--- a/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
+++ b/arch/arm64/boot/dts/st/stm32mp257f-ev1.dts
@@ -197,6 +197,7 @@ &i2c8 {
 
 &ommanager {
 	memory-region = <&mm_ospi1>;
+	memory-region-names = "mm_ospi1";
 	pinctrl-0 = <&ospi_port1_clk_pins_a
 		     &ospi_port1_io03_pins_a
 		     &ospi_port1_cs0_pins_a>;

---
base-commit: 038d61fd642278bab63ee8ef722c50d10ab01e8f
change-id: 20250806-upstream_fix_dts_omm-c006b69042f1

Best regards,
-- 
Patrice Chotard <patrice.chotard@foss.st.com>


