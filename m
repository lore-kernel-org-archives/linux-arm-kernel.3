Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0548BE77184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 13:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zupeWSD1m2oZokKFXM6Li38mfJnIz/VL+gMVTKclJBA=; b=WVbsWegSVpb7I3Ky8YWTB8BTQB
	P7yixG7Hp9+xoDuZH8ciIHJsKQB0qfk77e04gZqze1OSuWxQ8z+OeArlNCnx+d08Y0nubXAw4+gBV
	Nx0JgcIGs8D846VjOfPV6SV2tFu3TemBG3L+gISKkfrIA9+NkQZzph+K8v9s660ApnwamA8WyYm1s
	7lFqAGYA9AlBQA30O/+IVM04JRk1a3/zMs5wWFMkIfAK06qHOIKGXxrhbHgOC4+KrdKGHAEXClvTZ
	0lxm4lcOB/pHkVqoPxOLDy6seLG8tVaVNO18k7qnFmGW5lhp7wxWdfU9q//hD8wL3vKnfTRj91TH9
	e04GTZUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXqX-0000000DccD-2dfQ;
	Tue, 17 Dec 2024 13:42:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXoP-0000000DcGG-2LGQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 13:40:34 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BHAokFK000659;
	Tue, 17 Dec 2024 13:40:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zupeWSD1m2oZokKFXM6Li38mfJnIz/VL+gMVTKclJBA=; b=pJGDBFh7do9WK6KD
	QvVjtwjyAuuzAsDG/ZDIvKuBWqDXdwWVlEOZHiN4HNBGoqZdaS4o4CPfH/QTMl5d
	wKFaDo2bqjZ6Mw5SHLxxhZu5llRFvbjE+/vfykZhk8VhgCNbQoFOCGQvW61Hogs/
	INEhDCb3sC3wxAsjRhKb0+WeYy0Ys43tfIhDSg8/bdtB192nQwgwZfQHLYJhthxr
	WR6Bh27+SBRnCaYrF8oe9pEh288uyol3lCslrcHpS5O7EqsaBDIOMLcv+rlj+iv0
	sXkXei2DNyMEuCGWb+7sPSCKfINNydjo3StTBnoQ28cfcZjqwMn0dMgJ09DjVFfU
	Y2LJ5A==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k7w50dyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 13:40:26 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BHDePhR029218
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 13:40:25 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 17 Dec 2024 05:40:16 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <akapatra@quicinc.com>, <hariramp@quicinc.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>,
        <hverkuil-cisco@xs4all.nl>, <cros-qcom-dts-watchers@chromium.org>,
        <catalin.marinas@arm.com>, <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <kernel@quicinc.com>
Subject: [PATCH v9 1/4] media: dt-bindings: update clocks for sc7280-camss
Date: Tue, 17 Dec 2024 19:09:52 +0530
Message-ID: <20241217133955.946426-2-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241217133955.946426-1-quic_vikramsa@quicinc.com>
References: <20241217133955.946426-1-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: vjPanlz9WBapzRiieSBXBVhWx4RqZGSP
X-Proofpoint-ORIG-GUID: vjPanlz9WBapzRiieSBXBVhWx4RqZGSP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=923 adultscore=0 lowpriorityscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_054033_708270_97AA1CC3 
X-CRM114-Status: GOOD (  11.83  )
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

This patch change clock names to make it consistent with
existing platforms as gcc_cam_hf_axi -> gcc_axi_hf.
This also adds gcc_axi_sf and remove gcc_camera_ahb.

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 .../devicetree/bindings/media/qcom,sc7280-camss.yaml   | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
index e11141b812a0..ee35e3bc97ff 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7280-camss.yaml
@@ -55,8 +55,8 @@ properties:
       - const: csiphy3_timer
       - const: csiphy4
       - const: csiphy4_timer
-      - const: gcc_camera_ahb
-      - const: gcc_cam_hf_axi
+      - const: gcc_axi_hf
+      - const: gcc_axi_sf
       - const: icp_ahb
       - const: vfe0
       - const: vfe0_axi
@@ -310,8 +310,8 @@ examples:
                      <&camcc CAM_CC_CSI3PHYTIMER_CLK>,
                      <&camcc CAM_CC_CSIPHY4_CLK>,
                      <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
-                     <&gcc GCC_CAMERA_AHB_CLK>,
                      <&gcc GCC_CAMERA_HF_AXI_CLK>,
+                     <&gcc GCC_CAMERA_SF_AXI_CLK>,
                      <&camcc CAM_CC_ICP_AHB_CLK>,
                      <&camcc CAM_CC_IFE_0_CLK>,
                      <&camcc CAM_CC_IFE_0_AXI_CLK>,
@@ -343,8 +343,8 @@ examples:
                           "csiphy3_timer",
                           "csiphy4",
                           "csiphy4_timer",
-                          "gcc_camera_ahb",
-                          "gcc_cam_hf_axi",
+                          "gcc_axi_hf",
+                          "gcc_axi_sf",
                           "icp_ahb",
                           "vfe0",
                           "vfe0_axi",
-- 
2.25.1


