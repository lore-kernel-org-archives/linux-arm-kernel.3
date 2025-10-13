Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C758CCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 19:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aKm/qiTO3OsNR7odz6M2o+aEEAcHlXjEo3ihmA7qZHA=; b=E//DAKeBF9kCxl9LArnVsKqfGH
	zY+16S0CiI9yIpctPTDRe/gktkJcAK+fC/wPS66mAadS7kNm0Q2EaiXmKDTdPjlHnHSkkN+sBLFxC
	p4XUVOw89Lc6+jatMCNI4vRZA3OB3JsQQzcWAHXYezyI83W/4403boUFg5Rlybp/U+FcPKaqDY0ln
	HiID6zStxoj5F8pX9dzfoNtA8/8iPP0CLqJNecBDnv9bciE72wckqmvXqPv3v04Avl8pOw69k0kcz
	AF4jbuDRCSzU4IW4y/Xy1+mOkqMO9Q3dXK9URXeiEvs6qzpzVHtNB4RdDKfbXlGINqJV4HonTIbNs
	tLAYemJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ONj-0000000EJ1N-21tw;
	Mon, 13 Oct 2025 19:38:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ONh-0000000EIzx-03Nt;
	Mon, 13 Oct 2025 19:38:54 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHD7jo002351;
	Mon, 13 Oct 2025 19:38:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aKm/qiTO3OsNR7odz6M2o+aE
	EAcHlXjEo3ihmA7qZHA=; b=ctGre1VTvvWrXlwpQcUaFBlK16/88uzElF/wThCM
	2FqgRr3DTGQrDgjnyKtU/9hq21doJdlg7sIiLCjZx1RKEu2OfC1zaEmDsYrTrEXB
	qDQwFbtnPoJXKsHN0EgH925omjMarIehAffUJWrHmCf3XJRq6mx3qYLONc1P7pIy
	/gZoREudp+lIk9axiXFsPfIFJMUaNXKiwf/ykC0xJiG2bg8SvkaX7qKIcfhTDimv
	ZJv4EtSzcguk41HU9bFs4cnsMTNJnVKQchYaxWdiVwXv5CnywFvsg4KNUZaY3inj
	SeHN/9obeMPB1SW8Lz6RdCR7XdYwrpzLPjQ+LPAmvjKv7w==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfdk5vha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 19:38:31 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59DJcU5t005352
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 19:38:30 GMT
Received: from stor-berry.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Mon, 13 Oct 2025 12:38:29 -0700
From: "Bao D. Nguyen" <quic_nguyenb@quicinc.com>
To: <quic_cang@quicinc.com>, <quic_nitirawa@quicinc.com>, <bvanassche@acm.org>,
        <avri.altman@wdc.com>, <peter.wang@mediatek.com>,
        <adrian.hunter@intel.com>, <martin.petersen@oracle.com>
CC: <linux-scsi@vger.kernel.org>, "Bao D. Nguyen" <quic_nguyenb@quicinc.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley"
	<James.Bottomley@HansenPartnership.com>,
        Stanley Jhu <chu.stanley@gmail.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Matthias Brugger
	<matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Bean Huo <beanhuo@micron.com>, Manish Pandey <quic_mapa@quicinc.com>,
        open list
	<linux-kernel@vger.kernel.org>,
        "moderated list:UNIVERSAL FLASH STORAGE HOST
 CONTROLLER DRIVER..." <linux-mediatek@lists.infradead.org>,
        "open
 list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
	<linux-arm-msm@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC
 support:Keyword:mediatek" <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 1/2] scsi: ufs: core: Remove UFS_DEVICE_QUIRK_DELAY_AFTER_LPM quirk
Date: Mon, 13 Oct 2025 12:38:15 -0700
Message-ID: <25f134d5a42e8b8365be64d512d1bb5fc2bce6ff.1760383740.git.quic_nguyenb@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1760383740.git.quic_nguyenb@quicinc.com>
References: <cover.1760383740.git.quic_nguyenb@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: -rRshgRsJDIU6hydhF1KPzOFefn9P8hU
X-Authority-Analysis: v=2.4 cv=MrNfKmae c=1 sm=1 tr=0 ts=68ed5537 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=mpaa-ttXAAAA:8
 a=N54-gffFAAAA:8 a=7fqOwjOJ_3PN-8Lzk1wA:9 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: -rRshgRsJDIU6hydhF1KPzOFefn9P8hU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfX7URINBjqgPau
 LKQvIMGl8qog867/mDz1QntkZbNYTe0ysX2CxuhI0jNteKBzXiWttm3VCDTN0VmPfZ8FOcY6XDs
 0Aa+2Am5dGCQeMjES1tEN3dCPy5jR++D4XLpAFEbGJ9wpqSW91xUsmU+82+XVjEiCmujMIn3SmY
 Z0c0jNbOidzd1POgSxZg6fR9/hfGTiazbL/CbEdC5mcJWpGebkGc3MpfPRc9bNaAP54ZsuH+w+F
 X0yo/94pR2CYtzS5ST7qB+fdXo73WgxLdReSneDdjs4qxeMfRSAbTC34qXGzrOe+IsKXuVearsO
 e3CElhcLe5xCHPDu8zwkfjlugDgb1co3IDK7wDHTBdAVUbxthnuGdWkW17+xV6Llk2FYLzwVrK/
 lw278VfYTxoVvNB9TGaj+T+/PdbHzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_123853_174062_2C2BCB68 
X-CRM114-Status: GOOD (  17.53  )
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

After the ufs device vcc is turned off, all the ufs device
manufacturers require a period of power-off time before the
vcc can be turned on again. This requirement has been confirmed
with all the ufs device manufacturer's datasheets.

Remove the UFS_DEVICE_QUIRK_DELAY_AFTER_LPM quirk in the ufs
core driver and implement a universal delay that is required by
all the ufs device manufacturers. In addition, remove the
support for this quirk in the platform drivers.

Signed-off-by: Bao D. Nguyen <quic_nguyenb@quicinc.com>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Reviewed-by: Bart Van Assche <bvanassche@acm.org>
---
 drivers/ufs/core/ufshcd.c       |  5 ++---
 drivers/ufs/host/ufs-mediatek.c | 11 ++++-------
 drivers/ufs/host/ufs-qcom.c     |  3 ---
 include/ufs/ufs_quirks.h        |  7 -------
 4 files changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 2e1fa8c..e8842dc 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -9738,10 +9738,9 @@ static void ufshcd_vreg_set_lpm(struct ufs_hba *hba)
 	}
 
 	/*
-	 * Some UFS devices require delay after VCC power rail is turned-off.
+	 * All UFS devices require delay after VCC power rail is turned-off.
 	 */
-	if (vcc_off && hba->vreg_info.vcc &&
-		hba->dev_quirks & UFS_DEVICE_QUIRK_DELAY_AFTER_LPM)
+	if (vcc_off && hba->vreg_info.vcc && !hba->vreg_info.vcc->always_on)
 		usleep_range(5000, 5100);
 }
 
diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index f902ce0..5c204d1 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -40,8 +40,7 @@ static int  ufs_mtk_config_mcq(struct ufs_hba *hba, bool irq);
 static const struct ufs_dev_quirk ufs_mtk_dev_fixups[] = {
 	{ .wmanufacturerid = UFS_ANY_VENDOR,
 	  .model = UFS_ANY_MODEL,
-	  .quirk = UFS_DEVICE_QUIRK_DELAY_AFTER_LPM |
-		UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM },
+	  .quirk = UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM },
 	{ .wmanufacturerid = UFS_VENDOR_SKHYNIX,
 	  .model = "H9HQ21AFAMZDAR",
 	  .quirk = UFS_DEVICE_QUIRK_SUPPORT_EXTENDED_FEATURES },
@@ -1713,15 +1712,13 @@ static void ufs_mtk_fixup_dev_quirks(struct ufs_hba *hba)
 {
 	ufshcd_fixup_dev_quirks(hba, ufs_mtk_dev_fixups);
 
-	if (ufs_mtk_is_broken_vcc(hba) && hba->vreg_info.vcc &&
-	    (hba->dev_quirks & UFS_DEVICE_QUIRK_DELAY_AFTER_LPM)) {
+	if (ufs_mtk_is_broken_vcc(hba) && hba->vreg_info.vcc) {
 		hba->vreg_info.vcc->always_on = true;
 		/*
 		 * VCC will be kept always-on thus we don't
-		 * need any delay during regulator operations
+		 * need any delay before putting device's VCC in LPM mode.
 		 */
-		hba->dev_quirks &= ~(UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM |
-			UFS_DEVICE_QUIRK_DELAY_AFTER_LPM);
+		hba->dev_quirks &= ~UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM;
 	}
 
 	ufs_mtk_vreg_fix_vcc(hba);
diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index d15f1a1..15a9ffc8 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1025,9 +1025,6 @@ static struct ufs_dev_quirk ufs_qcom_dev_fixups[] = {
 	{ .wmanufacturerid = UFS_VENDOR_SKHYNIX,
 	  .model = UFS_ANY_MODEL,
 	  .quirk = UFS_DEVICE_QUIRK_DELAY_BEFORE_LPM },
-	{ .wmanufacturerid = UFS_VENDOR_TOSHIBA,
-	  .model = UFS_ANY_MODEL,
-	  .quirk = UFS_DEVICE_QUIRK_DELAY_AFTER_LPM },
 	{ .wmanufacturerid = UFS_VENDOR_WDC,
 	  .model = UFS_ANY_MODEL,
 	  .quirk = UFS_DEVICE_QUIRK_HOST_PA_TACTIVATE },
diff --git a/include/ufs/ufs_quirks.h b/include/ufs/ufs_quirks.h
index f52de5e..1b26932 100644
--- a/include/ufs/ufs_quirks.h
+++ b/include/ufs/ufs_quirks.h
@@ -101,13 +101,6 @@ struct ufs_dev_quirk {
 #define UFS_DEVICE_QUIRK_SUPPORT_EXTENDED_FEATURES (1 << 10)
 
 /*
- * Some UFS devices require delay after VCC power rail is turned-off.
- * Enable this quirk to introduce 5ms delays after VCC power-off during
- * suspend flow.
- */
-#define UFS_DEVICE_QUIRK_DELAY_AFTER_LPM        (1 << 11)
-
-/*
  * Some ufs devices may need more time to be in hibern8 before exiting.
  * Enable this quirk to give it an additional 100us.
  */
-- 
2.7.4


