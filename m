Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0619CF44868
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 14:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+Qakn0FJV2FBpwkXmougwk+gggl5jahhhLBXSrL2j1Q=; b=uEHMSrXOvT3InhRol5XUdR8+K2
	+VwHivjNpl4Cwhtqnh979T0FvPQk9B5HyyOdvzC8blI5EajxQbQ/b5FtbhQ8GRlJn7M2oRkJPBOSd
	s+xlJL9BBYs+GZjaHb5RjmW3l/+RHZ/Gg3WPwFoU08rtKxZ+aJYFZaINevGFvZZUrnCFp/jZ/LCw3
	duY3XHBhG5nUoYZl6GJwoHoQtzcFrVdGyM/O7jEMhB6PLyo2MEZfzDStezInjMR3zQAttsStFmUsH
	uXR3kR0PR2RHZotiqniC8+Y8Z1D3AADbnpYY8l0RGJFpoe4dlu3xCvC/Ca8BH4isSGIKAPa8FCNhI
	7k9uppEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBCk1-0000000CNVe-1slp;
	Fri, 10 Apr 2026 14:21:49 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBCjy-0000000CNVI-1skV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 14:21:47 +0000
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A6ajbh347876;
	Fri, 10 Apr 2026 07:21:41 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=+Qakn0FJV2FBpwkXmougwk+
	gggl5jahhhLBXSrL2j1Q=; b=c+OFWgl+LR3bgAeItfhdudp5CQUUTm+3Ob0R6N8
	n3gM92l0gR2yErQYdrp+S4ty9RMEOHfmRloTC2AFnhdRFtcYTSFBmiPfzvGjgRDX
	F7ijCOi0NJCcN15Q/DF5UmKmaxxU0uyP1Q2dWmNT8XtKq8xFtBLPSRpmmaCAn1Zw
	5XnrnttsFG1uOaAMQOJMO9NG721CIRWX2nkl0XInYGAo/OcU6gI9ILBwQA5YayYi
	peSdNBNmnz9zSXd4CJlplKrU7oaEx6S4GCIfoaNPOGqhiLTSknicrAXK6HmBg5mX
	ZeYS9zdsNp/I29PthtnEYMFFeltsPPk0A6FR2wscdfft1nw==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 4dee00jpkj-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Apr 2026 07:21:41 -0700 (PDT)
Received: from DC5-EXCH05.marvell.com (10.69.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 10 Apr 2026 07:21:40 -0700
Received: from maili.marvell.com (10.69.176.80) by DC5-EXCH05.marvell.com
 (10.69.176.209) with Microsoft SMTP Server id 15.2.1544.25 via Frontend
 Transport; Fri, 10 Apr 2026 07:21:40 -0700
Received: from rkannoth-OptiPlex-7090.. (unknown [10.28.36.165])
	by maili.marvell.com (Postfix) with ESMTP id 657243F708D;
	Fri, 10 Apr 2026 07:21:36 -0700 (PDT)
From: Ratheesh Kannoth <rkannoth@marvell.com>
To: <linux-pci@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <bhelgaas@google.com>
CC: <will@kernel.org>, <lpieralisi@kernel.org>, <kwilczynski@kernel.org>,
        <mani@kernel.org>, <robh@kernel.org>, <vidyas@nvidia.com>,
        Ratheesh Kannoth
	<rkannoth@marvell.com>,
        Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH] PCI: host-common: Request bus reassignment when not probe-only
Date: Fri, 10 Apr 2026 19:51:24 +0530
Message-ID: <20260410142124.2673056-1-rkannoth@marvell.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDEzNCBTYWx0ZWRfX7j/IeWNhisvw
 qzoHbH2T+OyCoQukUsfQzLK5/IfjHD14qCEeITvLDCnBg4Z3lN5++gtg5guO2CA+YvyLJbiRH9n
 /v3xDKTRDFUtnUvGlGOBG/o43AirYcRvKJ7FYNlDl58budH/QP9CNcDGzfnu1usvdXgb1Ud5dNu
 fKBBb7OEa7L3fm45Qs6mXjncAWZKKxvQ6uceDNCVXNWx8kTQh2DD1f2GCqR3QFjTmXI45W29UVy
 rnTtkb9gMFHldnTol39f/7OtfoAPzOmYrlFCbILazHLmRwiw6XYUJ5I4xoHjEvcwzhEL8CHExfF
 7wQ6PTMGoCyjUhGIm5uclZgJCmIOl3/QpURoteXHH8GlWglNy5l04jPVOKdotECwHeDmOD3t1A8
 A8HZVsfKr3EFDRiv1dTGMhk1U9HB7dT4M2b4G14icE+TvLArohxD9cM1QMmCjmXZya3nQTggaaI
 xFK3qgMD8Q4eFjniHVA==
X-Authority-Analysis: v=2.4 cv=M/d97Sws c=1 sm=1 tr=0 ts=69d90775 cx=c_pps
 a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17
 a=A5OVakUREuEA:10 a=VkNPw1HP01LnGYTKEx00:22 a=l0iWHRpgs5sLHlkKQ1IR:22
 a=TtqV-g6YmW1Jfm2GSLaY:22 a=VwQbUJbxAAAA:8 a=Ikd4Dj_1AAAA:8 a=M5GUcnROAAAA:8
 a=UhbZHETWtGs1wiOFpMcA:9 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-GUID: YyaNPm2MXTb1M0cv0B4Im0gwWN2FQ2kB
X-Proofpoint-ORIG-GUID: YyaNPm2MXTb1M0cv0B4Im0gwWN2FQ2kB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_04,2026-04-09_02,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_072146_493714_38234CBD 
X-CRM114-Status: GOOD (  10.81  )
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
Fixes: 7246a4520b4b ("PCI: Use preserve_config in place of pci_flags")
Link: https://lore.kernel.org/netdev/adcXzcz2wWJFw4d7@rkannoth-OptiPlex-7090/
Signed-off-by: Ratheesh Kannoth <rkannoth@marvell.com>
---
 drivers/pci/controller/pci-host-common.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pci/controller/pci-host-common.c b/drivers/pci/controller/pci-host-common.c
index d6258c1cffe5..860783553cca 100644
--- a/drivers/pci/controller/pci-host-common.c
+++ b/drivers/pci/controller/pci-host-common.c
@@ -68,6 +68,10 @@ int pci_host_common_init(struct platform_device *pdev,
 	if (IS_ERR(cfg))
 		return PTR_ERR(cfg);
 
+	/* Do not reassign resources if probe only */
+	if (!pci_has_flag(PCI_PROBE_ONLY))
+		pci_add_flags(PCI_REASSIGN_ALL_BUS);
+
 	bridge->sysdata = cfg;
 	bridge->ops = (struct pci_ops *)&ops->pci_ops;
 	bridge->enable_device = ops->enable_device;
-- 
2.43.0


