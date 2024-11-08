Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C028D5E129
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 04:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t1cA9NDwFLH5+vfmPGgF5z/CRZpfWRBSGlRVBz5PXQE=; b=bFQYKQjTV9EPKxcqZOu9Z4IDDc
	61YPVLh1e16+TKsc55/lFAj4T9NNemaChAUC/A5W196lGSK9b37Igo43nUTGYhANN+Wz7BEkNSkmO
	vtrot+6s2SqqJVP8k9KdgvkeOmG3zLSPtV6PsR/BQgFQBFHC8lMviUE9ilbQ8szSkElIvrVipicAI
	9KRuW/N0hnehCEBzX2BVzzHRIGsVIZOGQ4UAB18CNXB9ifsCxcSByVgOGc6Vb5VOSi6UT4uFaGox4
	4kbOyAIBp6f0AdP0B0dOKO88z1nLYL/YJIJsqfEtpZb0g+rPzQupaXPs86b6OKISiTyiYeNw14hJO
	s7FfkQVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9GlO-00000009I6V-3uOl;
	Fri, 08 Nov 2024 04:38:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9GKw-00000009E9b-2VWK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Nov 2024 04:11:08 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7Mb2bV030659;
	Fri, 8 Nov 2024 04:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t1cA9NDwFLH5+vfmPGgF5z/CRZpfWRBSGlRVBz5PXQE=; b=HWzlD2nzjTsPUkYW
	4GZDqH7hqdwse2TbOtJ78C+VGiDXfdXwfJahU/OurYTWsa4GKY/F13nIwaFcrJfE
	L1YzmndH8h/jUSn5DRr5k3n3fqeWv9JRozSbMLwv375TSkxau56XP5M+T5EQp2Io
	z5tkGc9TB2dqgn6eS1uN0kwwmUSrtH7ba1y/Ox37nFl75YP3ao/CWFtXeazQf3hq
	nQZjH3KKntd/36HxyPAGw8fTIj+ef7ZomwS/tcmPG8CvDEb5p0bVxynuZzP0+w6q
	ZyDK4ICaUG6P5WtQcPkV5GSU775A/h6wMmidwjcqQJWEMNlSrVLGIMzyIodV3UDm
	Av52NA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42s6gdrkpu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Nov 2024 04:10:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A84AdI1017790
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Nov 2024 04:10:39 GMT
Received: from hu-tdas-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 7 Nov 2024 20:10:34 -0800
From: Taniya Das <quic_tdas@quicinc.com>
Date: Fri, 8 Nov 2024 09:39:28 +0530
Subject: [PATCH v3 11/11] arm64: defconfig: Enable QCS615 clock controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241108-qcs615-mm-clockcontroller-v3-11-7d3b2d235fdf@quicinc.com>
References: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
In-Reply-To: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Abhishek Sahu
	<absahu@codeaurora.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
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
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: lzLao80oBNAttmrh5-Ggi8TzDY48jHFT
X-Proofpoint-ORIG-GUID: lzLao80oBNAttmrh5-Ggi8TzDY48jHFT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=693 lowpriorityscore=0 bulkscore=0 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411080034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_201106_810669_DED0E99E 
X-CRM114-Status: GOOD (  10.30  )
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
index 730f303350c36a75661dc267fdd0f8f3088153fc..2fa666156b88b44a8298651e276c196cded9a7f8 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1322,7 +1322,11 @@ CONFIG_MSM_GCC_8998=y
 CONFIG_MSM_MMCC_8998=m
 CONFIG_QCM_GCC_2290=y
 CONFIG_QCM_DISPCC_2290=m
+CONFIG_QCS_DISPCC_615=m
+CONFIG_QCS_CAMCC_615=m
 CONFIG_QCS_GCC_404=y
+CONFIG_QCS_GPUCC_615=m
+CONFIG_QCS_VIDEOCC_615=m
 CONFIG_QDU_GCC_1000=y
 CONFIG_SC_CAMCC_8280XP=m
 CONFIG_SC_DISPCC_7280=m

-- 
2.45.2


