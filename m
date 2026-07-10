Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6C2C44501
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 01:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SNRPETvOBrdTccDym8kPa39iz5LMbvC8/K3rZA2zfJg=; b=Nj/h2RUkKBejSQ95i+4U/ou9ZO
	wEOQdXcCdx+WXYmNLaABBebqPlCvsZaJiXn4Gf9o9clDvmk6/8OnEFFhBjebBFyMcOzCb4a0ektB/
	iyu5qxLL68cvvFYI2HZFkFFbOU2S4h5dmZXo9NCF5s2l12Kyyyrc/LnCRk98a8JECbguIxv8GpRn4
	EjFo357zEgCoZulE8Xt5bq7ty6S/PTlyLBM9RIb5EWTGBFzQ5Ku102W6AJmTmxvCCYnmaTcRkfb5R
	qTZwD8VaKmLpO5MIDPvruS8tDaRhmfXefFRytaC4luKQU/2rInTw0cb5yJ8zQjnugxcU3VOsgJHHi
	TlkiH1jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whzpq-00000003uMc-0QBI;
	Fri, 10 Jul 2026 01:15:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whzpn-00000003uLs-1cIn
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 01:15:20 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 669JUkRD2556963
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 01:15:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SNRPETvOBrdTccDym8kPa39iz5LMbvC8/K3rZA2zfJg=; b=nnVS1p25ngrUHNqW
	3dm6x+WHBvo0xmK/JYy4HazK7nIa1HZ6Y9r+S0Y8J2Etw6/x7+v3AAKeevLQjVb/
	vrmcbKbSjFMos3M5lx82N3ld9xuq0wfAO7RxQGhagm96TpmcJWknYtdSNvgNPNK9
	l7AWEuysmys1BSfuqMFxns1v+DwUzTVGt//yd/PQh+Lr5Jo/F9i37cwTtqWFJHQ1
	jYeVW/zzioRXHXuxjDwEhWx4pQRP8lVEYgrzXU5VIUO5XspH9bJHhYO+uubojI3o
	qe4TyM1H+KAitlAJC2g6O6bqCxp17XsQdNfCUNvcnAPRbs6AA0oPNqMtM8WbhLT6
	/sHClA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fahv8gyx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 01:15:18 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c89956023dbso549919a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 18:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783646118; x=1784250918; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SNRPETvOBrdTccDym8kPa39iz5LMbvC8/K3rZA2zfJg=;
        b=DWsIDigPID6LluB761QuABruZOWcX4YxYt7yYLX3do4vBM2R+xTxjvdgQ1vRISvBLy
         xziEZlCfc/XF86Js4bwp6vsCJeq3H7UERL/R+y4xBn/D6ZBoEzVRAP4bOHkRXvrpjOh9
         Qp/U6BLXvFlhgA8T6Eu1pEHkHkY3wrc5y0DY7ltwXU6sxSxE8AkNijwRO1mbp2jMklZY
         XG3epfWd8izUm6sXDpcApo7/58ji3tjf25GMIvljz86QawhXQEpJTBbZW+leHrIaXNZG
         AAYhJJxSzfFQnJK7/LMjqZUjncWgHrPPYiW+eljd9FLvHzIKtq7u4sUCoQJ+zCFlFlVl
         Wahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783646118; x=1784250918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SNRPETvOBrdTccDym8kPa39iz5LMbvC8/K3rZA2zfJg=;
        b=XcqfXXK9g8XcTy2WIXz7f4r7VyhwtyTIo3ZtyVtc3k3LDo/dUszDjHzBniGGexEd5N
         Fy6rK+TRsVYysc2a0q+0+McEJOuseakk3EC8xjy3YG7mzsGiuqbvAz1DB3DjINvswYl+
         /HCwuxwU14FkHHWbOZB+iwPlILV1LIA70Pczis/L1R0IaCVFTGQivSSyjv52m2qCMyPD
         IzL3FZRd+93T+2/fOjNjVE2RYxBucck/GrdIADQpUozxYNgsT/Ol3R4Tuud8bJVJ/9zE
         w7kSKPL3eeqPbzM1yYSSUczr66cRGspd/o5FowWDa/8ytYVdgsV1ziA8PpZ0cPedR1dD
         0bow==
X-Forwarded-Encrypted: i=1; AHgh+RpMTaJCD4Na/fINNutirVlRRaWyg7Ia3zEdEhcWf2dOROig2KXtquL54xZtqwwn6EsUyiPDaz2oGj8HZ7waPnjU@lists.infradead.org
X-Gm-Message-State: AOJu0Yxwhs029h76yz1O8SHTu7VPikS1fhegph+VG3yzSWyWC4VKuFQ8
	DdCzAHKIu/U6w2u2mC+1csPpywyqcZMqvokoHbyC5DulNtfkIO6j0ACUBdS8i4h+Jiia88CljAO
	Hlr2UgYSdWXUOtgJCP4GbLIO48ArCD2//rA78uW7RCeCNdo6HrRUkvHv3BXUsv18w/5cKebHwzB
	dP6w==
X-Gm-Gg: AfdE7clOq6JQiYwZesESh45xywyXNZc7FfxaWKqQP6OMkAtH0MsNw5VyIjpRdOo8V7z
	wUbfZomOoWuA4zkv7SrhFanVfk8lNCW0vd5vVHkrotcw7sCOX9yln9nmykkV/8KHFuNVRcp6CxJ
	/eeWXT9bIdIdO29ERTZgB5YPGFXvi69lI5M/dym7x2GIwkitpZVzD8MPCK9/bDIM49R1UqDRCDl
	1HtAoDyzc5AkdmysZwa5NiRlrxH9HktP59VCNosxahDg/rVvWvwY25e0Ql/UcmiFevRTYNgSvOK
	VlJVAorVUOyoB66qmt7GMuGVAQBL/jMv2R+xxNGt3Wg17wnGLxMqGf1Ts44mO8k+HNEnziqkNoy
	pVeVrzpCnxfPSWQB72FhkVjufgXNl9K0HoYg1cCkJRByAt6n9imaU0VFaaLXMQq5B7+6TG0zmow
	==
X-Received: by 2002:a05:6a21:497:b0:3bf:b182:94b with SMTP id adf61e73a8af0-3c0bc8c4f4cmr11531104637.6.1783646118022;
        Thu, 09 Jul 2026 18:15:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:497:b0:3bf:b182:94b with SMTP id adf61e73a8af0-3c0bc8c4f4cmr11531052637.6.1783646117407;
        Thu, 09 Jul 2026 18:15:17 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b31628c1sm4431251a12.19.2026.07.09.18.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 18:15:16 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 09:14:47 +0800
Subject: [PATCH v3 1/2] coresight: Fix clock refcount imbalance on platform
 remove
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-fix-clock-refcount-unbalance-v3-1-a37a1fb17981@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783646107; l=9543;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=CaRcTvjJkzeu56Wpzri+PpTT/TNFxhgZxAMVCjmhO6A=;
 b=vAZYENsx4qUWBBBCeTvVmUT4isF/K64l25/OABZ6PLWQNFqIRsqm4g4hB1SBWoT4zy3ZaNO2q
 hM3dlTJNPAfBZOMwSJ4c5FDzuGgj23S1+SiXGK9OczVGCO9mePbup3N
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: KzF8_JBpk-gFvftwbYefQa5R3BATo8-c
X-Proofpoint-ORIG-GUID: KzF8_JBpk-gFvftwbYefQa5R3BATo8-c
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAwOSBTYWx0ZWRfXysSbt1v6e1OR
 Gfvv5a+S0l5zhh/3+Fi3FtpldOQmFof23qNTlTCxawkt7affXrmqvygpos5d2XRmf5qUK4Al7QV
 o5OimPo/uzgbl6NVgTeQKyvMPfPih/w=
X-Authority-Analysis: v=2.4 cv=funsol4f c=1 sm=1 tr=0 ts=6a5047a6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=RgdK3QP1sc-eABpqATIA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAwOSBTYWx0ZWRfXx/uBXy/osYgZ
 3swMx6ptew/EV2c6HTqk/zTLz/BGTZKszIAXb7hKQObDSb5mmEyS017csZwE/tNMtUeCaNaj8D8
 CBvrVZrSHlWpgzjHYnHBLcCHwxEhSoGOv7+4ljFtSMYTHAPx3zH0szgveaaougzyEUOmP8Xw6RU
 yAHYdxQj+g+4nC9qyd3zJMr2xwqEDrE2TCs80l4vTG5DsHar/xd5zp7ZW5Edqo877cfxCacCVqX
 34U8t+jg7U3qIEBfmrnSOfE2xnSjpqlCfncJEL6LkBZQS6DYUfIJqs9ikFdHEVAndTiKT5pirBW
 Bo4lnabCHlsafZCwojgHoW1+zzuqYpOnHaWLtqCGjJz+0nSO++U7TpTIdllgve8UgrP34mGd4Ns
 lTE8p0e225HSeilfdo/vfOixeD9ilXEVsIhqxLURZP/haGnQfbltYsOcAH9LPTkuGop9zlQysYA
 Q5BgGdPS7yHl9SXVyxw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_181519_440628_7D0042FE 
X-CRM114-Status: GOOD (  19.91  )
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

coresight_get_enable_clocks() enables the programming clock and the
optional AT clock through devm_clk_get_optional_enabled(), which also
registers a devm action to call clk_disable_unprepare() when the driver
detaches.

After probe, pm_runtime_put() allows the device to suspend and the
runtime suspend callback disables the same clocks. During remove the
device is left runtime suspended, so pm_runtime_disable() freezes it
with the clocks already disabled. The devm cleanup that runs afterwards
calls clk_disable_unprepare() a second time, underflowing the clock
enable refcount.

Resume the device with pm_runtime_get_sync() before tearing it down so
the clocks are enabled again and balance the devm-managed disable. Then
pm_runtime_set_suspended() and pm_runtime_put_noidle() leave the device
in a coherent runtime PM state (suspended, usage count balanced) once
the devm action has disabled the clocks.

This affects all CoreSight platform drivers that obtain their clocks
through coresight_get_enable_clocks(): catu, cpu-debug, ctcu, etm4x,
funnel, replicator, stm, tmc and tpiu.

Fixes: 1abc1b212eff ("coresight: Appropriately disable programming clocks")
Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-catu.c       |  8 ++++++++
 drivers/hwtracing/coresight/coresight-cpu-debug.c  |  8 ++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  |  8 ++++++++
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 13 +++++++++++--
 drivers/hwtracing/coresight/coresight-funnel.c     |  8 ++++++++
 drivers/hwtracing/coresight/coresight-replicator.c |  8 ++++++++
 drivers/hwtracing/coresight/coresight-stm.c        |  8 ++++++++
 drivers/hwtracing/coresight/coresight-tmc-core.c   |  8 ++++++++
 drivers/hwtracing/coresight/coresight-tpiu.c       |  8 ++++++++
 9 files changed, 75 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index ad8dafea7d2f..b72fa7f4bdeb 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -646,8 +646,16 @@ static void catu_platform_remove(struct platform_device *pdev)
 	if (WARN_ON(!drvdata))
 		return;
 
+	/*
+	 * Resume the device so its clocks are enabled again, balancing the
+	 * clk_disable_unprepare() that devm runs when the driver detaches.
+	 * Then mark it suspended and drop the usage count taken here.
+	 */
+	pm_runtime_get_sync(&pdev->dev);
 	__catu_remove(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 }
 
 #ifdef CONFIG_PM
diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index 3a806c1d50ea..87b39874461e 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -710,8 +710,16 @@ static void debug_platform_remove(struct platform_device *pdev)
 	if (WARN_ON(!drvdata))
 		return;
 
+	/*
+	 * Resume the device so its clocks are enabled again, balancing the
+	 * clk_disable_unprepare() that devm runs when the driver detaches.
+	 * Then mark it suspended and drop the usage count taken here.
+	 */
+	pm_runtime_get_sync(&pdev->dev);
 	__debug_remove(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 }
 
 #ifdef CONFIG_ACPI
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 9043cad42f01..e0e33e3ca5bf 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -265,8 +265,16 @@ static void ctcu_platform_remove(struct platform_device *pdev)
 	if (WARN_ON(!drvdata))
 		return;
 
+	/*
+	 * Resume the device so its clocks are enabled again, balancing the
+	 * clk_disable_unprepare() that devm runs when the driver detaches.
+	 * Then mark it suspended and drop the usage count taken here.
+	 */
+	pm_runtime_get_sync(&pdev->dev);
 	ctcu_remove(pdev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 }
 
 #ifdef CONFIG_PM
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 14bb31bd6a0b..dd5d26717f15 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -2414,9 +2414,18 @@ static void etm4_remove_platform_dev(struct platform_device *pdev)
 {
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
 
-	if (drvdata)
-		etm4_remove_dev(drvdata);
+	if (WARN_ON(!drvdata))
+		return;
+	/*
+	 * Resume the device so its clocks are enabled again, balancing the
+	 * clk_disable_unprepare() that devm runs when the driver detaches.
+	 * Then mark it suspended and drop the usage count taken here.
+	 */
+	pm_runtime_get_sync(&pdev->dev);
+	etm4_remove_dev(drvdata);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 }
 
 static const struct amba_id etm4_ids[] = {
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 0abc11f0690c..d69cd66e8394 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -333,8 +333,16 @@ static void funnel_platform_remove(struct platform_device *pdev)
 	if (WARN_ON(!drvdata))
 		return;
 
+	/*
+	 * Resume the device so its clocks are enabled again, balancing the
+	 * clk_disable_unprepare() that devm runs when the driver detaches.
+	 * Then mark it suspended and drop the usage count taken here.
+	 */
+	pm_runtime_get_sync(&pdev->dev);
 	funnel_remove(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 }
 
 static const struct of_device_id funnel_match[] = {
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index 2f382de357ee..1df01deb2f69 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -312,8 +312,16 @@ static void replicator_platform_remove(struct platform_device *pdev)
 	if (WARN_ON(!drvdata))
 		return;
 
+	/*
+	 * Resume the device so its clocks are enabled again, balancing the
+	 * clk_disable_unprepare() that devm runs when the driver detaches.
+	 * Then mark it suspended and drop the usage count taken here.
+	 */
+	pm_runtime_get_sync(&pdev->dev);
 	replicator_remove(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 }
 
 #ifdef CONFIG_PM
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index 4e860519a73f..a75b1c56a867 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -1025,8 +1025,16 @@ static void stm_platform_remove(struct platform_device *pdev)
 	if (WARN_ON(!drvdata))
 		return;
 
+	/*
+	 * Resume the device so its clocks are enabled again, balancing the
+	 * clk_disable_unprepare() that devm runs when the driver detaches.
+	 * Then mark it suspended and drop the usage count taken here.
+	 */
+	pm_runtime_get_sync(&pdev->dev);
 	__stm_remove(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 }
 
 #ifdef CONFIG_ACPI
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bc5a133ada3e..ed40bfea32f9 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -988,8 +988,16 @@ static void tmc_platform_remove(struct platform_device *pdev)
 	if (WARN_ON(!drvdata))
 		return;
 
+	/*
+	 * Resume the device so its clocks are enabled again, balancing the
+	 * clk_disable_unprepare() that devm runs when the driver detaches.
+	 * Then mark it suspended and drop the usage count taken here.
+	 */
+	pm_runtime_get_sync(&pdev->dev);
 	__tmc_remove(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 }
 
 #ifdef CONFIG_PM
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index 7b029d2eb389..775507d0bb36 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -285,8 +285,16 @@ static void tpiu_platform_remove(struct platform_device *pdev)
 	if (WARN_ON(!drvdata))
 		return;
 
+	/*
+	 * Resume the device so its clocks are enabled again, balancing the
+	 * clk_disable_unprepare() that devm runs when the driver detaches.
+	 * Then mark it suspended and drop the usage count taken here.
+	 */
+	pm_runtime_get_sync(&pdev->dev);
 	__tpiu_remove(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 }
 
 #ifdef CONFIG_ACPI

-- 
2.34.1


