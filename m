Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9B04C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 06:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3hzOvvQKWdguYtkPt+A8OQtsnHMjfxs8678kX7F8cLE=; b=RGt8hOk+QqWu71EkMLfcYvmy0w
	za0n0UqIaAYXDgPisyhbKOlHZlItEd+iPpTBrKwjd5i5RF14MBqpl42a6jCYrRHMeiYh18G5oPjfY
	Pk3OZrIrbimftxkQrD8JsApWVfvIEV7b27+yx7iFEjLUBSNycx+JjKiwHe4vCg9FPFjrtR9z+0pdQ
	zaobXR2jNztB7sJhyaEhpkROe2UMhVek14+45y/1xYXx1YlAWtk4YLrOQCi3CaZA00j966hn+DvwC
	bucKhgOvKyxK1DHJSkXjHgTSmxSQaNuad7JZX8mPWKS88MdyFMFPT4A+DroomDsc4KO30TWmA2WkB
	8yqIwVtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weo58-00000000leb-1sHA;
	Wed, 01 Jul 2026 06:05:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weo53-00000000lcG-0s8c
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 06:05:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615m4sj126579
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Jul 2026 06:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3hzOvvQKWdguYtkPt+A8OQtsnHMjfxs8678kX7F8cLE=; b=PVsHKBLxQM+zMQde
	pQQfduVNwjXCTfsMXMLExDZzFsdxaNB1XpfVT+/Tl8JTpaP7xSAPkawxAz26bnU8
	p9C9HhcPINArAGEPmQLppk5w6p8OwuDr9TL12mVHQ15FVUILo5S07OHlhDpNfGNY
	/SmA1wqARsyjSpQp8B+F/AidHBYorsm/09Cy/HX5NW/U5Oqj4KnI+2KbJsdg9FGF
	m2Vw/1lLJGJ0qdloWvxY9B8gzyBtyawIam58eJ7WpSZTXiRzH+qMp95piLp2DByl
	XzvLko4W+ZJ0Jtp6WgytLTxnQwpOcimIYssWMdcFDVHBKOUT50IK8BlKHg8oPNzN
	GElFXQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4fc0bmcd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 06:05:52 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c894c1c4aa9so207862a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 23:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782885951; x=1783490751; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3hzOvvQKWdguYtkPt+A8OQtsnHMjfxs8678kX7F8cLE=;
        b=TMi6LHwsQtywxfz4xSY488Y+Jzy9IrHa7xNnOqsmy7536IuGeWVSWxUb6+lRkpu/5E
         Rq7TuYJoXIGKXINNWdb5z9I7rnxiM1AmyO4i53ld3khN0vkNWFIrRb7u80gu3A5zzHMD
         IjeS7jLMXZwiyVl+G4Fx7xrQ2d+8hCxBqbOdiBgSMW2EAnLbXeMyx6aW6AjnPRuN/007
         TEE8Q+Lji5u208/7ZdmBXnO1CUPQqlG7GNZFPeOBZv5A72u7NmOdTOkjfOgiND5DMpBm
         DTixWT8BLZyFIjKWsV0mhi69GerMCoCjKCLSxoWSPIAqA0+1sfFRg8/7MO/+41yES5O6
         2lIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782885951; x=1783490751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3hzOvvQKWdguYtkPt+A8OQtsnHMjfxs8678kX7F8cLE=;
        b=goG1S0F6f6z6z/CsvZ0zShZOUMqLjjDzfB9iYTcEgnkO6QNb7cxkvN/PhU0jwhPb2g
         N+IPg6tNZ/zn2ZGhhqqljtGl4Q9oJatlBOeY8oSHd9o+0SYsj76/Ds+tZCFZBYQkTgeH
         0nbpukggoQvx25sJU5qbpz4nCBFG5jnTStOMcBFx98l10F3/6pb1BWU9oRSM7cGrgcpT
         keFfFaYYLrmChlcZ3rwPYFVMbn7rp3NXf0pJ3MyP86VW2Ryp/U6IuXDJhZjzjWITl97f
         agb5MgOZDG35JKuMMGR1UeLNJ78nW/Mz2De3UtG0YjVXdPr+6Ee7ZWjdJpXaYG5F5kLf
         B2CA==
X-Forwarded-Encrypted: i=1; AFNElJ9qLrtAvMcPY3qNgkGkw2O4R6cGnOC7S0WeqGWcF5dTpuxkbtMcWirA9rn+RxGT1HnrUKM4DVZKkbUpeZDU+h/s@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0kMQDwjM86gBNEp/x42nxTP2C5hQyfRPB6DvHqIJlVeC2S0qc
	RIEOEZXtexmRvfuPA+7c3eOft6y3Aix+QyNVJRHYLP/gGqE24nFuXz/aL32jugTxClNuO/GBKaw
	9NzP9KHlycjjnhtuxL/DX8lOrgwX+gKA/NMSE+Dlt0i34I8F85vWWW0pwMbBWE3qaIV2DT/MHH4
	jILw==
X-Gm-Gg: AfdE7cmTYUUouV+CYNS9zendYENg9T5Y+ju6hrsn9QuHi0x7CwJtb2mqD6SP+LUj4Lw
	4TwU6TQCIbHfoWOtDYLBksM2rH81raOKHVyLAbiLdXUHI6VR7Uu39GME1J0Dr8C4AVfQttAcbnM
	S+OjEr86569JFf5Ke2+vMGUzZ2B6Yuqqugo3Pz5Dmk3TBs1F4Q8zuqhTvMDa+Ml3Fx6fyA7cC7H
	4KG3iFIwJV9cEIOefOJP5+D2ujH+C8Bh9Nnz5xhzJ8Y6SgyX/Qat6bB2/3NQx9TnIHqtw7bzW3Y
	42SVJRrTMRBd63EJo0jaIPrAYiuHDLdyvpVSZ7wTslIYyPpqScyGzJl9rhERJv2hfuSFUiuLeHQ
	LcOJl4YnbwhOgOUYk+3UHfC9VTufniXOy5dJbPykWLxZ9t7rM0k9drjCAEDVcggnM8adEWhobSQ
	==
X-Received: by 2002:a05:6a00:2d96:b0:842:4982:82a with SMTP id d2e1a72fcca58-847c08af565mr183078b3a.45.1782885951140;
        Tue, 30 Jun 2026 23:05:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d96:b0:842:4982:82a with SMTP id d2e1a72fcca58-847c08af565mr183048b3a.45.1782885950658;
        Tue, 30 Jun 2026 23:05:50 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cc6f2sm3317658b3a.30.2026.06.30.23.05.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 23:05:50 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 14:05:03 +0800
Subject: [PATCH 2/2] coresight: tnoc: Fix clock refcount imbalance on
 platform remove
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-fix-clock-refcount-unbalance-v1-2-321dc63c1f90@oss.qualcomm.com>
References: <20260701-fix-clock-refcount-unbalance-v1-0-321dc63c1f90@oss.qualcomm.com>
In-Reply-To: <20260701-fix-clock-refcount-unbalance-v1-0-321dc63c1f90@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782885937; l=1478;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=NCCuaWYH56yc4jsljXsw5WSLi4PnaOm05c4E0yC9dIc=;
 b=xIWQ1o/Enc3LrxgE+zJBk+Rq2NAbYnrCtsgpWAbMHgw9Q/m2Yolfn4OfKYdQgoB459di45I0T
 xveurW8Df8GDxHms5/6I2vPiBmPd/tUExKAOFXO4ddefJo/7hVne1Jy
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA2MCBTYWx0ZWRfX8FskakB3cgWR
 8Qb7a+tkphMzKK1KY6wgKCz5iPejSb/FhAfOjhNdpBBeR0SRoioe/FN4lYF4O6626qB/j6TvcEg
 RlzCsgcGEwHDjsdAimlO4RXOtC868HC4CATyH6fOKSv2El7QRrrruuqcYn/cbqiCxXJu4qK2qbV
 5kOfJdEIe4fW8bse1ydE2KDjdAlmYNlCNN8G12XgsQOsDnyBnUgZJcpG2YKxzdDnXxfPfZATgMv
 WL29MjMXNyFPXSrFMurVFOsdd+iZcrSKvmufw+h5j8JKaryf4Qv/L64xj+LCc++rIMO1nMbBso6
 +GcqJhJshbSIMsFdTafjSAVcSuRz3Cjnk3nuqxoDdLnKl4iSEpnXBCwvlXTojh2QdnFXsjodv5N
 uzyx82jL/X7M9dgVaiv55b9/7oifQa0TqxKwBwvnuehn3xqnh/Vpc6KXhKh4RkJGyloSXblFskU
 ASsYEvdDtM/hXOoIcFA==
X-Proofpoint-GUID: WESo-HsyKs5g2cLrpui5X6dkZkoI8jRQ
X-Proofpoint-ORIG-GUID: WESo-HsyKs5g2cLrpui5X6dkZkoI8jRQ
X-Authority-Analysis: v=2.4 cv=Ivkutr/g c=1 sm=1 tr=0 ts=6a44ae40 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=4fW1H2bpnNfDCpRz6dIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA2MCBTYWx0ZWRfX9Rch0rvEhG5g
 tdVQQ4vt0ki9THZuL7HP87aNMA0e6J81CzGAddSU1wyv50zaoDzVaJu4j2fqFOe6NqsbHqFKmax
 KNvzdTPT88eJSrA3T4m1E3DUYm7aQcY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010060
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_230553_378845_F8EC7F8B 
X-CRM114-Status: GOOD (  16.10  )
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
runtime suspend callback disables the same clock. During remove the
device is left runtime suspended, so pm_runtime_disable() freezes it
with the clock already disabled. The devm cleanup that runs afterwards
calls clk_disable_unprepare() a second time, underflowing the clock
enable refcount.

Resume the device with pm_runtime_get_sync() before pm_runtime_disable()
so the clock is enabled again and balances the devm-managed disable.

Fixes: 5799dee92dc2 ("coresight-tnoc: add platform driver to support Interconnect TNOC")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 9e8de4323d28..a4ac0eb02248 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -300,6 +300,7 @@ static void itnoc_remove(struct platform_device *pdev)
 	struct trace_noc_drvdata *drvdata = platform_get_drvdata(pdev);
 
 	coresight_unregister(drvdata->csdev);
+	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
 

-- 
2.34.1


