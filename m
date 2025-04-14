Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB979C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 09:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kxgJMqppm+6M72Q9bPtiYVexcWKT52ob42MkDqN8lxA=; b=mWzGJ2UAMGr/T1btHFoc7ZZdPM
	hj+AMQ3aOA0/hHKyKMUc77QZNVh1vD/89cC3U9stB2jbNeNQhBSAnRHVGppUcokmaISkTUNtlB7tZ
	CKatGWAdA0RBGYPg1J2jhuEnUSlHnueptZfQCZLWhTW/JZPjuhE3dVgiUgwz/s2/gosv+PVH/c0Zu
	pec6zXUFYkXO9Vp6ssOHJmEPA4JBF1mTD1d0XLwsZ019Rb9fAqxJglB3TmNXZXM/xlaObNXA4JQBy
	H1Gxdwb7Sq8yZUX/tA7nAVJZv72l7PhVvuBR8S2Km/ErCegDfufWuLu9K0g3yNo8ZKMZIPUjizmxr
	ROb/6rLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4FkV-00000001DBX-10fi;
	Mon, 14 Apr 2025 09:05:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4FQ7-000000019M0-23Jm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 08:44:01 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DNjeXa021538;
	Mon, 14 Apr 2025 08:43:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kxgJMqppm+6M72Q9bPtiYVexcWKT52ob42MkDqN8lxA=; b=NeWwzol+AcPHQk9l
	fMn/+T6S00ljTDQ5N1S85zic3N4fJe9ib5MIEsVifF/zLYjW3475dBEqeVpNH2L5
	1EQ6kGRidM4cP+qMRJraiz1+21xvhGAZNesSvsJvfjdzdvkxUtk0FFBUHz9TurnT
	POThPh3GLbY6/tmBoXl3tn0+BdWqJIoViSOzRflyBEcpqKh1MeEAo8/cSqiEsoPF
	BrFQlTtwaXXcts6ig4ZxnO70RyzURJOJYHBBem0rBF0ztqg+ps2kEz6VL+U8bkpb
	e/t6Yc5hjeSEQfHNRnaDu6chSY2t43iNDeufJy7d+uZjdfLn3Km5m8rk1aA0jZKj
	MK+wbw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbpkrpa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 08:43:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53E8hr9A018693
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Apr 2025 08:43:53 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 14 Apr 2025 01:43:49 -0700
From: Taniya Das <quic_tdas@quicinc.com>
Date: Mon, 14 Apr 2025 14:12:21 +0530
Subject: [PATCH v7 10/10] arm64: defconfig: Enable QCS615 clock controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250414-qcs615-mm-v7-clock-controllers-v7-10-ebab8e3a96e9@quicinc.com>
References: <20250414-qcs615-mm-v7-clock-controllers-v7-0-ebab8e3a96e9@quicinc.com>
In-Reply-To: <20250414-qcs615-mm-v7-clock-controllers-v7-0-ebab8e3a96e9@quicinc.com>
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
X-Proofpoint-ORIG-GUID: THYGcC9Jo-wOZC8mzNn7oF2vAEuWBpx7
X-Proofpoint-GUID: THYGcC9Jo-wOZC8mzNn7oF2vAEuWBpx7
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=67fccaca cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=AElZlkIX1ip-SmTVEvQA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=743 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_014359_536634_8F8F25B5 
X-CRM114-Status: GOOD (  10.08  )
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
2.48.1


