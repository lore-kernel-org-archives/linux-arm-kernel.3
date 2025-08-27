Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4AFC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 04:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s5viB26d9ogA7bSXQQ+AjGcC0mWZNZTo//V2CNZ/xps=; b=dzgBnHsth3V+Bnz8D9ZG9uYuXG
	qhjpeA+2ZXOhP7+7l8OmSXlreEffYAQYY57XGybXaj3pGOwHzaehI+VHDlzcSx9peLbYEpFolWUDy
	BMtzqvJFz3eRWrMRIMk9pnyskw7b1uHWIcsBZ0wrGA3iC5Y1U4NlpA0MKMSiybLxOSgrjwZAxlKwk
	qh4rbvcXrDXihCbhZuf4tHQPv2BGjEograSHz1rZ3IDWhppNBFoztButH+PvNnpgjD1Ern3P5I+U1
	2oMyHlQ73EXUk2G4buRbQCZQTI9ylxZCFNl48XCnmFY1AoA0Ps70vrn8r7C2yOeu8k7Gs2LAgxkXA
	nwblou/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur7jp-0000000DxxI-2G09;
	Wed, 27 Aug 2025 04:26:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur7eX-0000000DxFS-3FTN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 04:20:54 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57QJf37K000801
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 04:20:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s5viB26d9og
	A7bSXQQ+AjGcC0mWZNZTo//V2CNZ/xps=; b=euMJ2t7sHGm6rq00oGtYpiYKFRU
	WumgUA7ncKXcFRzxao2wHgrH6d1Ed/28HV/tDgV+DSlK3BJK+6QVNCiWG4mz0fdv
	OIusO8OzS/O/1KPXKaBbByX9KcIJPMvh0H0QoP6RO3xDqhH7arFW7+RvqqshbX70
	t3/Yk2hCfGAAxnCG91AD3JrM80wX1IDVarsGxr+cOeB/RxvMsgi3bW1CJZnwOXRg
	ow+i3sjNtmsj63h0SlS0s7uOa8SY4Ne9CJHyPdw+alNP0rFxzyQu6fq7thP2q+4l
	DBoDgTtfVsSZintDw7o7+24cd8AC8sYjgU/k1Jzi/CWFIgBgcL2KEmGeY1g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5xpujn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 Aug 2025 04:20:53 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-771e1451631so5713809b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 21:20:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756268452; x=1756873252;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s5viB26d9ogA7bSXQQ+AjGcC0mWZNZTo//V2CNZ/xps=;
        b=FzHttJ+B7GcIXmM+WV+R3PWzaJqTba05UJ5PB/QWp1ACkdVByQENaDxOrYehhOI6Xg
         Zdv9eY7pTvj4JpwMLpWJlq+CqfwGdrZ8EN7HoakwwZZYZMfwWSsFZXtxLs40pdUajVni
         IClsmWAEDNriWEk4nKKI2oy2yEdl7KLZ3dULZ3rRHIKnUhxEbCv1ljWaUKaYQp7eJcK0
         ymvSZLnfBkvxmH407VEw6L6X6FsMziuqEi3eff9FdH5jIIaZS7cMhxRM3lxnu0qkOO9H
         eYK9OHuvYtF3oxuZxC5/qo1gZZN7lKfHKpRTtO6xhlrCVagR7dHANX1z+Bu5Wb+q8vLC
         NoWw==
X-Forwarded-Encrypted: i=1; AJvYcCX/mxLQQfe2KPY8EUEbXKuNk3rD4r0NrEme/0jIiRT63/+atbkmVkqYwPkPKpHKRg6WQuY1e54m4pb6F5+Ss32c@lists.infradead.org
X-Gm-Message-State: AOJu0YwDWQDns1PJ83SFNdrJkPQdrxUyjRA6Hjf6s1g3gkBgw66qf7v+
	VZ6PIiIvLEw5TeTI/wYL/nWmb7GnjuugraY4omCbnHmZ6xnNEnTQXLONHkLNIi7ovf5cqGuZJPg
	rdPBA0IGMYNqywgM1PE8BK2EMxciroVC2T0f73XvlClfcUcdf5zLGiC0egDvPwnikon7QlOVMra
	dZhRmBiZlzbw==
X-Gm-Gg: ASbGncswpajo9sPIlt+4U3t0P1V71AeO7ppuqph6kvFj4PsOX3uhs6ds8UxAVJNlgg8
	f/m4MqD759VHrMSzBUubZslTjDs4wndbT9sSLmIeW8sF7HB/wo4bbf6wXBxvVE+RYknjliTnoF2
	eWqfi0hhDJ7qzLxWExQuaN8B5+U0LOngbt0krze+bnMTbvxFYia5t15ox3ROiXaKWxX7WRTk45Q
	iI9dbVq6NR7shldyn0c3WozdPdn4YVh+yKvXtMxXtM6ixz5TtnDqvAIDIhoeJzhN5QcBqT8Fi3j
	HeE4iKIBqp8ZAxXxuSg9jvcAamIStQ4SZf9s/HXVLH6/mLkJwcGtKi6Ac4zjefW8fRIGUp9oV/z
	naK4aAmfABrwRDd4jwLDE
X-Received: by 2002:a05:6a00:3a07:b0:76e:8cf4:7bc4 with SMTP id d2e1a72fcca58-7702fc0a0c1mr20314492b3a.26.1756268452068;
        Tue, 26 Aug 2025 21:20:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWdD4SzItB5SoQXCaoV9DamJae3Xr2kC0zbdTuIzRmptB4vtCRfGd9dS3ojRxh9VDY4bzDoA==
X-Received: by 2002:a05:6a00:3a07:b0:76e:8cf4:7bc4 with SMTP id d2e1a72fcca58-7702fc0a0c1mr20314434b3a.26.1756268450914;
        Tue, 26 Aug 2025 21:20:50 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-771f4072ac4sm4323076b3a.34.2025.08.26.21.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 21:20:50 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 1/3] coresight: tpda: add sysfs nodes for tpda cross-trigger configuration
Date: Wed, 27 Aug 2025 12:20:40 +0800
Message-Id: <20250827042042.6786-2-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250827042042.6786-1-jie.gan@oss.qualcomm.com>
References: <20250827042042.6786-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=KOlaDEFo c=1 sm=1 tr=0 ts=68ae87a5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=Hl4cRc3ft4hpfJdQRooA:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: 8W0E5IBasRBukNnNF2SI4GBhkPJ7XRU4
X-Proofpoint-ORIG-GUID: 8W0E5IBasRBukNnNF2SI4GBhkPJ7XRU4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX5DC+rmlqAH3F
 LR9eqq+F0Is2aE2WymIhHny9iu0HQ+KpXrwLkRH2b0zDRAs7Xe2bxpSRxkbw4vAeY0Z7k8doqDz
 e10JPtaOMi62j2dzgix6/1EG8VdpCtPKWeI1hurHe/ERoOjQNYvOA37VQHdfLSTgE1a4oauDdZs
 wJiZNPVF5Lv0LyKiRhuwpp74/h89V1i3lbzjj+w5qVnV3jyqMc6LKDnlHKoYJYK2wYBhlVvhaHy
 7j/1ycxWZMDQP2MdTMVUoyEIQn0UeNI8ViimW9chnuxIl+pEK/TkK65Poi5PI1nhrfbX2P1PGtj
 JjG6aZwf5sRBoI+Y2sf5l9vY6mNgzGLbiS1kxllMHEcpyyW+YBbsUzx9mnP4IM1lXH59fj9thTj
 yO6GdTE9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_212053_822797_3BFDC338 
X-CRM114-Status: GOOD (  22.17  )
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
 drivers/hwtracing/coresight/coresight-tpda.c  | 227 ++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.h  |  27 ++-
 3 files changed, 296 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
new file mode 100644
index 000000000000..fb651aebeb31
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
+		(RW) Set global (all ports) flush request bit. The bit remains set until a
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
index 4e93fa5bace4..647ab49a98d7 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -156,9 +156,37 @@ static void tpda_enable_pre_port(struct tpda_drvdata *drvdata)
 	u32 val;
 
 	val = readl_relaxed(drvdata->base + TPDA_CR);
+	val &= ~TPDA_CR_MID;
 	val &= ~TPDA_CR_ATID;
 	val |= FIELD_PREP(TPDA_CR_ATID, drvdata->atid);
+	if (drvdata->trig_async)
+		val |= TPDA_CR_SRIE;
+	else
+		val &= ~TPDA_CR_SRIE;
+	if (drvdata->trig_flag_ts)
+		val |= TPDA_CR_FLRIE;
+	else
+		val &= ~TPDA_CR_FLRIE;
+	if (drvdata->trig_freq)
+		val |= TPDA_CR_FRIE;
+	else
+		val &= ~TPDA_CR_FRIE;
+	if (drvdata->freq_ts)
+		val |= TPDA_CR_FREQTS;
+	else
+		val &= ~TPDA_CR_FREQTS;
+	if (drvdata->cmbchan_mode)
+		val |= TPDA_CR_CMBCHANMODE;
+	else
+		val &= ~TPDA_CR_CMBCHANMODE;
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
@@ -274,6 +302,203 @@ static const struct coresight_ops tpda_cs_ops = {
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
+	drvdata->trig_async = !!val;
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
+	drvdata->trig_flag_ts = !!val;
+
+	return size;
+}
+static DEVICE_ATTR_RW(trig_flag_ts_enable);
+
+static ssize_t trig_freq_enable_show(struct device *dev,
+				     struct device_attribute *attr,
+				     char *buf)
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
+	drvdata->trig_freq = !!val;
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
+	drvdata->freq_ts = !!val;
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
+	if (!drvdata->csdev->refcnt)
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	CS_UNLOCK(drvdata->base);
+	val = readl_relaxed(drvdata->base + TPDA_CR);
+	CS_LOCK(drvdata->base);
+
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
+	if (!drvdata->csdev->refcnt || !val)
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	CS_UNLOCK(drvdata->base);
+	val = readl_relaxed(drvdata->base + TPDA_CR);
+	val |= BIT(0);
+	writel_relaxed(val, drvdata->base + TPDA_CR);
+	CS_LOCK(drvdata->base);
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
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	drvdata->cmbchan_mode = !!val;
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
@@ -289,6 +514,7 @@ static int tpda_init_default_data(struct tpda_drvdata *drvdata)
 		return atid;
 
 	drvdata->atid = atid;
+	drvdata->freq_ts = true;
 	return 0;
 }
 
@@ -332,6 +558,7 @@ static int tpda_probe(struct amba_device *adev, const struct amba_id *id)
 	desc.ops = &tpda_cs_ops;
 	desc.pdata = adev->dev.platform_data;
 	desc.dev = &adev->dev;
+	desc.groups = tpda_attr_grps;
 	desc.access = CSDEV_ACCESS_IOMEM(base);
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
index c6af3d2da3ef..0be625fb52fd 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.h
+++ b/drivers/hwtracing/coresight/coresight-tpda.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023,2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef _CORESIGHT_CORESIGHT_TPDA_H
@@ -8,6 +8,19 @@
 
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
@@ -19,6 +32,8 @@
 
 /* Bits 6 ~ 12 is for atid value */
 #define TPDA_CR_ATID		GENMASK(12, 6)
+/* Bits 13 ~ 19 is for mid value */
+#define TPDA_CR_MID		GENMASK(19, 13)
 
 /**
  * struct tpda_drvdata - specifics associated to an TPDA component
@@ -29,6 +44,11 @@
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
@@ -38,6 +58,11 @@ struct tpda_drvdata {
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


