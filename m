Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B5FD68BED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 08:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cNH63exyhTmIcemy4/YjTfy8jDYpUWUjpvcUJrfWdgU=; b=fY466ozKM8TiVasUAigrRIiX1W
	TbZQPKnsSSpZWgepy8XmOjJtnbZfFWNSV/iZ4wqrLAnlOiY6DfuHJDe1HqjFxBK9jbBWcHpGNaKVa
	5U13Im3ZQaE4WqsPt1eSlCdbnQ7upSslYgoBIHOFLP0Wpb2YQ/acojeYpApv/5A4q7ihVVLn2I80S
	NTXv9loszHmLMpxdBDjwWk1/jQhyx53LiWgQmjTDEzstR+MDjAB29PJUqJ/wAnCp2rBxy0QNjvlM/
	/K9KuczEsFRsvdx+P4N/dFv0RdjTJEA03fv/FhmcwIG8GPSjgda9/Kck7k5D6o+GEq3oFfEHXK7WM
	+nCphNNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW95z-000000080nO-23Cq;
	Thu, 18 Dec 2025 08:10:47 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW95w-000000080lt-3gO9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 08:10:46 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI1YU1I4057276
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 08:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cNH63exyhTmIcemy4/YjTfy8jDYpUWUjpvcUJrfWdgU=; b=R0LckyiQx7Vz5Glw
	JUHIvlCeO86pmxbCF3yddwHW4f2haJktLClGqNcYiXVxUeBuvkaFCdrYbveMMhed
	Ox7aXp8aVx8UQWbazOMGOQgLZucJiMoGI9YtOZw7J/EwrlWhIORdezkvIOPG6cRp
	edBqAeAeNxAo+KQ0P3iqtA1Us/xY2ZMKuZIDt++/DxSNCiyY1k9onhICdZGbzRAT
	NDa6huCwKOU5TVjPyxtDOqoegf67GcZ+9gdx8SR+RmzlYeYnAe9DPxckoXTATaPM
	RBzk6XmgYs1OGzIRkNLGkP1gCnut8q0mDAk/J80kihZSAttr+H8PApI3TTEWEbjX
	d+VbCQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3xr5ap72-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 08:10:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a0bb1192cbso8679795ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 00:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766045443; x=1766650243; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cNH63exyhTmIcemy4/YjTfy8jDYpUWUjpvcUJrfWdgU=;
        b=eRT9vgQJdOIodS3Fp0aKCOMG5os3fSEG1FueZX7lzE9K/G0H/uD/AZ2O9keTPrYqXq
         rWvYYjFquDrL/jVUlEUjs8McYi9Vnqonefhi57TLaM+EepFm8jFFvBnu6tsUcYYWt4GB
         YW9DD54MmgNRzRADuM+PoLOwZU50lzLI+TXze4E9Sc5CMpIzaQfOk5F9zeTklX1jbFpg
         lJvNx37/4RXmpCTeATtEUdAti8x2hmq3jNb4Tix+nMamCnVtpq2h93ttVBhBFvzf6oUJ
         A4J+qCAE1XidKP+Eu9BrNlW7RK0d71psrCVLAvodcaamvoL09jVmDsF4zhCzamXjmUOP
         X+IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766045443; x=1766650243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cNH63exyhTmIcemy4/YjTfy8jDYpUWUjpvcUJrfWdgU=;
        b=ACberdtpZ6I6d9ZP6t7rXzRovqQXpJ+t4/AheE7pax8lRUe8tthC3DCuf9X/N6Wwp9
         keFo+vKmV6XK6IrWFXRa737NU6pKzMR4hdl/l4hRuWSXlwMF03qmG06n7Jw7cW5XKyoz
         qdPAHtN+Ya9BO70tJis2fnMPV/LNVtUEskoNMUCt78vbtTTBlWGciBXZQClckBw63iXQ
         IfrYJqIGhCF3ULw2Vfr+V9924NwtAtbSzLsuN9M7Qkfq0PrnPUvS1HTvfhTiSUy24Wib
         nif7XCDeHDheJpKm4Z5Eoeq8ashCKi4/QT7ciS6yBCRoPEl9bn4Ey2E/Tcx3zgqM2lbe
         pQVw==
X-Forwarded-Encrypted: i=1; AJvYcCVUDp6TpyewAOTDEg9Oi+RyYinksfRF/ImedN58CueSeLiXdgmVXGAlItECaXSKpM1kmat0srYkStWffUOHX3Ja@lists.infradead.org
X-Gm-Message-State: AOJu0YxUPL4IqrqFkhNYkPU86h/nFrEg8FyR7QcjcjGN43VTXJ0xGy75
	vAt9RD656bZN+r+0ELdOfuGrybT0pEN6HVhtySdhfix70zWRN9k/+z5fykmf1X4MtwOxRSPti3V
	afHLoqUVFZ7feH2Ufs0w4thNT9cY4M8Z3o+XqfFts9bPo7MnK6Z6bgS96qlb5dlj5PYd1If8psF
	NvJw==
X-Gm-Gg: AY/fxX4SQ0E582qJZLsqDr37j9EtmOzdDPNdmnI7OtGz6o96dKNjC39sm4/eso+8xP4
	/H+JALCB1y+oLEQX2go9M4kPbF7UDn2o/v46jvQkHc6fcaD/eh8kyghUEMICkpKvUCPZ/xlrbRU
	6Z+NmRruvNpX03CVhPfPxaEdNvhIhWBhCmvvStVDwAw3N5Yd0aeVN3uFdrlsZCBTgqEa0zbTm8d
	8bjp+Atn0+Ko1NuhZLfKzDtEESSkeaqZ/G8nWKPGSDwLS0ekhZwnaLlmcdus/VI3NWb4jUOOk/n
	zBHRjsvgziXYELE89LEhC+GCljB+MksH5rQlp1E1cFiQW9bArBSyJ1sHXvBZoIJ1trLvORprgk4
	SN4yMG3XHXueKplhijtoxu/ZH8+u2EWQuYEVwN3gubD0H9h4xFuobOd+Mk9HZndk1Rqg=
X-Received: by 2002:a05:7022:f686:b0:119:e569:fba9 with SMTP id a92af1059eb24-11f354cc907mr18256791c88.24.1766045442786;
        Thu, 18 Dec 2025 00:10:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF3Pquf355K3Y1FFskaQnCkkuyO/O4usAru27v+VGDNITq7dta4Vgx4zQjMo851Kc2edI937w==
X-Received: by 2002:a05:7022:f686:b0:119:e569:fba9 with SMTP id a92af1059eb24-11f354cc907mr18256751c88.24.1766045442231;
        Thu, 18 Dec 2025 00:10:42 -0800 (PST)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b04e58d423sm2564824eec.6.2025.12.18.00.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 00:10:41 -0800 (PST)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 00:09:42 -0800
Subject: [PATCH v2 02/12] coresight-funnel: Support CPU cluster funnel
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251218-cpu_cluster_component_pm-v2-2-2335a6ae62a0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766045439; l=9011;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=Fpp/5eQxMyG5rpvoNvxSYiDKJ7rnTCbi3mj2igPMxLU=;
 b=BavpAy9r7xKAgf/EbkDhLS/jCe/ZLPOLxE+sU7ckt40H3lLyYD/fFw77y3H7DyHloXrCfJK9C
 K6Bc7EKVjfMD71KSm5dlRQXRyjiuhr6czi4m3WboiAsLxZvj4T1Jz6e
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-GUID: L5Fi--w-pCcWVtmS7a7mO1FJm2h6ngQC
X-Authority-Analysis: v=2.4 cv=DsBbOW/+ c=1 sm=1 tr=0 ts=6943b703 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ntKk2pyKPOpeOXeRekoA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA2NiBTYWx0ZWRfX5LsiidX4VQWU
 z7OqD8+UR1M/HBeatkuYe0MsOPfRxGwu9MGPl4U0cmQ/ayLAMjhq6zCL3n9YdmG60QtKAPFpdro
 hKyuTAlUBq9cl+aUkwGygGeD35KSOm/SpHq8DD5XdY/mOUxH7APhExt8LfLxjOv2Sz89FXRYrNV
 1dyYviRMRCUQ0T49BsBcBckYFDQEOCvWzw1guw2agfthojNAgJh97OVJSv+3y8G314yy1rJxgUN
 SRhYD4kNLOXw5qZmrq1k/ZYS0vq17+7vHANYMy9Sm7OdWHBYT24Ez6MdptwYZMriH45UViLL6im
 ZhZER6QZZiK+S8PPGd071IdJgZBMArYmFQstjQd3Mo8bNO37D8cX7YDLrvl9diVqeeW94TYmn90
 pacwdmfTNyCnYMKGdrUa3LRxGAZzPQ==
X-Proofpoint-ORIG-GUID: L5Fi--w-pCcWVtmS7a7mO1FJm2h6ngQC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_001045_053428_006C369B 
X-CRM114-Status: GOOD (  24.64  )
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

Funnels associated with CPU clusters reside in the cluster's power domain.
Unlike dynamic funnels (which are typically system-wide), these per-cluster
funnels are only accessible when the cluster is powered on. Standard
runtime PM may not suffice to wake up a cluster from low-power states,
making direct register access unreliable.

Enhance the funnel driver to support these per-cluster devices:

1. Safe Initialization:
   - Identify CPU cluster funnels via "qcom,cpu-bound-components".
   - Use smp_call_function_single() to perform hardware initialization
     (claim tag clearing) on a CPU within the cluster.
   - Refactor the probe flow to encapsulate device registration in
     funnel_add_coresight_dev().

2. Cross-CPU Enablement:
   - Update funnel_enable() to use smp_call_function_single() when
     enabling the hardware on a cluster-bound funnel.

3. Debug Interface Support:
   - Update funnel_ctrl_show() to safely read the control register via
     cross-CPU calls when necessary.

This ensures that funnel operations remain safe and functional even when
the associated CPU cluster is in aggressive low-power states.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-funnel.c | 183 ++++++++++++++++++++-----
 1 file changed, 152 insertions(+), 31 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 3b248e54471a38f501777fe162fea850d1c851b3..a1264df84ab4c625c63dfbb9b7710b983a10c6b4 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/coresight.h>
 #include <linux/amba/bus.h>
@@ -40,6 +41,7 @@ DEFINE_CORESIGHT_DEVLIST(funnel_devs, "funnel");
  * @csdev:	component vitals needed by the framework.
  * @priority:	port selection order.
  * @spinlock:	serialize enable/disable operations.
+ * @supported_cpus:	Represent the CPUs related to this funnel.
  */
 struct funnel_drvdata {
 	void __iomem		*base;
@@ -48,6 +50,13 @@ struct funnel_drvdata {
 	struct coresight_device	*csdev;
 	unsigned long		priority;
 	raw_spinlock_t		spinlock;
+	struct cpumask		*supported_cpus;
+};
+
+struct funnel_smp_arg {
+	struct funnel_drvdata *drvdata;
+	int port;
+	int rc;
 };
 
 static int dynamic_funnel_enable_hw(struct funnel_drvdata *drvdata, int port)
@@ -76,6 +85,33 @@ static int dynamic_funnel_enable_hw(struct funnel_drvdata *drvdata, int port)
 	return rc;
 }
 
+static void funnel_enable_hw_smp_call(void *info)
+{
+	struct funnel_smp_arg *arg = info;
+
+	arg->rc = dynamic_funnel_enable_hw(arg->drvdata, arg->port);
+}
+
+static int funnel_enable_hw(struct funnel_drvdata *drvdata, int port)
+{
+	int cpu, ret;
+	struct funnel_smp_arg arg = { 0 };
+
+	if (!drvdata->supported_cpus)
+		return dynamic_funnel_enable_hw(drvdata, port);
+
+	arg.drvdata = drvdata;
+	arg.port = port;
+
+	for_each_cpu(cpu, drvdata->supported_cpus) {
+		ret = smp_call_function_single(cpu,
+					       funnel_enable_hw_smp_call, &arg, 1);
+		if (!ret)
+			return arg.rc;
+	}
+	return ret;
+}
+
 static int funnel_enable(struct coresight_device *csdev,
 			 struct coresight_connection *in,
 			 struct coresight_connection *out)
@@ -86,19 +122,24 @@ static int funnel_enable(struct coresight_device *csdev,
 	bool first_enable = false;
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
-	if (in->dest_refcnt == 0) {
-		if (drvdata->base)
-			rc = dynamic_funnel_enable_hw(drvdata, in->dest_port);
-		if (!rc)
-			first_enable = true;
-	}
-	if (!rc)
+
+	if (in->dest_refcnt == 0)
+		first_enable = true;
+	else
 		in->dest_refcnt++;
+
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
-	if (first_enable)
-		dev_dbg(&csdev->dev, "FUNNEL inport %d enabled\n",
-			in->dest_port);
+	if (first_enable) {
+		if (drvdata->base)
+			rc = funnel_enable_hw(drvdata, in->dest_port);
+		if (!rc) {
+			in->dest_refcnt++;
+			dev_dbg(&csdev->dev, "FUNNEL inport %d enabled\n",
+				in->dest_port);
+		}
+	}
+
 	return rc;
 }
 
@@ -188,15 +229,39 @@ static u32 get_funnel_ctrl_hw(struct funnel_drvdata *drvdata)
 	return functl;
 }
 
+static void get_funnel_ctrl_smp_call(void *info)
+{
+	struct funnel_smp_arg *arg = info;
+
+	arg->rc = get_funnel_ctrl_hw(arg->drvdata);
+}
+
 static ssize_t funnel_ctrl_show(struct device *dev,
 			     struct device_attribute *attr, char *buf)
 {
 	u32 val;
+	int cpu, ret;
 	struct funnel_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	struct funnel_smp_arg arg = { 0 };
 
 	pm_runtime_get_sync(dev->parent);
-
-	val = get_funnel_ctrl_hw(drvdata);
+	if (!drvdata->supported_cpus) {
+		val = get_funnel_ctrl_hw(drvdata);
+	} else {
+		arg.drvdata = drvdata;
+		for_each_cpu(cpu, drvdata->supported_cpus) {
+			ret = smp_call_function_single(cpu,
+						       get_funnel_ctrl_smp_call, &arg, 1);
+			if (!ret)
+				break;
+		}
+		if (!ret) {
+			val =  arg.rc;
+		} else {
+			pm_runtime_put(dev->parent);
+			return ret;
+		}
+	}
 
 	pm_runtime_put(dev->parent);
 
@@ -211,22 +276,68 @@ static struct attribute *coresight_funnel_attrs[] = {
 };
 ATTRIBUTE_GROUPS(coresight_funnel);
 
+static void funnel_clear_self_claim_tag(struct funnel_drvdata *drvdata)
+{
+	struct csdev_access access = CSDEV_ACCESS_IOMEM(drvdata->base);
+
+	coresight_clear_self_claim_tag(&access);
+}
+
+static void funnel_init_on_cpu(void *info)
+{
+	struct funnel_drvdata *drvdata = info;
+
+	funnel_clear_self_claim_tag(drvdata);
+}
+
+static int funnel_add_coresight_dev(struct device *dev)
+{
+	struct coresight_desc desc = { 0 };
+	struct funnel_drvdata *drvdata = dev_get_drvdata(dev);
+
+	if (drvdata->base) {
+		desc.groups = coresight_funnel_groups;
+		desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);
+	}
+
+	desc.name = coresight_alloc_device_name(&funnel_devs, dev);
+	if (!desc.name)
+		return -ENOMEM;
+
+	desc.type = CORESIGHT_DEV_TYPE_LINK;
+	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
+	desc.ops = &funnel_cs_ops;
+	desc.pdata = dev->platform_data;
+	desc.dev = dev;
+
+	drvdata->csdev = coresight_register(&desc);
+	if (IS_ERR(drvdata->csdev))
+		return PTR_ERR(drvdata->csdev);
+	return 0;
+}
+
+static struct cpumask *funnel_get_supported_cpus(struct device *dev)
+{
+	struct generic_pm_domain *pd;
+
+	pd = pd_to_genpd(dev->pm_domain);
+	if (pd)
+		return pd->cpus;
+
+	return NULL;
+}
+
 static int funnel_probe(struct device *dev, struct resource *res)
 {
 	void __iomem *base;
 	struct coresight_platform_data *pdata = NULL;
 	struct funnel_drvdata *drvdata;
-	struct coresight_desc desc = { 0 };
-	int ret;
+	int cpu, ret;
 
 	if (is_of_node(dev_fwnode(dev)) &&
 	    of_device_is_compatible(dev->of_node, "arm,coresight-funnel"))
 		dev_warn_once(dev, "Uses OBSOLETE CoreSight funnel binding\n");
 
-	desc.name = coresight_alloc_device_name(&funnel_devs, dev);
-	if (!desc.name)
-		return -ENOMEM;
-
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
 	if (!drvdata)
 		return -ENOMEM;
@@ -244,9 +355,6 @@ static int funnel_probe(struct device *dev, struct resource *res)
 		if (IS_ERR(base))
 			return PTR_ERR(base);
 		drvdata->base = base;
-		desc.groups = coresight_funnel_groups;
-		desc.access = CSDEV_ACCESS_IOMEM(base);
-		coresight_clear_self_claim_tag(&desc.access);
 	}
 
 	dev_set_drvdata(dev, drvdata);
@@ -258,23 +366,36 @@ static int funnel_probe(struct device *dev, struct resource *res)
 	dev->platform_data = pdata;
 
 	raw_spin_lock_init(&drvdata->spinlock);
-	desc.type = CORESIGHT_DEV_TYPE_LINK;
-	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_MERG;
-	desc.ops = &funnel_cs_ops;
-	desc.pdata = pdata;
-	desc.dev = dev;
-	drvdata->csdev = coresight_register(&desc);
-	if (IS_ERR(drvdata->csdev))
-		return PTR_ERR(drvdata->csdev);
 
-	return 0;
+	if (fwnode_property_present(dev_fwnode(dev), "qcom,cpu-bound-components")) {
+		drvdata->supported_cpus = funnel_get_supported_cpus(dev);
+		if (!drvdata->supported_cpus)
+			return -EINVAL;
+
+		cpus_read_lock();
+		for_each_cpu(cpu, drvdata->supported_cpus) {
+			ret = smp_call_function_single(cpu,
+						       funnel_init_on_cpu, drvdata, 1);
+			if (!ret)
+				break;
+		}
+		cpus_read_unlock();
+
+		if (ret)
+			return 0;
+	} else if (res) {
+		funnel_clear_self_claim_tag(drvdata);
+	}
+
+	return funnel_add_coresight_dev(dev);
 }
 
 static int funnel_remove(struct device *dev)
 {
 	struct funnel_drvdata *drvdata = dev_get_drvdata(dev);
 
-	coresight_unregister(drvdata->csdev);
+	if (drvdata->csdev)
+		coresight_unregister(drvdata->csdev);
 
 	return 0;
 }

-- 
2.34.1


