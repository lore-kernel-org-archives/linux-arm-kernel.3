Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FCFD5CCB3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 14:31:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=alo6836guK9Z7mPFvjT64sRa9W903VDVoN5vz/mAGHc=; b=mpKsJq9yuNr+PJEkdO3FssCfAi
	a3gt7tCFRF7p+tU9IT2LLELw8m7svKSkWiBgrgehCA6QQ9IGYebm0nUu1NhH3n0/3nzKVZqXoMNk+
	ISMyWGZi/GjqwSdM9RmfbjGsT0jnfwl5YDgZOUAiHLQ17NdlJJH/oFDoHUilen83jNNHl4uEVK9eq
	nE8mKzqg2HlqAyk4UDIR5cZxxPethq2ozAObeE9NfTBl4AIUXy4eFUbhZkwSDxeU1rrIqvEaLCV8W
	CRBCwge4ow2Iw/JkTNOjPjRuYndTJtFb48IDoYox5jefMKWKkNZTdYa+vetCEfisinn2lOcCCLR65
	nRnyqwRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t69ik-00000000f8J-1nRS;
	Wed, 30 Oct 2024 14:30:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t68FB-00000000OKU-2fFE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 12:56:15 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49U9E2bC024838;
	Wed, 30 Oct 2024 12:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	alo6836guK9Z7mPFvjT64sRa9W903VDVoN5vz/mAGHc=; b=RSpCOr9ElFidAP15
	UHizGXCXqN1M4ZRVjScUm235KWbHLwuTesSzROCD5pR2HlZYmzz+lxigckGmmsM0
	Ja3DFi3ZlgUR6h8gXKtou8+59Sy2Z2lOOcfIcXOliDRiR5cvRzMkIXhqctDE7bTU
	dmhU2jqjirO1pSwoV2JJT4iLeBzpP7t2ZoMDyvX4n9eNJNthXkkLiEU+nmxXHeyG
	3YiO0aopU8NpKfsExgaK46puR1rElIuQEqRGSTY3xct3rV7HQeKa2s7JTpcneZOG
	rFbSg+Xvwa5dkUzB9IeDSvnG19ApAIEPRVkkgE4Opylo63E6vp2VktVG9kzBSoSI
	/GNfog==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42grgum3jy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 12:56:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49UCu4rt013707
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 12:56:04 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 30 Oct 2024 05:55:58 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>, <johan@kernel.org>,
        <ulf.hansson@linaro.org>, <jassisinghbrar@gmail.com>,
        <dmitry.baryshkov@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_sibis@quicinc.com>,
        <konradybcio@kernel.org>, <linux-pm@vger.kernel.org>,
        <tstrudel@google.com>, <rafael@kernel.org>,
        "Johan Hovold" <johan+linaro@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH V5 6/6] mailbox: qcom-cpucp: Mark the irq with IRQF_NO_SUSPEND flag
Date: Wed, 30 Oct 2024 18:25:12 +0530
Message-ID: <20241030125512.2884761-7-quic_sibis@quicinc.com>
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
X-Proofpoint-ORIG-GUID: YgF8uCwzqQqGLY_Gmzqa2YJ5_RqWZM8x
X-Proofpoint-GUID: YgF8uCwzqQqGLY_Gmzqa2YJ5_RqWZM8x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 mlxscore=0 bulkscore=0 suspectscore=0
 phishscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410300101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_055613_812654_5F687F61 
X-CRM114-Status: GOOD (  14.57  )
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

The qcom-cpucp mailbox irq is expected to function during suspend-resume
cycle particularly when the scmi cpufreq driver can query the current
frequency using the get_level message after the cpus are brought up during
resume. Hence mark the irq with IRQF_NO_SUSPEND flag to fix the do_xfer
failures we see during resume.

Err Logs:
arm-scmi firmware:scmi: timed out in resp(caller:do_xfer+0x164/0x568)
cpufreq: cpufreq_online: ->get() failed

Reported-by: Johan Hovold <johan+linaro@kernel.org>
Closes: https://lore.kernel.org/lkml/ZtgFj1y5ggipgEOS@hovoldconsulting.com/
Fixes: 0e2a9a03106c ("mailbox: Add support for QTI CPUCP mailbox controller")
Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/mailbox/qcom-cpucp-mbox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/qcom-cpucp-mbox.c b/drivers/mailbox/qcom-cpucp-mbox.c
index e5437c294803..44f4ed15f818 100644
--- a/drivers/mailbox/qcom-cpucp-mbox.c
+++ b/drivers/mailbox/qcom-cpucp-mbox.c
@@ -138,7 +138,7 @@ static int qcom_cpucp_mbox_probe(struct platform_device *pdev)
 		return irq;
 
 	ret = devm_request_irq(dev, irq, qcom_cpucp_mbox_irq_fn,
-			       IRQF_TRIGGER_HIGH, "apss_cpucp_mbox", cpucp);
+			       IRQF_TRIGGER_HIGH | IRQF_NO_SUSPEND, "apss_cpucp_mbox", cpucp);
 	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to register irq: %d\n", irq);
 
-- 
2.34.1


