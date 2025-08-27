Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0D5CCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g7hLmo2qiXQEzJFCc6UYcx4UE905+BBd64HJXeuLne8=; b=PGoqqbPIF/zFgoVZVjf96lMKHM
	sQVu5KMDHU09jrcccRBXi1YoJLWxULP29Q/zSOMpJDl31qsKA1ScEA8vofDHg8b6wmVcXGBUj759K
	m6QHfR4/9XwOz4l3h9A2UD6MRSMU5elg1pFaq63RRpqYodHt5GlYmWwCzDDOp3vXbIJTNBO8p93jX
	f1kMERuCa/mdNjxMyADBJeRBDDCFhk49e352RqOAvG1A5CS8yyWmFwDxxIhK1/K+tpE875xBSNe7e
	aF2vdCUEHONLZ+5aGBOBppmrZs/Dzdhp2dFPAK50kE0Y2pQaFkb0sSrRIRWnGAciq7KsmgQvLN9e0
	Zu5cSB0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urEgs-0000000FLIK-1OKi;
	Wed, 27 Aug 2025 11:51:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDow-0000000F81k-0bWx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 10:56:03 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R6kFKH003123
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 10:56:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=g7hLmo2qiXQ
	EzJFCc6UYcx4UE905+BBd64HJXeuLne8=; b=QDPzOQ8STAnHmoQU03fFs+srCfh
	COlQt6Z8xqJ9t0Pmtw1zKsrs3VaxRg6by4f3B1G1555vpL8KRMqmfUmeqEm8OMkb
	T6E4j4pZO2wbiPMlYuWO0DrgqzTr171bMjTIdWkXcgAekWmUI5vaADnEYm5+e/tr
	a5X+Ufe7+h4uCSxynPNbWA4egj0bR1izJfKLBx5zo+r5fQ6OIf92bZ2dCtVue8KN
	jJnC8q/lpC15llGGkuSPJ1phtUssCS95wFz+ajjG1kjusnJdi2LVmTFNQoqRaZRz
	IY3L5D8/6dhB8Ihx76JrasRzQqs/w5RKTdMwnBsotCi9EvSuJfQkHTefJug==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6x8cf2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 10:56:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-324e41e946eso12064182a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 03:56:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756292161; x=1756896961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g7hLmo2qiXQEzJFCc6UYcx4UE905+BBd64HJXeuLne8=;
        b=cKKBJcJsSKVisM9YXAxjoj8jwMjp2/6bHPFNcb/L+tElQkN8c4Th+TYwOpklVLqIWU
         /HH5WMnK0JSlZbEhwRNh+AW+3JFbA8em45LTmqDe9ZRIphSVZdQmEmxmZ9vAtPha44Hg
         diPk1Tdc7mhlTJYcN1yUpVtBIQrOVs2P7HQpGjKndQRFVOkHi5tZkDAHbvSgq/losoiY
         TgUHSWetpNxPX/9ZyCcRmuKysO7gWircuiGGrc300c7/OCHamr8mhCeB3BslmatDKvG9
         YlYxqrV6zFl0D0zKOZQuxdtoATeMGE152k+HbiB86FoM0irJrqmwJzy/VlG6RzmYxeAS
         eASQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1/U7xeQ8EDnjp8tFEsmyKQjUlVLYn5aQQAR214Y5e+s3FjLJCLh0a1DajbeKFHvgp1RRor/DBglmLGJD8L/Px@lists.infradead.org
X-Gm-Message-State: AOJu0YyMZPG3wquQxSKmXDa32wQjlRFbJfbrX5jgSqchAaumLYKlMyK/
	563oBxsUBm+NMfgPlNES6mrqDUm9mLlFZZ43SDRIki6MDE1xIk302IBoigp73F94sL+uqObp9wC
	4TsdQ2ZlVsDtQmQL3dzifT1ATEyPJ9c38qYakj69CbqUSU95J0OxoINRmqAMAXwdfyar+zvgsCQ
	67TA==
X-Gm-Gg: ASbGncv61iVgVXqtMYd0ULQ+ts7KiBxQ9B3fum8BSaPCZ2gfwVMi9Ct26lfz2HiyvHp
	y8JaWf0Ykbo6co72sXeS3pMWAIk/Lj78n4VsGHuJJxaz+kNOyT4gpx99wcyEW0qEOD6LXcvNVtr
	D6FOe/R0VI+F58Jx8G8kMevI3ccX6S9VmsbbprvjYWTQs4rshDeUjv4+7E97YcxYbI83tjbi22W
	E5Wuz7+OGGf7D76ZeB5D9LzaSlkeFHFCBfB9CWhN7DjrpBp4zDRgUjJaBNnLH9IqLJGBx8yUJTK
	lZPUNcwUNoCtNSeQSkvBx5svTX0femmX9jR8ZmIFj5Fs5K3n51IAo7C5b9dpeUJBhz0scfTZSWP
	oUscuvJ0TDaYGZTXHWSG6
X-Received: by 2002:a17:90b:528d:b0:321:cfbf:cbd6 with SMTP id 98e67ed59e1d1-32515e3cba6mr25542453a91.6.1756292160760;
        Wed, 27 Aug 2025 03:56:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwG5WKh/9Jju6a954+EE3Y3ki8sM2PuzrKsD/hmGK39N6A3Kp8fKVEhHRvsLYEuBcOG1Or/g==
X-Received: by 2002:a17:90b:528d:b0:321:cfbf:cbd6 with SMTP id 98e67ed59e1d1-32515e3cba6mr25542421a91.6.1756292160259;
        Wed, 27 Aug 2025 03:56:00 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-771f2f2ac7dsm5573035b3a.43.2025.08.27.03.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 03:55:59 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 3/3] coresight: tpda: add sysfs node to flush specific port
Date: Wed, 27 Aug 2025 18:55:45 +0800
Message-Id: <20250827105545.7140-4-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250827105545.7140-1-jie.gan@oss.qualcomm.com>
References: <20250827105545.7140-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 4Ai5Hn5JYw_ICy0dSzgfBBVl6PBCq5JG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0NCBTYWx0ZWRfX0m0cfBCbAXh8
 yBVhPmr4fK/4U6ceOKNnbyUKnqQymjGBZ+y619Wc+la7IUF93Lfqc7+bYbjlxDTSH9wZMP+PFNE
 gDi/Rsr7Z9TlamLQcWjqA8lE2+iLNZ8UZ9w0Teunok3iBZjl5XuJ8DhDqgBdzJ2MELG5L1VGkuG
 z0yrYmTs2h1lYWzcMYCHJ9H2Syk63kbpzjWQAzY7YCzMV4O1VYOuIcNLCpU15y2I6+Lo/Xgj1YS
 vTwDLD83USPHhRTNFfYYOZyKUCzJTltjBoodIOFgM/EUHk6Jk7rcooHCRK/B9Zbs/qQvJ2RUZxy
 dRNLCjv4RSm2AYuEBknPOO9sW8J6BPd9lLZhj1+ZaN9gL08NocB3cY4z58808+rmN+6ItCk1y8x
 t/oa72Kv
X-Proofpoint-GUID: 4Ai5Hn5JYw_ICy0dSzgfBBVl6PBCq5JG
X-Authority-Analysis: v=2.4 cv=Ep/SrTcA c=1 sm=1 tr=0 ts=68aee441 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=tK8iAimETgkDkOB5pRoA:9
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-27_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 suspectscore=0
 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_035602_186279_48AACA88 
X-CRM114-Status: GOOD (  16.47  )
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

Setting bit i in the TPDA_FLUSH_CR register initiates a flush request
for port i, forcing the data to synchronize and be transmitted to the
sink device.

Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../testing/sysfs-bus-coresight-devices-tpda  |  7 ++++
 drivers/hwtracing/coresight/coresight-tpda.c  | 41 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.h  |  1 +
 3 files changed, 49 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
index fb651aebeb31..2cf2dcfc13c8 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
@@ -41,3 +41,10 @@ Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qu
 Description:
 		(RW) Configure the CMB/MCMB channel mode for all enabled ports.
 		Value 0 means raw channel mapping mode. Value 1 means channel pair marking mode.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/port_flush_req
+Date:		August 2025
+KernelVersion:	6.17
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Configure the bit i to requests a flush operation of port i on the TPDA.
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index a1393962b04d..e9e2736071fb 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -490,6 +490,46 @@ static ssize_t cmbchan_mode_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(cmbchan_mode);
 
+static ssize_t port_flush_req_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buf)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (!drvdata->csdev->refcnt)
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	CS_UNLOCK(drvdata->base);
+	val = readl_relaxed(drvdata->base + TPDA_FLUSH_CR);
+	CS_LOCK(drvdata->base);
+	return sysfs_emit(buf, "0x%lx\n", val);
+}
+
+static ssize_t port_flush_req_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf,
+				    size_t size)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	u32 val;
+
+	if (kstrtou32(buf, 0, &val))
+		return -EINVAL;
+
+	if (!drvdata->csdev->refcnt || !val)
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	CS_UNLOCK(drvdata->base);
+	writel_relaxed(val, drvdata->base + TPDA_FLUSH_CR);
+	CS_LOCK(drvdata->base);
+
+	return size;
+}
+static DEVICE_ATTR_RW(port_flush_req);
+
 static struct attribute *tpda_attrs[] = {
 	&dev_attr_trig_async_enable.attr,
 	&dev_attr_trig_flag_ts_enable.attr,
@@ -497,6 +537,7 @@ static struct attribute *tpda_attrs[] = {
 	&dev_attr_freq_ts_enable.attr,
 	&dev_attr_global_flush_req.attr,
 	&dev_attr_cmbchan_mode.attr,
+	&dev_attr_port_flush_req.attr,
 	NULL,
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
index 0c9bf2fade56..284ac63699ad 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.h
+++ b/drivers/hwtracing/coresight/coresight-tpda.h
@@ -10,6 +10,7 @@
 #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
 #define TPDA_FPID_CR		(0x084)
 #define TPDA_SYNCR		(0x08C)
+#define TPDA_FLUSH_CR		(0x090)
 
 /* Cross trigger FREQ packets timestamp bit */
 #define TPDA_CR_FREQTS		BIT(2)
-- 
2.34.1


