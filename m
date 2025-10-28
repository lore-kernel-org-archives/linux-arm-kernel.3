Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A691DCCF9F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 06:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9LXsSAWESBxx1qhIkwj4IUMDZJdoAsaN3iRHs4NlQ0A=; b=00uRp5F9CvPdQ2SKyYRDH63zwJ
	W/XY4al7IV41gzKAZnkwqqi/agUKClLyWDLA1ERm+Y5TwFL7Z6BVWfger/Jndrc08SEYCkoB4Rwrb
	j5BGf0nJ0E5jLT2sUl8qawhLIubhbq4QmD864l2jLGSGwcEH9rv9oI8iVPejDsypHD+W9oGWNMmac
	afSv12IHYxtHNRfSAXZzLgu1kcksUwXiSNMC2mf1eeG9u1uikJoPvwOraCQ5DnLSf5w5LjS26wvho
	mQON4aBVYx0+gK6kM5EdcpnNT3VcNVtscFSXk58Vo01gjpJZxww7BXCI4e3YXcN5TSxgqSwsJ2CKl
	Jif6o/Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdC8-0000000FL7E-2sUe;
	Tue, 28 Oct 2025 06:28:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdBt-0000000FKvn-1YJ2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 06:28:22 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59S3gYAh3165297
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 06:28:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9LXsSAWESBxx1qhIkwj4IUMDZJdoAsaN3iRHs4NlQ0A=; b=Vh4XLW+2GHItm0nd
	INCrDaUXdd8qm1eZQP2UVe2GZ3VWtgR2HKEzsxWqTcFDdEsM2Xvll/BBMBhXyJpT
	uW0kUSuMfFN97IRfT6ospIYdSDSyMvTf/QNB+lcPutbcEFxXWJ/ipzwcdLNZAp4R
	ndSA8vcU0aFGliR+Yp3a9XPD0L7c5xGW5+ARG3br8JieRKqRSzPAqjwqRehBmuZo
	Rz8fWnGmm0X/FBZ6R/YIwU+AvmQgoQjJabCv2QhNPR62UiDLEHOBAcLatYos9sZk
	HLy5iAYpRoZQQ8aBY8sWeVcfFPbpQcKRbNr0eEtaWA6vRolsBhhzY6+2ooumBimZ
	iQLVfw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2bwx23sw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 06:28:20 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-28bd8b3fa67so46892495ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 23:28:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761632898; x=1762237698;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9LXsSAWESBxx1qhIkwj4IUMDZJdoAsaN3iRHs4NlQ0A=;
        b=Yl/1gPRb1WPSMA5djrzwHb+dTmkzl0JweJlE/Iq1eFIyTT/9RZ41F6tGW4JnE67tnq
         HiLaSK1tSbxFkCX04IxLoK8ktN0eZZ9aUNmqSpJlq4G9WczZxJdZ53zu37KKTZSXXbJE
         Z7trr/2uE5+Cr6iAzBNVieM54w1YFoVlfjPmkvDtUC1vkKQxeqL115396/cC3XRNyhc0
         08Aqbm5WoUTQ294IkQXLH0U42rLGNYkjxsP95OzmnhwuGWkwTPMKeLpO6pPeiMuwWRPj
         QOs/r7K09+Xt6rwtpDPB5WoVySzcbGrcjpDjmHoY+gZtglGK4hEjknchvdJMt3bJU6lR
         v0Mw==
X-Forwarded-Encrypted: i=1; AJvYcCWPa0mE4SYPK/MQjSlZ8E+3bCUC0asFb7soBqQ0f+HuVD9N+L4LSXGmMJIID4vdDJFEUIz/HpgP88eCkex3Xtoi@lists.infradead.org
X-Gm-Message-State: AOJu0Yyn2KXVBUFFi1X2wI/Aw5BcLSuxqqMkxE/Bjwwo+greH7P8PsCq
	uG1rekKCI+23x3KTTnqslQK762vxmxnGnWDubQBnNHQ55fAbiKZwLtGNEem8EnrRuFd1muetaf1
	uK3pwqP3PFwnkfz6luYyZKBGGgq76r9//y5HOhajRyGQ78NJUirkbZ+LkRXlax93vnHYzhXCr2s
	TKzQ==
X-Gm-Gg: ASbGnctAVvslYBOEbPqeKvpTNAdGdPQSqrslPjUsrYj96Z0WKxtlUG4/3ZtscVVFfBq
	eVZwuL7pkTfMQ1IIGeIFnYXmQpSfglZ+Mt2JR6j4xmafDfDrejV+TPyqqbzkRfy2N9aoeJuQc7D
	sCqvhGF5RpjI5K/shoZxqrCvnaD5mS1KtN4jgTUHiWSdVpu7N1stRoKdB39MiCuX5Hei71zBeCv
	+Wccsh1JGIo4zIciq8eM9jn7rORdfuUsN8PXzSebY7Jl2wQQTnUKxbupJnOapIxIgfh2fLu4gRX
	hm55b3oh5H4vwbepV9csRi/0CrgiK7ngGlVouiIsrJRUIzNc3n7n5faI9OioyW1Rx/5kulwZtaJ
	8APyfyuapyvfJcklWnHcDMgA2jsWOY0xojl0tqg5UUEwIRNaFO0cDepPF
X-Received: by 2002:a17:902:f691:b0:28d:1815:6382 with SMTP id d9443c01a7336-294cb51a504mr29192955ad.46.1761632898351;
        Mon, 27 Oct 2025 23:28:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGunZd6QjmVZFUVALHMT2sY8Uu3OLJR7Y3CnSh4NxInW/ltJhJpM9Bd6lz422ERYv553IXKbQ==
X-Received: by 2002:a17:902:f691:b0:28d:1815:6382 with SMTP id d9443c01a7336-294cb51a504mr29192565ad.46.1761632897829;
        Mon, 27 Oct 2025 23:28:17 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf359asm102503265ad.12.2025.10.27.23.28.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 23:28:17 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 23:28:06 -0700
Subject: [PATCH 04/12] coresight-replicator: Add support for CPU cluster
 replicator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-cpu_cluster_component_pm-v1-4-31355ac588c2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761632890; l=10262;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=E0SDWUZhZFagugdNgdZOT1J748JhKJGJROZqnLwgGz0=;
 b=LxELFMmOq8/u9m/7p0savfS77WPdQkZIi18XPd+4dmDwx6eytPfzie538K4qbfI6xrK1ddBZM
 LFnxSO39YFzA/w+OzauTWT/TPv8SzKfLvYuCeIGjNNkauzeNAeAnfqp
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA1NCBTYWx0ZWRfX8B8inKrJi9Ek
 c4zDh+yUleyAOMz9K0V2PQmCBv4D69aNhCBDVzZ8QHkOgKcyCw8mL0ANKevlVEzM0sSIJjWAN9M
 qbwDTcmHHfJf1fsuL5fWEKgMyi2nDj7HfTH7wASS0gMwoWCFb8bYkcjaw1rpJwK+mkEPumIEnkT
 AVMYKyZSn7LfWMOH1fUu3Q92NBX5syCShPjdZ9cWxiFIah/xXh+QdbFelfVFMdmm+aGw8jwsKVa
 lWaz7IHJxDV39gp2kdfNiN4RoN7nJebgWu4FXJG51xtEPLgtvpE/46TiMd0vX25+AEsflqsrSmD
 Pazh0o0wV4/KbtsNsjhclZjUbrJ11CQwRKLTPA5kxP+U3pTJs70jmv4tJ9miVLcd5staLm7ZRtu
 Txh8vn+viQYHrSSezRM67phCQtlGtA==
X-Proofpoint-ORIG-GUID: hMYZ_6BK88X1ogjmBgKdxlpdiHiI2nCg
X-Authority-Analysis: v=2.4 cv=U9WfzOru c=1 sm=1 tr=0 ts=69006284 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=WnTABDZRLdPeFdqLaHUA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: hMYZ_6BK88X1ogjmBgKdxlpdiHiI2nCg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_232821_540585_B44F84FD 
X-CRM114-Status: GOOD (  24.80  )
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

The CPU cluster replicator is a type of CoreSight replicator that resides
inside the CPU cluster's power domain. Unlike system-wide replicators,
CPU replicators are tightly coupled with CPU clusters and inherit their
power management characteristics. When the CPU cluster enters low-power
mode (LPM), the replicator registers become inaccessible. Moreover,
runtime PM alone cannot bring the CPU cluster out of LPM, making standard
register access unreliable.

This patch enhances the existing CoreSight replicator platform driver to
support CPU cluster replicators by:

- Adding replicator_claim/disclaim_device_unlocked() to handle device
  claim/disclaim before CoreSight device registration.
- Wrapping replicator_reset and clear_clear_tag in replicator_init_hw.
  For cluster replicators, use smp_call_function_single() to ensure
  register visibility.
- Encapsulating csdev registration in replicator_add_coresight_dev().
- Refactoring replicator_enable function. For cluster replicators, use
  smp_call_function_single() to ensure register visibility.
- Maintaining compatibility with existing static/dynamic replicators while
  minimizing duplication.

This ensures replicator operations remain safe and functional even when
the CPU cluster is in low-power states.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-replicator.c | 202 +++++++++++++++++----
 1 file changed, 169 insertions(+), 33 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index e6472658235dc479cec91ac18f3737f76f8c74f0..c5a9c7a2adfa90ae22890ed730fc008fe6901778 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -13,6 +13,7 @@
 #include <linux/io.h>
 #include <linux/err.h>
 #include <linux/slab.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <linux/clk.h>
@@ -35,6 +36,7 @@ DEFINE_CORESIGHT_DEVLIST(replicator_devs, "replicator");
  * @csdev:	component vitals needed by the framework
  * @spinlock:	serialize enable/disable operations.
  * @check_idfilter_val: check if the context is lost upon clock removal.
+ * @cpumask:	CPU mask representing the CPUs related to this replicator.
  */
 struct replicator_drvdata {
 	void __iomem		*base;
@@ -43,18 +45,61 @@ struct replicator_drvdata {
 	struct coresight_device	*csdev;
 	raw_spinlock_t		spinlock;
 	bool			check_idfilter_val;
+	struct cpumask		*cpumask;
 };
 
-static void dynamic_replicator_reset(struct replicator_drvdata *drvdata)
+struct replicator_smp_arg {
+	struct replicator_drvdata *drvdata;
+	int outport;
+	int rc;
+};
+
+static void replicator_clear_self_claim_tag(struct replicator_drvdata *drvdata)
+{
+	struct csdev_access access = CSDEV_ACCESS_IOMEM(drvdata->base);
+
+	coresight_clear_self_claim_tag(&access);
+}
+
+static int replicator_claim_device_unlocked(struct replicator_drvdata *drvdata)
+{
+	struct coresight_device *csdev = drvdata->csdev;
+	struct csdev_access access = CSDEV_ACCESS_IOMEM(drvdata->base);
+	u32 claim_tag;
+
+	if (csdev)
+		return coresight_claim_device_unlocked(csdev);
+
+	writel_relaxed(CORESIGHT_CLAIM_SELF_HOSTED, drvdata->base + CORESIGHT_CLAIMSET);
+
+	claim_tag = readl_relaxed(drvdata->base + CORESIGHT_CLAIMCLR);
+	if (claim_tag != CORESIGHT_CLAIM_SELF_HOSTED) {
+		coresight_clear_self_claim_tag_unlocked(&access);
+		return -EBUSY;
+	}
+
+	return 0;
+}
+
+static void replicator_disclaim_device_unlocked(struct replicator_drvdata *drvdata)
 {
 	struct coresight_device *csdev = drvdata->csdev;
+	struct csdev_access access = CSDEV_ACCESS_IOMEM(drvdata->base);
+
+	if (csdev)
+		return coresight_disclaim_device_unlocked(csdev);
 
+	coresight_clear_self_claim_tag_unlocked(&access);
+}
+
+static void dynamic_replicator_reset(struct replicator_drvdata *drvdata)
+{
 	CS_UNLOCK(drvdata->base);
 
-	if (!coresight_claim_device_unlocked(csdev)) {
+	if (!replicator_claim_device_unlocked(drvdata)) {
 		writel_relaxed(0xff, drvdata->base + REPLICATOR_IDFILTER0);
 		writel_relaxed(0xff, drvdata->base + REPLICATOR_IDFILTER1);
-		coresight_disclaim_device_unlocked(csdev);
+		replicator_disclaim_device_unlocked(drvdata);
 	}
 
 	CS_LOCK(drvdata->base);
@@ -116,6 +161,34 @@ static int dynamic_replicator_enable(struct replicator_drvdata *drvdata,
 	return rc;
 }
 
+static void replicator_enable_hw_smp_call(void *info)
+{
+	struct replicator_smp_arg *arg = info;
+
+	arg->rc = dynamic_replicator_enable(arg->drvdata, 0, arg->outport);
+}
+
+static int replicator_enable_hw(struct replicator_drvdata *drvdata,
+				int inport, int outport)
+{
+	int cpu, ret;
+	struct replicator_smp_arg arg = { 0 };
+
+	if (!drvdata->cpumask)
+		return dynamic_replicator_enable(drvdata, 0, outport);
+
+	arg.drvdata = drvdata;
+	arg.outport = outport;
+
+	for_each_cpu(cpu, drvdata->cpumask) {
+		ret = smp_call_function_single(cpu, replicator_enable_hw_smp_call, &arg, 1);
+		if (!ret)
+			return arg.rc;
+	}
+
+	return ret;
+}
+
 static int replicator_enable(struct coresight_device *csdev,
 			     struct coresight_connection *in,
 			     struct coresight_connection *out)
@@ -126,19 +199,24 @@ static int replicator_enable(struct coresight_device *csdev,
 	bool first_enable = false;
 
 	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
-	if (out->src_refcnt == 0) {
-		if (drvdata->base)
-			rc = dynamic_replicator_enable(drvdata, in->dest_port,
-						       out->src_port);
-		if (!rc)
-			first_enable = true;
-	}
-	if (!rc)
+
+	if (out->src_refcnt == 0)
+		first_enable = true;
+	else
 		out->src_refcnt++;
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
-	if (first_enable)
-		dev_dbg(&csdev->dev, "REPLICATOR enabled\n");
+	if (first_enable) {
+		if (drvdata->base)
+			rc = replicator_enable_hw(drvdata, in->dest_port,
+						  out->src_port);
+		if (!rc) {
+			out->src_refcnt++;
+			dev_dbg(&csdev->dev, "REPLICATOR enabled\n");
+			return rc;
+		}
+	}
+
 	return rc;
 }
 
@@ -217,23 +295,69 @@ static const struct attribute_group *replicator_groups[] = {
 	NULL,
 };
 
+static int replicator_add_coresight_dev(struct device *dev)
+{
+	struct coresight_desc desc = { 0 };
+	struct replicator_drvdata *drvdata = dev_get_drvdata(dev);
+
+	if (drvdata->base) {
+		desc.groups = replicator_groups;
+		desc.access = CSDEV_ACCESS_IOMEM(drvdata->base);
+	}
+
+	desc.name = coresight_alloc_device_name(&replicator_devs, dev);
+	if (!desc.name)
+		return -ENOMEM;
+
+	desc.type = CORESIGHT_DEV_TYPE_LINK;
+	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_SPLIT;
+	desc.ops = &replicator_cs_ops;
+	desc.pdata = dev->platform_data;
+	desc.dev = dev;
+
+	drvdata->csdev = coresight_register(&desc);
+	if (IS_ERR(drvdata->csdev))
+		return PTR_ERR(drvdata->csdev);
+
+	return 0;
+}
+
+static void replicator_init_hw(struct replicator_drvdata *drvdata)
+{
+	replicator_clear_self_claim_tag(drvdata);
+	replicator_reset(drvdata);
+}
+
+static void replicator_init_on_cpu(void *info)
+{
+	struct replicator_drvdata *drvdata = info;
+
+	replicator_init_hw(drvdata);
+}
+
+static struct cpumask *replicator_get_cpumask(struct device *dev)
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
 static int replicator_probe(struct device *dev, struct resource *res)
 {
 	struct coresight_platform_data *pdata = NULL;
 	struct replicator_drvdata *drvdata;
-	struct coresight_desc desc = { 0 };
 	void __iomem *base;
-	int ret;
+	int cpu, ret;
 
 	if (is_of_node(dev_fwnode(dev)) &&
 	    of_device_is_compatible(dev->of_node, "arm,coresight-replicator"))
 		dev_warn_once(dev,
 			      "Uses OBSOLETE CoreSight replicator binding\n");
 
-	desc.name = coresight_alloc_device_name(&replicator_devs, dev);
-	if (!desc.name)
-		return -ENOMEM;
-
 	drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
 	if (!drvdata)
 		return -ENOMEM;
@@ -251,9 +375,6 @@ static int replicator_probe(struct device *dev, struct resource *res)
 		if (IS_ERR(base))
 			return PTR_ERR(base);
 		drvdata->base = base;
-		desc.groups = replicator_groups;
-		desc.access = CSDEV_ACCESS_IOMEM(base);
-		coresight_clear_self_claim_tag(&desc.access);
 	}
 
 	if (fwnode_property_present(dev_fwnode(dev),
@@ -268,25 +389,39 @@ static int replicator_probe(struct device *dev, struct resource *res)
 	dev->platform_data = pdata;
 
 	raw_spin_lock_init(&drvdata->spinlock);
-	desc.type = CORESIGHT_DEV_TYPE_LINK;
-	desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_SPLIT;
-	desc.ops = &replicator_cs_ops;
-	desc.pdata = dev->platform_data;
-	desc.dev = dev;
 
-	drvdata->csdev = coresight_register(&desc);
-	if (IS_ERR(drvdata->csdev))
-		return PTR_ERR(drvdata->csdev);
+	if (is_of_node(dev_fwnode(dev)) &&
+	    of_device_is_compatible(dev->of_node, "arm,coresight-cpu-replicator")) {
+		drvdata->cpumask = replicator_get_cpumask(dev);
+		if (!drvdata->cpumask)
+			return -EINVAL;
+
+		cpus_read_lock();
+		for_each_cpu(cpu, drvdata->cpumask) {
+			ret = smp_call_function_single(cpu,
+						       replicator_init_on_cpu, drvdata, 1);
+			if (!ret)
+				break;
+		}
+		cpus_read_unlock();
 
-	replicator_reset(drvdata);
-	return 0;
+		if (ret)
+			return 0;
+	} else if (res) {
+		replicator_init_hw(drvdata);
+	}
+
+	ret = replicator_add_coresight_dev(dev);
+
+	return ret;
 }
 
 static int replicator_remove(struct device *dev)
 {
 	struct replicator_drvdata *drvdata = dev_get_drvdata(dev);
 
-	coresight_unregister(drvdata->csdev);
+	if (drvdata->csdev)
+		coresight_unregister(drvdata->csdev);
 	return 0;
 }
 
@@ -354,6 +489,7 @@ static const struct dev_pm_ops replicator_dev_pm_ops = {
 static const struct of_device_id replicator_match[] = {
 	{.compatible = "arm,coresight-replicator"},
 	{.compatible = "arm,coresight-static-replicator"},
+	{.compatible = "arm,coresight-cpu-replicator"},
 	{}
 };
 

-- 
2.34.1


