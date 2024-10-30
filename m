Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7BCD5CCA9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 13:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wLBLPPV1MWhVilbS8xRR8JeUQrmYOr3BAE3UuHw7ebk=; b=wA50zpErRWPnlhL8bJdxXJC+hA
	BJRBkY0eG/hB2i6MHwYlsUt8oEr66Pi+slx6lqOMj0fLcx4qvJ+CTeQTEl3d79ODh9efHgS8JbAdl
	qX7vCKavnmPdYC00ecBfgY+j/+oiDw+M6OBXLZrTTqChhwuR/56VFrtFpd8gfVoovVtdQ2ALFKjq2
	hPpQCoUgJ368y8JgYYcniNXxGX6MNDBGYrXpvEMiJNxKaURfxqvlgja4T1vSsWh++akNPYBy392bg
	nnE1y52v/lRYGSqwaIQECkKbQEXVcDoeUFUDWJ9Y0YCy9BHXR1ScznWq/4MLDc+dCidQpWhyrxVKI
	axOE+uOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t68Qf-00000000Q1S-30CT;
	Wed, 30 Oct 2024 13:08:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t68Eg-00000000OBg-3Lkf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 12:55:44 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49UAiItm004837;
	Wed, 30 Oct 2024 12:55:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wLBLPPV1MWhVilbS8xRR8J
	eUQrmYOr3BAE3UuHw7ebk=; b=AJUJbdjVvFgHPQqzVsmv6WPDmAXMYWO0Zu+A7Z
	WOsqJ78xzMyiWvSOtt2yJQRo1H6+hyTcQOV+MIefP577siOqAWK98jDryEAg75U7
	DkFmDEE3F1hqAPGreK2EAdCfeH4YzUVqBsgJ/CjTnE3/VVJMUHZPDtdliGeQXIng
	V0E9Hzz8uSahKqCTqR/93U4VGNcLVE2IgcyKCutXFdfXhTdfcCkcJ9t9PXo92ADu
	vbeVdvXXUFBmb/WBOWZJRoMmemq6CEglnlONvsxi4EkHgi2s8UxOclMbGfcXdY9T
	FjGlZcS4K3chSxzkiygJicjkI3Udv21Vfav/7luj6fAOUqHg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grt73xsb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 12:55:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49UCtVJo012029
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 12:55:31 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 30 Oct 2024 05:55:26 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <johan@kernel.org>,
        <ulf.hansson@linaro.org>, <jassisinghbrar@gmail.com>,
        <dmitry.baryshkov@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_sibis@quicinc.com>,
        <konradybcio@kernel.org>, <linux-pm@vger.kernel.org>,
        <tstrudel@google.com>, <rafael@kernel.org>
Subject: [PATCH V5 0/6] firmware: arm_scmi: Misc Fixes
Date: Wed, 30 Oct 2024 18:25:06 +0530
Message-ID: <20241030125512.2884761-1-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OWoS-TWW7j9Csy0vkht9p_HmLYSyIhnz
X-Proofpoint-GUID: OWoS-TWW7j9Csy0vkht9p_HmLYSyIhnz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_055542_990300_9DACBEC5 
X-CRM114-Status: GOOD (  12.17  )
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
are required to X1E cpufreq device tree changes to land.

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

base: next-20241029

Cristian Marussi (1):
  firmware: arm_scmi: Skip opp duplicates

Sibi Sankar (5):
  firmware: arm_scmi: Ensure that the message-id supports fastchannel
  firmware: arm_scmi: Report duplicate opps as firmware bugs
  pmdomain: core: Add GENPD_FLAG_DEV_NAME_FW flag
  pmdomain: arm: Use FLAG_DEV_NAME_FW to ensure unique names
  mailbox: qcom-cpucp: Mark the irq with IRQF_NO_SUSPEND flag

 drivers/firmware/arm_scmi/driver.c      | 72 +++++++++++++------------
 drivers/firmware/arm_scmi/perf.c        | 44 ++++++++++-----
 drivers/firmware/arm_scmi/protocols.h   |  2 +
 drivers/mailbox/qcom-cpucp-mbox.c       |  2 +-
 drivers/pmdomain/arm/scmi_perf_domain.c |  3 +-
 drivers/pmdomain/core.c                 | 49 +++++++++++------
 include/linux/pm_domain.h               |  6 +++
 7 files changed, 116 insertions(+), 62 deletions(-)

-- 
2.34.1


