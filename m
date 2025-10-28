Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA1FCCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 06:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g431kojCgCIdaHw5eAvJNcxgtIOm3Z6fvyH460xV/cg=; b=zg+8F0vJIPUhNvcdkFyj0LHCc/
	UAfrMyMb1VvvRf4LwtUdPnfWP1x7h9A4J1OcsZXY7LFyc60aS/+RgsoIVypuBEchD7IpoQAg7vDhz
	urQop+mpnjMFTBO5v5ReZ4QSrpp9p8awKolMg5gYenQhRoznGYwTgQzgAZNOZ/g6ezRLCE1G3g+4d
	VK6Mb+ZPe/ae5lvqK5243O/Yh7mJFfT9bEOA8d9LFMPyTkjuHDzYc8jXobpo8Au2dRUeiJA3ECQj0
	Z+5jvCaqriACkadeJQFTehxIiiirX3oO9MQZ+KBgQRB2YWgeOwWjn6k0Hbn6+zYH9ZaFBVaEUP/+Y
	YFcdV72A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdC9-0000000FL7b-0bRn;
	Tue, 28 Oct 2025 06:28:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdBw-0000000FKyP-12gB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 06:28:25 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RKBpHm2547940
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 06:28:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g431kojCgCIdaHw5eAvJNcxgtIOm3Z6fvyH460xV/cg=; b=SOtAkgkpe75CSDY1
	MBmaVB/riACzGOn+oRa/V7XW9wWQ9OMsvRuT2XWAdjJHhtUHGmbJ+r156kCwDWFn
	3r1oe8fGJGon4zSEDIi0LLukaWIz+4FYZ18RdnzpQGiMfwVyWdGxHbgoUEgouamX
	0/rxaxbYFah8MAIWW1c1Q4ExDGSsqt6/OhUVnHo291ljrAbdePWfvCm5H8C9D/k4
	S7xGiQ4jltCZnjiWR47Jmpaa85KJFINL/sQjFhqjNhzwENa+jsiCdgYU4L1jSUZa
	QheRRRS6XTxERezdUWdDcYPMsq2BlIZrdmKtO7QU1qSldROdlODqLv4wjy3hU1af
	xt/fiA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a27s2k1vr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 06:28:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2697410e7f9so145487005ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 23:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761632902; x=1762237702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g431kojCgCIdaHw5eAvJNcxgtIOm3Z6fvyH460xV/cg=;
        b=O0tWySw7A077P44yQAi3UQL4ByDz1jsBEO/QDG4E0b68bN9nK23LtZ3MKtUB7Pcd1L
         pCNW9BmPmRCh1uifhv5X9Vx+f1jhaKIf6aNBQsSSiuMW7Ed9ElXhP6hP3AARR6ud2NaC
         o5t/8V1Sl3OJZHTEMQZ3rsS8EFZeaZ2s1Y7h4wL/ITr2hMipR+qNj6wH2kEzQa8//PDL
         NMkPLHkuxy+LVcXVSrcJnwaDL/UMxW0+KHsdVCQOC75kSda2YKfakAigeZs8vG1aWREG
         NeqCWH8BiKk/7BKg5+ot7qUL2nSIQDu1OeduZEzrLBIUDdCcbgYeVUijen0/G86fSZ7y
         j4pQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzx0p9li1gDpM8aRp5BiZKa93kxqT6pcZ+cW081YsmU45cQl5rIOqzt9eOI7sxc56JsG/dSx65IvA8sftgaCmr@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0Mi9ZLKMHxFYUAMvH3KRkqWiPuajLaZOG2uKlFIkyrzcoM2I4
	CFnrbZ6gg1Adp6z8/Zam3Qv3N2wdNk74ltwvoRuiEto1bbQHvTJryO8V72HAdE2qLe90m4h+x8k
	ZnVQlKZ+CQ0Gfuxgcigi/7bY2DgTY3QzOMusE2OnFaGguBS04Xkktied6il3HrPZ/6/CQGMbqLK
	UTDg==
X-Gm-Gg: ASbGncsA3Pp57n6I51eSO86bxhgMZgi9KGApJRa26NlFYdSh3z/D7qG7YIZBt/mmI0c
	hglExxDmQwBOP/As0hcN0HW5Ugl5KIoByTglfHOO+0SYOG9o/2+y1pkmkg4zXwgEDKS5CqToAGK
	T85PXY56BQ7F8w6MMYvX7hkGDR3w028KXEgnbebiU51Yn5ZwZhHiWZ+XuUa+Tb543dZKo970qfZ
	w0kIOovaWsAeadmju0COdbXVxTgmNuQjHJnwatgsV58uC7J9pXUPNYQm6aulO20mX9t5huiloGA
	/2yofBVEK+bfkOKeGWKJDTru29Pww0fsDiArS1UyNtlK2zEOk8r/aKH4irDjeS5lvXZoFR8wsmY
	z04IADXUi57i9r8mKS78pfdpj7O0ibJjabu4gayNTXDKgZtysMcqdAuhP
X-Received: by 2002:a17:902:d512:b0:24f:dbe7:73a2 with SMTP id d9443c01a7336-294cb507e7fmr35701555ad.31.1761632901956;
        Mon, 27 Oct 2025 23:28:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGEME/3GpZ+fHVnhT/neGuF54I/YdEoLry6x5u4DcYZycqBkHn6J3tXGPw60NQ582VfUQ6nLA==
X-Received: by 2002:a17:902:d512:b0:24f:dbe7:73a2 with SMTP id d9443c01a7336-294cb507e7fmr35701155ad.31.1761632901455;
        Mon, 27 Oct 2025 23:28:21 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf359asm102503265ad.12.2025.10.27.23.28.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 23:28:18 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 23:28:07 -0700
Subject: [PATCH 05/12] coresight-replicator: Handle delayed probe for CPU
 cluster replicator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-cpu_cluster_component_pm-v1-5-31355ac588c2@oss.qualcomm.com>
References: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
In-Reply-To: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761632890; l=4448;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=qIU3aNCwc/5hLOTjRkewyXRoR9HF6h6FxhePov1nhio=;
 b=WfK40WV2y8LNmku++Vn6N1Zf/2VTmZeY7+ENZ6akJVkIVwtz+hRg9mjsmdR993NMUEjTIetb/
 hI7bYBE9VN+CY2JUPDMelBWe28EKfG4FMUBKyANLLsrBS08X7hezlyf
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-ORIG-GUID: PtKZ4z6vH0nLMpqI7XSIGKE7YpVO66RQ
X-Proofpoint-GUID: PtKZ4z6vH0nLMpqI7XSIGKE7YpVO66RQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA1NCBTYWx0ZWRfX/JurZDc+W+kO
 Ok5m6jJiLRr+O9vBeSmMw90PG9SgOUoYGKEY8YpplNBj33T4dUqcfo6QWZe4/zuUMRdP0fRZyAy
 KWIyYykXL2QbMlV3Eum2bkvSC7PUd/9S7/CqDUAsBjJogzxwTXxMH6LAkyoN2fzlxhGIEZSSwk+
 aoLNChEHef01UROVug9AbxYGwxuidGDYsJxFANpK4vRliBBHizko4Gqx0iC5a4ZgbUbqQbu/N6F
 ycdRrKSduFlVJjB8ojfoypjT7hZjeNNb9frbVc2Ef789CdC7YukyC/UUk6v11VUHZEs5GqrVQkF
 gyS+zGti28iAj7+HCktTrTiXTAYoZ7GasoxBAeZfMZl0a/55fdrbXS/2u/f/bwEHqvkr/Q2AVTf
 VGXoNPmiHTVJ56hh6wwkUcUZdoO23A==
X-Authority-Analysis: v=2.4 cv=R60O2NRX c=1 sm=1 tr=0 ts=69006286 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=GdHxG0adR5Xe-XRRLWYA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_232824_441894_180C4A18 
X-CRM114-Status: GOOD (  23.50  )
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

Delay probe the CPU cluster replicator when all CPUs of the cluster are
offline, and re-probe the replicator when any CPU in the cluster comes
online.

Key changes:
- Maintain a global list to track delayed replicators waiting for
  CPU online.
- Add a CPU hotplug callback to retry registration on CPU online events.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-replicator.c | 65 ++++++++++++++++++++--
 1 file changed, 61 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index c5a9c7a2adfa90ae22890ed730fc008fe6901778..1dfe11940cd6001db3cf17249b0493027b65e19c 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -26,6 +26,9 @@
 #define REPLICATOR_IDFILTER1		0x004
 
 DEFINE_CORESIGHT_DEVLIST(replicator_devs, "replicator");
+static LIST_HEAD(replicator_delay_probe);
+static enum cpuhp_state hp_online;
+static DEFINE_SPINLOCK(delay_lock);
 
 /**
  * struct replicator_drvdata - specifics associated to a replicator component
@@ -37,6 +40,8 @@ DEFINE_CORESIGHT_DEVLIST(replicator_devs, "replicator");
  * @spinlock:	serialize enable/disable operations.
  * @check_idfilter_val: check if the context is lost upon clock removal.
  * @cpumask:	CPU mask representing the CPUs related to this replicator.
+ * @dev:	pointer to the device associated with this replicator.
+ * @link:	link to the delay_probed list.
  */
 struct replicator_drvdata {
 	void __iomem		*base;
@@ -46,6 +51,8 @@ struct replicator_drvdata {
 	raw_spinlock_t		spinlock;
 	bool			check_idfilter_val;
 	struct cpumask		*cpumask;
+	struct device		*dev;
+	struct list_head	link;
 };
 
 struct replicator_smp_arg {
@@ -395,7 +402,7 @@ static int replicator_probe(struct device *dev, struct resource *res)
 		drvdata->cpumask = replicator_get_cpumask(dev);
 		if (!drvdata->cpumask)
 			return -EINVAL;
-
+		drvdata->dev = dev;
 		cpus_read_lock();
 		for_each_cpu(cpu, drvdata->cpumask) {
 			ret = smp_call_function_single(cpu,
@@ -403,10 +410,15 @@ static int replicator_probe(struct device *dev, struct resource *res)
 			if (!ret)
 				break;
 		}
-		cpus_read_unlock();
 
-		if (ret)
+		if (ret) {
+			scoped_guard(spinlock,  &delay_lock)
+				list_add(&drvdata->link, &replicator_delay_probe);
+			cpus_read_unlock();
 			return 0;
+		}
+
+		cpus_read_unlock();
 	} else if (res) {
 		replicator_init_hw(drvdata);
 	}
@@ -420,8 +432,13 @@ static int replicator_remove(struct device *dev)
 {
 	struct replicator_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata->csdev)
+	if (drvdata->csdev) {
 		coresight_unregister(drvdata->csdev);
+	} else {
+		scoped_guard(spinlock,  &delay_lock)
+			list_del(&drvdata->link);
+	}
+
 	return 0;
 }
 
@@ -554,8 +571,44 @@ static struct amba_driver dynamic_replicator_driver = {
 	.id_table	= dynamic_replicator_ids,
 };
 
+static int replicator_online_cpu(unsigned int cpu)
+{
+	struct replicator_drvdata *drvdata, *tmp;
+	int ret;
+
+	spin_lock(&delay_lock);
+	list_for_each_entry_safe(drvdata, tmp, &replicator_delay_probe, link) {
+		if (cpumask_test_cpu(cpu, drvdata->cpumask)) {
+			list_del(&drvdata->link);
+			spin_unlock(&delay_lock);
+			ret = pm_runtime_resume_and_get(drvdata->dev);
+			if (ret < 0)
+				return 0;
+
+			replicator_clear_self_claim_tag(drvdata);
+			replicator_reset(drvdata);
+			replicator_add_coresight_dev(drvdata->dev);
+			pm_runtime_put(drvdata->dev);
+			spin_lock(&delay_lock);
+		}
+	}
+	spin_unlock(&delay_lock);
+	return 0;
+}
+
 static int __init replicator_init(void)
 {
+	int ret;
+
+	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
+					"arm/coresight-replicator:online",
+					replicator_online_cpu, NULL);
+
+	if (ret > 0)
+		hp_online = ret;
+	else
+		return ret;
+
 	return coresight_init_driver("replicator", &dynamic_replicator_driver, &replicator_driver,
 				     THIS_MODULE);
 }
@@ -563,6 +616,10 @@ static int __init replicator_init(void)
 static void __exit replicator_exit(void)
 {
 	coresight_remove_driver(&dynamic_replicator_driver, &replicator_driver);
+	if (hp_online) {
+		cpuhp_remove_state_nocalls(hp_online);
+		hp_online = 0;
+	}
 }
 
 module_init(replicator_init);

-- 
2.34.1


