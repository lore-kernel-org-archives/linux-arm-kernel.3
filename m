Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F31ECD98E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 11:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XohaHNzdSn7EcuVKd8IYFM6fjiQzqjchZh5357Lb3tY=; b=hyINLuzqVFWpF5p8JMdc0NaEoo
	EiS7fbMc0HLPqRTxYa0agUPMP6mEP0EO3W64IAod7jTk2QaKwX72xKt88L1Tg0IDs195K5wPkdniF
	onbcsYCjSfcsZw5pxT4oLLagYlCciLAp7AVo7NQQc7A6CQ1EcKngJsrVwO7RulA8WZcR5mIuGONeF
	vsAkzrHa+zHp+HDZTNR6i8H72qeVK41XAQdqc1xFX3B3ktReU17NlLBLeYXZnWd/ebtkc7pvf0M6m
	Zz8dXBpehuRHCQgLAzSqrgDDfk9mlUByouFlvnpohXkWVQfveoVHVnqjBq7pe6OqT9sVewoPHQ726
	qGyzgHTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZS3c-0000000FgDL-0qoK;
	Tue, 16 Jun 2026 11:34:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZS3Z-0000000FgCb-0UqL;
	Tue, 16 Jun 2026 11:34:14 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9jSk2799422;
	Tue, 16 Jun 2026 11:34:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=XohaHNzdSn7
	EcuVKd8IYFM6fjiQzqjchZh5357Lb3tY=; b=E3gOoVVc3HIZA2ioJNoFHiIezlx
	2YLMKQcgLh/Shycx+f20y5QDlAeVN0FgwLXDDIMDjUrgl5irwIxhooixYldfecZS
	QmtmCZos2fAemyA2Xbd3sMnAOSzx6oNzgb2TNhcL0L87puTsWN8VkGKhwI2Ugkuz
	2716IayldNcRx4oIJdc3d+tNquefi55Et+qTUUwobDOlU0PJMe12DlyA7IxEvhUx
	pTZSe4xRfkCsinznoiSkIp8LojaQFgq5wZUd6ekORbpm8H2wcawgn33Mild5+56r
	NlFe4ubYWUg8Ik9agopVkJo8YfIPWVUFNAw+VRl5NoLZgb3p+WAFHVYmnNg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu0a7sjfa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jun 2026 11:34:06 +0000 (GMT)
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65GBY5MT015594;
	Tue, 16 Jun 2026 11:34:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 4etk1at1xx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jun 2026 11:34:05 +0000 (GMT)
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65GBY5Ht015583;
	Tue, 16 Jun 2026 11:34:05 GMT
Received: from hu-devc-lv-u22-c.qualcomm.com (hu-cang-lv.qualcomm.com [10.81.25.255])
	by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 65GBY5pu015579
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jun 2026 11:34:05 +0000 (GMT)
Received: by hu-devc-lv-u22-c.qualcomm.com (Postfix, from userid 359480)
	id 44029654; Tue, 16 Jun 2026 04:34:05 -0700 (PDT)
From: Can Guo <can.guo@oss.qualcomm.com>
To: krzk@kernel.org, bvanassche@acm.org, beanhuo@micron.com,
        peter.wang@mediatek.com, martin.petersen@oracle.com, mani@kernel.org
Cc: linux-scsi@vger.kernel.org, Can Guo <can.guo@oss.qualcomm.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Nitin Rawat <quic_nitirawa@quicinc.com>,
        Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>,
        linux-kernel@vger.kernel.org (open list),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek),
        linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek)
Subject: [PATCH v10 2/2] scsi: ufs: core: Add support for static TX Equalization settings
Date: Tue, 16 Jun 2026 04:33:48 -0700
Message-Id: <20260616113348.1168248-3-can.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260616113348.1168248-1-can.guo@oss.qualcomm.com>
References: <20260616113348.1168248-1-can.guo@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDExOCBTYWx0ZWRfX/bSbUpew4H66
 YXI/Aq+K5Wi2Mbrre5bowimNd6X2s/ln/A5f5YdIa3fjkw4KxEd+CiLONJbvToCrpf+cl7te9Tz
 53jZ2AGFhsof5/hNtCUhOfUVaDNmUbwsizZVv/qEueuL76S4qmWs/K8MkBy0ktuzw4HGWEVX9EX
 fUQjSyf6b6eNI/Hz3pl46Jifc0QJlFxKHlNUnpPt2bYI0okxbm37j/dOAHff5KChZK8Af2jlxaJ
 55ZxCfGZ9cmB2iLllnsetmKapUvh3/sa7jGeEdYv9PPh5ZV/5MvXQln4g5GJ8SYvSzBVCbDdTnG
 IpNYP7YDFYCtyAowqcNMWDmyQiE07p8frlmO3814ncjfTqKiZx6TD7K2qWHLzXqdoL1N0Rd2PWf
 oNViaoTxJBs9/EnI78kbajtOTu/K1Lf4WMp/yTyXZVsI8HiIDxjthfDgotxU8UwDEAbZgxdREwN
 EyqB9KDtpT9rz1230FA==
X-Authority-Analysis: v=2.4 cv=JKALdcKb c=1 sm=1 tr=0 ts=6a3134ae cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8 a=mpaa-ttXAAAA:8 a=EUspDBNiAAAA:8
 a=Nkn4xaPparAtay90Rp0A:9
X-Proofpoint-ORIG-GUID: 81gq8bqfJpOMttEu97yCqva3ouK2dd54
X-Proofpoint-GUID: 81gq8bqfJpOMttEu97yCqva3ouK2dd54
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDExOCBTYWx0ZWRfXxxrBtVkQqVUe
 v3bmI4nneMWXeVSI2hwkObF3gPhNopt8lGJ0qaKuPNH7ufUGhbfPab+Po+pD3CkCmbYQrT1YnEj
 jR6pKkvfYQHZU5ksgxWit1IiwVZ6P0I=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_043413_172860_A98135F3 
X-CRM114-Status: GOOD (  23.11  )
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

Parse board-specific static TX Equalization settings from Device Tree for
each HS gear and store them in hba->tx_eq_params.

Parse txeq-preshoot-g[1-6] and txeq-deemphasis-g[1-6] as per-lane tuples:
<Host_Lane0 Device_Lane0>, [<Host_Lane1 Device_Lane1>].

For HS-G6, parse optional tx-precode-enable-g6 using the same per-lane
Host/Device tuple format. If provided, it must contain values for all
active lanes, and each value must be 0 or 1.

Introduce from_dt in struct ufshcd_tx_eq_params to track whether TX EQ
values came from static Device Tree data.

When adaptive TX Equalization is used, these static settings are not final:
- If valid settings are retrieved from qTxEQGnSettings/wTxEQGnSettingsExt,
  those retrieved settings override static Device Tree settings.
- If retrieval is not available/valid, TX EQTR runs and trained settings
  override static Device Tree settings.

So static Device Tree settings are a fallback for cases where adaptive TX
Equalization is not enabled or not used. Adaptive TX Equalization remains
the primary path when enabled.

No behavior changes for platforms that do not provide these properties.

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Peter Wang <peter.wang@mediatek.com>
Signed-off-by: Can Guo <can.guo@oss.qualcomm.com>
---
 drivers/ufs/core/ufs-txeq.c      |  15 ++-
 drivers/ufs/host/ufshcd-pltfrm.c | 154 +++++++++++++++++++++++++++++++
 include/ufs/ufshcd.h             |   2 +
 3 files changed, 170 insertions(+), 1 deletion(-)

diff --git a/drivers/ufs/core/ufs-txeq.c b/drivers/ufs/core/ufs-txeq.c
index 3a2fb5329d27..3c94b94dd7b7 100644
--- a/drivers/ufs/core/ufs-txeq.c
+++ b/drivers/ufs/core/ufs-txeq.c
@@ -1297,7 +1297,13 @@ int ufshcd_config_tx_eq_settings(struct ufs_hba *hba,
 	}
 
 	params = &hba->tx_eq_params[gear - 1];
-	if (!params->is_valid || force_tx_eqtr) {
+	/*
+	 * TX EQTR must run for the following cases:
+	 * 1. TX EQ settings are invalid.
+	 * 2. TX EQ settings are from Device Tree.
+	 * 3. TX EQTR procedure is forced.
+	 */
+	if (!params->is_valid || params->from_dt || force_tx_eqtr) {
 		int ret;
 
 		ret = ufshcd_tx_eqtr(hba, params, pwr_mode);
@@ -1310,6 +1316,8 @@ int ufshcd_config_tx_eq_settings(struct ufs_hba *hba,
 		/* Mark TX Equalization settings as valid */
 		params->is_valid = true;
 		params->is_trained = true;
+		/* TX EQTR succeeds, clear from_dt flag */
+		params->from_dt = false;
 		params->is_applied = false;
 	}
 
@@ -1495,6 +1503,11 @@ static void ufshcd_extract_tx_eq_settings_attrs(struct ufs_hba *hba, u8 gear)
 	}
 
 	params->is_valid = true;
+	/*
+	 * Optimal TX EQ settings are retrieved from UFS device attributes,
+	 * clear from_dt flag to avoid TX EQTR procedure.
+	 */
+	params->from_dt = false;
 }
 
 void ufshcd_retrieve_tx_eq_settings(struct ufs_hba *hba)
diff --git a/drivers/ufs/host/ufshcd-pltfrm.c b/drivers/ufs/host/ufshcd-pltfrm.c
index c2dafb583cf5..5ac7afe75934 100644
--- a/drivers/ufs/host/ufshcd-pltfrm.c
+++ b/drivers/ufs/host/ufshcd-pltfrm.c
@@ -210,6 +210,158 @@ static void ufshcd_init_lanes_per_dir(struct ufs_hba *hba)
 	}
 }
 
+static int ufshcd_parse_tx_precode_enable(struct ufs_hba *hba,
+					  bool host_precode_en[UFS_MAX_LANES],
+					  bool device_precode_en[UFS_MAX_LANES])
+{
+	const char *prop_name = "tx-precode-enable-g6";
+	u32 num_elems = 2 * hba->lanes_per_direction;
+	const u32 lpd = hba->lanes_per_direction;
+	u32 precode[UFS_MAX_LANES * 2];
+	struct device *dev = hba->dev;
+	int count, err, i;
+
+	count = of_property_count_u32_elems(dev->of_node, prop_name);
+	if (count == -EINVAL || count == -ENODATA)
+		return 0;
+
+	if (count < 0)
+		return count;
+
+	if (count != num_elems) {
+		dev_err(dev, "Property %s has invalid count (%d), expecting %u\n",
+			prop_name, count, num_elems);
+		return -EINVAL;
+	}
+
+	err = of_property_read_u32_array(dev->of_node, prop_name, precode, num_elems);
+	if (err) {
+		dev_err(dev, "Failed to read %s property, %d\n", prop_name, err);
+		return err;
+	}
+
+	for (i = 0; i < num_elems; i++) {
+		if (precode[i] > 1) {
+			dev_err(dev, "Invalid TX precode value (%u) in %s property\n",
+				precode[i], prop_name);
+			return -EINVAL;
+		}
+	}
+
+	for (i = 0; i < lpd; i++) {
+		host_precode_en[i] = precode[i * 2];
+		device_precode_en[i] = precode[i * 2 + 1];
+	}
+
+	return 0;
+}
+
+static int ufshcd_parse_tx_eq_value_array(struct ufs_hba *hba,
+					  const char *prop_name,
+					  const u32 max_value,
+					  u32 values[UFS_MAX_LANES * 2])
+{
+	u32 num_elems = 2 * hba->lanes_per_direction;
+	struct device *dev = hba->dev;
+	int count, err, i;
+
+	count = of_property_count_u32_elems(dev->of_node, prop_name);
+	if (count < 0)
+		return count;
+
+	if (count != num_elems) {
+		dev_err(dev, "Property %s has invalid count (%d), expecting %u\n",
+			prop_name, count, num_elems);
+		return -EINVAL;
+	}
+
+	err = of_property_read_u32_array(dev->of_node, prop_name, values, num_elems);
+	if (err) {
+		dev_err(dev, "Failed to read %s property, %d\n", prop_name, err);
+		return err;
+	}
+
+	for (i = 0; i < num_elems; i++) {
+		if (values[i] >= max_value) {
+			dev_err(dev, "Invalid TX EQ value (%u) in %s property\n",
+				values[i], prop_name);
+			return -EINVAL;
+		}
+	}
+
+	return 0;
+}
+
+/**
+ * ufshcd_parse_tx_eq_settings_for_gear - Parse static TX EQ DT settings for one gear
+ * @hba: per adapter instance
+ * @gear: target HS gear
+ *
+ * Reads the txeq-preshoot-gN, txeq-deemphasis-gN, and (for G6)
+ * tx-precode-enable-g6 device-tree properties.
+ * If all present values are valid, stores them as static TX Equalization
+ * settings for the given gear.
+ */
+static void ufshcd_parse_tx_eq_settings_for_gear(struct ufs_hba *hba, int gear)
+{
+	bool device_precode_en[UFS_MAX_LANES] = { false };
+	bool host_precode_en[UFS_MAX_LANES] = { false };
+	const u32 lpd = hba->lanes_per_direction;
+	struct ufshcd_tx_eq_params *params;
+	u32 deemphasis[UFS_MAX_LANES * 2];
+	u32 preshoot[UFS_MAX_LANES * 2];
+	char prop_name[MAX_PROP_SIZE];
+	int err, lane;
+
+	snprintf(prop_name, MAX_PROP_SIZE, "txeq-preshoot-g%d", gear);
+	err = ufshcd_parse_tx_eq_value_array(hba, prop_name, TX_HS_NUM_PRESHOOT, preshoot);
+	if (err)
+		return;
+
+	snprintf(prop_name, MAX_PROP_SIZE, "txeq-deemphasis-g%d", gear);
+	err = ufshcd_parse_tx_eq_value_array(hba, prop_name, TX_HS_NUM_DEEMPHASIS, deemphasis);
+	if (err)
+		return;
+
+	if (gear == UFS_HS_G6) {
+		err = ufshcd_parse_tx_precode_enable(hba, host_precode_en, device_precode_en);
+		if (err)
+			return;
+	}
+
+	params = &hba->tx_eq_params[gear - 1];
+	for (lane = 0; lane < lpd; lane++) {
+		params->host[lane].preshoot = preshoot[lane * 2];
+		params->host[lane].deemphasis = deemphasis[lane * 2];
+		params->host[lane].precode_en = host_precode_en[lane];
+
+		params->device[lane].preshoot = preshoot[lane * 2 + 1];
+		params->device[lane].deemphasis = deemphasis[lane * 2 + 1];
+		params->device[lane].precode_en = device_precode_en[lane];
+	}
+
+	params->is_valid = true;
+	params->from_dt = true;
+}
+
+static void ufshcd_parse_static_tx_eq_settings(struct ufs_hba *hba)
+{
+	const u32 lpd = hba->lanes_per_direction;
+	int gear;
+
+	if (!lpd)
+		return;
+
+	if (lpd > UFS_MAX_LANES) {
+		dev_warn(hba->dev, "lanes_per_direction (%u) exceeds UFS_MAX_LANES (%u)\n",
+			 lpd, UFS_MAX_LANES);
+		return;
+	}
+
+	for (gear = UFS_HS_G1; gear <= UFS_HS_GEAR_MAX; gear++)
+		ufshcd_parse_tx_eq_settings_for_gear(hba, gear);
+}
+
 /**
  * ufshcd_parse_clock_min_max_freq  - Parse MIN and MAX clocks freq
  * @hba: per adapter instance
@@ -528,6 +680,8 @@ int ufshcd_pltfrm_init(struct platform_device *pdev,
 
 	ufshcd_init_lanes_per_dir(hba);
 
+	ufshcd_parse_static_tx_eq_settings(hba);
+
 	err = ufshcd_parse_operating_points(hba);
 	if (err) {
 		dev_err(dev, "%s: OPP parse failed %d\n", __func__, err);
diff --git a/include/ufs/ufshcd.h b/include/ufs/ufshcd.h
index f48d6416e299..0f87b081b2ff 100644
--- a/include/ufs/ufshcd.h
+++ b/include/ufs/ufshcd.h
@@ -359,6 +359,7 @@ struct ufshcd_tx_eqtr_record {
  * @is_valid: True if parameter contains valid TX Equalization settings
  * @is_applied: True if settings have been applied to UniPro of both sides
  * @is_trained: True if parameters obtained from TX EQTR procedure
+ * @from_dt: True if settings are from Device Tree
  */
 struct ufshcd_tx_eq_params {
 	struct ufshcd_tx_eq_settings host[UFS_MAX_LANES];
@@ -367,6 +368,7 @@ struct ufshcd_tx_eq_params {
 	bool is_valid;
 	bool is_applied;
 	bool is_trained;
+	bool from_dt;
 };
 
 /**
-- 
2.34.1


