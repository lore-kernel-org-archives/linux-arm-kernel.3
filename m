Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147BDC02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 08:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=utfW+gN4zhPc1Z6/nhdbp3JUTTVFHupyeHOWi/BRNeI=; b=GqnngnMAVJfK1jaWPVbNu3mW1Y
	vYthcUsCgDYrWw01oR2oF8eKJitpeM661qZ+9t8j1WgbkyZ3VzHrW4+8HHyGD9BvvO5IKDydMJx/2
	KM5JrQo8quH3bJue0anx4KCgs9PrtZPS5inEKGVZl3FcPVfPHG8bdkHGUWDModOD6LXGfVT2E0zA7
	2LXAVmVAmlh774Xn1Xe0oVZ6i7+m0P3M+NsdQggv6HPSssW5LHuKl2mqMPWC3QoR3GxklFrAbPSex
	I2c9hOLU062qVpKR4AG6AzUaKYH9lTEATErI0ErIORgksPTb3I+Nk7pyzYaS2vuBA5y2V+PbLkann
	gw16FE7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1terd7-0000000Enfo-3go5;
	Mon, 03 Feb 2025 08:16:29 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1terZT-0000000Emnc-3BRC;
	Mon, 03 Feb 2025 08:12:45 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51367KdO009748;
	Mon, 3 Feb 2025 08:11:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=utfW+gN4zhP
	c1Z6/nhdbp3JUTTVFHupyeHOWi/BRNeI=; b=UR8Lhl9KCKZ4lqteGvXs9bCEzMT
	IfDdW0/ud56xGGF+0rsqcG4CuNUoVqG6HI243A7HN8gh4hvgd6EF4Bmsh/j9Lrlw
	HqRzJur4KCTWBzThdIshjMHYz4LJNFEujBK8aSCDQ6dZOrklJVtQO4IkNwLB5UjA
	o/ffTMv3lqLphc4wYjf2/LlKIvwUXbk46mV0bLkM7S9ax1obAsLveZqLik6fB6mh
	kiS/CvWMjQWvtY/K4VB4VrCfgA4cUgP6QRtJSefRlxlhxUrT3E4shNlW5MvhkebO
	lUvjHgBdmUN/V2mKUNQJmNtPC1tjRntYRq4rrAvwTTlgoyc3rK8UKhYarVw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jr8888e4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 08:11:33 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5138BV9V026176;
	Mon, 3 Feb 2025 08:11:31 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 44hcpkshk6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 08:11:31 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5138BUcw026171;
	Mon, 3 Feb 2025 08:11:30 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 5138BUlo026168
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 08:11:30 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 2E22E40BFE; Mon,  3 Feb 2025 16:11:29 +0800 (CST)
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
        Eric Biggers <ebiggers@google.com>, Minwoo Im <minwoo.im@samsung.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-mediatek@lists.infradead.org (moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER...),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek)
Subject: [PATCH v3 1/8] scsi: ufs: core: Pass target_freq to clk_scale_notify() vop
Date: Mon,  3 Feb 2025 16:11:02 +0800
Message-Id: <20250203081109.1614395-2-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
References: <20250203081109.1614395-1-quic_ziqichen@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: v3uXrpDDeY3UVKG0D9PR0_Q8yfQrITc6
X-Proofpoint-GUID: v3uXrpDDeY3UVKG0D9PR0_Q8yfQrITc6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_03,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 phishscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 bulkscore=0 mlxlogscore=999 lowpriorityscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_001243_804971_A2266C99 
X-CRM114-Status: GOOD (  16.39  )
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

Instead of only two frequencies, if OPP V2 is used, the UFS devfreq clock
scaling may scale the clock among multiple frequencies, so just passing
up/down to vop clk_scale_notify() is not enough to cover the intermediate
clock freqs between the min and max freqs. Hence pass the target_freq ,
which will be used in successive commits, to clk_scale_notify() to allow
the vop to perform corresponding configurations with regard to the clock
freqs.

Signed-off-by: Can Guo <quic_cang@quicinc.com>
Co-developed-by: Ziqi Chen <quic_ziqichen@quicinc.com>
Signed-off-by: Ziqi Chen <quic_ziqichen@quicinc.com>
---

v1 -> v2:
Modify commit message to make it more clear.

v2 -> v3:
1. Change 'vops' to 'vop' in commit message.
2. keep the indentation consistent for clk_scale_notify() definition.
---
 drivers/ufs/core/ufshcd-priv.h  | 7 ++++---
 drivers/ufs/core/ufshcd.c       | 4 ++--
 drivers/ufs/host/ufs-mediatek.c | 1 +
 drivers/ufs/host/ufs-qcom.c     | 5 +++--
 include/ufs/ufshcd.h            | 4 ++--
 5 files changed, 12 insertions(+), 9 deletions(-)

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
index d7aca9e61684..f51d425696e7 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -344,8 +344,8 @@ struct ufs_hba_variant_ops {
 	void    (*exit)(struct ufs_hba *);
 	u32	(*get_ufs_hci_version)(struct ufs_hba *);
 	int	(*set_dma_mask)(struct ufs_hba *);
-	int	(*clk_scale_notify)(struct ufs_hba *, bool,
-				    enum ufs_notify_change_status);
+	int (*clk_scale_notify)(struct ufs_hba *, bool, unsigned long,
+							enum ufs_notify_change_status);
 	int	(*setup_clocks)(struct ufs_hba *, bool,
 				enum ufs_notify_change_status);
 	int	(*hce_enable_notify)(struct ufs_hba *,
-- 
2.34.1


