Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12B4C3ABBE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 08:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uPhyLJ5Z+Wsnd0rb/dB0qgzyesiXKadq/4CcwVdIkrE=; b=JK10O/upZxX3KBpUOwv91dNW3G
	vLJHMzpWWtk9nKhl5bSPJMHocCI6RhJdHEJfmuXywZSITDfytjExwkAt1ixpPQaPG5ck6sfZxCX4f
	c+fP6SLiNgjKCDjTcd4JLQ9kalaaEr9psI/xqBzsfHSu8Ngvtiqy9sGkrM1hDY31Q1reWuzZ/ePxd
	t0yG/hrHCuCLH3Q2Y+iCsWSkP1SPxbbtH61i1puoQfkM0oCr1IQmDzk7jl1krIn/GtelnzXX/ny7p
	64bGuD0tXmtYn6CnMfeTT61df+iQ8VZlcOyfxQ6eBM5vlkXf1WwETjtzbii5v5UUGSxaDyYpF03Hh
	TcPaba1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwbV-000000006yX-0xYU;
	Thu, 08 May 2025 08:27:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwQ3-000000004qb-0B7X;
	Thu, 08 May 2025 08:15:53 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5484YDTd031703;
	Thu, 8 May 2025 08:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uPhyLJ5Z+Ws
	nd0rb/dB0qgzyesiXKadq/4CcwVdIkrE=; b=RXNSYOcSLe0B4yKsnpfCFEeC28G
	mwH6L1O7fm7v3BXEJftRy4m5zZ5Ed5KcYjFK9HXSUegNcyJmrCTAZvhGB9g5+AsN
	XGxlnLkVQLiWurqBULIdP4UHXVsbxtgin5P58tjlaaErOls46fwV+NePmXQJNxdP
	Tto3V4zXjc2+4G0axbVrwfWpbjYrzEXuQ97g8kDsM5J3dU5ujC/i/BVjlX9T3L1P
	C5rejrMyW4nO2hHFt3GtuXVlUHWmbFP2f1HRJZk47g189T8VdsZIaHkTK8wnr91j
	KrBePJGeObg6Pe/zQX0Z2267xp6Gd8VUo/ml428d/H3F3cZrcp0iXPLh3tQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpgghev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 08:15:37 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5488FY8e015243;
	Thu, 8 May 2025 08:15:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 46dc7mq5fd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 08:15:34 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5488FYdd015232;
	Thu, 8 May 2025 08:15:34 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 5488FXL6015229
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 08:15:34 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id DE7C140CFD; Thu,  8 May 2025 16:15:32 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        vkoul@kernel.org, kishon@kernel.org, sfr@canb.auug.org.au,
        linux-phy@lists.infradead.org
Cc: krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com, quic_qianyu@quicinc.com,
        quic_wenbyao@quicinc.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v3 2/5] arm64: dts: qcom: x1e80100: add bus topology for PCIe domain 3
Date: Thu,  8 May 2025 16:15:11 +0800
Message-Id: <20250508081514.3227956-3-quic_wenbyao@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250508081514.3227956-1-quic_wenbyao@quicinc.com>
References: <20250508081514.3227956-1-quic_wenbyao@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=Ao/u3P9P c=1 sm=1 tr=0 ts=681c6829 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=iAUx9HIH3_1I80GXj-QA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA3MiBTYWx0ZWRfX/bW8IVtUAo3U
 iKGeRGiOwMZsunBcPfcFYcAz1/R0vSOY7KxfQ0MZ2QToQ7Tnu58BE0rbFg5Mcr2xvhD05P+vSGw
 MAlqkuLTZt4mkUs5puJPvRGUVS2FFFvpaWNi1gNpMqVTteYWbOMVSxxE/IxeIUcKlKA8xwZ223s
 t3ekRM+EOqPhDIbIP+Fo7H1OqUAu+l3WlOySskifs1ctRlY7+cRTam9RmUdWIbRHMeALlGLmfTR
 9mxYSx8NhNdCidiKvXSFZEO5txS3qUnMIMmIIVWtWeN2P3DSZXK+g2TJHipRQ5gyoGQJ63QeGhT
 wBz5r3TXBQ/8MzwoG+jpna+thB9WfsfUqZwplNEHq3fycKU++dCMUfvrUJTuWsoJUh+LDKgtgg8
 Jc0XWoYkgcvHW+x6hnWkq3VM4cAQCoeIsZy+pBix/jb7Rp4eujG/zdOIL96nFWLL1bNVHqfU
X-Proofpoint-GUID: nizCpZqSH64bxL--A-Yf62QnIQvjwDu4
X-Proofpoint-ORIG-GUID: nizCpZqSH64bxL--A-Yf62QnIQvjwDu4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_02,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 mlxscore=0 mlxlogscore=939 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_011551_198433_CC528A6D 
X-CRM114-Status: UNSURE (   9.43  )
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

From: Qiang Yu <quic_qianyu@quicinc.com>

Add pcie3port node to represent the PCIe bridge of PCIe3 so that PCI slot
voltage rails can be described under this node in the board's dts.

Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100.dtsi b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
index 46b79fce9..430f9d567 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100.dtsi
@@ -3287,6 +3287,17 @@ opp-128000000 {
 					opp-peak-kBps = <15753000 1>;
 				};
 			};
+
+			pcie3port: pcie@0 {
+				device_type = "pci";
+				compatible = "pciclass,0604";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				bus-range = <0x01 0xff>;
+
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+			};
 		};
 
 		pcie3_phy: phy@1be0000 {
-- 
2.34.1


