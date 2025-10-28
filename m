Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006DBCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 02:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3epSb0t8HHhoh5WOV+VQxTTFaSybHMJLkwS6nbJJ/8M=; b=J2telLK5CBgjZhLnRMSdN4PxS/
	ZaAnXDzDCZw0BEXDQK/LZsUeovF1Cge/PdB/tS95sIKo8V1+gB+P2Ni+ai9E/jtTJLTAv929uKUG1
	KIIGrqUqDQWPsO0o7klE99dT6WNzPFUXqGSixTzXEY+GBpusoPPJ5snI4s31d8YhnruOgtEoVq4gB
	k04WoBYSt8WsTZRt6b1SigMtV84S1eqRzzrvPlh35oeSh+SOKiEGiI4+/SSn8zMv8kHnD62h28WVN
	cispw6T8zDsiwlKpuoZtj7+HG6Ld3AZsnt/vzIo2gelTXtwXRgkulTv0ygyT8EQiJ42LlJxbpu13/
	7fou1ogg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDZ2v-0000000F6Ef-3HYW;
	Tue, 28 Oct 2025 02:02:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDZ2q-0000000F6DL-2IlS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 02:02:46 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RKkUB43813900
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 02:02:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3epSb0t8HHhoh5WOV+VQxTTFaSybHMJLkwS6nbJJ/8M=; b=I8WbU2YxZ+u4wR1I
	5MHQcv4WYeiuOzKOQDe5UnO7uDlt7LmzCQGcqKunf+PuVCbLI03A8DfiNldqsC2P
	hIwosVHwBSFRYHYMcgDoBM5gCQOzz5fIre79W05aHkEjtXdwdeEfkyXUQtI4R8v5
	o+w6+6eUwSJ5Yl2y06z1Ll/7Q9fC82z8n5lYsQoYpiQ2e6ANbd87ODSQ9XIk1Qsq
	vgDSqqtkh5LXpBr8VJbRH4RzyDBMnH25DNlQgC0rnkVAK+KKTXx6oqZOl1TH1xj4
	1sD/Ta/Xdwu3n/t7FLCSfIPNC7/7HUbzXG32eWpSi9y0d6ITQguMF3VpwUbr8h5M
	gBMP5g==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2g2frm02-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 02:02:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-26983c4d708so40648715ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 19:02:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761616963; x=1762221763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3epSb0t8HHhoh5WOV+VQxTTFaSybHMJLkwS6nbJJ/8M=;
        b=fUh4pmypIYugJG0VsR1OKDT7J2qi1vQgBKQNB73wTSSPGaSnd8jC2Zs6cGSTQ4B9b9
         DRGzNvHq9UCplJvuBQKL8RI94OYJadXPKkcY1+fgkdnY5zZGiLrac3WWMVZBAEAJtpgg
         qp4b8flkLvPTL7smrDfshzSVk0F6+2Y/4/iFJS2wkG3h+Yay2z6D85d+S+O/IKdkAjJ8
         UB4ExGSzilq6oZ80qR5rW2NUioSFSpecBxpMg72yI8PBb8qIMG8a2QDBm+zf0WgD2loY
         tNylCcoTSmoLF4zEzR+Os839BMlItwKAH56RZnMvtXHbL6rkWZ36z16gz24QBXcWc4mY
         CCSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVadTRHL6L40T6urtYk6MsjniuSk08zcOiQWiZoWNNvP33dCeYOc4zoVqOtfBtWo2nzsPZWImkMWa7I3z4O7HpI@lists.infradead.org
X-Gm-Message-State: AOJu0YylpXCfwOEh3JOFs00I2ox43woZR1Dpr6QG7j03CLUpJLGdsJS6
	x/mY9n174HDG7EKpdrhDAmZtoGL/KWYIHizyw/xbADtCG/3rpJPhW0hhlMFMtAVbJMTvpSGPWja
	Z7d080FRmEh4l0oVAbQGryp2msNyTwTYwfrDSBlIID7W8PyHG8fEWB/wTzSL2b6KcqaaJwY+rlq
	3NXg==
X-Gm-Gg: ASbGnctCMqRLl84b5Pevio+UfsGSCqx6lU+PFXhHZo/bJ4MhgYCYzWOW9POb9XhbUnC
	78FP9S5rTqdJJ4nkA88cCOMCWVyU2I2w4DdtB1Et0jYteLuS1eTaJs5ge4KroUz9xuAMlj01nky
	hAfLTl021grRdPn8kiZpph9RMrrFScXyamzjjeX9FP3Tvk/TGczhQMEHg5Tb1S4sKVGomTwNVb+
	pulHn7+7z6YghtnjDl04gpmHSyJDMO4bFGHmER9MOrFrnkdTpsIpTdeNSHRGRNkN9g1PD5CxUQt
	eNGamD8mJID2jFuUUD5IyQWwPN1z22z5AqGyVA3zTjhz+ZOHjyl0zAoc9nyqcguRKC4s83hCjfR
	Gc6PNaicxL02m9hbl2k4Twxfc6x7huDEy+1a2qs2E6DJLFs9GxRfmlKGUNEv6K4e1jg==
X-Received: by 2002:a17:902:f681:b0:290:7803:9e8 with SMTP id d9443c01a7336-294cb5002d3mr25225155ad.48.1761616963173;
        Mon, 27 Oct 2025 19:02:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETGD/zAK7hGfnKKzIq42yHrVDikCdhRoLO+HiddYmVTIKelxMCKZBDzGWOO228ks3AWqzS9g==
X-Received: by 2002:a17:902:f681:b0:290:7803:9e8 with SMTP id d9443c01a7336-294cb5002d3mr25224505ad.48.1761616962536;
        Mon, 27 Oct 2025 19:02:42 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d2789bsm95861895ad.62.2025.10.27.19.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 19:02:42 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 10:02:15 +0800
Subject: [PATCH v4 1/3] coresight: tpda: add sysfs nodes for tpda
 cross-trigger configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251028-configure_tpda_reg-v4-1-23000805d21d@oss.qualcomm.com>
References: <20251028-configure_tpda_reg-v4-0-23000805d21d@oss.qualcomm.com>
In-Reply-To: <20251028-configure_tpda_reg-v4-0-23000805d21d@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761616954; l=12467;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=IpmhOWbt034q73PPJ2hhifo7A9IMmz9tn/9Xmafp87I=;
 b=Es80kzhjP7HQCpVFFLpIvaaJzxBL99HqsGGNwu3JS3fcqvusts2e/EPv3cPKItDawf1Kv9/H/
 fmYlVDPobvZAYyBQDk3h3r3urieWfOzHElN05jRFRV0Qt2rNf5TrtHf
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDAxNyBTYWx0ZWRfX8xpqNOp6Erom
 gIf7olTgEcHNwQ3Ra7QTav9JGMuoWmlY4/VwouhpAVgWqppfrqfj5x/ZdRwn9CPgy7q0c6FGg//
 jP0qWiekObaEU1e0ho6xsxk9Cxhx1l0+391KDUgPCIVx2Ps7sdD5VvS88ByK/+U0Lzjl3GHAlDT
 CHum3K24qyeXcOv2wxz0zG0/0wY5nOJEroWBEw/dx+d4B7XyX2CbjEwLMREOXlWwtoi2eU0uCAy
 +ImwdoUtQS2rlu7id2dRNor7hEL/2i2a7HLCjDLoNMxnndR1b3AHRpaHYVzVm2TlVi8HUTUzBMi
 Jag/bDqcYXZcgtfGuIZ+qilJSQ37SxHU0869W4Cv6Jdw9vDCuJDblX2dgZR658Q4+yWywnDGbx/
 Oz/8qawP2M5zw5MKG0NTfzAREO7vHA==
X-Proofpoint-ORIG-GUID: CjtDkd9T8M0pTKdNUZciy_Ckha0RCmRv
X-Proofpoint-GUID: CjtDkd9T8M0pTKdNUZciy_Ckha0RCmRv
X-Authority-Analysis: v=2.4 cv=FIMWBuos c=1 sm=1 tr=0 ts=69002443 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Hl4cRc3ft4hpfJdQRooA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_190244_608777_EC68EFAC 
X-CRM114-Status: GOOD (  20.80  )
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
Reviewed-by: James Clark <james.clark@linaro.org>
Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-coresight-devices-tpda   |  43 ++++
 drivers/hwtracing/coresight/coresight-tpda.c       | 230 +++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.h       |  27 ++-
 3 files changed, 299 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
new file mode 100644
index 000000000000..80e4b05a1ab4
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
@@ -0,0 +1,43 @@
+What:		/sys/bus/coresight/devices/<tpda-name>/trig_async_enable
+Date:		October 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Enable/disable cross trigger synchronization sequence interface.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/trig_flag_ts_enable
+Date:		October 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Enable/disable cross trigger FLAG packet request interface.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/trig_freq_enable
+Date:		October 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Enable/disable cross trigger FREQ packet request interface.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/freq_ts_enable
+Date:		October 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Enable/disable the timestamp for all FREQ packets.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/global_flush_req
+Date:		October 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Set global (all ports) flush request bit. The bit remains set until a
+		global flush request sequence completes.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/cmbchan_mode
+Date:		October 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Configure the CMB/MCMB channel mode for all enabled ports.
+		Value 0 means raw channel mapping mode. Value 1 means channel pair marking mode.
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 333b3cb23685..a9a27bcc65a1 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -147,9 +147,37 @@ static void tpda_enable_pre_port(struct tpda_drvdata *drvdata)
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
@@ -265,6 +293,206 @@ static const struct coresight_ops tpda_cs_ops = {
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
+	/* Only read value for bit 0 */
+	val &= BIT(0);
+
+	return sysfs_emit(buf, "%lu\n", val);
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
+	/* Only set bit 0 */
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
@@ -280,6 +508,7 @@ static int tpda_init_default_data(struct tpda_drvdata *drvdata)
 		return atid;
 
 	drvdata->atid = atid;
+	drvdata->freq_ts = true;
 	return 0;
 }
 
@@ -323,6 +552,7 @@ static int tpda_probe(struct amba_device *adev, const struct amba_id *id)
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


