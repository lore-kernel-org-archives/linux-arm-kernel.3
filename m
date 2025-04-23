Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25D63C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 01:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUNs4qQ4kPZ934MOpZFoWaBOWfztD7AQWxXHIb1NA0M=; b=xj0vQffAY5+n+vcaArKKuy0g1E
	/mGIvUXwg6Jj24kRdJ9UZ2AQh9FtLsW/4XFaxBHiI6UXz74M4ezf2kTvmf8cqLTo92ctybELC7FO8
	P8zPzKjvtlNbGYh8Ks7jd5NDwvVC/0+M7xftjI/oPFzLdrB1gy+AKM1/CjaEleNnB3cObVTnTKnkS
	67MEUdW5rYTuy1Sio6su9uFRa7mNpV/TVeWUZR+BuGszO14j4tl16/5lzYf35iJi5MS6G82GjfFfs
	Ww6axvfEDTUKCm6RgyLEWs3R/8zo9+XOX9/U7AGh6kHPWZjIMFz/+3x8CVDnTxVVHOB6RF9/Hx4L5
	43373cfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7OTu-00000008vZ9-1g1Y;
	Wed, 23 Apr 2025 01:00:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7OS1-00000008vON-2pd3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 00:58:59 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0i8OT011379;
	Wed, 23 Apr 2025 00:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=UUNs4qQ4kPZ934MOpZFoWaBO
	WfztD7AQWxXHIb1NA0M=; b=C73zGgVizfEfb0kEmfmAxwnTZhxzNzBxh5xSnLw+
	ANBwSMdSP/U8fe4K3zcdj593PLCeUO5VoEQ13jDIthhXCkS+yHReMx/WfucyanPy
	VtzVXbazVyl8LkeTKHTh0bmcoG+Z9Y6QXj3wJu0UYo6VVPFyKRH8x3XSaYu7xs57
	KyQ5hd6L3B1NJ25IhsFpBmYJVsLmA962LlNCkfJnMzJ2H72Gu9WUojtCXVrEqEh3
	MSJ3i40bxaM/oDY8m9KI0G+sGjCVzTyDgs9Ena2spJuTtUfKvX3QYormVgf1JEh3
	8wKnBg9tc0Tai9MYu6ADbBUbxFP4j4xvj4bsHzxnMbgHkw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh1gdpx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 00:58:49 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N0wmnf026549
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 00:58:48 GMT
Received: from hu-mdtipton-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Apr 2025 17:58:48 -0700
Date: Tue, 22 Apr 2025 17:58:47 -0700
From: Mike Tipton <quic_mdtipton@quicinc.com>
To: Peng Fan <peng.fan@oss.nxp.com>
CC: Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi
	<cristian.marussi@arm.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Viresh
 Kumar <viresh.kumar@linaro.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-pm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] cpufreq: scmi: Skip SCMI devices that aren't used by
 the CPUs
Message-ID: <aAg7Rz6uyIfF2F/Y@hu-mdtipton-lv.qualcomm.com>
References: <20250421195206.3736128-1-quic_mdtipton@quicinc.com>
 <20250422085016.GA10830@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250422085016.GA10830@nxa18884-linux>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rTqnfQSj3JE833XboLwVnTrQYZ0yei6X
X-Proofpoint-ORIG-GUID: rTqnfQSj3JE833XboLwVnTrQYZ0yei6X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDAwMyBTYWx0ZWRfX76VmbQBbsOXX 5TPvats4YeCDiXv41iz9B6rwpRa8POmLtHOUmJCOkpXpMRa7z3+L8BjizUtVue3+o+iL/ycsY3R 51/RaEK/1xCkjep2R9FOfojfoOZbdxp3lMqdKoNs6GGQej6GexvcEVhy8lNhUrNkqWwUr30Agwd
 pUwyK28/ve3Z+jKFj0PRAVw+yhgwtmzwPa6v1gVtzFfC9SxDUowKdaKP5jFAtaz7Vmkp+CBahgB jrOwQWebNTwEe8qlJpWCVJvAVUUT3O+lyK8LIAwi6Ovg9HCHQ6NbvTPdI527n3GtSyngZy969Tu tLgtfVaxsY8clvmnVSL//woeKcFcN5XM2oAsarxAxev1lksuCtewKQrgSRCVaZ1krkWPO8L9HCF
 p2eokMymQ64sR5f1imPqF9Gp6B34Ue3YbZra4xLh+xiqWRXTpcriL9RHsD+Z9YUKbjAA2c3u
X-Authority-Analysis: v=2.4 cv=ZpjtK87G c=1 sm=1 tr=0 ts=68083b49 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=3H110R4YSZwA:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=8AirrxEcAAAA:8
 a=PVLRA3uSskNWJRZvLbwA:9 a=CjuIK1q_8ugA:10 a=TjNXssC_j7lpFel5tvFf:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-22_11,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 mlxlogscore=999 spamscore=0 impostorscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_175857_716720_DB0C29F8 
X-CRM114-Status: GOOD (  22.00  )
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

On Tue, Apr 22, 2025 at 04:50:16PM +0800, Peng Fan wrote:
> On Mon, Apr 21, 2025 at 12:52:06PM -0700, Mike Tipton wrote:
> >Currently, all SCMI devices with performance domains attempt to register
> >a cpufreq driver, even if their performance domains aren't used to
> >control the CPUs. The cpufreq framework only supports registering a
> >single driver, so only the first device will succeed. And if that device
> >isn't used for the CPUs, then cpufreq will scale the wrong domains.
> >
> >To avoid this, return early from scmi_cpufreq_probe() if the probing
> >SCMI device isn't referenced by the CPU device phandles.
> >
> >This keeps the existing assumption that all CPUs are controlled by a
> >single SCMI device.
> >
> >Signed-off-by: Mike Tipton <quic_mdtipton@quicinc.com>
> >---
> >Changes in v2:
> >- Return -ENODEV instead of 0 for irrelevant devices.
> >- Link to v1: https://lore.kernel.org/all/20250411212941.1275572-1-quic_mdtipton@quicinc.com/
> >
> > drivers/cpufreq/scmi-cpufreq.c | 28 +++++++++++++++++++++++++++-
> > 1 file changed, 27 insertions(+), 1 deletion(-)
> >
> >diff --git a/drivers/cpufreq/scmi-cpufreq.c b/drivers/cpufreq/scmi-cpufreq.c
> >index 944e899eb1be..b558f210c342 100644
> >--- a/drivers/cpufreq/scmi-cpufreq.c
> >+++ b/drivers/cpufreq/scmi-cpufreq.c
> >@@ -393,6 +393,32 @@ static struct cpufreq_driver scmi_cpufreq_driver = {
> > 	.set_boost	= cpufreq_boost_set_sw,
> > };
> > 
> >+static bool scmi_dev_used_by_cpus(struct device *scmi_dev)
> >+{
> >+	struct device_node *scmi_np = scmi_dev->of_node;
> 
> Nitpick: dev_of_node(scmi_dev->of_node) ?
> 
> >+	struct device_node *np;
> >+	struct device *cpu_dev;
> >+	int cpu, idx;
> 
> 
> if (!scmi_np)
> 	return false;
> 
> >+
> >+	for_each_possible_cpu(cpu) {
> >+		cpu_dev = get_cpu_device(cpu);
> >+		if (!cpu_dev)
> >+			continue;
> >+
> >+		np = cpu_dev->of_node;
> 
> dev_of_node(cpu_dev);
> 
> >+
> >+		if (of_parse_phandle(np, "clocks", 0) == scmi_np)
> >+			return true;
> >+
> >+		idx = of_property_match_string(np, "power-domain-names", "perf");
> >+
> >+		if (of_parse_phandle(np, "power-domains", idx) == scmi_np)
> >+			return true;
> >+	}
> >+
> >+	return false;
> >+}
> >+
> > static int scmi_cpufreq_probe(struct scmi_device *sdev)
> > {
> > 	int ret;
> >@@ -401,7 +427,7 @@ static int scmi_cpufreq_probe(struct scmi_device *sdev)
> > 
> > 	handle = sdev->handle;
> > 
> >-	if (!handle)
> >+	if (!handle || !scmi_dev_used_by_cpus(dev))
> > 		return -ENODEV;
> > 
> 
> With the minor comments addressed, LGTM:
> 
> Reviewed-by: Peng Fan <peng.fan@nxp.com>

I'll make these changes. Thanks for the review!

Mike

