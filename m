Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85EB7CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 13:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4ILSXxPgSbTbyXrKlDHpDiWu08cupdi2POfaElEq2Oc=; b=rqj0UqX0m2TWTNtrpD7hu7zTiY
	D3Z75iJ3jjJVwUqOmTG0dVqi1ogn4fuCQkCJVQ8WLyc/mISlJwZWPbRwxDFHVJ+J7VldSFnI/ryj4
	FHU19Qb2tAhFngyW+8EJBFwrMnlQr5DxB5KJa0peNfZyIdJd7sCdCOKeg1QOCHHlCghBOJQa6ZqTA
	A7a8Fo6nVlGNo/NyJOQlOcWc3vyxkPEkAez21nyqnELTHf7cklL3i2ceVzwHs6WjNbehjOdyd2d3r
	dKk4OCywIj04fUI+kDOs9j5GRZfPG51ircaBXFTZARMydtGr+SbTSPGZPMdSSGYp9HXgbLKMyDTJc
	Reesku+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7ZHa-0000000ABoN-0XXd;
	Sat, 11 Oct 2025 13:05:10 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7ZHW-0000000ABnv-1k5Y;
	Sat, 11 Oct 2025 13:05:08 +0000
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59B3kw0U030406;
	Sat, 11 Oct 2025 13:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=4ILSXxPgSbTbyXrKlDHpDiWu08cup
	di2POfaElEq2Oc=; b=Sp3bGEsTzRST4ZDhSMgv8AiXTrs99fzpxugaegkCnFgaM
	x/RzeSxAPkPDaE+1bQd4kfV0TGRKQEvHmPZVMhegOzDKI6XORy0Lw2/YZTUkeZtq
	dESCXxA9Mi29/REP2fKtVbi+sN0ipl6xEMSXLfDynE6mWysnbwJin6Hsd7IJnKIT
	hOpw59jxXQSaxnyNac0LeSIO2iTyK22wBKvnuk6QP+HkeMe6aCyBboVoGeYjofYf
	xw+6T2DK9oWWu7sOez9HiGEk0NT0qjEWVX9XLyGZqPyIncU6gmLUxVbWz9Chksgh
	nmIv2ckZJyb77vkEpRCwqcUwaSh5aRT698WVYi4Iw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 49qf9brap4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 11 Oct 2025 13:04:54 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59BD2X8J018503;
	Sat, 11 Oct 2025 13:04:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 49qdp5t74s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 11 Oct 2025 13:04:53 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 59BD4rBf012612;
	Sat, 11 Oct 2025 13:04:53 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 49qdp5t74h-1;
	Sat, 11 Oct 2025 13:04:53 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: michael.riesch@wolfvision.net, robh@kernel.org, s.hauer@pengutronix.de,
        dri-devel@lists.freedesktop.org, simona@ffwll.ch, airlied@gmail.com,
        tzimmermann@suse.de, mripard@kernel.org, hjc@rock-chips.com,
        heiko@sntech.de, andy.yan@rock-chips.com,
        maarten.lankhorst@linux.intel.com
Cc: alok.a.tiwari@oracle.com, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: [PATCH] drm/rockchip: vop2: use correct destination rectangle height check
Date: Sat, 11 Oct 2025 06:04:45 -0700
Message-ID: <20251011130450.123444-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-11_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0
 mlxlogscore=997 adultscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2510020000 definitions=main-2510110072
X-Proofpoint-GUID: UZENe1S85OUJrcpJijjnIW3oWlAL5XVV
X-Proofpoint-ORIG-GUID: UZENe1S85OUJrcpJijjnIW3oWlAL5XVV
X-Authority-Analysis: v=2.4 cv=QfNrf8bv c=1 sm=1 tr=0 ts=68ea55f7 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=x6icFKpwvdMA:10 a=yPCof4ZbAAAA:8 a=hxm_DrHGMFVl4YJQ088A:9
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxNyBTYWx0ZWRfXwx6QUBKiUut1
 C7IhZbgv7IT5kkCUgx0Qj4vApFJVxbLa0+HUroxp9dnHkUviJe3mvEnyOGU21mrs27tZsKQwEbe
 MmqL1L9WbaegOoe8/kmVOC6CTGndxE+VYRcrseGO51Ar9AvERPFzRstHvGPXmJV3j+3BeRPni5G
 TL+RPZTcKkRhBSkd+18FhWdp10Izh6xK92O4ZrUGVjQk0fFImmRwbsgUNpzDXwTQ4zBTwLWMHRL
 4sKDgilmTO10yWkcHmP2T7WWrbJYnB1jn8pTrbZCKwirzObKb9DLRjWph3yhdWE/DKwn0NjF16A
 rffMv6PzMQ6cL/L0y6A2kR2EkJKn9vNNSVBbm09cxgE8Ow8ZGSMFEn/Bn8kRKDBGxdvRcBeqbop
 eV0GWZfFLC9ICx+0lyoR4+2tR6z80Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_060507_036688_41F6E961 
X-CRM114-Status: GOOD (  11.74  )
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
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index b50927a824b4..697f54777a32 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1031,7 +1031,7 @@ static int vop2_plane_atomic_check(struct drm_plane *plane,
 		return format;
 
 	if (drm_rect_width(src) >> 16 < 4 || drm_rect_height(src) >> 16 < 4 ||
-	    drm_rect_width(dest) < 4 || drm_rect_width(dest) < 4) {
+	    drm_rect_width(dest) < 4 || drm_rect_heigh(dest) < 4) {
 		drm_err(vop2->drm, "Invalid size: %dx%d->%dx%d, min size is 4x4\n",
 			drm_rect_width(src) >> 16, drm_rect_height(src) >> 16,
 			drm_rect_width(dest), drm_rect_height(dest));
-- 
2.50.1


