Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0939AC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 08:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzWTEW+W3lGiCAhiPR5K0lLXKV9A8/Cr9jORc6rODr0=; b=O6tuvmek/K0eVDVHTRr2DsEIw0
	/I6uNGlolbSQeqOewE0p2GtEA0LprC5zHTVE4y0n3GfGn5TIUWvyXwruCyCwbQFL/NFnWyB31XBh1
	XXGTbWK6f0N4KjCmXQ1EHxb1s5VBGyggVAztOXoyf4Z7iFaviBuHiKo5+lYZHIbh7fbeYkT1DZPAB
	qUpYhvqWWp1hw8VL813W+7X77M7cVKgrxB690yzhJcMrxFkfJIawsam74xyQJQiRI5zkFQbz/pBZ/
	7miWLYbf8DE1fqp7z6uNR9cT93dfplqtGJFRjjX0AsAuIeAdr11j3lK/TF8at605yAQj0fv9Y8FeV
	baqqKaaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMjP5-0000000Ct81-3C0c;
	Wed, 04 Jun 2025 08:23:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMj5P-0000000Cplh-3j08;
	Wed, 04 Jun 2025 08:03:01 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5540G03u014378;
	Wed, 4 Jun 2025 08:02:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bzWTEW+W3lG
	iCAhiPR5K0lLXKV9A8/Cr9jORc6rODr0=; b=p3u6RaDrre5XBDpAaxkRR5sWGtn
	AEr4JnFEH8Q5VowQbVfQL7q6pDCAoI2Ewt4H2pinP/7pwbxmjcBxw8pPu/U9lTsz
	S12iA4PMg4QUj4+81eksNmtlHwhr/DJVeBFCUY/rpUj/jGRhPE9i1pZCXjgOTnw3
	L96/xwk8To0SLXE4x9L+C+LiSgGbx29qVFWLwsrtOh1aSLgp3zwy1e0j/LJIlBw5
	GPOISfRk7EkcwAXOeb1xOLmkNHtzdYG2UaDYNAv27PzxNOer2cm1/YaSFCWC5+4K
	pc0+heZxqzWACkoMITXDZAhQbCorYWUbywBQ4LQcNuPqIwcf+gcGBvLYe3w==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 472be810gx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 08:02:49 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 55482kLQ018808;
	Wed, 4 Jun 2025 08:02:46 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 46ytum6jgp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 08:02:46 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55482kZp018800;
	Wed, 4 Jun 2025 08:02:46 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 55482kcw018797
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jun 2025 08:02:46 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id 4093940D26; Wed,  4 Jun 2025 16:02:45 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au,
        linux-phy@lists.infradead.org
Cc: krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com,
        qiang.yu@oss.qualcomm.com, quic_wenbyao@quicinc.com
Subject: [PATCH v4 4/5] arm64: dts: qcom: x1e80100-qcp: Add qref supply for PCIe PHYs
Date: Wed,  4 Jun 2025 16:02:36 +0800
Message-Id: <20250604080237.494014-5-quic_wenbyao@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250604080237.494014-1-quic_wenbyao@quicinc.com>
References: <20250604080237.494014-1-quic_wenbyao@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=bNYWIO+Z c=1 sm=1 tr=0 ts=683ffda9 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=tbgy-Di65HE5H-DEitsA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Jb3zl6ZJ9lXJ3Ii9JmAgHg35wUgNWerC
X-Proofpoint-ORIG-GUID: Jb3zl6ZJ9lXJ3Ii9JmAgHg35wUgNWerC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA0MDA2MyBTYWx0ZWRfX4r04uPZVJ259
 kK6/t7YUI2/vg5hA4LOyzgMPYGhz3Zdr5aO31SfxLOaGvaaDPSwDE7YyZNnG+H92o9W5Ds1Lelk
 c4H9nqoMRcfl3NGJvlDMUOgY/LI6YQe+LMuZ5d993AXArs1Fg8Uidw0fmvVz2r0Q/mi34xIFDfr
 qJ861DsQPBFPXDNGfxUE9ybgxJ/kKk/VF46JK9d22V1PPe2dXgskogNU6ToCdHDPYiUOrjQBpWI
 t/jYX7mYkhoXLR9ngiZsNZ7n9waN2gGsZLfP5zcDp+QEXA1wyAamJGl98yj6/cWF5RwCitR+ZPf
 JNJOsKVZThHIFgyuveAxHL1VW3Ur+UzF1Fu5Ezw92iidyHYclfCWKmfF5L5tbJJRrI+7bYB0Yti
 htRJvw7nOQFeQwl6/vqWdORZslR4StgMTbrk5K8XSsnm9ixIQldewox7X2VXoZokRguEUzDG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-04_02,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 mlxscore=0 impostorscore=0 spamscore=0 clxscore=1015
 mlxlogscore=882 adultscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506040063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_010259_931870_BD139388 
X-CRM114-Status: GOOD (  11.81  )
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

From: Qiang Yu <qiang.yu@oss.qualcomm.com>

All PCIe PHYs on X1E80100 require vdda-qref power supplies, but this is
missing in the current PHY device tree node. The PCIe port can still
function because the regulator L3J, which vdda-qref consumes, is voted by
other components.

Since the device tree should accurately describe the hardware, add the
vdda-qref power supply explicitly in all PCIe PHY device nodes.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
index 71c44e37a..3bbd234e5 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-qcp.dts
@@ -993,6 +993,7 @@ &pcie3 {
 &pcie3_phy {
 	vdda-phy-supply = <&vreg_l3c_0p8>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;
+	vdda-qref-supply = <&vreg_l3j_0p8>;
 
 	status = "okay";
 };
@@ -1016,6 +1017,7 @@ &pcie4 {
 &pcie4_phy {
 	vdda-phy-supply = <&vreg_l3i_0p8>;
 	vdda-pll-supply = <&vreg_l3e_1p2>;
+	vdda-qref-supply = <&vreg_l3j_0p8>;
 
 	status = "okay";
 };
@@ -1052,6 +1054,7 @@ &pcie6a {
 &pcie6a_phy {
 	vdda-phy-supply = <&vreg_l1d_0p8>;
 	vdda-pll-supply = <&vreg_l2j_1p2>;
+	vdda-qref-supply = <&vreg_l3j_0p8>;
 
 	status = "okay";
 };
-- 
2.34.1


