Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD18CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 14:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P8kcyQqXjPJl/wA2iNvOTp3xe+f0bXif7P+1RpYbGxs=; b=UcXFbnN4pjGT0C9sH4XkWVtIeu
	zmWqRGIRuoFJzFm0hYCsOYVMzjYmoqSE0p0W9RxNnlC0yw7lY18kuBpEfRsocJZCcXTUgmH7eTvwY
	280pEEnjUtwxhhaYXymjMn/23tLxcGuh/eXs5DOyIPpugumZMYVCQUnoHbKfiKJLjdDY/+cQoW6Nn
	NB0YK0wPw3Gtt44HabjJe2U0RX+0MgAs1nCg6dynAjGPSz7t5P5fbGYXcO0eusxvE1WFsj+Zm4pfX
	pe6mkgIcw5cm1Z407E2WkcGGBysjw1PME/FFOxcTuprlf/BuSl5cfnaF+2C0yliU+4QbxvV547gSB
	liw3EYSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNtRW-00000008Yw0-31YL;
	Fri, 15 May 2026 14:23:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNtRN-00000008YrN-3EKH
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 15 May 2026 14:23:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=P8kcyQqXjPJl/wA2iNvOTp3xe+f0bXif7P+1RpYbGxs=; b=HR5timcSL/ortghkUThS805Eyx
	k3WOWov3Il+ZpAdjGh9PjunfgCHnIAeRiOjM2bl2kdYZO1mCu7lgq1dIOe+toqxT3CPoxdaP96zi/
	VQPq7kPenwePK79L38glAXlG5Yg8KMoHDA7NzN1twQ7FMTwl3r4wD12GB9UVD8QmRqOhO8Y3BZze8
	0xzQUTESY2G72aQ4aadrKjBCDyZa2qW22yPZv9buZ5ljk6OFgH9SuGK7mUZ2XleS2mYdzCDYZSDnW
	RVUS0MWhMx7igw7Ge1pDKvyP6r5ppmGQPYq+NIM0V86Dnq0NsX+QMBvHxpUqvOSfC0or8LsefDxXG
	BHTCAHXw==;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNtRJ-00000005R9K-418e
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 14:23:00 +0000
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FBY8BR3953235;
	Fri, 15 May 2026 14:22:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=P8kcyQ
	qXjPJl/wA2iNvOTp3xe+f0bXif7P+1RpYbGxs=; b=bRyihCopm4HbUs3qahWe3e
	lfJYr3QO0rv4sAtIn0VzH1vDfDfyXbiKXTDLrqnZ9KhEJ5+wlVdYoKgAZ0tH9cpA
	DYY/qen8cmtFxdI+O4TiX7GbHw6QwBACXtB5VHkGZArq3OC1ZuC4/sVkD+Wkqwyz
	W8srPe8/l/OeOOS7Gc1y8Satyi/gHETCpI6e+2o1w+//NWON6n/SnJOMt99utcpZ
	wWzSJqeh2Oh2fDDleJ+ISEw5BLP7CkIHLVIGFrl12sBHzJPon1ETHG8XYYn5nG/7
	aBVHw+slhi0aCv0nzAuRL1MSaxjsDFUqpYNbQgb22urh+71uyVXq0J+fFF9xxV4w
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4e5m8ybkfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 May 2026 14:22:34 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 64FE9ECB022649;
	Fri, 15 May 2026 14:22:33 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4e5kvcuvay-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 15 May 2026 14:22:33 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 64FEMTTB53412222
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 15 May 2026 14:22:29 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 844BD20040;
	Fri, 15 May 2026 14:22:29 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 59E7420043;
	Fri, 15 May 2026 14:22:28 +0000 (GMT)
Received: from [192.168.178.55] (unknown [9.87.148.246])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 15 May 2026 14:22:28 +0000 (GMT)
From: Gerd Bayer <gbayer@linux.ibm.com>
Date: Fri, 15 May 2026 16:22:07 +0200
Subject: [PATCH 5/5] PCI: Make pci_root_buses private to PCI core
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-priv_root_buses-v1-5-f8e393c57390@linux.ibm.com>
References: <20260515-priv_root_buses-v1-0-f8e393c57390@linux.ibm.com>
In-Reply-To: <20260515-priv_root_buses-v1-0-f8e393c57390@linux.ibm.com>
To: Richard Henderson <richard.henderson@linaro.org>,
        Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>
Cc: Yinghai Lu <yinghai@kernel.org>, linux-alpha@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
        Gerd Bayer <gbayer@linux.ibm.com>
X-Mailer: b4 0.14.3
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: 2_E4E5fQqGK_gdgWkz3XVFqX2Y64d0U-
X-Authority-Analysis: v=2.4 cv=Os5/DS/t c=1 sm=1 tr=0 ts=6a072c2a cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8
 a=28hvmymbyGcFHlkD5P8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: gbZhqh0AjV2r8Vc2qnzG8viGM-BWhP2c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE0MyBTYWx0ZWRfX8z4Tzbj1mY3i
 OEcTYAqVviT097HtrxKeQs5QgPSSPoxwMDRWUARFq9HWbqoZOmAO3g/f2FiP4CHxWVz+kvd9yyI
 fdlfRR+Ij9IyF52PMHC3ST7BN9J7msYmDV+CBuCut9r4jshOtyh52Q4gMy5Cxh2QBay1MC6JWny
 SMVEgbAiFwzafkGzqPBBkIcToihe3YzCW0yAcq2hevlIfDOeWt7qHJZcsZbvVvZ0JEZQBqBeQTm
 MxWdTKx3rMRXOWoBQSz6I7xJY4nOrvnLx7i9Ojl9IGga3ItD9V2gGjkAoJczV6Kq0tOIyQFH99u
 Ge+o32YtYT7Wgp1zKUvHYBZu3P3hI41t6EFW1lDD4JWY+4i8xdvvyzf6z0bXRtD4blf/Whzr0Sk
 ogX/QCjpchV5L71bBnKKutAPOnuPlng/sh5Y6E9GCCRy6dxMggiXe5ocOFOQ1vbopuFIIloL/Zq
 WuNcajT4UphwmTXDVcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150143
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_152258_614169_A41558C4 
X-CRM114-Status: GOOD (  17.33  )
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

After all users of pci_root_buses external to PCI core have been
converted to using pci_find_next_bus(), move its declaration to the
PCI core code and stop exporting the symbol.

Signed-off-by: Gerd Bayer <gbayer@linux.ibm.com>
---
 drivers/pci/pci.h   | 3 +++
 drivers/pci/probe.c | 2 --
 include/linux/pci.h | 4 ----
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 4a14f88e543a..1f36d400c9e0 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -366,6 +366,9 @@ static inline void pci_create_legacy_files(struct pci_bus *bus) { }
 static inline void pci_remove_legacy_files(struct pci_bus *bus) { }
 #endif
 
+/* List of all known PCI buses */
+extern struct list_head pci_root_buses;
+
 /* Lock for read/write access to pci device and bus lists */
 extern struct rw_semaphore pci_bus_sem;
 extern struct mutex pci_slot_mutex;
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index b63cd0c310bc..2e97ab125ead 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -33,9 +33,7 @@ static struct resource busn_resource = {
 	.flags	= IORESOURCE_BUS,
 };
 
-/* Ugh.  Need to stop exporting this to modules. */
 LIST_HEAD(pci_root_buses);
-EXPORT_SYMBOL(pci_root_buses);
 
 static LIST_HEAD(pci_domain_busn_res_list);
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 2c4454583c11..1c4610848b5c 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1192,10 +1192,6 @@ extern enum pcie_bus_config_types pcie_bus_config;
 
 extern const struct bus_type pci_bus_type;
 
-/* Do NOT directly access these two variables, unless you are arch-specific PCI
- * code, or PCI core code. */
-extern struct list_head pci_root_buses;	/* List of all known PCI buses */
-
 void pcibios_resource_survey_bus(struct pci_bus *bus);
 void pcibios_bus_add_device(struct pci_dev *pdev);
 void pcibios_add_bus(struct pci_bus *bus);

-- 
2.54.0


