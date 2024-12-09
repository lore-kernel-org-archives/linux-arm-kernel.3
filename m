Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 228D0E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 09:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TBBcsGnUIismUG5M3WVT1h0rVoJD1839Z45T+RuqpKw=; b=zvGJV/NTq2bMwMq7Rj1jM7Pltm
	N+/H03BvGnBRSrz9TkMAL57iqpIn1uXOuAQxoi9CqnQNurgYTFoPT/kZwnEvl2FF49npExCOGCuQE
	vW5nDSWB7ogbAqovozun3i4mtnsFkcAqGs56edpc5Jas7P7JhDKy3q40jD6mxKhG2eihjYizZeS87
	VZGg2X4oMOHUCgKFe/Gjzi9V0lDuJRZYNYVbAix1paMqxOYFgLRKhKqDFXlV6PSsyfB/5OkpetQEl
	ja6l/5MHYzu6Kt1/bKCaP159wMixaev7eWgwjAiJ8TBPYU2ozEb/BUjKaL7Zj/oUAMpHX8NIPpJmb
	x+ypS+aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaJF-000000077iw-08pJ;
	Mon, 09 Dec 2024 09:44:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKaIB-000000077Px-0XLQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 09:43:05 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B8Natjq022156;
	Mon, 9 Dec 2024 09:42:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=TBBcsGnUIismUG5M3WVT1h
	0rVoJD1839Z45T+RuqpKw=; b=CVJ7DvfT6Dp13Puxxnt1Wt1JjVCmPH5If7Go2H
	sh/hLV/2SX6GieDsDwjJjy8meIn/lLAZmi/1KsEd7dgsTscyjx3ruyc4Loy/WBEt
	pb39er6NqWaMiRjBeIo45W7EXtZfZJWCAa+rfTd/MNBxmeSN5lLhTOrkwVbKbfdy
	XNJPTwFeEp7e8boBYNDC1DLgPDvh++sEqgrD4maln7GOpujHbYxWCL1HvP3+z+hz
	D6OeZu6lf1Df2x59YbGN7kNAkiQ0fCyh9WW+l6qucxi+AR5INMiOltN7jrMmJni4
	Isi0vj+l5Jx3+uT8JJVEGikfj0mjgjxS/f+nGpr3oVIIhWUA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cdpgm6hm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 09:42:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B99gpr6021596
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Dec 2024 09:42:51 GMT
Received: from ap-kernel-sh01-lnx.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 9 Dec 2024 01:42:48 -0800
From: Zhenhua Huang <quic_zhenhuah@quicinc.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <ardb@kernel.org>,
        <ryan.roberts@arm.com>, <mark.rutland@arm.com>, <joey.gouly@arm.com>,
        <dave.hansen@linux.intel.com>, <akpm@linux-foundation.org>,
        <chenfeiyang@loongson.cn>, <chenhuacai@kernel.org>
CC: <linux-mm@kvack.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Zhenhua Huang <quic_zhenhuah@quicinc.com>
Subject: [PATCH v2 0/2] Fix subsection vmemmap_populate logic
Date: Mon, 9 Dec 2024 17:42:25 +0800
Message-ID: <20241209094227.1529977-1-quic_zhenhuah@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cdWhVh-WYovZf2n086SfZ1G6qeakYZGR
X-Proofpoint-ORIG-GUID: cdWhVh-WYovZf2n086SfZ1G6qeakYZGR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 clxscore=1011 suspectscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 mlxlogscore=757 spamscore=0 malwarescore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_014303_278310_A3B9C70D 
X-CRM114-Status: UNSURE (   9.90  )
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
Commit c1cc1552616d ("arm64: MMU initialisation")
optimizes this 2M buffer to be mapped with one single PMD entry. However,
commit ba72b4c8cf60 ("mm/sparsemem: support sub-section hotplug")
which supports 2M subsection hotplug granularity, causes other issues
(refer to the change log of patch #1). The logic is adjusted to populate
with huge pages only if the hotplug address/size is section-aligned.

Changes since v1:
  - Modified change log to make it more clear which was based on Catalin's
    comments.

Zhenhua Huang (2):
  arm64: mm: vmemmap populate to page level if not section aligned
  arm64: mm: implement vmemmap_check_pmd for arm64

 arch/arm64/mm/mmu.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

-- 
2.25.1


