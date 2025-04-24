Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55531C369D7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Apr 2025 11:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gr4Nx66BtTJnqIpo9EnwzuZEntlgVLrl7rCwoj0YhnY=; b=hIPES9tx+Qf7vP0wnOiPDKb4WV
	HnJuyIOZRuia9M2dSLgy9NeyELx/KC3hKIfXDoAWhHww50IH53zuCVhP0kKDtjrYJYX2R6t2RHw2V
	SzzqVgXd1uvEW0uRyNCh5VjBTjj5hUptOQm2piIQT2g5PFQH3/o9f+g2CaPYkvMJuQpPCS/armTY+
	P0TUv81lES4kwC82AdcrjJ3+2hJDeMo6PnOdiicHjWibZUJIJUXTV4U80pTMtsKYgmqC5H7wv4S7B
	Z3OTOzzFekqLmxTgJMJDVQlEf91lsElWHSkg+5K40jhwLYGMFZe7RC2M0SicsE+wNtewXTYCM9t21
	4hSyelEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7utL-0000000DspR-3epj;
	Thu, 24 Apr 2025 11:37:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7syO-0000000DWA4-32Vp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Apr 2025 09:34:26 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F81V010284;
	Thu, 24 Apr 2025 09:34:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gr4Nx66BtTJnqIpo9EnwzuZEntlgVLrl7rCwoj0YhnY=; b=jicVC9QVWDHkRGFP
	WORxWmmEvkzaG+Ovph2wKfbk9LSsdEPr1DCj/0QICdN0fCJUPWTUTY8RlLiEx/g6
	XDH171mTd0YntmkpDvN4WckdvGr2jHANRFd0YRKmWUrO9OAOeEglJ/YPt34PNy6o
	os/T81tnVpCwLl+gWIU37QlZ4EJW3tL7obxXejSnP+CSY3pCxxUXAzSV2pweDVXa
	yshvcmv8miqCqmv7oiWpVHgbky8iA41TMXGBSwxjRUnS/XWRT2iRSSnwWJTc7GVJ
	t5l+K9QvNQ5zfk3RQSkwfGYuGPaGHQT+zhifLI1WzJiQlEzkwpjemMR64F2tBsCU
	mirE3w==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3n05k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 09:34:19 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53O9YIgm029062
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 09:34:18 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Apr 2025 02:34:13 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Thu, 24 Apr 2025 15:03:05 +0530
Subject: [PATCH v8 10/10] arm64: defconfig: Enable QCS615 clock controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250424-qcs615-mm-v7-clock-controllers-v8-10-bacad5b3659a@quicinc.com>
References: <20250424-qcs615-mm-v7-clock-controllers-v8-0-bacad5b3659a@quicinc.com>
In-Reply-To: <20250424-qcs615-mm-v7-clock-controllers-v8-0-bacad5b3659a@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik
	<quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Taniya Das <quic_tdas@quicinc.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pvTb4lVkXSfczM1XnuhIzIGRpjcFW80s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MiBTYWx0ZWRfX440cgH3v08Go /NFB0HGH4cEBRq7AmjR4z4wjtEmYwGvv1CrFWPrwkXA816/IcQglJZ/eBeJul40mcjoz6vctHCf RPcR1LCHDB0ves+k94GEGE/aVCtoeSItxSPh4PMk0Zkx/pyRFuxj8NPPH1G29oCJGkE8ua8j3gb
 nIbjGR8VQL+Gnvghdo9+GR2f9zUxLzomC42J9ZJ6AoicQWB5IlKQku18t8NAyid1F+YdujNEQh6 3SbIQrZnpuWLb2T7LMsTNiYPaIZW1s3CifOQAaKuQU/ySfitc1EXSf0Mwv5SWZPzbNWXdjtTG+9 tubyNFaYO+J9r1fHJe9tnkp4dbXynK8t2GFPEPXJg8l8IyJl+Ut+CSejsSqsWdUZEO44zDaRnyy
 BnVKQUYEbpMI5nGjQwP/QF/PZPcbMNH6J81ieylU2JIrRxbpBaxIgufK6HBR+mfBBwteGmey
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680a059b cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=AElZlkIX1ip-SmTVEvQA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: pvTb4lVkXSfczM1XnuhIzIGRpjcFW80s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=743 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_023424_914059_3A7FD9A7 
X-CRM114-Status: UNSURE (   9.69  )
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

Enable the QCS615 display, video, camera and graphics clock controller
for their respective functionalities on the Qualcomm QCS615 ride
platform.

Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5c85e5da152f2a9f24fd121fca427afe428438a7..a992c4ee363a1443dfc0c5c86de2af6c0e1963f0 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1355,11 +1355,15 @@ CONFIG_MSM_GCC_8998=y
 CONFIG_MSM_MMCC_8998=m
 CONFIG_QCM_GCC_2290=y
 CONFIG_QCM_DISPCC_2290=m
+CONFIG_QCS_DISPCC_615=m
+CONFIG_QCS_CAMCC_615=m
 CONFIG_QCS_GCC_404=y
 CONFIG_QCS_GCC_615=y
 CONFIG_QCS_GCC_8300=y
 CONFIG_SC_CAMCC_7280=m
 CONFIG_SA_CAMCC_8775P=m
+CONFIG_QCS_GPUCC_615=m
+CONFIG_QCS_VIDEOCC_615=m
 CONFIG_QDU_GCC_1000=y
 CONFIG_SC_CAMCC_8280XP=m
 CONFIG_SC_DISPCC_7280=m

-- 
2.34.1


