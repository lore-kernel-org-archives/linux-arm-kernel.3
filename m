Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26791C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 10:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DXvkDlONGBkEr2ITzSwbpPTchg23m7ymrk0Wj0Q6QEY=; b=XbOE2sV6qQQhIcK2kDNUKSESPx
	YY15BHicCMUj8B6S/Of/mAc2CP5HKwQlynKraOudX0G++pec63+s6zsIGPIcdXIxuIXFk/4Rqs9mO
	Q24wqtgaoVa72cMRgYUkJw1PMyB6MfW2Rj3FXvYy2Sa7qiFYlzrtj0aEGJIeovkecnnTpxjcS6Mz8
	drtZuryQGvSQikoNigrhSDTF49r07NHaoAlgh8Pqg+qCLBo9iU2Q02CD3aUvtZW2GHBSLU9T00sxh
	fLRk57EbBGJO3q7HNNrOmbXG64Qma3xMupCngeJa5wSdvUSGbPpEbrvaMCwvoz84aRcDWurZDI/6C
	2UM9TKZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thQdx-0000000Gv4l-30w2;
	Mon, 10 Feb 2025 10:03:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thQcX-0000000GufF-3KuM;
	Mon, 10 Feb 2025 10:02:31 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9PjFd016767;
	Mon, 10 Feb 2025 10:02:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=DXvkDlONGBkEr2ITzSwbpP
	Tchg23m7ymrk0Wj0Q6QEY=; b=Dag36DbXyF1lvBEFMhBGn6VqpFOUf4QlIOFsz6
	KlEy8YeBPxZ2z0lfmeSbGbIzclliqwDIYz6Sjyb96bZEJr7TqqRgtn9crXeKk4RH
	9QT6DIXZbqMIrT97ERdgbQZiJglsqaJTiCvq7IcuoRk+eIfCz52eaTKGRhzKDiaW
	S5qGKVEdq02CoQbNNsfw03rnK1BJ3tWAZQtpFwgyamu8qYDd6drvvFKZBereP8e/
	URe+UNGze10Q7qlElwVCetv7NCl9ajqq1FbytudJawVDDPmFKzfxPOR87Cw3TRU8
	UNAoiu/79R/crDD7wfvAte7fRnNJwAIWrkkGks9f7AuglDrg==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0guuwnm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 10:02:19 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 51AA2G5I011336;
	Mon, 10 Feb 2025 10:02:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 44p0bkhyhu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 10:02:16 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51AA2GhK011330;
	Mon, 10 Feb 2025 10:02:16 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 51AA2FPc011328
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 10:02:16 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 8814440BF7; Mon, 10 Feb 2025 18:02:14 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support:Keyword:mediatek),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek),
        linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek)
Subject: [PATCH v4 0/8] Support Multi-frequency scale for UFS
Date: Mon, 10 Feb 2025 18:02:03 +0800
Message-Id: <20250210100212.855127-1-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tP6s0CePDC3GhtC02d08LtP4rxGyyvXR
X-Proofpoint-GUID: tP6s0CePDC3GhtC02d08LtP4rxGyyvXR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_05,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 mlxlogscore=999 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502100084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_020229_951009_D6DB2A33 
X-CRM114-Status: GOOD (  12.02  )
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

With OPP V2 enabled, devfreq can scale clocks amongst multiple frequency
plans. However, the gear speed is only toggled between min and max during
clock scaling. Enable multi-level gear scaling by mapping clock frequencies
to gear speeds, so that when devfreq scales clock frequencies we can put
the UFS link at the appropraite gear speeds accordingly.

This series has been tested on below platforms -
sm8550 mtp + UFS3.1
SM8650 MTP + UFS3.1
SM8750 MTP + UFS4.0

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-HDK
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK 

v1 -> v2:
1. Withdraw old patch 8/8 "ARM: dts: msm: Use Operation Points V2 for UFS on SM8650"
2. Add new patch 8/8 "ABI: sysfs-driver-ufs: Add missing UFS sysfs addributes"
3. Modify commit message for  "scsi: ufs: core: Pass target_freq to clk_scale_notify() vops" and "scsi: ufs: qcom: Pass target_freq to clk scale pre and post change"
4. In "scsi: ufs: qcom: Pass target_freq to clk scale pre and post change", use common Macro HZ_PER_MHZ in function ufs_qcom_set_core_clk_ctrl()
5. In "scsi: ufs: qcom: Implement the freq_to_gear_speed() vops", print out freq and gear info as debugging message
6. In "scsi: ufs: core: Enable multi-level gear scaling", rename the lable "do_pmc" to "config_pwr_mode"
7. In "scsi: ufs: core: Toggle Write Booster during clock", initialize the local variables "wb_en" as "false"

v2 -> v3:
1. Change 'vops' to 'vop' in all commit message
2. keep the indentation consistent for clk_scale_notify() definition.
3. In "scsi: ufs: core: Add a vop to map clock frequency to gear speed", "scsi: ufs: qcom: Implement the freq_to_gear_speed() vop"
   and "scsi: ufs: core: Enable multi-level gear scaling", remove the parameter 'gear' and use it as return result in function freq_to_gear_speed()
4. In "scsi: ufs: qcom: Implement the freq_to_gear_speed(), removed the variable 'ret' in function ufs_qcom_freq_to_gear_speed()
5. In "scsi: ufs: core: Enable multi-level gear scaling", use assignment instead memcpy() in function ufshcd_scale_gear()
6. Improve the grammar of attributes' descriptions in “ABI: sysfs-driver-ufs: Add missing UFS sysfs attributes”
7. Typo fixed for some commit messages.

v3 -> v4:
1. In "scsi: ufs: core: Toggle Write Booster during clock scaling base on gear speed":
	a. Add comment for default initialized wb_gear
	b. Remove the unnecessary variable “wb_en" in function ufshcd_clock_scaling_unprepare()
2. Typo fixed for commit message of "scsi: ufs: core: Enable multi-level gear scaling"
3. Make the description words are more standardized in "ABI: sysfs-driver-ufs: Add missing UFS sysfs attributes"

Can Guo (6):
  scsi: ufs: core: Pass target_freq to clk_scale_notify() vop
  scsi: ufs: qcom: Pass target_freq to clk scale pre and post change
  scsi: ufs: core: Add a vop to map clock frequency to gear speed

Can Guo (6):
  scsi: ufs: core: Pass target_freq to clk_scale_notify() vop
  scsi: ufs: qcom: Pass target_freq to clk scale pre and post change
  scsi: ufs: core: Add a vop to map clock frequency to gear speed
  scsi: ufs: qcom: Implement the freq_to_gear_speed() vop
  scsi: ufs: core: Enable multi-level gear scaling
  scsi: ufs: core: Toggle Write Booster during clock scaling base on
    gear speed

Ziqi Chen (2):
  scsi: ufs: core: Check if scaling up is required when disable clkscale
  ABI: sysfs-driver-ufs: Add missing UFS sysfs attributes

 Documentation/ABI/testing/sysfs-driver-ufs | 33 ++++++++++
 drivers/ufs/core/ufshcd-priv.h             | 15 ++++-
 drivers/ufs/core/ufshcd.c                  | 71 +++++++++++++++++-----
 drivers/ufs/host/ufs-mediatek.c            |  1 +
 drivers/ufs/host/ufs-qcom.c                | 62 ++++++++++++++-----
 include/ufs/ufshcd.h                       |  9 ++-
 6 files changed, 156 insertions(+), 35 deletions(-)

-- 
2.34.1


