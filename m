Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F25B106F30D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 09:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SR/SkZn+uF4l5BsESlaKtdNrsMB0G3ypNZAO1BqWB8o=; b=3xHclr8ib78ZHa1GkdxhSTK73g
	bwSVQIbk12YSNv5/r4EOe68ggpFh1NXwQymjIazS6Q4ObiS00H54f6Tlf8CvIhkiOtglPpUoCRfYv
	6ik0Q47SrpCaevmgnu7u4Byatph3vflqhlnIANyVTdwLy98wfUt2OG23/+jD376DRRTNvERoFXca8
	k3Lq01aJNofWy14dtIF0kDSFOzC5+bwbBCp1wqkM6252KAKg9b/2wLhO3wSMb/jj38hy2BfO/fdFs
	16WhDlOcQr/1W7SdUjogTNmMToLEeHE5Oo0OjqRnFqVF/OsJ8Fw2+VbF0eRDzc1UZcy3VTv/faaaS
	Tc+jqT3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ggQ-000000056WH-1Wkf;
	Thu, 26 Mar 2026 09:07:18 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gg7-000000056NZ-1gJ3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 09:07:00 +0000
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q7JOsL145829;
	Thu, 26 Mar 2026 02:06:51 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	pfpt0220; bh=SR/SkZn+uF4l5BsESlaKtdNrsMB0G3ypNZAO1BqWB8o=; b=XpL
	eAewUmaBcnRgAhOnVvlj0wmcT7LQ7WoF/klqqG8cHXIjsiRg0x9UI/wkK/Y2UHqH
	tqn8GyX6yC2Oh8oXeA/qpr4913EcVGiJg3D47rBdSK4kwsdV0bw/5FS9V2qdMD4v
	m99t/ipVmRuZJjEdMcRO5JLa/JgpCb70dMUvT4KB8VGQzwZScc/eAuDb12Zf+QLn
	eWcFK7T/3NknZxR6QZBah2PWObODmwMJeXc+9lQB3DyWoQKx65VLSlJ0EPejGcQ4
	tSgW1awx/vX4LVhIqZPnZQ99KbiJ9PQI/vIuRuaAHbIjh+FMZQo2URD2FdbZ4E7E
	aGNc2mL7QkFXkJzK9Pw==
Received: from dc5-exch05.marvell.com ([199.233.59.128])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 4d420jmsnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Mar 2026 02:06:50 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC5-EXCH05.marvell.com (10.69.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Mar 2026 02:06:50 -0700
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 26 Mar 2026 02:06:49 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.25 via Frontend
 Transport; Thu, 26 Mar 2026 02:06:49 -0700
Received: from hyd1soter3.marvell.com (unknown [10.29.37.12])
	by maili.marvell.com (Postfix) with ESMTP id B59B83F7041;
	Thu, 26 Mar 2026 02:06:46 -0700 (PDT)
From: Geetha sowjanya <gakula@marvell.com>
To: <linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: <mark.rutland@arm.com>, <will@kernel.org>, <krzk+dt@kernel.org>
Subject: [PATCH 0/2] perf: marvell: Add CN20K DDR PMU support
Date: Thu, 26 Mar 2026 14:36:43 +0530
Message-ID: <20260326090645.22590-1-gakula@marvell.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: KM9C4xyof_5VDro3pQW8DXD2lNqT1UsM
X-Authority-Analysis: v=2.4 cv=ULDQ3Sfy c=1 sm=1 tr=0 ts=69c4f72a cx=c_pps
 a=rEv8fa4AjpPjGxpoe8rlIQ==:117 a=rEv8fa4AjpPjGxpoe8rlIQ==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=l0iWHRpgs5sLHlkKQ1IR:22
 a=TtqV-g6YmW1Jfm2GSLaY:22 a=M5GUcnROAAAA:8 a=wzYssofzYklCjT3gtv0A:9
 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-GUID: KM9C4xyof_5VDro3pQW8DXD2lNqT1UsM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2NiBTYWx0ZWRfXyTZL5gZL96ok
 rFze5NN/Q0uJwEXkwPrHwaTdd5fNhGC1TgzGJDBbkCgMfAYJZRDMbslT+INeo10f+k0XV3/zI9+
 IQpsfumwHxenECNNRzMIutAafIVIkq81SjeDVtAuS++2tcxJpebyV4jUy1WawfB0aEw+qKBhW9H
 xUXCkQ/Jzalw8cAYWyPLSWybCL72u9Hh2KXBQrGj4i5/vwveYscfLPImY1LVEQC+tsKlEjLRKSW
 Gae+uCl7IyLroTDK2CTAJ2llFBpJ37qNu89enJY629qtICYWl5BnorMlgaDx/GZdexH7xWKNXeD
 enySR5ukK6fVAg1apB8YvKJV75WWzTlMDVpFt8X2isRz1jEhWLdStDVhdvPAdw7Z+OZxXT8iqCb
 AaJZsZJYCxWpOIjNsiFlTdLJeikAAsSVlDHP7j4rtMXzt8KABlyLIO5Ko4/dmpnoZDbXO7P8AdK
 dejZbstlI+FiTxfdOKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_020659_444223_C641A7DE 
X-CRM114-Status: GOOD (  10.84  )
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

This series adds support for the Marvell CN20K DRAM Subsystem (DSS)
performance monitor in the existing marvell_cn10k_ddr_pmu driver, and
documents the device tree binding for the new compatible string.

The CN20K PMU provides eight programmable counters and two fixed
counters (DDR reads and writes).  Patch 1 adds the devicetree schema for
"marvell,cn20k-ddr-pmu".  Patch 2 wires OF and ACPI (MRVL000B) match
entries, adds CN20K register offsets and event maps, and refactors
platform data to use silicon variant flags.

Signed-off-by: Geetha sowjanya <gakula@marvell.com>

Geetha sowjanya (2):
  dt-bindings: perf: marvell: Document CN20K DDR PMU
  perf: marvell: Add CN20K DDR PMU support

 .../bindings/perf/marvell-cn20k-ddr.yaml      |  37 ++++
 drivers/perf/marvell_cn10k_ddr_pmu.c          | 186 ++++++++++++++++--
 2 files changed, 207 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/perf/marvell-cn20k-ddr.yaml

-- 
2.25.1


