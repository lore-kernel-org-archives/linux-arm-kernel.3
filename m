Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A60C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 10:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CzkmqC+WLm1vrlbf2jTj168oIwfL1CCLWC31NbkXyhA=; b=Ve7nLbEDEAudsyqt+06BppER/b
	z7/GkIUxo/szqDuhWVvLEJHkplvxNyBzWStst2fz7p8n4skGvNOrxG3dIqsq1oie1HmvJldA3hT9H
	RauOpGoTLuDUhXyjdtIzLrb5xpnKU+DkPXbY+gtF3JA8BlmJ1fbbx4q+6hcYlxooIfGu0em3zg6cE
	PYm5iX2faXo2MTCTSzBsSoF7JZPJwRz44Ku9LUvoj9+o/atdaSlTr/R5o3z1QeEhZbvaTtQI1WfWi
	IwDqxY2fAXLrby9IR6cdIn0pUbxeTylyvsfgCTwhDba6xRI4L3ogYW56P/J0bHt4gDx4HlfEbfE9v
	9rAWrpBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8GGZ-0000000GjI3-0VZK;
	Fri, 25 Apr 2025 10:26:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8FNu-0000000GXtZ-2ChT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 09:30:15 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T8ZQ015508;
	Fri, 25 Apr 2025 09:30:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=CzkmqC+WLm1
	vrlbf2jTj168oIwfL1CCLWC31NbkXyhA=; b=BudrOJatB8RNqLEFiCFF0VuND4s
	4J0IwqGsXgm90IY/kVEcVPEBasw7MXGVVQyXPkI3Is2Om+GNnWM9/xRHSAfycxq1
	SAkd3gLgDL8QgOYPQYn3YerMwhzw5ZaR4DVLxEPZzRVZQQAYfj0udMJJmeLlAI4R
	66mJ588SJV5GR0Yx5CT/74DRGBUu24Gj2+I1CNdRK4rL51hYqHRU/Tems2tD/ALf
	s39XQInmcJj7vNebBpX9jL6nZGQKC9YvH4PTEFNV3X3UoD/cLi/gvqyuDYLVYtM1
	BaGpWVk5W2D8EI/bl54btuKVHYkJilcV21lhoYRXbyO75NHnG1lfmHL8KDw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3gdyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 09:30:08 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53P9U2Vc022398;
	Fri, 25 Apr 2025 09:30:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4644wnf75s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 09:30:06 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53P9U62l022446;
	Fri, 25 Apr 2025 09:30:06 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 53P9U5XB022442
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 09:30:06 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id ECAA040D72; Fri, 25 Apr 2025 17:30:04 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com, quic_qianyu@quicinc.com,
        quic_wenbyao@quicinc.com
Subject: [PATCH v2 4/4] arm64: dts: qcom: x1e80100-qcp: Add qref supply for PCIe PHYs
Date: Fri, 25 Apr 2025 17:29:55 +0800
Message-Id: <20250425092955.4099677-5-quic_wenbyao@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ALFYs74D6CbD8NMaewXD5DNcPP3R-3jy
X-Proofpoint-GUID: ALFYs74D6CbD8NMaewXD5DNcPP3R-3jy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2OCBTYWx0ZWRfX2d40eRStsULl C5CldPbn7DfkLfLYxzVNqBXxebmhks0NcEwZntbYMTnjdUt6lqkdFoHLy1A9a8taYNuVTRBSkYj eoNZzvwiQAEGpydVmWn62oTwvBlLif35Cc6ePbX8SkPdiMTyO027AZJM0gAJexLo2w26OllgzZ+
 tGBXCxcej35v4Y5v49ryCQ6ieuri7hnBMMmBwPhEO1dSToLKHjz7Lym2WXGLNB94wWwKFRCg7W7 mcVrkVjss4K0+iLIiCltoM/yv8ovi/f6GrKaL0Qs57coAjk9JgYPZjIaWZUmN6nRJMnHuQSNKyz PxhqNrvf7Vipnfl9aMHyb+ahyoKXFIiA13F70r6nYpXLbGkq2zw+HnoT+/ufn7ZALAQqqRpdFbd
 sJWJcLDjBNJNIzeuy3r6WJ2elYgEq71mytanVSLe56JNhqhMAorrl0iTSv/LeZ+j013SKp6k
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=680b5620 cx=c_pps a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=OjqB7RjhM8taGROUhtwA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1015
 mlxlogscore=920 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_023014_566735_56536872 
X-CRM114-Status: GOOD (  11.47  )
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

From: Qiang Yu <quic_qianyu@quicinc.com>

All PCIe PHYs on X1E80100 require vdda-qref power supplies, but this is
missing in the current PHY device tree node. The PCIe port can still
function because the regulator L3J, which vdda-qref consumes, is voted by
other components.

Since the device tree should accurately describe the hardware, add the
vdda-qref power supply explicitly in all PCIe PHY device nodes.

Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 88dfd2199..10f2ac70e 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -994,6 +994,7 @@ &pcie3 {
 &pcie3_phy {
 	vdda-phy-supply = <&vreg_l3c_0p8>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;
+	vdda-qref-supply = <&vreg_l3j_0p8>;
 
 	status = "okay";
 };
@@ -1017,6 +1018,7 @@ &pcie4 {
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l3i_0p8>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;
+	vdda-qref-supply = <&vreg_l3j_0p8>;
 
 	status = "okay";
 };
@@ -1053,6 +1055,7 @@ &pcie6a {
 &pcie6a_phy {
 	vdda-phy-supply = <&vreg_l1d_0p8>;
 	vdda-pll-supply = <&vreg_l2j_1p2>;
+	vdda-qref-supply = <&vreg_l3j_0p8>;
 
 	status = "okay";
 };
-- 
2.34.1


