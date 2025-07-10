Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D22CC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 05:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PKIEAnOyHzisVvciH1SkFRobVdUz1Cl4VPXZhQ1WnYo=; b=HBy/ZnfgZEqTAa
	I8befhFbBg03uJopW9Tb7qd/RL++2yyf4EygFua4BZMxUS5ZF8qbOWP5Y0+3SVWjfTKCZPpa9p+v4
	ut48XzkjA7nO8PQv7v27LQsiDNlyK7L9a7CDp3Brse5Oh93aaScLcRzLpuZvXh+T8LFoMF2Mj/jGT
	+PWUQtZh5kMNbB8o1cBO/IHGkZKTjBXPdfHURQyFHhfIg/GOLfiHiKVS+hf53aBVD7y1OljVjiQLw
	+Pjm+J29md72x8hY9dy+uNjuwwcyx+hVViu90lKQFdLH0yNMusqzylIH0/KHm0mXYjfM2kFMYXTxS
	hBFvCWHfDyMGMNmikPmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZjwI-0000000AjeP-18QW;
	Thu, 10 Jul 2025 05:35:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZjpJ-0000000AilX-29aE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 05:28:11 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A1W5o6009952;
	Thu, 10 Jul 2025 05:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PKIEAnOyHzisVvciH1SkFR
	obVdUz1Cl4VPXZhQ1WnYo=; b=QA/TBHhd8LzyH+FZusWtOroDujcNGggQFTpfgD
	33UDvnx9VpQFUPeotvD50unJD3APy9BqhMuomZyJDqvdzHDzvJK5dFZliyxy50Dy
	BNQ5PZc8nNIyHOTo5KZTXv9eFsgsJKKUny76904M9dxiIsHkv69ha6+X8WDKKRVl
	gzgrNGVEtOJNEquk+YHpiIyPnhcQneJm3xd47YHvdk5lw3Nv4R9pVAGSXq9Ea4D4
	gO668y2AvDMRXTdwjlRXhUlGZW7W/r1tvmPn08dSRseAaHRNQMDBMszRTj5VmKIh
	IF58cXoN3UttG2bBU244eER3rlDMtQ7sN8l6mC4ZCO/BJ8cA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47sm9dumdv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 05:27:54 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56A5RrCW029975
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Jul 2025 05:27:53 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Wed, 9 Jul 2025 22:27:49 -0700
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Subject: [PATCH v11 0/2] coresight: Add Coresight Trace Network On Chip
 driver
Date: Thu, 10 Jul 2025 13:27:19 +0800
Message-ID: <20250710-trace-noc-v11-0-f849075c40b8@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADdPb2gC/3XSzU7DMAwH8FeZeiYo37E58R6IQz5s1gMttKMCT
 Xt3sgm0bm2PsfLz30p8bEYaWhqbp92xGWhqx7bv6kGph12T97F7I9GWWmi01E5aacRhiJlE12f
 BoMEnU6tATb3/MRC335dmL6/1vG/HQz/8XHpP6lxtrPfWSECRAIqwWLJIJJ0IiWVKWjHY8Pz51
 ea2y4+5f2/OfSZzsX8ThNkEkxFSOJuQi44lMt7Yh/+plbo3ihWWwsEjpmWe3cyz1SJ4GzkbGxJ
 s5LmFCYgGmAoXWOa5zTxXrQkcjMpsKdFqnlP63rAmlkGmSOSWeX6eB3Prz++pffYqahnYr+dpf
 W/YRUw5EkqiZV645jk936ApVFu8o5Ji0ogrfw9X66WfW6gWjGG0QensVizO7O0OYLXWaF1sZmC
 7sgNKbmIlq45gksvelGjsrT6dTr+HfY1NVwMAAA==
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
	<krzysztof.kozlowski@linaro.org>,
        Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752125269; l=3311;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=UOjgDjCmiOdvRuWgdc4TO3wU5LVE4S+rLjsRpG3oBsQ=;
 b=3KEn0iF3iIdR4k/p8kdFtKudGqHy8M6jPgVgY3VJjDO7F5JtgaZydps8ZYDs7XmnVAz74v3VA
 oXusUuKNXkpAd+pXWxEO4OikK/sPa3oqqIBqHfiihs0ZN4Y5sX16BtS
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8T1GP9TFmEpwUhPkgfga6oBSjCH0zDGc
X-Authority-Analysis: v=2.4 cv=W7k4VQWk c=1 sm=1 tr=0 ts=686f4f5a cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8
 a=COk6AnOGAAAA:8 a=9Mfdxx16wSnRITkP5VIA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 8T1GP9TFmEpwUhPkgfga6oBSjCH0zDGc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDA0NCBTYWx0ZWRfX3leAEpu89Bgv
 FYZ4mRRAEZ6wu55w/k6q92fCSKt54jo7lQyCNy/f8Vo/vDdwipb5zZAykzdrIyBT6akqkvE9cZf
 9LLt034WG0ExyY2or4lUXjfOvcmTYRj261FIM9mhhbfkt+RFGPsRDEP+7dOdH9cJ6EglDAMA/02
 Dz6PXqEL60QdKdh/lDSTpIUrTGjhzybrK8vfqS1UikemKWyQJi8eepWI2TI+fE0fgfvhsXtrAb7
 tePct78UHDm4LNm7NvNJByBd9/flEVAHgYfFQ1oxu3Cd6lPjq14oatKz9lKq1iCsyy2Ntwi8mon
 iVycJ75mQNXyFf81/pSn92v/ug2GxkGACQ1W/PlxE7ym9fnDuHtVdWdUyqjSu3+cP4aB5sRKpA0
 Lg/kFoC+7R7/AaShD/Z/EFm+KYoe/dOlFb+slQy/0CWZF6jG6NVUkkzsupbJIEgXHrNSqWXu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-09_05,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_222809_673694_5DF3EEEA 
X-CRM114-Status: GOOD (  15.75  )
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
Changes in v11:
- reorder of trace ID release and device unregister.
- Link to v10: https://lore.kernel.org/r/20250611-trace-noc-v10-0-a83b5c63da34@quicinc.com

Changes in v10:
- Rebase to coresight/next branch.
- Link to v9: https://lore.kernel.org/r/20250611-trace-noc-v9-0-4322d4cf8f4b@quicinc.com

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
 drivers/hwtracing/coresight/Kconfig                |  12 +
 drivers/hwtracing/coresight/Makefile               |   1 +
 drivers/hwtracing/coresight/coresight-tnoc.c       | 242 +++++++++++++++++++++
 4 files changed, 368 insertions(+)
---
base-commit: 408c97c4a5e0b634dcd15bf8b8808b382e888164
change-id: 20250403-trace-noc-f8286b30408e

Best regards,
-- 
Yuanfang Zhang <quic_yuanfang@quicinc.com>


