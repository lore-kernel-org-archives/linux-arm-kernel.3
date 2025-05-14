Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35C96C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 21:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BMGlPfl0PlHnr858h6oVuIGE/V7R492wi23yl29+4Ws=; b=ksOLjho1JHn7063p710/qPn6a+
	wUY2i+y/DWNBtDjj4YxYJfNRBVkOTi2iho8TCMtkUiwKKTym3rRByZb9pizShRJRdOqbDP9GqQXRr
	ITzEU5QZC1yZWfdNOyJMOp8IsldNrtSYlsJ4EnoXP9bPuJDCu1RPIHk8JONqt16ABkHT/I+h91UrV
	HFtdMTS50CEQ8xWdogzd2pEZJFhYQ0J5yi41snRb1PY+UpdfIa1V9Eh4u6YVK5PCviQxpzp/aYw/l
	aUcpJLXZeofq0pAyRA01RubfsFM+/amb02IC8dlt3lzDOQfn56909Qo7q4YJp8rzwX1G733bSV9vg
	QWuntMOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFJz3-0000000GQcE-3iMy;
	Wed, 14 May 2025 21:49:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFJx2-0000000GQX2-2rCu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 21:47:46 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EKYOBu002608;
	Wed, 14 May 2025 21:47:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=BMGlPfl0PlHnr858h6oVuI
	GE/V7R492wi23yl29+4Ws=; b=dv46zFIfEvpO2JKIpN35EJqCwXINeq0uWWSb5T
	y578rBioCb5gep8Z4NpDeFqiLxhIy7w/Pn4JuZY9OcGbjLcQfMH4NpsctLWrd06X
	pklDJn37deLzHxp++vk7x0hFxTb8VLHPdFaqzS45Ze14bdhgVz/51DFcbkOtIspb
	/msBWPQpmhnaOFI+i6S11rpjEH0UqbsFBBjGR6ks4G7A4qeAKL8vmBfmQt3INvQl
	+WlwQR8T9nEbyohQ7ZPwB1QlVmtjDxTfPEDsREP42GyfPlOQgoHY4o5YqM7y9quD
	DE3qzzlDd4Pjyqr9YunqBEruYZ65lI+z1as6JP8ptOvPO8UA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbex45sa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 21:47:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54ELlcHe021301
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 May 2025 21:47:38 GMT
Received: from hu-sibis-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 14 May 2025 14:47:35 -0700
From: Sibi Sankar <quic_sibis@quicinc.com>
To: <sudeep.holla@arm.com>, <cristian.marussi@arm.com>,
        <viresh.kumar@linaro.org>, <d-gole@ti.com>,
        <quic_mdtipton@quicinc.com>, <avajid@quicinc.com>
CC: <arm-scmi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Sibi Sankar
	<quic_sibis@quicinc.com>
Subject: [PATCH] firmware: arm_scmi: Fix up turbo frequencies selection
Date: Thu, 15 May 2025 03:17:19 +0530
Message-ID: <20250514214719.203607-1-quic_sibis@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDIwMiBTYWx0ZWRfXwzE/Ir0a986y
 bfA631oR17Qm/XA/WzD/K1frTRJRvZ3oWQr3TUxtyVyrVNKCwFqJK9O7Li6zRP/8NJwZc08vEKI
 UVJGbyRL/K6S82jP7ODC0Xo8nxwu7r8LijdIOms0rMOr+atnzIesh9llyCTnOzouJBuCljR18kX
 QDM47RvPcfnhe9jkvg8DlK7d+3yL0BTdtAR+bK3k3gqjcrXvhtfJJsq5dpkQW9+7H/rI7eZFhkd
 6QXFQWqZB+ARfrqnZJZrmX1XV/H895tMGNvhNWiEtl+M5ZYVK9pQSGoUgkxJo9m1Mgc7UbIMGSF
 55dPQWQ0qucSz0H9pyGDUsxFUl/stjHkQ1DzHse9v46loDsesNt5dtOvvjmhlm1gzgCge/zWA4o
 gTMUrDlUFhyAgSHLPoAeDw95Jj+wkq3cT9f47AV0cqTp0w/xCDXmypcWU5+lMCMZe17zJM6p
X-Proofpoint-ORIG-GUID: Es-cZfoA2jWe32OW7ULli-XE4PQLuhNm
X-Proofpoint-GUID: Es-cZfoA2jWe32OW7ULli-XE4PQLuhNm
X-Authority-Analysis: v=2.4 cv=IcuHWXqa c=1 sm=1 tr=0 ts=68250f7b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=1jvTKiyz69YEsTxx_wsA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1011 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_144744_735884_7A6CF557 
X-CRM114-Status: GOOD (  13.19  )
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

Sustained frequency when greater than or equal to 4Ghz on 64-bit devices
currently result in marking all frequencies as turbo. Address the turbo
frequency selection bug by fixing the truncation.

Fixes: a897575e79d7 ("firmware: arm_scmi: Add support for marking certain frequencies as turbo")
Signed-off-by: Sibi Sankar <quic_sibis@quicinc.com>
---
 drivers/firmware/arm_scmi/perf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_scmi/perf.c b/drivers/firmware/arm_scmi/perf.c
index c7e5a34b254b..683fd9b85c5c 100644
--- a/drivers/firmware/arm_scmi/perf.c
+++ b/drivers/firmware/arm_scmi/perf.c
@@ -892,7 +892,7 @@ static int scmi_dvfs_device_opps_add(const struct scmi_protocol_handle *ph,
 			freq = dom->opp[idx].indicative_freq * dom->mult_factor;
 
 		/* All OPPs above the sustained frequency are treated as turbo */
-		data.turbo = freq > dom->sustained_freq_khz * 1000;
+		data.turbo = freq > dom->sustained_freq_khz * 1000UL;
 
 		data.level = dom->opp[idx].perf;
 		data.freq = freq;
-- 
2.34.1


