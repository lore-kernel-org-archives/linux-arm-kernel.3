Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C914FE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 09:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3aM+nBKZk2Kvny5qojqYdIOn8NmxL8RGeK1kSZ9rXIU=; b=T23zWDKD/OKxubVWho6b7R5h6j
	hdjPjL4GYFFpeuW6mctP+vAUZXKFJJ3D6AYJWfue3ivAKpeKSv5T4xDZisSyjy/+NCQb54vHOzn8/
	JaOTz64JFCiy8zIoIsA22z1llwjz/p41K8ogCxj6aRK/9eATcAZbDs8/BCmY0fHD5sf3DdELSSmDG
	INeZhtLqutj7u1nlODpA1wHZAbxqLaxMyjv6KNZEOBCDB7wqAVnqTATSne/kTuIDz2HX6xWzzpLrh
	lmuPHmzCofE7iwmQxy7f9KZ20OyOlR7qWmM+BJpCxI/1a6XX4BBgdqztkIoapBvZhLJ7xeqB6jBbu
	aiYAO9tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZVL-00000004SPJ-0wan;
	Fri, 20 Dec 2024 09:41:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZUA-00000004SHe-0q3Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 09:39:56 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BK795BF024266;
	Fri, 20 Dec 2024 09:39:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3aM+nBKZk2Kvny5qojqYdI
	On8NmxL8RGeK1kSZ9rXIU=; b=Ky9iSCJ4vpArG8xR4ArQdO18VPPbrz3wsmMqQM
	azbVAfsHAdph9zNyN8jZaByL75sllo9hzPzUEVhF7TRzIiARIolBaoi98b9svXb6
	ltRkZw4hOQin4nXaTxhrmWYpiFyUbvbfFadD+7Do2x0IwwSjHNm7bFzeJv8TfGA0
	qB4OgY0iIeONlQWZ7m34xQI3mffLNKlk2UGPO7MynTfu15eKBniGbGPHPLomzTdR
	Oyjjc0AzW06fWkWgsWgbtt4r6OLxALXXAEiHN470qHUCd9HfHnuB4DzxaZYxAMmj
	f24IRCKX3R0iCkGVoEQiQ4O8mAwYJVjFvCR3F8/U7hj/mMPA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43n3xjrdwj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 09:39:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BK9dcme014138
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Dec 2024 09:39:38 GMT
Received: from hu-ylal-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 20 Dec 2024 01:39:36 -0800
From: Yogesh Lal <quic_ylal@quicinc.com>
To: Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, Yogesh Lal <quic_ylal@quicinc.com>
Subject: [PATCH v2] irqchip: gic-v3: Handle failure case of CPU enters low power state
Date: Fri, 20 Dec 2024 15:09:07 +0530
Message-ID: <20241220093907.2747601-1-quic_ylal@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gonb4XauVaqLoCnvy-dNg_E4wS0Mm12S
X-Proofpoint-ORIG-GUID: gonb4XauVaqLoCnvy-dNg_E4wS0Mm12S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 mlxlogscore=645 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 clxscore=1011 spamscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412200079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_013954_356159_90EA1E6F 
X-CRM114-Status: GOOD (  14.40  )
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

Adding a new condition in gic_cpu_pm_notifier to address instances
where the CPU fails to enter low power mode (CPU_PM_ENTER_FAILED).
The CPU_PM framework signals CPU_PM_ENTER_FAILED upon such failures.

When the CPU attempts to enter low power mode, it disables the
redistributor and Group 1 interrupts and reinitializes the system
registers upon wakeup.

In case of failure while entering low power mode, it is necessary
to re-enable the redistributor and Group 1 interrupts to restore
normal operation.

Signed-off-by: Yogesh Lal <quic_ylal@quicinc.com>
---
 drivers/irqchip/irq-gic-v3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

---
Changes in V2:

* Updating the commit message
* Link to V1: https://lore.kernel.org/all/1671734140-15935-1-git-send-email-quic_ylal@quicinc.com/
---

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index c19083bfb943..2a99ca5c3f1d 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -1495,7 +1495,7 @@ static int gic_retrigger(struct irq_data *data)
 static int gic_cpu_pm_notifier(struct notifier_block *self,
 			       unsigned long cmd, void *v)
 {
-	if (cmd == CPU_PM_EXIT) {
+	if (cmd == CPU_PM_EXIT || cmd == CPU_PM_ENTER_FAILED) {
 		if (gic_dist_security_disabled())
 			gic_enable_redist(true);
 		gic_cpu_sys_reg_init();
-- 
2.34.1


