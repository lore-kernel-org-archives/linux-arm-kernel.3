Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DA4D5E12B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 04:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1wEGUjdpFgNACr5ZDL63iBNnbF5aVkt4S1/n5E5N3fQ=; b=1OdF9Zvqd9/N/RbIxPCVZmtIi2
	dFSSTAl793YIrl6tQgsdnjZwoHf764pOOlOljsdZGRVW3DLCjMaMIifTj+yh9UXK8lbfxFcv4ROLv
	hNx1Zbk409QoFbovziA6ZBIQCjMQ2IIvzeyr1JPHysJ6vnukGB/7FWHArj5lVnGPjVShp6ePok1Mq
	hyvFd0STf+pkpmxdUwZsh7h6L4rYqTduVeBbiQ41KSI7bErraOWbclAsfmlCov1l2jCIYuRi1Yyow
	eIUuqSxX84ykcsyvkZyPJEJGlxA1l9VT8a3PolwjKdugMTIfEsy2ChohJorQKus30swJSjD66RC8p
	gi11CgqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Gn7-00000009IEV-1ru9;
	Fri, 08 Nov 2024 04:40:13 +0000
Received: from mx0a-0016f401.pphosted.com ([67.231.148.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9GLC-00000009EGX-1SBh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 04:11:23 +0000
Received: from pps.filterd (m0431384.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7Mbwh6022799;
	Thu, 7 Nov 2024 20:11:14 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pfpt0220; bh=1wEGUjdpFgNACr5ZDL63iBN
	nbF5aVkt4S1/n5E5N3fQ=; b=Z+EnQ3G2inp/kj2YwU2u4wX18p1DwZv7knnwK3y
	6g/66+MgDXPZPhtqq5mqZpJwk4IEpgD6CCPyqYCXQgACp+BiB60gUyfuza0uShLB
	tOsG0Qdit6TcqgW7kHRETA5V1TPa4zx7dfC0zj1dflrQvaDqDAoq9/ze769+w9Ru
	cEt+fXq/qKnNr/7vZEH33WZpFES4/+ORhH0u50KtvaegvtsWIb7vanmjkWnmciqL
	TOOk1MBtWRCylAE29L6UCafPgmH0QZoJaTXPTKxj0is6vURwiiLnUSoSi44qZQmx
	F5MPMvUv7fAWkyYp8gQkNZwk2LKDvlyHmMuY6USbomRwZSA==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 42s6gu8mba-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Nov 2024 20:11:13 -0800 (PST)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 7 Nov 2024 20:06:25 -0800
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 7 Nov 2024 20:06:25 -0800
Received: from IPBU-BLR-SERVER1.marvell.com (IPBU-BLR-SERVER1.marvell.com [10.28.8.41])
	by maili.marvell.com (Postfix) with ESMTP id 6C6405B6926;
	Thu,  7 Nov 2024 20:06:22 -0800 (PST)
From: Gowthami Thiagarajan <gthiagarajan@marvell.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <bbhushan2@marvell.com>, <gcherian@marvell.com>, <sgoutham@marvell.com>,
        <jonathan.cameron@huawei.com>,
        Gowthami Thiagarajan
	<gthiagarajan@marvell.com>
Subject: [PATCH v10 0/5] Marvell Odyssey uncore performance monitor support
Date: Fri, 8 Nov 2024 09:36:14 +0530
Message-ID: <20241108040619.753343-1-gthiagarajan@marvell.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: qN7GfIEKEURhK3vqd4vwn4JlRO34r2BG
X-Proofpoint-GUID: qN7GfIEKEURhK3vqd4vwn4JlRO34r2BG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_201122_413899_D2AF836E 
X-CRM114-Status: GOOD (  11.85  )
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

Odyssey is a 64 bit ARM based SoC with multiple performance monitor
units for various blocks.

This series of patches introduces support for uncore performance monitor
units (PMUs) on the Marvell Odyssey platform. The PMUs covered in this
series include the DDR PMU and LLC-TAD PMU.

v9->v10:
- Minor code rearrangement based on the feedback
- Typo fix
- Updated commit description
- Added RB tag to one of the patches

v8->v9:
- Addressed the review comments.
- Added platform specific flag in DDR PMU driver instead of version
  as there is already a platform specific data.

Gowthami Thiagarajan (5):
  perf/marvell: Refactor to extract platform data - no functional change
  perf/marvell: Refactor to extract PMU operations
  perf/marvell: Odyssey DDR Performance monitor support
  perf/marvell : Refactor to extract platform data - no functional
    change
  perf/marvell : Odyssey LLC-TAD performance monitor support

 Documentation/admin-guide/perf/index.rst      |   2 +
 .../admin-guide/perf/mrvl-odyssey-ddr-pmu.rst |  80 +++
 .../admin-guide/perf/mrvl-odyssey-tad-pmu.rst |  37 ++
 drivers/perf/marvell_cn10k_ddr_pmu.c          | 530 +++++++++++++++---
 drivers/perf/marvell_cn10k_tad_pmu.c          |  66 ++-
 5 files changed, 641 insertions(+), 74 deletions(-)
 create mode 100644 Documentation/admin-guide/perf/mrvl-odyssey-ddr-pmu.rst
 create mode 100644 Documentation/admin-guide/perf/mrvl-odyssey-tad-pmu.rst

-- 
2.25.1


