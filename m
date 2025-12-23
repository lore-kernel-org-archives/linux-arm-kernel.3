Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09954E6F07C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MjXyqQtGU/g1KNzz9G7Iba9HTRyvHXRxMTPyW1m3YyA=; b=bN0wKqDX5Q6AKstJHb1YxUxvYp
	VQ7VrNelrLgyyHVRNZoB9/X1N/2TojTxYdyeHJgeONSjoyKZWm8d/tJQBNvSgad6L3I3sXI1sFXGC
	xdh4ZLQXb/NT+XUxT5EIhQZSKIoJI9cblZokY512yI5qONCHPisUDsilM8z3jG648VUHR8yB0305z
	0jChecWSDrxg0MYNoQYtW8lz+5KXCpLWh138yPJPeLbooYBfB7dbVjQjVMOA/iE+2uUWuVuZ3qhwY
	hU1UWs82CMt37PKnDPsFZxAXc9wEbc3na7SWibAbuwA0yLJQHxBPLrEbCwiAjisjq8TyLF6sBF7Sa
	BTm4c01w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzLX-0000000Erbx-1Dlw;
	Tue, 23 Dec 2025 10:10:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzLR-0000000ErZZ-1lnH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:10:22 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN6goGI1632644
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:10:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MjXyqQtGU/g1KNzz9G7Iba9HTRyvHXRxMTPyW1m3YyA=; b=fHvWfrqLvaKL3HI2
	X0XCQOLKRin7SJOs9P+9iO/OY4t1kWBkXK9zEC2MQEiJYPDq0RBnh1cTBW55+b2g
	TnDmWC1sDp3kN0psUrlbiv+jLnuvbT5NwnTbT7DBTf2XL+1zye+0wa6qh0czcOcg
	ZeZ6/GDA0zE6Swjlk9jNhSVGG3bF3Lb4q4NfdfsLFT5wfd+A3X4WnbIwDRFiV2NT
	FONNtAMdnME+SzEEbSzjEOmSydG60BjE21XFc3rDbnWEC0Y0Ov5IbMExIQAkd8oS
	vzzm+SUYsBcP7vrcmjgsi+ljzz4OkU0rAbMzMxzG5HtPvZe5zbo99yIEooMBvlhL
	YOCgUA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7ck8jajj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:10:20 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2a0f0c7a06eso95239585ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484620; x=1767089420; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MjXyqQtGU/g1KNzz9G7Iba9HTRyvHXRxMTPyW1m3YyA=;
        b=jZ3VQdhoxgHNCVJ7jZwf5Zyo3g0KeB6RtZ+Dy+kxxcmR++i3k/t7E65hIJ+GoRrq4F
         5kQl+ryCIkqzxmY+2OIrhnucuOJeakMn5U6lU5+OCkyk66Y92VQ7Br/+X9ywucJthCVb
         XwpezTGmMqc1fKMUg8BYWeOeASYusMMu0GOLM5M1YIPAP4+xux5qUlgzAgxVIWF00wbt
         +bHpj1sjgj05KYQOKVs66yCuvd4W9DuYCaBlrIy1t4FvF9+jqCFIvGcDZ9zXaghbvmqm
         GBVKR31GsOY+9BGr0D357vO7DEoirtnJWXGiD4l4tYJPndaGd7YjU0G/hdIAfhDmPNuy
         bz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484620; x=1767089420;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MjXyqQtGU/g1KNzz9G7Iba9HTRyvHXRxMTPyW1m3YyA=;
        b=A6LgVc81qGGEuWe7WWBJ+nPRNJCI1V3FHs0WFovZvnqfozWV1S+xJ1NB4lWimDtNi2
         GYr7BaZeo+mFLuU7iJzYBrj1Dh8/uhPkEv1AwvMr7Rm4YfRjRCQbKXs+eHzTqHJfF7gF
         ZUZpjF1qAS0zxakK152Sn7Yk8lu878ZO8MDnB+on3aUFkR9XpDbszVz2uWl5y45pujCv
         ci2GcVCwuaSx+Ihr89jm09DSZcwNRURnFhppumtz6Nk40qzcSvOVEZItFn1/ToEu5ixw
         abUzEllube9Oi9rt8gprAjNq6pJy6F8kvO3KOsO038pJO+4C0BfeBURqWJdBPTWibjSB
         OAqA==
X-Forwarded-Encrypted: i=1; AJvYcCVYtpznfcddZnuszdzbWju7zYV907BaU2C9x1slUBiFnJnTeDToq925NmfGUfT0ktQKhvr1ok2LAEgvbbUTNRyO@lists.infradead.org
X-Gm-Message-State: AOJu0YzypYIGBNHdNvj22EXBoIlztQu3vUw9oaC1jeHOxjaY28zy6fVC
	6nMGehSAWvBwoDp9jd6J4k5n3mAO6TeLvaufkjKkPiMxNqd9lE7VkNl9Rv1dkzfnQ4P2dDHFS+V
	Sg14CR3bpwhWBjiYeWLFH6PbA0uJ0RK6B8+qabuLB6QD9ai7Gp8te7QaXxdqgqkMfdqInC3qVG0
	S/+A==
X-Gm-Gg: AY/fxX5bQ/A4qK0C0fntS8tDAvw2yp/FIfddSz4zZo8vWGSUI+XOGUf+W4y/Vw32qXT
	2OEznSgmzEFjNqilvWmA/RwQKUZCYu+3ScV9ESGGPgdutiI0KgDVvguOgoEDPfC2AKwTXgt+bPH
	BAMmIPokMQChUC4okrnGO7bn5fE4dVfgY2ciNlX5a5PRZ0bTDxTth+h0GhIOHehRiZ0HGwr0Qra
	xvoYxcojb5ZDEIjqgkoUs5GS5pRkNZ2gaea8RZZ8N/e5WfRl/Q8sAfu38jqO1tTCLoj3EQMfb/w
	CeN7sfEGv0s0clMYgk4eVP277xyvDr8Zo5zznee+9hsy1RuiP/iSRcVtbeQoGcf1gCEeEqrodMg
	GLEkKIP4PPDlNRTner7TsDuYsc1zUHc2SeZ3hBafeXfTYpXBZuc8D8RnEH9p1VVVmwrOs1ISp
X-Received: by 2002:a17:902:f550:b0:298:485d:556e with SMTP id d9443c01a7336-2a2f2212bd6mr129111225ad.11.1766484620157;
        Tue, 23 Dec 2025 02:10:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7u8gVih4cwumeUydeHa+siuP5K/kAJMpR7A5wkeje/FjKY41OOh2UZSfIiBerplCkbsud5g==
X-Received: by 2002:a17:902:f550:b0:298:485d:556e with SMTP id d9443c01a7336-2a2f2212bd6mr129110895ad.11.1766484619532;
        Tue, 23 Dec 2025 02:10:19 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c6661esm120824625ad.2.2025.12.23.02.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:10:19 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 18:09:52 +0800
Subject: [PATCH v8 3/4] coresight: tpda: add logic to configure TPDA_SYNCR
 register
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-add_sysfs_nodes_to_configure_tpda-v8-3-4c95db608b62@oss.qualcomm.com>
References: <20251223-add_sysfs_nodes_to_configure_tpda-v8-0-4c95db608b62@oss.qualcomm.com>
In-Reply-To: <20251223-add_sysfs_nodes_to_configure_tpda-v8-0-4c95db608b62@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766484607; l=6777;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=bLT+eriyeWZR4MlOhEyEgDrF3tZ/0b0xt0jZ//3mUos=;
 b=p4871o0j1u1sOswYubg7IgMov+A24E5eCMF11O6G5kJKnYOrp4kx1IslsYG27eLCts1cMajAr
 QJ6dn22othrByjUU0rpofwzE3lGvmVVRylHEW39kG2NkktXQ836+c8y
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: HmgLk34SgGk_J45nhDQRM7kJGgGolZOr
X-Proofpoint-GUID: HmgLk34SgGk_J45nhDQRM7kJGgGolZOr
X-Authority-Analysis: v=2.4 cv=asi/yCZV c=1 sm=1 tr=0 ts=694a6a8c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=gRM4NHGxar3dF8ctfloA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX2nlaF2x+6PzV
 3KabKApBmrI29f3K2jnUPG1wrfy4aFgbhsF8xWJJOCaK5PXhCrEsclQwx3g8JtE3ltQiL5CBvmU
 gecRIeCmaODSY8b2g1s/a1Y+wR+/gV6KFcIFecyNkbs6ELgR9DtebroL4UqsjukTbpS7X4KTkIH
 +Jzu7LMvdS9+M4acZjbjaD+pFckYEXpOyU1W0ydqFETrmSVlN2bFmidCs1BK/6650Po7dyBKFqw
 cEwAQU+YLkNpL89kp7zVZoOoatD8/W+hyL2qwG+Cw0bsv+EabH9j56SFY6EEPBOgK1F2n+W/OX5
 uZ4yw+9cW7Ri5yg3Gnld5NpcScegC+FD+WNU5jYaBoXaPDW5Oolzjf+eDLwW0sDpZH5zHbus/Pr
 mB7MU1EG80jwIDfzCmmPi+Ahaem6Uw/7mHI/qfCufcDVFg0TlgsPNb/m9kRo8tIf96BF1E9rlAG
 vuMNlR7BtXh6MKW2qEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_021021_521966_37CA70D2 
X-CRM114-Status: GOOD (  22.79  )
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

From: Tao Zhang <tao.zhang@oss.qualcomm.com>

The TPDA_SYNC counter tracks the number of bytes transferred from the
aggregator. When this count reaches the value programmed in the
TPDA_SYNCR register, an ASYNC request is triggered, allowing userspace
tools to accurately parse each valid packet.

Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
Reviewed-by: James Clark <james.clark@linaro.org>
Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-coresight-devices-tpda   | 18 +++++
 drivers/hwtracing/coresight/coresight-tpda.c       | 90 ++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.h       | 10 +++
 3 files changed, 118 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
index c8bc7b19ab25..c989eea1ef59 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
@@ -41,3 +41,21 @@ Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qu
 Description:
 		(RW) Set global (all ports) flush request bit. The bit remains set until a
 		global flush request sequence completes.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/syncr_mode
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Set mode the of the syncr counter.
+		mode 0 - COUNT[11:0] value represents the approximate number of bytes moved between two ASYNC packet requests
+		mode 1 - the bits COUNT[11:7] are used as a power of 2. for example, we could insert an async packet every 8K
+		         data by writing a value 13 to the COUNT[11:7] field.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/syncr_count
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Set value the of the syncr counter.
+		Range: 0-4095
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index d24a9098f1b1..deb5a646a04c 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -163,6 +163,20 @@ static void tpda_enable_pre_port(struct tpda_drvdata *drvdata)
 	 */
 	if (drvdata->trig_flag_ts)
 		writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
+
+	/* Initialize with a value of 0 */
+	val = 0;
+	if (drvdata->syncr_mode)
+		val |= TPDA_SYNCR_MODE_CTRL_MASK;
+
+	if (drvdata->syncr_count > 0 &&
+	    drvdata->syncr_count < TPDA_SYNCR_COUNT_MASK)
+		val |= drvdata->syncr_count;
+	else
+		/* Program the count to its MAX value by default */
+		val |= TPDA_SYNCR_COUNT_MASK;
+
+	writel_relaxed(val, drvdata->base + TPDA_SYNCR);
 }
 
 static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
@@ -385,8 +399,84 @@ static ssize_t global_flush_req_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(global_flush_req);
 
+static ssize_t syncr_mode_show(struct device *dev,
+			       struct device_attribute *attr,
+			       char *buf)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val, syncr_val;
+
+	if (!drvdata->csdev->refcnt)
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	syncr_val = readl_relaxed(drvdata->base + TPDA_SYNCR);
+	val = FIELD_GET(TPDA_SYNCR_MODE_CTRL_MASK, syncr_val);
+
+	return sysfs_emit(buf, "%lu\n", val);
+}
+
+static ssize_t syncr_mode_store(struct device *dev,
+				struct device_attribute *attr,
+				const char *buf,
+				size_t size)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	/* set the mode when first enabling the device */
+	drvdata->syncr_mode = !!val;
+
+	return size;
+}
+static DEVICE_ATTR_RW(syncr_mode);
+
+static ssize_t syncr_count_show(struct device *dev,
+				struct device_attribute *attr,
+				char *buf)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (!drvdata->csdev->refcnt)
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	val = readl_relaxed(drvdata->base + TPDA_SYNCR);
+	val &= TPDA_SYNCR_COUNT_MASK;
+
+	return sysfs_emit(buf, "%lu\n", val);
+}
+
+static ssize_t syncr_count_store(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf,
+				 size_t size)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	if (val > TPDA_SYNCR_COUNT_MASK)
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	drvdata->syncr_count = val;
+
+	return size;
+}
+static DEVICE_ATTR_RW(syncr_count);
+
 static struct attribute *tpda_attrs[] = {
 	&dev_attr_global_flush_req.attr,
+	&dev_attr_syncr_mode.attr,
+	&dev_attr_syncr_count.attr,
 	tpda_trig_sysfs_rw(freq_ts_enable, FREQTS),
 	tpda_trig_sysfs_rw(trig_freq_enable, FRIE),
 	tpda_trig_sysfs_rw(trig_flag_ts_enable, FLRIE),
diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
index 1cc9253293ec..56d35697303a 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.h
+++ b/drivers/hwtracing/coresight/coresight-tpda.h
@@ -9,6 +9,7 @@
 #define TPDA_CR			(0x000)
 #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
 #define TPDA_FPID_CR		(0x084)
+#define TPDA_SYNCR		(0x08C)
 
 /* Cross trigger global (all ports) flush request bit */
 #define TPDA_CR_FLREQ		BIT(0)
@@ -36,6 +37,11 @@
 /* Aggregator port DSB data set element size bit */
 #define TPDA_Pn_CR_DSBSIZE		BIT(8)
 
+/* TPDA_SYNCR count mask */
+#define TPDA_SYNCR_COUNT_MASK		GENMASK(11, 0)
+/* TPDA_SYNCR mode control bit */
+#define TPDA_SYNCR_MODE_CTRL_MASK	GENMASK(12, 12)
+
 #define TPDA_MAX_INPORTS	32
 
 /**
@@ -52,6 +58,8 @@
  * @trig_freq:	Enable/disable cross trigger FREQ packet request interface.
  * @freq_ts:	Enable/disable the timestamp for all FREQ packets.
  * @cmbchan_mode: Configure the CMB/MCMB channel mode.
+ * @syncr_mode:	Setting the mode for counting packets.
+ * @syncr_count: Setting the value of the count.
  */
 struct tpda_drvdata {
 	void __iomem		*base;
@@ -66,6 +74,8 @@ struct tpda_drvdata {
 	bool			trig_freq;
 	bool			freq_ts;
 	bool			cmbchan_mode;
+	bool			syncr_mode;
+	u32			syncr_count;
 };
 
 /* Enumerate members of global control register(cr) */

-- 
2.34.1


