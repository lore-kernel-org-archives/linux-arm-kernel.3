Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E47CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y0iynm1FGGwaEZbCphFRzeTZeB6sDyUBvZZjPoxKx0w=; b=VQm3na6jqIDbvfucJaeMcKu/nt
	/ut7Dm+jos7UCyz0+JZW+bucEQDMwGpqquEM6IHluTEVX2BS63EhMbyggPvkOMmsMUSggKJO/VYTX
	XFBgG4uwxl8UlcmcKr5CYn04qysD5UFa4gypJvnlxwHV3sReP+cGWM9FY19GAaZPT2yivQoaHrLt6
	EB3lRt7X0byVaJjUf/G5qQK4gkYtDIFdFSb3mDDHJoONhvMug4lRYFHY2slUggRm4bP68vHus7Ih9
	mMjTX3XiEjGReFDnZrGDYDDcsHS90hz3yJcvzaPGgsovgLuB11mpAUv3Yzj3Kqgbm3wzKimS0FvTK
	EyhKo26Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEg2-000000078UH-2SiJ;
	Wed, 10 Jun 2026 08:52:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEfv-000000078NH-0fWd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 08:52:44 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7iRSR867243
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 08:52:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y0iynm1FGGwaEZbCphFRzeTZeB6sDyUBvZZjPoxKx0w=; b=TxrWFFvFkcs/YfxV
	/0pe4JLFXoZxkei0Ua3E1sW25CT+OKE+bbqD3kT8X50EYCSXCx7/ChseUa+BB93T
	NTk2XWguoKVhQpPLrRFepx2/w64a+WXVHZDppjzpFADT+1J5kuYpeLQMSi/mJAlf
	LrUDrX+vmdoPRL6y2S0ukEDOYRplJWXoNF+w4SNdQTD0Z5k43tjdr8+JwxWMq6ss
	kufLPHRWN3IfsAjW+LadA2zveZs/2QGcCCZOOpRJipY4on6Lht+8a7KlFLLP0wFt
	bXZ0R+1IJxL99Up0ygwb3Zq7pNN1Wz71d9LwZtfp/fZUpPO4t13sVmTZ8h+2M4OR
	N+pZyQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq0kd907y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 08:52:38 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c0c272e532so66548455ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 10 Jun 2026 01:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781081557; x=1781686357; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y0iynm1FGGwaEZbCphFRzeTZeB6sDyUBvZZjPoxKx0w=;
        b=YtydLx9F88HGCmfvBc0uyagP0+jqpIvRsVQRY8S2Sy0lScNQBumLZi+LcyFQ/FwHgt
         mKmLUVxsqDHQ/wBwsK7ZRZPu6+HDQm3o0Hbj4GCtEht+mxGVyqmENbBVy+a+SBjhcFzy
         X6j641D3UPTRQBUZXLqtcyx4RMLXQ9pT3yvwHrDc/rRiyl24+4x0cvwgmCUhmH49lJZd
         1Eh5+qjPtvZ4sJ2O0CE/g8rGWVzfrkpOzJb11PHpGblmYqpmY271XwieYbGh7/4wi2Ma
         kV95OROCBPsUFyGEqp/d04+hIlXA8eOMaSZ1MBr/m+mP/Owfp8qX+1ASHOYnohBKiStM
         C2pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081557; x=1781686357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y0iynm1FGGwaEZbCphFRzeTZeB6sDyUBvZZjPoxKx0w=;
        b=g5av7ImflcCBLn9SZnCUh8wV279qCwjcBn6G6Be/qODmCGm3+BJbNG1fX3l6Cpi8c8
         PEelosQyZsRHmLEsEl7qNxbgAhKiCOj9TV+BgZZzMNNp9qPO/4BMlmU8x8ooUBHrh9NG
         ZCgPPqnF+6JOhKla6rPbT8vg1hdRF+Nzatz6KKeW9Pc+es0BmHb+E/VDhR0flf0dmvGy
         nV5d66MYj9X2SVs09UxQunD9mMoU4U2BPyRSq4NQvujcZLcS8CNTCuNOn8t/YuDGSlFS
         qqYhyXCVb4VxSblkfrWp4yLjLV8FwRfgDbt0ut9fov/GW8b1RZz9uMvnzOTyH9ewDfGs
         uiZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+23hcYlD9SlW3ErkrefCvoR81AyXc9y27SUjNZGLxnDADx4uuPLe59Mx1mYAU0kBOir2KiEJn3HgCkapKjaH+o@lists.infradead.org
X-Gm-Message-State: AOJu0YzCjgu9M2nSVcFAygVj4uJgPtgJeXOjVccHiPZbw/rf/5p5Bc9K
	as3F0XizYz2tiVcyRNqirIAGFvXUVM/DDrIWkSxLmcPjwTxAi1aWMW8Cx0bZdXpoT2OFqYD6nyD
	Ob7mGYmDdA+jf06H01wL02PqZkkha11uUuiVJe8hqt8Hd2ZCZ2i7gVkLfRjP/LGKUfmnJnx1Tss
	545g==
X-Gm-Gg: Acq92OGGsN/6LJGO0TCbbLlO5IYZ+0HjvfccktkNI8D2kGUjVmFPFRP6BNp7U1Xv94J
	14wkS3zj3awNWk4Xu4TjrEw6pvM9pqBmczMUnpJrTGJq9mfPAM+qUa54tjWo5sar7FPffZC2NMa
	Zd0E0hEWfgsF5Ccx5x0U3+CcgkMikjzNp1ZVxur40YrCb1LWyBcHuW/JC3ZreTX+wQH5boqel5I
	sqTCFMDOCnUiAjAJLhbc1xa9VFKQ1zohAwhZsdKv4KydvGTECGXAm9++LgpO8GB+vOZ2mVfsdTh
	KVaZTC0B+cx5XUL9dt4pQhuGc9zt8hJ8Ch0ak7tLabK/Fago10S8lLJhm0Kmt5QVwpbl6s/wqXB
	ju7wGszjRi619ge5bTZaHgMumw5jsWZQr4H9FR9BhtoSsL1jEN62fONoyv1gLH/l461GDZ3gFDK
	2k6IDFv5jRX6x5/qSdzbRAR4LjfssTm4cd2qImVGM0896F/aPTJyjkPSEbA1Y=
X-Received: by 2002:a17:902:fc48:b0:2bf:23ad:8595 with SMTP id d9443c01a7336-2c1e78e4f0emr297477785ad.4.1781081556864;
        Wed, 10 Jun 2026 01:52:36 -0700 (PDT)
X-Received: by 2002:a17:902:fc48:b0:2bf:23ad:8595 with SMTP id d9443c01a7336-2c1e78e4f0emr297477305ad.4.1781081556405;
        Wed, 10 Jun 2026 01:52:36 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c24edc8acasm114618175ad.45.2026.06.10.01.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:52:36 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 14:21:33 +0530
Subject: [PATCH RFC v7 6/9] PM / devfreq: Add a governor for tracking
 remote device frequencies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-rfc_v7_scmi_memlat-v7-6-f3f68c608f25@oss.qualcomm.com>
References: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
In-Reply-To: <20260610-rfc_v7_scmi_memlat-v7-0-f3f68c608f25@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-tegra@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781081505; l=4893;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=xZowMXSIo/yjYoix7dfxNcBQFvLyEboivbRIq1BkEFU=;
 b=XGGVsmcuQqsb7xxvF7kkpvKNz7arqGm5Q77SCmhmuZWxjWFRBwfyljemBijVv02n419Asznfo
 ce5/XapDYe0BqR8iEbYjxr25/B4xeON8mbI0zhXc5GM+c20jwuEccS4
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Authority-Analysis: v=2.4 cv=TeamcxQh c=1 sm=1 tr=0 ts=6a2925d6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=DkxomDJNIKAFLi0tgcIA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: a5eoYvoy9aQ8rBNjLhWFl4ZNMRPUGv7s
X-Proofpoint-ORIG-GUID: a5eoYvoy9aQ8rBNjLhWFl4ZNMRPUGv7s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA4MyBTYWx0ZWRfXxFXlBlsA2uN4
 buyIAfznX9ROyuqk29ltkw7uYmtBy/k3r0D6NcM9+W+ZQPrzIeNUEQImMG62Wvb6HZUcSkCdxTi
 g5TfM3SS/QFh1K33xDiiS0uhijQlFjnpVccq2VTT6dBJk8A9AH+jXITGVWUivvn96c7X646H3Nb
 cIEj7s5bhcSTUh6rHQC2bZS+QmGcl7uKx6JsJDhO/hqPjH5BbPCcmJaJFiISSOVANqIsrj4i/Jx
 5uPq1Q+TO5PncEhUa0IMPjABDZjcEs6SdPQcOXr9fsDoX3B8u7H6SiscKAwspVcbsP8dBKgi5M+
 OTZpoiUWdUVXO6HqvRijmGmeo09SHvaZpvg1D8mjyRT0XBh0xpzozK6uuXZNy84FzfIIBDnTJ9o
 cDjSQ+GeS81FEDp3mZvlfdo/gtzhY0yp4CUuOg7Rgwinpu5kl7wRxbpAKWhhCACuZyjukFnGmOF
 yOKQgP/VetWt9u5/jig==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 impostorscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_015239_326777_AF93AD0D 
X-CRM114-Status: GOOD (  24.35  )
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

From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>

On SoCs where the governor and the mechanism to control the frequency
for devices like caches is hosted on the System Control Processor
(SCP), there exists a need to track the frequency changes in a
reliable way and provide ways to tweak parameters on the remote
governor.

Add a new "remote" devfreq governor that uses the track_remote
flag to expose the remote device's frequency to userspace via
trans_stat. The governor deliberately does not advertise the
DEVFREQ_GOV_ATTR_TARGET_FREQ attribute since the kernel cannot
set the frequency on a remote-managed device; reads of the
target_freq sysfs node therefore return -EINVAL.

Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Signed-off-by: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
---
 drivers/devfreq/Kconfig           |  8 +++++
 drivers/devfreq/Makefile          |  1 +
 drivers/devfreq/governor_remote.c | 73 +++++++++++++++++++++++++++++++++++++++
 include/linux/devfreq.h           |  1 +
 4 files changed, 83 insertions(+)

diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
index c999c4a1e567..2caa87554914 100644
--- a/drivers/devfreq/Kconfig
+++ b/drivers/devfreq/Kconfig
@@ -56,6 +56,14 @@ config DEVFREQ_GOV_POWERSAVE
 	  the DEVFREQ framework returns the lowest frequency available
 	  at any time.
 
+config DEVFREQ_GOV_REMOTE
+	tristate "Remote"
+	help
+	  A simple governor to track the frequency of devices whose
+	  dvfs control lies outside the kernel. This governor acts
+	  as an observer and provides for ways to track frequency and
+	  set/get information related to the remote dvfs device.
+
 config DEVFREQ_GOV_USERSPACE
 	tristate "Userspace"
 	help
diff --git a/drivers/devfreq/Makefile b/drivers/devfreq/Makefile
index 404179d79a9d..cde57c8cda76 100644
--- a/drivers/devfreq/Makefile
+++ b/drivers/devfreq/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_PM_DEVFREQ_EVENT)	+= devfreq-event.o
 obj-$(CONFIG_DEVFREQ_GOV_SIMPLE_ONDEMAND)	+= governor_simpleondemand.o
 obj-$(CONFIG_DEVFREQ_GOV_PERFORMANCE)	+= governor_performance.o
 obj-$(CONFIG_DEVFREQ_GOV_POWERSAVE)	+= governor_powersave.o
+obj-$(CONFIG_DEVFREQ_GOV_REMOTE)	+= governor_remote.o
 obj-$(CONFIG_DEVFREQ_GOV_USERSPACE)	+= governor_userspace.o
 obj-$(CONFIG_DEVFREQ_GOV_PASSIVE)	+= governor_passive.o
 
diff --git a/drivers/devfreq/governor_remote.c b/drivers/devfreq/governor_remote.c
new file mode 100644
index 000000000000..df3819757e56
--- /dev/null
+++ b/drivers/devfreq/governor_remote.c
@@ -0,0 +1,73 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/errno.h>
+#include <linux/module.h>
+#include <linux/devfreq.h>
+#include <linux/devfreq-governor.h>
+
+static int devfreq_remote_track_func(struct devfreq *devfreq, unsigned long *freq)
+{
+	if (!devfreq->profile->get_cur_freq)
+		return -ENXIO;
+
+	return devfreq->profile->get_cur_freq(devfreq->dev.parent, freq);
+}
+
+static int devfreq_remote_track_handler(struct devfreq *devfreq, unsigned int event, void *data)
+{
+	switch (event) {
+	case DEVFREQ_GOV_START:
+		devfreq_monitor_start(devfreq);
+		break;
+
+	case DEVFREQ_GOV_STOP:
+		devfreq_monitor_stop(devfreq);
+		break;
+
+	case DEVFREQ_GOV_UPDATE_INTERVAL:
+		devfreq_update_interval(devfreq, (unsigned int *)data);
+		break;
+
+	case DEVFREQ_GOV_SUSPEND:
+		devfreq_monitor_suspend(devfreq);
+		break;
+
+	case DEVFREQ_GOV_RESUME:
+		devfreq_monitor_resume(devfreq);
+		break;
+	}
+
+	return 0;
+}
+
+static struct devfreq_governor devfreq_remote_track = {
+	.name = DEVFREQ_GOV_REMOTE,
+	.attrs = DEVFREQ_GOV_ATTR_POLLING_INTERVAL
+		| DEVFREQ_GOV_ATTR_TIMER,
+	.flags = DEVFREQ_GOV_FLAG_IMMUTABLE
+		| DEVFREQ_GOV_FLAG_TRACK_REMOTE,
+	.get_target_freq = devfreq_remote_track_func,
+	.event_handler = devfreq_remote_track_handler,
+};
+
+static int __init devfreq_remote_track_init(void)
+{
+	return devfreq_add_governor(&devfreq_remote_track);
+}
+subsys_initcall(devfreq_remote_track_init);
+
+static void __exit devfreq_remote_track_exit(void)
+{
+	int ret;
+
+	ret = devfreq_remove_governor(&devfreq_remote_track);
+	if (ret)
+		pr_err("%s: failed to remove governor %d\n", __func__, ret);
+}
+module_exit(devfreq_remote_track_exit);
+
+MODULE_DESCRIPTION("DEVFREQ Remote Tracking governor");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/devfreq.h b/include/linux/devfreq.h
index dc1075dc3446..4d50cf230950 100644
--- a/include/linux/devfreq.h
+++ b/include/linux/devfreq.h
@@ -21,6 +21,7 @@
 #define DEVFREQ_GOV_POWERSAVE		"powersave"
 #define DEVFREQ_GOV_USERSPACE		"userspace"
 #define DEVFREQ_GOV_PASSIVE		"passive"
+#define DEVFREQ_GOV_REMOTE		"remote"
 
 /* DEVFREQ notifier interface */
 #define DEVFREQ_TRANSITION_NOTIFIER	(0)

-- 
2.34.1


