Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D853C44507
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 01:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1wqDBsI3yCT2sfldRRfx2gkru7XASPgr4zytRr1nM0=; b=FnL4WTBB7qU8LfXaqtgHo9Uf8I
	5VG/FSUUNyJdg3TLE0TCU6XmSKL1G+8AW23AgsLkuzeX8MZxnblhKbHrM9WHKjfSzOlXKU1A1Epff
	ZUYhipGXA4GPmhmbLEtHKQKumaMStKOjYh17I4Jlsgegs0iocu379x5xctlYwIf8DbUELqUcCdZZU
	UpQGLBk6gl7Pe+70utS7NEMZrXYrMjFT+Ch/ELbuF6/41dpMT/u5uW23sbo3Kyjx5vOA11I+QiNAZ
	+0mGUodcenaD8Kc0lLubuPMGnaNrFrq2Ff3UlI4SuZPwgAe2qvoR5NISYarFBwTC28Z9eHg3AZ39j
	ccH5AJYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whzpt-00000003uO2-1LrH;
	Fri, 10 Jul 2026 01:15:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whzpr-00000003uNF-3J62
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 01:15:24 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669KgLQM2803217
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 01:15:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G1wqDBsI3yCT2sfldRRfx2gkru7XASPgr4zytRr1nM0=; b=k5qf5ez9Yeo9+Ix/
	lr5RbW2d7gVVZ95E/fpmLKVdreoGXqKAm+4B+nVE6cgC5c/eqI3pCuCvpi4ztC2E
	DIhx4aSYMhx9lmV/L2mnDLrO5cYPT4d2xw2kcbeE31RHI04xlP2tzvXAFi/Q4342
	UbtEh+y/Prm44t67mdYGqDZ4uOCNurMIv3tTYFtBZrQ+zAbzg3E9YbwBzRhSknI2
	SbXRnl2Wpz7obqBqpYOVjlXsukrv7ZbCkp7p53W3oYlSccNoGnGni8vZ8N00TgW8
	cZTI4KsRRxkQDv6IGQ+mv/zByRR4u5GY+NAUny1VRWBckb6fvfXDm1N1nedmnSeY
	GKVYGw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fajwt8q5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 01:15:23 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c891ed872ddso551672a12.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 18:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783646123; x=1784250923; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G1wqDBsI3yCT2sfldRRfx2gkru7XASPgr4zytRr1nM0=;
        b=WoAl+oXdv6s+uX2kOCqOo5HMGjR/IgD39dcqNvK6g/FV3YrftG2aDFQILMWVtFnY4V
         PDrA1GztyycPm2vd9tgE5gHXojJe9GxzTQZhkKLGcgTjcDD6MdTJYx/E4FLOozFlo1nM
         f9Ovd+8AED1lktC4kxjSpyEKq3SdQRsa2T1Ai4s9+ywW0OgJjeEAWSBPRwyt732pKoTA
         AJlTMd8xSIIDCyX43NLdOeDe+ZzAN364Y3LpzPM6zrqw4iFZqsaEdegm8epkNkSX3Tjt
         X0rN+99HeIXepVa48ThAr5SD7Mr61ODRizLjVUUJBCKckjtIbeFT7ddWXfFl6Z/vOEOo
         8/xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783646123; x=1784250923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G1wqDBsI3yCT2sfldRRfx2gkru7XASPgr4zytRr1nM0=;
        b=hOuOcaGGjC332/UKTx6Dpt17wL1uOSBG7Ji4xFof4Vum+OQDJkGhkWOfVskHVRTKAW
         u23gwgPK3ZZJnsZeSWOOkd9KCsqqkg3EYGNhgFE4hnW7Uh77bdLWnJhwOg1H13I2ilib
         W+KiHqhw1pqttBFxKl+F4YosFquEC08MnNXz0eyinjHQW6aZwjVJMh5iVvtqQ9aYy1xr
         AlJJxSLZXYXLBaWvV5ROCpqh4/RUAxw8sfpLmqqLJ3QL8kts3q0bdVmzsn14DtjzK1yG
         Y4WuXl6MWISQHEq1m4m37H13fDhX9xjmeDKAEAuk3LGb229Pkayz2sachHm8bCE+yquI
         ow0g==
X-Forwarded-Encrypted: i=1; AHgh+RoG7bUr8lU3U/HSdE9BNBtH0Hbw/Ouct1OZhv24I30A7XVhilIt+Yj6JAEoyp9xfg1l3romLVpMXFOLTTVY1hwr@lists.infradead.org
X-Gm-Message-State: AOJu0YyOe6RqA4UfteNpjKrxjXxTqnz2DXNG/+i7VVtAbGgp5MNt18s3
	uRssVZZyT2uDK3bH23/hH2XO4e7xlGjtdepvS3S6n9VId6NIoFAWT8unjzO+V6wVdKsg/m3JJ8g
	wD8SRKHraexItT9PyNg3dpK8H+mWMurVkPiT0X7yf/ihBHrMm7/DVJhQ+eMnTtDYabwEUTe3NOH
	iXyA==
X-Gm-Gg: AfdE7clpF8u4cSc+hn+5Pv0Knw0RBsVF56673T2P2zjE6ld1w2PDn2ZPLjfa4x6ZOwh
	pKMBR3XLTIIt+Cpwf+BY6h0f6qX7wK7/71A+lfZMSn4iP/YNCUe/z8j1U8DfhdXGmLRzwh1NIMw
	podeTASuHJi8bLiNl2tJfkSUGqm6eLvcp7wN5kEKNGAbln6vbM6FPsTDCwXFMtiTU0uNT5KU5LF
	DDykyEGPl2llZ/8GvaHhVTx5xDizU/FFkk/l4GTaoj70DHpPn2kX6AvOOwFSIgt1sUM+AjNqSHn
	WN5SW9IeLTMTwl6g3I0fiONXGqd8We7sJwlVgALE+ngxD0qti7eUroMH2kUl7uVyL8x6bXdxiAh
	0Z6/JczLG3XWnJKa5RbWBAnEURioy3FoxHU9T7JOXhobTfQONtcVXu6l2nGmNmItqFqW0FNZY8Q
	==
X-Received: by 2002:a05:6a21:682:b0:3bf:b50f:71bb with SMTP id adf61e73a8af0-3c0bc9acb33mr10934181637.27.1783646122620;
        Thu, 09 Jul 2026 18:15:22 -0700 (PDT)
X-Received: by 2002:a05:6a21:682:b0:3bf:b50f:71bb with SMTP id adf61e73a8af0-3c0bc9acb33mr10934141637.27.1783646122195;
        Thu, 09 Jul 2026 18:15:22 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b31628c1sm4431251a12.19.2026.07.09.18.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 18:15:21 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 09:14:48 +0800
Subject: [PATCH v3 2/2] coresight: tnoc: Fix clock refcount imbalance on
 platform remove
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-fix-clock-refcount-unbalance-v3-2-a37a1fb17981@oss.qualcomm.com>
References: <20260710-fix-clock-refcount-unbalance-v3-0-a37a1fb17981@oss.qualcomm.com>
In-Reply-To: <20260710-fix-clock-refcount-unbalance-v3-0-a37a1fb17981@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Anshuman Khandual <anshuman.khandual@arm.com>,
        Yeoreum Yun <yeoreum.yun@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783646108; l=2017;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=zgpWTKXkYjMR3KQnvwavCbiRuaPSJpMbJdyDurbvDAY=;
 b=NAXkJc33uJVwLgYrVrmkafvT+Ldln/C52l3qKRuXu/BorYNKmlaYr0W9YEkPolki/ROMN11hg
 3D50TwOMEsqAa7LRtLjnBPZw2Tn22TpO/4pFo3vq0w3rk2wQfqdf/Ix
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=XOYAjwhE c=1 sm=1 tr=0 ts=6a5047ab cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=pvfjB89pdnN9FuMUozkA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: IkYqGJ-FibD_nYENS4lWlkuy58sGqjf4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAwOSBTYWx0ZWRfX7aXraZMugZJd
 FtiiXPpDEHFZzhego2nUzdCQi0dhA4UE5keC7Oj+G8twY0jekVNYc1VODcOuKcqDbtQerUEb6YX
 UB6A+ovj3GU3bcYMk/RXQ+NmN8EEQAs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAwOSBTYWx0ZWRfXwzL7d6Yr56KP
 sZwdMj0hDxE3IdW4e4nV+LsZIYsNF370saUaNH3jv5ul7H7Jh/mjkzy3LT9L2op6ABdBJcCcSF8
 G9qeigDTT1PA6kk0SIuDcb4T9IkXabUvRmsZ1AWaAZXBpMYUKThJgI11qGR47s9IOLSXMv0Yf+2
 v4e4UWW9jxmKbZ6iOsJpP9j/VYT0dNSca28kQPs1R4VOngSDgcaxr6Kq8ymebzk8IuzeAgEElL6
 FKcBy3rbMyuqV3AKpb+H4ZRW5u+ASY6fYSGgS/Vfn1MG1jHbbP8z8dtTGOKvj086wK/jxzHvADx
 lZHnB+9/M/GWi090OcrfpeOADs1FAgw+NBO7uDah9WYZ+9xmfJ7k8RT3AZ1WzWrEVEY4PfEcpvE
 PUZn1sFBBM0ql7pziZSHBYhVPymgPt2PEbQ6mdZbdRCbb0r3FC9D++X4gxSgVOEGv8wFPY3BL7I
 RNZFfyKbCuLGhJ0M+Jg==
X-Proofpoint-ORIG-GUID: IkYqGJ-FibD_nYENS4lWlkuy58sGqjf4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_181523_839200_A1F64B86 
X-CRM114-Status: GOOD (  17.31  )
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

coresight_get_enable_clocks() enables the programming clock through
devm_clk_get_optional_enabled(), which also registers a devm action to
call clk_disable_unprepare() when the driver detaches.

After probe, pm_runtime_put() allows the device to suspend and the
runtime suspend callback disables the clock. During remove the device is
left runtime suspended, so pm_runtime_disable() freezes it with the
clock already disabled. The devm cleanup that runs afterwards calls
clk_disable_unprepare() a second time, underflowing the clock enable
refcount.

Resume the device with pm_runtime_get_sync() before tearing it down so
the clock is enabled again and balances the devm-managed disable. Then
pm_runtime_set_suspended() and pm_runtime_put_noidle() leave the device
in a coherent runtime PM state (suspended, usage count balanced) once
the devm action has disabled the clock.

Fixes: 1abc1b212eff ("coresight: Appropriately disable programming clocks")
Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 9e8de4323d28..eddfdcbaa3ec 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -299,8 +299,16 @@ static void itnoc_remove(struct platform_device *pdev)
 {
 	struct trace_noc_drvdata *drvdata = platform_get_drvdata(pdev);
 
+	/*
+	 * Resume the device so its clocks are enabled again, balancing the
+	 * clk_disable_unprepare() that devm runs when the driver detaches.
+	 * Then mark it suspended and drop the usage count taken here.
+	 */
+	pm_runtime_get_sync(&pdev->dev);
 	coresight_unregister(drvdata->csdev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 }
 
 #ifdef CONFIG_PM

-- 
2.34.1


