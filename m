Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B142CDDE5F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 10:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZDXdX6CLF3dKf7gGuv8gHZgygqnDOMYgX/iRubfIEAQ=; b=fh4Gk3FLCVMI1BnuP9tAXPUzNc
	1vkNfAEGlarJ2grTQbNU2q3kiLyfFzbJHQyUEyq+8I5vu4zVhHjINNtrSTyNo5yn2dHHpn2J740/+
	fwD9A23d9KZl9pEKn4aN2Jw36i4D4AQv7Ymi/fUZVcIIy4sLIWbTP7+qwf2Su8gW5p8MwbE8Txt4Z
	W1ZeG3zaxbvTO+xC3ab56J4cn2xU9OQwQUUIgTf5yDPdw8DRGBQfp4AOl2ey7DURWbLtvHc5aIePx
	HpfWBVU9wf7cRwa/wZM0d7iv/4nWhB+8cgubT7+VNzurR/8LF4bAKfju/o9pHq7KuRzhhEMnPn5n6
	+IR+1VSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YbO-0000000DzbN-3w6C;
	Wed, 23 Oct 2024 10:28:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3YVN-0000000Dy4H-2tjS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 10:22:19 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49N9VMth024689;
	Wed, 23 Oct 2024 10:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZDXdX6CLF3dKf7gGuv8gHZ
	gygqnDOMYgX/iRubfIEAQ=; b=KyB9WbWzkvPPEgbGm/taSbtsfaYrZDyd2MlaHw
	M7SsDmPVosVG4KC2WS2pLL/sC8g/PngSVaJYsexrVURQTPfDtn0Asn6iduItS2ab
	UMvFz6RNZK2bGiGBWXETCqvuBVAeAqsUQcomgwrC/szpYKqD4EBDMOkVUauWO4Op
	cdRHBqjxBlrvgrdLZWhimAtWyyhU7I+CPXVV/nlHApeViYcRkxwUMSDy0lSYBBw2
	FyKpgQaN6PC+aLB2OjFk7rjUEn0ZQquGaoTG1Ik9g1V7Z+Jo5TJb9F4X9FEn7G0a
	qFotX8hLWj5dvk4wBHKkClwdq+vIOsdSd1MjVelvsj8H6LyA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em3uhu39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 10:22:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49NAM6TS004782
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 10:22:06 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 23 Oct 2024 03:22:02 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>,
        <ulf.hansson@linaro.org>, <jassisinghbrar@gmail.com>,
        <dmitry.baryshkov@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_sibis@quicinc.com>,
        <johan@kernel.org>, <konradybcio@kernel.org>,
        <linux-pm@vger.kernel.org>, <tstrudel@google.com>, <rafael@kernel.org>
Subject: [PATCH V4 0/4] firmware: arm_scmi: Misc Fixes
Date: Wed, 23 Oct 2024 15:51:44 +0530
Message-ID: <20241023102148.1698910-1-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: akv4dzHL370LDksHldObZRgcey22N4wV
X-Proofpoint-ORIG-GUID: akv4dzHL370LDksHldObZRgcey22N4wV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_032217_765092_ACB192A4 
X-CRM114-Status: GOOD (  11.59  )
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

The series addresses the kernel warnings reported by Johan at [1] and are
are required to X1E cpufreq device tree changes [2] to land.

[1] - https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/
[2] - https://lore.kernel.org/lkml/20240612124056.39230-1-quic_sibis@quicinc.com/

The following warnings remain unadressed:
arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16

They indicate that duplicate opps are reported by the SCP firmware and
they are seen during probe. They will get addressed by firmware updates. 

Duplicate levels:
arm-scmi arm-scmi.0.auto: Level 2976000 Power 218062 Latency 30us Ifreq 2976000 Index 10
arm-scmi arm-scmi.0.auto: Level 3206400 Power 264356 Latency 30us Ifreq 3206400 Index 11
arm-scmi arm-scmi.0.auto: Level 3417600 Power 314966 Latency 30us Ifreq 3417600 Index 12
arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
arm-scmi arm-scmi.0.auto: Failed to add opps_by_lvl at 3417600 for NCC - ret:-16
arm-scmi arm-scmi.0.auto: Level 4012800 Power 528848 Latency 30us Ifreq 4012800 Index 15

^^ exist because SCP reports duplicate values for the highest sustainable
freq for perf domains 1 and 2. These are the only freqs that appear as
duplicates and will be fixed with a firmware update. FWIW the warnings
that we are addressing in this series will also get fixed by a firmware
update but they still have to land for devices already out in the wild.

V3:
* Pick up R-b, T-b from the list.
* Pick up the updated patch from Cristian for skipping opps.
* Update device names only when a name collision occurs [Dmitry/Ulf]
* Drop Johan's T-b from "fix debugfs node creation failure"
* Move scmi_protocol_msg_check to the top [Sudeep]

V2:
* Include the fix for do_xfer timeout
* Include the fix debugfs node creation failure
* Include Cristian's fix for skipping opp duplication

V1:
* add missing MSG_SUPPORTS_FASTCHANNEL definition.

Base branch: next-20241023

Cristian Marussi (1):
  firmware: arm_scmi: Skip opp duplicates

Sibi Sankar (3):
  firmware: arm_scmi: Ensure that the message-id supports fastchannel
  pmdomain: core: Fix debugfs node creation failure
  mailbox: qcom-cpucp: Mark the irq with IRQF_NO_SUSPEND flag

 drivers/firmware/arm_scmi/driver.c    | 72 +++++++++++++++------------
 drivers/firmware/arm_scmi/perf.c      | 40 +++++++++++----
 drivers/firmware/arm_scmi/protocols.h |  2 +
 drivers/mailbox/qcom-cpucp-mbox.c     |  2 +-
 drivers/pmdomain/core.c               | 65 ++++++++++++++++++------
 include/linux/pm_domain.h             |  1 +
 6 files changed, 123 insertions(+), 59 deletions(-)

-- 
2.34.1


