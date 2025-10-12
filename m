Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE5BCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Oct 2025 14:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dSKG4SyNo0gaYpGXItd1jsVLKWrJlF0G3L0At3p9re0=; b=FK3amyyPbyD6dDPFMTG+2o/6wx
	9mf8VxrCstoLE+sOuN6t8tbhlhcW7ywUdtWaFgRVTT25H5rZz4P9zjkp48S6DJwa5GpcLbgUb6ymo
	1FuuWkzKI1vMgu2w+lt6DAHFRsc+bu+fdz26G58MkW7hW8C/932y0YIbhLbcPOs/98rZS+smWhAI/
	UVjdc9iVWGoCGU6kaarKdLjCsbYfd17wFoSX6a8CnPDrFpFZb/7/XflrVrK7f+w+QN1hpuOqsUdq0
	WBvwwR2fQpWe/0lFTzrKt8SRAxW+4MP3Pa789/TTj1gtd/RYJXc3jh7nNdjqDawjPgjP1Kyx1o6cF
	OVY17ICg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7wvz-0000000BPda-0zJ3;
	Sun, 12 Oct 2025 14:20:27 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7wvv-0000000BPco-0BdA;
	Sun, 12 Oct 2025 14:20:24 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59CCCoxY026585;
	Sun, 12 Oct 2025 14:20:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=dSKG4SyNo0gaYpGXItd1jsVLKWrJl
	F0G3L0At3p9re0=; b=MLlkMCT9mtxxtFKPjjnZP0zUiAs21SfeI25eSPp+p7GNq
	D5olZSP795qsvqtH8cvmARqIQmrfY4eBNo70NcHwlor0kvalVXfh4Ht4OhLmZiCr
	vrER6ko6wqev6Le4lq5Olru9m/I+Piybim0l5BMTNbd3yfjCQAx4NL6USXj3yVVo
	+1/5QDMSOSVUUlZgTfUN90UUN5Rpa0D39OLF2gcHyLdMM53y1hzVqZhj/xk4C2Fp
	me2k5DNytG8nYW9hjk2TyeOiGF7f2qVOiWuElSOR+FvCJq28mPQ01i4Sg6368Fkj
	T+sml1GTwEwBFkZp4xhKfKQkpz2DA6U3Q73qSz/qA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qf47h13d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 12 Oct 2025 14:20:11 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59CCCYWT038325;
	Sun, 12 Oct 2025 14:20:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 49qdpcpm6y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 12 Oct 2025 14:20:10 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59CEK9ot017983;
	Sun, 12 Oct 2025 14:20:09 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 49qdpcpm67-1;
	Sun, 12 Oct 2025 14:20:09 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: christianshewitt@gmail.com, michael.riesch@wolfvision.net, robh@kernel.org,
        s.hauer@pengutronix.de, dri-devel@lists.freedesktop.org,
        simona@ffwll.ch, airlied@gmail.com, tzimmermann@suse.de,
        mripard@kernel.org, hjc@rock-chips.com, heiko@sntech.de,
        andy.yan@rock-chips.com, maarten.lankhorst@linux.intel.com
Cc: alok.a.tiwari@oracle.com, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: [PATCH v2] drm/rockchip: vop2: use correct destination rectangle height check
Date: Sun, 12 Oct 2025 07:20:01 -0700
Message-ID: <20251012142005.660727-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-12_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510120075
X-Authority-Analysis: v=2.4 cv=SK9PlevH c=1 sm=1 tr=0 ts=68ebb91b b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=x6icFKpwvdMA:10 a=yPCof4ZbAAAA:8 a=hxm_DrHGMFVl4YJQ088A:9 cc=ntf
 awl=host:12091
X-Proofpoint-GUID: StkRRQBnFKGXHAixh64KUh0QRVi1Lxh0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNiBTYWx0ZWRfX0cxlfedsE8qn
 1AOf75wrgH900ULgKQwNoCLGi0D0VJ4FLcyXg3AFAhVqsdI/NwYmpcq1QqsR0HxF6Wy+a3mS6Dc
 h3xMPCUjzBKKB2/JZFPRsweoj226hnM4xordj5G9KZScNca9hgmc0f/LBF7udk+bsw15kj4iClV
 Ptw6IBrzkAksZQpyQNRlsa+TdsnH+ywLBS51U1My9IMhJjEgy5sNrDDfS4pTJz9GP+sXY09fDVf
 v210AJAaMo/qRXWileO2hRgZA//sP9unehQE+Eb3bBCICRgByx8wT7IsPISlo8FG0Fm7jf6QPIS
 GpVnA60grTOlTgwDbTcTDq0+cYAgUa/YpeTseMq/vHwXlds1pyL6ieFZCoMHwNeDNIzJ39ecTsx
 23kUFR41qMNGhfvABo17GOKIZn+PiZ1C4fxRAR9ZpC++QU6SO8w=
X-Proofpoint-ORIG-GUID: StkRRQBnFKGXHAixh64KUh0QRVi1Lxh0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_072023_518725_D6C498B6 
X-CRM114-Status: GOOD (  11.96  )
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

The vop2_plane_atomic_check() function incorrectly checks
drm_rect_width(dest) twice instead of verifying both width and height.
Fix the second condition to use drm_rect_height(dest) so that invalid
destination rectangles with height < 4 are correctly rejected.

Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
v1 -> v2
fix typo drm_rect_heigh -> drm_rect_height
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index b50927a824b4..7ec7bea5e38e 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1031,7 +1031,7 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 		return format;
 
 	if (drm_rect_width(src) >> 16 < 4 || drm_rect_height(src) >> 16 < 4 ||
-	    drm_rect_width(dest) < 4 || drm_rect_width(dest) < 4) {
+	    drm_rect_width(dest) < 4 || drm_rect_height(dest) < 4) {
 		drm_err(vop2->drm, "Invalid size: %dx%d->%dx%d, min size is 4x4\n",
 			drm_rect_width(src) >> 16, drm_rect_height(src) >> 16,
 			drm_rect_width(dest), drm_rect_height(dest));
-- 
2.50.1


