Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AF69C531FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 07:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O2Fyl6tXW8E245A0wNUYdczphKifLK8Qf8aFQGZJccI=; b=MfydwcUiFOYZyiY6tCknsBKcTr
	qgbyzXm5l79gnVWsiL/Al1jn92QtgccsRTkyKO9r/rPJbZt4l7mrGzno6vfwk5f7HfCAPazCSmjFV
	x2rnQjvjM9rSH0FvhvnM//t+GZLkWm6XgXaLlMWiP7swTKhQWTCcfiR/1MSgI8dmxkfiiDhN/qQv1
	Eum1YKv6ftdtFA0LxoiaRANH44lM2W32EN1EARUL7sEL5d6u4qQSB038FAkaQkOJoVaX6feORjpxy
	1l7mgbgAijkrRVwTLOhbhhN0iRwDPgsR6whmOnc/gV5Ot9zNDLs2CHKu4q9bll8FTbNqIZUMBr6Bu
	fHSkPwYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnABy-0000000FgTa-05TU;
	Fri, 24 Jul 2026 07:19:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnABs-0000000FgPm-3U86
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 07:19:30 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4liGD1869814
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 07:19:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O2Fyl6tXW8E245A0wNUYdczphKifLK8Qf8aFQGZJccI=; b=Agcevg42jmr919cy
	jtZOrB6358NDM3CNKhcHJwxUvntNDKI1PlkJOmF29TUiL/PXgalEdxNYvfvYNTMz
	GIJOh7YuAHAciINQPTdJ3RwQOjqqHS6u6vVRRPes4EsaoB9llxlDVyShmWySv1dt
	G5MtUYkpjc2ok9XN3sBLsn1wlhgCLB9r68qPV4GUSvAtf+zIo/D4tFS74tpa5ioA
	KtdBRaHu8X/rZ3OMmplsWZ1KLBmVWdrIXR+y2AcQmBqWNqzwwucNi0VzT2wYk3hR
	L8xU/6b3AjPGlkEsLcf6Yc4tOpC/ZEYxHdqNm/1fziitsU97CAq8LXkXxyDfQ+VN
	rX6rPg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fm0pw8ms5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 07:19:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cccfa32670so2273775ad.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 24 Jul 2026 00:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784877566; x=1785482366; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O2Fyl6tXW8E245A0wNUYdczphKifLK8Qf8aFQGZJccI=;
        b=LwWqSka4U8EFEnta4Y6bAzkWhB37yw84Ku6OQK9gywyjv7R9ipS77GbInQsAPc9eiQ
         wC/xiq5FuQDOBP3umqx5eYL2YI/nB0nMq84F5X8TaNm4peMGzEgSyXbOWd50yOVjqo2I
         7jz2W6UHfI/UVGBwPGYMAFjbde3wD2snNbu2F+YoRKsKDKdX++HHtsWfWBMW4Jbr1Y3s
         BPZEaTPw6TsUL3p4/v99tc6+t91vd83tsik2A6akSltxvQSTfIfJqKYLR25XGzjeAYEI
         gsVuzbOjLJkcs5wXT3ZN8Xs1oscH22kIIYWfdzDcPtnJ3FM8IcvidgCmgvOyOxGYkAFG
         eCJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784877566; x=1785482366;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O2Fyl6tXW8E245A0wNUYdczphKifLK8Qf8aFQGZJccI=;
        b=ZnODG4QG+QjUmExWipv71KYQ0jwy8JRVyteEKLI5AXQR4ISPS2g56QRYW0NVQOnaNY
         SeJew3dXoXchFaVMg0JmDgNWZyonScQKYzRLD/Bbs4d1g3kDHq6vcdmGfTnrzV2ZOQqG
         9TlGEjOk/GPc2SJFXmk/5xiBi7OzhKeUaiYmfaP1v0FauTT9LyEixYvEhgUnpVIwGxI/
         GjaOmGVgDxwiNsn+vH4VErRs/qu/LxIQztxNQuqBus+1CYA+8Z2l9rgZhC42+lCMDijK
         fUi21KLjbwjCjO6jl0IwGTLZEARSgZ4e/EUL8LVcGmqqPNnRcn7FXL8mqR5E0wUL8y54
         hmcA==
X-Forwarded-Encrypted: i=1; AHgh+RoTTPYEgdf0YXI92Ob/47vzh6ccZtb0shE5geC6aTgKkVFyqY26JKN8Al29pfTLUusqS9DnDlp2OLpussY8qBHG@lists.infradead.org
X-Gm-Message-State: AOJu0YxrjIopPwUVhndLZ+t0ENPChWfIlvHcJjM5UThlzLY8oqTRCEJC
	KLhRGWnLapNogHBPFuS/BPmCgXiLsoVH5ZuhVYlcpAmozd7D3nTUt6nw3jRPtv6VhJlKGan0xfw
	TArRXbn+iL0NFaZOfb2Wi6YAP62GIt+rQ8fca7uUtfN1WdQANxorWq6+VtBh57raPCS/Aefei8N
	WE0g==
X-Gm-Gg: AR+sD13+bo0SXOAm6UbJsvvGP8lhsYYpR09abA/gj6EcJ9fT7vTUEc9OBG4EnM1dXhF
	Vm4VYfCu4FKK7pYrwYbWqfi4mQRV+JFHgzwPEZHKoXoitSdctK1mZnjejDZPrn8vT15QKbvx0P3
	pYZuMNId8mXGm0XWClmfQZmZPdP4EbMdGnuO1FkQLgIje7bCHa3Nh3BtZCeKb9ms9YqDjV2lQEc
	oX3WiXpNrE/0AkYKq5M0jwXDJehi0DAlZ2oRA5jOnzHYnfLh1hHK3yn77Ma7O4goTmu9EHAdVvh
	Op/TtgNrLmtE27Ucjq2jXy40zgUp3yrJi03ybu19bBuzZeol+kpAiEU0Zh+fK9P0cNhGD1nwY2k
	5aQg6g/c1MWm2p2cCTvfaMRAcCPkKvVuqsAbxX1uuyr90cHftaic4lLiZxyqU4UGT2zPw4LLPLK
	z+1y04yOLBm7pP9afh5HCtjjv1JsM=
X-Received: by 2002:a17:903:286:b0:2ce:ced3:490e with SMTP id d9443c01a7336-2cfa6d878admr71283645ad.39.1784877565531;
        Fri, 24 Jul 2026 00:19:25 -0700 (PDT)
X-Received: by 2002:a17:903:286:b0:2ce:ced3:490e with SMTP id d9443c01a7336-2cfa6d878admr71283455ad.39.1784877565070;
        Fri, 24 Jul 2026 00:19:25 -0700 (PDT)
Received: from hu-ppapaniy-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8efe3afbsm45993805ad.33.2026.07.24.00.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 00:19:24 -0700 (PDT)
From: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Date: Fri, 24 Jul 2026 12:48:11 +0530
Subject: [PATCH RFC 06/10] PM / devfreq: Add a governor for tracking remote
 device frequencies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-rfc_v8_scmi_memlat-v1-6-cb732bcff1f4@oss.qualcomm.com>
References: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
In-Reply-To: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784877514; l=4891;
 i=pragnesh.papaniya@oss.qualcomm.com; s=20260120; h=from:subject:message-id;
 bh=L8aBIKJ/12pti7dx2J+q6kxEAWTDwCr7YwrZkrU6k3w=;
 b=Y5gFfN+ZHt6er8WmQ7b2LGb0q+kTmPmMG2zPz1wNRuU6UxgxdScnYk4GdWAZ1cSBYGPD+eAW4
 mArChceiY2CD8MwjYsCRzLmtYshCpoqnm7Xx8Cksh4k8H6zTmEGi2U/
X-Developer-Key: i=pragnesh.papaniya@oss.qualcomm.com; a=ed25519;
 pk=09P9nFmZLXJ9+4Jx10ZK5rIW0Fmk79A/DLErm6aVA0c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX/EfDt2WGt/bd
 R2nFCmH2oIsmetXApSEaHbJvGCCrJazJjpY1K88UaYoeI+YCmipuauvdEBFofdZPlERkWzc2nty
 QS9UmCAkPPoqxR8Pt1WYstTJI1zLoSb9YsrKwiIfUAvrfl5Hh5/8lPxQtga5/t5UTQKQSvESgK+
 Al0ls1va4baKh7PzhYMJ2yIkZyf4hOjzKl7vqoNdLI3bEsk8UixGMDh4YyFbeJHgB/58wqJ7SRm
 u8JVZiuinoX3cVVUgapb3p3V2RlRJz65qZDbQrc6CIJLlEb0z6lWbnc0cHDXDUPU0VBQVsnplt6
 qASMKfmLs5YdipA7ZgvUAbyBKusHw5Fi25ZrvFwRFxC51D9KEVEMJytGnhu0dn3yH7/FflftJ0N
 dwPrbPZ2wHw6/WzN3IF/hGerRRoHkp8L7bEoIj7tw2iV2StOGSNXat/iFxUfA/ppM6HKRrI1Ph6
 AwjiAzXiaZsYDvi56Rw==
X-Authority-Analysis: v=2.4 cv=RJeD2Yi+ c=1 sm=1 tr=0 ts=6a6311ff cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=DkxomDJNIKAFLi0tgcIA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: B3Ml-K16dFv12n66fmLxa5UlNd0qDs6o
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA2NSBTYWx0ZWRfX1fQQ3Ph8XlWo
 4a/7IOOiDSsgDo67jL9T3W/UFV+brWBNwJtN4vEj20ZQpOikQne9TdZaiuUa/AhmLC7+BnflmN6
 U2MMGYpZuDL5G9O9h1KOk03pp9aanVc=
X-Proofpoint-GUID: B3Ml-K16dFv12n66fmLxa5UlNd0qDs6o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_001929_004038_71EFCE1B 
X-CRM114-Status: GOOD (  24.91  )
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

On SoCs where the governor and the mechanism to control the frequency for
devices like caches is hosted on the System Control Processor (SCP), there
exists a need to track the frequency changes in a reliable way and provide
ways to tweak parameters on the remote governor.

Add a new "remote" devfreq governor that uses the track_remote flag to
expose the remote device's frequency to userspace via trans_stat. The
governor deliberately does not advertise the DEVFREQ_GOV_ATTR_TARGET_FREQ
attribute since the kernel cannot set the frequency on a remote-managed
device; reads of the target_freq sysfs node therefore return -EINVAL.

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


