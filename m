Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB77DC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Jul 2025 22:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2xhdgIZgYqZ4vHXpYRC0818d7Q6WB5sT/pI5r8kdGDU=; b=k2m+G8pEE/k9vQbl6XCh7PmMJ9
	SQkBVCebPE17rr9CLySxWi66/NDl45cIzo9p/0sD0YXfEM4Lrtc6xny9kp/Gf8x1RhyWu209x3cgO
	N4xxZWpTN4KT2MsdlAgfGFN/AdjwbrIiXrzT1oPM8QFVZ4Owae9YAWlLCJPaPs1Kz21lEpUBW9T9e
	TK+JV+3oqUtGGZzGuEfk165KbE92S0ZR7TjnTcnCXu8E1r4aRA6tRkHVLxNCNZIT2+cRrvt9nsT0w
	DhE8s1jFd7DGAVuJLv+EfVTZJNf93vJreGD5Di9bqp8vAN2Ah+xT3Eh+VW7U8qHy/NdQTcysuGRhY
	OGhTGX+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXS4a-0000000Cg7n-47pK;
	Thu, 03 Jul 2025 22:06:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXNbr-0000000C7BO-2APC
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Jul 2025 17:20:32 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 563EImjF013864;
	Thu, 3 Jul 2025 17:20:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2xhdgIZgYqZ4vHXpYRC081
	8d7Q6WB5sT/pI5r8kdGDU=; b=UYeXDzS1khXdk2Ahwy4Blf8jSflS6ON4RSQotf
	6J6P7vHLArTFkBZ2rg+7ewqa0PtzJalTqkC8CJN6Avmrcw5r5nJb37uGx1GUpwgu
	Twag+Lw250BX8mzYcOVPffnFjTRBjZZBk/baxjW/Tl5ryn5oOagFTe9M5+ru82fv
	F68Zw+pdbUDQlCxKQCM7SvcJQlp5ApXGlvqYnrLZq1kpHqnLBJixD5YmFpF0IhvW
	qghNF8zDEXG7E5S5TidEQzacQl2nQo7NM1PGyXoAiklWI7i5snLRR6jo1DcwTCKZ
	OS1REw3s6skhUBINuLhW1PIKgW2SC/31YMF7eeqAhT9GJEgw==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47mw30e9p0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 03 Jul 2025 17:20:24 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 563HK2pL026930
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 3 Jul 2025 17:20:03 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 3 Jul 2025 10:19:57 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <rfoss@kernel.org>, <todor.too@gmail.com>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <quic_svankada@quicinc.com>, <linux-media@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 0/9] Add sa8775p camss support
Date: Thu, 3 Jul 2025 22:49:29 +0530
Message-ID: <20250703171938.3606998-1-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CY4I5Krl c=1 sm=1 tr=0 ts=6866bbd8 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=4pAsuTqdjomlMBfRpP0A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: oYnobBeAAaSgXhDmaWvu_OJdUn7WyGEU
X-Proofpoint-GUID: oYnobBeAAaSgXhDmaWvu_OJdUn7WyGEU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAzMDE0NCBTYWx0ZWRfXwvVZUAm07cDx
 mVYCb7sPHSOb0BxKsgLZKBW0c5OGw35Ok9n8xD5ejZHJ983UHe4spO16zgJQQbRyYLUOXznds5Q
 0/1aMe6wvlS1ivN2LaHm5Rlazl3r3tG6R+PYdj8IhZtGAVsynJDiHqM/t1vPd9AIj7iV/kQDCD9
 JOkRWF0pXys2F1UHGdx+aLTYCHK8/EV7cWfIL/DsYCi2C1rZyhgNVYVu5ZTcIeRUqPIQDllHxsj
 1c0qpAsZ416OYnzJTFXAWu3pUDqNaFrZpfnpUF5pvHTDCzCFeyx8erp+iB1TzlLG004JWlComRm
 JCBuj5DZik+jJqjB1T+4Q9DOkwZk14Fc5AP/PKLGSEXdmdp82iQaxMi5bHG0YGj8gd9XJZQgpb1
 8Rs+5vCMqsBKD6CDhAaGAjgFM/fkvWFdec6yZOpWdBFIzc0L3FVEU26lCOvjQVvG1l37dZsw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-03_04,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 priorityscore=1501 clxscore=1011
 lowpriorityscore=0 mlxscore=0 phishscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507030144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_102031_560693_45865B29 
X-CRM114-Status: GOOD (  15.96  )
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

SA8775P is a Qualcomm SoC. This series adds bindings and devicetree to bring
up CSIPHY, TPG, CSID, VFE/RDI interfaces in SA8775P.

SA8775P provides
- 2 x VFE, 3 RDI per VFE
- 5 x VFE Lite, 6 RDI per VFE
- 2 x CSID
- 5 x CSID Lite
- 3 x TPG
- 4 x CSIPHY
   
Changes compared to v2:
- Renaming camss-vfe-780.c to camss-vfe-gen3.c and camss-csid-780 to
  camss-csid-gen3 to avoid code duplication for SA8775P.SA877P have csid
  690 and vfe 690 which is almost same as csid/vfe 780 with very minor
  change in register bitfield.
- Restructure vfe and csid addition to reuse existing files.
- Updated commit text for Bindings patch.
- renamed cpas_ife_lite clock to cpas_vfe_lite. 
- added voltage rails for csiphy in documentation.
- removed sf and icp clocks.
- removed sf_0 interconnect.
- Link to v2:
  https://lore.kernel.org/linux-arm-msm/20250427070135.884623-1-quic_vikramsa@quicinc.com/

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
https://lore.kernel.org/linux-arm-msm/20250211-sa8775p_tpg-v1-0-3f76c5f8431f@quicinc.com/

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


Vikram Sharma (9):
  media: qcom: camss: Rename camss-csid-780.c to camss-csid-gen3.c
  media: qcom: camss: Rename camss-vfe-780.c to camss-vfe-gen3.c
  media: dt-bindings: Add qcom,sa8775p-camss compatible
  arm64: dts: qcom: sa8775p: Add support for camss
  media: qcom: camss: Add sa8775p compatible
  media: qcom: camss: Add support for CSIPHY 690
  media: qcom: camss: Add support for CSID for sa8775p
  media: qcom: camss: Add support for VFE 690
  media: qcom: camss: Enumerate resources for SA8775P

 .../bindings/media/qcom,sa8775p-camss.yaml    | 361 ++++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 185 +++++++
 drivers/media/platform/qcom/camss/Makefile    |   4 +-
 .../{camss-csid-780.c => camss-csid-gen3.c}   |  39 +-
 .../{camss-csid-780.h => camss-csid-gen3.h}   |   9 +-
 .../media/platform/qcom/camss/camss-csid.h    |   2 +-
 .../qcom/camss/camss-csiphy-3ph-1-0.c         |  84 ++++
 .../media/platform/qcom/camss/camss-csiphy.c  |   5 +
 .../media/platform/qcom/camss/camss-csiphy.h  |   1 +
 .../{camss-vfe-780.c => camss-vfe-gen3.c}     |  73 ++-
 drivers/media/platform/qcom/camss/camss-vfe.c |   5 +-
 drivers/media/platform/qcom/camss/camss-vfe.h |   2 +-
 drivers/media/platform/qcom/camss/camss.c     | 465 +++++++++++++++++-
 drivers/media/platform/qcom/camss/camss.h     |   1 +
 14 files changed, 1186 insertions(+), 50 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/qcom,sa8775p-camss.yaml
 rename drivers/media/platform/qcom/camss/{camss-csid-780.c => camss-csid-gen3.c} (88%)
 rename drivers/media/platform/qcom/camss/{camss-csid-780.h => camss-csid-gen3.h} (84%)
 rename drivers/media/platform/qcom/camss/{camss-vfe-780.c => camss-vfe-gen3.c} (71%)

Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
-- 
2.25.1


