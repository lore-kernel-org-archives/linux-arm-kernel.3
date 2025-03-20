Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C34C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 05:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jltmC+5S8tP5VPksVdaHGC5AUJ0IOzcb691QfMXchVc=; b=o5rUkxKW4cmgECjZnjRq6KKa7b
	zlF4Ug1yYY9YESrXcr55ANY/d3Fom5ATAw2Doc9CVLW4X36AMYKDE4ulLe8/iPVzo0z68cZOr6zji
	XUdRJ35lE6JIE8kqA0qwPNGz24/rOo+eCI/zdmujFlA/bVxdl6D3+bj4LchsUNk5MyjgXAw6Erkoz
	OA5ZP2PshpKY05wtIU3cnpHgD3flFF8FU4agsM/0ITy395V0iU1DP9pu2wtyTUFs+bWD7Pb8HYfNm
	j6wmpRyTGaNvWdR0A6JFJ9FJubP6kxgmfV87TLMWmKMZCcf4sJmsmuy8vOLuIsEyjIe9nyUXLrnFJ
	A/jKHfxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv8vh-0000000BGkn-1Uso;
	Thu, 20 Mar 2025 05:58:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv8sE-0000000BGHP-3iZ2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 05:55:24 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52JKFall013765;
	Thu, 20 Mar 2025 05:55:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jltmC+5S8tP
	5VPksVdaHGC5AUJ0IOzcb691QfMXchVc=; b=aZVU9P25B9UMawEMyMiIhNxU0WN
	egMwJuzjMCd6oqCfNMD/nbsCq992WYQ0LEVlfJIlRMFWvekwRhjWn9uoYApQ2pFn
	4E23O9mTGMZvpwfA41QrXwAE1/IZqKif3ugubIWLDkalSg6Vuy5mt5cYXp5wRiXT
	R9OxJhYoPrvGmGjSnZaAgdOnu20e81HTZf8OkNH6dAVsyzYxbUMyYVR8wA0Ydf34
	GkpD/4iiPPIKEz88UrHRsQvY03qmQN4hcp24M03zQ7QCBdsu7Sr+5I7yCMHrsOoJ
	XnOf96lM3ukgUCfpaGshuKtJdV1y7i68AX77MpIWxkG5bsvKzGNsfLyVraw==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45g4t414ea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 05:55:10 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 52K5t8HU014352;
	Thu, 20 Mar 2025 05:55:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 45dk529f4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 05:55:08 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52K5t8ta014233;
	Thu, 20 Mar 2025 05:55:08 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 52K5t7gj014058
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 05:55:08 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id AB95C40BF4; Thu, 20 Mar 2025 13:55:06 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, will@kernel.org, quic_qianyu@quicinc.com,
        sfr@canb.auug.org.au, linux-arm-kernel@lists.infradead.org
Cc: quic_wenbyao@quicinc.com
Subject: [PATCH v1 1/3] arm64: defconfig: enable PCI Power Control for PCIe3
Date: Thu, 20 Mar 2025 13:55:00 +0800
Message-Id: <20250320055502.274849-2-quic_wenbyao@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250320055502.274849-1-quic_wenbyao@quicinc.com>
References: <20250320055502.274849-1-quic_wenbyao@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=HMPDFptv c=1 sm=1 tr=0 ts=67dbadbe cx=c_pps a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=8J9pHfFvgnT8GwhQ4KkA:9 a=yqDflvYcuAT_gElW2OLv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: bk8VECaIQ6SlL6RWqqhmOHBW6cRNrSIQ
X-Proofpoint-ORIG-GUID: bk8VECaIQ6SlL6RWqqhmOHBW6cRNrSIQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_01,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 mlxscore=0 clxscore=1011 bulkscore=0 impostorscore=0
 mlxlogscore=769 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503200035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_225522_932272_C3110508 
X-CRM114-Status: GOOD (  11.18  )
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
rails of the x8 PCI slots on the X1E80100 - QCP can be correctly turned
on/off if they are described under PCIe port device tree node.

Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
Signed-off-by: Wenbin Yao <quic_wenbyao@quicinc.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 85ec2fba1..de86d1121 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -245,6 +245,7 @@ CONFIG_PCIE_LAYERSCAPE_GEN4=y
 CONFIG_PCI_ENDPOINT=y
 CONFIG_PCI_ENDPOINT_CONFIGFS=y
 CONFIG_PCI_EPF_TEST=m
+CONFIG_PCI_PWRCTL_SLOT=y
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_FW_LOADER_USER_HELPER=y
-- 
2.34.1


