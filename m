Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD90C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 15:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Nu+HKnOEwgShghELa7WQcOASZjIV4FEdtBpsIJxTXv8=; b=S2l1rTyJhZfXsDmL0Vc9/11uHt
	CO25NYRQRXraNuT8viosLJOr4B04yLh58xnd4/c9C7kTyLn/8+VJe6UTmzpTAaluO6qsmcAnyAxYu
	1IIoKdHNWbRS6mgkGvFHybGZTtdOM9V+khMrHyG7Nwa/mQBRZWD6sy5e3/4fRiNWfebi1xKYfTPGi
	jv1VwH56CtXD10iUd3TmA3AP1DiRTSF9Injq60GbtLjxeRJw6QkTheIVrxixsU0oCm76UxTs6tRxP
	N9EL1pIh8kplv8PQV5jHf0s82yDa3JRmWvS5SgjKfPX0XiZuYpbkj5KdyX+iFG4HQR5uRcvBSQX30
	LvRroVxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaFgb-0000000F9TI-1pwg;
	Fri, 11 Jul 2025 15:29:17 +0000
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaEOM-0000000EzIn-14Fl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 14:06:23 +0000
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BDgiiX007804;
	Fri, 11 Jul 2025 14:06:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=Nu+HKnOEwgShghEL
	a7WQcOASZjIV4FEdtBpsIJxTXv8=; b=edh4/NK1FwGDNvN1eSm9yaGdcor5IebR
	vc+jfiY8HM14gFlYi6vbGMmY+s8GnZgdEF6JY0564CCv7TDa8619Is6zLvsEp6b6
	ChZR0NGcoIGa1HA3Tb29vxwXR7lpEHgaixHvVS7Q9BHiYQziMoJOFbLDRC+wWLY3
	y4wmDsOQucCIibIGqquJ/9cuBCrxIYVAaSMKluQfVOtfUaikpaFpcKp3uE5fg/G4
	q1i07Zpu4aOjOSOVisE0JGxURU1oqOhfWUIdL+wf1gzaeMeGB5SWzd9lBzahl4RA
	aUiaq5GJdiTaUCJG5qtQ7s6qJ4tkGfhjzvhrM3t9YaFXI9XPr3HQUw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47u3qpg1ng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Jul 2025 14:06:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 56BC5aOP027448;
	Fri, 11 Jul 2025 14:06:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ptgdkk32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 11 Jul 2025 14:06:16 +0000
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56BE6Frj032682;
	Fri, 11 Jul 2025 14:06:15 GMT
Received: from ca-dev110.us.oracle.com (ca-dev110.us.oracle.com [10.129.136.45])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 47ptgdkjxe-1;
	Fri, 11 Jul 2025 14:06:15 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: sgoutham@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        horms@kernel.org, netdev@vger.kernel.org
Cc: alok.a.tiwari@oracle.com, linux-arm-kernel@lists.infradead.org,
        darren.kenny@oracle.com, linux-kernel@vger.kernel.org
Subject: [PATCH net-next v3] net: thunderx: Fix format-truncation warning in bgx_acpi_match_id()
Date: Fri, 11 Jul 2025 07:05:30 -0700
Message-ID: <20250711140532.2463602-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 adultscore=0
 suspectscore=0 phishscore=0 mlxlogscore=999 bulkscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507110100
X-Proofpoint-ORIG-GUID: cFBORv1YaTLN0JjpskotdNEKFt1USsBN
X-Authority-Analysis: v=2.4 cv=L4AdQ/T8 c=1 sm=1 tr=0 ts=68711a59 b=1 cx=c_pps a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=xO2tqtdlJwZuTTCz-PAA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:12061
X-Proofpoint-GUID: cFBORv1YaTLN0JjpskotdNEKFt1USsBN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzExMDEwMCBTYWx0ZWRfXwi8UV4ufyjvg 06j0/3Ill/N8+mJTi6eO9wWPNcMdcnyc9vMcKGohdwEAMRdbOipIesE9+qvZq7cZ1PzvjcWIpBp 3jpZEfyRymxz/pb6C2pwY4NngCFZXq6LjwrcNqtCMf9eiQNwfp+Jfc1y7q9J1CrH0tTipzqMfN6
 DuRkc9RThOeWeLvAEndHWCiPhSK0XqlWNPdb95gddNGdb/921IRkliPEJsJvc/81c99mO3S7eVn S4+zsisofXk+uSeNIRY616JTNzehAd6o7AcEX7C+e9EWiaXP32cAMxHUCAAinxdpXtH4ucW8/zP ETH8h5PKz22Tz08tjPyfyIY7CoUJUaZOTyTuGEcR0Ibz2jSNoZTZM8lxtcx6Aer6j8BL3c737Q4
 fcUfJdDyIitRzZRkn6sUTYILpF/W0ZKKfl2nBOpV4haJr3gLgL3fiR0QdXl5ZJKnciI0A+DM
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_070622_293870_AD19B839 
X-CRM114-Status: GOOD (  14.79  )
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
a -Wformat-truncation warning with `Werror` enabled during build.

Increase the buffer size from 5 to 7 and use `sizeof(bgx_sel)` in
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
Reviewed-by: Simon Horman <horms@kernel.org>
---
v2->v3
added Reviewed-by: Simon
used bgx_sel[7] as suggested by Jakub Kicinski
https://lore.kernel.org/all/20250710153422.6adae255@kernel.org/
v1->v2
No changes. Targeting for net-next.
https://lore.kernel.org/all/20250708160957.GQ452973@horms.kernel.org/
---
 drivers/net/ethernet/cavium/thunder/thunder_bgx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
index 3b7ad744b2dd6..21495b5dce254 100644
--- a/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
+++ b/drivers/net/ethernet/cavium/thunder/thunder_bgx.c
@@ -1429,9 +1429,9 @@ static acpi_status bgx_acpi_match_id(acpi_handle handle, u32 lvl,
 {
 	struct acpi_buffer string = { ACPI_ALLOCATE_BUFFER, NULL };
 	struct bgx *bgx = context;
-	char bgx_sel[5];
+	char bgx_sel[7];
 
-	snprintf(bgx_sel, 5, "BGX%d", bgx->bgx_id);
+	snprintf(bgx_sel, sizeof(bgx_sel), "BGX%d", bgx->bgx_id);
 	if (ACPI_FAILURE(acpi_get_name(handle, ACPI_SINGLE_NAME, &string))) {
 		pr_warn("Invalid link device\n");
 		return AE_OK;
-- 
2.46.0


