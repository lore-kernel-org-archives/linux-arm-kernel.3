Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58777CCF9EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 06:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HuSM5SLFMC7N6NZFy7Qf19Ll4uLRSR1mcYDYQZd6pRw=; b=WqEaDruiJpjAHhXj71R3qmgVbV
	s0V32UPC74LrFID/cFAXnBInie57rLQpXs8lE9cFWh3vJEPwlODSHzIT3i156UzY5Ejmni7haPRPw
	dMkxnFTIedR5bHKCDZCxlZmhblV/68OxCWd+b/GB84xD/80FDFK0nB1gNopN70YOIbT+xMWHS2SBK
	o9GFBN+DH0qsHAE1GIjkn3yXyV/37pnyZ92j+ypCvWr2nqVlj60kJC7lR2wwQToDFfFjUu/6sSswG
	xQJmuihZVpyOhyIo9PQvbDvHxC2I/O1P8VnxodG5nzyMJfysNInRZHkgCxnunqa1GLDMtRuGvJ5+3
	HtYsRxig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdBu-0000000FKwv-1Jo1;
	Tue, 28 Oct 2025 06:28:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdBq-0000000FKuy-0MBV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 06:28:19 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S0cMDJ2881766
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 06:28:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HuSM5SLFMC7N6NZFy7Qf19Ll4uLRSR1mcYDYQZd6pRw=; b=F+ktBSlaRa5746cm
	0sWtcu22QT/5PTZgXcYDikvFKTSeMhqU6ykfU6t4PmsBNyowxBayFRANlzNJtJnD
	wRUsR2WzInmY6k/xZ7eHCyNQIWMNn+GDg2+b+B6xy1YuvXctI697rTiV95Z7QLC5
	jzFU0J/xvU6EsssNcoIlbF9luugYQiEfddgbj0wmoTuoKmXoXmGm6ibMfY5i+Tf6
	ijyrrv3qLEowiPk2Q6YUwVt+q+6jID9f6tsFXReg6f1iL5OMUSek3+OmFqlaXQvl
	ABvczUjhd1MU00wmOEEwFiUgDpQmmD6qONBFXuZO9JmTBm7rH0V4i6xZmyakr10a
	k+CarA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a29uhap34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 06:28:17 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-28973df6a90so41506575ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 23:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761632897; x=1762237697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HuSM5SLFMC7N6NZFy7Qf19Ll4uLRSR1mcYDYQZd6pRw=;
        b=IoKKKfRPl32/Qn/R8b6O9npHF2aiTR+hiBNouAQ6DAAYUNWuiLWUBvj3z7EEJT9aPs
         W2GQjQ8gzTF/v0yrodhpBSrO0rpfy+HQzIuUvx0WgXGnsb/T1asOsOQEF/Gk7TdcIFkL
         yVoDVZNujMFPb06tt42HozDbg0mfzvHZrK+gWquP+wU20ecu7zrG2j2mEYD/dksniE/q
         1BJhPzJw+suVxckDoyjls7uhz0BY8WzNionUSyCAXXUD1kk7qKDmiQqPOAt1HG6a9UBO
         OFf1vYPvCucdJalMeOOt4o5aFoDmN6ViMuK5pb4an9wGwljiGYPLYwlo5wB1YLGdLDaD
         N+HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUeLv0ZQCWbDvlUF5tYnwsjR8iZ2yIihu8mBdNFu7UiehaLdWl05BH1/5EFPVhQIqMEC8In80tlcSY/Ff6e4P+r@lists.infradead.org
X-Gm-Message-State: AOJu0YxtGlXcj4YkcFbGr7Lsa5If3ORhmQmsc8K9/MMHUsm2kAoOVnRu
	q2i78NXJ3oZcCkQfruaM0MZK/NhB18h0H+rsMSJ8SrjXh/JvcWu9NePCaJg1k/FKNXxMMPU8vX3
	+Ler1ZnTqNQrLInpsLvjxYGgd3o6gB9EVDPekZ/99PC5nh1Bj53OzvpcVR+8z3JPRNBe2dwCLqj
	7nTQ==
X-Gm-Gg: ASbGncvFqaGJd5BWAZuQIYkuhBUzg3fiHnz7ZlgEOf2OoAWJOS/MG4P0vUTn+k6XVuL
	T2aFQ86mGVbpy7Ee7q2T9FHeWhwRTxB3Y0G1Q6/glENXXuShw+YI2V4oXtuvD4PS2vq9ptGnnuR
	/cLRzxFjlvAOwGzPiis1qbsDzZc21Z5kpSJ9KYLjzFeDnE4GsP468Fo03XtzItvEAxtbjrPaqSp
	4GNpEJo8UJneIVaqlsQBC/a73EbsxgtnY2EHCA3dDNGWAj2tZ+p3XrO3VWnzi6mDXHSYadmJHhG
	yrnzapCxIXmf6h4nwAMsw9/1uXfhKNJNwmq/HEuoTNE1IvoG2/V22AgJrp+80wIbgrZHGdVGAPa
	OJkdf1zHqlfdYO5W9aNg/qP8ovgZ9XwGcktvGdm6601+5ZHa7MrPgfpqQ
X-Received: by 2002:a17:902:d50c:b0:265:57dc:977b with SMTP id d9443c01a7336-294cb6ab8afmr26086565ad.61.1761632896860;
        Mon, 27 Oct 2025 23:28:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJHI3hJVc5V8w2KfBaOGb+fbx2ZhMNUkTZo9hi0BOvSUZh3C76Y5JuAjU8EzyW78la+CcyYA==
X-Received: by 2002:a17:902:d50c:b0:265:57dc:977b with SMTP id d9443c01a7336-294cb6ab8afmr26086325ad.61.1761632896374;
        Mon, 27 Oct 2025 23:28:16 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf359asm102503265ad.12.2025.10.27.23.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 23:28:15 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 23:28:05 -0700
Subject: [PATCH 03/12] coresight-funnel: Handle delay probe for CPU cluster
 funnel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-cpu_cluster_component_pm-v1-3-31355ac588c2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761632890; l=4160;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=TMPIo9r3GKbM4/XsJ/eT0bym94bCuMEsVFDyTCJ0GQE=;
 b=GugX3k+ihfKyUBUqtYh1X+pw96lNXr/5f0/RSTbu9cBkZhi71QQJKr8CSmV3S1zYjioYc7gJN
 u+Pcw81DtinB6++tLNNOcS6Ou3iIHF7jRRdAtVGIPMdw74WXe+L4j+y
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-ORIG-GUID: BuzDwebCx07NQDmv0bBlVrdDGE2aJ2QN
X-Proofpoint-GUID: BuzDwebCx07NQDmv0bBlVrdDGE2aJ2QN
X-Authority-Analysis: v=2.4 cv=QuFTHFyd c=1 sm=1 tr=0 ts=69006281 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=B8lwgTuz66jIMM7eRW8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA1NCBTYWx0ZWRfX8fVk7iVpPIBg
 SCh+gUAJZH2RPlEojvVrJWfeC4AVfQHZ11yIKq4d71SePUXGFEWgWSX43PeklYbir5Lv8q3AIqz
 BZdILluPxeZXFZDTqq3R0Vdbp9Th9E4nFDHCeJbqK5IrvFd+Gl1I4Fx38lOYMwP0HIAG+gRSFKf
 zlksSNE4mA0k2UtEjFokNi7EQDuIvTSPEjtMDoBUa8ERnYJ03kNJ44PeyxvAKpxrexvwbo+BsvU
 ZhjWBW9cWfFiRUmnCjFE+SNvUG/hmCWewic+XTBg0dOdWKRJGlxb8dY+3sE6YdJRWqGRrniJLwu
 i8eoXWxBJWp5B1CWwrDg+PGzRzaebKvr6R1w7cNJ/ptOMI4hWujCx/tWkT8bdI3JiM26dsf2Ruh
 N6fYe0WmfCSePdypinirTUeYVKLMtg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_232818_173100_9FF922AB 
X-CRM114-Status: GOOD (  24.65  )
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

Delay probe the cpu cluster funnel when all CPUs of this cluster are
offline, re-probe the funnel when any CPU in the cluster comes online.

Key changes:
- Introduce a global list to track delayed funnels waiting for CPU online.
- Add CPU hotplug callback to retry registration when the CPU comes up.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-funnel.c | 62 +++++++++++++++++++++++---
 1 file changed, 57 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 12c29eb98b2122a3ade4cbed9a0d91c67ec777ed..43b9287a865eb26ce021521e4a5f193c48188bba 100644
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
  * @cpumask:	CPU mask representing the CPUs related to this funnel.
+ * @dev:	pointer to the device associated with this funnel.
+ * @link:	list node for adding this funnel to the delayed probe list.
  */
 struct funnel_drvdata {
 	void __iomem		*base;
@@ -51,6 +56,8 @@ struct funnel_drvdata {
 	unsigned long		priority;
 	raw_spinlock_t		spinlock;
 	struct cpumask		*cpumask;
+	struct device		*dev;
+	struct list_head	link;
 };
 
 struct funnel_smp_arg {
@@ -372,7 +379,7 @@ static int funnel_probe(struct device *dev, struct resource *res)
 		drvdata->cpumask = funnel_get_cpumask(dev);
 		if (!drvdata->cpumask)
 			return -EINVAL;
-
+		drvdata->dev = dev;
 		cpus_read_lock();
 		for_each_cpu(cpu, drvdata->cpumask) {
 			ret = smp_call_function_single(cpu,
@@ -380,10 +387,15 @@ static int funnel_probe(struct device *dev, struct resource *res)
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
@@ -395,9 +407,12 @@ static int funnel_remove(struct device *dev)
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
 
@@ -535,8 +550,41 @@ static struct amba_driver dynamic_funnel_driver = {
 	.id_table	= dynamic_funnel_ids,
 };
 
+static int funnel_online_cpu(unsigned int cpu)
+{
+	struct funnel_drvdata *drvdata, *tmp;
+	int ret;
+
+	list_for_each_entry_safe(drvdata, tmp, &funnel_delay_probe, link) {
+		if (cpumask_test_cpu(cpu, drvdata->cpumask)) {
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
@@ -544,6 +592,10 @@ static int __init funnel_init(void)
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


