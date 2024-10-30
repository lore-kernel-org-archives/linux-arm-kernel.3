Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C12D5CCA9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 13:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWt2d4vJ4hdwE1HZC8EXwL3lO009NGDuGTQoVWKlbao=; b=fIVzN/NAwai06bYhGeQ9Hh9yDG
	EPQ3lmKyGwCdDpaHHiXIFbBGNRdcj25AxI3foGw/vKOYD2XxbHcjM0v9iNemy5gvZQYUhMk1ooJZi
	hhCU69ONA0yqe98S4mdAx3XlmWuV16V2NsbKQIW1GhzG3uHU27ZFAqTD7JMxhgGxzaREP9vyv+vQX
	+GL14Dr3eCyCKK43nzn1/Dd3j799JMhoA4lluBZqkuzqpjeXEuN6/WKo5dV6FR/1Gfcz5agxy9G+k
	wYprYDuAwbgtgZwl013oNoE/3VNIXB2Sgw6AcBKmxKimf/y0qs6mze3JfzNLWbq77ZLQlbzbS6Aa8
	sR05wcMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t68Yi-00000000RCg-0MNe;
	Wed, 30 Oct 2024 13:16:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t68F6-00000000OIw-0YiX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 12:56:09 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U8u59u001503;
	Wed, 30 Oct 2024 12:55:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aWt2d4vJ4hdwE1HZC8EXwL3lO009NGDuGTQoVWKlbao=; b=WfslGTfOCvw4qa7C
	HypG3pR1sx8T13A9mfUvHJLHHbmymxmcmbo6rkWXk2DjGcVU29FCHwkDX2T+zDO+
	VfZKEZu4sKzqUNcyppRYr2p0g1HQZaS4dU1B2sD2Lt0sXhaWbTwW6zX69t7w6V2V
	gSJQcIszkaKDPecuRxPEA/ILi3wmVEnsf2IaQyZP60QZC/gGkncZd/1X3Cb4HoKj
	q4kBUPSL1D5WR6eCOuf+mlX/YuRq2HQfmI8x3GKh8uSXD6y1t98M28jptxb8eiRp
	TCC+e+sqwGF57HB95hEGAvnKjvsf2TD61T6mtGKfCMY1oBNMFQbDhwFTZtkTs3MX
	lbuZBg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grgum3jq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 12:55:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49UCtwRW006365
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 12:55:58 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 30 Oct 2024 05:55:53 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <johan@kernel.org>,
        <ulf.hansson@linaro.org>, <jassisinghbrar@gmail.com>,
        <dmitry.baryshkov@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_sibis@quicinc.com>,
        <konradybcio@kernel.org>, <linux-pm@vger.kernel.org>,
        <tstrudel@google.com>, <rafael@kernel.org>,
        "Johan Hovold" <johan+linaro@kernel.org>
Subject: [PATCH V5 5/6] pmdomain: arm: Use FLAG_DEV_NAME_FW to ensure unique names
Date: Wed, 30 Oct 2024 18:25:11 +0530
Message-ID: <20241030125512.2884761-6-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241030125512.2884761-1-quic_sibis@quicinc.com>
References: <20241030125512.2884761-1-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lMVoRFqHth7yu-xw4iG9IrnX4g8SzSpv
X-Proofpoint-GUID: lMVoRFqHth7yu-xw4iG9IrnX4g8SzSpv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=849 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410300101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_055608_308386_14028E7D 
X-CRM114-Status: GOOD (  11.92  )
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

The domain attributes returned by the perf protocol can end up reporting
identical names across domains, resulting in debugfs node creation failure.
Use the GENPD_FLAG_DEV_NAME_FW to ensure the genpd providers end up with an
unique name.

Logs: [X1E reports 'NCC' for all its scmi perf domains]
debugfs: Directory 'NCC' with parent 'pm_genpd' already present!
debugfs: Directory 'NCC' with parent 'pm_genpd' already present!

Reported-by: Johan Hovold <johan+linaro@kernel.org>
Closes: https://lore.kernel.org/lkml/ZoQjAWse2YxwyRJv@hovoldconsulting.com/
Suggested-by: Ulf Hansson <ulf.hansson@linaro.org>
Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---
 drivers/pmdomain/arm/scmi_perf_domain.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/arm/scmi_perf_domain.c b/drivers/pmdomain/arm/scmi_perf_domain.c
index d7ef46ccd9b8..3693423459c9 100644
--- a/drivers/pmdomain/arm/scmi_perf_domain.c
+++ b/drivers/pmdomain/arm/scmi_perf_domain.c
@@ -125,7 +125,8 @@ static int scmi_perf_domain_probe(struct scmi_device *sdev)
 		scmi_pd->ph = ph;
 		scmi_pd->genpd.name = scmi_pd->info->name;
 		scmi_pd->genpd.flags = GENPD_FLAG_ALWAYS_ON |
-				       GENPD_FLAG_OPP_TABLE_FW;
+				       GENPD_FLAG_OPP_TABLE_FW |
+				       GENPD_FLAG_DEV_NAME_FW;
 		scmi_pd->genpd.set_performance_state = scmi_pd_set_perf_state;
 		scmi_pd->genpd.attach_dev = scmi_pd_attach_dev;
 		scmi_pd->genpd.detach_dev = scmi_pd_detach_dev;
-- 
2.34.1


