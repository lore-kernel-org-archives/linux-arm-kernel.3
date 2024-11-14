Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C940ED637D6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 02:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/XFWMzXOJN0DmiAz834Zjqrvrr/ljxZnbS1N4jwbPsg=; b=bggxLDnmEP6fETla6ht8DEx5J6
	Yxtt2dkcLBwOYldoReBEc9VowxVYh21uOmrhYXjcK3dxyvpn6pySalg+JhMQDNGVHXDFrXF983ak5
	UzQJKal49Hvyh/ou+7fn1XL+NEFsMNiCy5uwvMWKOr5hBVBHABCN9PCX4gGIifYjLjkBKQZh2mJxI
	BHNL0A70JaqiAKj+jms7aDdH7Im7yAo/SvQJcQzeNb4JGMboMSx+keFvpb3HGr5gPGKS+3bVgTc50
	O9YayfWEgLXheI3Tqw3JsjEg/f6afnWycJZ4S63+CBuhmE8WThH84q2Skg/C2MjsfgrDHOdGhRMh+
	da/MDmtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBPdw-00000008Yrb-4BkR;
	Thu, 14 Nov 2024 02:31:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBPc7-00000008Yhv-3j9M
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 02:29:45 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ADH1ZCv025361;
	Thu, 14 Nov 2024 02:29:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/XFWMzXOJN0DmiAz834Zjq
	rvrr/ljxZnbS1N4jwbPsg=; b=d5vD2FGN2l+cui/Oh3IhlPj2z2YVHWGB4aYzco
	X2LKIa9mf//4/O06DA6vTgUOoM15KUmVmRq2/SN6BvTwmGKWe9gQMxUjAIpVoZz9
	EViE/tn/fiSdn655wLJClQj2ushCOZRhrVLn5YpYTeVe3473/isTrJyozr2nb/th
	jrA2NPpxyVoa2FQfCxM/tetJsINfx/JJIt/U49DVvS6bJYfkXNktHf6QdNJTYQEa
	RYVilmDXQenxuLiOER6nnHL2G1bamA4O3Btk/wlP27ZIgyUTDuhdaymIT7NPmu7V
	ZC3FQIwYwBDQb66GiSkTHFUFnNitb5yMartMYBzzNzCvo6bQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vgqqut3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 02:29:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AE2TYK0031976
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 02:29:34 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 13 Nov 2024 18:29:30 -0800
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <rafael@kernel.org>,
        <viresh.kumar@linaro.org>, <morten.rasmussen@arm.com>,
        <dietmar.eggemann@arm.com>, <lukasz.luba@arm.com>,
        <pierre.gondois@arm.com>, <vincent.guittot@linaro.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_mdtipton@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>
Subject: [PATCH V8 0/1] firmware: arm_scmi: Register and handle limits change notification
Date: Thu, 14 Nov 2024 07:59:15 +0530
Message-ID: <20241114022916.644899-1-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7AJqlshVTjnTHf0zBfBFHPIs_Nfqs9t5
X-Proofpoint-GUID: 7AJqlshVTjnTHf0zBfBFHPIs_Nfqs9t5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 mlxlogscore=904
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411140017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_182944_081934_803ABDCA 
X-CRM114-Status: GOOD (  13.08  )
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

V8:
* Drop patch 1 since it was picked up by Viresh
* Leave policy->max update to the cpufreq_qos notifier [Vincent]
* We sanitized the range_max from V3 since we dealt with
  policy->max, now we can drop the check and policy member
  from scmi_data.

V7:
* Add a new request instead of reusing the max_freq_req [Vincent]
* Use the non-devm versions of register/unregister of event notifier
  since we have to remove them when the cpus get removed anyway.
* Add new patch to fix cleanup path on boost enablement failure.

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

base-branch: next-20241113

Sibi Sankar (1):
  cpufreq: scmi: Register for limit change notifications

 drivers/cpufreq/scmi-cpufreq.c | 45 ++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

-- 
2.34.1


