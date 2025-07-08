Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3ECEC83F15
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 19:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=46+sQH1n5Knp03ba6G7W6BAhaEyMNgWTRzlpacnlqMs=; b=Dlctb8U/0i2l+4BKHxtY+eFKpX
	wyefODnemg0er57CZj6m6HBBWMJjwMMbLD0olbm4nj0fmxC3hnnntKQLUmk9lDjNcuDLOuLv7hXkz
	LctZ1zlCc9N38CvkM1xEAPASF3tvKhdVQzPt7HFpiBAUaFdBetw9eVIsXH60ryu6m3YwdEe466nN2
	C2/3pXJYHGJHrZCinDr+D5XrHp6BbUMNBgwxnqiVgSS5mziKNSXcoGZkXTy/0+14543w+Xmq/9foB
	XLjBWxBIfTlunmkVwTFyvRwoODo47takF5HtBrRH8gVREnQXJ3rECo7YX2t9TDhBXXIGxKkXlEkuY
	wRIOrO5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZEAY-00000006NP5-2CO1;
	Tue, 08 Jul 2025 19:39:58 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZCVU-00000006AoD-1X0l
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 17:53:29 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 568HbKIh029071;
	Tue, 8 Jul 2025 17:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=46+sQH1n5Knp03ba
	6G7W6BAhaEyMNgWTRzlpacnlqMs=; b=k9Ksgk6YVqeA7vj2QWjdrCAism5+PcGe
	A7hn+6+1PcV5lj7m/9paLe0X9ws0X2hk9lvveIv1JLxSwb5jdsES7gi5axod37LF
	VZM9wHdeGfLoOmyIIPBgrGyUVWpwAthwvZnxyuc+ErYWWl2jki53MESaE6zJYU65
	Wxy8L/sNPwUGFy3HxlaYuXDrjG19ZF24TZfxGONWGefg02/1yOGhB1kq09b3qCa/
	IIuG61SYKQP3sWQ6pOfoKu2Gct5c9Vk/Ru/HwHg2AlKewzRcniHcr9C4GeEFkFBs
	R5IintR7VM/Ht9wjKVldwoNpFvlhvWt1f87lww8kF6BVkD6KXaiTXg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47s7vsg11m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Jul 2025 17:53:23 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 568H0j3j027404;
	Tue, 8 Jul 2025 17:53:22 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ptg9x5bq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 08 Jul 2025 17:53:22 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 568HrLif020285;
	Tue, 8 Jul 2025 17:53:21 GMT
Received: from ca-dev110.us.oracle.com (ca-dev110.us.oracle.com [10.129.136.45])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 47ptg9x5ag-1;
	Tue, 08 Jul 2025 17:53:21 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: sgoutham@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        horms@kernel.org, netdev@vger.kernel.org
Cc: alok.a.tiwari@oracle.com, linux-arm-kernel@lists.infradead.org,
        darren.kenny@oracle.com, linux-kernel@vger.kernel.org
Subject: [PATCH net-next v2] net: thunderx: Fix format-truncation warning in bgx_acpi_match_id()
Date: Tue,  8 Jul 2025 10:52:43 -0700
Message-ID: <20250708175250.2090112-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-08_05,2025-07-07_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507080149
X-Authority-Analysis: v=2.4 cv=dYCA3WXe c=1 sm=1 tr=0 ts=686d5b13 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=xO2tqtdlJwZuTTCz-PAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12057
X-Proofpoint-GUID: BUzLkKWaWhkHOaiMx5gcs2nadI9h35Mu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE0OSBTYWx0ZWRfX6BPQtWttynJU C6t848ZnUzq9hQjGXWGkV1PZGQQZ9lN38EIh9zD7t1fsSBfStknJTcxOqshnECVZcVc3SeVH+fo zmUtkIrAkyNpcxXLAD11ssxizZg+6/fFfTXn7NBWV2ChpWRfBOaNFHX0Ne/9BHEkN0KoeCTYV+N
 hkMR7sGQBRIF5J0hwSl/C35/NrL5eggZ8xwdQkdr8vVd/3inDx1yBwBUufXw36dGEP2UZ2bLTUI vh2m714nDfN/tCC5zPcvokvICjJrZKVqi2Az6mhlV3vSf0Kb+PjF7epjDw2W4pkBMRITChbwuzf OZCZUUggiNF/kKapqRutc93FkPLrC3/tn40iwCiCLZ5AOKi4Jtg/qH/4HPeTP6rfICQ+UvBx8Xd
 GbwYAOtjhysjPuZTN6RtE5vGHiU1VAtiX1kmpUIw5jrZGlBGoVfmLdJ5QehUgaFoxc6tPlpz
X-Proofpoint-ORIG-GUID: BUzLkKWaWhkHOaiMx5gcs2nadI9h35Mu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_105328_405171_A5EA148A 
X-CRM114-Status: GOOD (  14.14  )
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

The buffer bgx_sel used in snprintf() was too small to safely hold
the formatted string "BGX%d" for all valid bgx_id values. This caused
a -Wformat-truncation warning with Werror enabled during build.

Increase the buffer size from 5 to 8 and use sizeof(bgx_sel) in
snprintf() to ensure safety and suppress the warning.

Build warning:
  CC      drivers/net/ethernet/cavium/thunder/thunder_bgx.o
  drivers/net/ethernet/cavium/thunder/thunder_bgx.c: In function
‘bgx_acpi_match_id’:
  drivers/net/ethernet/cavium/thunder/thunder_bgx.c:1434:27: error: ‘%d’
directive output may be truncated writing between 1 and 3 bytes into a
region of size 2 [-Werror=format-truncation=]
    snprintf(bgx_sel, 5, "BGX%d", bgx->bgx_id);
                             ^~
  drivers/net/ethernet/cavium/thunder/thunder_bgx.c:1434:23: note:
directive argument in the range [0, 255]
    snprintf(bgx_sel, 5, "BGX%d", bgx->bgx_id);
                         ^~~~~~~
  drivers/net/ethernet/cavium/thunder/thunder_bgx.c:1434:2: note:
‘snprintf’ output between 5 and 7 bytes into a destination of size 5
    snprintf(bgx_sel, 5, "BGX%d", bgx->bgx_id);

compiler warning due to insufficient snprintf buffer size.

Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
v1->v2
No changes. Targeting for net-next.
https://lore.kernel.org/all/20250708160957.GQ452973@horms.kernel.org/
---
 drivers/net/ethernet/cavium/thunder/thunder_bgx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
index 3b7ad744b2dd6..2eea3142eebea 100644
--- a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
+++ b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
@@ -1429,9 +1429,9 @@ static acpi_status bgx_acpi_match_id(acpi_handle handle, u32 lvl,
 {
 	struct acpi_buffer string = { ACPI_ALLOCATE_BUFFER, NULL };
 	struct bgx *bgx = context;
-	char bgx_sel[5];
+	char bgx_sel[8];
 
-	snprintf(bgx_sel, 5, "BGX%d", bgx->bgx_id);
+	snprintf(bgx_sel, sizeof(bgx_sel), "BGX%d", bgx->bgx_id);
 	if (ACPI_FAILURE(acpi_get_name(handle, ACPI_SINGLE_NAME, &string))) {
 		pr_warn("Invalid link device\n");
 		return AE_OK;
-- 
2.46.0


