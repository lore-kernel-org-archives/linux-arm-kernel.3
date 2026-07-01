Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DA7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 06:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WYlZ2aPEpqh61K7tMl0TS4HBIg4YZJn9Z3vmihGIy1Y=; b=G7pGPpkjJcE9Zy16b3faWmVNmD
	25k5V8hksqZp6D1ZJ5tz+PXUw6derlzta04I31TEDVg5/ALCXq5UhdhHZc/LCAjwbx3IAJUaZNBGM
	5rDxtWq7jwfpkocoVfok60GUWx+V0LOMwHO5D0sQFZQEU45FtZtvuHeX2BG/mhx/6+x+aNWzF7UHA
	f4zAzsK9UQV3E+BDb3il9nwibIUrZNsXU+lFjjyuDSGQz/7rypwY8gpA8Drm3wwAigpTqQKTDraw9
	VE3P5xspf+l5tw7IfgObwbCzQIceINtXN/d6KLfo48BMBz3Mr20RsC33D0fb4kn+D9abIZ4xLvutM
	rBOK7byw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weo52-00000000lcM-3rXy;
	Wed, 01 Jul 2026 06:05:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weo4x-00000000lb8-3lEd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Jul 2026 06:05:49 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6615lYOR059473
	for <linux-arm-kernel@lists.infradead.org>; Wed, 1 Jul 2026 06:05:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WYlZ2aPEpqh61K7tMl0TS4HBIg4YZJn9Z3vmihGIy1Y=; b=OGYpZSjfrf7TJ7cE
	sWtNhxXmpDySRu6KWbyUJzxh5PZhTje+QJwFSIN1nqt+vvhpH6VrSs7ny1UnMfSY
	qEG6y0Lj5oCHJpJvbaAfVriZ1vSLD07vp3vpf5IFCWqnAL4vcEJkHBHfBCCTimbx
	j4bnKlNzJuxzJW3zK8Y2RKYqkM14iNF41Igp49gMlDMTCIzIZOsMoPAPXYPHiND9
	h30ywhOEd0I2GrLu65N6+nU7PJAN7Cc379OiVDhmbPh1IZzSOdv0XqDzmWto/drl
	BSYlnkmRvrGYGbe5Dsu3rL8rrRNabIC+xRw5Z1aXAV4edNn32ZgeIbNpslEc+fxK
	d4cGUA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4k3sjcdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 01 Jul 2026 06:05:47 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8478e603285so1370748b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 23:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782885947; x=1783490747; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WYlZ2aPEpqh61K7tMl0TS4HBIg4YZJn9Z3vmihGIy1Y=;
        b=f1L41juo4E/o652nuLs9+zlVlkBajFtWw4oQKD15zQf9SXgEffRke8EkfHk4Of//lA
         w7A5nhCLIyuzgQ/X9VTQCPPBFo/RigoROe002rsaj3nQNIdAtTHvcpObN/mtOVi6UeYH
         6ufnp7LmXJf3yKOH/scCRwGFVst2Y0yDBwQQ3lAcvz9IwlolgqOKdasNgmwpt2gO0/qU
         Jkpj2535Qa42fQUuU0Mw0RrwaE/mAhduUJMWcyNZ9g2ad+L+Q3kLREaXkgjXhiOYMRvK
         ZY9qgE16u5Uihi47tciLez61wQzJ5JCXh/dyFXdekTOZhFtz/rUq1YAnU9hHun33LRMe
         3qkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782885947; x=1783490747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WYlZ2aPEpqh61K7tMl0TS4HBIg4YZJn9Z3vmihGIy1Y=;
        b=UPvoU6A1lk/VySxPcd/3korarG1fAWcEJm0iJmGixFNIkwDlw6Zf9ED82x9R58XGe1
         4ph13IWNV3zIQB+TvHFKK1X3Mly5dlmL51jB/zC6lfuwDfLlr+W0X84Jw6pNtFhN8qWL
         5Cr+FFjpE2s3e8PF9ffGCNONiO5Z2JILPu9wNncKPBEzqPgH5iZ5CLBFkuopK8BeM+TB
         xpf04VIjrm3/bibQ8fyvmdokyG8ZKtCWTbA35Q8RpGLexOJ7ORP/rGnb8sguAU0f671P
         l5cG563OjYAQBzLEK/hYiskv2Q8cmFre2ex/qzL1sbx3WibmIm8zsv2btiKOiSy6D183
         89VA==
X-Forwarded-Encrypted: i=1; AHgh+RqJCFrtIM76PjQLhx8no+xSIFr7QA3Uy5KObKxUqpTJgGSc7O9+5X2kYx9Uu+mZ6ARP0/IFOtzgEqy2Krxzboj2@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu5iaYGrBRda16/dO7W1nRE0Lx+hUqgzdq+7bXKZG1wquiNFj5
	Ds08y9R2Dh7ewgMN/+4CKQWE/JasveM/G81osQjtUrUf2r6rvnESSAo5hQycL7w2QcrnQ4RL3I2
	GUxmsaGh2Y64uNasDmoGHhPPC0yRb485iq9GNhnjaikl/R/QyszBk/E1XcHFkgBNehxFimi8QiG
	eeUQ==
X-Gm-Gg: AfdE7cmyZajPZVIDzgW55zdekjfawhv7S8Q1kkYS7qhZTNztKROfOQ0CdEbye8WlESP
	ieokbv7FSV9n0AitgPdNvtodIzOpu1JtzBGvOFIzUwKHA32OB1JAi4v3LU5PYFc8Xf4KsouoHZH
	d9OSSnfT18nvzMwXvR6LiPYzJICqWrq3gAi3rVAzEBrN4lk76n5gbplKREHgctuGAyMbmnDZJMQ
	1HiielAzz3P3xOfBtM3H64dxTGQrZC+1IbGKEAtHTiZlc1ljcgp6/5FdLB25y+fUeiyYfWGwNRg
	vU09jphqgdzt++34aDvE7SB5crPaK8PRVyw6RFlxDYnDBzRIDgc2tkzg1wC/4cGcoW6xzbhI3uj
	j1KVhwMBjFc/KMuKFZRjP6GR7A/sgYHbIwNOm7cc+mliz9qiJT1Zf3q8+nMU5PQtEhfa8gQFWMg
	==
X-Received: by 2002:a05:6a00:f8b:b0:847:9223:9726 with SMTP id d2e1a72fcca58-847a82d9976mr3848077b3a.18.1782885946589;
        Tue, 30 Jun 2026 23:05:46 -0700 (PDT)
X-Received: by 2002:a05:6a00:f8b:b0:847:9223:9726 with SMTP id d2e1a72fcca58-847a82d9976mr3848034b3a.18.1782885946032;
        Tue, 30 Jun 2026 23:05:46 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a02cc6f2sm3317658b3a.30.2026.06.30.23.05.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 23:05:45 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 01 Jul 2026 14:05:02 +0800
Subject: [PATCH 1/2] coresight: Fix clock refcount imbalance on platform
 remove
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-fix-clock-refcount-unbalance-v1-1-321dc63c1f90@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782885936; l=5885;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=eJfKlRK7k9b2kNcHtsJFOIUyVkQIXxfWWJmLMAk9pP0=;
 b=Ye3wjloLtfaNwOhrDBxIAdR1lVKRG4RSSV8jrcF2pU1QurgJEaGMXy5PRPwap01Uvx873zQ5h
 0XQ5KqPViSnAKt22bDp9kttNW9m3iCQbiK7pRRkqJ5cG0o+oVPQQjaT
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: r-gjyExhJhuq3_UvOI-H_VvAl56WHC-s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDA1OSBTYWx0ZWRfX929xuySzZBe1
 3st30u8miDMutHwa9PTNwjZuAO1UzkuPC2Hl3p1xPwiegYuO1437yOPmiSCnc7GvtPJAM0685tZ
 loJgh69GUIMIR6HV47n3NJjWSn/xA5vo4PkPWor2M5lxDmiTXsnmO883U+E6OE6/5LbbEQ0VZ78
 eX2aNwxMdRXRmyH5jUHd0Qarb0TXNEf6xBCGXYVnQuHtmtKqm2Wp5T4jPQYZYdQAomfgoMN/7Fg
 SdfsBRNNwNiISUdELMJablNmZ/fMcLVl9evSh8NghdR1FZ49okUpSL3mXtyWC0q4u1CZ2VeATjL
 cOXNebAxHgZQ7ligHveGW3dHYmW8/fnpOHUyo0VMWFuC3X8rFrJscPXJrsJqUCBaMavG/3P62MU
 SHSB9xeqqMP4MpBIGmQi9825OS4885IXWCiZQGRxML6oDj3qNno15oUNXkrfnFR46L747NdyR+M
 ttpyJN+KcvwE7AXuHvA==
X-Proofpoint-ORIG-GUID: r-gjyExhJhuq3_UvOI-H_VvAl56WHC-s
X-Authority-Analysis: v=2.4 cv=Ff4HAp+6 c=1 sm=1 tr=0 ts=6a44ae3b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=4U_dmyjyNprtKVz-Sb4A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDA1OSBTYWx0ZWRfX0GIUVio548sB
 5s1F5HkdxZvWTAUWNpgLhRbYwqVt3BMdB+nL37IShMQ2siTuNiR4mcoQZ+B7QkGHrhNKGZ0XnQu
 p0huvqK2TQD/dYrY+mAM6ZWCAQUeS7A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_230547_951040_6D03BC0C 
X-CRM114-Status: GOOD (  16.16  )
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

Resume the device with pm_runtime_get_sync() before pm_runtime_disable()
so the clocks are enabled again and balance the devm-managed disable.

This affects all CoreSight platform drivers that obtain their clocks
through coresight_get_enable_clocks(): catu, cpu-debug, ctcu, etm4x,
funnel, replicator, stm, tmc and tpiu.

Fixes: 1abc1b212eff ("coresight: Appropriately disable programming clocks")
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-catu.c       | 1 +
 drivers/hwtracing/coresight/coresight-cpu-debug.c  | 1 +
 drivers/hwtracing/coresight/coresight-ctcu-core.c  | 1 +
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 1 +
 drivers/hwtracing/coresight/coresight-funnel.c     | 1 +
 drivers/hwtracing/coresight/coresight-replicator.c | 1 +
 drivers/hwtracing/coresight/coresight-stm.c        | 1 +
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 1 +
 drivers/hwtracing/coresight/coresight-tpiu.c       | 1 +
 9 files changed, 9 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index ad8dafea7d2f..f7e501e6cbd7 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -647,6 +647,7 @@ static void catu_platform_remove(struct platform_device *pdev)
 		return;
 
 	__catu_remove(&pdev->dev);
+	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index 3a806c1d50ea..f7efae5b5ce5 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -711,6 +711,7 @@ static void debug_platform_remove(struct platform_device *pdev)
 		return;
 
 	__debug_remove(&pdev->dev);
+	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-ctcu-core.c b/drivers/hwtracing/coresight/coresight-ctcu-core.c
index 9043cad42f01..9b6da29d9735 100644
--- a/drivers/hwtracing/coresight/coresight-ctcu-core.c
+++ b/drivers/hwtracing/coresight/coresight-ctcu-core.c
@@ -266,6 +266,7 @@ static void ctcu_platform_remove(struct platform_device *pdev)
 		return;
 
 	ctcu_remove(pdev);
+	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index 14bb31bd6a0b..147761024c0f 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -2416,6 +2416,7 @@ static void etm4_remove_platform_dev(struct platform_device *pdev)
 
 	if (drvdata)
 		etm4_remove_dev(drvdata);
+	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 0abc11f0690c..4c5b94640e6a 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -334,6 +334,7 @@ static void funnel_platform_remove(struct platform_device *pdev)
 		return;
 
 	funnel_remove(&pdev->dev);
+	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index 2f382de357ee..2d765f1f73b3 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -313,6 +313,7 @@ static void replicator_platform_remove(struct platform_device *pdev)
 		return;
 
 	replicator_remove(&pdev->dev);
+	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index 4e860519a73f..a653f1eebeca 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -1026,6 +1026,7 @@ static void stm_platform_remove(struct platform_device *pdev)
 		return;
 
 	__stm_remove(&pdev->dev);
+	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bc5a133ada3e..c9cf486873e2 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -989,6 +989,7 @@ static void tmc_platform_remove(struct platform_device *pdev)
 		return;
 
 	__tmc_remove(&pdev->dev);
+	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
 
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index 7b029d2eb389..72ac93749be1 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -286,6 +286,7 @@ static void tpiu_platform_remove(struct platform_device *pdev)
 		return;
 
 	__tpiu_remove(&pdev->dev);
+	pm_runtime_get_sync(&pdev->dev);
 	pm_runtime_disable(&pdev->dev);
 }
 

-- 
2.34.1


