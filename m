Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B59EAEC01C2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 10:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M9SUr+nS+ufjroTrcpJBAW+s0gpj5VOlKY9X2rkPiv0=; b=v+Wp3UCxTFYXkIRSWA+l5OGwqE
	u7sZtc8/qwYsnjcDFFw3fm5a+zE2qQnXLlGLiuycBP5KaGAqY9KDX4D4K10jTAjpUh1+tZAKFatlC
	7gWbNTUe+yk263166vRx2ahbcu7M/VdTFdRp3E47Uxv4p/USRGEXmX9hy54v1thgR28gDPwY2mSkB
	IkIrPd5qnYjDRcWfKgww/VDi0lZ2rYRCX0f3o2t/SPG5uTYgvyOjYDnTc46tcR4YjxYqIq0Tky7qn
	OINFLd7rXsQ1+boCWuZtKUzpqEXA1Pz5RxuafSZgq2jsspeGsGuqU4kKPcDvNhVVNS42K2i3kV2LM
	qRAIzRgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cQu-0000000GVNl-3KfR;
	Mon, 23 Mar 2026 10:22:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cQt-0000000GVMZ-1Sw2
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 23 Mar 2026 10:22:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=M9SUr+nS+ufjroTrcpJBAW+s0gpj5VOlKY9X2rkPiv0=; b=AD4Vm4Q+UmX47pLXp0y1OeI77e
	uPqS3OPf53NynHXJOOZi1bAn4sAsE3rcpY7rTHpvNHfH5uCmVUwNFGryEZHCsnRMTe/uBShKnzow6
	kAcBlHWQowq1ACzWbyZNBq418Tjt0xsAAIKfLSBtHM59AKZeAD9clRdBi3WH2ujATY9pv2l/emDi1
	PIcbB8cN38ATtonwTcs4AL2su4YgKKaMe/5q0KWQk7w1RbMfTuFcNbgt//6OG3qrQ0KeDxuuOLh9/
	rV9hNfQnVjsvajYgHYcz2UGCUOs2qgTH73umI2gVYAJ40n0qi4EzYcVfAR5UNN+rK/HpaoKB4aGro
	bxk6cpSg==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cQp-00000001DMx-149P
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 10:22:49 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tkO21627278;
	Mon, 23 Mar 2026 10:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=M9SUr+nS+ufjroTrcpJBAW+s0gpj5VOlKY9
	X2rkPiv0=; b=LKoctHhnYyLKuibCM/YGGkKKduQLUKKer8ww5XNt3hSRBD1k2KL
	VJZvBlBWrrabEvitoxNBbtO6ACGE9OZ/Rh/5J2+VKnBYCT2W5xd+pvFBkR0THMGM
	jjzxqz+ENtMOxKYls76mFNN5Tznbi+Y77pPv4XMtN+828yr0gWvaoSW4uwStC/51
	vKF1h+HzTbOfr4QzCjh2NDGN8VZOVOLaMYQl6dpEcw5VnrZnnHIUlEdEnXcUNzH9
	abDR/AQja0ZKllch0SMUKZJ/LaTMhWa8VnxYDtvNnPcPLFPzcvmmBbW9QkLKqqfZ
	HFA21PyMDd9ckPDYB6GWKt2r1Se9Vyoc8ig==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31jc0h6q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 10:22:37 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 62NAMXhG018902;
	Mon, 23 Mar 2026 10:22:33 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4d1mdm6dn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 10:22:33 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62NAMXKj018895;
	Mon, 23 Mar 2026 10:22:33 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com [10.213.99.91])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 62NAMXcS018873
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Mar 2026 10:22:33 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
	id 4F6585A1; Mon, 23 Mar 2026 15:52:32 +0530 (+0530)
From: Ayushi Makhija <quic_amakhija@quicinc.com>
To: andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        dmitry.baryshkov@linaro.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com
Subject: [PATCH] arm64: dts: qcom: sm8750-mtp: Set sufficient voltage for panel nt37801
Date: Mon, 23 Mar 2026 15:52:29 +0530
Message-Id: <20260323102229.1546504-1-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=fKc0HJae c=1 sm=1 tr=0 ts=69c1146d cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=COk6AnOGAAAA:8 a=Msm59h0HKFRdTJYaiMcA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: joJKW53E4eLwPmDvhvV0V_3oyEQOjswd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4MCBTYWx0ZWRfX4GGElf7bpJR/
 mqJ/6HTWZs2Xr5aY/qeWq5Uv57vx87sOTCuykddgBb72bjnuBaRYx5NC2qkNz3+2D8WNdimqsfn
 NkIhub+d0S6pcfjyWz7zCQXLL0QyeGP3l8l6PhFclAdeAIDePIvb4FcaaIOjRwPr6RXjKYhIW6N
 2GAyBxesPQzi4D2ng/Z4Q+6ouua2dodOMJNFBT3BOAh5mk14tUfRYgdgNVool/+gXLQYoAgZpbG
 QseVtvFuiseNluevq5LXsJ7XCdZuUy/6YmhgNkkRPcTo4yg/JzGaYwScwVsMaHbyGmhiDw85xQV
 uvsyKcyjPkbpICNwkIKkQB5IuvnfXG6Wi3Plq/WBdHU47bPV5vCnokV5R6xzL2Ioe/BzOKIqf/z
 eWWxV08uqjD4HRiAVJGJJbvIE+GjhYwdwuIw5a3yq2vjyDcxxxcykc3a7nD6xNxr2vjZr7V3z0m
 H2gJqn8EExKuPipHCow==
X-Proofpoint-ORIG-GUID: joJKW53E4eLwPmDvhvV0V_3oyEQOjswd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 adultscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_102247_693274_B34C52E9 
X-CRM114-Status: GOOD (  12.36  )
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

The NT37801 Sepc V1.0 chapter "5.7.1 Power On Sequence" states
VDDI=1.65V~1.95V, so set sufficient voltage for panel nt37801.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 3837f6785320..6ba4e69bf377 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -462,7 +462,7 @@ vreg_l11b_1p0: ldo11 {
 
 		vreg_l12b_1p8: ldo12 {
 			regulator-name = "vreg_l12b_1p8";
-			regulator-min-microvolt = <1200000>;
+			regulator-min-microvolt = <1650000>;
 			regulator-max-microvolt = <1800000>;
 			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
 			regulator-allow-set-load;
-- 
2.34.1


