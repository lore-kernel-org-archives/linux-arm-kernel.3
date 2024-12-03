Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F864D49797
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 09:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xqRolMf44AtEvWmKhIbZZjP41tOQ8VJcadtb6utRzfg=; b=LtZU74lauJttPpZW9dJiNKVXID
	Um9/OTFUv+WE7TkV7rSa7tw36Ci5TN/wRrK+0lod/hJ3Jiy/7QsdoX3dcpNPyYfhIziJimNpT7zMB
	/H/PS2cAhodTNC8w4bS1iERNBQ0WWtrro0698yZfLTUE45USEpcSLfoEAALmwaLiVVu52uC9z4vOY
	140qQs6miI8/8L1JywXYLepo7nBIUZ5nmwsKm2ePb2laYeFoIuqQTE0eBbTG6Ys98Zqx8x1q21eXP
	+MHvAE0WRToMKAPUL7B79iaKYj9SuXHYwViXdz71oX1jvqGi3mBg8mEKtnJa/FzofXuMIBkHFV8Oq
	D4ah1jLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPFi-00000008tC1-2pk5;
	Tue, 03 Dec 2024 09:31:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPCC-00000008sDX-49Id
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 09:27:54 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B362bOF027824;
	Tue, 3 Dec 2024 09:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xqRolMf44AtEvWmKhIbZZjP41tOQ8VJcadtb6utRzfg=; b=CCETqRFXJZMnJQl0
	d02MCFwEJ3g9b4iWWmYd9V7ecIHvHQ6/NHPPhLiLxi0bM3VvdAgw+cSOHw0DOl3P
	poUzN4AC/FfwpQ50HGMDg36NK1Jn+4oTMtigJmDUgFmMjzDusN9bdXgsZwoY206c
	Xek4vN9IcBPCWJGPJ2osELcxSvD5HCk8iKy5AhbyyOVS1UUeCXynqrBPJB+hpJQG
	IAhmRt+hpsxP6z7vJf5Q2K7wOtX0eoKsEK0eQEjyFd4K4dtDCTiNxKpp0PEbTk/X
	2WyfNNvdct1NRAgXRWQwWyb+HNMAOjSmpqLht2d05xwoUT/ZImvFo6nEBn469+6+
	vK6xuA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439vceghpj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 09:27:47 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B39Rklw011588
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 09:27:46 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 3 Dec 2024 01:27:43 -0800
From: Jingyi Wang <quic_jingyw@quicinc.com>
Date: Tue, 3 Dec 2024 17:27:13 +0800
Subject: [PATCH v4 2/4] arm64: defconfig: enable clock controller,
 interconnect and pinctrl for QCS8300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241203-qcs8300_initial_dtsi-v4-2-d7c953484024@quicinc.com>
References: <20241203-qcs8300_initial_dtsi-v4-0-d7c953484024@quicinc.com>
In-Reply-To: <20241203-qcs8300_initial_dtsi-v4-0-d7c953484024@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Jingyi Wang
	<quic_jingyw@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733218055; l=1503;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=e5LB7fkyDReLSrKUj/UJVh0gOHPAAwQ1ZKja7Qkc+ZM=;
 b=BH8v2RtJgvIG3pcjoOpa/ps35vp8FWRXLQve5W9sADzQ7lgDy4P+nek9GJVxt6d6ZNFMJ3HKO
 0QvzqVBOEugBNu+hl5oRpJR4lN1mBrQi9JOHq/hbqfFFhd76Ceo8LWb
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QV5GSyAWXiHR9vX7PiF1Sau6TuoUxBdc
X-Proofpoint-ORIG-GUID: QV5GSyAWXiHR9vX7PiF1Sau6TuoUxBdc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=693 adultscore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_012753_038717_DEB00AF8 
X-CRM114-Status: GOOD (  11.84  )
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

Enable clock controller, interconnect and pinctrl for Qualcomm
QCS8300 platform to boot QCS8300 RIDE board to UART console.

The serial engine depends on gcc, interconnect and pinctrl. Since
the serial console driver is only available as built-in, so these
configs needs be built-in for the UART device to probe and register
the console.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d13218d0c30f..3d9e48940c96 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -608,6 +608,7 @@ CONFIG_PINCTRL_MSM8996=y
 CONFIG_PINCTRL_MSM8998=y
 CONFIG_PINCTRL_QCM2290=y
 CONFIG_PINCTRL_QCS404=y
+CONFIG_PINCTRL_QCS8300=y
 CONFIG_PINCTRL_QDF2XXX=y
 CONFIG_PINCTRL_QDU1000=y
 CONFIG_PINCTRL_SA8775P=y
@@ -1327,6 +1328,7 @@ CONFIG_MSM_MMCC_8998=m
 CONFIG_QCM_GCC_2290=y
 CONFIG_QCM_DISPCC_2290=m
 CONFIG_QCS_GCC_404=y
+CONFIG_QCS_GCC_8300=y
 CONFIG_SC_CAMCC_7280=m
 CONFIG_QDU_GCC_1000=y
 CONFIG_SC_CAMCC_8280XP=m
@@ -1634,6 +1636,7 @@ CONFIG_INTERCONNECT_QCOM_MSM8996=y
 CONFIG_INTERCONNECT_QCOM_OSM_L3=m
 CONFIG_INTERCONNECT_QCOM_QCM2290=y
 CONFIG_INTERCONNECT_QCOM_QCS404=m
+CONFIG_INTERCONNECT_QCOM_QCS8300=y
 CONFIG_INTERCONNECT_QCOM_QDU1000=y
 CONFIG_INTERCONNECT_QCOM_SA8775P=y
 CONFIG_INTERCONNECT_QCOM_SC7180=y

-- 
2.25.1


