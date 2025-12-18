Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 157FCD68BED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 08:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E0rpWnjGI2g5XgXoHJyDOCm/wAcv0BxAgcw2UhKMGfg=; b=LPf+I2pLEiqE9zDRl1oVxSWOfx
	sXSL2glGLOJnZXCRvBGdEGMeqFP1j4bbmoQ6ATo9bkpiMCATLEdyhSEPV7F+raWhGq1dkegUa5XSv
	B4TqqQJ04j5GzJVoD0RqIRUXeLJVyBhFNJPGJWN8Spn36g3M5z4BtgRBSxZytRZR1pkFtBXEjOXou
	gdZzQp1FBk8NWXWDirn/ZN2T0jyK6yX6+o5pxiU+PsdHPA3fuLLHGL929GYkb+rcvOnP+ACot5BCJ
	Mvs5Ncmkqm0qg/6ubuYXfwL+84W5nLko/i0kkPZepOWhB7MEtMsUslLsa6nCwYcOVRgzJ9AeaprSS
	Ja8h72nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW965-000000080qE-0XIB;
	Thu, 18 Dec 2025 08:10:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW95x-000000080mY-36kP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 08:10:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YObA237350
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 08:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	E0rpWnjGI2g5XgXoHJyDOCm/wAcv0BxAgcw2UhKMGfg=; b=ofbVwGUO9nTOpxwN
	7uP+aAPoHd/t3uRqfaIktbM9vU9yIvgAoUIBzOiV8JsrACbW19WV1LpCapZu7kTe
	T2gcCJcDWePIWK8fluC8NtLggWL7OcqcTZ5ZAf9ZGAIZrMkfNECwLm2Vaq6GW8HE
	7iQH3sfSL7vR0HRzqJxnoabTYZpGrShIyJe2OLAH2icA1nFuzzZO8hoZb66G4Iw4
	NqloKRKLxQ8iAVqco3PcRpDJBYiaXWAl0/AlQWHExFZwDZcdxYoK0DRO8HxEUU+3
	qRN4dud5f/45nYZygEmyO+7S6H7tmaPYVLjLicYoys31a/1xmJ/lTYZwM+UG2cSC
	/mJtjw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b44x3hfyt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 08:10:44 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b609c0f6522so659708a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 00:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766045444; x=1766650244; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E0rpWnjGI2g5XgXoHJyDOCm/wAcv0BxAgcw2UhKMGfg=;
        b=Us09pRKcXxPsfv6A/XbTCBaIfekLxr9oIuSeYz81JQ61HGWXck2SLYLXsStvEI5c3A
         bvUYfQ6t2k8b2dv1l/a8RputmnvH3XnAH2T48C9RQfPK24Dk/oD3+YTgc+LMJKKXZ+8L
         UR96FTxDN3lB+Y3R5wmGeXaBe7JmLuqZwjBqU4a8fdgAW2OazO+iuUsiCv2RSgr9AnAV
         SrNaEuPQ8NHwykFKCyHbhovk+ccz7cNnjXrrxsTIooztQwbRkz91p/kvPHnCPbtHfUfF
         JSf0Zp1SX8UDTc4aC6PrDBOsooF3W8bvEjRmFSDH9MFCRte02WcRtsDu/YbPdWsgd7cl
         hFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766045444; x=1766650244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=E0rpWnjGI2g5XgXoHJyDOCm/wAcv0BxAgcw2UhKMGfg=;
        b=cIsqRdrDL5Htuey2AJj4EPZQ1v/Z9t/uLPh3oCVmYltTDEu4yFNbWhPZFm7fxoh7ig
         dtgKjCzS1oG9cE67sLlxOWwkzAduLtSFCTCCbGy/bxAEEy2JMTRxQzHHG5BIGegncc5I
         8wdVZH3h92hXyg4EOW0Kg2GNXaOb4oqsIlrqXJkiosOxSkwXCPAhudNVw72pB8gro72D
         Yvk7oQun3XSjVS2qomcuN8IeQQq4dDCzvEfsGzbuZwtpqjwepTUqFcW1AO9N16JRsNxV
         rNHeB3Ni702GwYyXq7osFyehxAyLXLV3GY4P5ECzOg+OujpaiBGgoI4M5+9RrTLH2fY7
         SYdQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3wdf46pm2FDEsuiqeZQ0NtbDv3n+qTngoMYjSv0ZHCJ37YOVG8nmWO7uQSx7DW7lojyNauAKMA4sVnsCQWN+A@lists.infradead.org
X-Gm-Message-State: AOJu0YwH3LlbT4cggoTwyMTtEANpAriLww1H0UMBhpAqr4iAP6m0ByTR
	UnV1BnILbVfyFu0ON2IEjFnL1mIko4lAxRnQsIKZAHdSP7IohJQ2vRSjHxxCW+T4/tnfNriqf8b
	x6pX6MGn0nf+mPTsp/rZTkUg6DXaYFp143i+Pntnmiok9nHIDwnac1SmidmYVglFPrMc0vVyrOS
	q1RA==
X-Gm-Gg: AY/fxX4OaOlrNgRO71yFzhVCqmG4c2wraQvFO1KL/dvxL2az+dTywGIlqdxJQnHY/Fd
	QyHiow/ZSQ1xSFkMgMg1vEvzJHwDZSBcr3ZLgDzPf0/E9qn1v+gSez7GFtyD7d9FuGfnBgUpbjE
	5V+fU/yLr/wv1hmuWPmcSkVeTleAqQRFl3P+OMVPG6bGsZ94e3D7lj2Ma7lpQlYhc/OpAIpb5ol
	X7n0IP+jauBcZpcU2if1DuU1MGWUm0PS7Ussz4qMUBIi32q1nC/NcUK0Zw9/qMwapDJDyvJI6Je
	jrS1IimbMRe5yJXzSWtuT0jqQkO4R5DEb0T9y4TY0tDe7kVCZYYF12/gf3OVFBbHGKB4ipWfoqS
	Id3umBHqzZBWyrtgRgzZ7j1oVsN1ULrCFBKYhhiGrDbFjyPX8i8OnVCi1YLujpUE1bO0=
X-Received: by 2002:a05:7300:caa:b0:2ae:5e28:743a with SMTP id 5a478bee46e88-2ae5e2877e1mr4014762eec.17.1766045443726;
        Thu, 18 Dec 2025 00:10:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1MYiKs0jzjHaQd3gre2/5Vrpx+T+zfC2QTWa4K7GVpXVStAyAVFf+CtDYWGahuOPpcss37A==
X-Received: by 2002:a05:7300:caa:b0:2ae:5e28:743a with SMTP id 5a478bee46e88-2ae5e2877e1mr4014716eec.17.1766045443152;
        Thu, 18 Dec 2025 00:10:43 -0800 (PST)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b04e58d423sm2564824eec.6.2025.12.18.00.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 00:10:42 -0800 (PST)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 00:09:43 -0800
Subject: [PATCH v2 03/12] coresight-funnel: Defer probe when associated
 CPUs are offline
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-cpu_cluster_component_pm-v2-3-2335a6ae62a0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766045439; l=4434;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=WwWv1dVaZYPvnR6R1Ei7R4iTlI2WTlIv5BffkfyWev4=;
 b=dQbvHI/2v1JuiMMRpKrCwOIQtDDEOZwHfzA72YQzaiRyUwGSbgCOeeOfPl3bFQ0Jul2DlNY4K
 ht2uOJpJoqdDwGuOsdrhbjOl8X4rA+yM6MB/IqMkHYK5eN8/KFdZPt5
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA2NiBTYWx0ZWRfX6b+v1JcBQc+h
 UjWMDRBliPbjt2d9qR4Qw1lGyq7a8l8eOO3QDOqKmKHHifk5Lkn8BOHbS/PObO0XxJvuGo+CqWX
 YoMh4hkMfhLIgvIVKNtL0m1ZR57B85emlGmIueVeN3qSAE0mmM7jAPbua0iFjMmVqDWygUP8Jm2
 McQ5e4DplvoMnjzQtocWQmXbZUQu2gq1b+ZyKfNNCb8R39YwiEHr52OOTGh16d46jeGBzSP10UC
 RQwFZH0VRblln050YvdErJ0e6KqfJtI1pUCMCA+uDWp5tptQTpk+p31dWdJ1PAXCY+KOe7jG49R
 Ld9BOFgsLExFpoCgp8UeiEAaILKSk93fLe/muFHRLgFeAvNElJKmXRsHXLl61EinHaGQFSIsjZT
 GuZzTdudz6WNKXKqgGrkQ4/csFlG9w==
X-Proofpoint-GUID: KxqANfk3yunjlYHaiWAnD95bEhEZW1AN
X-Proofpoint-ORIG-GUID: KxqANfk3yunjlYHaiWAnD95bEhEZW1AN
X-Authority-Analysis: v=2.4 cv=Zpjg6t7G c=1 sm=1 tr=0 ts=6943b704 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=B8lwgTuz66jIMM7eRW8A:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 clxscore=1015 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_001045_904723_1179589D 
X-CRM114-Status: GOOD (  24.30  )
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

Per-cluster funnels rely on the associated CPU cluster being online to
securely access registers during initialization. If all CPUs in the
cluster are offline during probe, these operations fail.

Support deferred initialization for these devices:

1. Track funnels that fail to probe due to offline CPUs in a global
   list.
2. Register a CPU hotplug notifier (funnel_online_cpu) to detect when
   a relevant CPU comes online.
3. Upon CPU online, retry the hardware initialization and registration
   with the CoreSight framework.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-funnel.c | 62 +++++++++++++++++++++++---
 1 file changed, 57 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index a1264df84ab4c625c63dfbb9b7710b983a10c6b4..5d114ce1109f4f9a8b108110bdae258f216881d8 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -32,6 +32,9 @@
 #define FUNNEL_ENSx_MASK	0xff
 
 DEFINE_CORESIGHT_DEVLIST(funnel_devs, "funnel");
+static LIST_HEAD(funnel_delay_probe);
+static enum cpuhp_state hp_online;
+static DEFINE_SPINLOCK(delay_lock);
 
 /**
  * struct funnel_drvdata - specifics associated to a funnel component
@@ -42,6 +45,8 @@ DEFINE_CORESIGHT_DEVLIST(funnel_devs, "funnel");
  * @priority:	port selection order.
  * @spinlock:	serialize enable/disable operations.
  * @supported_cpus:	Represent the CPUs related to this funnel.
+ * @dev:	pointer to the device associated with this funnel.
+ * @link:	list node for adding this funnel to the delayed probe list.
  */
 struct funnel_drvdata {
 	void __iomem		*base;
@@ -51,6 +56,8 @@ struct funnel_drvdata {
 	unsigned long		priority;
 	raw_spinlock_t		spinlock;
 	struct cpumask		*supported_cpus;
+	struct device		*dev;
+	struct list_head	link;
 };
 
 struct funnel_smp_arg {
@@ -371,7 +378,7 @@ static int funnel_probe(struct device *dev, struct resource *res)
 		drvdata->supported_cpus = funnel_get_supported_cpus(dev);
 		if (!drvdata->supported_cpus)
 			return -EINVAL;
-
+		drvdata->dev = dev;
 		cpus_read_lock();
 		for_each_cpu(cpu, drvdata->supported_cpus) {
 			ret = smp_call_function_single(cpu,
@@ -379,10 +386,15 @@ static int funnel_probe(struct device *dev, struct resource *res)
 			if (!ret)
 				break;
 		}
-		cpus_read_unlock();
 
-		if (ret)
+		if (ret) {
+			scoped_guard(spinlock,  &delay_lock)
+				list_add(&drvdata->link, &funnel_delay_probe);
+			cpus_read_unlock();
 			return 0;
+		}
+
+		cpus_read_unlock();
 	} else if (res) {
 		funnel_clear_self_claim_tag(drvdata);
 	}
@@ -394,9 +406,12 @@ static int funnel_remove(struct device *dev)
 {
 	struct funnel_drvdata *drvdata = dev_get_drvdata(dev);
 
-	if (drvdata->csdev)
+	if (drvdata->csdev) {
 		coresight_unregister(drvdata->csdev);
-
+	} else {
+		scoped_guard(spinlock,  &delay_lock)
+			list_del(&drvdata->link);
+	}
 	return 0;
 }
 
@@ -533,8 +548,41 @@ static struct amba_driver dynamic_funnel_driver = {
 	.id_table	= dynamic_funnel_ids,
 };
 
+static int funnel_online_cpu(unsigned int cpu)
+{
+	struct funnel_drvdata *drvdata, *tmp;
+	int ret;
+
+	list_for_each_entry_safe(drvdata, tmp, &funnel_delay_probe, link) {
+		if (cpumask_test_cpu(cpu, drvdata->supported_cpus)) {
+			scoped_guard(spinlock,  &delay_lock)
+				list_del(&drvdata->link);
+
+			ret = pm_runtime_resume_and_get(drvdata->dev);
+			if (ret < 0)
+				return 0;
+
+			funnel_clear_self_claim_tag(drvdata);
+			funnel_add_coresight_dev(drvdata->dev);
+			pm_runtime_put(drvdata->dev);
+		}
+	}
+	return 0;
+}
+
 static int __init funnel_init(void)
 {
+	int ret;
+
+	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
+					"arm/coresight-funnel:online",
+					funnel_online_cpu, NULL);
+
+	if (ret > 0)
+		hp_online = ret;
+	else
+		return ret;
+
 	return coresight_init_driver("funnel", &dynamic_funnel_driver, &funnel_driver,
 				     THIS_MODULE);
 }
@@ -542,6 +590,10 @@ static int __init funnel_init(void)
 static void __exit funnel_exit(void)
 {
 	coresight_remove_driver(&dynamic_funnel_driver, &funnel_driver);
+	if (hp_online) {
+		cpuhp_remove_state_nocalls(hp_online);
+		hp_online = 0;
+	}
 }
 
 module_init(funnel_init);

-- 
2.34.1


