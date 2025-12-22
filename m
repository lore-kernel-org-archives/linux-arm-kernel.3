Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45033E6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 10:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xGuTJwfFN66OKPst8uy87K+lOkYNI7LbJ64dSvoR0Kw=; b=VOSVuAGJd/qOUFufe2pLNnzGtM
	LWpUcVc/o4/QFbffnh9/re2bTModNzgoq8WMSfTZgFlwNAPcp7+7qeb5ko2nQmMfyMfCj8lOvLpKk
	fNBqSqAlGKyV/RsPVWRNtCYboS6tc16sATuUtuVIBbzr4KOhzxmC4MSoGCOfPW4fgE2SeaeahuBVT
	IBrjhlvhuxqHHWEglzxckZUH02u5JF8V+UKl5xGwkukRQ+zyaYgVyRrHWlMedTtrhUilOGVuyBFgf
	qieZhCcZrEOE/Jx6kp5gXyWiWfbL4ZOnIoSmE8X4HwIPZ0p0IqrbpUgCf+yOmp5V9FkgXK49tGemC
	c6iHJX+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXchs-0000000DZvn-2CDL;
	Mon, 22 Dec 2025 10:00:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXchq-0000000DZuX-0oN8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 09:59:59 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM8wq8e3962884;
	Mon, 22 Dec 2025 09:59:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xGuTJwfFN66OKPst8uy87K+lOkYNI7LbJ64dSvoR0Kw=; b=Tbf5Wx4q8i+tOGqq
	mrOy+WjDtyvqLsJU9b0vqwoupVFRGMgUYD0hLZF941IUDe0rNoxoQPuus4Z+AueJ
	xiZIm0Yny0xwp/tlSRmIIcaQsVUF1I1bqePFpA9T23hYD+CxcEYxScKKWxRkL5rB
	pPZRv3+KqBIw/Ic2LO1Wa0o8pRQNzXibpf6XF6yzt/3N25mNTDoug81uLgbprNrz
	udw6oY5jz0rP4017PHTQnXg/PrZe6JRxJUPtP0KHRedXBYuZ1vNML1cOsSH7zmvu
	Yz9UvXq8ScFV0KRv/LYXho2nXpENa3IbwLVmQTBrk+VAA9hqvSLhR8lpvh0VXT47
	5Ea8MQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b6vk6hab3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Dec 2025 09:59:52 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5BM9xprY024437
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Dec 2025 09:59:51 GMT
Received: from hu-nihalkum-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 22 Dec 2025 01:59:45 -0800
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>
Subject: [PATCH v8 3/5] arm64: dts: qcom: monaco: Add camera MCLK pinctrl
Date: Mon, 22 Dec 2025 15:29:12 +0530
Message-ID: <20251222095914.1995041-4-quic_nihalkum@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222095914.1995041-1-quic_nihalkum@quicinc.com>
References: <20251222095914.1995041-1-quic_nihalkum@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: u7JxKn6oG7ihmhNiFEF6iQAG0JscfQXt
X-Authority-Analysis: v=2.4 cv=cuuWUl4i c=1 sm=1 tr=0 ts=69491698 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=tfCBMw9KTM5U2-pTabYA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5MCBTYWx0ZWRfXzZcGNsGDBru9
 L+ejXK53X/awq7ZRy8PTp+NomkcuxJtTyNwauyv+q5CmWpS2Cp9yNl/AFkOmzrM497spfbMF9wl
 Ovlv6v/D2+HW2bcbsgxw+p9fe/Q58P1wJzSnYmC5M/YKWmrzdnjomeJEMfuYQIF8uFQvvrtGFCG
 pOzE5pb1tZ6u4JjaYq4kxlDD6Pd5UvUhUEsx+/KEllJyO6RY2PTYoeFOPNTbOLRxTOg//dC66wu
 dyUo//eVJFrq45jHFh7Ay8fECGKRFosXZihLqdW1AWvAiZPrOqBZUYNN+aepA6nVyfFBZUZgTTY
 R8YFlR1DM+6OwvMYBuLOm5YehT2wqF7e4525GEjaRbOhRFDc2kTRwIM1k2YIseK8fDMzVRLNhsq
 susTF7KYGMmFlzvrDwrBrshQqqq5bml/xJiNm3ltlOmUYBPgNperKd0rzs42REJe7bWPj3mInSc
 bevDUWzc67a2JjWSO1Q==
X-Proofpoint-GUID: u7JxKn6oG7ihmhNiFEF6iQAG0JscfQXt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_015958_241712_DAFE1081 
X-CRM114-Status: GOOD (  10.69  )
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

Define pinctrl definitions to enable camera master clocks on Monaco.

Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 4b2d8a449b00..ace09239d167 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -5182,6 +5182,27 @@ tlmm: pinctrl@f100000 {
 			#interrupt-cells = <2>;
 			wakeup-parent = <&pdc>;
 
+			cam0_default: cam0-default-state {
+				pins = "gpio67";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam1_default: cam1-default-state {
+				pins = "gpio68";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			cam2_default: cam2-default-state {
+				pins = "gpio69";
+				function = "cam_mclk";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
 			cci0_0_default: cci0-0-default-state {
 				sda-pins {
 					pins = "gpio57";
-- 
2.34.1


