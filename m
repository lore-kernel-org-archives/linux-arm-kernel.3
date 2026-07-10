Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23567C43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 02:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M0XjIK3l1QlrdTu9yiIymA0sMB/2Qxsvll0XOYQf5Pw=; b=vH/tMUJtdLTknLbIeBzX0NxdyB
	zGxkq3kUpT+A+VLeKxDiOLIgj8wVo2bNaJqqDppfU8ECiFkWGuYXnxZehcQbOk7KdfgxK/B2DZbDw
	j/MbljWCLmkDmlZJ6+IeviIzZ98Z1mB4xZbryya/kMPgLIwC/fZnxUCrX2aG76ogWoep4lTGvOKFD
	519ITE94d/w3CbrNNFT2TI0V9670C4mzPQ1+6Abi2tnOnRNPpa+0eQ0AHouBvmELsAPQv92tznahD
	vhC7/XgWH7FuuP8K4Faq0xlEjATgTNOUeu0PF7KvOwdEOlQxfpVj/IX7NL1RJJAM04gi3SdhA0MKB
	JuXJ9imQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi19u-00000003yco-3Zb4;
	Fri, 10 Jul 2026 02:40:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wi19s-00000003ybm-1mM4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 02:40:09 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A06SGP3357402
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 02:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M0XjIK3l1QlrdTu9yiIymA0sMB/2Qxsvll0XOYQf5Pw=; b=Kj6kZy5FuHVLnZ8t
	YufYnucsng3n+1HWl5vfM4wLn9WIVMJE3Vz8C96eULHsKBSio1DIHlM34OmEw8Kv
	gPTnrByXiYXcWRWAyKUsIBhTZxe0UcTlPBwTvSOto6wNQpZdN9PNyiz9zKmwrFTg
	xLLAKpFn5X2e/sJ2zDsFmIk/JDqC9wPz0pMdZVrTxhjDa/U3dag3SyoTSWvGlVgj
	46BYg856Mfi5Y2r40ntyIVa3kOt7MkTmqy2MwK3nG6c6pxfe7ZwG+EC+hkJiJbqC
	t5QMfOlOABuGHCxoEfij5jXY6zh3PF5I0tTXTyKuR2IEqmGk7k0MXyL90c9AblFQ
	wL634g==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fanwe8d3n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 02:40:07 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-8478423e020so754211b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 19:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783651207; x=1784256007; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M0XjIK3l1QlrdTu9yiIymA0sMB/2Qxsvll0XOYQf5Pw=;
        b=kTqMgEPaUIMeYrn5Gx6Ho20AUodwTGhShOKRTSit6LaN+ZfggrvBfNwS4OqZgFCPCV
         jdHuFHCEkxVvXs/fmBBYzkHq0/Iw0zOPOpJTzTCvRRGFg4BvH1815pxiV57Ka5SKBB4r
         MBdefV3RYprwm2eB1SEQO5MDKCBBk1AOLnXPrHjt2zeKHj/sd8F3BTaPvliDOddFudKF
         S27ax2HkQLFW/Hfgp01Ra/8Qwi1hM6ymjkhQ1xCdjBJqRF+EsrVRB3pcwxgrkd4sWzV6
         i8gBL0AJl4+qvZcgBup2zBVSfMILMmkIJipPoyDyliAVRFuJnoGgEN1iWLQLFTu/nIar
         jv/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783651207; x=1784256007;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M0XjIK3l1QlrdTu9yiIymA0sMB/2Qxsvll0XOYQf5Pw=;
        b=JYpMcP3t5jGEI+ozCOyyTDGVVOs+U3+M8Zx63yuoBKZ+wTZ1436eKu0rSze368rME1
         NKu+dSG0Gvbg7PF2NX1kmq6Ozx0Rv3KSsYDkeXE5LznzzSykYIIphp9PAP5sX4D5rDrg
         ef0hpO/yBpgLRdFHIlU5el3XyqJa3xAc7mUQLQw8yPYfSZq5exAZaf4w4PRWeQpVVYcO
         OXHc+oKO8jhs7Jl1dEDI4Is/0QjHx5ODrza0WcfCIL0gTv59hFqM1L0p7jxdzvL3grvC
         doQCbZKJ+J366lynhWxs1bVIv8IJcMqrNHXnvyKv7qBj3mHYWYYSVre0SMkuFpOcP86Z
         Oz8A==
X-Forwarded-Encrypted: i=1; AHgh+RoB599eFsozkdOcHvXv2c+UlBUeBKqlf714+xYMkIYB8ttIQZ34VHfH/6htiT8WRXNO7B3OtylGeb2BYPZSQxZc@lists.infradead.org
X-Gm-Message-State: AOJu0YykIg7k2/lPsKkIHZS5OKKeHzM8BzyB9taxFWQFBMuo7KC5bpr7
	JKnssIb0oPnC0VcqRJIsSZb7ZSu3mUQzJeuOU+13XSFX9gjJweJ6iVolF8fdHw3qqm2iUwpWrCS
	jVHkAHJTwkbfn7gRsepWfDv6PDRjJ0vlJL8SecdPkuGt3zRtFmOwadHHJrjX3YlsI5eoC44GSyV
	eeXQ==
X-Gm-Gg: AfdE7cmcC0O2ovdVCUyB6zwgFbesBxQP/noWXbkp0M9EUkvLuyjUWoWAlJ50IaK0G7h
	pMG/3vACxaYZ0l91Td6e1DzjDgBW0ad8/Fhe6Vzkyozo14TWqzOKdKpzK3O0zJ28lbdsnSTsHDj
	FIuSyh9BaHEYdx77Gz6mGAl2Vhfn8IkTopg/9NcQJaR4uG23vqVb2PuE55jNv+byrgC2yoNaf/e
	6vCk98jy0E1Eey+cd9FfxUz8SaXbnQuifKaDafsMjKlKQScbT2Pg/Q8b9bqBvVO5x0yndVJFsO8
	L0zA8w4EHy4Trw0xrysr3h8mL9B5CWq6Vlci/JceMoJNccuofMWC+dkGIavkEF6SUECm2k478xh
	kEa4qQDi0dgqFWMwcxlc9pqnydja7rWHzZAN9FM1iwLUlgfmN0n5hpB0qEgp3NLTTgyHmysZ83g
	==
X-Received: by 2002:a05:6a00:3e12:b0:848:411f:3969 with SMTP id d2e1a72fcca58-84842ee66f7mr8113026b3a.20.1783651207312;
        Thu, 09 Jul 2026 19:40:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e12:b0:848:411f:3969 with SMTP id d2e1a72fcca58-84842ee66f7mr8113004b3a.20.1783651206712;
        Thu, 09 Jul 2026 19:40:06 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5af6df87fsm4517611a12.5.2026.07.09.19.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 19:40:06 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 10:39:01 +0800
Subject: [PATCH v6 2/5] coresight: tnoc: Bind Aggregator TNOC on the
 platform bus
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-fix-tracenoc-probe-issue-v6-2-41eb36fef8d9@oss.qualcomm.com>
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
In-Reply-To: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783651186; l=5005;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=/VrMOAI7RMTSpCjPO+MrxGESmI6mgxV1a4rVfM8UdWg=;
 b=6y3FHfzbxUki4D5drjaSM3YVMMezRawMOVbPyF0uw93CA5mqU+VVMTAN9itU9nQTEeBfM3Ge9
 JbnbH3GHH9QC5rzvF/iwh9LByMKOs5B8Boq5siOOZ85twB8UCsUaqE/
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=LbIMLDfi c=1 sm=1 tr=0 ts=6a505b87 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=SM-CJC9rQbeaPTssbJMA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX+Boo4xHtPOAK
 9uLlClbM64av9ujkSQxHygJm9Te7RNEiQUK2BWEYdYuL5Lox3Boi4sou80zVZoO/kJQkTQZchTr
 kNMqh/DiSFuBNbkh5aMp2Pyk7ptM5hILFr/Z0vR7cVq1Zhow+rfMfbiTTdLJUwSfT++Uyvf2WKn
 N1uHj5WDLPa0Zp+8/A2EK+AMXj5DC76NWTcbrDQcPM7WG89V8H6ms/j+VHjZNSkY1hzn0bnygBx
 re+mlppww6jxwvHFLbZ45iexPpzx9Fpu9Vt6+dZYEBrKOr5ogyF638BSQM/wAGy4pnY28ua4j63
 GzdhX+XyUA0XXTDWRw7MtwAWVSMcLQMI2sBZYK6ZSBjW0cZlEkRZx1cjh7qWJ7y9Cq2SFdTfGaU
 reRd7GhtXoLlH9eXGyaG7d8UeD9WAxr9kju0QPAsPfy088cwHSDiguLDfqMCT3esMyHm609SLbU
 DrcBzcTNGmzXS6rNq9A==
X-Proofpoint-ORIG-GUID: cH-EYrD_fScNiW9uLt-NPIbTJythHd37
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDAyMyBTYWx0ZWRfX4fmLInxDjQOl
 UT8b5Vkp85DySSrpP2vLY4xWRvuUu+iKxPo+3FTeYUTlgdO7lNT6xsWkBPCu8OShWrlgAx6/Xg/
 rZdxbWKG8cBVClqQO9wpfp8nDFGbOnQ=
X-Proofpoint-GUID: cH-EYrD_fScNiW9uLt-NPIbTJythHd37
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_04,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_194008_475512_A52B8AD7 
X-CRM114-Status: GOOD (  21.95  )
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

The Aggregator TNOC is bound as an AMBA device through the
"qcom,coresight-tnoc", "arm,primecell" compatible. The AMBA bus reads the
peripheral and component ID registers to identify and probe the device.
Although the Aggregator TNOC exposes the CID registers, the Component ID
value returned by the hardware is 0x00000000 instead of a valid AMBA
Component ID, so the AMBA match fails and the device never comes up.

Bind the Aggregator TNOC on the platform bus instead, where the device is
matched by its compatible string and no component-ID probing is performed.
Add "qcom,coresight-tnoc" to the platform driver's match table, and rename
the platform driver and its callbacks from the "itnoc"-specific names to
generic "tnoc" names, since the driver now serves both the Interconnect
and Aggregator TNOC. Update the platform driver name to "coresight-tnoc"
accordingly.

The ATID-unsupported handling keyed off dev_is_amba(), which disabled ATID
allocation for every platform-bus device. With the Aggregator TNOC now on
the platform bus, that check would wrongly disable its ATID, even though
the Aggregator TNOC owns the ATID that tags the whole aggregation path.
The Interconnect TNOC aggregates trace within its subsystem but carries no
ATID of its own, because the downstream Aggregator TNOC already owns the
ATID for the path. So base the check on the "qcom,coresight-itnoc"
compatible and let every other form allocate a trace ID.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tnoc.c | 37 +++++++++++++++-------------
 1 file changed, 20 insertions(+), 17 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 9e8de4323d28..737cc802aefe 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -130,7 +130,7 @@ static int trace_noc_init_default_data(struct trace_noc_drvdata *drvdata)
 {
 	int atid;
 
-	if (!dev_is_amba(drvdata->dev)) {
+	if (of_device_is_compatible(drvdata->dev->of_node, "qcom,coresight-itnoc")) {
 		drvdata->atid = -EOPNOTSUPP;
 		return 0;
 	}
@@ -278,7 +278,7 @@ static struct amba_driver trace_noc_driver = {
 	.id_table	= trace_noc_ids,
 };
 
-static int itnoc_probe(struct platform_device *pdev)
+static int tnoc_platform_probe(struct platform_device *pdev)
 {
 	struct resource *res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	int ret;
@@ -295,16 +295,18 @@ static int itnoc_probe(struct platform_device *pdev)
 	return ret;
 }
 
-static void itnoc_remove(struct platform_device *pdev)
+static void tnoc_platform_remove(struct platform_device *pdev)
 {
 	struct trace_noc_drvdata *drvdata = platform_get_drvdata(pdev);
 
 	coresight_unregister(drvdata->csdev);
 	pm_runtime_disable(&pdev->dev);
+	if (drvdata->atid > 0)
+		coresight_trace_id_put_system_id(drvdata->atid);
 }
 
 #ifdef CONFIG_PM
-static int itnoc_runtime_suspend(struct device *dev)
+static int tnoc_runtime_suspend(struct device *dev)
 {
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
 
@@ -313,7 +315,7 @@ static int itnoc_runtime_suspend(struct device *dev)
 	return 0;
 }
 
-static int itnoc_runtime_resume(struct device *dev)
+static int tnoc_runtime_resume(struct device *dev)
 {
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(dev);
 
@@ -321,35 +323,36 @@ static int itnoc_runtime_resume(struct device *dev)
 }
 #endif
 
-static const struct dev_pm_ops itnoc_dev_pm_ops = {
-	SET_RUNTIME_PM_OPS(itnoc_runtime_suspend, itnoc_runtime_resume, NULL)
+static const struct dev_pm_ops tnoc_dev_pm_ops = {
+	SET_RUNTIME_PM_OPS(tnoc_runtime_suspend, tnoc_runtime_resume, NULL)
 };
 
-static const struct of_device_id itnoc_of_match[] = {
+static const struct of_device_id tnoc_of_match[] = {
 	{ .compatible = "qcom,coresight-itnoc" },
+	{ .compatible = "qcom,coresight-tnoc" },
 	{}
 };
-MODULE_DEVICE_TABLE(of, itnoc_of_match);
+MODULE_DEVICE_TABLE(of, tnoc_of_match);
 
-static struct platform_driver itnoc_driver = {
-	.probe = itnoc_probe,
-	.remove = itnoc_remove,
+static struct platform_driver tnoc_platform_driver = {
+	.probe = tnoc_platform_probe,
+	.remove = tnoc_platform_remove,
 	.driver = {
-		.name = "coresight-itnoc",
-		.of_match_table = itnoc_of_match,
+		.name = "coresight-tnoc",
+		.of_match_table = tnoc_of_match,
 		.suppress_bind_attrs = true,
-		.pm = &itnoc_dev_pm_ops,
+		.pm = &tnoc_dev_pm_ops,
 	},
 };
 
 static int __init tnoc_init(void)
 {
-	return coresight_init_driver("tnoc", &trace_noc_driver, &itnoc_driver);
+	return coresight_init_driver("tnoc", &trace_noc_driver, &tnoc_platform_driver);
 }
 
 static void __exit tnoc_exit(void)
 {
-	coresight_remove_driver(&trace_noc_driver, &itnoc_driver);
+	coresight_remove_driver(&trace_noc_driver, &tnoc_platform_driver);
 }
 module_init(tnoc_init);
 module_exit(tnoc_exit);

-- 
2.34.1


