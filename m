Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD10D75BC2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Nov 2024 06:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4ut5+nCISlmsl3N5249soTZ7S8Hl0F8iDKCNX0DkTMs=; b=X0IZl0GU6gliXEyyhaw9IyLQ3C
	A/7ss2QYOFfyhY/D110Pm1IkRXNe2AzcTOKzSX8lDX1E/zwtrSIMZLa2zglPuay3YdxIRSBG/ZTRi
	pe5DIaBX+t1f2nEhJtfeDZz3Jm29aYXpmxQPn8qE1/p6bfgJsrXKrJOh5PIrSozgmet61b17/HlaT
	xNNpOc14nm40CqiWX/mBejzVWGUlVh1iajCmoTK1ClF4xwJZ7x0BgS+a3QXT7l5hzsxKUlIbtUkhd
	Nel8sPEzS7oAqqAy2oGTfHu+TnZvgh087ymZBrfjZsEyj6+zCHYTpfUFy0iJzsBGBgubOv5G0d6Eh
	o5M7udRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tE0i4-0000000GvOE-3GCV;
	Thu, 21 Nov 2024 06:30:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tE0h8-0000000GvDn-1Lp6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Nov 2024 06:29:39 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AKKaRaK007992;
	Thu, 21 Nov 2024 06:29:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=4ut5+nCISlmsl3N5249soTZ7S8Hl0F8iDKCNX0DkTMs=; b=dF
	06L/Zi60ERJRO0+T63Yyq5C9uv2Jbtm4BNKw6/m8xoBPk+PNJ8ApXb2liInUxAzx
	jSPnmdVen04JMU0HJhJfxPJzUwIXMX68BDioZ2tvSIuduc9rYzPtyqwRdMmt68Af
	4zuRCKlQIxaY8ZLTQnmMmnbibMpGkVP5jKGBnqBW8Z/FwbyjkoPF4SGzY/YWej+K
	BFfZJVry2ChZFLkLrsiXznpp0VEZqxvlMMoOypjE+JCg+N1IO6iGlPlCVKu8tVP5
	Ikt0f89R52bVOplnzKdYsIPFAc6KpgXrFB/gKY9cYp85y51zCJIV8mSLUa6vAUU+
	WyekIuLpMlGnzRPGaLeA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4318uvkerq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 06:29:23 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AL6TMa9019219
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 21 Nov 2024 06:29:22 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 20 Nov 2024 22:29:17 -0800
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>, James Clark <james.clark@arm.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v7 0/3] coresight: Add static trace id support
Date: Thu, 21 Nov 2024 14:28:26 +0800
Message-ID: <20241121062829.11571-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tv4B5aru_P-Dcw4LZV1CwpD5gDwdYWdo
X-Proofpoint-GUID: tv4B5aru_P-Dcw4LZV1CwpD5gDwdYWdo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411210047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_222938_479525_F4D054E5 
X-CRM114-Status: GOOD (  15.72  )
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

Some HW has static trace id which cannot be changed via
software programming. For this case, configure the trace id
in device tree with "arm,static-trace-id = <xxx>", and
call coresight_trace_id_get_static_system_id with the trace id value
in device probe function. The id will be reserved for the HW
all the time if the device is probed.

Changes since V6:
1. Add code to handle a case where the preferred_id is not valid when
use static id.
2. Returen busy when static id is not freed.

Changes since V5:
1. Remove the warn for staic id not available.
2. Drop the system_id if registering the coresight device fails.
3. Return busy when static id is not available in dummy driver.

Changes since V4:
1. Use fwnode_property_read_u32 in fwnode_property_read_u32.
2. Update date and version in sysfs-bus-coresight-devices-dummy-source

Changes since V3:
1. Adda new API function
int coresight_trace_id_get_system_static_id(int trace_id).
2. Use the term "static trace id" for these devices where
the hardware sets a non-programmable trace ID. 

Changes since V2:
1. Change "trace-id" to "arm,trace-id".
2. Add trace id flag for getting preferred id or ODD id.

Changes since V1:
1. Add argument to coresight_trace_id_get_system_id for preferred id
instead of adding new function coresight_trace_id_reserve_system_id.
2. Add constraint to trace-id in dt-binding file.

Mao Jinlong (3):
  dt-bindings: arm: Add arm,static-trace-id for coresight dummy source
  coresight: Add support to get static id for system trace sources
  coresight: dummy: Add static trace id support for dummy source

 .../sysfs-bus-coresight-devices-dummy-source  | 15 ++++
 .../arm/arm,coresight-dummy-source.yaml       |  6 ++
 drivers/hwtracing/coresight/coresight-dummy.c | 81 ++++++++++++++++---
 .../hwtracing/coresight/coresight-platform.c  |  6 ++
 .../hwtracing/coresight/coresight-trace-id.c  | 43 +++++++---
 .../hwtracing/coresight/coresight-trace-id.h  |  9 +++
 include/linux/coresight.h                     |  1 +
 7 files changed, 140 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source

-- 
2.17.1


