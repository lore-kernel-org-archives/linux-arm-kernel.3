Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FFBCCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 13:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3KVuh3J4uffSmXT4wBLbWgmsTFDpOCerKixjRaCFdY8=; b=tU/vgUqFCFV2VmbVcHGWlKI6lv
	KRieqZfKffkbJK5XUnEM4j94QCL4HcQT5gPd3te4720CleFGcnz8slGLexzFQR1dLrMtgeUOLVuww
	LGoQcsMZrhX8Z5S4/nE4g6Eh6Ve8QBrk9kznN4pzKQlZ5iHksdzwSpu0+0dVSRP4U692Fpw8a5JY1
	l1RQPFfd2fdE8/T78WaDu1FWGc4LoZkqK7q5bIXWXpUtKMqzXGHtZfs5EnIF3q+yswl7SA+3Dzc3S
	wxakSrIczM/NkXnbz8BLNnsx7qeHf2pdYBVTVV+/1quCJcXRswFWsgwp/KYfqrsptIRt75hmtJti4
	E8L2UePg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHMQF-0000000HOId-0M5l;
	Fri, 07 Nov 2025 13:22:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHMQC-0000000HOHh-31Az
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 13:22:33 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A79EEFh1713270;
	Fri, 7 Nov 2025 13:22:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3KVuh3J4uffSmXT4wBLbWgmsTFDpOCerKixjRaCFdY8=; b=Q8YDR0yuYZIlg3pk
	TMjIdeFBn0cJ7p1QRm6P5p96OeKDAkat8h8iayh2B24rm+zNRaFhGTbA+J2TSwAG
	NwkH3x2QsAW02EQ0B54gVg0xGsszz30whcTeE439wS/1W5APxImfnFplaghdEzLu
	h5XkKLkY76tCLmV9CiV8Nxw92zBhOMClOFIKw4fxeVAz5ynQQdXRV6AsUhYM0xwn
	IDUMl214G6t1EDGOLlp/YI5KiOsau+D4+yhDfHwa76rTPybXzgK0C4l2vSsaK9Fp
	6r0WQGfC7fBwHdprQI5OxpIcVtFbkV4ASEGawpXaspRRXqrWxKJeDMKJrsD9glXg
	CoSmQw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a96ue1xj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 13:22:24 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5A7DMNbm006928
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 7 Nov 2025 13:22:23 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Fri, 7 Nov 2025 05:22:18 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_nihalkum@quicinc.com>, <quic_vikramsa@quicinc.com>,
        <stable@vger.kernel.org>
Subject: [PATCH v5 1/2] dt-bindings: media: qcom,qcs8300-camss: Add missing power supplies
Date: Fri, 7 Nov 2025 18:51:53 +0530
Message-ID: <20251107132154.436017-2-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251107132154.436017-1-quic_vikramsa@quicinc.com>
References: <20251107132154.436017-1-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=fYKgCkQF c=1 sm=1 tr=0 ts=690df290 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=WbcqwB_1BIAAR86fcXAA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: rWVeNR4KXq_FKdyp3UyEPS0T9w9EGAug
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDEwOSBTYWx0ZWRfX2oHB3+oWH/MT
 mJEG9BscQ2//1NtlUNGhuXYxSCv65r40mx4Bxaf0UMoyF1hfVp9c3x2htWSve/7C1IER2l6R/3L
 +u6x6sekcHcqwm2x66s4OPzBeOUESYghyQM5bjnFbG2IxE/XaOs9erp6gjVdDXFjjjoEkZlGEf4
 vc2NGjRduCH9XF7BS4hz0AHVgOBHuLpPC/Jp/IgsFsJu1397KgGVWDKQsueYRGGDUszYlrdWzOl
 NbGFbCk28nmcWZTJ/g1IWuLNao34fLjBpdBaumyWlDOUpsGwkLUx5Gfjx4f8nZgWy1YUv/HdU+a
 3t1qsVLOWaXWF5A2uEVzSCbn+xxd0SQvy18TOMH+vZyyY4f672/cXtxiVZfLEdEfCa1gJWpbOZ2
 Kau0sMltAuarrtRekMiHkzk/4V2Lpw==
X-Proofpoint-GUID: rWVeNR4KXq_FKdyp3UyEPS0T9w9EGAug
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_03,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 priorityscore=1501 malwarescore=0 spamscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1011 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_052232_873195_14E666D0 
X-CRM114-Status: GOOD (  10.67  )
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

Add support for vdda-phy-supply and vdda-pll-supply in the QCS8300
CAMSS binding.

Fixes: 634a2958fae30 ("media: dt-bindings: Add qcom,qcs8300-camss compatible")
Cc: <stable@vger.kernel.org>
Co-developed-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 .../bindings/media/qcom,qcs8300-camss.yaml          | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
index 80a4540a22dc..e5f170aa4d9e 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
@@ -120,6 +120,14 @@ properties:
     items:
       - const: top
 
+  vdda-phy-supply:
+    description:
+      Phandle to a 0.88V regulator supply to CSI PHYs.
+
+  vdda-pll-supply:
+    description:
+      Phandle to 1.2V regulator supply to CSI PHYs pll block.
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -160,6 +168,8 @@ required:
   - power-domains
   - power-domain-names
   - ports
+  - vdda-phy-supply
+  - vdda-pll-supply
 
 additionalProperties: false
 
@@ -328,6 +338,9 @@ examples:
             power-domains = <&camcc CAM_CC_TITAN_TOP_GDSC>;
             power-domain-names = "top";
 
+            vdda-phy-supply = <&vreg_l4a_0p88>;
+            vdda-pll-supply = <&vreg_l1c_1p2>;
+
             ports {
                 #address-cells = <1>;
                 #size-cells = <0>;
-- 
2.34.1


