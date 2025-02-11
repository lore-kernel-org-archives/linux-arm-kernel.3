Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3D8C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 04:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rweMDKU7jILbWAEYKzmL8tnl3AeztWlseOhIln/HMIY=; b=f/V/EubLibHt+a
	3aTO/VQvhVMyI2i2dtzx0mQDgYJJFTRjJ8hP1JVJjEkH2qB8/ZZUKmeNMOo3UN3eu2/aqLPf3A4bx
	QzFdBjTTfMKnE/GurnQCpwOunv8ljU33fWv5dp7yemvnDF4ZhGJUwomp3CWF5jJHcCR7ewYEeQpcp
	C1SgnMNjH/D7pxSbhB4f4erueAeDNcriqFgFCuxYK2Xr15ji5CbNjAln+Wgt9BT6fPISjEzQHZDyR
	xvnqv5HULmwyo0rD+3bv9TKVS2e6OcePjxzcg/PNmXf+cZYRsxDYXJJu7ENq4n+7pR2PiF32ygPoA
	WSy1Lyqfx6Q/MvFtl8/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thiBf-00000002WQb-16wp;
	Tue, 11 Feb 2025 04:47:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thiAG-00000002WBX-05jl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 04:46:29 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AKKLpG002481;
	Tue, 11 Feb 2025 04:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rweMDKU7jILbWAEYKzmL8t
	nl3AeztWlseOhIln/HMIY=; b=eUn+bCH5rH7ClEElyqdzELkI7+r9wA/SSdCDgd
	feVTdg5rVSMcd55jFJ0IulM3hiZ12oFfbj58WzbNDemQUMywq/yXleWG1T1HDsUj
	5LqTI6Hb8LIjis4771NMG5dwqxm9KSgd1dzRCLiRnmQCygIEmyutb3/bv++Qog5Z
	g8yHjOGcrJbM1ptzWxOCCJTYPrkAPQP6CfbjeDvql/cQQwZh/ErK+RdkRvUqlL3g
	yhsaKJ7eu+EVz6GsAyKuMPp6zU6Dj2tp2cbPgRql1RlbyCIZbNp3Qps5af1UADJi
	peTH0BoTZtPBtg5CslsaqUkiL8HUu0Ms/UG6pgV81CdAr/Gw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dqentu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 04:46:18 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51B4kIir027512
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 04:46:18 GMT
Received: from hu-pbrahma-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 10 Feb 2025 20:46:14 -0800
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
Subject: [PATCH v5 0/2] Add support for GPU SMMU on QCS8300
Date: Tue, 11 Feb 2025 10:15:52 +0530
Message-ID: <20250211-b4-branch-gfx-smmu-v5-0-ff0bcb6a3c51@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAADWqmcC/22Nyw6DIBREf8XcdW+DgPSx6n80LpCC3IVooRobw
 7+X2m2T2ZxJ5swGyUayCa7VBtEulGgMBZpDBcbr0FukR2HgjDesFjV2Eruog/HYuxXTMMzYMcF
 VfVGCKQllOEXraN2l97awp/Qa43v/WOS3/ek4E/90i0SGVutTieJOnm/PmQwFczTjAG3O+QNn4
 tHOtgAAAA==
X-Change-ID: 20250131-b4-branch-gfx-smmu-b03261963064
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg
 Roedel" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Pratyush Brahma <quic_pbrahma@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739249174; l=2091;
 i=quic_pbrahma@quicinc.com; s=20250113; h=from:subject:message-id;
 bh=McOZt8EMFCYaBYql7fipCYligaaQW+bEOpaqsbXqnjg=;
 b=ueb+q6Ysrxv/DCpBNWDdVRsGrNMhzSvM0V5LKPqZKAWZoBWXj8Uv5bjzoOQARTT93xShN5lPX
 qC8ao66917NAV68qi4oAhRc6p2LMVbe7o3I2xEhn7Sx3Te02jzwYIfC
X-Developer-Key: i=quic_pbrahma@quicinc.com; a=ed25519;
 pk=YvfZKC4rRO1Fot+wlXZqsoQWnAtLqrpMyEzslw3Ji+M=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rtXo1t1Nyw0bIEMNcaL8cpqxdvesyucX
X-Proofpoint-ORIG-GUID: rtXo1t1Nyw0bIEMNcaL8cpqxdvesyucX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_02,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1011 priorityscore=1501 bulkscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502110026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_204628_087130_67BBF55D 
X-CRM114-Status: GOOD (  14.14  )
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

Enable GPU SMMU function on QCS8300 platform. GPU SMMU is required
for address translation in GPU device.

Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
---
Changes since v4:
- Corrected the clocks list to be inline with clock-names
- Removed stray whitespaces
- Added r-by tag from Krzysztof on the bindings patch
- Link to v4: https://lore.kernel.org/r/20250203-b4-branch-gfx-smmu-v4-0-eaa7aa762f48@quicinc.com

Changes since v3:
- Modified the order of clock voting and properties as suggested by Konrad
- Removed dependency on clocks in commit text as change is merged in
  linux-next before current base commit

Link to v3:
https://lore.kernel.org/all/20241227105818.28516-1-quic_pbrahma@quicinc.com/

Changes since v2:
Corrected typo in cover letter to include QCS8300
Link to
v2:https://lore.kernel.org/all/20241227104651.4531-1-quic_pbrahma@quicinc.com/

Changes since v1:
Updated bindings for gpu smmu for qcs8300 as per Dmitry's comment
Link to v1:
https://lore.kernel.org/all/20241224100521.7616-1-quic_pbrahma@quicinc.com/

To: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
To: Joerg Roedel <joro@8bytes.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: iommu@lists.linux.dev
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org

---
Pratyush Brahma (2):
      dt-bindings: arm-smmu: Document QCS8300 GPU SMMU
      arm64: dts: qcom: qcs8300: Add device node for  gfx_smmu

 .../devicetree/bindings/iommu/arm,smmu.yaml        |  3 +-
 arch/arm64/boot/dts/qcom/qcs8300.dtsi              | 39 ++++++++++++++++++++++
 2 files changed, 41 insertions(+), 1 deletion(-)
---
base-commit: a13f6e0f405ed0d3bcfd37c692c7d7fa3c052154
change-id: 20250131-b4-branch-gfx-smmu-b03261963064

Best regards,
-- 
Pratyush Brahma <quic_pbrahma@quicinc.com>


