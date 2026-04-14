Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE29FED7B82
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 08:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gNNg448gdtUS+tAAC0N3jqL6fwbj0HrHTEoB0pDAWaA=; b=ndt83FFjOH6U3mGfMD9cQSgZOS
	JUQje8Y7XVCtG2VI7kmTDqQEcPQO21qDGRuOyrT0Pj1pz7ZTv4nmfqf9/u2Ojh2xdRT6jlwl8mLFz
	JPvkcOSMIpPO9+MmBr18KS40WeySjn3v25Z2p4wFEcMEpdXPO+gyw/akHWjelt42SVWF3sRe3aPNI
	3na78YKeq71U8FTT+ym6rTjdBg8XsftKNHjfNc/gAR1wGB7LLJ7tFMQJWt2sVBEHI+ZMkKxkmAgPE
	5RNKlgjh6zwB0/gXv4//5q+tFDGOya2NHtDfj18DbNcP70Plzg0UUvcVaPuHq1jt5oGNghWf33PC1
	/oS0UHjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCYxu-0000000Gxdx-2i79;
	Tue, 14 Apr 2026 08:17:46 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCYxs-0000000Gxda-02dS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 08:17:45 +0000
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DLAAZB2633898;
	Tue, 14 Apr 2026 01:17:38 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=gNNg448gdtUS+tAAC0N3jqL
	6fwbj0HrHTEoB0pDAWaA=; b=Yr0gzlN+ZT8gSiQ1l7GEIW7rzEyCtc0z8JN4Ic7
	R1QV0TSmTF+bzDCEelXTASNO6gnO7I2gjgM2+9GKAc++u2J/kVItLBGlEP60QNSP
	ZVHPa0vwZzkt7Ef6RYqEgd2PlXITCoaqLtTMDa0uavLqQ/5er8KyHn3FBSO5gdGm
	XziM6fL0tr193i/ZkjFC0Lx/1xmo/YPVnk+uiBGRnyPoYGdUeNd6O2bNaA+arZ96
	A2RM5rgxBlw7rPQYRcZuLEbZh70oeupppZZ+/XcLfVX7eUjBjdBw+Pxdgag4vwYX
	EnzaKF8nB+IchPyelWY+8118W69LD9xMV/fhTFmdbp8Nj1A==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 4dh85b973n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Apr 2026 01:17:37 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 14 Apr 2026 01:17:37 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.25 via Frontend
 Transport; Tue, 14 Apr 2026 01:17:37 -0700
Received: from rkannoth-OptiPlex-7090.. (unknown [10.28.36.165])
	by maili.marvell.com (Postfix) with ESMTP id 78E8C3F7043;
	Tue, 14 Apr 2026 01:17:33 -0700 (PDT)
From: Ratheesh Kannoth <rkannoth@marvell.com>
To: <linux-pci@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <bhelgaas@google.com>
CC: <will@kernel.org>, <lpieralisi@kernel.org>, <kwilczynski@kernel.org>,
        <mani@kernel.org>, <robh@kernel.org>, <vidyas@nvidia.com>,
        Ratheesh Kannoth
	<rkannoth@marvell.com>,
        Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH v2] PCI: host-common: Request bus reassignment when not probe-only
Date: Tue, 14 Apr 2026 13:47:30 +0530
Message-ID: <20260414081730.3864372-1-rkannoth@marvell.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA3NiBTYWx0ZWRfX1bhEJ+fcl08Y
 1j7VyRaCWjL+jGuUFTyDO2i/VRXoA6wDPByq8YD9WCLrdXe/AtoWod6iDZ1ysbdW3Mq4PUXX3hF
 pjYwWI5Uc1z2epF0JHTxHJwU98G1H6ol7ZScNvDqWVo9xrRbEAUnk+3LGMPaV2ueVTHeir7J6jy
 xrofM0/UlLUUDIqbUgsRB2NdHbMo2KymjZdkZ3KxOALpq+m/iWmwghtdkBrqHYsLPZJmocOWRjj
 L9FMkURg90j6rUd86HcH75UEbkv1j1I4Tt7uRHjsXfmIBrKw12QKmPN740UV4iWAtHsn8iO0KE/
 YGPB+4ZrX3g1KRnXn90RN5tLq8wLLxJtsXdVjwZHico9WuZ/y9ewusIh0znvxx3v45KLGyHzLzq
 BDHLgu+1dNwuz8o2UI2kwagvlPhA5eS0kypxIG3ZV+rtrTlYKtYE+av3lYxjApSL5MJLSpRvdyY
 TLsLRYfD+qDN4C472wA==
X-Authority-Analysis: v=2.4 cv=F8NnsKhN c=1 sm=1 tr=0 ts=69ddf821 cx=c_pps
 a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=l0iWHRpgs5sLHlkKQ1IR:22
 a=TtqV-g6YmW1Jfm2GSLaY:22 a=VwQbUJbxAAAA:8 a=M5GUcnROAAAA:8 a=Ikd4Dj_1AAAA:8
 a=r5FkvgvYKeOTjkmYp6cA:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-GUID: RYAIEn4WFZppLB0I8P04sw0j07gu5wz_
X-Proofpoint-ORIG-GUID: RYAIEn4WFZppLB0I8P04sw0j07gu5wz_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_011744_114936_71F18E33 
X-CRM114-Status: GOOD (  10.98  )
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

pci_host_common_init() is used by several generic ECAM host drivers.
After PCI core changes around pci_flags and preserve_config, these hosts
no longer opted into full bus number reassignment the way they did
before.

When PCI_PROBE_ONLY is not set, add PCI_REASSIGN_ALL_BUS so
pci_scan_bridge_extend() takes the reassignment path: bus numbers can be
assigned from firmware EA data (e.g. pci_ea_fixed_busnrs()). Skip the
flag in probe-only mode so existing assignments are not overridden.

CC: Bjorn Helgaas <helgaas@kernel.org>
CC: Vidya Sagar <vidyas@nvidia.com>
CC: Manivannan Sadhasivam <mani@kernel.org>
Fixes: 7246a4520b4b ("PCI: Use preserve_config in place of pci_flags")
Link: https://lore.kernel.org/netdev/adcXzcz2wWJFw4d7@rkannoth-OptiPlex-7090/
Signed-off-by: Ratheesh Kannoth <rkannoth@marvell.com>

---
v1 -> v2 : https://lore.kernel.org/linux-pci/20260410142124.2673056-1-rkannoth@marvell.com/
---
 drivers/pci/controller/pci-host-common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index d6258c1cffe5..99952fb7189b 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -68,6 +68,10 @@ int pci_host_common_init(struct platform_device *pdev,
 	if (IS_ERR(cfg))
 		return PTR_ERR(cfg);
 
+	/* Do not reassign bus numbers if probe only */
+	if (!pci_has_flag(PCI_PROBE_ONLY))
+		pci_add_flags(PCI_REASSIGN_ALL_BUS);
+
 	bridge->sysdata = cfg;
 	bridge->ops = (struct pci_ops *)&ops->pci_ops;
 	bridge->enable_device = ops->enable_device;
-- 
2.43.0


