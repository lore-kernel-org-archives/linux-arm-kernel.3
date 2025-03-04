Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1012C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 22:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1Z3XcJjb5+vCVlKHuCLcWjoudOFW37p8+HdZ8IfVIOY=; b=0PWCODmx06NjIRh5qaeiEHPkh0
	98wPITNq8h2EpaTj2BNSrOPsDzPXxM2oreaL6Amnd7GLbQcqPs83WK5n8fpjKE9thwHTPzZOog9UH
	/bXWzBSVQkkrXkSGDl6NRgo0nXnspk9g/sRj5VaJj3/sX4VnSCvjn0Tycn0nKn9RDM8vsfem3MKN9
	osVVtFXRj/jTyvzkCxm7DCjkyEAE4PBeEohE3dOSPcQ6ovNooMWpOU8F8bsOqTBMoMIlqrCnbS9Df
	sZX0T6W3G5dypSr9LQ9/XLtvHytkCjODSBlAgM+5mR1ZgYEv3zxeLcxwqdxbCCOF6ZZvVHv68LS4Z
	7Sg1lM/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpaWV-00000006NhZ-0KXX;
	Tue, 04 Mar 2025 22:13:59 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpaH0-00000006LkD-35j8;
	Tue, 04 Mar 2025 21:57:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=CC:To:In-Reply-To:References:Message-ID
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=1Z3XcJjb5+vCVlKHuCLcWjoudOFW37p8+HdZ8IfVIOY=; b=lGWggmC5k1JOVVHgiaNHIByrqq
	zsOW8Wp+34wKHtHgPgKYUmow0tK/qKcAA0vmtR4GXy3ylWAyWRRn4B8C1lGHMqD/7jPZwHhkO3jtd
	ktDljoFRj281pptynwkuF4bN6Pa3+y3NoqBBZsW23y/BYFZh8DWuhOCMHu6WKFPF78jlhKnRqXbum
	DDwgNuxlEkCIxt23gZOIXGXWG4YExrLmYuVX3YrjHWSnwsW0esrFWWL3I/aZkNNUp4Hw/R6V0gVrv
	Jj5HK3yZ0A1aIFa9jxPEFHxQIVJmUtbFuhgbcfSnaAwGFZlawL6iGj9U1PA5DHkGt1Y2lAVXEv3er
	262mgYNA==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpaGv-00000004ApS-1hpY;
	Tue, 04 Mar 2025 21:57:57 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 524AUmSo015598;
	Tue, 4 Mar 2025 21:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1Z3XcJjb5+vCVlKHuCLcWjoudOFW37p8+HdZ8IfVIOY=; b=NEBXkY4nB0jj1h5C
	Artd2DAlZQGn542J7qPJZnlw4Mxh9gdJe9vS0bRVx8m+vl6vKcIZ2ON8pSKWGdNI
	7MN/pbxZvbljBabjIed5Rwby3TEDxvpriVx8Rq15ZtSw9LTHcw7BjJfDy1hAr32w
	8bZl8SAbEaV1u79XdpDSt4fuqSxvaQKSkloWRscwVq1lv4vYZkCbUcpWHLEFGHlU
	zXVCLliQhnc7Lyu5kffTO+RQ5+gVhr6pykPyp3freXrdrvvtuJhcmu8qDSmYIaEx
	KW7FJhdtyKVkTHrpBGv/3Dq7Ir6lFdb9gK1u78dZ9JBMNiF94Hj3TawmD7V35uGl
	kxQhRA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6v392v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 21:57:40 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 524LvdtS002947
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Mar 2025 21:57:39 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 4 Mar 2025 13:57:38 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Tue, 4 Mar 2025 13:56:38 -0800
Subject: [PATCH v2 5/9] phy: qcom: Update description for QCOM based eUSB2
 repeater
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250304-sm8750_usb_master-v2-5-a698a2e68e06@quicinc.com>
References: <20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com>
In-Reply-To: <20250304-sm8750_usb_master-v2-0-a698a2e68e06@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        "Melody
 Olvera" <quic_molvera@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741125455; l=1304;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=rG2hIvkvCmr9w0Z3u/Gq/i+ml+btiB0aeOWncDnPVwM=;
 b=C9KpiexEKeRmPWdl2+pqRSNM+eGF/jpIPx+jpuSQj+CSPFV6kEcR4lfkUC4pm6X9BR9Xkruyk
 KvU50oxzaALBP9faPEgmIzvRm2VprbPoQY0O+Ts5KQPQATudZ5CJ/YB
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2RC0TcdXfmvMmNpFnTA25P8bV3HyAuBb
X-Proofpoint-ORIG-GUID: 2RC0TcdXfmvMmNpFnTA25P8bV3HyAuBb
X-Authority-Analysis: v=2.4 cv=fatXy1QF c=1 sm=1 tr=0 ts=67c77759 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=peiAtfwJOusvP27HVpEA:9 a=QEXdDO2ut3YA:10
 a=T1PIRxOFuHhLvSGs3xkl:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_09,2025-03-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=824 mlxscore=0 adultscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_215753_663734_62808FE4 
X-CRM114-Status: GOOD (  12.42  )
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

From: Wesley Cheng <quic_wcheng@quicinc.com>

The eUSB2 repeater that exists in the QCOM PMICs are utilized for several
different eUSB2 PHY vendors, such as M31 or Synopsys.  Hence, the wording
needs to be updated to remove associations to a specific vendor.

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 drivers/phy/qualcomm/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/phy/qualcomm/Kconfig b/drivers/phy/qualcomm/Kconfig
index 846f8c99547fd5132feaa1e41093b8eab51714f9..f281e3b7f3f20b4a4bb1602be94b8a1b041a876f 100644
--- a/drivers/phy/qualcomm/Kconfig
+++ b/drivers/phy/qualcomm/Kconfig
@@ -135,12 +135,12 @@ config PHY_QCOM_SNPS_EUSB2
 	  on Qualcomm SOCs.
 
 config PHY_QCOM_EUSB2_REPEATER
-	tristate "Qualcomm SNPS eUSB2 Repeater Driver"
+	tristate "Qualcomm PMIC eUSB2 Repeater Driver"
 	depends on OF && (ARCH_QCOM || COMPILE_TEST)
 	select GENERIC_PHY
 	help
-	  Enable support for the USB high-speed SNPS eUSB2 repeater on Qualcomm
-	  PMICs. The repeater is paired with a Synopsys eUSB2 Phy
+	  Enable support for the USB high-speed eUSB2 repeater on Qualcomm
+	  PMICs. The repeater can be paired with a Synopsys or M31 eUSB2 Phy
 	  on Qualcomm SOCs.
 
 config PHY_QCOM_M31_USB

-- 
2.46.1


