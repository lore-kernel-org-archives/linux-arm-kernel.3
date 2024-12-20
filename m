Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE04E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 13:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BiCq/ggOy1Mj+xrCvS1MbyU2m25JjbVq+CFVxvMFFxY=; b=PTtrOmUppuyPKcMUEDX3lcg3Lz
	1GZ+zZ52jNdP3JX6aTwyM1m2N1vw5rgsDqRDaNsjLRI6izFP0SUbo5svK7a3QIFhFBQz+GlS1dXut
	lqZAdaQ/AWwRJmZ5piF0p5ZDSg1KQyP+kswOneeBEunb8Mp8++ABduMXPUoaVyGGMNx63CiaZUy19
	hVn/Pp0NO8NUFBc/CNz2l1pYlycSdG7+Xe+62eDHKaKvswnNMG+w+AdakcAInZ7mRtIum6H0SJt8E
	Wiqe2FB9v8wYRj2jbd76DBVWbbyE3Qa2HjheiAnYOPHXy1rv7XSd67cWk+0ryMuk6hx+lUY+2wSc0
	0YZPV0jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOd2w-000000050Ya-2HmS;
	Fri, 20 Dec 2024 13:28:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOcyf-00000004zpJ-0UYx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 13:23:38 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BKDHWKI017496;
	Fri, 20 Dec 2024 13:23:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BiCq/ggOy1Mj+xrCvS1MbyU2m25JjbVq+CFVxvMFFxY=; b=WczfNYODksWgVME7
	R8gmkYDAPR0hJERTcWLj1Kx6W3HDwOV0f0rAgmfpnkcDbLQfPo5m6nRlrW3PP4Qd
	PLLr7CtF50dimt9UCXvFMHY6JS/KeaUXUGwlM2CpKMjc2j4RzxalqS3gGkXGiQPE
	hLeJKMyNDNWV/GqGN4FqoR2AKjEF/cH6Vrbxc7OYBHdq78xvneDUbgQiMJ+sT7n2
	lPJoWCiornYB5fcqonKjybBrUhJBDJgXTO70dxfe/CvIFH3I58R/C6l+a6+FvABy
	HtKEoN+W9IukSJ5tDECUhtMQe7UW6XesMjXFO+8MlecZ4rPr3bFsIwbYFPMvz60+
	+JY5Zg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n9b9g0m9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 13:23:31 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BKDNU3J028348
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 13:23:30 GMT
Received: from nsssdc-sh01-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 20 Dec 2024 05:23:25 -0800
From: Luo Jie <quic_luoj@quicinc.com>
Date: Fri, 20 Dec 2024 21:22:44 +0800
Subject: [PATCH v7 3/5] arm64: defconfig: Enable Qualcomm IPQ CMN PLL clock
 controller
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241220-qcom_ipq_cmnpll-v7-3-438a1b5cb98e@quicinc.com>
References: <20241220-qcom_ipq_cmnpll-v7-0-438a1b5cb98e@quicinc.com>
In-Reply-To: <20241220-qcom_ipq_cmnpll-v7-0-438a1b5cb98e@quicinc.com>
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
	<will@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <quic_kkumarcs@quicinc.com>,
        <quic_suruchia@quicinc.com>, <quic_pavir@quicinc.com>,
        <quic_linchen@quicinc.com>, <quic_leiwei@quicinc.com>,
        <bartosz.golaszewski@linaro.org>, <srinivas.kandagatla@linaro.org>,
        Luo Jie
	<quic_luoj@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734700989; l=1117;
 i=quic_luoj@quicinc.com; s=20240808; h=from:subject:message-id;
 bh=+OxXg2QXQ+OHrRphpirBbItOGJpslDJ3UrXWpTyc7hQ=;
 b=SIeUG6cnIqa1b8SjoY35Gy9uIIuAwxiz/kvnrsA8KiLzJLNvzeLIXQo3JuTnq3QUbbX24quKr
 V9vHr5zTlm7AE1ZyheEcsARzFBgKM+19yWD3jNtpOf1fcRT03xMHaD+
X-Developer-Key: i=quic_luoj@quicinc.com; a=ed25519;
 pk=P81jeEL23FcOkZtXZXeDDiPwIwgAHVZFASJV12w3U6w=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ZWvBQmUFqU28Yi3-SheqX141jF7utUMf
X-Proofpoint-GUID: ZWvBQmUFqU28Yi3-SheqX141jF7utUMf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 adultscore=0 mlxlogscore=759 phishscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_052337_164197_54A0128A 
X-CRM114-Status: GOOD (  12.18  )
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

The CMN PLL hardware block is available in the Qualcomm IPQ SoC such
as IPQ9574 and IPQ5332. It provides fixed rate output clocks to Ethernet
related hardware blocks such as external Ethernet PHY or switch. This
driver is initially being enabled for IPQ9574. All boards based on
IPQ9574 SoC will require to include this driver in the build.

This CMN PLL hardware block does not provide any other specific function
on the IPQ SoC other than enabling output clocks to Ethernet related
devices.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index dfa5c8d5b658..92f60b04cbba 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1316,6 +1316,7 @@ CONFIG_QCOM_CLK_SMD_RPM=y
 CONFIG_QCOM_CLK_RPMH=y
 CONFIG_IPQ_APSS_6018=y
 CONFIG_IPQ_APSS_5018=y
+CONFIG_IPQ_CMN_PLL=m
 CONFIG_IPQ_GCC_5018=y
 CONFIG_IPQ_GCC_5332=y
 CONFIG_IPQ_GCC_6018=y

-- 
2.34.1


