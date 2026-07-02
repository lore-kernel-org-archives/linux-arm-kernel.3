Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C3E9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 08:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7RfvxhoKMkOlLelhJkw1qbaw88LcKz5M6dptpjsm294=; b=vKvQjlSFr+1mwOE438emsMbGeP
	cunvO8ec5ieLpP/qX1rTUzwpSCRoWrD9l8FcEIP4/4Jw6ZlYPAEb6lYEHZTsFKTRjAXvF2K1GQwMS
	kSvjLiGh4rTBtDund8agpuTQdp6n0zTurZhW22KpmRO2TBofHdmt7kqH0WeGNVUigP+PYYyJHs/ho
	UDWdn0f1cby41j2TbANjlFiJy8wfMSgYhejzjodbuBiWkAVGNTQr1ulYUEfMcSCgx6wv7Sp+NRQbp
	jqEUDTNgDMdSbbHoH3MTUL+cn5uIf1gwRQHkl4+jbDSgUIYvvHz5kYFqpupJquOMqsG0+z7o/LvjF
	Wt+apP4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDCF-00000003vQx-1xJW;
	Thu, 02 Jul 2026 08:54:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDCD-00000003vQ0-0J2l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 08:54:58 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628Usoo3050472
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Jul 2026 08:54:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7RfvxhoKMkOlLelhJkw1qbaw88LcKz5M6dptpjsm294=; b=UdjXxVnjJ0Lbjepl
	d01l53LVjvEcanOeQJK2wxMwNiKU1tigR/ZvFltkTW/e93UaKIws7OH/CC7rqwzV
	fqocvkww9rDDafZZCQxQbLNy60p2o2G4nJ/6iPuswXBg7h2LHroyHpC31QyIodgG
	8meBgN5U3fQMmvZWoge69MGAl7v1c/WBI+lhUGIF7FFZSmTY3G/FWjfof969/xOj
	tsOGUTqYNSoKxQM/5ZwvRlWAafhdzBrn1M12po3Fo7TuXRxU1+vdhs7HHtU5i/fV
	8FW/FaAau1uuaGT4BmL4O9/BRe7qrYnZ0+uXXDQWQfG8dIfjmVz9FzlRUAdaHJqB
	6FgE9g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f56gpu6pa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 08:54:56 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-845ea8fd3easo3356652b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 01:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782982496; x=1783587296; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7RfvxhoKMkOlLelhJkw1qbaw88LcKz5M6dptpjsm294=;
        b=EKED5TjBBWa6m9kb8sseRx3L4ka5H9I/kpdDfiQx1eZ0OfZfZxBGOc56fMevfzOhru
         Cdz9YpdFl3/C7ch1iZUJZgthfb7/ZSJG20i6ntOHBYCWQ3Y0HWIceVzESn5OPY2FM0fC
         mHA/Je/Zf0Nq82rFVLZ+Lm5j6omi6NGxMQxORq+8SM40qwnCNRDntBAvf96wt4vXonic
         ERBGgCQ/TTXFeiQuqc/fYO5Xpbb7QvvOKADyZHGN4Gf5EwWJr4Sgqha+E2Q8vx5hf6zx
         1cHHxa126i75vG+ApK+IPLZOU7CB7fQKMHspEIR0eG4hI2OOuMTcjW0U6zHEH9UJWJTt
         zquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782982496; x=1783587296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7RfvxhoKMkOlLelhJkw1qbaw88LcKz5M6dptpjsm294=;
        b=Hc+BP1AV6uZ2cmWPcApkYAOXcwZNXd5SIxyOaFOiNNp/URQnFU2yUyXw6RU+Nd2Meh
         ktnUkOUL2o4B6iJFSFz7sZPGKPCwDCmfdCI9rBOzKo6aocxRigiip/aM5LUp6vsxRE07
         okd9uutYnAu4I6uzN7NFNkK6yyUUwWfx1nf8ic6akWRBmBrLafRLcyvtlAT9hkMQ0GVY
         mRxFVG4yGwDBRnpcE6MDsJjT6uIFb1NvGQmd1WLaXnALB50mWzSlCPNANChrjEvrAI1H
         CKr9nfRtPGRl1bffwx8xsZqnEEBEEK6L2vBuNF2tFr1wfo1Q/puI2FzxefA7NvJRTNta
         P6yQ==
X-Forwarded-Encrypted: i=1; AHgh+RqpJxDfPThmcNxJMcLrncuwlrcSkm9sgCxhmh5CqGugQwd1EGRVlzwDmjp8s9Esk6ek2C8QAzBbhwonZlkmKPhC@lists.infradead.org
X-Gm-Message-State: AOJu0YzzPRmNq2qWRC2yc6gvro2uYaK0Mszi2mMxDZbOByBrs3d83hum
	rugo5Ok9290IyMWnIHsSi0WEp87uBr3TspErI5zrRK+Wsf1SZskjXmIFhcRkfrctXDHavSLVEiT
	mmEiy+KZidsIPb/NUS190sahu4XCuBk++PnLvhNQTj7tydbjaiXzDJaOBHLkAEdcr/w46X0T3aW
	ncbg==
X-Gm-Gg: AfdE7cliVtMmKL2uVj1kwlkXIV2xVyT7ucFkRqXQIDGpg4Prq+9hW0RIzvS5oZiP/dF
	1NTh02S4KCvO7vEoL9F9Rz65PTsNeekZxJWdj7VEVq6ZfifsUCDnYDocYmEPAHhyzI3pkiOa01B
	rcS+RCEJ36kDlawpC3Y1y10QRGi8K/XPXMGeBvlQxk4GJ2rM5x6I63bXW6sn2KuPT1viKLZNs05
	9qwUbuuSrA+7P40QX6HnR8gMD3l9KbaHAjLunSJTIKybtiy8IgHKuMt/ddNjs8/JUXHboGYQM21
	+4ydcGPTihRe590HQJwA3GNbG1o5MdPdG2W+t/aRgZtLoA4KkbVSZi2Gr5nShymDADvib0+wera
	qzbV13SulSFjQItPEwIrtsP1pIVyztzpc5m9UooiBgX0xnN/OQQ5YpPcUQVafM1T9UwwJ/a3teQ
	==
X-Received: by 2002:a05:6a00:3cce:b0:845:c6c3:5e75 with SMTP id d2e1a72fcca58-847c5141ba9mr4510326b3a.42.1782982495647;
        Thu, 02 Jul 2026 01:54:55 -0700 (PDT)
X-Received: by 2002:a05:6a00:3cce:b0:845:c6c3:5e75 with SMTP id d2e1a72fcca58-847c5141ba9mr4510267b3a.42.1782982494957;
        Thu, 02 Jul 2026 01:54:54 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb7933e1sm1003514b3a.26.2026.07.02.01.54.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:54:54 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 16:54:20 +0800
Subject: [PATCH v2 2/2] coresight: tnoc: Fix clock refcount imbalance on
 platform remove
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-fix-clock-refcount-unbalance-v2-2-2383fbb9952e@oss.qualcomm.com>
References: <20260702-fix-clock-refcount-unbalance-v2-0-2383fbb9952e@oss.qualcomm.com>
In-Reply-To: <20260702-fix-clock-refcount-unbalance-v2-0-2383fbb9952e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782982478; l=2754;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=4Fs1C4uICLTweg+DB4xkt+CkKczMp5yN/3q/4y+AiFc=;
 b=2XzSNBg9oJGtUlNBbUKjeXrNszri4tquvx+19GLkvutbVwlbSK0IBNkNYcgdCgb6r340eQmDd
 3vJVtjMMxD1CYwo7ay2I/JcAQo9SOYTQKwpE5uFjXWuXDDgRYs8fm6F
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5MSBTYWx0ZWRfXxPGkmHlVE5fm
 QBsZGW97jvVp3q/2mK1W1/I/UzC8uXyIxEoRpb/0lgeDNJFY+n1wf/61FIHdX/CGmdKLkgKQzmK
 9b84juyAgeJWIF3wd26KVYz0fPTzdgA=
X-Proofpoint-GUID: eRuYufG01irBhWwpt3ib6nkg9LuRLPwL
X-Proofpoint-ORIG-GUID: eRuYufG01irBhWwpt3ib6nkg9LuRLPwL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5MSBTYWx0ZWRfXw0J0S6BMhzQq
 lo2gT7ZGp+Fjf41+/Y8krnWFF/aHZlA58uq1JiCnn2okKU5ZlwVcAwE6/i50G/ZI20+XR6YzdiT
 2ROgvjWsh4UP77pcNPvfyoO1RHwTWxzx+Qe1OtnwKB3dPdZUBTGTleM0AyC7P23zriMnVzYPhya
 nmfq1Fyt0nmoWHJiWDQYtSyKXAxO9GLWXSLDAAnejN5bUkrv8bb8qXkKLabmuYek0vX60QZNuD1
 jifKqhfGolHCe5joIfG6AxAtV5BRsfB0XJ5uKw0omPLabWOxUAgwijIVCbyAXV1UjDDDdCcLumA
 1mCR90mmBTIS5qprvdMWK+u9+yoCPmwZvmQQKStnHYPjmnsyx7Ea5N4Nc8YSgjIaWzocQ8aWeB7
 zcUQlRaNjVqnJSBwJsfaED4KdlE4crRJFwmTeTVpYEUPmcZRD/WVGghV7AsahpWT0Gcz7mzNIw+
 TZgrXHKgiD5BiFzbXuw==
X-Authority-Analysis: v=2.4 cv=K9oS2SWI c=1 sm=1 tr=0 ts=6a462760 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=GvhjM3dZ3B1J12qe5RMA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_015457_126965_7946AC2F 
X-CRM114-Status: GOOD (  18.24  )
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
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 9e8de4323d28..eddfdcbaa3ec 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -282,42 +282,50 @@ static int itnoc_probe(struct platform_device *pdev)
 {
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	int ret;
 
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
 	ret = _tnoc_probe(&pdev->dev, res);
 	pm_runtime_put(&pdev->dev);
 	if (ret)
 		pm_runtime_disable(&pdev->dev);
 
 	return ret;
 }
 
 static void itnoc_remove(struct platform_device *pdev)
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
 static int itnoc_runtime_suspend(struct device *dev)
 {
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
 
 	clk_disable_unprepare(drvdata->pclk);
 
 	return 0;
 }
 
 static int itnoc_runtime_resume(struct device *dev)
 {
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
 
 	return clk_prepare_enable(drvdata->pclk);
 }
 #endif
 

-- 
2.34.1


