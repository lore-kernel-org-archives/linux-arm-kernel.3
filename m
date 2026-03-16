Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63CA6EFCBD4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 07:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nrLVldlGnrA+8we8OBX3soXsCcm9DQqle7S1k480uIU=; b=C9S2AsHtPH6SfB7B+mGYBzLmA1
	TxZSFm+2sqWDZI1vsJfLNnNOzfmCApJO69XW5kRifdwCTo0BoowfbG8kV/ebmjIWeaxTTksFvk26j
	jhZh1bx3w3AEGUTGeGuuFVGwusrol4ZmeJUGSxA+jdeu1I2/bxu4QkEygpwJCfs4czYlkv6CnkTDS
	zU6DvZSyqnfr0A9rxlrtjehpZGDj3YXX1r8VEwC+fouvsDrAAMwEvob+eHj0rFqvbMYJSDFAhJNvz
	/KWo2b8jx6zDJ8ai94Ceqx+RbWzQoErJaG+dPKEOkmYOwv2hMEpDcikUER7rGp8L2Rvo3yNsRqeY+
	b9IPOl0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w22Is-00000003Th9-2yt8;
	Mon, 16 Mar 2026 07:23:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w22Ip-00000003Tgo-26Px
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 07:23:52 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64f291282132
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 07:23:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nrLVldlGnrA+8we8OBX3so
	XsCcm9DQqle7S1k480uIU=; b=Dst3xMpQ1LiwgrgZ3neJU9l81fBS2XdQW6os02
	x2k9W78OWB2OlT1x86bPVmAr7ELB9e8AfoWgf5jcW26gO21pV0FYtb+zeiYUG4FU
	Ve2LEQPlzlDkjJ5+E9k+U95CVbQkrO+NdLo7DHhXvQF0lwUTft+INHmegUj8rM3i
	/uVP+F8fnHtff9OLhqs6wUdwN9sW7mi7gRjL1ZGSvLAoVxdg15mrFc40QHGVLmwn
	Jydn55aF08WSKCAciGDlcqydkVan6tc9KeHYz7GXMZqDUQdtGGcLheCYhNZok3d/
	Q0nfg1zSJLhMKDziNkFx/OxIdPBR6alyMHzXlGU0+FJRnMvg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvyyc4fu7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 07:23:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-359fe456655so3682079a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 00:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773645830; x=1774250630; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nrLVldlGnrA+8we8OBX3soXsCcm9DQqle7S1k480uIU=;
        b=O/HEeaPeC7qt/1DejBzJTY+/LeOsRn75epuauBRl3qMkWDq24l3wQk3sfaxgg/0aJA
         uUHamUH8E4NmgGNbIoxqxHQ/9FWMRvzTfSL/B0sUuQ7ACn2LCJI+BLXZwlozT2crZ4n/
         lY3q3H5aYtgN6ZUwtvMazqXspyVI5sdroedJ3lEgQrifixOR8AgpJuluduVPUUKZ6usp
         tBcUskHB82+BseTyDg6G/AxWcUQ4BIX3iAM2vhrzlFmF+FW9f9bl046jvM8qRJiiNYfn
         +Kf9EUHo079+2Fgr5YIC44u+67DTD6+LsLcTzy8qNRbIsG02HxukxIR7YZwqeBZtZqiG
         PAQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773645830; x=1774250630;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nrLVldlGnrA+8we8OBX3soXsCcm9DQqle7S1k480uIU=;
        b=Y9I8sVcg/Vz+ts4ibGu1/Ynr36IPkh1RNYnh0UTNm6ECAHmvYAg81jDx/a62DYFo28
         Owq8Ou5CYUR7AcLDvsXr+q8/mgF4qhUTNJckVoPDjQAr5dL9e6FlWEv441k55etzgxp9
         oLHaO2xDHkz18Mge6aOHRoAs3Xx6kHtpMrWOPYODhjt159dU1ScoyoDwhPu4f0TgtMcG
         psjKDvPsjHGsIcQA3RHKxSOngIqHos0hm091LzjmUYgPyi7l1msn97d/J1pPzGXLOrZ0
         AEu1dArqGwh8o7afmWlS5Zm6UvQ0lD8K8JZ70DMPIs5z1zWeYR+DOFvYCCQsdI5htv6g
         I6zw==
X-Forwarded-Encrypted: i=1; AJvYcCV3wNVKQdgpNEpbpI5NUYOXUdV3o39AH8mWM3EXf0Hr92kI+1NuEm3Q6dL0TkSsLkX/azczGtM6yFvsp6cwRVZ+@lists.infradead.org
X-Gm-Message-State: AOJu0YxQrgIq+x9K7Lodn+H2gUS78juc4wLB6CIZY1gLb3cE8T++s1NM
	7bKBCpYE+zsw0GCvR5l8pSFQCJqUVuA5LXzdHGvZu78nZyqwudnJVBucJXcEFhkhkLm+e0jGQAV
	xwZzgL1rjNzlVnUUkG4FU8paz4i50xAyFkG1uic4VGFSHDofG8zJEB1J/X+2BQDfIymKK6NcNgv
	hvxw==
X-Gm-Gg: ATEYQzxXPJyMczQwdSdsIzLzbGEB8YBtr8bYIPdCiIXyF8YsDDfnzAwuAhgbI0esU8U
	NPv/AcDpUjmWswvlDZcUaC/Qv8Cdj+sG1p32jEvw3C2YHrGFXVqkhIzXLMgLFtb5c5QgK0dVBVM
	pyNLfh4iGfwHMjE8yUdhIb4Ei0tyCYUMOebsNJY3ZGga6P7Q/UnZ4Is1xTZ+pOoKE/PboFMHbP8
	hvDSIq7r7t1A/3agbQPktW/J1rdheihv1H8Zjb4QimrMfkip+LM/GvXNOnN7blNa+swU1Ac7pPm
	O+RTRiV/uljVRAJoaDq5PivJZLaMKkvQp/8ad54UB1EtGZxH4Up//LCLwxF6lCbY6UoXA+jN8Wy
	NL7pjfhavHNG1qOLL6lYiD5DOLSkDkDfMISVQBjhbydXJ+VnujhZyaNGG28nvBr9gtoLC2s5GKU
	VxFBzNJ2QO
X-Received: by 2002:a17:90b:3d4b:b0:359:fdc0:4621 with SMTP id 98e67ed59e1d1-35a21f666cbmr10354600a91.11.1773645829578;
        Mon, 16 Mar 2026 00:23:49 -0700 (PDT)
X-Received: by 2002:a17:90b:3d4b:b0:359:fdc0:4621 with SMTP id 98e67ed59e1d1-35a21f666cbmr10354575a91.11.1773645829110;
        Mon, 16 Mar 2026 00:23:49 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a27777fe4sm8808313a91.15.2026.03.16.00.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 00:23:48 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 15:23:28 +0800
Subject: [PATCH v2] coresight: tpdm: add traceid_show for checking traceid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260316-add-traceid-show-for-tpdm-v2-1-1dec2a67e4ed@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPCvt2kC/x3MwQqDMAyA4VeRnA3EbpayVxkeikk1h7WSyhTEd
 1/Z8Tv8/wVVTKXCq7vA5KtVS25wfQfzGvMiqNwMjpynx+AxMuNucRZlrGs5MBXDfeMPhsD0JD8
 OiQhav5kkPf/v93TfPwFxSKNrAAAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773645826; l=3711;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=nAY8VB68jcZdN1tfmu0Wuh9Uxh2WhfEkJI7I2wp21so=;
 b=XQYO4H5OVzsk0yTn/dCEwWWyfJJwj2VfcyiyoeCR653zh3QiGvLEgfmAVio9TWjqoFyrcdQj+
 VaCGM0i04qzDge4Nce/qrvV19rd0eKDD7rg7aEcLLEW9zsIvU7IUfEY
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=euXSD4pX c=1 sm=1 tr=0 ts=69b7b006 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=6dUr-SwRHgjYzu-3eYcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: Eupvw7z21cFUKoovUREAI_0RRgJ6lKX6
X-Proofpoint-ORIG-GUID: Eupvw7z21cFUKoovUREAI_0RRgJ6lKX6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA1NSBTYWx0ZWRfX/5pfZO0vN6ob
 VZx0d2iDgluKi+lAnVnwDLuDJBSYctKXQTWRLNNruedXElaY1OpPf3gUrljhpNJt5xHMY+ME1m/
 kfU51uN00ZXUzg8IZ09mEN2zq5wz8ibjhNYPeGVXqY/2KME0wrk8UFpNWBzZN+0c2GoDZTsF5Lj
 dCjMWexpaU+27nixrl3oFrCjoqQrmXHBh7h6gnAuML5F1Rbu4HFrhbDDW3sDRyWJfDkmcNDwORk
 bb+la4bjhzicyxFfipUKtjhaVIihm2fopg/2Ng1IKJPnNC+3LJ3DbIWT2Oxyda9tAM7hxy4kl9A
 lEipjmkNbw/kWeMe8K3AqS8jJcrGZA87Agg0fa75iJj0PxUqZPV/+S2GiGgU9CRknmDK4d9uT6u
 Lk6RwWMhtl7QB+BuIBjS7PJswJl6lnTlHXMVzc8nQg6FIEdjdUhqFVc/YStRSGKwmgzuKiayLUt
 RhFXEwGGHoMLoIw+/3Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_002351_547738_529C61B1 
X-CRM114-Status: GOOD (  17.81  )
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

Save the trace ID in drvdata during TPDM enablement and expose it
to userspace to support trace data parsing.

The TPDM device’s trace ID corresponds to the trace ID allocated
to the connected TPDA device.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
Changes in V2:
1. Use sysfs_emit instead of sprintf.
Link to V1 - https://lore.kernel.org/all/20260306-add-traceid-show-for-tpdm-v1-1-0658a8edb972@oss.qualcomm.com/
---
 drivers/hwtracing/coresight/coresight-tpdm.c | 31 +++++++++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tpdm.h |  2 ++
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index da77bdaad0a4..774a63def817 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -481,7 +481,7 @@ static void __tpdm_enable(struct tpdm_drvdata *drvdata)
 
 static int tpdm_enable(struct coresight_device *csdev, struct perf_event *event,
 		       enum cs_mode mode,
-		       __maybe_unused struct coresight_path *path)
+		       struct coresight_path *path)
 {
 	struct tpdm_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
@@ -497,6 +497,7 @@ static int tpdm_enable(struct coresight_device *csdev, struct perf_event *event,
 	}
 
 	__tpdm_enable(drvdata);
+	drvdata->traceid = path->trace_id;
 	drvdata->enable = true;
 	spin_unlock(&drvdata->spinlock);
 
@@ -693,6 +694,26 @@ static struct attribute_group tpdm_attr_grp = {
 	.attrs = tpdm_attrs,
 };
 
+static ssize_t traceid_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	unsigned long val;
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	val = drvdata->traceid;
+	return sysfs_emit(buf, "%#lx\n", val);
+}
+static DEVICE_ATTR_RO(traceid);
+
+static struct attribute *traceid_attrs[] = {
+	&dev_attr_traceid.attr,
+	NULL,
+};
+
+static struct attribute_group traceid_attr_grp = {
+	.attrs = traceid_attrs,
+};
+
 static ssize_t dsb_mode_show(struct device *dev,
 			     struct device_attribute *attr,
 			     char *buf)
@@ -1367,6 +1388,12 @@ static const struct attribute_group *tpdm_attr_grps[] = {
 	&tpdm_cmb_patt_grp,
 	&tpdm_cmb_msr_grp,
 	&tpdm_mcmb_attr_grp,
+	&traceid_attr_grp,
+	NULL,
+};
+
+static const struct attribute_group *static_tpdm_attr_grps[] = {
+	&traceid_attr_grp,
 	NULL,
 };
 
@@ -1425,6 +1452,8 @@ static int tpdm_probe(struct device *dev, struct resource *res)
 	desc.access = CSDEV_ACCESS_IOMEM(base);
 	if (res)
 		desc.groups = tpdm_attr_grps;
+	else
+		desc.groups = static_tpdm_attr_grps;
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
index 2867f3ab8186..befecbb896f4 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.h
+++ b/drivers/hwtracing/coresight/coresight-tpdm.h
@@ -300,6 +300,7 @@ struct cmb_dataset {
  * @cmb         Specifics associated to TPDM CMB.
  * @dsb_msr_num Number of MSR supported by DSB TPDM
  * @cmb_msr_num Number of MSR supported by CMB TPDM
+ * @traceid	trace ID of the path.
  */
 
 struct tpdm_drvdata {
@@ -313,6 +314,7 @@ struct tpdm_drvdata {
 	struct cmb_dataset	*cmb;
 	u32			dsb_msr_num;
 	u32			cmb_msr_num;
+	u8			traceid;
 };
 
 /* Enumerate members of various datasets */

---
base-commit: b84a0ebe421ca56995ff78b66307667b62b3a900
change-id: 20260316-add-traceid-show-for-tpdm-88d040651f00

Best regards,
-- 
Jie Gan <jie.gan@oss.qualcomm.com>


