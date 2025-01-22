Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE1CC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 10:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4manhHXny9Fi7hRVodbdsginf0hAnZ34xkZ6PFG3Ifw=; b=H+eojvyKqRI2acWNLeA5l079hE
	bm3XF2XMEca6XP/zx3gZOHcXDIU6IgR9m+8+G3q7iyEkfcAOxjfwVbotLQofvWCdx0Vo2TR/ah9QF
	mMEtCtuQymFBowQyydVrePIoTdxs8aGNlx17GCdnC/aOoHc6ziytl1o8m5xOquasXHayPKmNhcicG
	zpLR8gmEErrZLia7RN1/RQ3D63SlUwHFVWrNcCr2p3IdSvoBUSXtzO4RXCvAyq9koj9HrENnWhdLS
	z5LFIneXQSywG20o34qhWIowPhOSvJ3AU15pnlHP07X0lMsUncP3KgNeS0gHKTcQVNK76wwyR/GmV
	u1rCSy6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taXcF-00000009tFF-1QmF;
	Wed, 22 Jan 2025 10:05:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taXam-00000009sq1-0P78;
	Wed, 22 Jan 2025 10:04:13 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50M6I7aY023350;
	Wed, 22 Jan 2025 10:02:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4manhHXny9F
	i7hRVodbdsginf0hAnZ34xkZ6PFG3Ifw=; b=EhxhfuoUpWcrw4H3JiOfxw+aMZW
	FAakIlbxCzmYw0fqijNY3Z+0WtePR4B+pMolM8nOY2qsWsEDzuHhNR5v3MObgNs8
	pLUEdlyvJLGISsi9XrNp6g6xA8Cph6Bx2ooVrv5mwVH/mddBEPtiWeFDgXcqaRxq
	yZVFsSO3iE8uzSj6lCh5PeWbXghV70IW8NFcQX/D/RWNIFlH+E4k+IbYSSIxb7Gn
	5B64YwZ406jJMSjz/pUdHlbkFUeMVowEDuBxjTvYFsM2M6iF+x6KlE/DXnab0Ao7
	i2GDEjxWrvX28zh6TUFU/sxEKE8NZs5MJLzXIaVF5ruCmA4Mx6pweGPNpxw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44au9eghj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:02:57 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 50MA2cRs006767;
	Wed, 22 Jan 2025 10:02:54 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4485cm3b6d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:02:54 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50MA2saQ006794;
	Wed, 22 Jan 2025 10:02:54 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 50MA2sZ2006792
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jan 2025 10:02:54 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 274BB40CE9; Wed, 22 Jan 2025 18:02:53 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Alim Akhtar <alim.akhtar@samsung.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Peter Wang <peter.wang@mediatek.com>,
        Stanley Jhu <chu.stanley@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Andrew Halaney <ahalaney@redhat.com>,
        Maramaina Naresh <quic_mnaresh@quicinc.com>,
        Eric Biggers <ebiggers@google.com>, Minwoo Im <minwoo.im@samsung.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-mediatek@lists.infradead.org (moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER...),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek)
Subject: [PATCH v2 1/8] scsi: ufs: core: Pass target_freq to clk_scale_notify() vops
Date: Wed, 22 Jan 2025 18:02:07 +0800
Message-Id: <20250122100214.489749-2-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
References: <20250122100214.489749-1-quic_ziqichen@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5ZQFgq9QRSnfX9-yTrJraYm7RFXEx-Dv
X-Proofpoint-ORIG-GUID: 5ZQFgq9QRSnfX9-yTrJraYm7RFXEx-Dv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_04,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0 phishscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_020412_250457_1F10D820 
X-CRM114-Status: GOOD (  17.70  )
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

From: Can Guo <quic_cang@quicinc.com>

Instead of only two frequencies, If OPP V2 is used, the UFS devfreq clock
scaling may scale the clock among multiple frequencies, so just passing
up/down to vops clk_scale_notify() is not enough to cover the intermediate
clock freqs between the min and max freqs. Hence pass the target_freq ,
which will be used in successive commits, to clk_scale_notify() to allow
the vops to perform corresponding configurations with regard to the clock
freqs.

Signed-off-by: Can Guo <quic_cang@quicinc.com>
Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
---

v1 -> v2:
Modify commit message to make it more clear.
---
 drivers/ufs/core/ufshcd-priv.h  | 7 ++++---
 drivers/ufs/core/ufshcd.c       | 4 ++--
 drivers/ufs/host/ufs-mediatek.c | 1 +
 drivers/ufs/host/ufs-qcom.c     | 5 +++--
 include/ufs/ufshcd.h            | 2 +-
 5 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/ufs/core/ufshcd-priv.h b/drivers/ufs/core/ufshcd-priv.h
index 9ffd94ddf8c7..0549b65f71ed 100644
--- a/drivers/ufs/core/ufshcd-priv.h
+++ b/drivers/ufs/core/ufshcd-priv.h
@@ -117,11 +117,12 @@ static inline u32 ufshcd_vops_get_ufs_hci_version(struct ufs_hba *hba)
 	return ufshcd_readl(hba, REG_UFS_VERSION);
 }
 
-static inline int ufshcd_vops_clk_scale_notify(struct ufs_hba *hba,
-			bool up, enum ufs_notify_change_status status)
+static inline int ufshcd_vops_clk_scale_notify(struct ufs_hba *hba, bool up,
+					       unsigned long target_freq,
+					       enum ufs_notify_change_status status)
 {
 	if (hba->vops && hba->vops->clk_scale_notify)
-		return hba->vops->clk_scale_notify(hba, up, status);
+		return hba->vops->clk_scale_notify(hba, up, target_freq, status);
 	return 0;
 }
 
diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index acc3607bbd9c..8d295cc827cc 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -1157,7 +1157,7 @@ static int ufshcd_scale_clks(struct ufs_hba *hba, unsigned long freq,
 	int ret = 0;
 	ktime_t start = ktime_get();
 
-	ret = ufshcd_vops_clk_scale_notify(hba, scale_up, PRE_CHANGE);
+	ret = ufshcd_vops_clk_scale_notify(hba, scale_up, freq, PRE_CHANGE);
 	if (ret)
 		goto out;
 
@@ -1168,7 +1168,7 @@ static int ufshcd_scale_clks(struct ufs_hba *hba, unsigned long freq,
 	if (ret)
 		goto out;
 
-	ret = ufshcd_vops_clk_scale_notify(hba, scale_up, POST_CHANGE);
+	ret = ufshcd_vops_clk_scale_notify(hba, scale_up, freq, POST_CHANGE);
 	if (ret) {
 		if (hba->use_pm_opp)
 			ufshcd_opp_set_rate(hba,
diff --git a/drivers/ufs/host/ufs-mediatek.c b/drivers/ufs/host/ufs-mediatek.c
index 135cd78109e2..977dd0caaef6 100644
--- a/drivers/ufs/host/ufs-mediatek.c
+++ b/drivers/ufs/host/ufs-mediatek.c
@@ -1643,6 +1643,7 @@ static void ufs_mtk_clk_scale(struct ufs_hba *hba, bool scale_up)
 }
 
 static int ufs_mtk_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
+				    unsigned long target_freq,
 				    enum ufs_notify_change_status status)
 {
 	if (!ufshcd_is_clkscaling_supported(hba))
diff --git a/drivers/ufs/host/ufs-qcom.c b/drivers/ufs/host/ufs-qcom.c
index 68040b2ab5f8..b6eef975dc46 100644
--- a/drivers/ufs/host/ufs-qcom.c
+++ b/drivers/ufs/host/ufs-qcom.c
@@ -1333,8 +1333,9 @@ static int ufs_qcom_clk_scale_down_post_change(struct ufs_hba *hba)
 	return ufs_qcom_set_core_clk_ctrl(hba, false);
 }
 
-static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba,
-		bool scale_up, enum ufs_notify_change_status status)
+static int ufs_qcom_clk_scale_notify(struct ufs_hba *hba, bool scale_up,
+				     unsigned long target_freq,
+				     enum ufs_notify_change_status status)
 {
 	struct ufs_qcom_host *host = ufshcd_get_variant(hba);
 	int err;
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index d7aca9e61684..a4dac897a169 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -344,7 +344,7 @@ struct ufs_hba_variant_ops {
 	void    (*exit)(struct ufs_hba *);
 	u32	(*get_ufs_hci_version)(struct ufs_hba *);
 	int	(*set_dma_mask)(struct ufs_hba *);
-	int	(*clk_scale_notify)(struct ufs_hba *, bool,
+	int (*clk_scale_notify)(struct ufs_hba *, bool, unsigned long,
 				    enum ufs_notify_change_status);
 	int	(*setup_clocks)(struct ufs_hba *, bool,
 				enum ufs_notify_change_status);
-- 
2.34.1


