Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCEBCA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 04:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LFgzrZAixnTqFsEdbAYjDQONQ2mnmA9c8+kXB2USXhQ=; b=qlJhUvMNI2yc6l4UlbRyiq+DAz
	FjQNVzK92YNVSnh604dFyc+XzkjxKWpY5FPzhZOgxaxRVPkRx7QUj/Evak+ynskX5FooiBelz/llr
	K7wZ7YHuYeHws+d5SBayJaHU0jIFuH2FHfVJzPv57IaAS/Pu3LkKRNzBdOj0egUY/rgTUOZZ9wy+9
	ggPC/7KMjo0kGZpo/o8z5syZ53hl698lpkP58lLioJsml50wlo3Flpa3X4fQX7I7o8VNne09rA/Xz
	QguGkI+knoF0+EdjCGNPicwoyH1KFFbQAsL5UQExctZG9jOs0806lc1k8hXgJ1eYozALJVPttsQJu
	IUzH9ToA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur7p5-0000000DynO-0fux;
	Wed, 27 Aug 2025 04:31:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur7ed-0000000DxGY-0lFp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 04:21:00 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57R2spg9018862
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 04:20:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LFgzrZAixnT
	qFsEdbAYjDQONQ2mnmA9c8+kXB2USXhQ=; b=iNhbMWaJDlRl7uFXPhJdTn/l/sK
	oVXznRwiU+6nBM+5O1M8eEXZJDPjaY8C3tr1MgdcUTFUL4FXZhyjk1fg8a0BFisD
	/04GkXfCopoJ1xjouI4i2/2TwdzY0PquJaJARlyivNCPc2R8Miezam0CnTG6WKor
	ruRJy2p38cQ1aF8+HmMEQa1Y4l6N2HAmrJDn94r7W/Lt41qx5wZvMsMnUJLx3wI4
	E7HN24cgv2/E4a7koHRewY1SzgJFaXh90IbfR4H2yOqWDA3gYIrnBjDAawTk6Rk3
	SFTcAe20c1eh87dxOvntLL9FfjgZGuolCrREc4gfMyIquCHjmYRyr31l+IA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpujne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 04:20:58 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-771e331f0fcso2341630b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 21:20:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756268458; x=1756873258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LFgzrZAixnTqFsEdbAYjDQONQ2mnmA9c8+kXB2USXhQ=;
        b=YppxPcajudqasmL4cdPO2ail+CWNBrZWJAfvX+I1Ji3JZc13YQhacwLS7qRi9svAs5
         L4dK52s3epxJPPhTnR+F2oPZ8aiwJ31LWFGGu8esF+NuodW1SKKZoqZ644wc9OD+lfyY
         OCgZ0aOCX832Nsg+PsD4st0NQVCe6H6ASrtztBqNF/i8sqeuzv95tDBod239mcbQTA6f
         tl1h/BsmB2sHPyqGkshYZS5i75nuEO9ExXBBgFTbPuRibrNivzOSkktZYB2Mo2EfflI3
         Z5qOG3SM4iww8YUl8HP1hoggPxYgiQ0w4KbVJwgqbJR/32EMSyyFzCneG/ypce8ai+ey
         K4Gw==
X-Forwarded-Encrypted: i=1; AJvYcCWekR5aV/emYXM3lBqkupqcRzQgTW23wloHPAd4O13KTZqECrBXfUxLu2URQtBLq3noeUTHYHHlXx56ZXZqgRmg@lists.infradead.org
X-Gm-Message-State: AOJu0YyAqgcCjFSsxaQBiPUoTvuomY65ZAVtPysnnqnqQjoNv7BmxTkw
	9rSlK8MKnCMSFGINS9Nfg8RRP6dq+npHsjIpcU7klmgUCZgchEppWhTB/h/rTXh95ifDh78xt9h
	bwjx9AyZswGu4ftrg08BMjYV2nKuDnHj2VniK+i5jpOY8fnTLWgTq4kTjxno3fdWxoyX5mhmX6n
	5vPA==
X-Gm-Gg: ASbGncvW0OfcebYsGYRSBAMHByV66gc2FIxICUbYNGEzF1QJEk0b46DuTTk8H+pz5vg
	OyMl024CSJp199TWObm34W+TBZBbJFnwvY5fasumPES+SRG5IBhyBmsI26Jm2qYLcNN1MnP3Ta7
	QQGhh0CMQNgwd6eg6u/AwR4LfV44DSR9A6z7pzOeBXeEZdtK+SP7qSfg3g2mO6U7VZb088DzeB2
	VevuYhsxexlSWoDLeILlmpv2rDNfpC2lH0ASx9MWNY+cJ5YT3+aZts6UYHKko/rM2jIj8FKUlZA
	lfIgf8weUv/AvKQ4ER947zoXiQ9/QczOU/H9ipLPcDORztZdsbcM2VNSiSkro3yhCxznnqo175s
	lcPN2WRfxN+XNXfwQVvsM
X-Received: by 2002:a05:6a20:244f:b0:230:3710:9aa9 with SMTP id adf61e73a8af0-24340bce30emr25026149637.4.1756268457893;
        Tue, 26 Aug 2025 21:20:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdCRcL4yrE9XGANFjJJjHieROHuyk+4KHF1iEmPx2C2KpvsxbNZ36c7SUdVsYPPF6S/m2zyw==
X-Received: by 2002:a05:6a20:244f:b0:230:3710:9aa9 with SMTP id adf61e73a8af0-24340bce30emr25026121637.4.1756268457424;
        Tue, 26 Aug 2025 21:20:57 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-771f4072ac4sm4323076b3a.34.2025.08.26.21.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 21:20:57 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 3/3] coresight: tpda: add sysfs node to flush specific port
Date: Wed, 27 Aug 2025 12:20:42 +0800
Message-Id: <20250827042042.6786-4-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250827042042.6786-1-jie.gan@oss.qualcomm.com>
References: <20250827042042.6786-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68ae87aa cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=l6kBNUb3cY0M__Xq7_0A:9
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: yIuuOkcomZOerQ96b7658RhvPNdB_HDe
X-Proofpoint-ORIG-GUID: yIuuOkcomZOerQ96b7658RhvPNdB_HDe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX/p0Q+UsG7dao
 GON4YKkuQlsHEh5c88hAa9C/Edy1xld985P0oMdmwzM6csiU0Zo7jhUzS84EnErWU378fkwWf7r
 cIuF3DnCPwTwcUxvedIQ5CXHpunaWa2KGXm4CgEQkJhROtlPocHVYXq1S46U5Ijt32+ATcg5Ccw
 hezT5U9FmAWo83+1OZ7UahMBEynby7fpJK6fsVy6VbTExmwkrVnMPo5QWwoL1IrrqWUitlM8VGl
 c1bGaQmn6iKucDkMy70W6lBnZQxzz0/4rKKXf9dVQh+uN3kU/KGfRdlGmCIKpKvorjq8Y6yY3ab
 4KaTfzsoSMB7Dz3ivYCdS1wBUslnh8m26HS+gsmayTvLI4OgrtO4kPperJE2L5UTvTOsTykSpPj
 E8CfVpgF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_212059_226649_B9E437BD 
X-CRM114-Status: GOOD (  17.26  )
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
 drivers/hwtracing/coresight/coresight-tpda.c  | 42 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.h  |  2 +
 3 files changed, 51 insertions(+)

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
index 430f76c559f2..8b1fe128881d 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -487,6 +487,47 @@ static ssize_t cmbchan_mode_store(struct device *dev,
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
+	return sysfs_emit(buf, "%lx\n", val);
+}
+
+static ssize_t port_flush_req_store(struct device *dev,
+				    struct device_attribute *attr,
+				    const char *buf,
+				    size_t size)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	if (!drvdata->csdev->refcnt || !val)
+		return -EINVAL;
+
+	val |= FIELD_PREP(TPDA_MAX_INPORTS_MASK, val);
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
@@ -494,6 +535,7 @@ static struct attribute *tpda_attrs[] = {
 	&dev_attr_freq_ts_enable.attr,
 	&dev_attr_global_flush_req.attr,
 	&dev_attr_cmbchan_mode.attr,
+	&dev_attr_port_flush_req.attr,
 	NULL,
 };
 
diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
index 8e1b66115ad1..56d3ad293e46 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.h
+++ b/drivers/hwtracing/coresight/coresight-tpda.h
@@ -10,6 +10,7 @@
 #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
 #define TPDA_FPID_CR		(0x084)
 #define TPDA_SYNCR		(0x08C)
+#define TPDA_FLUSH_CR		(0x090)
 
 /* Cross trigger FREQ packets timestamp bit */
 #define TPDA_CR_FREQTS		BIT(2)
@@ -35,6 +36,7 @@
 #define TPDA_SYNCR_MAX_COUNTER_VAL	(0xFFF)
 
 #define TPDA_MAX_INPORTS	32
+#define TPDA_MAX_INPORTS_MASK	GENMASK(31, 0)
 
 /* Bits 6 ~ 12 is for atid value */
 #define TPDA_CR_ATID		GENMASK(12, 6)
-- 
2.34.1


