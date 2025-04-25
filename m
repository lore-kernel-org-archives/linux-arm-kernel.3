Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C76B0C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 10:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8R5L9aakpm2jVBnWr557mhK6/T+rfwUGBzGcgDrYr4=; b=1dtO04lYVx/3Kom6b7Uho1skAy
	NX1ni+8hx/DOguXWd+87ILe7Mg6tgNRuiRQwk2Syqt9w6sftZJP4pO5vX5b7FDcvvhI5SAiCFkMM5
	2Cs/Jhh+7ShdOCT4jHqcX0qGPgTQHLsJeNnkaVMO3mgHx0v7J5Sgr4vzVpTIeoYy2nhhN9wrw36U6
	t+pP/lNKUhuBwcjvtf6mAB/8jiUElRXQmVTBtpp91E3wlq/4/sJvkaxmEEHUe2D9b327XlKGgGhui
	w/vlbfGK8SOsZ2KuJvGvtdtKY6ToaTDl5V0Vo9aFa9DYpsDl7qi0ROUF4wN/6j1atvyy8dvCTl2rs
	oyODmc+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8GB5-0000000Gi7v-0yqo;
	Fri, 25 Apr 2025 10:21:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8FNp-0000000GXsA-2GBe
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 09:30:10 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8TN7a015932;
	Fri, 25 Apr 2025 09:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F8R5L9aakpm
	2jVBnWr557mhK6/T+rfwUGBzGcgDrYr4=; b=Cn3OYWLbzlZq3yU8ptl3DCFO8fN
	apv9OdPBoLz6629U4ojzPbrNDuxXyHXGUKv1X25AdURWavEnjdGlFfiJbFVqAU6X
	plz3vZSnhydeg+xWCvXu1MKzsRME+xuyT0aFUkrKB4Db5za2yhZMIqmqRT5V3uQD
	1Q3EfZYgijFKOmxemhtRmvI971M7BkEhVk/l/eFl34RRXlQhzUjdmC6xF0V6LbRH
	8GxBACX5o87KulvCPtKFSSxmUPJI2PnGYm66A8pM+aV6P+/L5ERrOAiElWeIUDlW
	zvkUTje14+sJRKw8cSBpDWreBQu4q+ReEs0dFrqTmk4oF8hhpgcqjpTARnw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3gg5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 09:30:03 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 53P9U1VL022154;
	Fri, 25 Apr 2025 09:30:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4644wnf738-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 09:30:01 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 53P9U13R022151;
	Fri, 25 Apr 2025 09:30:01 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 53P9U1gv022143
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 25 Apr 2025 09:30:01 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id 1D44340D6C; Fri, 25 Apr 2025 17:30:00 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: krishna.chundru@oss.qualcomm.com, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com, quic_cang@quicinc.com, quic_qianyu@quicinc.com,
        quic_wenbyao@quicinc.com
Subject: [PATCH v2 1/4] arm64: Kconfig: enable PCI Power Control Slot driver for QCOM
Date: Fri, 25 Apr 2025 17:29:52 +0800
Message-Id: <20250425092955.4099677-2-quic_wenbyao@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
References: <20250425092955.4099677-1-quic_wenbyao@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDA2OCBTYWx0ZWRfXwxM3kTIXWh/C pZ8bDy+xaFkp8PyRnnJRULeL2URuXLLm1KnBd3F2MGL4lzBnleJRwBaU532LpDk2TLmpOaih2cL sb7pOitoG586881A0TIblmjPScpsZEId+O1QnyyF7RAsKg6TYupwxxjQojol9Mq2axzcdmBzN9H
 LhpM9j21DdJRPQjWhuh5XW+edydyWBa413u55fzLUGrarxSC417jv1ug/Tor67k1G4tg1hLUizE yZ+Z45h03iHNXKctG6MQbArmTwwytUA1QhFgh5bmxtroFc3up+eImWgX3agFhgiFxeQWdxqZn1d JIO/iR4+90JiPzc+F8j0jtFrzXnDU+rMEhS+aXFZMVkg1xcV2qKLXr+IaYeW9sRIpcpuYARkskX
 bfNKze3iIGLQyEJ+7nb65tRQ+/5vHy3bdmHV3Uj29cWJKoyqoGnVoO6Kp8V7NfDRZ0xTEfyJ
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=680b561b cx=c_pps a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=8J9pHfFvgnT8GwhQ4KkA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: B6VPWns6vBRazbkQyXJZmCekCoKGNGIK
X-Proofpoint-GUID: B6VPWns6vBRazbkQyXJZmCekCoKGNGIK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=798 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_023009_580243_65836DF5 
X-CRM114-Status: GOOD (  11.21  )
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

From: Qiang Yu <quic_qianyu@quicinc.com>

Enable the pwrctrl driver, which is utilized to manage the power supplies
of the devices connected to the PCI slots. This ensures that the voltage
rails of the standard PCI slots on some platforms eg. X1E80100-QCP can be
correctly turned on/off if they are described under PCIe port device tree
node.

Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
---
 arch/arm64/Kconfig.platforms | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 8b76821f1..14d2742c8 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -270,6 +270,7 @@ config ARCH_QCOM
 	select GPIOLIB
 	select PINCTRL
 	select HAVE_PWRCTL if PCI
+	select PCI_PWRCTL_SLOT if PCI
 	help
 	  This enables support for the ARMv8 based Qualcomm chipsets.
 
-- 
2.34.1


