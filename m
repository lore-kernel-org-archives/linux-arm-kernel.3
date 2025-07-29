Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEBEC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 15:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Um5h6E5hgrYH74DBhV8xzPbAvTei/UQkgD6+aDRBd0k=; b=FQcojYZcHcs7Yb
	kuYUz+AO9Hw35PvnY7caepsRCi/G9lcDPLTNdh90edyT5G/1BLw92+0Bekxh1QAtSQapczQA/gkQ/
	bqqPom2SZOBbyHe0S97QyPMmEC93mqINOp6vvReQdOwnQue4nA0T5FTPK1T5AleLKFc+Yhw9XZidI
	4H9sCjBFQxyBc7CGCQsIvqY4Ic/YWbYO+zaAMOB8l4BvL8B5xWfZBO3nIC2nA7Vt/dA22KZZUFl2B
	Buh6u7hRcZrFnHTbPkCBBOTReoPNRLWmr1hIEOlz7iu21O27VrEyQnsSbulXTSGHWlGFbO+Ut9oSo
	h7uJsh4/J6PB0MApTZCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uglqV-0000000Gymo-2gLk;
	Tue, 29 Jul 2025 15:02:27 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugljD-0000000GxY5-10Yx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 14:54:57 +0000
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56TE7qnw019597;
	Tue, 29 Jul 2025 16:54:42 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=Um5h6E5hgrYH74DBhV8xzP
	bAvTei/UQkgD6+aDRBd0k=; b=fhUsSC+eVFNTgK+DE3Kh+wDbMnKyeyprXks9EM
	5h2zo7Xk1J1C1Vas7o3ZijLouDtMb2ps7XH5+fyDxl3/ABTXctxIttm+Pmv3fZ12
	Q7WgfLsiCbf9OrYf0FVRwYZhV8Njbj+4OI5Mmu0Np/zfgdNWqZj1sIvvyzd7o5Fg
	bqLfD4PQFh1wuq1tmHWdoBvdNMYKQsm62AusEu+QKRM7qRd6QMFsAN4dtqyvu8ML
	qZFL2MvoCH38cP/FV4dZi1Ac0P4NxMwjtUMYdxNuIoNcLnb62lvczJHElbpmirZc
	/4cAxyi4A7ZR3j+V6+bbeFNEfMMfBB0m1xcenwA6vPpSL2+g==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 484pc2depw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Jul 2025 16:54:42 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 6E45D40046;
	Tue, 29 Jul 2025 16:53:18 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 92F66776AAD;
	Tue, 29 Jul 2025 16:52:17 +0200 (CEST)
Received: from localhost (10.48.87.141) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 29 Jul
 2025 16:52:17 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [PATCH net-next v2 0/2] net: stmmac: allow generation of flexible
 PPS relative to MAC time
Date: Tue, 29 Jul 2025 16:51:59 +0200
Message-ID: <20250729-relative_flex_pps-v2-0-3e5f03525c45@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAA/giGgC/22NQQrCMBBFryKzNqVNbKOuvIeUEuPEDtSkZEKol
 N7dUFy6fDz++yswRkKG62GFiJmYgi8gjwewo/EvFPQsDLKWba2lEhEnkyjj4CZchnlm4YyR7mG
 NO6sWym6O6GjZm3fwmITHJUFfzEicQvzsZ7nZ/a97+tPNjaiF0tZ0rdZKdZebC8wVp8qGN/Tbt
 n0BnI8vzr4AAAA=
X-Change-ID: 20250723-relative_flex_pps-faa2fbcaf835
To: Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller"
	<davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <netdev@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Gatien Chevallier
	<gatien.chevallier@foss.st.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.48.87.141]
X-ClientProxiedBy: SHFCAS1NODE1.st.com (10.75.129.72) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_075455_574211_DA6FAF09 
X-CRM114-Status: GOOD (  11.94  )
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

When doing some testing on stm32mp2x platforms(MACv5), I noticed that
the command previously used with a MACv4 for genering a PPS signal:
echo "0 0 0 1 1" > /sys/class/ptp/ptp0/period
did not work.

This is because the arguments passed through this command must contain
the start time at which the PPS should be generated, relative to the
MAC system time. For some reason, a time set in the past seems to work
with a MACv4.

Because passing such an argument is tedious, consider that any time
set in the past is an offset regarding the MAC system time. This way,
this does not impact existing scripts and the past time use case is
handled.

Example to generate a flexible PPS signal that has a 1s period 3s
relative to when the command was entered:

echo "0 3 0 1 1" > /sys/class/ptp/ptp0/period

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
Changes in v2:
- Drop STMMAC_RELATIVE_FLEX_PPS config switch
- Add PTP reference clock in stm32mp13x SoCs
- Link to v1: https://lore.kernel.org/r/20250724-relative_flex_pps-v1-0-37ca65773369@foss.st.com

---
Gatien Chevallier (2):
      drivers: net: stmmac: handle start time set in the past for flexible PPS
      ARM: dts: stm32: add missing PTP reference clocks on stm32mp13x SoCs

 arch/arm/boot/dts/st/stm32mp131.dtsi             |  2 ++
 arch/arm/boot/dts/st/stm32mp133.dtsi             |  2 ++
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 31 ++++++++++++++++++++++++
 3 files changed, 35 insertions(+)
---
base-commit: fa582ca7e187a15e772e6a72fe035f649b387a60
change-id: 20250723-relative_flex_pps-faa2fbcaf835

Best regards,
-- 
Gatien Chevallier <gatien.chevallier@foss.st.com>


