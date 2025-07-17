Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DA1C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Jul 2025 13:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gv/kowvjHeVVZFqg8gcLOwh9SGFpccdtvK5B8me4OS8=; b=JDrlLXF/g71t0kGloEQfc5bz4i
	0dahcLl3WNZIEBf7CFCx+fpj5oWSESEcRJ4oZOYTiFD4oYUtKqkswNShBaLikESiC/t4B/CCIKZLT
	3Ov2/3MKNaLC3vn0jPdQ3K+qQv9hgZq+xcLKiLe6M4vi17aZ5rIUq9IKVLDSq/gDYZbpa7D5y0FsV
	+GKdIU8My4U0K8wek5/aNVmUrlo1HjZ2xEtBCaOTFK+J6878PajvSnoetxCWEjd6LQNX3radglA7y
	IA2cmvQoYG4MI/ohJz++7m2aYCsVYqdNVy7BKhMccB1wuK3cwEF5XHPI5fq9qD3nZ6nA4rVe2XdzB
	sNZG/V+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucP4K-0000000AIz0-3gYF;
	Thu, 17 Jul 2025 13:54:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucO7e-0000000AAie-3TDk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Jul 2025 12:54:04 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCSrjh032365;
	Thu, 17 Jul 2025 12:53:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gv/kowvjHeVVZFqg8gcLOw
	h9SGFpccdtvK5B8me4OS8=; b=fOq6KgHrepAIEWd7QdpD33oyGzgDeIMvOS3Q13
	nrebvNOb6Pbx8mfsW55pR5oIvfa15Nsn18Z7FxJUEiK2IJXVxGkuDRzM/iXXDVbh
	+nILtmCxiipgTjqshJ6p2AsqlCkWdEFP/tnbSRH2g1+Vx/mSIrBkLxDf4NJF3+4n
	P8TBQMkRXpwHQKya8tfV0CCvLImp/3ARpZr09JhTkcDgOJOqPx8RMPM9oqZt6bdd
	dnBldfNbOIFwglxrcrb+xD5qAjNL0vY7AduoP+aUHCp32UvOQenxspYemNKNVOXd
	6fp974GyiEMKy64HD195CHH6nt99/vEa7+2+gR8mA1NvzalA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug387tfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 12:53:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56HCrsCQ006184
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Jul 2025 12:53:54 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Thu, 17 Jul 2025 05:53:54 -0700
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
Subject: [PATCH v9 0/2] coresight: Add label sysfs node support 
Date: Thu, 17 Jul 2025 05:53:40 -0700
Message-ID: <20250717125343.3820505-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDExMSBTYWx0ZWRfX7sxWeONXsZQ3
 9Sex4yl3yxxBzQ2nMn7+XfXSngDiKwMuVzxL555NgMEJF4TpDRBuXVL8gckxWBpU8mVopbgt0xz
 wqQMNA7chcCmDvIEcrfPGZYroXzMQ6TfK3G2vkjddXH1u/fPaAVy6UQy7pkEgLD24YPjnMrbI0d
 ju260uou0pZs7wQfsmTWpV3UcBwk4omxbV5Vk0AIQLqw5YqhR9Z7OznoVwXW7oX3FHB7Bf0gzhO
 QlD705ilEXzISJDNsa0lPpDvF9LiSpeQQzPUyCxYYoNvxBzuOhBPwiGK9lFwPE2AxAzkslX/A9N
 J+gVMTQKl4tKlowVa8zR0eroIsS4qKu9WlmyN1E734QSPLrc0Ad9JmHtWNT8Xy3F6ElUBc1EX7j
 cVgNf7xn0J5FaUsVY5pWImsLFWdYo/c7/VxE2bIHI/rPiv8Kikddmo+j1/HxVgoXlWHc2D8+
X-Proofpoint-GUID: 3TukOeIus2vuJQlRipfgxDO71s10ulp0
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=6878f263 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=3H110R4YSZwA:10 a=Wb1JkmetP80A:10 a=D19gQVrFAAAA:8 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=C_w9g3tfadNPII6ijWgA:9 a=W4TVW4IDbPiebHqcZpNg:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 3TukOeIus2vuJQlRipfgxDO71s10ulp0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_01,2025-07-17_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_055402_985865_C34F41CC 
X-CRM114-Status: GOOD (  10.12  )
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

Change since V8:
1. Add label in all documentations of coresight components.
2. Add control of the visibility of the label sysfs attribute.
V8 link: https://lkml.org/lkml/2025/7/3/985

Change since V7:
1. Update the conflict when apply to coresight next.
2. Update the Date and version in ABI file.
V7 link: https://patchwork.kernel.org/project/linux-arm-kernel/patch/20250226121926.2687497-3-quic_jinlmao@quicinc.com/

Change since V6:
1. Update the date and verison in ABI file.

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


