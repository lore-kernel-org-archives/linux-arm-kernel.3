Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C8CC79F9E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 06:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C8wmw8b3Bm/wun5cSxqODNHcPjpz3JjNO33Mag0HZBE=; b=uZG+meCVpPmf9ChAYhSzrmtaAV
	vxsYTrZL9VasK15d8r7Awa06UBneg0lzRjwCPI7yMtkw1ddbZlbR25r9IUROtsFBxlRZXMwMGsZSs
	w4H91GYbVMSs+oxOaBOdM3WuaKiE1Czmi5A/UOfgMSdyMlSIEfQfLbh9kARjfk6R8KoSIho93W3kr
	trP9l0q+TaQcTfDlV89za3jPwKN1hxpX8oPGAExQnSoeM4bRpx8mr6hAygh5DWwp+baVlsG1ovXen
	FWvU3I+SBael5tPZq5XrD+H4KUEgVptgb+sKHnz9rFssb5rYFZ3zPGawjrL4kekLuNGJ9ycqrgcXO
	KH1UEuyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3SSJ-00000005zAI-3TZQ;
	Mon, 07 Sep 2026 06:03:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3SSG-00000005z8l-0IYv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 06:03:45 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873l2AK1699689
	for <linux-arm-kernel@lists.infradead.org>; Mon, 7 Sep 2026 06:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=C8wmw8b3Bm/wun5cSxqODN
	HcPjpz3JjNO33Mag0HZBE=; b=URri57Y1JmGNjsB1h3r/99n3cw1gW4FWqWFBUc
	E3Y0rgHwZwO54fmYstEb1RPOuai6eiuAr1sE73wE5IgbKcn0ege0LTbWcycc2Vdr
	xzBhou5XgaiM6jiwHmXuaMGz3zvQB2IL7MQzWicc6lY9AZT2aJ0818xKvoLWB62i
	gFrh56ykPs8m15VBEqq92GWeaRZkh4owMpiXawvKose6/jv0vePhooavIPabukso
	lAMOHAxzlvxd2SsQ1dkvLLQJoL8L0s2PtaaloetDclxmRFgCt66hIdtcOWkYHZD9
	PZyuObY2w7vUOtdF57lf8pGosVafkT7mFhP2sOInL9K+EjHA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggc8jd5wg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Sep 2026 06:03:43 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso3937759a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 06 Sep 2026 23:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788761022; x=1789365822; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=C8wmw8b3Bm/wun5cSxqODNHcPjpz3JjNO33Mag0HZBE=;
        b=AhN7Ojb4NLKt4+Zik5tjM5aa7sm7XgXqoib9J0vkFNZIi4sYdXi9Pudl0FfT1rg4CS
         7r9tjMN91/UAJ+CXUVnDo05JMdtvh0mBZuBPWx2n5JhFTZKGeS66g6EUNp9exYwmCw9u
         ghSErHAel8AVZK8J1zP4wZ3pbizJe+cXTqG0bH2/5zB2qtakxKLimw+FGuq1BSavQWn4
         2OyTzRgsYQEPmus8RRRbkpMQ00w6cWGEP5IrMMavmTBjsmt0BNIr+US6hlcJgCO5yTA1
         f8A1FxO8dzhQ3Psd9mpKfeMnOsSUCrLo+J3D3Vw42JODFm8uSjFun2kdX+8d1k9TvzF4
         cTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788761022; x=1789365822;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=C8wmw8b3Bm/wun5cSxqODNHcPjpz3JjNO33Mag0HZBE=;
        b=AE8hkyDEvwPffAWtIHfPzbTD0ttf2cH7HQsHLtctZXePJeVjxpws6rMTA9x1Eo8xMM
         UonRPK3YnRFXfobiEQChR7NJffQjsfO9TJk8sJbquOqSBIBAZmIrgLZOkQBNQ6BVSsqW
         Wj2OQFgn2sbAnuupuTlwSPumqtvO4Qr7FhGzeppZGKErDtQjjbYKnVbx4/qDv3AB72QI
         jqca0DRubDfbQ5mSyft27rg7ab2ZOA1IUvSMbyLsaC9O5iPvqr6GE6VmB+HFrNTdWNRD
         5d+zeU8FY+lnteHYmcw65NuZxZX35pn1IsgKP0WPLT1v8yWbJc3wUCWkkRV9/WKpiEUx
         uEQQ==
X-Forwarded-Encrypted: i=1; AKwUvBzRd5x0wtYqTO+l9RzrGsw2OjzDZ281H1/R7dztWtC13Rau4uJAVzK3yEIFzTXak9UqyNCHTQ8BHR1NIOLMDaQ1@lists.infradead.org
X-Gm-Message-State: AFuF++nItu/BbmOc7EQWB1LMjNV4BRJW/oJbOr3XHeErB9KnvmiTduxt
	pv2sEP5qThflxjVfwtR/JBvuM0gQP5h1g/EsmSNt+nczFSShI5RebjCW54DjKyLZ73O0pO6M8h9
	UFAodP6SPigzvJN0y0RjmeOOqF6e9Ia4TWfPPQ6UZ7jA9LSGQxQmszXHYrYr+GSufFdzNs5PmJ+
	qzHg==
X-Gm-Gg: AYBFou0G+Icbg85sCk7y3voRHgzIJ1M1dZ8mY/upTJnOK20F7XK9hLlM0K1EKAJnbti
	TNwuJm8JOqbaYd3esqmzZjaPUrEdsvK7A/nM7o3g46OuzsTEHUVj3NklT1gSt68aL84Osu7oY7I
	ApljHE+qLw+mM2TjlNdGTuSImLBm+Lequg35z5Vtfc9nxGouxBpjKIX4/QefCPExvOTi2IHk0GL
	0O4F8wLWaZKmazsLIwnzZzR1gIbsTbjlmBs/1fz0IOjrRrC8NBIpAcc7KBEJpMVOx4bNAuxXE2l
	fa+GepN4Qke/hoDf3i7WGXMrrHJRSgmKiopp5wy0QFZhIyvGx9zxhZZ7EMo5hErB837ZX+u4XXg
	Bm7BKsaN6n/OfunupN9VIc/R2N1/ZScAjGPnERk2hjYGQ7ht7FnwFAejXqeCknRo=
X-Received: by 2002:a17:90b:4d85:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-39b2617abf0mr32355063a91.7.1788761022120;
        Sun, 06 Sep 2026 23:03:42 -0700 (PDT)
X-Received: by 2002:a17:90b:4d85:b0:37d:f206:a2ac with SMTP id 98e67ed59e1d1-39b2617abf0mr32355000a91.7.1788761021530;
        Sun, 06 Sep 2026 23:03:41 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm18750743a91.9.2026.09.06.23.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 23:03:40 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 14:03:27 +0800
Subject: [PATCH] coresight: Fix clock refcount imbalance on platform probe
 failure
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-fix-clk-issue-v1-1-efe81fa2b697@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAK9TnmoC/x2M2wpAQBBAf0XzbGovlvgVedAaTLS0E6nNv9s8n
 jrnJBCKTAJdkSDSzcJHyKDLAvw6hoWQp8xglKlVqxqc+UG/b8giF6HTVFnvrDVOQW7OSFn4f/3
 wvh+opaHHXwAAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Yeoreum Yun <yeoreum.yun@arm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788761017; l=9099;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=qJqU34m8Z4NoF6i/4qh5n6yxeIUMc8E/efYlRGRjlII=;
 b=nsqeBI4mqI4x+pTl8w6VRmGIzthWLP9IGiRZoW6Ssch4DmVCU66VGR8tpMCrWuYVCnsFt13EP
 GIybSToGghHCDVQKUe7sM7TiShKKcQS5Az/IWIRMcc0WUmq5YnML++9
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: UJGl2182eGwMoytd5o29hkbQLg3mQ_WB
X-Proofpoint-ORIG-GUID: UJGl2182eGwMoytd5o29hkbQLg3mQ_WB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDA2MyBTYWx0ZWRfX6bD7mROzyO29
 xsVA/UXiIh1IgYzAW6JT5Ml1IRK+f/+WdF1SQqQZP/mo9s7KbXS/BqZyMOJYXwXrtKlCJ/eWRxf
 hKIA2MC1sypTBb2FehYp+JU7lvVuCC94JvWQUl/eWdo2RihDxBwSUt7zgZlP4sxeWKGE9sg8Swb
 MV8LxSC85zSdut1CbAF2N2ZoxemL8U903IYmqyphK6XtGuEpiNuRLpM9LQL0aCR7B5k4axEEr+H
 gtLKox1WYjSruUnyWGZuHetm6KppTzhPc+9aAaRPaHEkZBNPXvxrvKx4WMog32DJf6Hr/hZq2fs
 YIJFROWCXgB143XJO1D9Rsdz04GsgiDFgaKMHKupSoYtmzRfJquOF5BkvFwn6koLnYSYvhI9rEN
 AUUwcPTID5hkv3Um6t0GTMDR6hZScLUpnI8EgP8B5nfjmVU2/aevkD637avLSdah3aEn39kWjRK
 3MxEJ9gxsqpTYZTGBuw==
X-Authority-Analysis: v=2.4 cv=DYgnbPtW c=1 sm=1 tr=0 ts=6a9e53bf cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=3lXbaw0bqDP-cecxZ04A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDA2MyBTYWx0ZWRfX/E4DGZNMusev
 npmUOhg4vtACEI9W+P3Ms2exC0RQu8MdN3W0nmfHh12IMDf6Ufj43hGfYJ/0v+4sLwXxzT44N1z
 /2MqoSseazadWUs3s/o3vVW8OwZIeCI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 malwarescore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_230344_145080_81189E4C 
X-CRM114-Status: GOOD (  18.56  )
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

Each CoreSight platform_driver's probe() enables its clocks via
coresight_get_enable_clocks() -> devm_clk_get_optional_enabled(), which
registers a devm cleanup to run clk_disable_unprepare() on driver
detach. The probe wrapper then unconditionally calls pm_runtime_put()
regardless of whether the inner probe succeeded, so on failure this
also fires runtime_suspend() and disables the same clocks a first
time. The driver core then unwinds the failed probe and runs the devm
cleanup, disabling them a second time and underflowing the refcount:

  coresight-etm4x etm0: probe with driver coresight-etm4x failed with error -22
  ------------[ cut here ]------------
  qdss_clk already disabled
  WARNING: CPU: 1 PID: 432 at drivers/clk/clk.c:1188 clk_core_disable+0x1d0/0x218
  ...
  ------------[ cut here ]------------
  Unpreparing enabled qdss_clk
  WARNING: CPU: 0 PID: 432 at drivers/clk/clk.c:1061 clk_core_unprepare+0x248/0x268
  ...

qdss_clk is shared by every CoreSight node, so the extra disable drives
its refcount to 0 while sibling devices still expect it enabled. The
next funnel to probe then touches unclocked hardware and panics:

  SError Interrupt on CPU1, code 0x00000000be000000 -- SError
  Kernel panic - not syncing: Asynchronous SError Interrupt
  ...
   coresight_clear_self_claim_tag+0x7c/0x1e0 [coresight] (P)
   funnel_probe+0x114/0x2e0 [coresight_funnel]
   dynamic_funnel_probe+0x24/0x70 [coresight_funnel]

Use pm_runtime_put_noidle() instead of pm_runtime_put() on the failure
path so it drops the usage count without invoking runtime_suspend(),
leaving the devm cleanup as the sole disabler.

Affects catu, ctcu, etm4x, funnel, replicator, stm, tmc, tpiu and tnoc,
all of which share this probe skeleton.

Fixes: 1abc1b212eff ("coresight: Appropriately disable programming clocks")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-catu.c       |  9 ++++++---
 drivers/hwtracing/coresight/coresight-ctcu-core.c  |  9 ++++++---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 10 ++++++----
 drivers/hwtracing/coresight/coresight-funnel.c     |  9 ++++++---
 drivers/hwtracing/coresight/coresight-replicator.c |  9 ++++++---
 drivers/hwtracing/coresight/coresight-stm.c        |  9 ++++++---
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  9 ++++++---
 drivers/hwtracing/coresight/coresight-tnoc.c       |  9 ++++++---
 drivers/hwtracing/coresight/coresight-tpiu.c       |  9 ++++++---
 9 files changed, 54 insertions(+), 28 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index ad8dafea7d2f..9a59a1f9e7fd 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -632,11 +632,14 @@ static int catu_platform_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = __catu_probe(&pdev->dev, res);
-	pm_runtime_put(&pdev->dev);
-	if (ret)
+	if (ret) {
+		pm_runtime_put_noidle(&pdev->dev);
 		pm_runtime_disable(&pdev->dev);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_put(&pdev->dev);
+	return 0;
 }
 
 static void catu_platform_remove(struct platform_device *pdev)
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 9043cad42f01..ab0232537523 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -251,11 +251,14 @@ static int ctcu_platform_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = ctcu_probe(pdev);
-	pm_runtime_put(&pdev->dev);
-	if (ret)
+	if (ret) {
+		pm_runtime_put_noidle(&pdev->dev);
 		pm_runtime_disable(&pdev->dev);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_put(&pdev->dev);
+	return 0;
 }
 
 static void ctcu_platform_remove(struct platform_device *pdev)
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 2247ad55d444..ed102f6203be 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -2330,12 +2330,14 @@ static int etm4_probe_platform_dev(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = etm4_probe(&pdev->dev);
+	if (ret) {
+		pm_runtime_put_noidle(&pdev->dev);
+		pm_runtime_disable(&pdev->dev);
+		return ret;
+	}
 
 	pm_runtime_put(&pdev->dev);
-	if (ret)
-		pm_runtime_disable(&pdev->dev);
-
-	return ret;
+	return 0;
 }
 
 static int etm4_probe_cpu(unsigned int cpu)
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 0abc11f0690c..d75f11fda72f 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -319,11 +319,14 @@ static int funnel_platform_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = funnel_probe(&pdev->dev, res);
-	pm_runtime_put(&pdev->dev);
-	if (ret)
+	if (ret) {
+		pm_runtime_put_noidle(&pdev->dev);
 		pm_runtime_disable(&pdev->dev);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_put(&pdev->dev);
+	return 0;
 }
 
 static void funnel_platform_remove(struct platform_device *pdev)
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index 2f382de357ee..3fe5eb5a7a0c 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -298,11 +298,14 @@ static int replicator_platform_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = replicator_probe(&pdev->dev, res);
-	pm_runtime_put(&pdev->dev);
-	if (ret)
+	if (ret) {
+		pm_runtime_put_noidle(&pdev->dev);
 		pm_runtime_disable(&pdev->dev);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_put(&pdev->dev);
+	return 0;
 }
 
 static void replicator_platform_remove(struct platform_device *pdev)
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index 4e860519a73f..5de0adf1d33a 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -1011,11 +1011,14 @@ static int stm_platform_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = __stm_probe(&pdev->dev, res);
-	pm_runtime_put(&pdev->dev);
-	if (ret)
+	if (ret) {
+		pm_runtime_put_noidle(&pdev->dev);
 		pm_runtime_disable(&pdev->dev);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_put(&pdev->dev);
+	return 0;
 }
 
 static void stm_platform_remove(struct platform_device *pdev)
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bc5a133ada3e..2481bae5c9f3 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -974,11 +974,14 @@ static int tmc_platform_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = __tmc_probe(&pdev->dev, res);
-	pm_runtime_put(&pdev->dev);
-	if (ret)
+	if (ret) {
+		pm_runtime_put_noidle(&pdev->dev);
 		pm_runtime_disable(&pdev->dev);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_put(&pdev->dev);
+	return 0;
 }
 
 static void tmc_platform_remove(struct platform_device *pdev)
diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 9e8de4323d28..d06731c45a1a 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -288,11 +288,14 @@ static int itnoc_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = _tnoc_probe(&pdev->dev, res);
-	pm_runtime_put(&pdev->dev);
-	if (ret)
+	if (ret) {
+		pm_runtime_put_noidle(&pdev->dev);
 		pm_runtime_disable(&pdev->dev);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_put(&pdev->dev);
+	return 0;
 }
 
 static void itnoc_remove(struct platform_device *pdev)
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index 7b029d2eb389..9ae94dc553d7 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -271,11 +271,14 @@ static int tpiu_platform_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = __tpiu_probe(&pdev->dev, res);
-	pm_runtime_put(&pdev->dev);
-	if (ret)
+	if (ret) {
+		pm_runtime_put_noidle(&pdev->dev);
 		pm_runtime_disable(&pdev->dev);
+		return ret;
+	}
 
-	return ret;
+	pm_runtime_put(&pdev->dev);
+	return 0;
 }
 
 static void tpiu_platform_remove(struct platform_device *pdev)

---
base-commit: af5f12805e5cefa4fe68d6127c7e1fb78cd5535c
change-id: 20260907-fix-clk-issue-51e43c533250

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


