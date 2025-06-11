Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84190C61CE7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 09:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NcLkPFlCCgEjf/9frLpBnTl/E+oAWzqavoBgfIcs71I=; b=tX7Ed4hO8wSf9g
	rRnpMD7ahxawJMxH8oxgmOv73pbBQ9Tz812VWy25rtMCXPmqwqK3uPFqlvY7aeZXsojtJ+ngD7K6e
	mjByhcA1EHZCVAKPK+vvRF3rH2qLNmzXvoZqx7X9gK92yNv/F92i8uH5pUUWrl2rXv6t+jmL8x4aR
	BYBqjgRTCKtuz/jWB7bc1mWCg9tTKlWgmTmTF5m6AOI3VmX8WPpiLl3QhyUE1YduzyPZirmpiAAFc
	91+RCGTcQ5nJAZuMLy7rW2bavBYOUcC76f/oPL0Z3/Gbk99HmZfMQJ1X2gWcpWdOq9TcRw11ylCTb
	lfKCqWlZTUzyS3kmbu2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHML-00000009Pdz-15rp;
	Wed, 11 Jun 2025 09:03:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHK7-00000009PI5-2hQ8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 09:00:45 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B89M8r022355;
	Wed, 11 Jun 2025 09:00:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=NcLkPFlCCgEjf/9frLpBnT
	l/E+oAWzqavoBgfIcs71I=; b=oBoLnv6KlbQ0sG8PZDPFFdUL18Vp0Nq+ofOdmf
	evT5nkMMJKtK5eKdqwjzek3HM1k2Se1CLCjfQ7XXJIjlyYRPbtosgovl6uKuSGEb
	1XcGi8DOOF8p7ITFVgYuiCpx6ZGk1Fk7xQwKNb9gsTyLg3b2ogRBNeeJLZ2VR4tv
	hh8cseB2N6OR3AC+S5OSUETaX1ldhLDuQfIR+QzZQ34bq32Z16LhUrvnlV4YJF5x
	BjeDIbWPTTrPKWkvAD75KsSZImxYarHiXV9YNsDH3zO7lLSQg1NB746tmGDVSs+Y
	IAEvn77BKTw8r2MbZyC1X/HWq50QJzZxKQUV1Zq/p5DzASug==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpv0sr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 09:00:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55B90XGE010920
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Jun 2025 09:00:33 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Jun 2025 02:00:29 -0700
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Subject: [PATCH v9 0/2] coresight: Add Coresight Trace Network On Chip
 driver
Date: Wed, 11 Jun 2025 16:59:45 +0800
Message-ID: <20250611-trace-noc-v9-0-4322d4cf8f4b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIFFSWgC/3WSy07DMBBFf6XyukZ+28OK/0As/JihXpBAUiJQl
 X/HrUANSbu8I597RrZPbMSh4sgedyc24FTH2nctwH7H8iF2r8hraZkpoawwQvPjEDPyrs+cggo
 u6TYNyNr59wGpfl26nl9aPtTx2A/fl+pJnqfMOGe0CMBTCIUbKJknFJb7RCIlJSkY//TxWXPt8
 kPu39i5Z9IX9ncDv9hg0lxwaxJQUbFEgn/s/m9rKdeMJAmlkHcAaeszd32msRCciZS18Snc8dk
 N4wF0ICxUwtZn7/psY7Unr2Umgwlv+qxUa4YUkvAiRUS79bmlLyxZd75P5bKTUQlP7rZPqTVDN
 kLKEUEgbn3+6rNq+YMm39jiLJYUkwK48fbhyjrhlmxobNCawHipsl2x8zz/ADWXE9/cAgAA
X-Change-ID: 20250403-trace-noc-f8286b30408e
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>
CC: <kernel@oss.qualcomm.com>, <linux-arm-msm@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Yuanfang Zhang
	<quic_yuanfang@quicinc.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749632429; l=3002;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=akM+M+oPQt1HA0jM4drJhZdXjLtVHf+La9CDawh1sVI=;
 b=3y6MlUrvYqRAQMJLSLhxMGC2e5Pgceh7ggaVvyN/D2WcceroCo3ymtWa2dw28DBHTon7jNjPm
 G7Ql7YWxS9VCM7dcOCuxOX5/fpm28byXfPbPcLU6EJFH/d6lWtmGU/P
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=684945b2 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=mTvmQVt1wvC56TrAcpsA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA3NyBTYWx0ZWRfX2nZ/n7sPP6rR
 2+Rh2I7W+UN6y3lm9WSeHtr44FuQVX0tQzZI5wwC8orwTYp9QWgk22N/7KC/N0IZIazLmcuNv35
 ThkSNk3c+8mhUX8Y6ELEX6OFLXXG+hdMJG5SKJOiS7FX2GQ3j1zTH7UDYZhZnAW9jF6GquSZVxH
 iUWZWqNXm/Fbi4l1LuuY0cZZvzQ7a9sQUIHCDxKh5y3l4+20+GhdslRwqylrME9dyFHsxPil+ul
 azGJS4DVlK3vpIE0VAqEerX6j5mPjD5ToCCPTuijMOFH3QzH7K1fW7HB1JgMRO/ATT7Epv3m//q
 YAH+rhpYRAmAN5q5i7LazgqrXUODsSmRoZgPtQ++A1IBkTykw9WZwUvRQLJYHPoHS3SwOmfkYS3
 7/flwQm4xtdDDJ0tiIDpS+rmHnG+TDWhYvJ500GOeN/vb7chv7OpYdKa9DHNzdtS6CD2RJ1Y
X-Proofpoint-GUID: Mue1ykSMt5nhkcmOsdE3y8uRlzdRZ7cp
X-Proofpoint-ORIG-GUID: Mue1ykSMt5nhkcmOsdE3y8uRlzdRZ7cp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_03,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110077
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_020043_698014_4AC8E343 
X-CRM114-Status: GOOD (  15.12  )
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

The Trace Network On Chip (TNOC) is an integration hierarchy which is a
hardware component that integrates the functionalities of TPDA and
funnels. It collects trace from subsystems and transfers it to coresight
sink.

In addition to the generic TNOC mentioned above, there is also a special type
of TNOC called Interconnect TNOC. Unlike the generic TNOC, the Interconnect
TNOC doesn't need ATID. Its primary function is to connect the source of
subsystems to the Aggregator TNOC. Its driver is different from this patch and
will describe it and upstream its driver separately.

Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
---
Changes in v9:
- Mention the binding is only for Aggregator TNOC.
- Link to v8: https://lore.kernel.org/r/20250606-trace-noc-v8-0-833f94712c57@quicinc.com

Changes in v8:
- Add sysfs node to expose atid.
- Link to v7: https://lore.kernel.org/r/20250523-trace-noc-v7-0-d65edbab2997@quicinc.com

Changes in v7:
- Move the content in header file into coresight-tnoc.c.
- Use scoped_guard() to replace spin_lock().
- Invoke coresight_trace_id_put_system_id() for registration failure.
- Link to v6: https://lore.kernel.org/r/20250522-trace-noc-v6-0-f5a9bcae90ee@quicinc.com

Changes in v6:
- Add a newline after return statements.
- Use 'x &= foo' to replace 'x = x & foo'.
- Use 'x |= foo' to replace 'x = x | foo'.
- Link to v5: https://lore.kernel.org/r/20250512-trace-noc-v5-0-f2ef070baee5@quicinc.com

Changes in v5:
- update cover-letter to describe the Interconnect TNOC.
- Link to v4: https://lore.kernel.org/r/20250415-trace-noc-v4-0-979938fedfd8@quicinc.com

Changes in v4:
- Fix dt_binding warning.
- update mask of trace_noc amba_id.
- Modify driver comments.
- rename TRACE_NOC_SYN_VAL to TRACE_NOC_SYNC_INTERVAL.
- Link to v3: https://lore.kernel.org/r/20250411-trace-noc-v3-0-1f19ddf7699b@quicinc.com

Changes in v3:
- Remove unnecessary sysfs nodes.
- update commit messages.
- Use 'writel' instead of 'write_relaxed' when writing to the register for the last time.
- Add trace_id ops.
- Link to v2: https://lore.kernel.org/r/20250226-trace-noc-driver-v2-0-8afc6584afc5@quicinc.com

Changes in v2:
- Modified the format of DT binging file.
- Fix compile warnings.
- Link to v1: https://lore.kernel.org/r/46643089-b88d-49dc-be05-7bf0bb21f847@quicinc.com

---
Yuanfang Zhang (2):
      dt-bindings: arm: Add device Trace Network On Chip definition
      coresight: add coresight Trace Network On Chip driver

 .../bindings/arm/qcom,coresight-tnoc.yaml          | 113 ++++++++++
 drivers/hwtracing/coresight/Kconfig                |  13 ++
 drivers/hwtracing/coresight/Makefile               |   1 +
 drivers/hwtracing/coresight/coresight-tnoc.c       | 242 +++++++++++++++++++++
 4 files changed, 369 insertions(+)
---
base-commit: a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11
change-id: 20250403-trace-noc-f8286b30408e

Best regards,
-- 
Yuanfang Zhang <quic_yuanfang@quicinc.com>


