Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43BFCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 14:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gChpukKe/Co4j4eyT56FMO0lc9aier7sQ6umEpqMPig=; b=sDM/3u+ss11cgZ
	29+aazx6B/iMGTS4XSkggsahTvZutC2pJElLeIxzLevGi06rJT/YCnJ+2xFdEzb17Qo2v6VI9s6zc
	0Cx1jCIZOrCsbkZtIWOTxbfnCgGCX97lIVSGnlmJMwBGua7pjDxjUVztWUyQ8tJ/r75DF+o+R8sAX
	PtSB1aKifu4I6/SEtMpbbq7dywX45h51P07d7TpwDIz+2QoDRHtoBCO554djaCc5CrTcgoQOYccX/
	Hpc+LdyvXitSAdx6tHLFG3la+9wG15j3Htp9iZ8M5XacAG+bhNf/yCI2cWueaJ0vtKDZxrWkh3j5I
	Xd0s+puzOpsRwXtSGfvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urGpF-0000000FgqI-3wN0;
	Wed, 27 Aug 2025 14:08:33 +0000
Received: from mx07-00178001.pphosted.com ([185.132.182.106])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDzz-0000000FACd-0bbo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 11:07:30 +0000
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57RA4cGb026189;
	Wed, 27 Aug 2025 13:07:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=gChpukKe/Co4j4eyT56FMO
	0lc9aier7sQ6umEpqMPig=; b=7wv4BqlEGcf8Adj3Tl5KlzJClyjpur32grL9Cr
	AufZtlaYRTrNopWfDqw9lduzT5fSc3+wkQ6aTTbcKdDCqGXP2IHAVZsvH0dOvWfz
	N2dyRJ7Ese0M053XZd1OpbmPA1a0FCprP5SWvKrV+ivHCd1stclQjcZZ8Fkg8y96
	ASGvBgVT98r0xXebyHJXXrlH/xzgz6yX88XJ9w+h9eRMzUJa1B1UjcmDw76Phw32
	a++WzuI1j085Lw8pZbCjzq5FG3h7PEx13wKqVTrGLm7PhB59GkzVtMN71IzBdi3M
	UAVNE+rm1gbXHiqLZaieOlUTBo+etozvD0ePR/HcILy57gDQ==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 48qq745m9a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Aug 2025 13:07:13 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 4594240047;
	Wed, 27 Aug 2025 13:05:58 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 8A10A546F2C;
	Wed, 27 Aug 2025 13:05:02 +0200 (CEST)
Received: from localhost (10.252.21.245) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Wed, 27 Aug
 2025 13:05:02 +0200
From: Gatien Chevallier <gatien.chevallier@foss.st.com>
Subject: [PATCH net-next v3 0/2] net: stmmac: allow generation of flexible
 PPS relative to MAC time
Date: Wed, 27 Aug 2025 13:04:57 +0200
Message-ID: <20250827-relative_flex_pps-v3-0-673e77978ba2@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFnmrmgC/23N0QrCIBgF4FcZXudwOmfrqveIGGa/TVg6VGQx9
 u6ZdFGwy8PhfGdFAbyBgE7VijwkE4yzObBDhdQo7QOwueeMKKGcCMqwh0lGk2DQEyzDPAespaT
 6pqQ+Mo7ybvagzVLMC7IQsYUlomtuRhOi869ylprSf912x00NJpgJJTsuBGNdf9YuhDrEWrln8
 RL9Nfo9g34M4JowTrlq+b+xbdsb3n2FJQIBAAA=
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
X-Originating-IP: [10.252.21.245]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_02,2025-08-26_01,2025-03-28_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_040727_927345_C343D88D 
X-CRM114-Status: GOOD (  14.45  )
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
handled. Edit: But maybe that's not important and we can just change
the default behavior to this.

Example to generate a flexible PPS signal that has a 1s period 3s
relative to when the command was entered:

echo "0 3 0 1 1" > /sys/class/ptp/ptp0/period

Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
---
Changes in v3:
- Fix warning on braces for the switch case.
- Link to v2: https://lore.kernel.org/r/20250729-relative_flex_pps-v2-0-3e5f03525c45@foss.st.com

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
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 35 +++++++++++++++++++++++-
 3 files changed, 38 insertions(+), 1 deletion(-)
---
base-commit: 242041164339594ca019481d54b4f68a7aaff64e
change-id: 20250723-relative_flex_pps-faa2fbcaf835

Best regards,
-- 
Gatien Chevallier <gatien.chevallier@foss.st.com>


