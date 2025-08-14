Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25EC6CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 15:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F0qmEFzM6Mjd1Tn4KdOntF1EUo1kiqK63MpKnRUshuY=; b=YGW8knFVipBQxdrGlqVNxYvnoz
	+xAKwkISsSTCbe39t31y4X95aDpgdlGNwo8FgVzVFlKbzmcg25pGLQUmXW3wQVEZ7xCkKafb3KypL
	kgljPsGrWjN+NDkNvSwOONN9kEGZiErEAsGwWsjFIrbtZ97sg5MwMiL8xVJ5oPIdeX8G5ftmL9rrs
	Jmk4KRogkQ78xXOeNCygK7Th3f5C/I9hOwvfxnjqDbYkNfoI3YMCU5HE6q/LSkN3bvmeIB6bQjLRM
	DvoJ9JtewJZOqy0qw2Ym2bMLKBAx1PRnvFZK2XKMon3WRiliE/ZWKi++1fGXgLYI8U8LOz755hVXf
	Gy52g/EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZgz-0000000HOeP-2PeP;
	Thu, 14 Aug 2025 15:16:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umV1f-0000000GYnl-3pNk
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 Aug 2025 10:17:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=F0qmEFzM6Mjd1Tn4KdOntF1EUo1kiqK63MpKnRUshuY=; b=XvK4q6FVcB8M3wB1KgR/Hxnio3
	Ib/B21bWb8EJsbufnQZtyy3pYzLiUFhX6j5vMFkA4okmHrFEyDQkv3MeOtapmKSKmKyNeeVdcdtK5
	A/LJtMIuQ1SZfPyrHmfVOvOpn/G6+IAQ+nqBI+cEa1MNihGD/lAd6/E8tB5cCsTuSWRd1v68a78kw
	hr+ah468vUXdNhi/HcZUu4uNDo7CIBUEbh6kZHE2Df2cjd9n1PW7j3hU5zu8Mn4JQ9CEE08yYciIP
	bARhpivgA5NveAd+9LE3G83ImDKbPYYGk1ilEPfeADuFSSoMqZpq+qH0YfRl1h0Dc4lPLcPj8Luo4
	MWKqZEgQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umV1c-0000000GM1u-0vSH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 10:17:38 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57E9Gx7l030083;
	Thu, 14 Aug 2025 10:17:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F0qmEFzM6Mjd1Tn4KdOntF1EUo1kiqK63MpKnRUshuY=; b=Wldbv8rKAPCiSfaD
	SL/suCzEXtzYcmDf2liPM8BLoKTIq5l490epWRyyJW7RUJbl1A0YKocd0FGOAPyG
	ihCQPTqTPMit23BTZm9uZHTpau58oUMBmcWW7DMXkskW4gSEiIXTrwWSCorA35m4
	zi+H5PuipZ4nf87bclmptbXWkmJ4hCZRsZk48tA/9Vgk/iw8mQKJvNK7kViQJDuw
	LuDwYAWoCt0uCs7dPQ/nPjovVGGyNBCJia4KXVFZSeR2WYzwYK/bTiHTNyygGl65
	gRDOyjW3TdszBm4n7Zk1oC1eJJASEBqAsVo2CB5kfO6BLm7z2EXA2xUn5mwm6isW
	jpwycw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48fm3vt6wy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 10:17:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57EAHOA5029676
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Aug 2025 10:17:24 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 14 Aug 2025 03:17:18 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <quic_vikramsa@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 6/9] media: qcom: camss: Add support for CSID 690
Date: Thu, 14 Aug 2025 15:46:12 +0530
Message-ID: <20250814101615.1102795-7-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250814101615.1102795-1-quic_vikramsa@quicinc.com>
References: <20250814101615.1102795-1-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDEwNyBTYWx0ZWRfX4DzUUOsQmU61
 999plasZ3E07czfqRGeZPcLp7yo/3XszqLbTXEjKv7LF+SHuW5FWNb5tGy+uo310XhUOOxKreo7
 yLehf7ERASAXNejPP/R2VVVx2WZ4t3SACu7S1nkaZ5lD8VdmFNb6HnUy5vFIiIh4meZnPMiVh9i
 ZyL1HTOILYCiQlnTHSb0r8oG2kTo0SQzf4AvZXJ1lPzi+KYsZbyr4n/l8XnMZMkKBdIHrqG+xDF
 WG8NrLvD5THXtuaOIOzNTEjJ8S6xS5g7QidfO0o/1jB4dFCxfz2W2wgENpc7R1V4JQ+Ul/91Hmy
 NjSXJUs+gyymr0gh0/fmUtfVm3ll7fGWUj4Xt3E/lMpoQGgfc67F7EKnuwRhrrHWP6INsYYafjY
 1cf3FRWu
X-Proofpoint-GUID: uPV-REawm1C7Tyvhrc5mO9gjA9yhBUv3
X-Authority-Analysis: v=2.4 cv=A+1sP7WG c=1 sm=1 tr=0 ts=689db7b5 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=8yVpw4eTn7GS_Gpo2AoA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: uPV-REawm1C7Tyvhrc5mO9gjA9yhBUv3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_02,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508110107
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_111736_695620_C4A20D07 
X-CRM114-Status: GOOD (  14.70  )
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

Add support for CSID 690 found on lemans(sa8775p) soc, This
is different from csid 780 w.r.t few register offsets and
bit-fields.

Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../platform/qcom/camss/camss-csid-gen3.c     |  27 +++-
 drivers/media/platform/qcom/camss/camss.c     | 133 ++++++++++++++++++
 2 files changed, 153 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 433908a54baa..fc6a9787febe 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -45,8 +45,11 @@
 #define CSID_CSI2_RX_IRQ_CLEAR		0xA4
 #define CSID_CSI2_RX_IRQ_SET		0xA8
 
+#define IS_CSID_690(csid)	(csid->camss->res->version == CAMSS_8775P)
 #define CSID_BUF_DONE_IRQ_STATUS	0x8C
-#define		BUF_DONE_IRQ_STATUS_RDI_OFFSET	(csid_is_lite(csid) ? 1 : 14)
+#define BUF_DONE_IRQ_STATUS_RDI_OFFSET  (csid_is_lite(csid) ?\
+						1 : (IS_CSID_690(csid) ?\
+						13 : 14))
 #define CSID_BUF_DONE_IRQ_MASK		0x90
 #define CSID_BUF_DONE_IRQ_CLEAR		0x94
 #define CSID_BUF_DONE_IRQ_SET		0x98
@@ -59,6 +62,7 @@
 
 #define CSID_CSI2_RX_CFG0		0x200
 #define		CSI2_RX_CFG0_NUM_ACTIVE_LANES	0
+#define		CSI2_RX_CFG0_VC_MODE		3
 #define		CSI2_RX_CFG0_DL0_INPUT_SEL	4
 #define		CSI2_RX_CFG0_PHY_NUM_SEL	20
 
@@ -66,7 +70,9 @@
 #define		CSI2_RX_CFG1_ECC_CORRECTION_EN	BIT(0)
 #define		CSI2_RX_CFG1_VC_MODE		BIT(2)
 
-#define CSID_RDI_CFG0(rdi)		(0x500 + 0x100 * (rdi))
+#define CSID_RDI_CFG0(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
+					(0x300 + 0x100 * (rdi)) :\
+					(0x500 + 0x100 * (rdi)))
 #define		RDI_CFG0_TIMESTAMP_EN		BIT(6)
 #define		RDI_CFG0_TIMESTAMP_STB_SEL	BIT(8)
 #define		RDI_CFG0_DECODE_FORMAT		12
@@ -75,10 +81,14 @@
 #define		RDI_CFG0_DT_ID			27
 #define		RDI_CFG0_EN			BIT(31)
 
-#define CSID_RDI_CTRL(rdi)		(0x504 + 0x100 * (rdi))
+#define CSID_RDI_CTRL(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
+					(0x304 + 0x100 * (rdi)) :\
+					(0x504 + 0x100 * (rdi)))
 #define		RDI_CTRL_START_CMD		BIT(0)
 
-#define CSID_RDI_CFG1(rdi)		(0x510 + 0x100 * (rdi))
+#define CSID_RDI_CFG1(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
+					(0x310 + 0x100 * (rdi)) :\
+					(0x510 + 0x100 * (rdi)))
 #define		RDI_CFG1_DROP_H_EN		BIT(5)
 #define		RDI_CFG1_DROP_V_EN		BIT(6)
 #define		RDI_CFG1_CROP_H_EN		BIT(7)
@@ -86,9 +96,12 @@
 #define		RDI_CFG1_PIX_STORE		BIT(10)
 #define		RDI_CFG1_PACKING_FORMAT_MIPI	BIT(15)
 
-#define CSID_RDI_IRQ_SUBSAMPLE_PATTERN(rdi)	(0x548 + 0x100 * (rdi))
-#define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)	(0x54C + 0x100 * (rdi))
-
+#define CSID_RDI_IRQ_SUBSAMPLE_PATTERN(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
+							(0x348 + 0x100 * (rdi)) :\
+							(0x548 + 0x100 * (rdi)))
+#define CSID_RDI_IRQ_SUBSAMPLE_PERIOD(rdi)	(csid_is_lite(csid) && IS_CSID_690(csid) ?\
+							(0x34C + 0x100 * (rdi)) :\
+							(0x54C + 0x100 * (rdi)))
 #define CSI2_RX_CFG0_PHY_SEL_BASE_IDX	1
 
 static void __csid_configure_rx(struct csid_device *csid,
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 4767d4e7c306..5f1e267045cb 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2554,6 +2554,139 @@ static const struct camss_subdev_resources csiphy_res_8775p[] = {
 	},
 };
 
+static const struct camss_subdev_resources csid_res_8775p[] = {
+	/* CSID0 */
+	{
+		.regulators = {},
+		.clock = { "csid", "csiphy_rx"},
+		.clock_rate = {
+			{ 400000000, 400000000},
+			{ 400000000, 400000000}
+		},
+		.reg = { "csid0" },
+		.interrupt = { "csid0" },
+		.csid = {
+			.is_lite = false,
+			.hw_ops = &csid_ops_gen3,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID1 */
+	{
+		.regulators = {},
+		.clock = { "csid", "csiphy_rx"},
+		.clock_rate = {
+			{ 400000000, 400000000},
+			{ 400000000, 400000000}
+		},
+		.reg = { "csid1" },
+		.interrupt = { "csid1" },
+		.csid = {
+			.is_lite = false,
+			.hw_ops = &csid_ops_gen3,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+
+	/* CSID2 (lite) */
+	{
+		.regulators = {},
+		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 400000000, 400000000, 0},
+			{ 0, 0, 400000000, 480000000, 0}
+		},
+		.reg = { "csid_lite0" },
+		.interrupt = { "csid_lite0" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_gen3,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID3 (lite) */
+	{
+		.regulators = {},
+		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 400000000, 400000000, 0},
+			{ 0, 0, 400000000, 480000000, 0}
+		},
+		.reg = { "csid_lite1" },
+		.interrupt = { "csid_lite1" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_gen3,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID4 (lite) */
+	{
+		.regulators = {},
+		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 400000000, 400000000, 0},
+			{ 0, 0, 400000000, 480000000, 0}
+		},
+		.reg = { "csid_lite2" },
+		.interrupt = { "csid_lite2" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_gen3,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID5 (lite) */
+	{
+		.regulators = {},
+		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 400000000, 400000000, 0},
+			{ 0, 0, 400000000, 480000000, 0}
+		},
+		.reg = { "csid_lite3" },
+		.interrupt = { "csid_lite3" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_gen3,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+	/* CSID6 (lite) */
+	{
+		.regulators = {},
+		.clock = { "cpas_vfe_lite", "vfe_lite_ahb",
+			   "vfe_lite_csid", "vfe_lite_cphy_rx",
+			   "vfe_lite"},
+		.clock_rate = {
+			{ 0, 0, 400000000, 400000000, 0},
+			{ 0, 0, 400000000, 480000000, 0}
+		},
+		.reg = { "csid_lite4" },
+		.interrupt = { "csid_lite4" },
+		.csid = {
+			.is_lite = true,
+			.hw_ops = &csid_ops_gen3,
+			.parent_dev_ops = &vfe_parent_dev_ops,
+			.formats = &csid_formats_gen2
+		}
+	},
+};
+
 static const struct resources_icc icc_res_sa8775p[] = {
 	{
 		.name = "ahb",
-- 
2.25.1


