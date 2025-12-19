Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1265AD74978
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Dec 2025 10:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3paLq8rlIq8VD1L3wSj2Cm25PF20wxq+Uu1GCVBMemY=; b=MC7+Xr/MLpRAMKnLZcQNYUUbjz
	dUagqwi3AMcwnzryTA5poFf3eFYYcsaam7bf+dG2xg7nvULHlivjGqMkzKCyAZYHAxVPsCgjYn5O7
	SZlalyrhTM6SCeeEWnrahlvMnP1DAnuHUimFZYJpDppNq2ZT/1fXr3AD+P2HPnrYXXyNWvJQxVJ4d
	v5Ge7WLpgp83vq1b7OYD6gkxM6LgEtPgehtVXOvo6sv4glnJ4mn+oj2jdjfMELYX47HAbcaS/aE5q
	nmORVydsfvjcyQ02mvIDIyZWbA8SwHNH2cKuUw44l3Y5xxImGlzfNC+pXimIkWZL/zhhmCmfWA1+x
	IfeSFb3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXMG-0000000A0cL-3bjF;
	Fri, 19 Dec 2025 10:05:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWXMC-0000000A0aM-2Wmh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Dec 2025 10:05:09 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4ch5N3992425
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3paLq8rlIq8VD1L3wSj2Cm25PF20wxq+Uu1GCVBMemY=; b=m1YaN5HBoGcZ6hXM
	6qyusIQACDtt+Jv5Yl03ax+Dj4uYz3Rf0TqxK2MluNxPPZ1mzCQrU0UlVcV/XaR7
	FjTu4WyTlK5epaDzdZ6CnXWLTaDwhEcvluNcdtckUzlzkh4KBpcwMh1AG0EnXwZw
	XzN0TjkYNQKzJTaCqpXlpOzZ8m5dguZHfG0NNuYXdyVOfGtXCSrGTNOSL08rvEz4
	2c0pzOP5apCRexXmMp23Q1NEi7tES8HaZgRUe1hV8Ev61aVz73y16kWgOuuPDEB4
	zDDWxgatozmOq033zpBBvDczZy4zZtJomem40SVldC6iaijGz4imgTqc6d1I8b+V
	49AaeQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2da66u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 10:05:07 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0fe4ade9eso18228195ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Dec 2025 02:05:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766138705; x=1766743505; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3paLq8rlIq8VD1L3wSj2Cm25PF20wxq+Uu1GCVBMemY=;
        b=ZUbJeVKIS1+rpztpQsq9SPONLviZ18AYFh36z3xCmjM/tYPYcN7/EdIPMwdgimbMFP
         Jlyge+fjTzWBMA8pOvFSbiPIgq1Va8KnSF2OtmsDrm/wFTMS6HzvXPXmdNdCTKJ0xM6r
         DQfqvzQpO4B0DhUcBY0ZKDDETIEOufs/NiM3gPTnqZU2b9SIXjkWO2rO5HjdCpXGMN2Z
         hj9F0zn4gqSH+fVcYrFJDq3TTJpujazkxYEmYePH/uS6NjyO/Lm3Wco86907HY5Wvjzw
         JwW8KXS1kTiUFv2HeaHhpmv6Zm4rSJcZmAG8xTIMod4asrmOnXQPWok6OhIOmBg/rmUo
         azDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766138705; x=1766743505;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3paLq8rlIq8VD1L3wSj2Cm25PF20wxq+Uu1GCVBMemY=;
        b=RfNJLOxssQJ4gOB7bO7uVv48PYZUVv0mRJSoiHC4sofQJl+Sc7h/asaStxn2pQg7OJ
         8LDUP/WlyNvm76n4kICy9e44M6Qei1wuJ1eZyeZ9H4CJ8jHGZwst9N9BiSLcCAweLxeY
         98uk9mcvxSv4E3vWfBXhMG5Acj3x7oNhRt3KI4uqYKmN8ZLo4leIFfJj6d4CTED/Pr3/
         4X4Zt/QYcL1Nxquz+IRzFEjT9rAICqQHy3k2vsScJb5iouiCM/wjc0Z5vlnGaztHjH9u
         L9QmQmiv/HURVoEcQDb61Ao5WVxevgWQ9sXH/ccQdsUstjG9ULqf0QoBAB4mhZ0RAo49
         yWmg==
X-Forwarded-Encrypted: i=1; AJvYcCV5aVXCze2UxiO5rGXJAi4e+/Q5Eqxjb3tH7AqmpWrBNnp8vF9M/CqbGynQiolt6JSpTKpmom06okr59buBwd2o@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk4za2IB/RTsmvdaPh2cdcEQat5mAdx/UUJ/A975iu67XS5RIs
	tDvb/hKZSuO6FiLr9tpUq+EI6JOH/+dNBP/Q3vdviC48Z9bL/DIiQXeFNBSQAQf6KzRaY43QljN
	21qDpNCyFALyax/BdNsKXOIUmGIl5tSlmvFT8Yb4YqEaDjLMaPITuZs4Tib+M7NFpdPy8TLjkU+
	tWxQ==
X-Gm-Gg: AY/fxX4RHDIEAcdjEAIsAwuxLLp7Px+51LMiI/AL9Br/tlj7MPZ0nWt4b0zgH3TYc+H
	U8vhEUnEaoStmuJlu8vkY8Xg/KM+5D0exSBUh2Q4RMpnRRzcNqQNWBrBLtFV+pvvtpVqaER0oFo
	hYIhMDKqWgH+v/sraT6fXgU2QsL8HJrSLGpbZjYk5LRcM6gyfzfS+nxxNA9dAyF9tHcYVrtipMR
	c+MDzgLJDQvTuHTpcD8/PQMenfTLzbLIl9Kxqg3bM3AvEMRfdw6FcZbL9arUH2Jn+pc7+976HV8
	d+P5EkUTM7PlpFzCwmE9Whvglp6nLghOLLXlei06smCmdDQTmGea+7K3pT9/IQ8y3Rr3bZiGM2T
	GqFH6SupUia1mNZxzf7YBnJV/t37ypev6ulzMwWeroG3wq/Vua6qh18iAzfpornZRT14ExfXl
X-Received: by 2002:a17:903:2f82:b0:2a1:10f7:9717 with SMTP id d9443c01a7336-2a2f2c4cea2mr22734185ad.58.1766138705162;
        Fri, 19 Dec 2025 02:05:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE86Gcx4/pdsN78cTc6IZEqVYlAu7Pg2RKKPEaD+JmAiHkfxh2unEsO8p1vgr1qCebbNJdLQQ==
X-Received: by 2002:a17:903:2f82:b0:2a1:10f7:9717 with SMTP id d9443c01a7336-2a2f2c4cea2mr22733875ad.58.1766138704572;
        Fri, 19 Dec 2025 02:05:04 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d74bbbsm18164435ad.94.2025.12.19.02.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Dec 2025 02:05:04 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 18:04:21 +0800
Subject: [PATCH v5 3/3] coresight: tpda: add sysfs node to flush specific
 port
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251219-add_sysfs_nodes_to_configure_tpda-v5-3-ca93ddfe9d30@oss.qualcomm.com>
References: <20251219-add_sysfs_nodes_to_configure_tpda-v5-0-ca93ddfe9d30@oss.qualcomm.com>
In-Reply-To: <20251219-add_sysfs_nodes_to_configure_tpda-v5-0-ca93ddfe9d30@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766138691; l=4048;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=z522mHUju9vRVUJ4EsB7w92lZqaINA1rVyfv0aHL+jE=;
 b=czq7mBtMkML+YO0p5L2NSoep8l9D9PgTJ906RFU4Duz7UifhkjpftVbt8f41FKYXGcEQRXDi/
 kZ5rRf0dFVxCmVmHFEz+Gr8nmfaCgqO7HtGYFg1fDlWo4NP9SEC9zwp
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=AcG83nXG c=1 sm=1 tr=0 ts=69452353 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=K1mhiUCce_5FropZUN0A:9 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA4MiBTYWx0ZWRfX41q2S8X+0Bm/
 5XTERd2G8zeYFe5bHkmxD4oaCx+Bcxb0xeyTzg7y5L7UFsFKt4Onge1Cp+6EBWkH55bUMrgxyqf
 Dsi8+H8W+OgkH1Du2m3QYTli3PutyaXvbKeYevb3y1FtBxM60H1CDemqooQWNB0OHGTqhHgGmi1
 A7xrIif9REbmQ1dukE8rmEkzXSyVrNtiEoQUJjK+POIpDa2b80+Fgze3yHh8DRen0LqkjB28Jv/
 S0TuBmGKHIt0RTEPP1OXqk0PLBkR5kzeLA8jLjMMyQ0g1olh0F5HM2itw9DgxpBfEBMz8vQ14u5
 fO+/3lPU2L5iQ+QsqpJEVTs3KuGow7S0/IScj4biCGogHzN5qVzL5m1ONxZlFVa2G5uJxomQYkG
 5KqdTsbZQoroR3+Uo+eMfd4bUQmTEO/BKmn8Jd87TfTi8IB2+sKZc8mrw+Q5lSHm9j7v0i8Icfk
 I1v009yF1A8CHSMF2HQ==
X-Proofpoint-GUID: aFZ3eBFXMtrlT9mvWDw3gMfA7bLl-hTn
X-Proofpoint-ORIG-GUID: aFZ3eBFXMtrlT9mvWDw3gMfA7bLl-hTn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_03,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_020508_771047_0F080646 
X-CRM114-Status: GOOD (  17.19  )
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
Reviewed-by: James Clark <james.clark@linaro.org>
Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-coresight-devices-tpda   |  7 ++++
 drivers/hwtracing/coresight/coresight-tpda.c       | 49 ++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.h       |  1 +
 3 files changed, 57 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
index a7855922328e..ef2804f87d1e 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
@@ -41,3 +41,10 @@ Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qu
 Description:
 		(RW) Configure the CMB/MCMB channel mode for all enabled ports.
 		Value 0 means raw channel mapping mode. Value 1 means channel pair marking mode.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/port_flush_req
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Configure the bit i to requests a flush operation of port i on the TPDA.
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index d378ff8ad77d..5b4a9e41b067 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -375,6 +375,45 @@ static ssize_t tpda_trig_sysfs_store(struct device *dev,
 	return ret;
 }
 
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
+	val = readl_relaxed(drvdata->base + TPDA_FLUSH_CR);
+
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
 static struct attribute *tpda_global_cr_attrs[] = {
 	tpda_trig_sysfs_rw(global_flush_req, FLREQ),
 	tpda_trig_sysfs_rw(freq_ts_enable, FREQTS),
@@ -385,13 +424,23 @@ static struct attribute *tpda_global_cr_attrs[] = {
 	NULL,
 };
 
+static struct attribute *tpda_attrs[] = {
+	&dev_attr_port_flush_req.attr,
+	NULL,
+};
+
 static struct attribute_group tpda_global_cr_attr_grp = {
 	.attrs	= tpda_global_cr_attrs,
 	.name	= "global_cr",
 };
 
+static struct attribute_group tpda_attr_grp = {
+	.attrs	= tpda_attrs,
+};
+
 static const struct attribute_group *tpda_attr_grps[] = {
 	&tpda_global_cr_attr_grp,
+	&tpda_attr_grp,
 	NULL,
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
index 97e2729c15c9..ec93f9cb9648 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.h
+++ b/drivers/hwtracing/coresight/coresight-tpda.h
@@ -10,6 +10,7 @@
 #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
 #define TPDA_FPID_CR		(0x084)
 #define TPDA_SYNCR		(0x08C)
+#define TPDA_FLUSH_CR		(0x090)
 
 /* Cross trigger Global (all ports) flush request bit */
 #define TPDA_CR_FLREQ		BIT(0)

-- 
2.34.1


