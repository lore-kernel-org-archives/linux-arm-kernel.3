Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67A66C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 11:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T+V97obDzLk5rmrB6ECsIKW4/Kobtop+u5VLb/vFfd8=; b=FiLEchZlvUxNOPGRlzrxi8QavJ
	kfWsABvvkw8OL4/kFt0UjJHXk6xovMa4IrDk6j/bKAhCS4E0CDa83//k7mvbX6katn4kG6rlbWRvb
	TZ6kz19NjbYRCxpjb1ahJxyltSk0kwFx+PTnfKA7+mEGP7EdBjN8qKfpLmnMVUpIdl/zd9foDNbQv
	NHjtIkstSUBeAcDb/759BPU5pquVkc0l8SRxtma0IDTfM7fab0/vadACddH25urPxl49Fpk2Kxc/9
	f1mgGSdblwqtdpGY0uePIvIFgVtKXG7rV84I4wx4X4u2qaU2W/CRAjk4OkFTCuIUPKOTRvj3HIbn7
	HpoJIRAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Y56-0000000AI5A-1aHV;
	Wed, 23 Apr 2025 11:15:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7XUG-0000000ACJS-1w20
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 10:37:53 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0iOMY017343
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 10:37:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=T+V97obDzLk5rmrB6ECsIKW4/Kobtop+u5V
	Lb/vFfd8=; b=WQ0UvvRKkvZ+rSC9FtufDviRgnIFXldkFqttyfIKVg+MI3jkab6
	N/MpU1m/Ey0dHx8UsNifTCkdVqg9bjp8mjZTBWMwvKsmc384VX1zG4DHyYMFZ+M/
	zXpougMZpctqSSg1aNk9qNfy1oBCQpPSKRPQpbmXpNVXuX9FWWw31YDgTlrvrKLS
	skYn9JpMuFjQPXxt2iGlfMI4GHMhlHXU7dgf7W1lZzxExX0ieuKmvbjNpA0AIXly
	BP++hDfxlsSOXKhtfxElfMmHciTOC/rJHtO3eNkrV1HdhlcPyDVuuHq7BRMd0exC
	ADhAJwbMZh/CyP6aVpWc6aNoxKDsMSQ3FTA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh01u2y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 10:37:51 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-af9564001cbso3668561a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Apr 2025 03:37:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745404670; x=1746009470;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T+V97obDzLk5rmrB6ECsIKW4/Kobtop+u5VLb/vFfd8=;
        b=ZFIDmqbv1ukZHpczIR1v2EI55dphmYFDpRN91dlQG9UGiVrliyBxpiZEJrpiUB2Z1f
         7jaJFLbaqcxW06DAdToLAVD3lt0zh64cyljCt7s1aaERHYdOr7ocbrS3q3M3kioguLHj
         MWuBn/hTPFFCA84cOtpXaiIz9XuryHZXQvOHYT4XWfhvY7gyf9QrORA0UyBHYwSYwzqA
         va3YyJxQhXQlFAXxqmwidWL3rXI5lSqqRF34t52SlgxGJgtgVDQYEnGrHZBdbZHTFMV7
         o0ypTZgH/4FPaLWeMHc3atsy0qZfY7ORPQ6GY6Dy0Gk9Jei4ignAUtoSt4+l8h4TZy1O
         SjMA==
X-Forwarded-Encrypted: i=1; AJvYcCUyPA3uaJCtRo//yjxJjyRvZbt2tURdvFak8yRLeQ3UqAgDZyfSbQbYWemswO9b9A46KUL1QEEuLlCIhA6bNjDU@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi4tcPtoM73WW9giR8IRNxZVhDdXyRvXiW9vexM4nY3eCu+OZo
	Uxxn6sIECjSf159B0LNm6GeMhms7XVKgXvw06q2bus9poZpF5bJW9fO5ITZPsvI+jkyC3Gxmdef
	hpvZeVKgQJ2VUPcpydLXIYkx4wckHmqFDLVFreXF5VjX1kJYPWU0hQGuBO+F2lmt4pDk7RgYaCA
	==
X-Gm-Gg: ASbGncvo13B5wougjI60ZpEo0tmcgOkErVPnRMbYW3gcylQIjRA3u0RafN+65er/0H7
	e/wxj3GoK6qa706i+vnFq7Yjz/7mC7aOGzIFygKoPRLdPgkcs5Ph5ytar7ZIG6SIcm3h+Q4Jll1
	4fKt/T6n3Q6P8gUJ/tSvqZz+M9qA9oYjcff31XcaODh8WEs4yEjX9ILrg2FxqczMn5CFB1z8bTl
	Cy8OoDrsktBCsWZ98QZ8rBMvf0oRNeZwQFpB5eMuEFRMBBA2ZLLEfY67Xk8Z3ceDPhOYv3GE7zc
	YNgltH74eJNnrzxy9bvwpRrDhGf9sorQMTsSV9UcvFvW8cevERdLT1mV8Eg5VLtwbCw=
X-Received: by 2002:a17:903:fad:b0:211:e812:3948 with SMTP id d9443c01a7336-22c530b58acmr285107755ad.0.1745404669958;
        Wed, 23 Apr 2025 03:37:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWEGkGqqQxiqBDc642jLnAvl/Kfh5eMLvvocivyBH/SIGLIeIYmnBvd/W4FMF0zn3I3okHCA==
X-Received: by 2002:a17:903:fad:b0:211:e812:3948 with SMTP id d9443c01a7336-22c530b58acmr285107455ad.0.1745404669586;
        Wed, 23 Apr 2025 03:37:49 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50fda402sm100452395ad.232.2025.04.23.03.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 03:37:48 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Yabin Cui <yabinc@google.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>
Subject: [PATCH] coresight: tmc: fix failure to disable/enable ETF after reading
Date: Wed, 23 Apr 2025 18:37:44 +0800
Message-Id: <20250423103744.475-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA3MyBTYWx0ZWRfX8kClfZ6jYqrb CkzLtyXdv7Sy3wmhwHO001aVLyurWoU2J9OFLEhuQQd/ZFQaGwltrRp/Cl1A6P+BQd2MC1vRgAi ckXcjdLRPo7XljY9jcTHRrYjoqMhumoCReoBRTsZMecLu5DD6QmApl2JkmOL6Fn+6qJb7AZHpPH
 qBjApzjMtu6LgNT/3C1g+nTrm5rAqY0BKfYwYivbptGr4d849iwpXNxhOUzrRjHusXFEbY7KnCg awL2tWVFfRiLRaCIiKtWKghlYPMBo4TKvzEbqa29WUd8kMcHO8PE6SVOP4BF/DWqvMOuIYvTxcz g6NkU0EHiQTDZ5zas59QNz0u8E9MbsNO6nseQfwS4+3GW8vZxM8/9e3qT7rZK6edbagEAFM0lDF
 S47SoNAkRDCFxcOsyJzgoC2oK8dS1OW4GvhZdGALSdrDGqOIRqQqP06L6J/esccQNOOh16n5
X-Proofpoint-GUID: n1HVrU_BTl2bGyWV025YzspcnL-35zOT
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=6808c2ff cx=c_pps a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=RFblPUowwLJ5Nc-cMjAA:9 a=bFCP_H2QrGi7Okbo017w:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: n1HVrU_BTl2bGyWV025YzspcnL-35zOT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_07,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=709 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_033752_639559_39753CF0 
X-CRM114-Status: GOOD (  17.22  )
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

From: Mao Jinlong <quic_jinlmao@quicinc.com>

From: Mao Jinlong <quic_jinlmao@quicinc.com>

ETF may fail to re-enable after reading, and driver->reading will
not be set to false, this will cause failure to enable/disable to ETF.
This change set driver->reading to false even if re-enabling fail.

Fixes: 669c4614236a7 ("coresight: tmc: Don't enable TMC when it's not ready.")
Co-developed-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etf.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index d858740001c2..8c9f14e36bc2 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -87,6 +87,12 @@ static void __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
 {
 	CS_UNLOCK(drvdata->base);
 
+	/* Check if the etf already disabled*/
+	if (!(readl_relaxed(drvdata->base + TMC_CTL) & TMC_CTL_CAPT_EN)) {
+		CS_LOCK(drvdata->base);
+		return;
+	}
+
 	tmc_flush_and_stop(drvdata);
 	/*
 	 * When operating in sysFS mode the content of the buffer needs to be
@@ -747,7 +753,6 @@ int tmc_read_unprepare_etb(struct tmc_drvdata *drvdata)
 	char *buf = NULL;
 	enum tmc_mode mode;
 	unsigned long flags;
-	int rc = 0;
 
 	/* config types are set a boot time and never change */
 	if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETB &&
@@ -773,11 +778,7 @@ int tmc_read_unprepare_etb(struct tmc_drvdata *drvdata)
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
2.34.1


