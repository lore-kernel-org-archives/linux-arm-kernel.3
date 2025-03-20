Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68EF6C36002
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 05:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=98ppjxfWNpFbfctkdmOJ5sGhNIkR0/DgBglVJBiMLt0=; b=XsbcuINWNgcbQFb8wLZg9zB9yy
	Yirkoh/EE1Z6du4zgI8ObLUuEACXpZlnx/5bMmDKrcMa+rZYREq4rvKllLRZqwLmXqcjvWPz1QBBb
	FAAvNoJzqVca5cPzb+aFYz4Rg56aaUPbaJSnWq2wZ2RnrJtYOPZMwd1LA8Mtszaq7SZQ6kfSWQCYO
	xvbS0a1BSMT2TZoTw4UKv1hZ4J68bOMif1wWXiAbyVO1WFFnX3H4fB/tls4r5IQGmOsJVrXDAxmjM
	y3Ipidygm0I3ivXWWO+0620RiVyLsxwBA7/GyYjFGkLK0RS912cZLDAbegdGnqEaUUM/FDJ+85hen
	fBt4ZAZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv8tz-0000000BGVz-2rxR;
	Thu, 20 Mar 2025 05:57:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv8sE-0000000BGHO-3iV6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 05:55:24 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K43L97019418;
	Thu, 20 Mar 2025 05:55:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=98ppjxfWNpFbfctkdmOJ5sGhNIkR0/DgBgl
	VJBiMLt0=; b=WKeSPZHR1xGv47g0LL0r84Fd8u2dNESx1lKBQaon09v2Xeotv4R
	E2Pbue4IkMpDG5MmI4HyyUVdApHJDopxJ2O+iySJbCiqe3LDG91Ab1FPITSrXX7N
	J3cduPOtjvM3mjZZs7Km0rfyp5wp+8CyBTbULqCBb46BqralFxer+z72SvrxXCJO
	TEvGhikt75Tmac5nTqBSjqMpg+DsAu0sVWAEjh/IYLdjvhqBvsLY2F3UyStlB3b0
	ko0Zam6MsiGFMe47LpYmlTUCZ2DTF6pFVe7m9KFx91TEvrBkiE0nR44gzhgoqHAf
	IrY9DsPNKUDJC+ODY5LOJUx2XrIHY5WyCiw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45gbngg6r9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 05:55:10 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 52K5t844001137;
	Thu, 20 Mar 2025 05:55:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 45dk9w97c1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 05:55:08 +0000
Received: from APTAIPPMTA02.qualcomm.com (APTAIPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52K5t8oR001130;
	Thu, 20 Mar 2025 05:55:08 GMT
Received: from cbsp-sh-gv.ap.qualcomm.com (CBSP-SH-gv.ap.qualcomm.com [10.231.249.68])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 52K5t7OA001129
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 05:55:08 +0000
Received: by cbsp-sh-gv.ap.qualcomm.com (Postfix, from userid 4635958)
	id A686340BF8; Thu, 20 Mar 2025 13:55:03 +0800 (CST)
From: Wenbin Yao <quic_wenbyao@quicinc.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        catalin.marinas@arm.com, will@kernel.org, quic_qianyu@quicinc.com,
        sfr@canb.auug.org.au, linux-arm-kernel@lists.infradead.org
Cc: quic_wenbyao@quicinc.com
Subject: [PATCH v1 0/3] arm64: qcom: x1e80100-qcp: Add power supply and sideband signals config for PCIe3
Date: Thu, 20 Mar 2025 13:54:59 +0800
Message-Id: <20250320055502.274849-1-quic_wenbyao@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iK5GldEBxZYqyFOTGGLzZadHVGdOCQRo
X-Authority-Analysis: v=2.4 cv=MJ5gmNZl c=1 sm=1 tr=0 ts=67dbadbe cx=c_pps a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=Vs1iUdzkB0EA:10 a=oy1NtThjofowiJkyXhQA:9
X-Proofpoint-ORIG-GUID: iK5GldEBxZYqyFOTGGLzZadHVGdOCQRo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_01,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=702 clxscore=1011
 spamscore=0 priorityscore=1501 mlxscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_225522_933933_71D17EDB 
X-CRM114-Status: UNSURE (   9.85  )
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

The first patch enable the PCI Power Control driver to control the power
state of PCI slots. The second patch add the bus topology of PCIe domain 3
on x1e80100 platform. The third patch add perst, wake and clkreq sideband
signals, and describe the regulators powering the rails of the PCI slots in
the devicetree for PCIe3 controller and PHY device.

Qiang Yu (3):
  arm64: defconfig: enable PCI Power Control for PCIe3
  arm64: dts: qcom: x1e80100: add bus topology for PCIe domain 3
  arm64: dts: qcom: x1e80100-qcp: Add power control and sideband signals
    for PCIe3

 arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 119 ++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/x1e80100.dtsi    |  10 ++
 arch/arm64/configs/defconfig              |   1 +
 3 files changed, 130 insertions(+)


base-commit: 0a2f889128969dab41861b6e40111aa03dc57014
-- 
2.34.1


