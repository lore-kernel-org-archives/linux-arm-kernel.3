Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16F2CCD8C8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 12:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rOdHEacwbEYqnbjI8muvDVSMA0W4NJxUkCaq5J6Qp5E=; b=CvvgE/ax7Bf14TAyK8zXuarKQO
	btK4QjdadCzG+Wxk6g91061IEv7eO9/a+AW1Z2NRgDvyYDvaT9I82YMkJyf8JTU9Q3fGfi5zkyzRJ
	DtQ2YP6Wkv/mCuJcIipVrxq4bV23c8t4rdrwc+HIdL+yM4ObOX0krlLStdAvPNwuF13PnlDXMoCLt
	UD22IW431kXkT4jEJR/SMLC+RnLxMymOyKariiGC7J779PP/DcqdjunxoiWj8QJ6ft+G3J5AyIyVD
	cYCZopR7LS/St6BiO97EG5UbungkHOUZZoQW40PWq986XV9FYgZ0sbHFoxDkVI5VVgBfVn7LrwBTm
	WFVl1bUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWCyI-00000002FUb-0kIR;
	Sun, 07 Jun 2026 12:51:22 +0000
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWCyE-00000002FTj-3lDb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Jun 2026 12:51:20 +0000
Received: from pps.filterd (m0431383.ppops.net [127.0.0.1])
	by mx0b-0016f401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657B1DpJ3644857;
	Sun, 7 Jun 2026 05:51:07 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	pfpt0220; bh=rOdHEacwbEYqnbjI8muvDVSMA0W4NJxUkCaq5J6Qp5E=; b=CCa
	S3Zmd2eyAK4+9NLoKlSkUAC/eIujUqsjK7pVlYUIOw5WxuodawUxxGnCLmFljNXk
	QHUrkBHWUYGWO+TT+cNfeKsUg8nsVtajUJxOCLS9Q9dqbuDtx1OtWBfCVf13T9Qe
	odUOu+KJh1nRQm0o2vyReOc0zyNl/Q8y/mO+CTCsDv5fZ+fLMgrZlsncUXz2ZkBR
	x6hFzpWK9ym6NTIo0sIOb83OmVhUWCZTxKtyLFmeJUa+zvAr2owK4PIoOn6XE7Jx
	feCnzC4iQFmlswKajJRSp0uPTYnG4KKkX86/PLHpC0fthhmYJgqqZkbWaoGJSLD1
	ND88gCkYdP/XVn6o3QQ==
Received: from dc6wp-exch02.marvell.com ([4.21.29.225])
	by mx0b-0016f401.pphosted.com (PPS) with ESMTPS id 4en4a5gmc6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 07 Jun 2026 05:51:06 -0700 (PDT)
Received: from DC6WP-EXCH02.marvell.com (10.76.176.209) by
 DC6WP-EXCH02.marvell.com (10.76.176.209) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 7 Jun 2026 05:51:06 -0700
Received: from maili.marvell.com (10.69.176.80) by DC6WP-EXCH02.marvell.com
 (10.76.176.209) with Microsoft SMTP Server id 15.2.1544.25 via Frontend
 Transport; Sun, 7 Jun 2026 05:51:06 -0700
Received: from hyd1soter3.marvell.com (unknown [10.29.37.12])
	by maili.marvell.com (Postfix) with ESMTP id 38C893F70C5;
	Sun,  7 Jun 2026 05:51:02 -0700 (PDT)
From: Geetha sowjanya <gakula@marvell.com>
To: <linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>
CC: <mark.rutland@arm.com>, <will@kernel.org>, <krzk+dt@kernel.org>,
        <gakula@marvell.com>
Subject: [PATCH 0/3] perf: marvell: LLC-TAD PMU MPAM filtering and CN20K support
Date: Sun, 7 Jun 2026 18:20:58 +0530
Message-ID: <20260607125101.17778-1-gakula@marvell.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Authority-Analysis: v=2.4 cv=HpBG3UTS c=1 sm=1 tr=0 ts=6a25693a cx=c_pps
 a=gIfcoYsirJbf48DBMSPrZA==:117 a=gIfcoYsirJbf48DBMSPrZA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=l0iWHRpgs5sLHlkKQ1IR:22
 a=qit2iCtTFQkLgVSMPQTB:22 a=M5GUcnROAAAA:8 a=t6Rdc7sheOvqEPeo2a0A:9
 a=OBjm3rFKGHvpk9ecZwUJ:22
X-Proofpoint-ORIG-GUID: 4NAtQbjwxdP84H6pLHwtUxd9GIq4jlFF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDEyOCBTYWx0ZWRfX6DMcniO66Y2g
 JypRtDdqILsgCJITg73KlwjlQmjx8mkLa54gdoz8qTig3WOPL3DLjUJDFuwqwHbXJN9YZOJtEuq
 b4mxEvHiNZ56KXMt1wYC90vFvEvOgYZmRNM649Ar7OfVvWUR5OolYTcY6eIY9iaO/rlwH+p8fUO
 9ujYaPzpoqq2Y+h09ysvSzGl8k5WoYniHM8kNl8ScOpVDgf8lhRvhuJnMgEkvb5SWFz0IBYrPjD
 Ho5vRN40NXNZQ1TJPf37mIBVUQG+N9LqVSIc+DzbTBmvZV7IdT1TkHK3cCwSxUO4zRnS8O5VWwx
 CO0mea81HC/GpB1SWNNAF9izLDmSMmNTom2FyWlKvq+Xsf1FIjMLV/CtmvBWN0NlaQ54IuuFPfO
 E2VuuK3co835zRCYwZ7pXi17+ML+Dn7rjjZvo3c2Amhz0iKhSUGlZGsQXtk8O9IPzqiXZ2kKOYE
 19dBeQ5O1QtgnpQTWUg==
X-Proofpoint-GUID: 4NAtQbjwxdP84H6pLHwtUxd9GIq4jlFF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_03,2026-06-05_02,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260607_055119_058617_5504BBDD 
X-CRM114-Status: UNSURE (   7.49  )
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

This series extends the Marvell LLC-TAD performance driver used on CN10K
and CN20K systems.

Patch 1 adds optional MPAM partition-id filtering for the subset of TAD
events that support it, exposes a partid field in the PMU format string,
and keeps the reduced Odyssey event surface without advertising partid
where it does not apply.

Patch 2 introduces CN20K LLC-TAD support: non-standard PFC/PRF offsets,
additional programmable events, CN20K-specific MPAM encoding for the V3
profile, and device discovery via DeviceTree and ACPI.


Tanmay Jagdale (1):
  perf: marvell: Add MPAM partid filtering to CN10K TAD PMU

Geetha sowjanya (1):
  perf: marvell: Add CN20K LLC-TAD PMU support
  dt-bindings: perf: marvell: Extend CN10K TAD PMU binding for CN20K

Signed-off-by: Geetha sowjanya <gakula@marvell.com>

-- 
2.25.1

