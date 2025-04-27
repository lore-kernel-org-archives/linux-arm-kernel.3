Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18158C369D8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Apr 2025 07:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+MAEcSEhI4YhkGLSQlz6TyWqjuuATG51QHsdhzGFtUk=; b=EpoxB4LDWYZJ/CzlGvN9qTGeSc
	SoU5In4pukk5XoL9OQb5etAgMS3EEGzQvOncnh8v74+jiJ8ZdgT+LEEs7tX4qfz9QQO9NlNnHtlk9
	TdzISbcbY8uK1dmDU3mTJ5UYNhzas7WDThLpuSjPVi9akpt9p47VRhomcF1DmJOpN/TD/CZblxgWY
	VqnOa9W5QTvg5KKLY9JYop976wceyqE2zNJHB6MAAeJ6ZwpsHDQsF7LNURfXWVjZTugMhZQnvZylr
	0tE1erdFRwPtVw28FJEJMCIwTZpvsti4cSO1hj8afpBxVbgEvU47hjZ+5iRKvK4TbvroyWuVsMrW6
	nLz7Pgpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8w90-000000034lo-1Ler;
	Sun, 27 Apr 2025 07:09:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8w2D-00000003413-34nQ
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 27 Apr 2025 07:02:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=+MAEcSEhI4YhkGLSQlz6TyWqjuuATG51QHsdhzGFtUk=; b=GSRWDlmESokHEDC6A8pibhglNh
	5tN6x2kyJ90N5FhFGUVolnMn7Jzea0ODydJ5eVFLv+ljSrgahWnaBI+SbTXvB8JlNLS5WuVLUAXTn
	F//GuSuEj820KjBwTKanKrbEiFo0a6GRbl00fknwfiERs5veXAkUnvZXagO5yj8FCaDHLsU+Le8Ji
	Guuw2Q8O70/WHGKoFo1BrNFbO0hYoQz3O8UBQjvzFLNfsQjyfzXIYTG4ZZ2I6XwUgbs5fggMYWCxm
	UKCKyKTrfqT7mx18Rm44HfjBxpeJF3L5kqUogP2k4F6GmzIHj2IR/rEgFI/FoVhnKU9CKn1+RdVHA
	yhtDU5FA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u8w26-0000000CQ2j-0ppt
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Apr 2025 07:02:40 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53QGM3pA012252;
	Sun, 27 Apr 2025 07:02:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=+MAEcSEhI4YhkGLSQlz6Ty
	WqjuuATG51QHsdhzGFtUk=; b=it74CA05hGNLRsSfc259A/n1+G9swQxYOq/WwY
	zYx7iZOZulQ0iCYlKKOChZRoN/2VKcNXUwg3iZtGPVMsYPmqUyIrQkmyp0840Gsx
	leTzyDmqqx+PQyru8w0rio8AaxC4fiwB06Z6yMo0IFbAMDL+oPLOKOAjRIe7GJQB
	5/YQ6pZDsoS25PgvkFiAwIDy9UVKzaNAq+j5/s6YO0DdvQ6irvEsm3N4SSEptcBp
	PvS3bnaKRbPo+ItuuolWDR9TGGlY2aXsUwSr/USPfM+TRLEqWOdVVJzfR04JTgDk
	ELwwr0UeR5vYluMd5fR3a1uSu4y8lo2Se4Gh10ZiyGSU02KQ==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468r8hk3x9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Apr 2025 07:02:09 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53R728xO008163
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 27 Apr 2025 07:02:08 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 27 Apr 2025 00:02:02 -0700
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
Subject: [PATCH v2 RFC/WIP 0/9] Add sa8775p camss support
Date: Sun, 27 Apr 2025 12:31:26 +0530
Message-ID: <20250427070135.884623-1-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nyMFdmJsIaxmS-DB1eDskt_ZBIEyb0RN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI3MDA1NSBTYWx0ZWRfX01OGbWF16R5m UJMsHHgf2bMrhq/BXNBjK/v/1ZNWpOkuwl22+JfJlovu/wSutKMz2RfuAP1qfhARzHQUYnuCi/m df3aO0Oj3TGPwTepOO4TrtEABWIImf8QhmXCsxC+3Pmr5GyOZN+Qp+iUS6f5fCrWdvmingJllRh
 oy4j67+nMHKy8TnjCqZUy6FbEtoRLYcLCCvrnnVeygM4SUhVSJcGDcYkI7HY8+cKrXLGyFnhLll lstbkoWqye0n1OQosb0B0l0PcR1RSXYAdaS0/fbFib5MKAwB9IOP7LK449dOnUInPFWiBMim6uU FjbjddBUYzNA+M5hhFqIMcNnqlz64fgio1IXXfjvnZK24uZdpXyUBJnhKuV/KkYwTWD9auPydMG
 JNMWqFHCT0Tpmk18t2dKymZEQ/TbgEkqwOPTuz2Qnv2rR6o8ZXFs/aZ9/or2rFmib57ZhEgw
X-Authority-Analysis: v=2.4 cv=cfzSrmDM c=1 sm=1 tr=0 ts=680dd671 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=4pAsuTqdjomlMBfRpP0A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: nyMFdmJsIaxmS-DB1eDskt_ZBIEyb0RN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-27_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504270055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_080234_811453_02309EE0 
X-CRM114-Status: GOOD (  15.00  )
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

Posting these changes as RFC/WIP because there is some renaming done for
existing files so that same files can be used for multiple vfe/csid
version.
 
SA8775P is a Qualcomm SoC. This series adds bindings and devicetree to bring
up CSIPHY, TPG, CSID, VFE/RDI interfaces in SA8775P.

SA8775P provides
- 2 x VFE, 3 RDI per VFE
- 5 x VFE Lite, 6 RDI per VFE
- 2 x CSID
- 5 x CSID Lite
- 3 x TPG
- 4 x CSIPHY
   
Changes compared to v1:
- Renaming camss-vfe-780.c to camss-vfe-gen2.c and camss-csid-780 to
  camss-csid-gen3 to avoid code duplication for SA8775P.SA877P have csid
  690 and vfe 690 which is almost same as csid/vfe 780 with very minor
  change in register bitfield.
- Restructure vfe and csid addition to reuse existing files.
- Updated cisd-lite and vfe-lite interuppt names.
- add enumeration changes as seprate patch. 
- Update required fileds in bindings.
- Link to v1:
  DT: https://lore.kernel.org/linux-arm-msm/20250210155605.575367-1-quic_vikramsa@quicinc.com/
  Driver: https://lore.kernel.org/linux-media/20250210162843.609337-1-quic_vikramsa@quicinc.com/

Sanity check for these patches:
- make CHECK_DTBS=y W=1 DT_SCHEMA_FILES=media/qcom,sa8775p-camss.yaml
- make DT_CHECKER_FLAGS=-m W=1
  DT_SCHEMA_FILES=media/qcom,sa8775p-camss.yaml dt_binding_check
- checkpatch.pl
- Smatch: make CHECK="smatch --full-path" M=drivers/media/platform/qcom/camss/
- Sparse: make C=2 M=drivers/media/platform/qcom/camss/
- make -j32 W=1

We have tested this on qcs9100-ride board with 'Test Pattern Generator'
TPG driver support will be posted in a follow up series.

Tested with following commands:
- media-ctl -d /dev/media0 --reset
- yavta --no-query -w '0x009f0903 0' /dev/v4l-subdev0
- media-ctl -d /dev/media0 -V '"msm_tpg0":0[fmt:SRGGB10/1920x1080
  field:none]'
- media-ctl -d /dev/media0 -V '"msm_csid0":0[fmt:SRGGB10/1920x1080
  field:none]'
- media-ctl -d /dev/media0 -V '"msm_vfe0_rdi0":0[fmt:SRGGB10/1920x1080
  field:none]'
- media-ctl -d /dev/media0 -l '"msm_tpg0":1->"msm_csid0":0[1]'
- media-ctl -d /dev/media0 -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
- yavta --no-query -w '0x009f0903 9' /dev/v4l-subdev0
- yavta -B capture-mplane -n 5 -f SRGGB10P -s 1920x1080 /dev/video0
  --capture=7

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>

Vikram Sharma (9):
  media: qcom: camss: add generic csid handling in csid gen3
  media: qcom: camss: add generic vfe handling in vfe gen3
  media: dt-bindings: Add qcom,sa8775p-camss
  arm64: dts: qcom: sa8775p: Add support for camss
  media: qcom: camss: Add sa8775p compatible
  media: qcom: camss: Add support for CSIPHY 690
  media: qcom: camss: Add support for CSID for sa8775p
  media: qcom: camss: Add support for VFE 690
  media: qcom: camss: Enumerate resources for SA8775P

 .../bindings/media/qcom,sa8775p-camss.yaml    | 352 +++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 187 +++++++
 drivers/media/platform/qcom/camss/Makefile    |   4 +-
 .../{camss-csid-780.c => camss-csid-gen3.c}   |  42 +-
 .../{camss-csid-780.h => camss-csid-gen3.h}   |   9 +-
 .../media/platform/qcom/camss/camss-csid.h    |   2 +-
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |  84 ++++
 .../media/platform/qcom/camss/camss-csiphy.c  |   5 +
 .../media/platform/qcom/camss/camss-csiphy.h  |   1 +
 .../{camss-vfe-780.c => camss-vfe-gen3.c}     |   9 +-
 drivers/media/platform/qcom/camss/camss-vfe.c |   5 +-
 drivers/media/platform/qcom/camss/camss-vfe.h |   2 +-
 drivers/media/platform/qcom/camss/camss.c     | 461 +++++++++++++++++-
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 14 files changed, 1130 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
 rename drivers/media/platform/qcom/camss/{camss-csid-780.c => camss-csid-gen3.c} (87%)
 rename drivers/media/platform/qcom/camss/{camss-csid-780.h => camss-csid-gen3.h} (84%)
 rename drivers/media/platform/qcom/camss/{camss-vfe-780.c => camss-vfe-gen3.c} (95%)

-- 
2.25.1


