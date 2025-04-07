Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE37C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 08:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M4fDmZRN7yquUeZo8bSMP2LmovWfrpFiqUhwN/ePUVc=; b=H0g4/kyLPiH0k1qcQoE/Wb+tS5
	M+Dq8DbdWpNqiKvsarkcGYKbHMO7NhAohRmD8jv0ZC/t9F1Rdl3RuFAR3qMjxpCNZe0vD4d/2xM8y
	v6m8rwmL/kch6hjAUSV2NQL8fiwmv7sq28JL2wJvW8mDIThWDOW4cpN4O325/atURHVys2r3oZqv4
	oL6MgnN6E0BmCtJei1gACi1j1QLaPwduTNhDJ7FwR+u21zy/mkqMqXpl/73dcYwNZBBjiSjV1ckGd
	oFgy1TelytD9CVesg1P75fV8F+lRBPGsDPBKoZ6iw++sEwO1Bguce7OVDLFFgTzMEyZgG4FZbR54z
	8fjjrLEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1iHJ-0000000H640-0RUA;
	Mon, 07 Apr 2025 08:56:25 +0000
Received: from mx08-00178001.pphosted.com ([91.207.212.93] helo=mx07-00178001.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1i0t-0000000H2qi-1E97
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 08:39:29 +0000
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5378d75g030209;
	Mon, 7 Apr 2025 10:39:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=M4fDmZRN7yquUeZo8bSMP2
	LmovWfrpFiqUhwN/ePUVc=; b=LHYmZFDc7FLDVSArv6RpKwZQLAukYgWXCJIpgv
	errUQg9s9rqoLZJK/t/p/2MPeJQVpXwmiZpphYN4LjeZWJUY+huriQB9Zgc2jC2L
	kvauvSrXFld++hAtUey0VbDCZKd6r54aanX+BRhlm544Lc1P2jlf0g8aKvF72el/
	sn0w/n0cs4Ku7q+dQm2WkacdoJb6CBaBAVPBCoETHHXX4e+8pdU8qlV6yCaPVjzw
	XbWtAUlIau2H2DWh3dEQ9N0JcG3nl/bGWuTvHyFDJc1zHdKeuae9eP3rM6/hh1mP
	vrqYvwn06bHdTyu8wVGZcNGvUaHH9id+iO3/q5sDsmD/1LDQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45tw6e6hvt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Apr 2025 10:39:10 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6F4164006A;
	Mon,  7 Apr 2025 10:38:11 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id B94F693C4C2;
	Mon,  7 Apr 2025 10:35:41 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 10:35:41 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <maz@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>
Subject: [PATCH 1/2] arm64: dts: st: Adjust interrupt-controller for aarch64
Date: Mon, 7 Apr 2025 10:35:12 +0200
Message-ID: <20250407083513.2072434-1-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-07_02,2025-04-03_03,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_013927_962232_56E00F27 
X-CRM114-Status: UNSURE (   9.10  )
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

Use gic-400 compatible and remove address-cells = <1>.

Fixes: 5d30d03aaf785 ("arm64: dts: st: introduce stm32mp25 SoCs family")
Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index f3c6cdfd7008..379e290313dc 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -115,9 +115,8 @@ scmi_vdda18adc: regulator@7 {
 	};
 
 	intc: interrupt-controller@4ac00000 {
-		compatible = "arm,cortex-a7-gic";
+		compatible = "arm,gic-400";
 		#interrupt-cells = <3>;
-		#address-cells = <1>;
 		interrupt-controller;
 		reg = <0x0 0x4ac10000 0x0 0x1000>,
 		      <0x0 0x4ac20000 0x0 0x2000>,
-- 
2.34.1


