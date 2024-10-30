Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6802D5CCAF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 13:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vyOiJymB0nnDRku/t4g1pcFvAC1IuzmaO9Rq+PhkWF0=; b=i31bX0nSXXaC2N9FbsxVZsbVi9
	dosY/8n4iKn2bMV8BhMBLLA/rT3cXVI73nUlPB7VVoGj+CNy4CPLFam0bMiKG2I2JR3Hix8bQj0e5
	zRFF6gM/Mq99ML61vRQtE5Qn3RJAjPg5059PA+nrsq/tku/nV75qJuL/ltmAIgngCf6kuO1aMkYrJ
	PTUzdSy/6pF4RhnvpVAfCXsJEO0B23my7rNq2xrqkxdjnqr6XBFC5s/3IjewDhSnr99+JIQKSrKNT
	c7ZCHvFiBdlODAKa4buIA9ne7FL79UytJ8C5DdjZTZ0beDD2pnzC4JaE3Xai9WnNMRFAAHGB3Ym/h
	+UKkrZ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t690Q-00000000WRR-1xsI;
	Wed, 30 Oct 2024 13:45:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t68o0-00000000U5T-1oru
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 13:32:14 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U9ZbpQ012778;
	Wed, 30 Oct 2024 13:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vyOiJymB0nnDRku/t4g1pc
	FvAC1IuzmaO9Rq+PhkWF0=; b=YFyqHMYqsy32ma3bzD6CprZA/SAH1Cmd8qLTvj
	hlb0GqfJ3ghxdn3dkRzhFCwN0XM5kpUHAieYdu+FfENrhC0jX5iX7kl853RP/IcL
	3QuvRFbtZINuiNIl4/vdqSNEdm1skMRj1RlL3BZO/M5aZCSP38SorpRfbmA7A90j
	EJQo7Bmsxgi0x/0+7Ql4AelcaTf+zVoouZLQg+D//7RGgBh1rQMKr41qsIGUAv1f
	TRfFnHoigMhMG8flqnN6rWQkoJAJruFt1WxOksUdiYCe88hz6jSHT5+ae+w3jh25
	OzrOfYWuOm5Fog7ItpZyGWQXe7SPwSoIgWAY9qtT2VFjIl5w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42k6rpjf9a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 13:31:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49UDVwZi006387
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 13:31:58 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 30 Oct 2024 06:31:53 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <rafael@kernel.org>,
        <viresh.kumar@linaro.org>, <morten.rasmussen@arm.com>,
        <dietmar.eggemann@arm.com>, <lukasz.luba@arm.com>,
        <pierre.gondois@arm.com>, <vincent.guittot@linaro.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_mdtipton@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>
Subject: [PATCH V6 0/1] firmware: arm_scmi: Register and handle limits change notification
Date: Wed, 30 Oct 2024 19:01:32 +0530
Message-ID: <20241030133133.2932722-1-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: usyqeks7XHTCpeLJzJIGkPIOknqe9vir
X-Proofpoint-GUID: usyqeks7XHTCpeLJzJIGkPIOknqe9vir
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 clxscore=1011 mlxlogscore=875 priorityscore=1501 spamscore=0
 malwarescore=0 impostorscore=0 mlxscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410300106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_063212_561998_4A5AB649 
X-CRM114-Status: UNSURE (   9.89  )
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

This series registers for scmi limits change notifications to determine
the throttled frequency and apply HW pressure.

V6:
* Unregister the notifier in the exit path to make sure
  the cpus work across suspend/resume cycles.

V5:
* Drop patch 1 and use pm_qos to update constraints. [Vincent]
* Use sdev instead of cpu_dev in dev_warn. [Christian]
* Pass sdev directly through private data. [Christian]
* Dropping Rb's for now.

V4:
* Use EXPORT_SYMBOL_GPL instead. [Trilok]
* Use a interim variable to show the khz calc. [Lukasz]
* Use driver_data to pass on the handle and scmi_dev instead of using
  global variables. Dropped Lukasz's Rb due to adding these minor
  changes.

V3:
* Sanitize range_max received from the notifier. [Pierre]
* Drop patches 1/2 from v2. [Cristian]
* Update commit message in patch 2.

V2:
* Rename opp_xlate -> freq_xlate [Viresh]
* Export cpufreq_update_pressure and use it directly [Lukasz]

base: next-20241029

Sibi Sankar (1):
  cpufreq: scmi: Register for limit change notifications

 drivers/cpufreq/scmi-cpufreq.c | 38 ++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

-- 
2.34.1


