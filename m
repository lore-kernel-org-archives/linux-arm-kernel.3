Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B13D132B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 12:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xV3/4B0Zt1puTX7hsBvzE6wSFY80zQus3hiUjW89J2g=; b=X699trbxQMKbp/QfET+lRz93co
	hW+0jpzQ+AkiCs8wGkK3DJ9E/SRTGV4auJHVkbaFifyy3gdxEEVf9G2v+oSpBHO4w2GKKZRrcjDhe
	3XlKx2Em0sivtq/Fojvc1z8cBCVDYop8gbonXnJ6gix/+nFRaobWutFjMeV5nmjT9ol+p/kiWCPCb
	yVBEIEKskWlGyPEmdHMrvwKTgL9Wt87WjrL/tcRNXqwqw1Y/BVTS1uo2QqicNk0ozdxMjXTUrwGMM
	Ds5/fkn3kffq9f1QtBP8JF0BUe2TtdMoXopr22BupRyqzH1g6I3aKHh9+L37cTZXGXABnt3Lzs5p0
	FkBgYM4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vwV-0000000Deo8-2bug;
	Mon, 04 Nov 2024 12:12:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vhr-0000000DcGC-3QkJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 11:57:17 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4Bj2LF026158;
	Mon, 4 Nov 2024 11:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:message-id:mime-version:subject:to; s=
	qcppdkim1; bh=xV3/4B0Zt1puTX7hsBvzE6wSFY80zQus3hiUjW89J2g=; b=Zm
	Vdyk0Z797GZS59es5zQZYAS0MFaQ5W+OyJzTuOipPhG0cCshHuo5qj7anfoeiyu2
	K5nLCHfsRwhcgZQPqhwOale7Uo8TzEOburtcigXA1quN6dz8QfW88KyCh++VAros
	mDR87pQe3FF28bzBglBSOBEkLJoWGrmzX+YLPETUyFDZJ7dxkGJA0RqwXl4Wtu6B
	F30PqZbSiwqLj9xP9vbHBQsHOZa6gqs/Ye7aT+K3UXzxh7Xz4iu9rIQSI1Dnkk2m
	qgvRktXZUrNmNS+83+cvqMaDxJWQ1FGrLIhN2rHpG0jqMkdQNw6gNek5kVo8KVd9
	gP9E+3iR2qEEvID5eWYw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd1fm2wv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 11:57:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A4BuLlt022768
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Nov 2024 11:56:21 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 4 Nov 2024 03:56:18 -0800
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
Subject: [PATCH v6 0/3] coresight: Add static trace id support
Date: Mon, 4 Nov 2024 19:56:01 +0800
Message-ID: <20241104115604.14522-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: T_3FVF6u-hTGRusG1sx8Z_WoScL2Qa0X
X-Proofpoint-ORIG-GUID: T_3FVF6u-hTGRusG1sx8Z_WoScL2Qa0X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 impostorscore=0 bulkscore=0 mlxlogscore=999 spamscore=0 phishscore=0
 malwarescore=0 mlxscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_035716_042779_0D647DA0 
X-CRM114-Status: GOOD (  15.58  )
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
 .../hwtracing/coresight/coresight-trace-id.c  | 39 ++++++---
 .../hwtracing/coresight/coresight-trace-id.h  |  9 +++
 include/linux/coresight.h                     |  1 +
 7 files changed, 137 insertions(+), 20 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-dummy-source

-- 
2.17.1


