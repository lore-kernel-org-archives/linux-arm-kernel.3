Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C97E6F07C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 10:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mre2uzg37555dFycG1pot97jCQNzgXS0YqsC2Jzjfo0=; b=Hrww/V89BVXG3PQtzcw0EJ1Okn
	AV+0qiYZA8WloJJGr4yNzciRcCT5OZIo/wdXfIT1xulO3zv2ZOJBVcajlIgqKsLz55+YupRzhm2LX
	jjv66Gq+hQ38ZHyu+8s0UqCjMZw7DjHEpW+obCLsOFGb+7+aGuF1+nKqv3lwmuWRdxYk+/h76ypHn
	XfVZh+kNdMwX6RhoB22torXtlPF9uiBwzjPbMh3Um5sm+8bg3uBLlgHur3XzEFOUk7Chm/dYGhF4U
	WG0zoN/N6dSeN7sZssN+SHS5u0T5W/4PfJTR/zK641yBMZmwEJB6H3/FNIC8hvLVQaTKXw6Ff5Q3u
	tqqVohYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzLO-0000000ErYY-27EI;
	Tue, 23 Dec 2025 10:10:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXzLL-0000000ErXE-2KjD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Dec 2025 10:10:16 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BN8WmSP2778107
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:10:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Mre2uzg37555dFycG1pot97jCQNzgXS0YqsC2Jzjfo0=; b=e7FIrC2061DBoZDE
	hxAy3xoPu8cgtrjzn+l5N5GhCEN97sMMbWU+6J9IaJqXebRtmueHCPiS/JlhLobe
	dno8QDrUMlVo8DgE5oiiCqDRZbjN9pfKr++k1+Oyg+sw/NDOSgJQW3vVTrXLw4+L
	+wBjiP6I/YgFmNlD0/YTc3bDQkNpGIxJTD/TktZAazfclxDCS2LDad+UmWSDt+13
	gjaLiQtdECx+botfc3eSDcuPLQ+7vlNKNuiGwzU1wOwcFYDh2JZtFrNBE92Qqh5y
	wlFnuPJ9kzMHQBl2hnNCS/CN1f3JKfI0NkhZC6iA3ga7KMSJHOHPgrtFX/6XO8dm
	JkyInQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b76yy384y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 10:10:15 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a09845b7faso71513425ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 23 Dec 2025 02:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766484614; x=1767089414; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mre2uzg37555dFycG1pot97jCQNzgXS0YqsC2Jzjfo0=;
        b=BqyliTRTUiXp9NohvwmxdrNInUONXNKSwWX/0TUwagii2+Wc6wPncB72eVkqs5lkKW
         rK0NYbVfaKqNFsIQzW799nqa3P63QXTEsw6Iycp+1Ao0dlN6swnNmucck3yCNM3a/xiZ
         3E17OajVitvtvvgZJodkRpBc+QPK3D/qcwtOCSq9YUQEER+qADJPcHbNI9vBD++R6nvM
         VjoVdoUMYQuUgmlwpe5hGZCFuOyTI5aqn+5Iw3I/D7ts8Qug8SOfDF2rHio/IGfbwZfj
         scReayDKiWIryFumRggWlz8/cb3MIblHeFZqXMPcPDcivwf0fMODD0RSK4k/aKRjZ0ZM
         Ic7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766484614; x=1767089414;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Mre2uzg37555dFycG1pot97jCQNzgXS0YqsC2Jzjfo0=;
        b=lqRJxctys0CKxbC6AKyriDxqwDaU9YPg/m0eIwYS8wiyfqN4e+uV5lWcEbh+SZvzTC
         Y08TSmcUNZeVQW4aUBbEUQ8eK/OpaJ9Wr3XmUbyi0Nom0uCQsN8dCar4zisi6aUCI7cm
         ilhy5SOtripNsjkhU3TqBTFKuacsaaFHX20ORE+phXmeLAfV1+FEaLixouHLhO/a67VA
         zTeHy8/tbHvgiqymEAg+vygnvyvYhe2BwvZCWM1pytI9j9YcLnv1V2Onc9cYNAZsqk6P
         Zl6QQ/xuJFhzNafRl2o5z1PYHlbVc8fVYBHjGGgUKEf+/hNxm/8CCcGoO+/xeFdOnK13
         jzxg==
X-Forwarded-Encrypted: i=1; AJvYcCVktMoNcCgUt3Jv3kpl/y8NRwOe5jr2Y1cAJL0j1bAKOYpBdrh59GW4QRlGCyYyVho3r/PJf+6fu3FXpT7GM8CP@lists.infradead.org
X-Gm-Message-State: AOJu0YwpaIs/ldcPQzLQVrEr2gW2Tczp4JmndYX2wiG3Z8Pxk0vrsk4A
	tjV9aFFMlDWg8baiNY0f1beY+xv7Jt2kXy4cjUXRBmcI0RhJultGjAQ2nD7tA1yw0RT1hcOlxa1
	NO/klJ9TS7qRlsi5MZ34T53i2jK7WCjcQ1irqkFnNB1aLiQnup55ppQ2TujwjL7mcdY7uV4hUrh
	XiGw==
X-Gm-Gg: AY/fxX6IWCy3jZ98uOLnNxIORUHzB7FgBXy/+POmpWokFDW/F2h73gIp0+hy6S/fFq/
	apKTZeRwPsN4HJm7ZnAwEAPB3kapEaAXbTXDsCDpBLzTgw0L3Jz0m0rtgUZpfTsEOA5nuzGal+O
	JUk6DKrJteIwy2qMz+yvK5ErxPOGkgH3QTARNz7hd8eUFAYfJchgSrcDfdrrY+nY11r7RP+7lwl
	K4jtmKx6bXUprMEmFFLE2B+zvU2NL6cznW0w2xU7Sh/5XPPuOf/PMpfE5s8O9ltLuuU6dLLDsJ2
	fqwICLhvsKIv3x8s211vOsjaWIsM2r+wrcxp/mXU7n41omfJ/4xcdmWJahf/ysvxFh7E419Iq+Z
	nxNPvm005AXpGp+9tNad1RentGfrgYnKuvFHUCymaFYQ4gy4iARGvYzai7rL5TUF3QhgPevnl
X-Received: by 2002:a17:902:ecc8:b0:2a0:f0db:690e with SMTP id d9443c01a7336-2a2f293b522mr147494785ad.52.1766484614014;
        Tue, 23 Dec 2025 02:10:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYYsUoc6tu5nFWumewBIqo8JCo5rGqUUYsUz2o9ahFetFX9IM7VWNoLDTnemsjWsSVrMdE8w==
X-Received: by 2002:a17:902:ecc8:b0:2a0:f0db:690e with SMTP id d9443c01a7336-2a2f293b522mr147494405ad.52.1766484613388;
        Tue, 23 Dec 2025 02:10:13 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c6661esm120824625ad.2.2025.12.23.02.10.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Dec 2025 02:10:13 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 23 Dec 2025 18:09:50 +0800
Subject: [PATCH v8 1/4] coresight: tpda: add sysfs nodes for tpda
 cross-trigger configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-add_sysfs_nodes_to_configure_tpda-v8-1-4c95db608b62@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766484606; l=10025;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=5iJlQIoDWyy/yMLiYfQHee+qPvXguqsKK6vOAMkX94A=;
 b=6re83kY+1mVaHS/L/9+jZN9bfOk7+XbLlKFyUMQ1idaEFn0igYuV1EOe+8JDkNXsVUWNUEMSy
 7OiEa4M0elCBSsINdtZtRTX3ca/t+OnyGXzLwKGYiqos2GBmEv8hSfP
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIzMDA4MCBTYWx0ZWRfX0PtLgyKwp9ni
 VVJAv7rZalJa3Z7SpR5r126cAgvjrcUun63e9pbrkZa3YgSj4v1fE4mCA803JJ9Oc9kqmL0cXuM
 JtyLWWo13fTX+eEyRaTn4A72BNdEll+LwStqqQymil3d9aQ9i7QcM7vagHy2ru7c3sYGViNnQ4Y
 FS9VIhpc++y63+JKrruYCZoXxYKosZP3YApddOjT4PFRYdcoSK8e+02opvq0M/jOpln5M3cwCEM
 U/dPud0mFXx0aEUV4FeRiGH1PLZbmp/B94JBzjQ1ThyRYm06pllTjxlGdv/ULtw8s23MzosC2aT
 n2bCQPf2oOMStnprKyjFuKL5N32UW9PE65q7ouXpYiBLmbmjM1f+cmT4qKSfXKJYRKAgNTWCbn9
 KXQFp/QliRW7qCXLWNhrA5o+t//zTOUOo44H/b3t9YXiJb+WrSlaW6PURic6G/szxERus/txVhF
 htaL11f++UDX1ykpwlQ==
X-Authority-Analysis: v=2.4 cv=Zb0Q98VA c=1 sm=1 tr=0 ts=694a6a87 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=yIbM8MDk91bntAnC_RsA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: bl5b-TR76gXZI2BQyjwc5sDyPfsIiNk_
X-Proofpoint-GUID: bl5b-TR76gXZI2BQyjwc5sDyPfsIiNk_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512230080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_021015_640257_183FF4A6 
X-CRM114-Status: GOOD (  23.67  )
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
 .../ABI/testing/sysfs-bus-coresight-devices-tpda   |  35 +++++++
 drivers/hwtracing/coresight/coresight-tpda.c       | 109 ++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tpda.h       |  63 +++++++++++-
 3 files changed, 200 insertions(+), 7 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
new file mode 100644
index 000000000000..735ce0e494da
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
@@ -0,0 +1,35 @@
+What:		/sys/bus/coresight/devices/<tpda-name>/trig_async_enable
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Enable/disable cross trigger synchronization sequence interface.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/trig_flag_ts_enable
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Enable/disable cross trigger FLAG packet request interface.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/trig_freq_enable
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Enable/disable cross trigger FREQ packet request interface.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/freq_ts_enable
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Enable/disable the timestamp for all FREQ packets.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/cmbchan_mode
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Configure the CMB/MCMB channel mode for all enabled ports.
+		Value 0 means raw channel mapping mode. Value 1 means channel pair marking mode.
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 3a3825d27f86..2186223ad33e 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -137,12 +137,32 @@ static int tpda_get_element_size(struct tpda_drvdata *drvdata,
 /* Settings pre enabling port control register */
 static void tpda_enable_pre_port(struct tpda_drvdata *drvdata)
 {
-	u32 val;
+	u32 val = 0;
 
-	val = readl_relaxed(drvdata->base + TPDA_CR);
-	val &= ~TPDA_CR_ATID;
 	val |= FIELD_PREP(TPDA_CR_ATID, drvdata->atid);
+	if (drvdata->trig_async)
+		val |= TPDA_CR_SRIE;
+
+	if (drvdata->trig_flag_ts)
+		val |= TPDA_CR_FLRIE;
+
+	if (drvdata->trig_freq)
+		val |= TPDA_CR_FRIE;
+
+	if (drvdata->freq_ts)
+		val |= TPDA_CR_FREQTS;
+
+	if (drvdata->cmbchan_mode)
+		val |= TPDA_CR_CMBCHANMODE;
+
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
@@ -258,6 +278,87 @@ static const struct coresight_ops tpda_cs_ops = {
 	.link_ops	= &tpda_link_ops,
 };
 
+/* Read cross-trigger register member */
+static ssize_t tpda_trig_sysfs_show(struct device *dev,
+				    struct device_attribute *attr,
+				    char *buf)
+{
+	struct tpda_trig_sysfs_attribute *tpda_attr =
+		container_of(attr, struct tpda_trig_sysfs_attribute, attr);
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+
+	guard(spinlock)(&drvdata->spinlock);
+	switch (tpda_attr->mem) {
+	case FREQTS:
+		return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->freq_ts);
+	case FRIE:
+		return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_freq);
+	case FLRIE:
+		return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_flag_ts);
+	case SRIE:
+		return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->trig_async);
+	case CMBCHANMODE:
+		return sysfs_emit(buf, "%u\n", (unsigned int)drvdata->cmbchan_mode);
+
+	}
+	return -EINVAL;
+}
+
+static ssize_t tpda_trig_sysfs_store(struct device *dev,
+				     struct device_attribute *attr,
+				     const char *buf,
+				     size_t size)
+{
+	struct tpda_trig_sysfs_attribute *tpda_attr =
+		container_of(attr, struct tpda_trig_sysfs_attribute, attr);
+	struct tpda_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	unsigned long val;
+
+	if (kstrtoul(buf, 0, &val))
+		return -EINVAL;
+
+	guard(spinlock)(&drvdata->spinlock);
+	switch (tpda_attr->mem) {
+	case FREQTS:
+		drvdata->freq_ts = !!val;
+		break;
+	case FRIE:
+		drvdata->trig_freq = !!val;
+		break;
+	case FLRIE:
+		drvdata->trig_flag_ts = !!val;
+		break;
+	case SRIE:
+		drvdata->trig_async = !!val;
+		break;
+	case CMBCHANMODE:
+		drvdata->cmbchan_mode = !!val;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return size;
+}
+
+static struct attribute *tpda_attrs[] = {
+	tpda_trig_sysfs_rw(freq_ts_enable, FREQTS),
+	tpda_trig_sysfs_rw(trig_freq_enable, FRIE),
+	tpda_trig_sysfs_rw(trig_flag_ts_enable, FLRIE),
+	tpda_trig_sysfs_rw(trig_async_enable, SRIE),
+	tpda_trig_sysfs_rw(cmbchan_mode, CMBCHANMODE),
+	NULL,
+};
+
+static struct attribute_group tpda_attr_grp = {
+	.attrs	= tpda_attrs,
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
@@ -273,6 +374,7 @@ static int tpda_init_default_data(struct tpda_drvdata *drvdata)
 		return atid;
 
 	drvdata->atid = atid;
+	drvdata->freq_ts = true;
 	return 0;
 }
 
@@ -316,6 +418,7 @@ static int tpda_probe(struct amba_device *adev, const struct amba_id *id)
 	desc.ops = &tpda_cs_ops;
 	desc.pdata = adev->dev.platform_data;
 	desc.dev = &adev->dev;
+	desc.groups = tpda_attr_grps;
 	desc.access = CSDEV_ACCESS_IOMEM(base);
 	drvdata->csdev = coresight_register(&desc);
 	if (IS_ERR(drvdata->csdev))
diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
index c6af3d2da3ef..c93732e04af2 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.h
+++ b/drivers/hwtracing/coresight/coresight-tpda.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023,2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 #ifndef _CORESIGHT_CORESIGHT_TPDA_H
@@ -8,6 +8,25 @@
 
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
+/* Bits 6 ~ 12 is for atid value */
+#define TPDA_CR_ATID		GENMASK(12, 6)
+/*
+ * Channel mode bit of the packetization of CMB/MCB traffic
+ * 0 - raw channel mapping mode
+ * 1 - channel pair marking mode
+ */
+#define TPDA_CR_CMBCHANMODE	BIT(20)
+
 /* Aggregator port enable bit */
 #define TPDA_Pn_CR_ENA		BIT(0)
 /* Aggregator port CMB data set element size bit */
@@ -17,9 +36,6 @@
 
 #define TPDA_MAX_INPORTS	32
 
-/* Bits 6 ~ 12 is for atid value */
-#define TPDA_CR_ATID		GENMASK(12, 6)
-
 /**
  * struct tpda_drvdata - specifics associated to an TPDA component
  * @base:       memory mapped base address for this component.
@@ -29,6 +45,11 @@
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
@@ -38,6 +59,40 @@ struct tpda_drvdata {
 	u8			atid;
 	u32			dsb_esize;
 	u32			cmb_esize;
+	bool			trig_async;
+	bool			trig_flag_ts;
+	bool			trig_freq;
+	bool			freq_ts;
+	bool			cmbchan_mode;
+};
+
+/* Enumerate members of global control register(cr) */
+enum tpda_cr_mem {
+	FREQTS,
+	FRIE,
+	FLRIE,
+	SRIE,
+	CMBCHANMODE
+};
+
+/**
+ * struct tpda_trig_sysfs_attribute - Record the member variables of cross
+ * trigger register that need to be operated by sysfs file
+ * @attr:	The device attribute
+ * @mem:	The member in the control register data structure
+ */
+struct tpda_trig_sysfs_attribute {
+	struct device_attribute attr;
+	enum tpda_cr_mem mem;
 };
 
+#define tpda_trig_sysfs_rw(name, mem)				\
+	(&((struct tpda_trig_sysfs_attribute[]) {		\
+	   {							\
+		__ATTR(name, 0644, tpda_trig_sysfs_show,	\
+		tpda_trig_sysfs_store),				\
+		mem,						\
+	   }							\
+	   })[0].attr.attr)
+
 #endif  /* _CORESIGHT_CORESIGHT_TPDA_H */

-- 
2.34.1


