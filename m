Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8709DC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 02:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lxbrvWqdSdg0QKIuWS/73qE193+doTJ8U/0htqu4vUw=; b=WXKrOjxFpltyw8o0yMOafAqLcG
	4XFhOdgxCh3wFPbM5TbrNB4LIW7hx6TSqmcs7wE0u9mQipUJFyTG4xC1my7Wlxoh90hRYE9hDnlEJ
	vqdOmd6H9dE+Rf+w/4iyoqzyEoChVBFgDMq9jYtVm8Ld++x0k0SieXHjlBdcMxOImlpCIL161iEpp
	VywMKj7kpRv3sEsCX/mTN7Ycl2ANMbC4VG3MVuGZDGbv6EGNFrt1GmWdkSIg8a3S0QV+ohWMJo3ND
	qa7h7QCJrhxwv5UnrLe1kHyUGO6DOvGFdnjs4aTyk/wlrPRfGJ4o31OveLNxJQY5XKJHMetCSqABW
	CnPnPCdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn7Ri-00000002D1m-139u;
	Wed, 26 Feb 2025 02:46:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn7P3-00000002CZ9-193t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 02:44:06 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51PMXWlk025583;
	Wed, 26 Feb 2025 02:43:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lxbrvWqdSdg0QKIuWS/73q
	E193+doTJ8U/0htqu4vUw=; b=mGFogO3Dd/wHg1kJYNPvC70YLiT0gQd/h/jzak
	MuCm6M+aROhVLnU1+NMiHznzlJh83KphbWezOcTb1zsB/a5GFKUm2d3XT1dwYkxt
	oLc6blyxwynbaP6qenAt7x2ZcLjKJRmPez6QubTu+OlP6PkMkkkyTHW0hUkYN93G
	IBbU00w0cRTBI/BnpIv5XYEobva+VKBmLJ5VSEW7hTlcvXEGVI09cubj7fYHXi1s
	u7MXnCJRDoz25RAt1de7W5oAGsonEdUcL4VRKy6jwYMfeWle84+ro/zwkGDXNgmF
	EPuW5Rz5eULAhFOyJShAsQEHbxcB8GQ8wduJZVzYLn2hJ/eQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 451prmgfqr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 02:43:57 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51Q2huK7021541
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 02:43:56 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 25 Feb 2025 18:43:52 -0800
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <johan@kernel.org>,
        <dmitry.baryshkov@linaro.org>, <maz@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_sibis@quicinc.com>,
        <konradybcio@kernel.org>
Subject: [RFC V6 0/2] firmware: arm_scmi: Misc Fixes
Date: Wed, 26 Feb 2025 08:13:36 +0530
Message-ID: <20250226024338.3994701-1-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7QsxKzOob-IwZtMBRjVQxkDAwdRUNRXI
X-Proofpoint-ORIG-GUID: 7QsxKzOob-IwZtMBRjVQxkDAwdRUNRXI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_08,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 phishscore=0 bulkscore=0 malwarescore=0 mlxscore=0
 priorityscore=1501 adultscore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502260019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_184405_425606_78032189 
X-CRM114-Status: GOOD (  14.96  )
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
are required to X1E cpufreq device tree changes to land. It also proposes
addition of quirks to bypass a fw bug on X1E devices.

[1] - https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/

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

V5:
* Drop all the patches that have already landed upstream and mark the
  series as RFC to get feedback on adding quirk support for the perf
  protocol.

V4:
* Rework debugfs node creation patch [Ulf/Dmitry]
* Reduce report level to dev_info and tag it with FW_BUG [Johan/Dmitry]
* Add cc stable and err logs to patch 1 commit message [Johan]

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

base: next-20250225

Sibi Sankar (2):
  firmware: arm_scmi: Ensure that the message-id supports fastchannel
  firmware: arm_scmi: Add quirk to bypass SCP fw bug

 drivers/firmware/arm_scmi/driver.c    | 75 +++++++++++++++------------
 drivers/firmware/arm_scmi/perf.c      | 30 ++++++++---
 drivers/firmware/arm_scmi/powercap.c  |  8 +--
 drivers/firmware/arm_scmi/protocols.h |  4 +-
 4 files changed, 72 insertions(+), 45 deletions(-)

-- 
2.34.1


