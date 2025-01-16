Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EB5C02180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 09:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XZKRXPVX5N9iqSWVwXzEEYuU/tXxflI/n2D0/vLeP2c=; b=R6Ah6kgFpHBJbo07ZxfRlzVB9r
	v+YZ5qGEdixOkbQpae/dTaRFvdkFfuNf39r4o/pSBZqksoCNhXifnxPhVkYDoZ4ya9XY5hZhjOn2Q
	Sr9u/HTMJWYXK5M8UHm8uwE+5mKGcyPZN+weKB9oKa1jE6Lwi74kRGbU0zgxJ3Vrf/EY/llU87UeR
	tXNA1zb7r5TDHZLrLri6CteKKEPTQ22TTEQSuFoh2EfO+GC35u701Xp+bM4upgLzkJvt0dNNWkOa8
	D9pqNTTLKr8cCsvN3psWVDIS7JhJ/NvbFfLLqSNCBPBK1SQ83M8eP599RmHkTKotYGy9QkQv3TX0h
	z8mAL2Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYLxC-0000000EKlU-3Mlp;
	Thu, 16 Jan 2025 09:14:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYLvk-0000000EKMj-0GXx;
	Thu, 16 Jan 2025 09:12:49 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50G85sXY006715;
	Thu, 16 Jan 2025 09:12:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=XZKRXPVX5N9iqSWVwXzEEYuU/tXxflI/n2D
	0/vLeP2c=; b=XRpCB4XwF2FKp8U+TRNXwFTLKp3CizqMGX5Ya+b+1jILNE8XOhs
	NAilmr4KwPEml8NrfCa7bZVZw4f324Aeiw+n9/wUyqNsjNxAkBr16qxTYmRA/ZHr
	rwju5t4pMTOpPoOgpU5TeNNA1PbMzujmWnQxMl8lgJcluOUngame+siS64pllcCu
	hNxoT/hbgF80/KVsqIS1XoiRRRnMHrQaTKvj6MI4S2Qq6akqWMjWqJAXi0nS8/h5
	Mg0kNKNHwHO6QkTM7Vlr/sFcHA2n1gnsvTE35qi9buOnP35uainYC8OrLBBfbFEV
	H/gEsBaQhtwkhqgyXVqu4d5YvXAOEncvBQA==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 446xa4r5jm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 09:12:30 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 50G9CShs032018;
	Thu, 16 Jan 2025 09:12:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 4442bf51r2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 09:12:28 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 50G9CRhE032013;
	Thu, 16 Jan 2025 09:12:27 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 50G9CRU0032012
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Jan 2025 09:12:27 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 393357)
	id 45FEA40BF9; Thu, 16 Jan 2025 17:12:26 +0800 (CST)
From: Ziqi Chen <quic_ziqichen@quicinc.com>
To: quic_cang@quicinc.com, bvanassche@acm.org, mani@kernel.org,
        beanhuo@micron.com, avri.altman@wdc.com, junwoo80.lee@samsung.com,
        martin.petersen@oracle.com, quic_ziqichen@quicinc.com,
        quic_nguyenb@quicinc.com, quic_nitirawa@quicinc.com,
        quic_rampraka@quicinc.com
Cc: linux-scsi@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-kernel@vger.kernel.org (open list:ARM/Mediatek SoC support:Keyword:mediatek),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek),
        linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support:Keyword:mediatek)
Subject: [PATCH 0/8] Support Multi-frequency scale for UFS
Date: Thu, 16 Jan 2025 17:11:41 +0800
Message-Id: <20250116091150.1167739-1-quic_ziqichen@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zSS8U_aKh72K2o3eJEkCUbuXW__bBe_x
X-Proofpoint-GUID: zSS8U_aKh72K2o3eJEkCUbuXW__bBe_x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_03,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=788 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501160067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_011248_103869_52F012D3 
X-CRM114-Status: UNSURE (   8.86  )
X-CRM114-Notice: Please train this message.
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
SM8650 + UFS3.1
SM8750 + UFS4.0


Can Guo (6):
  scsi: ufs: core: Pass target_freq to clk_scale_notify() vops
  scsi: ufs: qcom: Pass target_freq to clk scale pre and post change
  scsi: ufs: core: Add a vops to map clock frequency to gear speed
  scsi: ufs: qcom: Implement the freq_to_gear_speed() vops
  scsi: ufs: core: Enable multi-level gear scaling
  scsi: ufs: core: Toggle Write Booster during clock scaling base on
    gear speed

Ziqi Chen (2):
  scsi: ufs: core: Check if scaling up is required when disable clkscale
  ARM: dts: msm: Use Operation Points V2 for UFS on SM8650

 arch/arm64/boot/dts/qcom/sm8650.dtsi | 51 ++++++++++++++++----
 drivers/ufs/core/ufshcd-priv.h       | 17 +++++--
 drivers/ufs/core/ufshcd.c            | 71 +++++++++++++++++++++-------
 drivers/ufs/host/ufs-mediatek.c      |  1 +
 drivers/ufs/host/ufs-qcom.c          | 60 ++++++++++++++++++-----
 include/ufs/ufshcd.h                 |  8 +++-
 6 files changed, 166 insertions(+), 42 deletions(-)

-- 
2.34.1


