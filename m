Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF223C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 12:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jE/f+A75h9vw3QQPDkFAG+6fnAHISqE/y2SZB6E3XDY=; b=w+tOQ6rb/xkwN8GRKnpJxFD1EA
	6MXGWIu4r/sA3lslDrzDIHd5DUsvn2mcIvSlMhkR57a9IJkh4PbQEsV0BIbtITRQ146YNi177bT40
	PO6ue11WkYOUZ/9vjzUQLaMJbSWyT1rzQnqQp83ZLhs1DKNnv7vc7/9CGeIQSRo/2q7ZRSy7/9N3M
	f6PkewB7lXaqVQBfc3+NHUakCwVuIUCEqRe7kNZtAfN4ga/8nILa5AidwVawkgCf765VVh8GoSgUx
	gHVP3N8PLTjD3SJBoT1Km4joA77aa4p0GxQ5Smb4kCTvQBQbjrkrcx+PSYkP2FrrXFjNxLwzueNP4
	EQoN5+1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0JLb-00000008mp7-3obz;
	Thu, 03 Apr 2025 12:07:03 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0JI2-00000008mRR-0c7z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 12:03:23 +0000
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533BhN16024322;
	Thu, 3 Apr 2025 14:02:52 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	jE/f+A75h9vw3QQPDkFAG+6fnAHISqE/y2SZB6E3XDY=; b=fmgdhuOAs0hMIasm
	GcH0g4okvOMJV5hcHiviCFHBLF3UzNbCCLdgbbVUTU2w6AjsYinYxl7fibTnnehb
	284oUALSG5ImeCFSsY+C7MlnpeMSRglxP9+bfNSibGMUQi81N6VT0473gdBhmmEx
	uXFTWIQoPh2FOsa7VbIKxJCWfhRhsbauuDZRG9RRM3VhofQshNgAIVa5F4phyW4A
	42oMQZkebtiGUMIIi13+V0Bx/FpNCWa2cDu+8zk5PlPDq6Nox3wocQochWVhnF5Q
	lj6Sci8hkFdQf9XHFmal/OHPeoZbpc6xZ4a5fg+5GrZgsIOPEnFfb3uD2PweTOD6
	QJ7vag==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45s2c7ea49-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Apr 2025 14:02:52 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 95B4740083;
	Thu,  3 Apr 2025 14:01:26 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4C1A18E316A;
	Thu,  3 Apr 2025 14:00:12 +0200 (CEST)
Received: from localhost (10.48.87.151) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 14:00:12 +0200
From: Olivier Moysan <olivier.moysan@foss.st.com>
To: <fabrice.gasnier@foss.st.com>, Rob Herring <robh@kernel.org>,
        Krzysztof
 Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime
 Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>
CC: Olivier Moysan <olivier.moysan@foss.st.com>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] ARM: dts: stm32: add vrefint calibration on stm32mp13
Date: Thu, 3 Apr 2025 13:59:53 +0200
Message-ID: <20250403115954.1061528-2-olivier.moysan@foss.st.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250403115954.1061528-1-olivier.moysan@foss.st.com>
References: <20250403115954.1061528-1-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.48.87.151]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_05,2025-04-02_03,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_050322_463980_CB472A39 
X-CRM114-Status: GOOD (  10.32  )
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

Describe vrefint calibration cell to be retrieved through bsec,
on STM32MP13x SoCs family.

Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp131.dtsi | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/st/stm32mp131.dtsi b/arch/arm/boot/dts/st/stm32mp131.dtsi
index 8512a6e46b33..3cc5623d52ca 100644
--- a/arch/arm/boot/dts/st/stm32mp131.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp131.dtsi
@@ -1018,6 +1018,9 @@ part_number_otp: part_number_otp@4 {
 				reg = <0x4 0x2>;
 				bits = <0 12>;
 			};
+			vrefint: vrefin-cal@52 {
+				reg = <0x52 0x2>;
+			};
 			ts_cal1: calib@5c {
 				reg = <0x5c 0x2>;
 			};
-- 
2.25.1


