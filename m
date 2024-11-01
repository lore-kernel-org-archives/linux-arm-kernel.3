Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363F4E674BA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 08:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kEacnyYxkFp32FAGX42OrlFB1RCx1qkrp2NUdwCUyIQ=; b=iTbQTUR67aEfLyJpIxk024mWG8
	8nGenBqbfrr36hYrf/qX+CtfyLGo9HVmMaNP/ksukuqx+yV0da5EZ3nT5dSr7MbDXXkSXyfInllas
	lxRq4M5YpKeFKFsG2Seu6be7bFHt/mT9SVOhVzrc9Q6qtai3ZYHgSHzis1es964fE0Xo2tp+9CyiJ
	d3ensI52DqpRkqBfhx5a5pFUBO9TJ1zhMQG02jFKwqowiNZL5CGSjDYmoBxRWqc+2wc2MMpzi685+
	tC0lKc6NwSn+EwcJhmlc/L5AI+RDejxvDFYFoSw4DmPVD6Fmk4BCQ3So3B5YKqgAJuQRJTBEB4fbI
	EIfbfNAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6nKK-00000006JoU-1Yoz;
	Fri, 01 Nov 2024 08:48:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6nIe-00000006Jbf-3LGr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 08:46:34 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A14d2CM002440;
	Fri, 1 Nov 2024 08:46:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=kEacnyYxkFp32FAGX42OrlFB1RCx1qkrp2NUdwCUyIQ=; b=g9
	upk/BZyFl+6uG4SQjaSrCm5hwqK5uOg6cijR/CPSHItcLiQ4QXUbLdijEee+OVGk
	x9gMFE1PUohTvC2nBy5PvngrnFKCyuDLAcBevU8PmE4JMtSmQ046Z1IPMdHOlMef
	qehbyp8DuS/jJG3toEluOzFkdaioKt/3iS8MkKMQBrPYksKctiobnpHUJADj1GeK
	dJantyGK7oGzXWmz02zfcsvE/8R1yF/TfngcqIoO7/EWRCVRcFWvdJ1mzXvJD5yH
	0Ub++bKfHb1IEXFLYTRDPcv3+3hkligFEmQiwSnYtCIkeV8q7p57XD0k4GFRzA2P
	LQCUY2ijoMc5secmBioA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42kmn5ee7h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Nov 2024 08:46:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A18kKXg014792
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 1 Nov 2024 08:46:20 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 1 Nov 2024 01:46:16 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Bjorn Andersson <quic_bjorande@quicinc.com>,
        Geert Uytterhoeven
	<geert+renesas@glider.be>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Neil Armstrong
	<neil.armstrong@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
CC: Mao Jinlong <quic_jinlmao@quicinc.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5] arm64: defconfig: Enable STM protocol and source configs
Date: Fri, 1 Nov 2024 16:45:58 +0800
Message-ID: <20241101084558.36948-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: jOVcNP3-4BL3zlHvbV3N46NMm11svx-H
X-Proofpoint-GUID: jOVcNP3-4BL3zlHvbV3N46NMm11svx-H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 mlxlogscore=843
 priorityscore=1501 mlxscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411010062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_014632_990770_CA4C5E6D 
X-CRM114-Status: GOOD (  12.57  )
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

STM is used for logging useful softevens from various entities.
With STM and TMC sink enabled, there will be more buffer size to store
the logs. STM source and STM protocol need to be configured along with
STM device for STM function refer to Documentation/trace/stm.rst.
CONFIG_CORESIGHT_STM is already added as module. Add Coresight STM
source and Protocol configs as module so that STM functions can be
used.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
Changes in v5:
- Update commit message.

Changes in v4:
- Remove Ftrace config.

Changes in v3:
- update commit message.

Changes in v2:
- select ftrace config explicitly.
 arch/arm64/configs/defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 5fdbfea7a5b2..ac11cd1a7c06 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1599,6 +1599,11 @@ CONFIG_NVMEM_SNVS_LPGPR=y
 CONFIG_NVMEM_SPMI_SDAM=m
 CONFIG_NVMEM_SUNXI_SID=y
 CONFIG_NVMEM_UNIPHIER_EFUSE=y
+CONFIG_STM_PROTO_BASIC=m
+CONFIG_STM_PROTO_SYS_T=m
+CONFIG_STM_DUMMY=m
+CONFIG_STM_SOURCE_CONSOLE=m
+CONFIG_STM_SOURCE_HEARTBEAT=m
 CONFIG_FPGA=y
 CONFIG_FPGA_MGR_ALTERA_CVP=m
 CONFIG_FPGA_MGR_STRATIX10_SOC=m
-- 
2.17.1


