Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA36D5CCAA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 13:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WfHH1RHqUXE17Tc0K73Iyht1P2KaZRSGyXPS2z2U9BI=; b=VzMPycqNTbYcek0fGRB+4NXGoL
	xZqKAvSMa2ZZqxNoRCZLXVUo3IFuqVi8QB1Qb/+zxCMeP1HXe9Ihur4Jdt/mFQNt3gsdtVIY8ZDgS
	BrWEq9Wn2ixWKBLK8mZ6iLai2uYzCcDPU7B+OQJaWXuGHv/AkpJbOg9Yluai8P6MneIvWPYYGO0fd
	D+iWXAq01dNOGRcHO60uA/j/1Wra197VavGQ1GFvWTn6XRbYHbGmmCoa0ftCbbUa31pSKf2OxZHZt
	OM7Dz02M6IWcQqf/WP6gpHioz0DaFqz/dHFUJKIzUoX/pIdZ8c5sPa3dVDN4QmDEmzgK/+ACp3DxV
	ldx/oPOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t68VV-00000000Qlt-178R;
	Wed, 30 Oct 2024 13:13:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t68Ev-00000000OG6-1Tvz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 12:55:59 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49UALnDJ019075;
	Wed, 30 Oct 2024 12:55:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WfHH1RHqUXE17Tc0K73Iyht1P2KaZRSGyXPS2z2U9BI=; b=XWFahIOEnKI7gH28
	88bkvqDhKfh9FVwu84ymxT/RNNAGv8HiiEFR3gc+S+ct/phCsiM8OFY+SnQww9Rx
	cPZcgaJwpVrNpaAJHQTJClwKNN2A1gtt5ZVWqDo5PxcToowYhB/fwE3P55XfRv+J
	wLkl7GEJs9R2R39W0Wp2RDiq2jNBndbA2Ev3zIE2LuIMmCmeyHhPu7NXRnP/jZkF
	y0h7+n0Glh/0TXNyChvBrBTfI4y8s9zRxvhAtC+E6tBAyOhu/wlDBc01tN6COiq8
	MA/12RkCdfd/dauVVrF85U0BtLkkhbRXrBZwRmmEOueWDLcVQfHqr8W7YXZqQtv4
	s9tgug==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42gp4e4868-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 12:55:48 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49UCtlbu012132
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Oct 2024 12:55:47 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 30 Oct 2024 05:55:42 -0700
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
Subject: [PATCH V5 3/6] firmware: arm_scmi: Report duplicate opps as firmware bugs
Date: Wed, 30 Oct 2024 18:25:09 +0530
Message-ID: <20241030125512.2884761-4-quic_sibis@quicinc.com>
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
X-Proofpoint-ORIG-GUID: h4l24jaRJINMx_Wx4KtLorsJvGl9SFlE
X-Proofpoint-GUID: h4l24jaRJINMx_Wx4KtLorsJvGl9SFlE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 spamscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 mlxscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410300101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_055557_474825_55C5D7AA 
X-CRM114-Status: GOOD (  13.90  )
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

Duplicate opps reported by buggy SCP firmware currently show up
as warnings even though the only functional impact is that the
level/index remain inaccessible. Make it less scary for the end
user by using dev_info instead, along with FW_BUG tag.

Suggested-by: Johan Hovold <johan+linaro@kernel.org>
Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---
 drivers/firmware/arm_scmi/perf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
index 32f9a9acd3e9..c7e5a34b254b 100644
--- a/drivers/firmware/arm_scmi/perf.c
+++ b/drivers/firmware/arm_scmi/perf.c
@@ -387,7 +387,7 @@ process_response_opp(struct device *dev, struct perf_dom_info *dom,
 
 	ret = xa_insert(&dom->opps_by_lvl, opp->perf, opp, GFP_KERNEL);
 	if (ret) {
-		dev_warn(dev, "Failed to add opps_by_lvl at %d for %s - ret:%d\n",
+		dev_info(dev, FW_BUG "Failed to add opps_by_lvl at %d for %s - ret:%d\n",
 			 opp->perf, dom->info.name, ret);
 		return ret;
 	}
@@ -409,7 +409,7 @@ process_response_opp_v4(struct device *dev, struct perf_dom_info *dom,
 
 	ret = xa_insert(&dom->opps_by_lvl, opp->perf, opp, GFP_KERNEL);
 	if (ret) {
-		dev_warn(dev, "Failed to add opps_by_lvl at %d for %s - ret:%d\n",
+		dev_info(dev, FW_BUG "Failed to add opps_by_lvl at %d for %s - ret:%d\n",
 			 opp->perf, dom->info.name, ret);
 		return ret;
 	}
-- 
2.34.1


