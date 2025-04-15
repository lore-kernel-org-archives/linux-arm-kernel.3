Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E74C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 12:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hVtqs8Vv0HUnb0Ez+Qkit5ofDEeHme3L4CqxhioE4KQ=; b=4kD7UdQET4kPYVYkZ7AilwYE07
	bs1kNulQe19tQY9pZtupvd/FNGB+F1lI/NF5GCDVtgYzGdDTLd+r4I7z8CSNiU05oBgmXhjnCuueN
	q2/BX9HoqQMwnH1vPlz3KluFhUGFSOMYmKS1ngf53K87exgdO4Akhcv6DOm67uCwbaiL78t5zE2pf
	3salzeMEb3OTPX5yWxHfocKQKaLgcqxW5vhqPIqns6N3bPqODXcmpq2NzKOymk3zu26ZaZ7PiiGgG
	K87XRK0XaInoBLv/F0jBAL8mUQNNqKAlL5XtfL0Z9POIHckrC9ZLBgyx2vM3SqxHx+0m+LyTjIXQM
	UeTx/X7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4fAT-00000005g7L-1eBg;
	Tue, 15 Apr 2025 12:13:33 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4eJf-00000005V2g-26wB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 11:19:01 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F7RY1A002730;
	Tue, 15 Apr 2025 13:18:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=hVtqs8Vv0HUnb0Ez+Qkit5
	ofDEeHme3L4CqxhioE4KQ=; b=qWLvaPMASIBb6v52ZYZUcHFERdRS5LH/je/muW
	XUFNmbk9ZnPCw89gAYB/wwPEr3j2lWBGzO2xuEfK2ssQI39syGPDJtkzjk2jO7B9
	kmgc2S1+6l/dCI74xoApm5TOBXhSbsCnr75MUyDr433ygwPrvjTwzhJ9ezn1Cx/8
	eaD1iEZRsQMHXm5kCAR3xNMAb/F6EBpXlmSbG3vE3muq4mgiD8/ajRuhkW/9DFms
	wngLUDLSyYaWgzGKgF8CvMltgBPqy5Onf8B/Ing49w1me/YyvIhxoRgJrnAJ1lZb
	ZWvtLuRVgDXf675AhQJ/KSJ3dkq/Sjodh2JXfLi1OZNmAtUQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 45yfh1vvwe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 13:18:43 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 0715040049;
	Tue, 15 Apr 2025 13:17:46 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node3.st.com [10.75.129.71])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A08D96F1F27;
	Tue, 15 Apr 2025 13:17:07 +0200 (CEST)
Received: from localhost (10.130.77.120) by SHFDAG1NODE3.st.com (10.75.129.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 15 Apr
 2025 13:17:07 +0200
From: Christian Bruel <christian.bruel@foss.st.com>
To: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <maz@kernel.org>, Christian Bruel <christian.bruel@foss.st.com>
Subject: [PATCH v2 0/6] Fix interrupt controller node for STM32MP2 SoCs
Date: Tue, 15 Apr 2025 13:16:48 +0200
Message-ID: <20250415111654.2103767-1-christian.bruel@foss.st.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.130.77.120]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE3.st.com
 (10.75.129.71)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_041859_836493_32C2CDD9 
X-CRM114-Status: UNSURE (   6.71  )
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

Fix GIC compatible and register access for STM32MP2
This serie replaces the original stm32mp25 patch:
 "arm64: dts: st: Adjust interrupt-controller for aarch64"

Changes in v2:
   - Apply fixes to stm32mp21 and stm32mp23 SoCs family

Christian Bruel (6):
  arm64: dts: st: Adjust interrupt-controller for stm32mp25 SoCs
  arm64: dts: st: Use 128kB size for aliased GIC400 register access on
    stm32mp25 SoCs
  arm64: dts: st: Adjust interrupt-controller for stm32mp21 SoCs
  arm64: dts: st: Use 128kB size for aliased GIC400 register access on
    stm32mp21 SoCs
  arm64: dts: st: Adjust interrupt-controller for stm32mp23 SoCs
  arm64: dts: st: Use 128kB size for aliased GIC400 register access on
    stm32mp23 SoCs

 arch/arm64/boot/dts/st/stm32mp211.dtsi | 8 ++++----
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 9 ++++-----
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 9 ++++-----
 3 files changed, 12 insertions(+), 14 deletions(-)

-- 
2.34.1


