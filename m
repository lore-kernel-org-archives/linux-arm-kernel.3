Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5FA7CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 07:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m9K2WekX9kTnRq8yZxxjhrDbniYSZNxmfq2nx9Es5RA=; b=21GyB4rRmVugGgNU80Xuz3W9jg
	h0dL31YD19pTpdTQRVFX8NUhg5rLcVaqEco8GLBVC10tORSpMBlDCVpm911UogaFeKDBUi8IHxoEY
	pdTDai2uCOaD+75IOpXlZ/QsVF/9AWNtspybjKDPpT9Ucg0u8IaTejCY+R2V9KC0DqXD47+WfKJUB
	8lFGSsmVaT4C64NBEhaX5FksoOrHUTuLK8MEojAzQf91z3RyL2rGl6ToPodLIANKez6TITwkYaVzt
	dofrM3pg2plZNFXQ01yqBXro+ZB6Rw36V6Hya7kxZUtOrOwuLVevX4jbqmN0RvMeKO/CE8L5Xgchp
	Y23xpMpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqnmE-0000000AnPy-29dc;
	Tue, 26 Aug 2025 07:07:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqngw-0000000Amx7-08mG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 07:02:03 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q5EMo4030384
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 07:02:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=m9K2WekX9kT
	nRq8yZxxjhrDbniYSZNxmfq2nx9Es5RA=; b=DTiooAfw66xn+wYuJrwUEawUBzr
	S8k2lc86WQttbuwoNsJg1eWhmKlupp5FPszPs4csgJ5dIVKiYhigeSXeCG2gN6Ei
	n1GrJg6qHJhSkWjhb+vzPJHzeTo7Ey41+SbB87LpFBD48Cq2iDQGmVlStIOavijD
	HS+4JJPMpq6QWEvq2s36zIiDFqDn7itA7c9DV115lYigrAhDqb//Dfm6jzzVltY1
	MYPtPqNtAgEsQRauapJchbiQdq0ljbsBXkXNvshri9KxraZYs2WvErOMmHg50XRF
	V+7snSNIKwx3RDI/06TbVF9Wb8677IWoJwJXJoJPhl6kxeym3bswtv0iv8Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5um7w90-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 07:02:01 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b47174c65b0so9051474a12.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 00:02:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756191721; x=1756796521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m9K2WekX9kTnRq8yZxxjhrDbniYSZNxmfq2nx9Es5RA=;
        b=Xc3/8J7IK4hnWeXQO3qOcc3V7S116hQsT+izO05dlJjdFb20y95QCS/RyXcE/kGkeE
         0xUB7w6RR3qvmuZYvHzMwo6tAIynBCeqiFZ2da8V3jMwT1xsdZEbmmrVN+O1KybQHGNE
         pq21OfqpqH65J6u0kgyvTYdY4K/4ri3EBqaFZ9HzMINkxBVu6OjQF8fMhoKhMjwspCor
         8/q6aWf3B+VaFD3xo/tWvR/dG7DZYZJC58o3RGoOhBURz2U+tdTqRqt37qrv/bW6JrRm
         COfEqnht0AVrL+DECx9HSH7nnV/eon1gx/17zj0jFLJjdfm7VPL62vOTYWbLxGnmIBc5
         m7FQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKvEAws3aEFaxPB6cOqYHqAUruFlyvLDKZ5JWHsBrN6QhIVtis+zvhz2kjCwW5iM5NayhSRpL8SZHmQmOmFhZH@lists.infradead.org
X-Gm-Message-State: AOJu0Yyek0KupCOWnzv4Lzlo65Nnv4e0XQnBY3SjbcclXcjcGaBWi0zG
	rGAfU12mJv/e+Y9ArvZndQaZLcmvt352pOFbIlRjYIdWLPleXuAJ3d/35EkUEdEoGeo6UB4FRXy
	4FZq110lr/u6+LI/vio5XmT47ys8lQEhkYLT/Z0qiTSNsIf7bSZ4EZ59UB2F40evs1nL6/SCJWX
	5fAQ==
X-Gm-Gg: ASbGnctCOdIgKwdBuE4bnkzg3nNsjWxTHSv7VJLPh8zPnXPt3iOYtTBsuVMWuCOoHgB
	n2mOh+UooOJzGHJtty7bO9paAZ1n0PWsoOaTnjf7lGhgGeGncI1mWgGFdE/LWlhdwpTO4hnwZGK
	2x1NAzl53rStLYRxoscQagyvlm3sejP1k7Bo7+GIz4Etsf4tvEkBEaa556bcn5WYQ2Xko6drfPp
	WludwNApJEqtPTGBCTeeBwjLCR4Qw/9UzMp4+a8aweJBVY7rXnJfbh40XY7nrboyOy+ACvoPt9J
	LVWGKOYQpiXujwnlXfceMuoGRTPk8IxT2a8Z7Wgkn0P+LqdXpkeWU6YSc7I7820/nB3yjrvQy95
	W6lJOOMtEbNALYe1xBDTj
X-Received: by 2002:a05:6a20:939f:b0:240:c3d:2449 with SMTP id adf61e73a8af0-24340d1c795mr21209328637.42.1756191720588;
        Tue, 26 Aug 2025 00:02:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IErdrLh/EhVGg9J5i6FyPereXOVgDVfJgcH352jUBOkW9ABzl67CWi5xgFFU6sDrJzA/uJDHg==
X-Received: by 2002:a05:6a20:939f:b0:240:c3d:2449 with SMTP id adf61e73a8af0-24340d1c795mr21209269637.42.1756191720030;
        Tue, 26 Aug 2025 00:02:00 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770b5bed428sm5628582b3a.16.2025.08.26.00.01.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 00:01:59 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 1/3] coresight: tpda: Add sysfs node for tpda cross-trigger configuration
Date: Tue, 26 Aug 2025 15:01:48 +0800
Message-Id: <20250826070150.5603-2-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250826070150.5603-1-jie.gan@oss.qualcomm.com>
References: <20250826070150.5603-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VtIjA/2n c=1 sm=1 tr=0 ts=68ad5be9 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Hl4cRc3ft4hpfJdQRooA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMiBTYWx0ZWRfX38da2ukilfiI
 Oac32SCJbIiD2ZKNQGmzSzcLFJt+xp50aSm7JmGeORr07xM5hpfP+2L2u9VoE50mMnSVLGpX/sU
 CJJA+F1IFG7zSTMcj0qcIE5ugW/uPiSkS2oPZCcHl079glfIDjGXQLPLizAxfe/TjglyaVUNyNw
 EgZjGddor/Kj/SYchAW+aywCk9Wj4jnmmFPf/Eq0qQ8R2joYjutcIBDawzEC6aDzTiGD1VNVxdh
 qCL9hB2WKLj2FFfggxFSZATgiAeK2GUkvgRV3q11AyY28jfQG6mrEIIPmWDId8ubYcKjAciXgvA
 61xFg/0DgSjGgco7Dk/8qlnA/hIM//TdUWFj6WonRT1afj1iVBRVycciM9EitAcz8n4ocbwEcM4
 bmDgaHC+
X-Proofpoint-GUID: -AzwnCiQUgODe6i4XlUX69HmTrkjCr8x
X-Proofpoint-ORIG-GUID: -AzwnCiQUgODe6i4XlUX69HmTrkjCr8x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_000202_175641_7ED01423 
X-CRM114-Status: GOOD (  22.38  )
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

Introduce sysfs nodes to configure cross-trigger parameters for TPDA.
These registers define the characteristics of cross-trigger packets,
including generation frequency and flag values.

Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../testing/sysfs-bus-coresight-devices-tpda  |  43 ++++
 drivers/hwtracing/coresight/coresight-tpda.c  | 241 ++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.h  |  27 ++
 3 files changed, 311 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
new file mode 100644
index 000000000000..e827396a0fa1
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
@@ -0,0 +1,43 @@
+What:		/sys/bus/coresight/devices/<tpda-name>/trig_async_enable
+Date:		August 2025
+KernelVersion:	6.17
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Enable/disable cross trigger synchronization sequence interface.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/trig_flag_ts_enable
+Date:		August 2025
+KernelVersion:	6.17
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Enable/disable cross trigger FLAG packet request interface.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/trig_freq_enable
+Date:		August 2025
+KernelVersion:	6.17
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Enable/disable cross trigger FREQ packet request interface.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/freq_ts_enable
+Date:		August 2025
+KernelVersion:	6.17
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Enable/disable the timestamp for all FREQ packets.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/global_flush_req
+Date:		August 2025
+KernelVersion:	6.17
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Set/unset global (all ports) flush request bit. The bit remains set until a
+		global flush request sequence completes.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/cmbchan_mode
+Date:		August 2025
+KernelVersion:	6.17
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Configure the CMB/MCMB channel mode for all enabled ports.
+		Value 0 means raw channel mapping mode. Value 1 means channel pair marking mode.
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 4e93fa5bace4..cc254d53b8ec 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -156,9 +156,37 @@ static void tpda_enable_pre_port(struct tpda_drvdata *drvdata)
 	u32 val;
 
 	val = readl_relaxed(drvdata->base + TPDA_CR);
+	val &= ~TPDA_CR_MID;
 	val &= ~TPDA_CR_ATID;
 	val |= FIELD_PREP(TPDA_CR_ATID, drvdata->atid);
+	if (drvdata->trig_async)
+		val = val | TPDA_CR_SRIE;
+	else
+		val = val & ~TPDA_CR_SRIE;
+	if (drvdata->trig_flag_ts)
+		val = val | TPDA_CR_FLRIE;
+	else
+		val = val & ~TPDA_CR_FLRIE;
+	if (drvdata->trig_freq)
+		val = val | TPDA_CR_FRIE;
+	else
+		val = val & ~TPDA_CR_FRIE;
+	if (drvdata->freq_ts)
+		val = val | TPDA_CR_FREQTS;
+	else
+		val = val & ~TPDA_CR_FREQTS;
+	if (drvdata->cmbchan_mode)
+		val = val | TPDA_CR_CMBCHANMODE;
+	else
+		val = val & ~TPDA_CR_CMBCHANMODE;
 	writel_relaxed(val, drvdata->base + TPDA_CR);
+
+	/*
+	 * If FLRIE bit is set, set the master and channel
+	 * id as zero
+	 */
+	if (drvdata->trig_flag_ts)
+		writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
 }
 
 static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
@@ -274,6 +302,217 @@ static const struct coresight_ops tpda_cs_ops = {
 	.link_ops	= &tpda_link_ops,
 };
 
+static ssize_t trig_async_enable_show(struct device *dev,
+				      struct device_attribute *attr,
+				      char *buf)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_async);
+}
+
+static ssize_t trig_async_enable_store(struct device *dev,
+				       struct device_attribute *attr,
+				       const char *buf,
+				       size_t size)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	if (val)
+		drvdata->trig_async = true;
+	else
+		drvdata->trig_async = false;
+
+	return size;
+}
+static DEVICE_ATTR_RW(trig_async_enable);
+
+static ssize_t trig_flag_ts_enable_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_flag_ts);
+}
+
+static ssize_t trig_flag_ts_enable_store(struct device *dev,
+					 struct device_attribute *attr,
+					 const char *buf,
+					 size_t size)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	if (val)
+		drvdata->trig_flag_ts = true;
+	else
+		drvdata->trig_flag_ts = false;
+
+	return size;
+}
+static DEVICE_ATTR_RW(trig_flag_ts_enable);
+
+static ssize_t trig_freq_enable_show(struct device *dev,
+					  struct device_attribute *attr,
+					  char *buf)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_freq);
+}
+
+static ssize_t trig_freq_enable_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf,
+				      size_t size)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	if (val)
+		drvdata->trig_freq = true;
+	else
+		drvdata->trig_freq = false;
+
+	return size;
+}
+static DEVICE_ATTR_RW(trig_freq_enable);
+
+static ssize_t freq_ts_enable_show(struct device *dev,
+				   struct device_attribute *attr,
+				   char *buf)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->freq_ts);
+}
+
+static ssize_t freq_ts_enable_store(struct device *dev,
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
+	guard(spinlock)(&drvdata->spinlock);
+	if (val)
+		drvdata->freq_ts = true;
+	else
+		drvdata->freq_ts = false;
+
+	return size;
+}
+static DEVICE_ATTR_RW(freq_ts_enable);
+
+static ssize_t global_flush_req_show(struct device *dev,
+				     struct device_attribute *attr,
+				     char *buf)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	guard(spinlock)(&drvdata->spinlock);
+	if (!drvdata->csdev->refcnt)
+		return -EPERM;
+
+	val = readl_relaxed(drvdata->base + TPDA_CR);
+	return sysfs_emit(buf, "%lx\n", val);
+}
+
+static ssize_t global_flush_req_store(struct device *dev,
+				      struct device_attribute *attr,
+				      const char *buf,
+				      size_t size)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	if (!drvdata->csdev->refcnt)
+		return -EPERM;
+
+	if (val) {
+		CS_UNLOCK(drvdata->base);
+		val = readl_relaxed(drvdata->base + TPDA_CR);
+		val = val | BIT(0);
+		writel_relaxed(val, drvdata->base + TPDA_CR);
+		CS_LOCK(drvdata->base);
+	}
+
+	return size;
+}
+static DEVICE_ATTR_RW(global_flush_req);
+
+static ssize_t cmbchan_mode_show(struct device *dev,
+				 struct device_attribute *attr,
+				 char *buf)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->cmbchan_mode);
+}
+
+static ssize_t cmbchan_mode_store(struct device *dev,
+				  struct device_attribute *attr,
+				  const char *buf,
+				  size_t size)
+{
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	bool val;
+
+	if (kstrtobool(buf, &val))
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	if (val)
+		drvdata->cmbchan_mode = true;
+	else
+		drvdata->cmbchan_mode = false;
+
+	return size;
+}
+static DEVICE_ATTR_RW(cmbchan_mode);
+
+static struct attribute *tpda_attrs[] = {
+	&dev_attr_trig_async_enable.attr,
+	&dev_attr_trig_flag_ts_enable.attr,
+	&dev_attr_trig_freq_enable.attr,
+	&dev_attr_freq_ts_enable.attr,
+	&dev_attr_global_flush_req.attr,
+	&dev_attr_cmbchan_mode.attr,
+	NULL,
+};
+
+static struct attribute_group tpda_attr_grp = {
+	.attrs = tpda_attrs,
+};
+
+static const struct attribute_group *tpda_attr_grps[] = {
+	&tpda_attr_grp,
+	NULL,
+};
+
 static int tpda_init_default_data(struct tpda_drvdata *drvdata)
 {
 	int atid;
@@ -289,6 +528,7 @@ static int tpda_init_default_data(struct tpda_drvdata *drvdata)
 		return atid;
 
 	drvdata->atid = atid;
+	drvdata->freq_ts = true;
 	return 0;
 }
 
@@ -332,6 +572,7 @@ static int tpda_probe(struct amba_device *adev, const struct amba_id *id)
 	desc.ops = &tpda_cs_ops;
 	desc.pdata = adev->dev.platform_data;
 	desc.dev = &adev->dev;
+	desc.groups = tpda_attr_grps;
 	desc.access = CSDEV_ACCESS_IOMEM(base);
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
index c6af3d2da3ef..b651372d4c88 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.h
+++ b/drivers/hwtracing/coresight/coresight-tpda.h
@@ -8,17 +8,34 @@
 
 #define TPDA_CR			(0x000)
 #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
+#define TPDA_FPID_CR		(0x084)
+
+/* Cross trigger FREQ packets timestamp bit */
+#define TPDA_CR_FREQTS		BIT(2)
+/* Cross trigger FREQ packet request bit */
+#define TPDA_CR_FRIE		BIT(3)
+/* Cross trigger FLAG packet request interface bit */
+#define TPDA_CR_FLRIE		BIT(4)
+/* Cross trigger synchronization bit */
+#define TPDA_CR_SRIE		BIT(5)
+/* Packetize CMB/MCMB traffic bit */
+#define TPDA_CR_CMBCHANMODE	BIT(20)
+
 /* Aggregator port enable bit */
 #define TPDA_Pn_CR_ENA		BIT(0)
 /* Aggregator port CMB data set element size bit */
 #define TPDA_Pn_CR_CMBSIZE		GENMASK(7, 6)
 /* Aggregator port DSB data set element size bit */
 #define TPDA_Pn_CR_DSBSIZE		BIT(8)
+/* Mode control bit */
+#define TPDA_MODE_CTRL			BIT(12)
 
 #define TPDA_MAX_INPORTS	32
 
 /* Bits 6 ~ 12 is for atid value */
 #define TPDA_CR_ATID		GENMASK(12, 6)
+/* Bits 13 ~ 19 is for mid value */
+#define TPDA_CR_MID		GENMASK(19, 13)
 
 /**
  * struct tpda_drvdata - specifics associated to an TPDA component
@@ -29,6 +46,11 @@
  * @enable:     enable status of the component.
  * @dsb_esize   Record the DSB element size.
  * @cmb_esize   Record the CMB element size.
+ * @trig_async:	Enable/disable cross trigger synchronization sequence interface.
+ * @trig_flag_ts: Enable/disable cross trigger FLAG packet request interface.
+ * @trig_freq:	Enable/disable cross trigger FREQ packet request interface.
+ * @freq_ts:	Enable/disable the timestamp for all FREQ packets.
+ * @cmbchan_mode: Configure the CMB/MCMB channel mode.
  */
 struct tpda_drvdata {
 	void __iomem		*base;
@@ -38,6 +60,11 @@ struct tpda_drvdata {
 	u8			atid;
 	u32			dsb_esize;
 	u32			cmb_esize;
+	bool			trig_async;
+	bool			trig_flag_ts;
+	bool			trig_freq;
+	bool			freq_ts;
+	bool			cmbchan_mode;
 };
 
 #endif  /* _CORESIGHT_CORESIGHT_TPDA_H */
-- 
2.34.1


