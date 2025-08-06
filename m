Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF5DC87FD1
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 10:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rBK/XJFxnA4H+qs+vmLEXSYe5OyqDwA6i9lNg270YFs=; b=A8p6V5hi/z9s+6ZPUb6RwVoSP8
	YogapSe1IxsFGYXILGeQKgXa8SW+IV99McjZHNOcPgSGCMZUZCuzhT3myrvXqt4ITtGXml+iQLhD8
	mawi0B66A5wuEKweWTtugTA/fgm/JNmv8zhBtRHkpxtvotKeQiwIXwFVH4+dUG0+nlSeMY1gOoJnY
	4xb987rmtmeuyESmBr9GEEOij8E1H6uqLG2gmrPO4H/HL8UU2nH7/TpBa2ci7IZYtsrLCSNqRPvW8
	HcP3TriR9hvoelXX/HtrmWxbLGvxUV3gQ5tUzvJ1f/qoIk5ifTJudSYrD1HdVoQ3rBh7bTL2LGq+/
	/psVOKYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujbTz-0000000EuCr-3lvw;
	Wed, 06 Aug 2025 10:34:55 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujbMe-0000000EtSQ-0OEn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 10:27:21 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5765ffgG031580;
	Wed, 6 Aug 2025 10:27:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rBK/XJFxnA4H+qs+vmLEXS
	Ye5OyqDwA6i9lNg270YFs=; b=H04/9vE+u22JMSTTjqz6+cId8V8/dE2/4YhkHf
	3QBzTJTtn6kwQ8lOnbyhIjs83R36jpI8MUxrIubNqLi4ijT80H1/Yhxt+HQF7Eod
	nP6hxR4AOAm4R1VF6bChfVbl3FcBM10xnkrRqrxOtVI05uX+hlKO5WP1O5lcefRQ
	+hL73lAemrLYvuArZxyCUuUc9Wg1/s42I8li8Oq7T7gn7rO0P1ZnjdYhDYdJIEiO
	OTG3JRfXJ2cKIsn4PaRnfFoqHp/1I0upBbSvXdzxJF7UtDsrn+0gO5H4qkzdxWiW
	DqOmZ2hfYG8cYpZOiVrXxlHowCxu11AvzATSXaA6NYEbR0mw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpybaetq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Aug 2025 10:27:12 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 576ARBPe012436
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 6 Aug 2025 10:27:11 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 6 Aug 2025 03:27:11 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v10 0/2] coresight: Add label sysfs node support
Date: Wed, 6 Aug 2025 03:26:56 -0700
Message-ID: <20250806102658.536683-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX+G16V8e7ecj7
 sEOqEpbQ/CCU5eJYMSB1jaApZ2LmE707D2LAJw7nZKHIsuPx4jgqycV0VCr4+BZHFlBaOETA8Hy
 oUgClfvcIep+12mXWnjUHNeSgGPJFIEYeTd3efaKPWTQlndMeydC/xxQ/PadC8pqLDxfRnvFi1r
 X9BdZdnmUxK1ZsyGZUDHWAf2WKqxDie1rtKmPCS6waxUIKCJNKPYeB4GiiS5PnmF9kI7OJvwdO5
 1ad+MawgWdaqryzoHnHiyja50gFzAbUljUesU+o2SWaf+imOFTtjSNZsO1xl8VcmGiKZxwhJKcc
 hXKBgABjlP4VZ6TrYljTTAgJpVJEMbbQg8fxgnj/crmj8ziIFRkz4bo6LCHiHmcI6vdsLq00ZI2
 2AEAWd+W
X-Proofpoint-GUID: XWokKa2HX_RX6fpQLFVOqbp6wZvXW5Ta
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=68932e00 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=3H110R4YSZwA:10 a=2OwXVqhp2XgA:10 a=D19gQVrFAAAA:8 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=C_w9g3tfadNPII6ijWgA:9 a=W4TVW4IDbPiebHqcZpNg:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: XWokKa2HX_RX6fpQLFVOqbp6wZvXW5Ta
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-06_02,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_032720_252125_87BE50AA 
X-CRM114-Status: GOOD (  10.57  )
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

Change since V9:
1. Replace scnprintf with sysfs_emit.
2. Update date in ABI files.
V9 link: https://lkml.org/lkml/2025/7/17/832

Change since V8:
1. Add label in all documentations of coresight components.
2. Add control of the visibility of the label sysfs attribute.
V8 link: https://lkml.org/lkml/2025/7/3/985

Change since V7:
1. Update the conflict when apply to coresight next.
2. Update the Date and version in ABI file.
V7 link: https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250226121926.2687497-3-quic_jinlmao@quicinc.com/

Change since V6:
1. Update the date and version in ABI file.

Change since V5:
1. Update the kernel version of ABI files.
2. Add link of different patch versions.
V5 link: https://patchwork.kernel.org/project/linux-arm-msm/cover/20241210122253.31926-1-quic_jinlmao@quicinc.com/

Change since V4:
1. Add label in DT and add label sysfs node for each coresight device.
V4 link: https://patchwork.kernel.org/project/linux-arm-msm/cover/20240703122340.26864-1-quic_jinlmao@quicinc.com/

Change since V3:
1. Change device-name to arm,cs-dev-name.
2. Add arm,cs-dev-name to only CTI and sources' dt-binding.
V3 link: https://patchwork.kernel.org/project/linux-arm-msm/cover/20240131082628.6288-1-quic_jinlmao@quicinc.com/

Change since V2:
1. Fix the error in coresight core.
drivers/hwtracing/coresight/coresight-core.c:1775:7: error: assigning to 'char *' from 'const char *' discards qualifiers

2. Fix the warning when run dtbinding check.
Documentation/devicetree/bindings/arm/arm,coresight-cpu-debug.yaml: device-name: missing type definition
V2 link: https://patchwork.kernel.org/project/linux-arm-msm/cover/20240115164252.26510-1-quic_jinlmao@quicinc.com/

Change since V1:
1. Change coresight-name to device name.
2. Add the device-name in coresight dt bindings.
V1 link: https://patchwork.kernel.org/project/linux-arm-kernel/patch/20230208110716.18321-1-quic_jinlmao@quicinc.com/#25231737

Mao Jinlong (2):
  dt-bindings: arm: Add label in the coresight components
  coresight: Add label sysfs node support

 .../testing/sysfs-bus-coresight-devices-cti   |  6 ++
 .../sysfs-bus-coresight-devices-dummy-source  |  6 ++
 .../testing/sysfs-bus-coresight-devices-etb10 |  6 ++
 .../testing/sysfs-bus-coresight-devices-etm3x |  6 ++
 .../testing/sysfs-bus-coresight-devices-etm4x |  6 ++
 .../sysfs-bus-coresight-devices-funnel        |  6 ++
 .../testing/sysfs-bus-coresight-devices-stm   |  6 ++
 .../testing/sysfs-bus-coresight-devices-tmc   |  6 ++
 .../testing/sysfs-bus-coresight-devices-tpdm  |  6 ++
 .../testing/sysfs-bus-coresight-devices-trbe  |  6 ++
 .../bindings/arm/arm,coresight-cti.yaml       |  4 ++
 .../arm/arm,coresight-dummy-sink.yaml         |  4 ++
 .../arm/arm,coresight-dummy-source.yaml       |  4 ++
 .../arm/arm,coresight-dynamic-funnel.yaml     |  4 ++
 .../arm/arm,coresight-dynamic-replicator.yaml |  4 ++
 .../bindings/arm/arm,coresight-etb10.yaml     |  4 ++
 .../bindings/arm/arm,coresight-etm.yaml       |  4 ++
 .../arm/arm,coresight-static-funnel.yaml      |  4 ++
 .../arm/arm,coresight-static-replicator.yaml  |  4 ++
 .../bindings/arm/arm,coresight-tmc.yaml       |  4 ++
 .../bindings/arm/arm,coresight-tpiu.yaml      |  4 ++
 .../bindings/arm/qcom,coresight-ctcu.yaml     |  4 ++
 .../arm/qcom,coresight-remote-etm.yaml        |  4 ++
 .../bindings/arm/qcom,coresight-tpda.yaml     |  4 ++
 .../bindings/arm/qcom,coresight-tpdm.yaml     |  4 ++
 drivers/hwtracing/coresight/coresight-sysfs.c | 71 ++++++++++++++++++-
 26 files changed, 189 insertions(+), 2 deletions(-)

-- 
2.25.1


