Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 638DEC369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 07:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aoGzH4QjgLcKToCB9Hw+ObYgReyc16FZAAig/lxN6OQ=; b=IPACuUeZTE23duq8zZVVvHYAOv
	JxLZHXZdCDOeABGFcV3JAOc4ozABpmN6wyQ0kK97TqDcoxodoghOAxrrlFsJBLfWT44uG4y/C8N9Z
	guxE0vveAN5sMyqqzeETgYy3cIZfHdPy6YmlmOsj67hauMrPcsjOtMPTh9JlrbMucSI2TObfEhzM4
	Vh1+lQN/XdD/BFBFVS0p1owMCqQBWV64hl13lgnz2sThKGLjOCQzcj5JmXEOhAzzE8FrtyRGQOck1
	ysZ6RRAec4RJdy337UQ291LnRAUTjXrq/X4nGuqESx0m1lEvOLBH0ajXFN+kgLo5WkeF1UQr3QALq
	Gt0lCMpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9fIy-00000008jdc-2527;
	Tue, 29 Apr 2025 07:23:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9fF8-00000008isS-3Ybz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 07:19:04 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNqIF4025620;
	Tue, 29 Apr 2025 07:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aoGzH4QjgLcKToCB9Hw+Ob
	YgReyc16FZAAig/lxN6OQ=; b=DMpTmpM49a+vKSzFIadDMDvt3OEeccJ4Mc5uvW
	1Acbw8mbl/MolztRcfS0WvBwjd4R2pd61MYtfwzJlTexd6ps24u+9wV7UMLYC2UP
	KWKM5gQ1VRBKWAIk9+GevcfiKHdGneOOr33sgqCrjGmsHs1j+sYtQx/22zw70hIk
	53xR6gDs1Fk1UA7rYY5fopAAPLmyKx9e4uI+G7OnUV6HNfoHbYaEbkLoIzLpePL4
	F5BvQgfnZbNQgrc0d3axvGAHsr5vWaT0ro7wkv/sM/gyzW7krFsgvhH5U6yYbcEt
	GEEC0Y4JhT/dQ/KZXa3hHmFe1RybLIU0G6daWKgCowz6jOyg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468muqktn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 07:18:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53T7IqGW007045
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Apr 2025 07:18:52 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 29 Apr 2025 00:18:52 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
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
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>
Subject: [PATCH v2 0/2] Add Qualcomm extended CTI support
Date: Tue, 29 Apr 2025 00:18:39 -0700
Message-ID: <20250429071841.1158315-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA1NCBTYWx0ZWRfXyM/5xamKtjF8 SguNJEMGCzP19PJyfsNEyTpPJQIlzmUVxR/6xu0/zqRNx7FaaW03hjB79K2dPcASB2Dbs6hokwA JOgxYmRsCoCLM557oTpw8C0z+Jov778IuKWKEvEt+Zzo/V4v40Tpcj3BdyNbjph5MjP9a6Ppqr2
 23e7DaqTWsCOp311HKydV7MnZ0S1lWJ8BaJst4uVMDiamCBSezaDs5RnxrM1aCeKCSJR1xDUUtr jDjyNRRENhuODBu4NYrdOp1whhU0Q2r5HnR9MFfmgF9XKp/B1UNFrtyy+MDwtU0H/ohOHGRBv1d 7bjuBIh6yUlokxTR9dLiT6h2UgunDEBbhie2aQX7xqEUCZqY84a7KfMrzvurXur8cbZolEpXFNq
 645cp4DRln8aJjGC1bddoMFC2n9p1D8WTTyVWXRWCr5O75Xe+ZiW/7MknCqarMBN+Bv/PQ+N
X-Proofpoint-GUID: 4OFxk86Jss1NoNFQwer_mu8keip1_4FL
X-Proofpoint-ORIG-GUID: 4OFxk86Jss1NoNFQwer_mu8keip1_4FL
X-Authority-Analysis: v=2.4 cv=M/5NKzws c=1 sm=1 tr=0 ts=68107d5d cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VDLssO2nRW9oqwq64HgA:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_02,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_001903_020385_0EDAAE0B 
X-CRM114-Status: GOOD (  11.06  )
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

The QCOM extended CTI is a heavily parameterized version of ARM’s CSCTI.
It allows a debugger to send to trigger events to a processor or to send
a trigger event to one or more processors when a trigger event occurs on
another processor on the same SoC, or even between SoCs.

QCOM extended CTI supports up to 128 triggers. And some of the register
offsets are changed.

The commands to configure CTI triggers are the same as ARM's CTI.

Changes in V2:
1. Add enum for compatible items.
2. Move offset arraies to coresight-cti-core

Mao Jinlong (2):
  dt-bindings: arm: Add Qualcomm extended CTI
  coresight: cti: Add Qualcomm extended CTI support

 .../bindings/arm/arm,coresight-cti.yaml       |   4 +-
 .../hwtracing/coresight/coresight-cti-core.c  | 127 ++++++++++++++----
 .../coresight/coresight-cti-platform.c        |  16 ++-
 .../hwtracing/coresight/coresight-cti-sysfs.c | 124 +++++++++++++----
 drivers/hwtracing/coresight/coresight-cti.h   |  72 +++++-----
 5 files changed, 243 insertions(+), 100 deletions(-)

-- 
2.25.1


