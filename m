Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6006D75BC8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 07:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rwkeTCE6wxoh+m+b9esUz6Hwk3y1XE+cMvORNr1yusM=; b=JqmLXi7jErgwfxd3AbOdYZLSye
	KDEtIw9qybbf8oP5/LVA2aXQ9TtndGufUfFvQXMqD9TqCzPylcr+NaZslPhQBh8e9THzyILg4Gijz
	O1qpD/uvD1hiXfE3nbUXJYTXVQy64Y3L3B6wpeWj0YWgg5TU17sYrOt8vHPr5O6VISwUnfODC0+gJ
	MoPOvBDSTeOdWd0u8Frk5cq/7w8tNrZv4/50PaDdTZryFaB+ozo8u48trkmUJeoRfwGpDJRL+6PHl
	vvmYBQ0SaY3pmU14xnZb1wY4kgRWyn2jHlyjx+9Np/X1LtbWgeOP+5vp7WNWR+9skKcvNmuVirvhR
	0Js/5wXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE1PX-0000000GzPQ-0nK3;
	Thu, 21 Nov 2024 07:15:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE1OV-0000000GzAE-1zKe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 07:14:28 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKJs94p007659;
	Thu, 21 Nov 2024 07:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rwkeTCE6wxoh+m+b9esUz6
	Hwk3y1XE+cMvORNr1yusM=; b=dNwr26FfybYG50tlGUcmZzbd/ZXhk58mB3WUy9
	wbANdxn9NPNaD8pSPeLR5Tfm/9+ecCbKckgVRieNffDyFekS4DWKCTo34MwJXazy
	pvkVdKuDKl1PAnU4Bzxl6W1L1bmBu5ISNsMPcxGA9aB/Lbv/qgzfzt5yCRu3HV7c
	gpHzaTJBcoJ6+qjQVt/Q3h/JFr+bHX8maHOBWSKbgY5lPYuOkuMWSrwlUbAF+Wi/
	WXWkXX065FkaukN2cgJ9YcsZOASBEP24hpBvRX4rAk6K29KClYAjDL+xJgaAYrxc
	4k9V+tn4DBOMAMqMdjmna7UL22L9sHTBHJs4W1vG1JmsoWrQ==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4318uvkjbn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 07:14:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL7EF0a002516
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 07:14:15 GMT
Received: from ap-kernel-sh01-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 20 Nov 2024 23:14:12 -0800
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <ardb@kernel.org>,
        <ryan.roberts@arm.com>, <mark.rutland@arm.com>, <joey.gouly@arm.com>,
        <dave.hansen@linux.intel.com>, <akpm@linux-foundation.org>,
        <chenfeiyang@loongson.cn>, <chenhuacai@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Zhenhua Huang <quic_zhenhuah@quicinc.com>
Subject: [PATCH 0/2] Fix subsection vmemmap_populate logic
Date: Thu, 21 Nov 2024 15:12:54 +0800
Message-ID: <20241121071256.487220-1-quic_zhenhuah@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VyNJfjpTkUBAUF4wCGCCAYxv21QuovWx
X-Proofpoint-GUID: VyNJfjpTkUBAUF4wCGCCAYxv21QuovWx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=772 spamscore=0 suspectscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_231427_633773_87617336 
X-CRM114-Status: UNSURE (   9.61  )
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

To perform memory hotplug operations, the memmap (aka struct page) will be
updated. For arm64 with 4K page size, the typical granularity is 128M,
which corresponds to a 2M memmap buffer.
Commit 2045a3b8911b ("mm/sparse-vmemmap: generalise vmemmap_populate_hugepages()")
optimizes this 2M buffer to be mapped with PMD huge pages. However,
commit ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
which supports 2M subsection hotplug granularity, causes other issues
(refer to the change log of patch #1). The logic is adjusted to populate
with huge pages only if the hotplug address/size is section-aligned.

Zhenhua Huang (2):
  arm64: mm: vmemmap populate to page level if not section aligned
  arm64: mm: implement vmemmap_check_pmd for arm64

 arch/arm64/mm/mmu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
2.25.1


