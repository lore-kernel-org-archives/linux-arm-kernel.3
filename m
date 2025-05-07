Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41DBEC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 06:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8s6zgpzMhqDnLBMGCbmZv3IRmVux3wLiekXXgV1bFKM=; b=3NlNL+ek9pIbPxn8vRJAVfO+qv
	PBqqiWyLZHVfxwSK5lDi/YhGX6k1QRqd2pkSVpfKY6PWbadx0s9Git2JYklLFFixBn9JY/EY1LqgW
	RCSJ9aRGfALfZ9rNwFUA0p3r0ddzTBBAxkbHtwOmGnwPDFtFKmdzh6sdrpd0mkfmQnO74QXd4hRC7
	KaNQKb0BHjfE9pLMcA9Bh/u9LfQQyuytryy8UyMkzYjxZDoIc17iYF3xXl5U0td1GMVRU2SoGztGV
	6RT7+IksvblawmYEw1xvoUjBJZipa3b9LWFaeAqsY/c+e9WakeUb+jYtRQlSRYNUiZWil5bf9R0yN
	c7uYUshQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCYRY-0000000EOaG-0he0;
	Wed, 07 May 2025 06:39:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCYPZ-0000000EOEu-3gnk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 06:37:47 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471Gm5R020191;
	Wed, 7 May 2025 06:37:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8s6zgpzMhqDnLBMGCbmZv3
	IRmVux3wLiekXXgV1bFKM=; b=je1iH+ArY6sJiJgcb9Hn93xIzNjmCxhYDjYm7b
	bp47KNd5uttodcddrcci9c4Nxi4w/yaszfg9zhvjbYE4p/ORPDiLCkMh2Qn/EUfi
	4uyjT5zBparnaUF+2E4LV3H9Q3Nft/r3BFRyeEB5a7U1s3sVAR/l86V3/Yomvu5f
	kPBjCh3y+QyQFFKgX/+CEZKHKKwI8kksn+s58XlWykIpKnCsIUTQTB1tbu5mj2qk
	wetY31IGVnQS6anrc8vpPFtXDsp5jdxJv27q2fA6LKMtts7u0HCMYoflbt8KL2fs
	w/rT7y7U56K1qTKH04sPDLzd1STK+6bxy2p7WwpceUT7alJA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9epa5ja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:37:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5476bSAa005099
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 7 May 2025 06:37:28 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 6 May 2025 23:37:28 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>,
        Yabin Cui <yabinc@google.com>
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>
Subject: [PATCH v2] coresight: tmc: fix failure to disable/enable ETF after reading
Date: Tue, 6 May 2025 23:37:16 -0700
Message-ID: <20250507063716.1945213-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=EOUG00ZC c=1 sm=1 tr=0 ts=681affa9 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=3H110R4YSZwA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=oqbhczGDPXGwOEN-XdEA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: X2iSuHKEDtop_EhCju52Q-1Khqya7BNA
X-Proofpoint-GUID: X2iSuHKEDtop_EhCju52Q-1Khqya7BNA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA1OSBTYWx0ZWRfXx7qWBQxuYO3X
 4Xk8E+kEoQRdDwHTFaD8sW+rI9XZUiAgCM+EfdSds/02GBuW1guREOeGIxNnBb+a8ZGODFV+qJX
 OG5f2gk57djmSSXlhD6LkKgXh31qP05uce952dZbH8VhDq2XxBNA6s9wBEwH9ZgqVEf1ycmhLvC
 ir46h1hR0NEo/Rf7yZ22u6svvRZm0fNk9YpbvQ530kE4nJuoWPNsKjzMu3lnVZKCZDPVctmj6WB
 ivYFuoXQYBLtXHWQWMT8w6+TGf/w/+evV8mmHh/MYEbb1vuCJmjeNW2pxORaYkkdsZFgnb760qI
 I7x7+rmNYchWTvdRz48OoCFyhGS9BaZTVA75rOYAPLKIkxYtrXvE927lyydauwlK3FhuTb7D9uu
 MluBh/bVDr9puB31jPoWakrODdEuMSHIc4W4cPsxBpY8HWOkHzx5+c7EVbJS+7TgZV6WLByp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 impostorscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 suspectscore=0 mlxlogscore=534 mlxscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505070059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_233746_037712_37FC541E 
X-CRM114-Status: GOOD (  13.36  )
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

ETF may fail to re-enable after reading, and driver->reading will
not be set to false, this will cause failure to enable/disable to ETF.
This change set driver->reading to false even if re-enabling fail.

Fixes: 669c4614236a ("coresight: tmc: Don't enable TMC when it's not ready.")
Co-developed-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etf.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index d858740001c2..c9e2d95ae295 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -747,7 +747,6 @@ int tmc_read_unprepare_etb(struct tmc_drvdata *drvdata)
 	char *buf = NULL;
 	enum tmc_mode mode;
 	unsigned long flags;
-	int rc = 0;
 
 	/* config types are set a boot time and never change */
 	if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETB &&
@@ -773,11 +772,7 @@ int tmc_read_unprepare_etb(struct tmc_drvdata *drvdata)
 		 * can't be NULL.
 		 */
 		memset(drvdata->buf, 0, drvdata->size);
-		rc = __tmc_etb_enable_hw(drvdata);
-		if (rc) {
-			raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
-			return rc;
-		}
+		__tmc_etb_enable_hw(drvdata);
 	} else {
 		/*
 		 * The ETB/ETF is not tracing and the buffer was just read.
-- 
2.25.1


