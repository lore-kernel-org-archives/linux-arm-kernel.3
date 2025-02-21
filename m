Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5156AC021B5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 09:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+kMUKYPbHm/lsNa6RKG2tjCRLB2lBGvcqqikJRga6kY=; b=DsCpY5NpknoLsC1XtbexhJo0GE
	Cibjr6ZZcJghyhIzmwS3lb7qwWeyoyCcMc6N7uLNMZoYkDLuBcJnHxHS1nRed4n8/10KIrKHSInWw
	GbYJjlfcjx8zvMZx7cWYq1itrCazrMwKZxRasfX698HS9pEzOzOeIbv0u7MrgZqkEbhdwOQbETLYE
	uDbD7elekOSH+nPEVRQhyVUQwkZ1ka4OuO+HNEGMBKJKntdO8hVsJ46WMEb+x9aXP4J4FhcEiVlCX
	66BfujNX/2FCgcS+7EQOSlGokBa13b525bCovYNYpsxfKee418/u3K4KvzYCKoZqwqiz/XeqWdqJS
	LKWuuWig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPVj-00000004yJi-35Go;
	Fri, 21 Feb 2025 09:39:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlPDx-00000004uEB-0Mdt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 09:21:34 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L5Dnhk014898;
	Fri, 21 Feb 2025 09:21:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+kMUKYPbHm/lsNa6RKG2tjCRLB2lBGvcqqikJRga6kY=; b=T5oQpoi7gAp6cMIw
	NWRlLpGaAtXvw0f7Y8Vzq+MpItwiF7JQdzFJi6Wcxnq8ILWakTt5gkcF1scmPZnZ
	it8RazlGFH4ucv1SfVhTnzSpZscxCd7cLsMGIX1QShTmoaAE44ym1c87WIx5Mt5I
	ukHuhiLd8+4qOuZ1vinTEPmCuKc3SmXlM5ktr4FLQUCddPhE/byK/7I3MGL/dJ5s
	B+oiHaQ5D2O+B6bmku888tR/vXAx3/iAX+p/SsUI4Lzp+QYl4suIVoo0OnO+XhlD
	yh+3jNgp+cS3kvIXzwWhpjs0rrRL6+aSkdHxm28LRjYEjbD572Xo+GbGFUF0KXTu
	dFj1cQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy19dtd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 09:21:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51L9LP3D014994
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 09:21:25 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 21 Feb 2025 01:21:20 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Date: Fri, 21 Feb 2025 14:50:21 +0530
Subject: [PATCH v5 10/10] arm64: defconfig: Enable QCS615 clock controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250221-qcs615-v5-mm-cc-v5-10-b6d9ddf2f28d@quicinc.com>
References: <20250221-qcs615-v5-mm-cc-v5-0-b6d9ddf2f28d@quicinc.com>
In-Reply-To: <20250221-qcs615-v5-mm-cc-v5-0-b6d9ddf2f28d@quicinc.com>
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
        Taniya Das <quic_tdas@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.15-dev-aa3f6
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NqdT_gopffnIhv01RZBhebeHlyrhws-2
X-Proofpoint-ORIG-GUID: NqdT_gopffnIhv01RZBhebeHlyrhws-2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 spamscore=0 mlxlogscore=731 mlxscore=0 bulkscore=0
 malwarescore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502210071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_012133_143122_16C4E39A 
X-CRM114-Status: UNSURE (   9.21  )
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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
---
 arch/arm64/configs/defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index a1cc3814b09b31ee659536a64b7db704153d6fe9..14e5ae9f9562b1b2bec2fe2702dbf6647ca1daa1 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1343,11 +1343,15 @@ CONFIG_MSM_GCC_8998=y
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


