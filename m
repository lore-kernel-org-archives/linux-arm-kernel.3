Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CCACCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 06:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ihaICepOH/H2KF61P/KWnAMH4iJmI07j1aiDcVn4nw0=; b=zrkMeZhzrcOZyN1BhzzRBw/ZX1
	vRkBAXsLPdyrRMVsLK860dTqxEzfKpwOGp2izQNNYDiOyloHRsAA+RBkOmVn580WXODIbMbyGt2g1
	n1X43TfHDfxuCO+U8OysXem4sqBiOoQp0SuN1unLTvdhn2N9bC43309QNop+PcvNnWQoimXionbls
	dhp4g+QMZDDd21UiKndYLEsZFJEn+N2/gbrALuQPG71wRg0U1npkDCxmdiwRNWWZh5/4/HQ34EDAc
	1B5NoRI//fuIKW6Nc09AszMpEPG7TeLRux/mmBGVgNULTxWdRHS9PFRkjoUDyvq/xLRc8ayX4NHta
	r10HwdGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdBu-0000000FKwT-02Oa;
	Tue, 28 Oct 2025 06:28:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdBp-0000000FKuO-2FJt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 06:28:18 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S3eppo3165428
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 06:28:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ihaICepOH/H2KF61P/KWnAMH4iJmI07j1aiDcVn4nw0=; b=IvbUDwi0+gLPIW6t
	Mshh+4EJYSr23lTAw9NvhaANgTOIaAtyoJCiPlkqfhcRKuKjYXyZWqTHRWdy51tv
	H3DCHnhNHqtnr/z3J9nEu9xHo4tsTisPJOcQCy5m94CvWWNFIPmSthJPdhpvFrcq
	FlEVRKXCfmHgFGtXIe5GxOup55tLgMNKlFYshsBYtzrrJ1JsXw1BPcwqoxt3PEIV
	JbzIgmpPx/HvGQC88CAK1YwjQvJYMnCjhXhNGbOkg9nCZmeSF9Gi82jQwUGzgluk
	g1EJs7d45yb5Z/ySldH3Pmq0CJtfKBZEkrzr0qKgDI56jdHA1C6WVwMueVzNNoTI
	cM53tQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2bwx23sn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 06:28:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-33da21394adso5383812a91.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 23:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761632896; x=1762237696;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ihaICepOH/H2KF61P/KWnAMH4iJmI07j1aiDcVn4nw0=;
        b=pys6gYopCiyanBOaD00Xz4klHxbjse38P92YnxZFdQWwEE0bq/+l3cLKOwycujiNjY
         yt8q8MHecxL0DwVk9oyEh6As45xE9VFBFxcQU0/W0M0aO65XbtHk0GLMtrMRdUMjVFbg
         aWonmBwou6xNVBk+BmBmvJyqVyWOCApTJUJLAw4uAmabMmYIyTjk6G6+xydan7OzdY2R
         AcCoGM6ycER2JN8W98OPh5i71fTQ0IJ8nzOuUOxvnBnt8qxcy3FvaWn/DtcMghrbPtrT
         HtQH3xX/nMGcIiM1m4IMqzfTBRxnmnpd7qWdm634jESQp7n2jA0i/PMx7P+1LJdzxN4v
         9oMw==
X-Forwarded-Encrypted: i=1; AJvYcCV0D9GAR7RFtsUw2tWlZBcED86OHlmNq6Hq3O8SuljwgdltsV7N+MYASDxPTdUT01ecviCQ6MohT6IIEh3Ij5mK@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc2D6UZsiR9ehT8A3rTt8r2glZcaJyv98VkRhKRNeQzX9f1Kp+
	hy5L/jSqsNfHNZf/V5Ba2zBzDDsqiki6SE8uK+oQKCCL5h3K8tiRVvbjeFo2kG9LSY+gw+GXsQN
	QmVzXv1SVMVGO8E8VuxJSaYYltC7q8c5dfKd733RWVu9fEz8R/4TBxFjV7d2dY89IaBjXURZuOp
	c6ug==
X-Gm-Gg: ASbGnctyUX2kuhUgLY/VGt1DVY+nKBq2ucDtsmZJUMcNKupRhMKmBcq9WOeDSa9W9tG
	x4ZwMCB9Q2hDg9fFZ76eeG1zIWb4QVgjkMYjFW45bulBfm9EP0MxLOs2ekKgHr+3L3Lh3UDwwfc
	5qDjrQjEGVyHoE8QvEb5v+RO804KrEY6TvTYDYRY3OOHz2++ZTimC94aMdMTeYZW4/Ey7rrUynd
	doQCFHE0s3m8Xz3b/TUNk2OUkLpYd4oYfnNvbpzn2hV7jt8X1y3bI50NQLXrPM8HjRsLhFdlZBx
	gFmQErjrNkF1EZf8QBc2jAUje9u2oZe5eXHHMqg8w5VOp5HL97ToKt6tHHZ2g4HCKqoOpkmO7Nc
	2E+v7kiOmFH1HxHTyOS4VNv8vuSH6G4645oTsXZGnHTHtyozkDZbD2JuT
X-Received: by 2002:a17:902:ea08:b0:246:7a43:3f66 with SMTP id d9443c01a7336-294cb37a907mr28947195ad.7.1761632895346;
        Mon, 27 Oct 2025 23:28:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJKoZD7Rgv3OxbONxnAhm8PnP+RQwsXfsBy50pNztScJdWZVZNyqy9yffWSj3S68WVbYCEfQ==
X-Received: by 2002:a17:902:ea08:b0:246:7a43:3f66 with SMTP id d9443c01a7336-294cb37a907mr28946905ad.7.1761632894825;
        Mon, 27 Oct 2025 23:28:14 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf359asm102503265ad.12.2025.10.27.23.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 23:28:14 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 23:28:04 -0700
Subject: [PATCH 02/12] coresight-funnel: Add support for CPU cluster funnel
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-cpu_cluster_component_pm-v1-2-31355ac588c2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761632890; l=9298;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=0zJwLJ/CbFy+0o+vHzhKVbidP9iIvwNMjcD10+y0AC0=;
 b=MKYeSZfllSCAj//ygPXLgxpCdpi1CxWUmnZ5rZenRMYxbbKXHdYy2Pm2qzgHEvBd4YeaO4lre
 AT5ZZPRozVGCbZfkKhuPkacdE22frWOA+U+QXk8mMa7fpA8SlfitfSt
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA1NCBTYWx0ZWRfXyNkXdVuPFGbO
 ttue4mrt7ObqAOrpiZ+MHe15O5fyVDRm/klZZjcSB6yBAiwpuWuP1Z6BaJmjvhvZhCWwHI8l4iw
 eRypRpgacYFA9I3wHFDpFBzvw6XcUuIbNrZ2OX2nOvlwHLucwzTHI12ui0iUfP6FTavrK/40K4/
 6KuqqHmKTf/fD1gkOrU377opKFlne0wdYQvmWVoIoUHhLhP1dxEF62lMiYhJyAuNWGjz/peNMfi
 huG7GkN5i/RNx1YxT9B3xnu+rHkyqJjUvIjQFsAu911pRaOLyyP4fSwkPXSYSeM0HBB6vPjJSTQ
 7dE/g/RMkCBIU6yXYHoR/1sjRS2z4x7cvyIiwfNWaC+jSSOQSmyR4+5bATNTO1o1MKGv8kz3xvT
 coVEbFNAbodRItedG5hlNp6g+FrIwA==
X-Proofpoint-ORIG-GUID: Dj_3LUCJ0KbY56_kyeAZvqA-Dnx3JwUD
X-Authority-Analysis: v=2.4 cv=U9WfzOru c=1 sm=1 tr=0 ts=69006280 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=mZjCGalVderqEPr0BrkA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: Dj_3LUCJ0KbY56_kyeAZvqA-Dnx3JwUD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_232817_702307_0727AC06 
X-CRM114-Status: GOOD (  25.84  )
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

The CPU cluster funnel is a type of CoreSight funnel that resides inside
the CPU cluster's power domain. Unlike dynamic funnels, CPU funnels are
coupled with CPU clusters and share their power management characteristics.
When the CPU cluster enters low-power mode (LPM), the funnel's registers
become inaccessible. Moreover, runtime PM operations alone cannot bring
the CPU cluster out of LPM, making standard register access unreliable.

This patch enhances the existing CoreSight funnel platform driver to
support CPU cluster funnels by:
- Add cpumask to funnel_drvdata to store CPU cluster's mask for CPU
  cluster funnel.
- Retrieving the associated CPU cluster's cpumask from the power domain.
- Using smp_call_function_single() to do clear self claim tag operation.
- Refactoring funnel_enable function. For cluster funnels, use
  smp_call_function_single() to ensure register visibility.
- Encapsulating coresight registration in funnel_add_coresight_dev().
- Reusing the existing platform driver infrastructure to minimize
  duplication and maintain compatibility with static funnel devices.

This ensures funnel operations are safe and functional even when the CPU
cluster is in low-power mode.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-funnel.c | 185 ++++++++++++++++++++-----
 1 file changed, 154 insertions(+), 31 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 3b248e54471a38f501777fe162fea850d1c851b3..12c29eb98b2122a3ade4cbed9a0d91c67ec777ed 100644
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
+ * @cpumask:	CPU mask representing the CPUs related to this funnel.
  */
 struct funnel_drvdata {
 	void __iomem		*base;
@@ -48,6 +50,13 @@ struct funnel_drvdata {
 	struct coresight_device	*csdev;
 	unsigned long		priority;
 	raw_spinlock_t		spinlock;
+	struct cpumask		*cpumask;
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
+	if (!drvdata->cpumask)
+		return dynamic_funnel_enable_hw(drvdata, port);
+
+	arg.drvdata = drvdata;
+	arg.port = port;
+
+	for_each_cpu(cpu, drvdata->cpumask) {
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
+	if (!drvdata->cpumask) {
+		val = get_funnel_ctrl_hw(drvdata);
+	} else {
+		arg.drvdata = drvdata;
+		for_each_cpu(cpu, drvdata->cpumask) {
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
+static struct cpumask *funnel_get_cpumask(struct device *dev)
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
@@ -258,23 +366,37 @@ static int funnel_probe(struct device *dev, struct resource *res)
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
+	if (is_of_node(dev_fwnode(dev)) &&
+	    of_device_is_compatible(dev->of_node, "arm,coresight-cpu-funnel")) {
+		drvdata->cpumask = funnel_get_cpumask(dev);
+		if (!drvdata->cpumask)
+			return -EINVAL;
+
+		cpus_read_lock();
+		for_each_cpu(cpu, drvdata->cpumask) {
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
@@ -341,6 +463,7 @@ static void funnel_platform_remove(struct platform_device *pdev)
 
 static const struct of_device_id funnel_match[] = {
 	{.compatible = "arm,coresight-static-funnel"},
+	{.compatible = "arm,coresight-cpu-funnel"},
 	{}
 };
 

-- 
2.34.1


