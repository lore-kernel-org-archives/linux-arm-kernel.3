Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93F06C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 05:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LTeD8XjA5sDc2PaAhEZRnCJ2P2kHoKkZGlImDRo/ri8=; b=E6jtss+tQrKoOOgHedeqcHWop1
	AQelxgonR/0fOP+YEATFOffczLofxSBA69fSgYHnhPTd0gxJKoGrLv52ga66LC+UkLvx3skswAm20
	GBeZ/9MxMoUYtZqB21Zzt1loDEROvP67LhMLY4F/LGDdhohowJHeIhJyM2dB/0JscnjlduHUbds21
	Q/okRdtxVqQfzU5yU8CtjgB9jCrV7dmCp5oe8uXxRL69OR4XNZ++gtVlbioBZatynqIDfCSkMZ+J4
	u54hOD8LnF+rvlSJrWPuymI0EoeRI45ZbnFKKSSu98MMycI1gLqSyPkAl6dHMOFnXRtrZlhyVOaw1
	7H9NpQzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um4EF-0000000Cfv7-31T0;
	Wed, 13 Aug 2025 05:40:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um4Bg-0000000CfUL-2hYU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 05:38:14 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57D3nrDe021451;
	Wed, 13 Aug 2025 05:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LTeD8XjA5sDc2PaAhEZRnC
	J2P2kHoKkZGlImDRo/ri8=; b=C+yn+i19hGSoH98BotgmaidXSNR0sGK387FIdK
	ZhSDyry7ienDPUtWpPJEt6WKVxXht3CAkp1C1aqVo4wv8Nfm1Ypxk0GdeIlL7d7q
	6+G2CoaWDOJYEztwXgRhrBiYtFM1/uqMUh7SUFwHkM8RnLMdhsaOgyuZpUI17ni8
	1rqFDw51uXZifPQDS8/4EDxworEI93judLrlpcoP5Dl8i6EU1xAhA/kKPSdkBhxl
	KEd1/P1/FaoNb/NwvXJHY4r6fhXQNdp4b/Hc5Ju7prySZebe6rH5xqa3YnjOgNWY
	YChwO48fHTeJ1D/mVnaKvcG12Gt7OOGFt0pPG+3CRlbPMA7g==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxdv2hj9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 05:38:02 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 57D5c2XA028798
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Aug 2025 05:38:02 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 12 Aug 2025 22:37:56 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/7] qcom: qcs8300: Add qcs8300 camss support
Date: Wed, 13 Aug 2025 11:07:17 +0530
Message-ID: <20250813053724.232494-1-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689c24bb cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=cI1YGEVR75NLnxNL1NcA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: CLZnXJoJvOmKlPvtAgUAzbE1_7odMk0y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfXyo6/oHbMxAkD
 q/qOYQnGpmer8uRpCrwrjtrBcMHqgOEFopvH9YMd/j2WJ66vOKcKIOz8buz0JBWu1dy+YZUkAoT
 XBguEQBawdPwaHNdmw0ZI8JtAE4S9qnQodjULQo4eAxo8Tr9MbSktAOHFzz6Pm5Wh0C+jtPyXgS
 MbQWjH2/YFlcP3WM5ZC1NtTw5rkjWrahBIQbmbHpYtrtJovFFSKoEX/NeSmwRnv5e82C1R2asXK
 huX3fN5iGaVdhvRaT9X3c8ZJrnSgBlA8NqRMFsM9fQLMvH3sAtGaIA1yZtgYJdEQUujUzaPHRFq
 AejWqgZ6Se2gGcSzjZOD/fR3blMQwslX10K+2CndmB5WBiobOXOblGRhYi33e0PqvPoA5JacqGj
 mBmzYU3C
X-Proofpoint-GUID: CLZnXJoJvOmKlPvtAgUAzbE1_7odMk0y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_08,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_223812_806418_51BF818F 
X-CRM114-Status: GOOD (  17.53  )
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

From: Vikram Sharma <vikramsa@qti.qualcomm.com>

QCS8300 is a Qualcomm SoC. This series adds bindings and devicetree
and driver changes to bring up CSIPHY, TPG, CSID, VFE/RDI interfaces
in QCS8300.

QCS8300 provides
- 2 x VFE, 3 RDI per VFE
- 5 x VFE Lite, 6 RDI per VFE
- 2 x CSID
- 5 x CSID Lite
- 3 x TPG
- 3 x CSIPHY

Changes in v3 compared to v2:
- Bindings and Device Tree: Reordered csid_wrapper to appear first in the
  register list (as suggested by Bryan).
- CSIPHY Driver: Updated the commit message for the CSIPHY patch.
- VFE/CSID Resource Data: Reused the same resource data as sa8775p for VFE
  and CSID.
- Patch Series Order: Rearranged the patch sequence and moved the DTSI
  update to the final patch in the series.
- Code Cleanup: Removed duplicate data structures and reused existing
  ones.
- Optimization: Simplified and optimized conditional checks.
- Link to v2:
  https://lore.kernel.org/linux-arm-msm/20250711131134.215382-1-quic_vikramsa@quicinc.com/

Changes compared to v1:
- Changed the order for register entries in bindings - Krzysztof
- Changed the naming for interrupts for consistency - Krzysztof
- Combined separate series for driver and dtsi into one.
- Rebased on top of latest version of sa8775p camss patches.
- Link to v1:
  Driver: https://lore.kernel.org/all/20250214095611.2498950-1-quic_vikramsa@quicinc.com
  DTSI: https://lore.kernel.org/all/20250214094747.2483058-1-quic_vikramsa@quicinc.com  

Dependencies:
https://lore.kernel.org/linux-arm-msm/20250807121105.710072-1-quic_vikramsa@quicinc.com/

We have tested this on qcs8300-ride board with 'Test Pattern Generator'
https://lore.kernel.org/all/20250717-qcs8300_tpg-v2-1-0946c69c2c8b@quicinc.com/

A rebased version of the TPG driver, built on top of this series, will be
shared in a follow-up post.

Used following tools for the sanity check of these changes.
- make CHECK_DTBS=y W=1 DT_SCHEMA_FILES=media/qcom,qcs8300-camss.yaml
  qcom/qcs8300-ride.dtb
- make DT_CHECKER_FLAGS=-m W=1 DT_SCHEMA_FILES=media/qcom,qcs8300-camss.yaml
  dt_binding_check
- Smatch: make CHECK="smatch --full-path" M=drivers/media/platform/qcom/camss/
- Sparse: make C=2 M=drivers/media/platform/qcom/camss/
- make -j32 W=1
- checkpatch.pl

Vikram Sharma (7):
  media: dt-bindings: Add qcom,qcs8300-camss compatible
  media: qcom: camss: Add qcs8300 compatible
  media: qcom: camss: Add CSIPHY support for QCS8300
  media: qcom: camss: enable csid 690 for qcs8300
  media: qcom: camss: enable vfe 690 for qcs8300
  media: qcom: camss: Enumerate resources for QCS8300
  arm64: dts: qcom: qcs8300: Add support for camss

 .../bindings/media/qcom,qcs8300-camss.yaml    | 336 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 171 +++++++++
 .../platform/qcom/camss/camss-csid-gen3.c     |   3 +-
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |   2 +
 .../platform/qcom/camss/camss-vfe-gen3.c      |   3 +-
 drivers/media/platform/qcom/camss/camss-vfe.c |   2 +
 drivers/media/platform/qcom/camss/camss.c     |  85 +++++
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 8 files changed, 601 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,qcs8300-camss.yaml

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
-- 
2.25.1


