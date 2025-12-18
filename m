Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07220D68BF0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 08:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6gTdyh4ezqxD0vBFXnAxPCcE/QYPv9tIPmuui16gpC4=; b=LzRCWyvhciyPcA72gGcfXHwNfc
	sX9zLO7aMwGVQ8ACZESimqDTjGuz1hyLOd0fQMbAaUgEm6VZuIFen2LlXUAwLN/m1sHT5gkpvHTPC
	Ym7+4unlqZZ/aZhxrFI56Kykn28TTjiWk8aW1ejKKB/gmwJyXA7NAvg7D5OtR6pz2hrS4Yh+lh+8X
	0Sd7fF+f1kEMe9CsGNmRO+UdMGuloNhb4pCHBV7fg2e/sCMP5nTWAa3IapfgPhtyxusrjmwfuWSNC
	ZPNKzXVoxr1QbKRnUu/4ruCF+HnnpniMz085n8JsmLyKzO2euSdSIOixB3gpWUeBcuzCV6egO/IYm
	XJZ5FecA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW96M-0000000812u-0X2G;
	Thu, 18 Dec 2025 08:11:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW966-000000080qe-2TUv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 08:10:57 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YUY34057273
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 08:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6gTdyh4ezqxD0vBFXnAxPCcE/QYPv9tIPmuui16gpC4=; b=VpV6A/revRiIIl+/
	NQ/DxaoinM/GeEKH76trAlesoPufJxG20NH8PHvoFAr01peVL6A6vZViW4rnU+Bp
	9+0O6eybI1zCh01DREQoCJH2lfUyZjV0MwNTHuP+F0WtDWiHgrf1mENatvllDMk7
	3lmbxLpJcSv7N+/RN4f/sQAb5J3qFvhKZqJGFMWQ8aPDJdb4KZfzcjiJn0RzvCbB
	lnOHg2WUtFZ8xvhf91fpcof1KGBRHXtB6F6TqcMAdIzGoU2vhG7irGHhySr+TbWp
	ygSS5Rf2lBreAx4domOaYm8ng3pYyTLZTihqOeZlpeRhROzXTbeuOjY5+UipJx3m
	4CPYTA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3xr5ap8h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 08:10:53 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b471737e673so512589a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 00:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766045453; x=1766650253; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6gTdyh4ezqxD0vBFXnAxPCcE/QYPv9tIPmuui16gpC4=;
        b=jmcOIVFDX2/r3t5alUUdMomtv51WaN5wMsRsq87PTbMIQ6EvOUjm3iFdap1uWzSOF/
         w0GnstBsc3fwaJAC7acBv6TqnWVOVApFXIZpsGe8IZZ5ZeUAWdbpp6z3xsmQWgYMC4kt
         ZJru9KOCvES/AspAkNX4k9bkbMcP2KcSETXIgY6p/XNtgfzg8WnRMA/RPc6T85Yx2JyA
         43cOsIwGfkPf5AYEIUAyCgk7vMW02ZzTdZrh6mgUnH4u8hrdf0+ArRpuFuTmNP0oqSb0
         Q7Tr/+ouk839pIcnRytCES3PqGPLDB391ysH3ha2reoq5bAgPjClxyPyNj4FJ1PDn3dX
         o09w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766045453; x=1766650253;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6gTdyh4ezqxD0vBFXnAxPCcE/QYPv9tIPmuui16gpC4=;
        b=Kuec08xoJsFOwVtbbgJyzXz9aDAqREOf7VwNkdwCk9E1DSDQqMO3TeDKZWePy/WB3R
         MY9XweP+L8eC/7rZ7a4lNjQ1OnWUzHN/VyR/GXKn4EttnXaD9NzcCL/rkh7dRdRPJ3ZH
         3tQW0s2o/DZhgOEj0L2zPW/uv0NKHh89niwScZKscO/fknVnDeFTbW3TFFplT1Z6YAj/
         +g8qt5bF8AGtmsdqCI1smNkfY4M5pv83R/c5kMUh7rdJN6uJlkNp33LPWlw1CnJF+xy9
         Cp24WCvDbb9Of8Os/B4Fq9xOL7qpRZXlvK9raFmv9KHO43k8VC4n2QkjNsdSZQNOZBbq
         wbxw==
X-Forwarded-Encrypted: i=1; AJvYcCWTlGmya4VDNKaZ+zQW6VsqOfuqCXKQyt6HSCwIG8XUDgS5EypPIhSd0GtbzI8Xma5wdVVbwTxmZesOhM/FHJLv@lists.infradead.org
X-Gm-Message-State: AOJu0YyMvQptuOmfZkk06Uo9HN4dFLRldUEo85oLLbWpG8JRRc4gL+EV
	FmYDWsH3TZh6eZccDyh2fCFnZTfva1OylD9Ei4FAcB7nu12E3bEjcc1zPG5T46/pl0GXVt2giyc
	Iakk2LW9b5W5KO8AR8Jp+L+b8qkFf92SawJM5PH3QuEPZ8EsTzQxDm++8m4Uug4QBWBPOpLqPFh
	RHUg==
X-Gm-Gg: AY/fxX4U79lvcRdJ2GzXnPdJFkvzgBCq+8QyQBzzySlNR4Fi4jL8gbp3nthejagFWoV
	98ZBmsdqS9Y+dSwLYEW3zwOmrGUx3ToBdSLypscEJfJxjUExaMiQtPCalDH8Jx53UiqUxU+7NTn
	kFq/hZSwlpTYsUKa1UadUioUswGCCSpwliSoCeTCgvZxgJJ5OH64PVXvThzoPSWEzSrVzcLFVWw
	FiA2h6Ejc1vhV1+anC4zC9R2i/bHgcRUqrPgR6d1Wyt6cmBOIYp7pJ0SsD71tyc/Ddy0EU5GT7Q
	pGufp5+ZNIPQnaMEouZ16R4ySp7Q/RDlWE/F93VoSLYW+jkv/3gDY4uZ1YOxhbp7+VzX8RbzmjO
	V6wpwq/l3wU8OxT9YXB0PUiwlGfK/IREnrjM3F7jivbNp8IF62JwCN8/GegVY+NE6AiQ=
X-Received: by 2002:a05:7300:d216:b0:2af:fbb:97d6 with SMTP id 5a478bee46e88-2af0fbb9db4mr3375385eec.42.1766045452460;
        Thu, 18 Dec 2025 00:10:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGy6O37P7HcdZeyhdXCt5nCSuOfsjpbYAlMSKZnHn47tlAEdu/BEZdw077Uc0D8iY6mjzDk0w==
X-Received: by 2002:a05:7300:d216:b0:2af:fbb:97d6 with SMTP id 5a478bee46e88-2af0fbb9db4mr3375353eec.42.1766045451916;
        Thu, 18 Dec 2025 00:10:51 -0800 (PST)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b04e58d423sm2564824eec.6.2025.12.18.00.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 00:10:51 -0800 (PST)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 00:09:50 -0800
Subject: [PATCH v2 10/12] coresight-tmc: Defer probe when associated CPUs
 are offline
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-cpu_cluster_component_pm-v2-10-2335a6ae62a0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766045439; l=4877;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=IB9YQIjoTl8ZOJK7bPPU9ZsiC7//VeDVaYjoFiQJcPE=;
 b=UImHFUGLEN5dtzF1iBXsV0IkphcLBAir0d5O1DosY6wiCmPvKT6KcI1es7/TAxBzlwuv7XkaG
 R94jgxoUDKfDMBnuRFGitFAmzSSyqiGLo7ujkx1OpONeUaniOhZUYMz
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-GUID: ituq4Hmzz5fRKdRB5XZ6S1m-pR59F-Gh
X-Authority-Analysis: v=2.4 cv=DsBbOW/+ c=1 sm=1 tr=0 ts=6943b70d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fD5cxDGOUVrWaoTO3WMA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA2NiBTYWx0ZWRfX6+q9lFpi3jZo
 CKiDFmgs8FRhRZFTPxwamgCrFnDz/yEHRfZKfori/c14NHYOJevpXBKea1V09/aRBkXU3OucJy7
 oMMuVzqY+6h0uECMUHPhiesTIBNiTOUsmdhxeaiTQcF5WnmigyjpnXLR3d/0r3ZNXTJNIdswNHN
 BEQmNGdeP/QRGiQ0Djoe6OJ6Puqwb5a4RHdaS62gPq87jxUxV4KJ4qhzDBM2yKUI4QeSQ1qbUlx
 gvIB0cAc9ciXUY/ZbfvLCkgTCTJ++wKjs5MD/MKcSk2u7LjndbbhQ75j4HbWyWOch9XMsrRakBM
 satPrVI+/wQpU/kypF6VN0eH8HV59Z9xRsntuedEwrgX9QnHajfVV94mhd3okNsfcughz1vUXWA
 Lw1dKHtL7sQA4MrVs8Wzr+r80mvyew==
X-Proofpoint-ORIG-GUID: ituq4Hmzz5fRKdRB5XZ6S1m-pR59F-Gh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_001055_746466_791D3CA5 
X-CRM114-Status: GOOD (  23.56  )
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

On some platforms, the TMC driver may probe before the associated CPUs
are online. This prevents the driver from securely accessing the
hardware or configuring it via smp_call_function_single(), which
requires the target CPU to be available.

To address this, defer the hardware initialization if the associated
CPUs are offline:
1. Track such deferred devices in a global list.
2. Register a CPU hotplug callback (`tmc_online_cpu`) to detect when
   a relevant CPU comes online.
3. Upon CPU online, retry the hardware initialization and registration
   for the waiting TMC devices.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 59 +++++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tmc.h      |  4 ++
 2 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 5b9f2e57c78f42f0f1460d8a8dcbac72b5f6085e..9182fa8e4074a7c9739494b2f5d59be2e96f1d3d 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -36,6 +36,9 @@
 DEFINE_CORESIGHT_DEVLIST(etb_devs, "tmc_etb");
 DEFINE_CORESIGHT_DEVLIST(etf_devs, "tmc_etf");
 DEFINE_CORESIGHT_DEVLIST(etr_devs, "tmc_etr");
+static LIST_HEAD(tmc_delay_probe);
+static enum cpuhp_state hp_online;
+static DEFINE_SPINLOCK(delay_lock);
 
 int tmc_wait_for_tmcready(struct tmc_drvdata *drvdata)
 {
@@ -1027,6 +1030,8 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		if (!drvdata->supported_cpus)
 			return -EINVAL;
 
+		drvdata->dev = dev;
+
 		cpus_read_lock();
 		for_each_cpu(cpu, drvdata->supported_cpus) {
 			ret = smp_call_function_single(cpu,
@@ -1034,11 +1039,16 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 			if (!ret)
 				break;
 		}
-		cpus_read_unlock();
+
 		if (ret) {
+			scoped_guard(spinlock,  &delay_lock)
+				list_add(&drvdata->link, &tmc_delay_probe);
+			cpus_read_unlock();
 			ret = 0;
 			goto out;
 		}
+
+		cpus_read_unlock();
 	} else {
 		tmc_init_hw_config(drvdata);
 	}
@@ -1103,8 +1113,12 @@ static void __tmc_remove(struct device *dev)
 		misc_deregister(&drvdata->miscdev);
 	if (drvdata->crashdev.fops)
 		misc_deregister(&drvdata->crashdev);
-	if (drvdata->csdev)
+	if (drvdata->csdev) {
 		coresight_unregister(drvdata->csdev);
+	} else {
+		scoped_guard(spinlock,  &delay_lock)
+			list_del(&drvdata->link);
+	}
 }
 
 static void tmc_remove(struct amba_device *adev)
@@ -1215,14 +1229,55 @@ static struct platform_driver tmc_platform_driver = {
 	},
 };
 
+static int tmc_online_cpu(unsigned int cpu)
+{
+	struct tmc_drvdata *drvdata, *tmp;
+	int ret;
+
+	spin_lock(&delay_lock);
+	list_for_each_entry_safe(drvdata, tmp, &tmc_delay_probe, link) {
+		if (cpumask_test_cpu(cpu, drvdata->supported_cpus)) {
+			list_del(&drvdata->link);
+
+			spin_unlock(&delay_lock);
+			ret = pm_runtime_resume_and_get(drvdata->dev);
+			if (ret < 0)
+				return 0;
+
+			tmc_init_hw_config(drvdata);
+			tmc_clear_self_claim_tag(drvdata);
+			tmc_add_coresight_dev(drvdata->dev);
+			pm_runtime_put(drvdata->dev);
+			spin_lock(&delay_lock);
+		}
+	}
+	spin_unlock(&delay_lock);
+	return 0;
+}
+
 static int __init tmc_init(void)
 {
+	int ret;
+
+	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
+					"arm/coresight-tmc:online",
+					tmc_online_cpu, NULL);
+
+	if (ret > 0)
+		hp_online = ret;
+	else
+		return ret;
+
 	return coresight_init_driver("tmc", &tmc_driver, &tmc_platform_driver, THIS_MODULE);
 }
 
 static void __exit tmc_exit(void)
 {
 	coresight_remove_driver(&tmc_driver, &tmc_platform_driver);
+	if (hp_online) {
+		cpuhp_remove_state_nocalls(hp_online);
+		hp_online = 0;
+	}
 }
 module_init(tmc_init);
 module_exit(tmc_exit);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index b104b7bf82d2a7a99382636e41d3718cf258d820..2583bc4f556195cd814e674dc66f08909dea61b2 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -246,6 +246,8 @@ struct tmc_resrv_buf {
  * @supported_cpus:	Represent the CPUs related to this TMC.
  * @devid:	TMC variant ID inferred from the device configuration register.
  * @desc_name:	Name to be used while creating crash interface.
+ * @dev:	pointer to the device associated with this TMC.
+ * @link:	link to the delay_probed list.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -279,6 +281,8 @@ struct tmc_drvdata {
 	struct cpumask		*supported_cpus;
 	u32			devid;
 	const char		*desc_name;
+	struct device		*dev;
+	struct list_head	link;
 };
 
 struct etr_buf_operations {

-- 
2.34.1


