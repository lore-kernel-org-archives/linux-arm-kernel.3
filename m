Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0D2C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Apr 2025 09:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QMGKGJwnUU/BmYAEVJZo865KM3L5x0YXjOOHMWjz33U=; b=4nhGIdwQrhbGL9
	7PTfzyA+b8l/m+0cpR8I8fb9/eMwTk0qmgzM7N7s5cfnAm0+6eh895+fvXByKelhx4izviOfu9UJV
	c3xm/n3rDgEUZau5nX52gLBATHP0hfxxRBsC1azuPrfjtjUQUSt6xsPDpJ4fhm3c2XbshnY2r9HLu
	6dPi50ZgWj+Pslh6J6jo/Eil04oAeAx77l0ohmDjxtrkXuHQBaCzawLq1YUCuX1oqmgbJE5/DtQCe
	XQJ8AlNW/gIRNtTf9pH4BHOEoD/2K7TigBP8UspQjqFoONcdrAARm0NSF6C18lpG4WChDVLVzab6f
	ekfnmcN3QjcHiBpDdPXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3AFe-0000000D7LQ-3jiI;
	Fri, 11 Apr 2025 09:00:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3ADY-0000000D6mP-0Z7O
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Apr 2025 08:58:33 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B5cqW1030704;
	Fri, 11 Apr 2025 08:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QMGKGJwnUU/BmYAEVJZo86
	5KM3L5x0YXjOOHMWjz33U=; b=OncjWFiWiubIEU+8GkUHXOc/KAYThqHVCF+9mD
	HGLBkGZVvx7vO0IikgivCZ2uKekgulKgcbg/h8ImIc0XB4bhMSNmJB0cb9n8/ywZ
	ZuX8Dw8YzQs6vDameB29gXgh4C6VkZ3W0smUZ0g+XCN4RjBL//VzHHhM32xxtI75
	oqaZZ9QwwxGZdND+UaJnfGDcLE4Am6CI7tLOO0BPMXGa3Hp66SEhuzIBNxWwAzOD
	r2CLQ5ez4rcRjjtQ4KQ8y5H7VGLyQRMYBYBHHxtLsmOBluyou/OAbHUoYTN9AvIH
	iowWdKum0Vjdn343se9dhh883zgO14rZ8gEm/cwZsfV6gO2g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftskpj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 08:58:23 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53B8wNkg016304
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Apr 2025 08:58:23 GMT
Received: from yuanfang4-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 11 Apr 2025 01:58:19 -0700
From: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Subject: [PATCH v3 0/2] coresight: Add Coresight Trace Network On Chip
 driver
Date: Fri, 11 Apr 2025 16:57:51 +0800
Message-ID: <20250411-trace-noc-v3-0-1f19ddf7699b@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAI/Z+GcC/3XOQW7DIBAF0KtErEuFYYBxV71HlQUMTMOidotTK
 1XkuxdbXbiysvyjeV//LqZcS57Ey+kuap7LVMahBfN0EnQJw3uWJbUstNJWgTLyWgNlOYwkGTW
 6aNoVs2j/nzVzuW1db+eWL2W6jvVnq5679SrAOTAKexkRk4Q+kYxZWekjqxh1xwj+9eu7UBnom
 cYPsfbMZrN/C/xuwWykkhZiz0mHFLg/WnhoodkeHQQmAz7i0dqH1jZrPHvTEUOO+Wjd3uLeunW
 zduS6oJVn998uy/ILwAg4qZQBAAA=
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
	<quic_yuanfang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744361899; l=1455;
 i=quic_yuanfang@quicinc.com; s=20241209; h=from:subject:message-id;
 bh=8tyCaTWug517PKAYLddHpfQRQdW6eTM6uBSoFYSVyTg=;
 b=Ugfqgzz58f49RGI4dYnAu4OU83/PzhqWVbGbCSLwq49PT1Sw3NlnkJYYH/dY0y0+CWWe+RF37
 2AAG57SfehJBn6enizDVj5fxvyk5IjDkXTFc1U/6lna9txQwXo3j45g
X-Developer-Key: i=quic_yuanfang@quicinc.com; a=ed25519;
 pk=ZrIjRVq9LN8/zCQGbDEwrZK/sfnVjwQ2elyEZAOaV1Q=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f8d9b0 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=wQFbxXTkjMarF-hqfQ4A:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: cudZtBDQHd0apwwr1n8jfbI_NXhgY2CN
X-Proofpoint-ORIG-GUID: cudZtBDQHd0apwwr1n8jfbI_NXhgY2CN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_015832_195786_BAE4C183 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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
funnels. It collects trace form subsystems and transfers to coresight
sink.

Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
---
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

 .../bindings/arm/qcom,coresight-tnoc.yaml          | 111 ++++++++++++
 drivers/hwtracing/coresight/Kconfig                |  13 ++
 drivers/hwtracing/coresight/Makefile               |   1 +
 drivers/hwtracing/coresight/coresight-tnoc.c       | 186 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tnoc.h       |  34 ++++
 5 files changed, 345 insertions(+)
---
base-commit: a2cc6ff5ec8f91bc463fd3b0c26b61166a07eb11
change-id: 20250403-trace-noc-f8286b30408e

Best regards,
-- 
Yuanfang Zhang <quic_yuanfang@quicinc.com>


