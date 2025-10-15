Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348FBCCD192
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 13:02:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=egS0INP4+7mItlWy6PC1ldwGPHFg3WZ1xXhklimKiXs=; b=EdazSSKON+/VsH99WB516M5cP7
	OISL2viN+GpOjKmyBviEtH2aVklrlY3eSvWlv4VKNpVqhLStsO4BlKEa+NyalOsQVEBnrb7xDfJFp
	pXuRdn+kS8Cf2c4xKP8ldqqZI74WURePZeGXy43ev131HTKVbw9h7PTvvyZmkaQvuYtzibpxOVv2Z
	lPt65rhkhelC1LXyHbdruRowHMx4g4fiqoSxNuAc7/2bYl2mY1fJliBc1trOC2pnTJFvyQBahhIOI
	nGizTBptjBQA8HzepKAsLxnjtX4eykYJggAWeG/CjC/KvRtYzRTcvIXxLgNrF8mMG68aawFSPDxPl
	X8442CGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v918u-00000001doe-38ga;
	Wed, 15 Oct 2025 13:02:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v918s-00000001dnc-3z1p
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 13:02:11 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FB0OjN004300;
	Wed, 15 Oct 2025 13:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	egS0INP4+7mItlWy6PC1ldwGPHFg3WZ1xXhklimKiXs=; b=mPU7EwQNEqrqmrWP
	DBds9vKcUWi6Kt0U6mg02YqhPK7bZflEUCpIGJyVStX/lS1yv4y5V+seyu1baa3c
	DZ7M/XfnhIuOOcMP2iq8eTriPQSo/YnkWC90jjF9Y24wZwu3qvIIMRWewb8FUH8N
	lWfIedNH7MnBJMogRId4hrhEmjh0v0siSSg3izD9ry/CBCKEP7IEOMEwx5Z5Z0DN
	57wn69vhfTcvGxP5T0Dj6OmvfQeZu7id6gqhK5/RmzRhntBfOzRMAQX0GHqhps10
	EuRsHIa5gAc5GtFNWHUXVJ/xXHFRV7RMi5IoVsHjkjeufNSyMQcj9ukNqymnT2eU
	JukCng==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1agrej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Oct 2025 13:01:58 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59FD1vx1026463
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Oct 2025 13:01:57 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 15 Oct 2025 06:01:52 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <quic_vikramsa@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Subject: [PATCH v4 1/2] dt-bindings: media: qcom,qcs8300-camss: Add missing power supplies
Date: Wed, 15 Oct 2025 18:31:29 +0530
Message-ID: <20251015130130.2790829-2-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251015130130.2790829-1-quic_vikramsa@quicinc.com>
References: <20251015130130.2790829-1-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68ef9b46 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=Xm6lRcf7MHjJYKRB2dIA:9 a=TjNXssC_j7lpFel5tvFf:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: LUWVI2qlKkNiupA52Ou-BSFTlzSvg4NE
X-Proofpoint-ORIG-GUID: LUWVI2qlKkNiupA52Ou-BSFTlzSvg4NE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfXwufPtuCv8+mm
 osPhXkfvJBWtt/YeoujUU28dk+ug+6IxQvq3HaROUmQ20ZTZLDKHShjpJmM+hvs79xpaVjDVY2N
 qh/gqFG9FARCskM4HY09Z1KnW84DpbrSuvrX2+8f0thlJE/If9VYyQqgmLzxYp/ihjKtfvXroUJ
 4UAopYbFPXzVUsTvuRkFAtZGbEhtLKVEqKZHokiOwRtIC81qem2C3bxOhMkmlnM3fQ9iqrNB1o0
 pGrE/JzkQcJFxGEntKuUxpm2xjBdHEFlnc23cecTpoTKte/W+b74OWe9ndWXZmbjYJg1PJs8N+0
 +qqQkUGaTCntpsGZn1ZrqUqZJXK+luVxszjJiYei9x3x1hIxvZX0zEOHe5Uw9q86DirNcfH0mi1
 B6HOtVKnUWtsw6ixbwujNSJcxbwD0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_060210_987707_5124CD18 
X-CRM114-Status: GOOD (  11.77  )
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
CAMSS binding to reflect camera sensor hardware requirements.

Co-developed-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
---
 .../bindings/media/qcom,qcs8300-camss.yaml          | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
index 80a4540a22dc..dce0a1fcb10c 100644
--- a/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml
@@ -120,6 +120,14 @@ properties:
     items:
       - const: top
 
+  vdda-phy-supply:
+    description:
+      Phandle to a regulator supply to PHY core block.
+
+  vdda-pll-supply:
+    description:
+      Phandle to 1.8V regulator supply to PHY refclk pll block.
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
2.25.1


