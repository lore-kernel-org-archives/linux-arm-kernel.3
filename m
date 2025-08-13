Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9DCCA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 05:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iFmkWWs70JXd9JixMQWXjQ9LuUavCOvCgbjsUfSnDbo=; b=sP1uvPvv7ydF/erRM2wrFx5DkV
	n1DZ7r34Sv8L1JDlyQTXNKWcSN0FINxpcvk3wIVVdpcbLmAgc7EUmQGppZ5OR7W06BOrYCv8cotkg
	JsqQS3NgNk8cCsXnpgjDc07bzOhasqOlujMYu7S+BxXOQrSEf69SOD7mAgAlXhGIX4qiIOhnH694p
	3W7/m1R0TFFGPCEU6GMAu41bXTQvHOLm8adpwBWyNNP4OvrHPvi7Vlop8Q7GM+2Z7L/r7g1SyszC0
	KeuZ6uUOvdVtlTephNltQbII6NCiJdl+dQjMC54dbCMHcttstb9u/4+F0h5anWTFty5/zYxo1QnwI
	cUO6IrGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um4Qq-0000000Chiy-0ieV;
	Wed, 13 Aug 2025 05:53:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um4C4-0000000CfaT-34ZU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 05:38:37 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D3nY7o027556;
	Wed, 13 Aug 2025 05:38:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iFmkWWs70JXd9JixMQWXjQ9LuUavCOvCgbjsUfSnDbo=; b=UzaNPVaREY99Seko
	bDOyH/OXlX52n0GqpF2xS/w3DODbUXdXr/dzEMOipfxWVCwGKTiWvNjiDFCkzdvI
	NNUjy37ehIZiYMMJRTUOSsLu1E4kFS3lQq6o6Hc2prEIZXbUMppLS+DztfME+5PK
	v/41RHPjLHXyfdTfmwJjJ9sy/TxeZqWfOKrU4gGJtj6RIJwuIViBR8BA89UQuI+U
	qfUyn9rgWr3vtDP5mPuKtQQ9iKo8bYQeCEQAmkUHIg8OoRZ8AvjUaVbNV0vzA/DJ
	cfJQUyJPY0ZqvTdSzBj01c0apSB8CouY99wGEkT54ukhszP6OASGSSKOJaoj4Wnh
	/VGf0g==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ffq6pe73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 05:38:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D5cSkR005488
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 05:38:28 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 12 Aug 2025 22:38:23 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 5/7] media: qcom: camss: enable vfe 690 for qcs8300
Date: Wed, 13 Aug 2025 11:07:22 +0530
Message-ID: <20250813053724.232494-6-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
References: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODExMDA3NSBTYWx0ZWRfX5cC/VCLzmeap
 GAWK30s2rEFKc4X3YXQsAtRhs+pWbLFViJQE2+Qs1J/anMVqjA2a3TR0iIFMcLJHKk8vjrEPZ7w
 RKm2Cm8OD1OBy5TKGi2+RJ26zMVeu7dkvha6xFHX8OdwYUhVtWAUL439WLSdbeIbVtdVX9ogA9J
 bbZdRwOBFF3MiHlrLZYuDRdtz9O+evU1aDZ7omnjgEc3SekRVho5lAqPtK5D/IU0v2/XPGJMDQH
 WgafV0CVK3RLTkxLMjko8hFSIiYoKhmzmPqLjuV2/H2Fkwh2Bn+CzuUog5KRoZ9pPC+Bl8GJ4Ih
 0PXMerVxiKW1G9n2RzE9G4kgHCn/QdPVWRJQJZFjov0zxKBVPJyKQ6HJ4LYQwSXEEKzREznC8ou
 +zY9168Y
X-Authority-Analysis: v=2.4 cv=TLZFS0la c=1 sm=1 tr=0 ts=689c24d5 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=DW1U1MRD-txlM0Xp4toA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: wGuBm72kEo5UETQzBOsgIZ4Gu8WgTa1U
X-Proofpoint-ORIG-GUID: wGuBm72kEo5UETQzBOsgIZ4Gu8WgTa1U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508110075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_223836_772559_2FDBCD19 
X-CRM114-Status: GOOD (  13.41  )
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

The vfe in qcs8300 is version 690, it is same as vfe used in
lemans(sa8775p). vfe gen3 have support for vfe 690.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-gen3.c | 3 ++-
 drivers/media/platform/qcom/camss/camss-vfe.c      | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen3.c b/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
index f2001140ead1..22579617def7 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-gen3.c
@@ -13,7 +13,8 @@
 #include "camss-vfe.h"
 
 #define IS_VFE_690(vfe) \
-	    (vfe->camss->res->version == CAMSS_8775P)
+	    ((vfe->camss->res->version == CAMSS_8775P) \
+	    || (vfe->camss->res->version == CAMSS_8300))
 
 #define BUS_REG_BASE_690 \
 	    (vfe_is_lite(vfe) ? 0x480 : 0x400)
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 99cbe09343f2..1d40184d7d04 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -344,6 +344,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_8x96:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
+	case CAMSS_8300:
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8775P:
@@ -1974,6 +1975,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	case CAMSS_7280:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
+	case CAMSS_8300:
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8775P:
-- 
2.25.1


