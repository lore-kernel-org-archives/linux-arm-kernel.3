Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6071C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 08:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9b/W7QGSCQ7+siyAOGDr0r/H8HglDIhkhzvNu/L2LPw=; b=EIgoHMCeJQIaG9sL7DJD5OKVRZ
	aoRpVPwutnZ6UhRW/pp6ZYsxti4czldahVwE3IP3LQwwdk/A9RsP2e/vp83ZRHp0FInhccyGCCc8I
	1S17PLDmD6mtcNH25ojDMzjeA8ZODmKrcITWpcAhAVhlrwkK3iH9pb5a8uy5J14lh6cSDrrO9nIcY
	CQhBjuLbf9cTKpGE5npQFqVT7s7DZZByWKRK+84AJv4QCBeVEL0VrkHPLGruQLNudORXN5pVvVXZ9
	YHbWs6SDKVcRKu7XSF3nP1hShWGXXWs/svEI12G6w4XJtm87EhbdvH59om6gMKc4rAMklZaaYO4Es
	dP3uaTzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDCA-00000003vOT-1BFG;
	Thu, 02 Jul 2026 08:54:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfDC7-00000003vNS-3Wqk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 08:54:53 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6628HPv52917506
	for <linux-arm-kernel@lists.infradead.org>; Thu, 2 Jul 2026 08:54:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9b/W7QGSCQ7+siyAOGDr0r/H8HglDIhkhzvNu/L2LPw=; b=MqR/XBsZP67EIomQ
	V5Ln9ipKy8ZfVDbnX6Ohxmk6GMvxeUdy6zqDg1YoBgeFX5JmV67bb0tnulHerPDM
	fjc77GP1cdm2rX8iqfYoT02/LHrQj5GbeUe7i2GxTOMLsMAubekVzRGARG9OrkMX
	s7H/AuKDgf6BV8Hi0NrjgaLyBryZrA2X73xc4lJEqZFC5SAU+tvGRWYfzdAuiof4
	rUX1rXsnD1kgKyd/dNFNp6QxkhHohV3PlwkJbVr17tw+ohydz3uR0uk2CsBkn7JV
	X9deovm4Sw0Jd11xk2/YwyQZc5gAco4rWvaWnwFl8WdAXASgRWf5uSgxGuv/rK7o
	EGs+Tw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f53q0byw8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 08:54:51 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-845bc2e658aso1763021b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Jul 2026 01:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782982491; x=1783587291; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9b/W7QGSCQ7+siyAOGDr0r/H8HglDIhkhzvNu/L2LPw=;
        b=QlAlyAiH0drJPQw0mvSTXw89rRtsgaR8xaedzUaKnmRzx5ssZ74wwtQCf/GKz6pOfW
         3/h1glnatjedv7EBk9amP1tXJBTBbPbsU5jGaFW2H/VBLgiE+zuz9oDOzirE2CHW2NKe
         Zyi3QujAIOzrW6/zbqA9aNaJ+7LFFkPWmEOZHyXHuW101RcNMb9zXvv+JEivYcgOmkVW
         otZTsFYHKYBr5jwf+apRe1JcoWSva95g5FjZT/MFxDPUcK5xk96QZc3inwrdguUKjMfh
         1LrcFQqm8tSsiFmcYv2aExFN2JBSrkXEpX3cb+kV4fF+5nmuaRZ8nbPnIgrY3wLe9u62
         Uomw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782982491; x=1783587291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9b/W7QGSCQ7+siyAOGDr0r/H8HglDIhkhzvNu/L2LPw=;
        b=qi68o6Vg/clcmtFnvn58mXZ7gYBV74K++inm9bHYAg6y4/TeecIUAmHVMG4FBL6S9o
         lVMUvjrchqmgSlOMmVkoN957kKwrsVy7F68xiLOcwy2RBwD73Q0qFGy5ppjyJgA79mcp
         5WG4Wl90y87hRUOBtt1djU5IqNtxtad5rNZRVXEkc1H5A/xfOlJYzNI9fnle1LmhjLnt
         vnEC8i5XUn+r5uMioY4QcsQ3flw9SVBwNzOiuNU8J8YwUrBVsPtJIx1plBn1p/upU5FO
         +5ErsnNQ0uHi4a1dAxDh8V0tecxnxKmtST5tK5sogp3dp3Z/TgnrzohrGlnkZSq3PXaE
         XHlw==
X-Forwarded-Encrypted: i=1; AFNElJ8FzaDaDq10OR1Z0511sWXoHZteceb10b4fvkL1MLXHP30I0ksH90/gYhVNJl0KplGNWNV1cuTWUwrcoXHrfmZW@lists.infradead.org
X-Gm-Message-State: AOJu0YwPLyTQij106HfwL9maVgenkJQzpay9ne8rBOEn1oMAXWW+zIvG
	RBG/G9GRnfhwj7J8HtfPzSkVkYKTgWzxIALFxKSxZhPHlw7fCZDg5GueXHOdMxIWKBdVvuJlvAA
	YaHc1vbzHHYCcBodMs9CGj5fOK4LCCtIZjZt0VxEfJHUM8ojhxRsbeQ1wE8Up0dBUyBU6Spl8vB
	rHUA==
X-Gm-Gg: AfdE7cmtz9rzf2+PVBpGBRwl79GgxJ9+fWbFsxmL0vPetpWbsnFqInr3rAU/ft1a4/6
	gRbCLHvlYVkM35Lyn8EdgQFdi1CPPqkjbCcXcizF1DjHcZ+n9lTcd4Wz+VzhwWcZonQ2FbQX8sv
	g2LF6RNSnqXknFqbfz4tDGi6FihMW5bW0l6DxhpkoXdMg8TPNf4Yrff4pXVxWKv39Iy0neqzKxA
	4l2HbuHhfLDyltoS9kEMtjgorB2+yt21XgNdfFqIW1XIc1yqn70J8W7kraHbQ2eQTiB500FEky+
	6okNNR0t5udJgFHwBa5bwkkUDyT8W3JQjMl2urBrLscbfnPEDxf6i28el8JX/ULPt36SvYCiCAs
	OFKyPEDhEJxPsEIGFzkwbbDEAC0/BOeee2Lv6HBpZTz3fR/4o/YFY1zEA/EV79l+yLPqQlqIF6A
	==
X-Received: by 2002:a05:6a00:1392:b0:847:8d2d:713c with SMTP id d2e1a72fcca58-847c5193970mr3962633b3a.50.1782982490327;
        Thu, 02 Jul 2026 01:54:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:1392:b0:847:8d2d:713c with SMTP id d2e1a72fcca58-847c5193970mr3962604b3a.50.1782982489602;
        Thu, 02 Jul 2026 01:54:49 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb7933e1sm1003514b3a.26.2026.07.02.01.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 01:54:49 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 16:54:19 +0800
Subject: [PATCH v2 1/2] coresight: Fix clock refcount imbalance on platform
 remove
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-fix-clock-refcount-unbalance-v2-1-2383fbb9952e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782982477; l=17419;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Q6tE3QCsZcbp/Lxk9tJoa+uyS/qXdWg0T3PWWYstidk=;
 b=9nc6eQUyghpOxTnqUETz42quTo3iHXWtnFsF0615lhSNzxWwcuW83gmHcJulqE0oie83nBI9a
 HAIu6TYgclfDVsX/veCSfGmEXd0rr/OGb7szoGuWXcQzF2UCi4CHZkM
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=dtnrzVg4 c=1 sm=1 tr=0 ts=6a46275b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=hqFQHrWFFG5QrmS-gPsA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: mgX1u0H93DvBDVmFJGqcgTgT1kewyEbX
X-Proofpoint-GUID: mgX1u0H93DvBDVmFJGqcgTgT1kewyEbX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5MSBTYWx0ZWRfXzDpuv+Xun+fP
 k5W33CsBnQDzoObokn853BOtHOrbb00Wi6gyLhA2A/+ZSsW+wX7oYMxDS1syUT9PyzGd4hEV4O/
 iRGSbCwRCvrVr6iIJNxqCvYLDFBWrKuFSsxDPcc33wi9soWnS0ldfg8p3uEZQ6x8/vIH+2qTQsf
 q6oCYHaRM+EcYLjdzbtrByTf/QPwoalmEnakCxFPX74cNwCujdDUgzUOHF7FjlLpCsdD1PR7JWo
 bqFC4mf4MQjB0hu0pK/KQM+kgE8srF9Z7J+Aw/wCT2jmDkt4j4eI73S3OWKxesP89ZZ0Do0KE1k
 pGi2UxIkCMXw9PvPp9xBlxibwD0SN+AUuDRPerRf1JXFleQIsbDomUNzV+kONO41GMFZ3ggNW62
 vN0yGc7wFqz5GTOx66Y7HHHCQwxA+evfDt0HydIiHI/wyb192RvDHC1TinVSrh+oEYL9Uy3rYRs
 orsCQaiWb85SkfNZJ4g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5MSBTYWx0ZWRfX45CZD3YDbaBl
 UtF9AqpnZ4fyYhGBhsKJXZjRrIxxF2xkLJGvFzEaG2iAlCf9FcS66d1K8dll7lYbR2Z+jqMTtEf
 SD4LBOwO92Y/8FPwwFJskTjoSjOqRPw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_015451_906595_43C3D647 
X-CRM114-Status: GOOD (  19.79  )
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
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-catu.c       | 8 ++++++++
 drivers/hwtracing/coresight/coresight-cpu-debug.c  | 8 ++++++++
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 8 ++++++++
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 8 ++++++++
 drivers/hwtracing/coresight/coresight-funnel.c     | 8 ++++++++
 drivers/hwtracing/coresight/coresight-replicator.c | 8 ++++++++
 drivers/hwtracing/coresight/coresight-stm.c        | 8 ++++++++
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 8 ++++++++
 drivers/hwtracing/coresight/coresight-tpiu.c       | 8 ++++++++
 9 files changed, 72 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index ad8dafea7d2f..b72fa7f4bdeb 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -629,42 +629,50 @@ static int catu_platform_probe(struct platform_device *pdev)
 
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
 	ret = __catu_probe(&pdev->dev, res);
 	pm_runtime_put(&pdev->dev);
 	if (ret)
 		pm_runtime_disable(&pdev->dev);
 
 	return ret;
 }
 
 static void catu_platform_remove(struct platform_device *pdev)
 {
 	struct catu_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
 
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
 static int catu_runtime_suspend(struct device *dev)
 {
 	struct catu_drvdata *drvdata = dev_get_drvdata(dev);
 
 	clk_disable_unprepare(drvdata->atclk);
 	clk_disable_unprepare(drvdata->pclk);
 
 	return 0;
 }
 
 static int catu_runtime_resume(struct device *dev)
 {
 	struct catu_drvdata *drvdata = dev_get_drvdata(dev);
 	int ret;
 
 	ret = clk_prepare_enable(drvdata->pclk);
 	if (ret)
diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index 3a806c1d50ea..87b39874461e 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -693,42 +693,50 @@ static int debug_platform_probe(struct platform_device *pdev)
 
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
 	ret = __debug_probe(&pdev->dev, res);
 	if (ret) {
 		pm_runtime_put_noidle(&pdev->dev);
 		pm_runtime_disable(&pdev->dev);
 	}
 	return ret;
 }
 
 static void debug_platform_remove(struct platform_device *pdev)
 {
 	struct debug_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
 
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
 static const struct acpi_device_id debug_platform_ids[] = {
 	{"ARMHC503", 0, 0, 0}, /* ARM CoreSight Debug */
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, debug_platform_ids);
 #endif
 
 #ifdef CONFIG_PM
 static int debug_runtime_suspend(struct device *dev)
 {
 	struct debug_drvdata *drvdata = dev_get_drvdata(dev);
 
 	clk_disable_unprepare(drvdata->pclk);
 
 	return 0;
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 9043cad42f01..e0e33e3ca5bf 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -248,42 +248,50 @@ static int ctcu_platform_probe(struct platform_device *pdev)
 
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
 	ret = ctcu_probe(pdev);
 	pm_runtime_put(&pdev->dev);
 	if (ret)
 		pm_runtime_disable(&pdev->dev);
 
 	return ret;
 }
 
 static void ctcu_platform_remove(struct platform_device *pdev)
 {
 	struct ctcu_drvdata *drvdata = platform_get_drvdata(pdev);
 
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
 static int ctcu_runtime_suspend(struct device *dev)
 {
 	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev);
 
 	clk_disable_unprepare(drvdata->apb_clk);
 
 	return 0;
 }
 
 static int ctcu_runtime_resume(struct device *dev)
 {
 	struct ctcu_drvdata *drvdata = dev_get_drvdata(dev);
 
 	return clk_prepare_enable(drvdata->apb_clk);
 }
 #endif
 
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 14bb31bd6a0b..a3ae8e1e3a1b 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -2399,41 +2399,49 @@ static void etm4_remove_dev(struct etmv4_drvdata *drvdata)
 		etm_perf_symlink(drvdata->csdev, false);
 		cscfg_unregister_csdev(drvdata->csdev);
 		coresight_unregister(drvdata->csdev);
 	}
 }
 
 static void etm4_remove_amba(struct amba_device *adev)
 {
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(&adev->dev);
 
 	if (drvdata)
 		etm4_remove_dev(drvdata);
 }
 
 static void etm4_remove_platform_dev(struct platform_device *pdev)
 {
 	struct etmv4_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
 
 	if (drvdata)
 		etm4_remove_dev(drvdata);
+	/*
+	 * Resume the device so its clocks are enabled again, balancing the
+	 * clk_disable_unprepare() that devm runs when the driver detaches.
+	 * Then mark it suspended and drop the usage count taken here.
+	 */
+	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
+	pm_runtime_set_suspended(&pdev->dev);
+	pm_runtime_put_noidle(&pdev->dev);
 }
 
 static const struct amba_id etm4_ids[] = {
 	CS_AMBA_ID(0x000bb95d),			/* Cortex-A53 */
 	CS_AMBA_ID(0x000bb95e),			/* Cortex-A57 */
 	CS_AMBA_ID(0x000bb95a),			/* Cortex-A72 */
 	CS_AMBA_ID(0x000bb959),			/* Cortex-A73 */
 	CS_AMBA_UCI_ID(0x000bb9da, uci_id_etm4),/* Cortex-A35 */
 	CS_AMBA_UCI_ID(0x000bbd05, uci_id_etm4),/* Cortex-A55 */
 	CS_AMBA_UCI_ID(0x000bbd0a, uci_id_etm4),/* Cortex-A75 */
 	CS_AMBA_UCI_ID(0x000bbd0c, uci_id_etm4),/* Neoverse N1 */
 	CS_AMBA_UCI_ID(0x000bbd41, uci_id_etm4),/* Cortex-A78 */
 	CS_AMBA_UCI_ID(0x000f0205, uci_id_etm4),/* Qualcomm Kryo */
 	CS_AMBA_UCI_ID(0x000f0211, uci_id_etm4),/* Qualcomm Kryo */
 	CS_AMBA_UCI_ID(0x000bb802, uci_id_etm4),/* Qualcomm Kryo 385 Cortex-A55 */
 	CS_AMBA_UCI_ID(0x000bb803, uci_id_etm4),/* Qualcomm Kryo 385 Cortex-A75 */
 	CS_AMBA_UCI_ID(0x000bb805, uci_id_etm4),/* Qualcomm Kryo 4XX Cortex-A55 */
 	CS_AMBA_UCI_ID(0x000bb804, uci_id_etm4),/* Qualcomm Kryo 4XX Cortex-A76 */
 	CS_AMBA_UCI_ID(0x000bbd0d, uci_id_etm4),/* Qualcomm Kryo 5XX Cortex-A77 */
 	CS_AMBA_UCI_ID(0x000cc0af, uci_id_etm4),/* Marvell ThunderX2 */
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 0abc11f0690c..d69cd66e8394 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -316,42 +316,50 @@ static int funnel_platform_probe(struct platform_device *pdev)
 
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
 	ret = funnel_probe(&pdev->dev, res);
 	pm_runtime_put(&pdev->dev);
 	if (ret)
 		pm_runtime_disable(&pdev->dev);
 
 	return ret;
 }
 
 static void funnel_platform_remove(struct platform_device *pdev)
 {
 	struct funnel_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
 
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
 	{.compatible = "arm,coresight-static-funnel"},
 	{}
 };
 
 MODULE_DEVICE_TABLE(of, funnel_match);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id funnel_acpi_ids[] = {
 	{"ARMHC9FE", 0, 0, 0}, /* ARM Coresight Static Funnel */
 	{"ARMHC9FF", 0, 0, 0}, /* ARM CoreSight Dynamic Funnel */
 	{},
 };
 
 MODULE_DEVICE_TABLE(acpi, funnel_acpi_ids);
 #endif
 
 static struct platform_driver funnel_driver = {
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index 2f382de357ee..1df01deb2f69 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -295,42 +295,50 @@ static int replicator_platform_probe(struct platform_device *pdev)
 
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
 	ret = replicator_probe(&pdev->dev, res);
 	pm_runtime_put(&pdev->dev);
 	if (ret)
 		pm_runtime_disable(&pdev->dev);
 
 	return ret;
 }
 
 static void replicator_platform_remove(struct platform_device *pdev)
 {
 	struct replicator_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
 
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
 static int replicator_runtime_suspend(struct device *dev)
 {
 	struct replicator_drvdata *drvdata = dev_get_drvdata(dev);
 
 	clk_disable_unprepare(drvdata->atclk);
 	clk_disable_unprepare(drvdata->pclk);
 
 	return 0;
 }
 
 static int replicator_runtime_resume(struct device *dev)
 {
 	struct replicator_drvdata *drvdata = dev_get_drvdata(dev);
 	int ret;
 
 	ret = clk_prepare_enable(drvdata->pclk);
 	if (ret)
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index 4e860519a73f..a75b1c56a867 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -1008,42 +1008,50 @@ static int stm_platform_probe(struct platform_device *pdev)
 
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
 	ret = __stm_probe(&pdev->dev, res);
 	pm_runtime_put(&pdev->dev);
 	if (ret)
 		pm_runtime_disable(&pdev->dev);
 
 	return ret;
 }
 
 static void stm_platform_remove(struct platform_device *pdev)
 {
 	struct stm_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
 
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
 static const struct acpi_device_id stm_acpi_ids[] = {
 	{"ARMHC502", 0, 0, 0}, /* ARM CoreSight STM */
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, stm_acpi_ids);
 #endif
 
 static struct platform_driver stm_platform_driver = {
 	.probe	= stm_platform_probe,
 	.remove = stm_platform_remove,
 	.driver	= {
 		.name			= "coresight-stm-platform",
 		.acpi_match_table	= ACPI_PTR(stm_acpi_ids),
 		.suppress_bind_attrs	= true,
 		.pm			= &stm_dev_pm_ops,
 	},
 };
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bc5a133ada3e..ed40bfea32f9 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -971,42 +971,50 @@ static int tmc_platform_probe(struct platform_device *pdev)
 
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
 	ret = __tmc_probe(&pdev->dev, res);
 	pm_runtime_put(&pdev->dev);
 	if (ret)
 		pm_runtime_disable(&pdev->dev);
 
 	return ret;
 }
 
 static void tmc_platform_remove(struct platform_device *pdev)
 {
 	struct tmc_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
 
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
 static int tmc_runtime_suspend(struct device *dev)
 {
 	struct tmc_drvdata *drvdata = dev_get_drvdata(dev);
 
 	clk_disable_unprepare(drvdata->atclk);
 	clk_disable_unprepare(drvdata->pclk);
 
 	return 0;
 }
 
 static int tmc_runtime_resume(struct device *dev)
 {
 	struct tmc_drvdata *drvdata = dev_get_drvdata(dev);
 	int ret;
 
 	ret = clk_prepare_enable(drvdata->pclk);
 	if (ret)
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index 7b029d2eb389..775507d0bb36 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -268,42 +268,50 @@ static int tpiu_platform_probe(struct platform_device *pdev)
 
 	pm_runtime_get_noresume(&pdev->dev);
 	pm_runtime_set_active(&pdev->dev);
 	pm_runtime_enable(&pdev->dev);
 
 	ret = __tpiu_probe(&pdev->dev, res);
 	pm_runtime_put(&pdev->dev);
 	if (ret)
 		pm_runtime_disable(&pdev->dev);
 
 	return ret;
 }
 
 static void tpiu_platform_remove(struct platform_device *pdev)
 {
 	struct tpiu_drvdata *drvdata = dev_get_drvdata(&pdev->dev);
 
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
 static const struct acpi_device_id tpiu_acpi_ids[] = {
 	{"ARMHC979", 0, 0, 0}, /* ARM CoreSight TPIU */
 	{}
 };
 MODULE_DEVICE_TABLE(acpi, tpiu_acpi_ids);
 #endif
 
 static struct platform_driver tpiu_platform_driver = {
 	.probe	= tpiu_platform_probe,
 	.remove = tpiu_platform_remove,
 	.driver = {
 		.name			= "coresight-tpiu-platform",
 		.acpi_match_table	= ACPI_PTR(tpiu_acpi_ids),
 		.suppress_bind_attrs	= true,
 		.pm			= &tpiu_dev_pm_ops,
 	},
 };

-- 
2.34.1


