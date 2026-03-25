Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C8BFEA801
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 03:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qxLFbSS0kbFsz0H1eqsg/kO890DMlye2k4mq3SEhw9o=; b=U3OCAdOYrS4/P16S0D/zxDBSgw
	LrWmglWvkolhSxckzyYCfvpgXKUACAu4CK3iexU7fscR4grrZd3sg9nI3/56hts4r9In22p8s5rlG
	dfTfR8uc6P7omcRBdQ8z5uK6idgz3sra3zm2wCO6Rhhvb4wX753tO2UvPgn3oXgxKVutFWBV7wwDw
	DrCxdFd79o07R2MnOgRdyd1cyyD4scyV88QEMo/gRQZ8menEr5bLGoxGMt0KQeSVdT5+bsbngLczy
	h6vE2fxNYaml5yo7rJxB+XCScSK1JCTgcrhGpCeLvJyPLQPFCZVdBgCzNrNkufZIjEsYbME/NmnEz
	isnEVzEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5Edc-00000002ZxU-0sqF;
	Wed, 25 Mar 2026 03:10:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5EdZ-00000002Zx7-23X7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 03:10:30 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJCtfV2808002
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 03:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=qxLFbSS0kbFsz0H1eqsg/k
	O890DMlye2k4mq3SEhw9o=; b=bL/eXb8WrKEaVF0KailmRO+u8u4BANyiAaKa1G
	L/uCT4UokzJSaD36yyJ9SdEtntHgQAl2Ena6xHHSEA/5dJ0yrn6eCfxVhnXHWsEN
	8/D7C0lrrZhbb16bLqeNVPMEFDSraIFXPMp76EPrN7BCrPF7JonFRARaIPh34Mus
	8BVqsycxNJ6MTzyeeQ1gvK8/GkqXkeraY9VAZmDR2D51Jh/s8p06jTY3gImxVIK7
	7Nq1aQJv5Xr1JTySaijxnWvYN1iYRPWJ/BNEH/uYkbNEWBN3ubdq5kaLklREoc3Z
	n7ONIMprz8jGAAH4x1zP8urwNAKQBzgyVtMLCEoSJ2hYnGRA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3t9ek2u3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 03:10:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-354bc535546so5267471a91.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 20:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774408228; x=1775013028; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qxLFbSS0kbFsz0H1eqsg/kO890DMlye2k4mq3SEhw9o=;
        b=C5PoH9L0L6cGaWQ24SC6HHteUswYiMiaMMymGfvtPGvWpYgrA12hVOePkPuNA7J0eW
         sN48/IbuCUaO1E5XBivj8d0ROB64G5ED64jG1Py+iRsjyTE8qL5NSf+VHsA7WUm0DDDx
         fSl+LDgQl1FPcUHYI7cG7QDH2ksZmJT07GcA7BGIUGU3/sV3/631ac9yuFjl+iTHOiY0
         4dEX/IqoBSS+Arb/Jaa42P17kpO2kwEO6trVKEwltDZzxEZedQ4UFIckMv3yL1NN5qGp
         ZZdUcHHdNBJo6D8ZeF99IjTJyF4l4riy/hmyq3osnRgMf5ZWILxkuBzDbwlhoj4aqTrv
         9b7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774408228; x=1775013028;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qxLFbSS0kbFsz0H1eqsg/kO890DMlye2k4mq3SEhw9o=;
        b=N2akJppZa1fAJdLc3dJQz+QB9LQHr6FEF6E4ld1zw3mR2AlN4f6dN0U0uH+E+71uO/
         dhG7IKwudjsxftNZ7OO0Pmn8IUM0BNM7xxvURvoAXxm33O8amJ6SwLjnpym0z3yIby+J
         9FDODj289KiTH1bGq51rnQHcWyFn78XzTkUBV7xxIji7h1qUwmy4BPHc0LlrRSx1C+HJ
         5oZ51reM1BBysnCll8FCHD2R+sIxZi4eoHazqK1yZwKuCVNrgaOtuYT5fKudt9ngVuPE
         bntewtzebF8CIXfYbH+BXDmqtc31SQg1LSGhP6hzhO5RYsjgNefhG11HMpKwM5ha1uGJ
         H0zg==
X-Forwarded-Encrypted: i=1; AJvYcCXcfxNW88wJt6KmsL9kKKwM2CiKYNo4v2BKjWuEZWPsOZvCQqaROriLq0YltQJbAN5urhRjtKvDJTV/w5rKsow0@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl7DXNV5m+rCvi5/YD0gfFUcj2VGv57ip6SPeq38B3PzZcZYj5
	FqaEJyquaghmrtjfiOD8Pa/DGeoM2gqw7kZULkSgbOZFHCfmy2rTNC95XseTfNv3+YOPrzvS3Hn
	xR5GLTORTmlRk97uUgOnioN9MuHyFVaS7z54OsrVt7jv+Hqrv8WIUCJ8z2U6LRw0btSrb7vv4DT
	3Vxw==
X-Gm-Gg: ATEYQzyC1/I2KKq8fCAgTc13BgrCY3J/VroqZeZRJ7iqjOnuKs4zMAMu97YBXA59m7k
	Zvg8WvhcuBAl+5jepJNoUriuytUQ89BuvdOD83TGZZ7vQCQYdmYIyxSpTCOk6FuuVJHo9VSUNcO
	42wmcLlX81OfJAOT2pMXt78ACjScTfnwaLRJTgMk7VyFtsoIshK3PZ1BPIzCKiAxhJ3//K57pty
	QeNqgzFyspF2MTBDAIYv8m/R8Ch/bkcwEyqJ+k7AHud8QWVZf1uxvongGbE6MHx7CvpHytX1w2E
	pCQ5QIaecsSJyPq3yMbv3I622B+vPKcFO1vFgigPQy5DPGC84S6uldL/rLI6KggGl2W33inOikp
	L16sKXftjaSjrs052YwZ8e3Ivb5UThJRSFXPRSWUFaXVxPgSV+8/tV4Nx4V6ebtmDrs429QzpGa
	TlXbIhkP+f
X-Received: by 2002:a17:90b:3f47:b0:35c:59f:e345 with SMTP id 98e67ed59e1d1-35c0dd803fcmr1550873a91.26.1774408227843;
        Tue, 24 Mar 2026 20:10:27 -0700 (PDT)
X-Received: by 2002:a17:90b:3f47:b0:35c:59f:e345 with SMTP id 98e67ed59e1d1-35c0dd803fcmr1550852a91.26.1774408227364;
        Tue, 24 Mar 2026 20:10:27 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c10e37a98sm221117a91.17.2026.03.24.20.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 20:10:27 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 11:10:08 +0800
Subject: [PATCH v3] coresight: tpdm: add traceid_show for checking traceid
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260325-add-traceid-show-for-tpdm-v3-1-0eb836d4ec30@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABBSw2kC/42NQQ6CMBBFr0Jm7ZC2YCWuvIdh0XQGaSIUO4gaw
 t2tnMDNT95P/vsrCKfAAudihcRLkBDHDNWhAN+78cYYKDMYZayqtEVHhHNyngOh9PGFXUw4TzR
 g05CqlT3qTinI+ylxF967+9pm7oPMMX32q8X82n+si0GNmtgbZ09cM12iSPl4uruPw1DmgHbbt
 i/gEojsyQAAAA==
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774408224; l=4000;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=TNAeHe10nhtp5XqbgHEFoEnpsK1f4L2bacP1jjN5WIs=;
 b=ehzHx9mieQTDiI0f6cTpwsQ6XB7Y8iNqWXg4ZSkGoGKN1gg/XfJgGNxFK8zO8HW/dsR42hnDY
 LXQHOg6++IFAVZvI177ftnx6VwPY9GDTNRU8N0wXJHh5ZNAMHk2LQUD
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: 7DKeVMQSYIjTjSPfj6JLf8D3rK3Gce_y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAyMCBTYWx0ZWRfX3Y8/vjwPOkxj
 WfLN7o3sB8MnV2gWXiH85ZFH5y3yb6sOqclFUKTczMorgApB66tTUQRoKaMv4i4EWpEtKMLTsPO
 gkC+TufnaOfBrVht0eyBFIs2N+nneYtV5FddIsFJ1G9mL1NHB5hsv1A3nn1qjKyczRodye0HwK3
 IGbijmcdnO2A5PgWcV1awI51WjkPSPsG/fNE3+dOxr1bS4uHf6oB5Y0gLU/LNf2+BYnbkkhaCpl
 shRO2wuuid1+QVO81whgrmYkwhSU9oeaaxlaeOSQ+9CE0Rg/6E4vwwMnrxajYyffLeNYVg2in8P
 PYhNmGf41jWrWr/J3nep96+q3KWjHmYOHVpH8E3YBTqae7Almb8lptRnPbozyyagM2BmXy73ymT
 QLRRezBzGzzgqLR6cuYrID7iWeQyQOqRTVUOaFrEOLCqcXD8Czok2yYaQrqofSvX4/pGGRmAfUN
 YiebSk7EgQoLJTm0j0w==
X-Authority-Analysis: v=2.4 cv=DdAaa/tW c=1 sm=1 tr=0 ts=69c35224 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5xuo2J1n2f9KI_P3fb0A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 7DKeVMQSYIjTjSPfj6JLf8D3rK3Gce_y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_201029_560566_43199B13 
X-CRM114-Status: GOOD (  19.86  )
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
Changes in v3:
1. Only allow user to read the traceid while the TPDM device is enabled.
- Link to v2: https://lore.kernel.org/r/20260316-add-traceid-show-for-tpdm-v2-1-1dec2a67e4ed@oss.qualcomm.com

Changes in V2:
1. Use sysfs_emit instead of sprintf.
Link to V1 - https://lore.kernel.org/all/20260306-add-traceid-show-for-tpdm-v1-1-0658a8edb972@oss.qualcomm.com/
---
 drivers/hwtracing/coresight/coresight-tpdm.c | 34 +++++++++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tpdm.h |  2 ++
 2 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index da77bdaad0a4..c8339b973bfc 100644
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
 
@@ -693,6 +694,29 @@ static struct attribute_group tpdm_attr_grp = {
 	.attrs = tpdm_attrs,
 };
 
+static ssize_t traceid_show(struct device *dev,
+			    struct device_attribute *attr, char *buf)
+{
+	unsigned long val;
+	struct tpdm_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	if (coresight_get_mode(drvdata->csdev) == CS_MODE_DISABLED)
+		return -EINVAL;
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
@@ -1367,6 +1391,12 @@ static const struct attribute_group *tpdm_attr_grps[] = {
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
 
@@ -1425,6 +1455,8 @@ static int tpdm_probe(struct device *dev, struct resource *res)
 	desc.access = CSDEV_ACCESS_IOMEM(base);
 	if (res)
 		desc.groups = tpdm_attr_grps;
+	else
+		desc.groups = static_tpdm_attr_grps;
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
 		return PTR_ERR(drvdata->csdev);
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.h b/drivers/hwtracing/coresight/coresight-tpdm.h
index 2867f3ab8186..11da64e1ade8 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.h
+++ b/drivers/hwtracing/coresight/coresight-tpdm.h
@@ -300,6 +300,7 @@ struct cmb_dataset {
  * @cmb         Specifics associated to TPDM CMB.
  * @dsb_msr_num Number of MSR supported by DSB TPDM
  * @cmb_msr_num Number of MSR supported by CMB TPDM
+ * @traceid	Trace ID of the path.
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


