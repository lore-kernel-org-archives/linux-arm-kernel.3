Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418C9C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 19:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=amTDFcbj9f1xnTT+UZkRmI0REECJuhlFHPddZ2sUimI=; b=Txjtihd2uwXcVArw6f6GM48pU0
	p12x718BetcyWzrdrp5YS9bPT2zdukVkyEtwTE1FcCQtngn107qqbPYIhmENMcxgbQcsC2tIUwv7r
	9sGJtoDvOHAPV7RLPzsYOnrn2uv8tx/d+PagQAEasotTEs2cYzZo4k2IbTyE4Rss8OrzZFGIn4NZP
	ucKY87gthwcvuDrfzrqJ5P36hmXg2T8hRuUvyeG9ThyeFBjNf9gW9fVkla85R8Lg7bbMSpQcJJjC2
	adkAAgL5GQLqfgnppUjuxyEgcUdrSz2ICRGCnybT4OXMaSs1vgVGqhpTi3uEzC2fvkpF8WGwRubuh
	J+WHWalQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYVS7-00000000kxZ-0ehK;
	Sun, 06 Jul 2025 19:55:07 +0000
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYVPX-00000000knh-3xGF
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 19:52:29 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 566GUf7l002277;
	Sun, 6 Jul 2025 19:52:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=amTDFcbj9f1xnTT+
	UZkRmI0REECJuhlFHPddZ2sUimI=; b=S2ycRp0zW2cu1HEjtxIysddKylcXxg5+
	LVal1g4RKqQ7ykuTGXXXzhaHDgDwrRSNfD+4vFw0vB/lWRaJotgb/R9LagGqgMpG
	GKU4s3TUata5fTs66o6ud3/ClZzlxYQBqOPDoGNY475B3gYVOwmlDcCmjcjPGBxD
	2tq63J1e2LLWq7MZZHP+/KQfH9vYlqUgWBgcXdrVVXOmej6lyZN3Y2ZW+tI4n96A
	n0kJgJLikpleLt03omaS/AApnbXn5UAwwzGucyN69F8N0WSnjny/nvopXz+odspG
	77jQkEfz3RhtMzRnwlejF1tjUcgfDGMbI8jbPtc5+3e7lyFTgAvDKA==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ptu7hg45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 06 Jul 2025 19:52:16 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 566H0Spl040487;
	Sun, 6 Jul 2025 19:52:15 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ptg7rq2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 06 Jul 2025 19:52:15 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 566JqEfg028809;
	Sun, 6 Jul 2025 19:52:14 GMT
Received: from ca-dev110.us.oracle.com (ca-dev110.us.oracle.com [10.129.136.45])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 47ptg7rq2m-1;
	Sun, 06 Jul 2025 19:52:14 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: sgoutham@marvell.com, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        horms@kernel.org, netdev@vger.kernel.org
Cc: alok.a.tiwari@oracle.com, linux-arm-kernel@lists.infradead.org,
        darren.kenny@oracle.com, linux-kernel@vger.kernel.org
Subject: [PATCH net] net: thunderx: Fix format-truncation warning in bgx_acpi_match_id()
Date: Sun,  6 Jul 2025 12:51:42 -0700
Message-ID: <20250706195145.1369958-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507060127
X-Proofpoint-ORIG-GUID: TA32LHohU68ojy7Z6Bs4ZPiLwS7zjNyc
X-Proofpoint-GUID: TA32LHohU68ojy7Z6Bs4ZPiLwS7zjNyc
X-Authority-Analysis: v=2.4 cv=IMQCChvG c=1 sm=1 tr=0 ts=686ad3f0 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=yPCof4ZbAAAA:8 a=xO2tqtdlJwZuTTCz-PAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDEyNyBTYWx0ZWRfX290a2KG5Uw11 NJH7ouZRRuuXsyoy1I4TPFcf2PfG3h7fmI3f6dYRG6PX4IUvIBiaF/jMs4IkkiQWt2Wcuy5ZuZB JsBFB+ZkaXMRfN/4o+REHcvAZEcSPg9KWdEPRnHGInzTlSOooxAeHUVRlg7qRaooyFAPe6WLuEG
 Mh5zdJyG4IojyASk9WtvpWKu7SYARl3xlzqTJ+xPSxciCK0/2aJxwj2e6aUQyfJlimpXBjE2CeE Uu5cZol1ZV6iz5ghsXRlmM77UAfTdUoUYZMjbGFPUhSisQELfcJIm8WgjxB8Lmt8mZ/PkOL1Nm0 2QEDxpg3UoCGkNlx53IafoRjg6hP2ROiZBq+bl4iwQSMEN+pch2yXGSj14a/bR2Rb6ySn0R7uJ/
 ToKMDxLMLOnVnZe6QKJxy+UsLdY1C66Sluz2RIYYErL7Myj+W4wp0OU6D0nqq5GEQ+deJB5p
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_125228_106175_B9AB8A3E 
X-CRM114-Status: GOOD (  13.42  )
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


