Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBFCD68BEE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 08:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mBibrlOVxwUobVCFzUk4+xdpfUynlbc+upeX6jugrGY=; b=JWkpbVuqOAZyRyUKJKqWpZLHMV
	GWkETCdhH8BJWY/p4ORoi8VcdP933ynR8DeY94Q38WLWAq9xHnHwIscNYrmiZrRq5cEKkPoGM8gnt
	KJd3uoyxtdyWhHERTcnROJCT3Qz/vKzBASR6puyUbpBAvdKQgqjNQCwIlgmm0nfjdvctECTW3Vweh
	ZZpO3qO2VfeSR4+l5hrNh966qFVklmOP8Dl9haqaE30cLCeHvgCVOmgei25EQ52bCmb5FduvhhZfw
	nVsywoybE3X68rd0X67K4qHhMxthpgQUgIDA0JR2bNl/IOD8voeD/wzWnOGfTVjCU2ih2Dvxp4LOX
	PY1ih2Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW968-000000080sa-1qjw;
	Thu, 18 Dec 2025 08:10:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW960-000000080o5-28KN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 08:10:49 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI3aqGM754987
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 08:10:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mBibrlOVxwUobVCFzUk4+xdpfUynlbc+upeX6jugrGY=; b=nlLBEV1NP58stCH0
	lmJ7RGV7VtOw74BKMwMfNZwlJcqk0se5ZK7em8IC0O5Cy2zhu4r/jqKVkbnscPar
	fKhCZguTj5apv2cTk6AalbfwQbaG99bvwklaYN7/1gc2BiNfMnDf0y10o6+2CGcQ
	CLuUeX0JBfPF2qNlglnkMLH02J3Riwr1/l9JfxA0PUdOO6FyjAtfBXH+L5KG/jyd
	qOjWkryMZAJxj2PS8g1FHrUZ7cH2CFwp77oU2hY6ZIxypLZyI/iN7A5Irho0RYif
	xhb4abx8ZKIm7LBcExARsvOQJAA0xmdJIe7d28RWs3sEHXed/s1Z4wNm5HNB4MTk
	EaPT1w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b49v0rpnt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 08:10:47 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b9b9e8b0812so814711a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 00:10:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766045446; x=1766650246; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mBibrlOVxwUobVCFzUk4+xdpfUynlbc+upeX6jugrGY=;
        b=S4Qo4KcsTLmd78ZYjqr9/TnDbiWpN6qQF+MXVciWfmMRWLD2vm4I/2pIGQ4bPs1iod
         gkXhvidhdDqbO5EedvXnVzUKoocNcmluyKE7SLjpeXC9/dXbhTRCouCzJYTYI+9/Pw0D
         RMclwakmNCWbaQSnKj00YMhF/cUSQpWXOFQYmgtwze/ATUgc3HE/LZPp55oqZpZ44yy5
         hNnnTQjwfhIYnVGzY+jX7Z9oj4VuvD6K/qIU8KmCtdRGbDTIbGeWDn7rMRvHDI3KlchE
         9eDkv+c679oVdH02XLre7SaU7LYxFC87z7NHof6sfYOa06EPMjl+JsetxVThCdfOjNXr
         tOtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766045446; x=1766650246;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mBibrlOVxwUobVCFzUk4+xdpfUynlbc+upeX6jugrGY=;
        b=iMj6oVhjtcWevmnnJJdkUrKupac/6r2GUc2XZlY6m+q4awDcxlwaeMgFRsO6h0vf+2
         DwJBqRe+uGtapUTvo6k5A4FbT3m7Sujrhz4JAm8u/ZH9OyWA6ELRjp0SIdUHyBHTltwf
         sBd4sT81MeebGD6iu8jwp/7rw7+tgzkV0ckwk/U356ua1h4tu5MOohRLvkiwSCN8bvbT
         l54nLlwYB6GtNI7u6nMgkfgUIT1IO2Rc9jpUDnMzB7LAeb2WlNt9F2vn80JMNdYSKLlb
         dgMFE6Rk1r1IwAETJzO593Nqudm0E/R7/KV3K1brb3hSHPTV+3tU2MYJRYXYa25qYL4W
         v6rw==
X-Forwarded-Encrypted: i=1; AJvYcCUD8k9/ap51apBpHDphqhNjCx4uzO1lN7KxwHoiUorNkKWV+cQiDyLTsVTyk3n6RXVkDtBWeMlPshVcnidKKmvk@lists.infradead.org
X-Gm-Message-State: AOJu0YwBF2Hdfy9COTy5xAJhfPpqUO3kiVGychjsbLLt17XOEuy+F0al
	Cdxblsqf3P2/YDyrgKk75YNK9hkPO+0cYdGIYlfwtYoko2yHR7C7z2Ge/YhqdkwZCLLcMAtYYZr
	cdO3G4TNkzXHSYPFfEyOULEwWRL2niKDJDAIsBJGnPpxvCMpjDcj7pv721BKeo0BnMlD3tg2Mxt
	kh8w==
X-Gm-Gg: AY/fxX7qN8Qd4CnNbVeksgauJ76rccaIoo6cfFqcrKqErN8TfclgLNAOTOocqt6+aAw
	qv/mRQJtI5w6DBKX1luQflbCk7Zrv2kb1QKkMJt+BIFthSD0iT4NqFgTnJvjNAYRssUZ9uCmxn0
	cW+FNyFXfGvinBpAiYIJZl3g4NWHgUAihCwsaQwLPI4eFVZweH+TP8TtMdRUhISDBrfuzSWTZOO
	1YvWO113jOY9P2XywnOdFitYhH4gzvI6taZZu6Myx5kqXdWRqv316aqgPLGtoQwrpwIV0Sel4U3
	f00LLCRkXW8rgYGYCBKJv1dU59MG2qKz8E+gJhvuwWFcRTJWfQjfJZ8hsRH9sq/G/0tF5QY1v+7
	JpOVF5haLIjnsUG8mz0a8k6kQymitQFe5jA68jDWgRNw91i5sKjSFbunjg/PgzOv5Ii8=
X-Received: by 2002:a05:7301:90d:b0:2b0:5834:44d2 with SMTP id 5a478bee46e88-2b0583451cemr78966eec.39.1766045445539;
        Thu, 18 Dec 2025 00:10:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE6Rtac4ST/Xw6G3OLHunGaaU4Skb5aCMWXFpLcOKLZnMdN8oZ8l6EyI8oL929mTkE6OsPjnA==
X-Received: by 2002:a05:7301:90d:b0:2b0:5834:44d2 with SMTP id 5a478bee46e88-2b0583451cemr78930eec.39.1766045444960;
        Thu, 18 Dec 2025 00:10:44 -0800 (PST)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b04e58d423sm2564824eec.6.2025.12.18.00.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 00:10:44 -0800 (PST)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 00:09:45 -0800
Subject: [PATCH v2 05/12] coresight-replicator: Defer probe when associated
 CPUs are offline
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-cpu_cluster_component_pm-v2-5-2335a6ae62a0@oss.qualcomm.com>
References: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
In-Reply-To: <20251218-cpu_cluster_component_pm-v2-0-2335a6ae62a0@oss.qualcomm.com>
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
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        maulik.shah@oss.qualcomm.com
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766045439; l=4711;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=EzmTjovOY8ZLvq+FhSWCXV6W5sqcn6OLtBFjUsyrb2I=;
 b=9WosRBoUaICYMC/MyoaNovxgCu4/IAzJ+7DbEmhwShxGQ0xRaa/LEO48zJrbR8bnsW5Cxm4o4
 4UP+KyS/r+pAYVO3W6NHDXCt6CeGKiWNZmnUFd9XonoZSj5s7NRZ8yj
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-ORIG-GUID: NiJPdAF91IkAGzJASUULZlE5Jd91T3mu
X-Authority-Analysis: v=2.4 cv=Q/HfIo2a c=1 sm=1 tr=0 ts=6943b707 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=GdHxG0adR5Xe-XRRLWYA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: NiJPdAF91IkAGzJASUULZlE5Jd91T3mu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA2NiBTYWx0ZWRfX1xZfUxAfhDww
 QHmuoP0lpZr+d37NKnYqsif8PA17jlxVTLat6IsxG38y8TFFg/sNZ90BqFNWQo8QI9RyH40lo4g
 qzRAO7g36lHilm9w9lK5Dggst2SQC4+nS6Ajch0H2z2Q+lt5kZ8kasMTVyDkkxjmicFhLhvMJ/U
 lyRnRNhZXEdxyDdsD3g1WOetXAUssyajkwfikYk+9pyZMRKE915h+pf/ejSwm63HWC13UrWkvwy
 2DwAa66VU8Z+n72Dgs3faHDo1noeq+M5xP5CokbQ6Xfz4Qj6e7xD0OKJx5aVOiAEAXWES0pjeil
 un7VoE1lExUUs5JpJgM8TtQplPQROojSGffU7JlEk4MPn/oPQoHObRGb89od98T/QK+KS30CYfK
 IZN19laTY+K8w/Jw7V53lQe18gugXQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_001048_678826_7C6C4EFB 
X-CRM114-Status: GOOD (  23.00  )
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

Per-cluster replicators rely on the associated CPU cluster being online
to securely access registers during initialization. If all CPUs in the
cluster are offline during probe, these operations fail.

Support deferred initialization for these devices:
1. Track replicators that fail to probe due to offline CPUs in a global
   list.
2. Register a CPU hotplug notifier (`replicator_online_cpu`) to detect
   when a relevant CPU comes online.
3. Upon CPU online, retry the hardware initialization and registration
   with the CoreSight framework.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-replicator.c | 65 ++++++++++++++++++++--
 1 file changed, 61 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index c11da452559c73af6709b39d03b646cb4779736f..f8d13894098f1e414fb0da8d6eeb1da4f0d55a8c 100644
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
  * @supported_cpus:	Represent the CPUs related to this funnel.
+ * @dev:	pointer to the device associated with this replicator.
+ * @link:	link to the delay_probed list.
  */
 struct replicator_drvdata {
 	void __iomem		*base;
@@ -46,6 +51,8 @@ struct replicator_drvdata {
 	raw_spinlock_t		spinlock;
 	bool			check_idfilter_val;
 	struct cpumask		*supported_cpus;
+	struct device		*dev;
+	struct list_head	link;
 };
 
 struct replicator_smp_arg {
@@ -394,7 +401,7 @@ static int replicator_probe(struct device *dev, struct resource *res)
 		drvdata->supported_cpus = replicator_get_supported_cpus(dev);
 		if (!drvdata->supported_cpus)
 			return -EINVAL;
-
+		drvdata->dev = dev;
 		cpus_read_lock();
 		for_each_cpu(cpu, drvdata->supported_cpus) {
 			ret = smp_call_function_single(cpu,
@@ -402,10 +409,15 @@ static int replicator_probe(struct device *dev, struct resource *res)
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
@@ -419,8 +431,13 @@ static int replicator_remove(struct device *dev)
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
 
@@ -552,8 +569,44 @@ static struct amba_driver dynamic_replicator_driver = {
 	.id_table	= dynamic_replicator_ids,
 };
 
+static int replicator_online_cpu(unsigned int cpu)
+{
+	struct replicator_drvdata *drvdata, *tmp;
+	int ret;
+
+	spin_lock(&delay_lock);
+	list_for_each_entry_safe(drvdata, tmp, &replicator_delay_probe, link) {
+		if (cpumask_test_cpu(cpu, drvdata->supported_cpus)) {
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
@@ -561,6 +614,10 @@ static int __init replicator_init(void)
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


