Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF0DBD711D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 06:03:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8xxkcmDzu5hNC+bNsNeDVmosOSvJVWOHZ9pkhH+Ry/g=; b=BiKiAbS+cBhqnEWzz0k271Nvmb
	EIiJG5TQd8NX7pH/xGW8ergNKBLVR40XLnVGB6B6lXlnTtSpw5l9lrAufuWnjvptvwokC9yi9gB1q
	cGbF0zfzKM2mF6ih1BSBEHB9O5tZ/0DVs8Ud191t8kct2YUsuVbvbz/iRYjaz0zFbjkNotoOgqiH6
	m0fbQ9cKMm1JsYOq6pW22x56S3mpp1JcLuePtz5Eo4aqoNrq4x+bD4U/WegroMoHfhTPQg8nIb95U
	S9nUJhsZ/UmQjBpWpLgV7r2UvBe5PpLMN3L2OoNf02Y46EWIUKQ5Hh+1QndimtigSbB2PUYDiVU3m
	lYscywGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXZ0v-0000000DEVx-24Sz;
	Mon, 22 Dec 2025 06:03:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXZ0t-0000000DETg-2DTb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 06:03:24 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BLLF4hj3917609
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 06:03:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8xxkcmDzu5hNC+bNsNeDVmosOSvJVWOHZ9pkhH+Ry/g=; b=lnd8E+mwn3ZYUEX1
	9WrobIvVMxOHtYz+TTqezKje+zg9CrrOkl9OBxMqFEq1iEKu/tshO6aJGDMwxnLz
	TRfOSLeIuPQY1mc+ybUmAFZ1eYbIEZ/OHRtStX/jkaq2kWxzeZey8gQvkVM5hgTQ
	Fr8OwdDovRiNq9kA6IlwrmeLsmIRMcNOE68PA1qNe54AE/QxMFHeIO2zR7aMCiua
	hPSFW1QR8iHdTjHJXBEZyYZ5TDVSw3FUZpXBmMAsSfiQehmuxfBxyhryoRhtIOj+
	LcXlmQPtFjIjIYr8YE6M+qxNTNE+YXCGABoCXip695WxGaCcR2KlpwahBfuUSlGZ
	Iclwag==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mux3uj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 06:03:22 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b9c91b814cso5682947b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 22:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766383388; x=1766988188; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xxkcmDzu5hNC+bNsNeDVmosOSvJVWOHZ9pkhH+Ry/g=;
        b=U0i6LDWc7cZVhoAqb20U97MeA1TKOqmIjHfnkFjNtjAIVSbsvGl5564kS2byWxu0a/
         +UT221JCorWzSbYl42zYVspDJTY67AzUBi5/YMdNvhnhw17UqBl8/g1pZt0Be6dB3l41
         eE2kX6zwdUnNYoZDpNFgh/UEqCKurngw91Xta6ZrTJ2IBGoZUB3Y+vDwLh8usP5704LG
         +c9zA6O5SlTI6iq/IEWhrJvss2K6Sa28DHLZmfhDJ6bv0RPQCSkXd+TWM35GDOSxH9Kd
         bUJ1qPyXYQBnRGApelexfoVR4JAllbfJBY0GMtNjx4gARBamOGNU6ThrC9vYs1UaETGO
         E3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766383388; x=1766988188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8xxkcmDzu5hNC+bNsNeDVmosOSvJVWOHZ9pkhH+Ry/g=;
        b=FZx0iXW4ua4/J66WmBHT22vRL1+eOezPE87WejZq02HUtfzffqM81pzn2IaM0SZBd5
         6qOXO2Y4pFuJGcQqEOh7X45iY8BjYfYCVR9e4HZgtGxHnP/k94MzQeLy0vkq6s9GlMZh
         DJ/qUzjUOngHQpZo7g4QXMQqZO2Y8uSR1/YzlOGOQcCzHggtD9AdaxGFryqG7GAqLDsl
         psi2d51nORXYETDyc1z3GZ2CJYpG8ctFF7VFyOwk0nvTW74mEWtd89HnedrGDUR/8vWb
         tp6t23S/iQ4Yu0rq7d9c59x7zpv1JylhxjHjYcPDha6HQoB/Q2yao7MnmqGzhuAhDc3C
         26qw==
X-Forwarded-Encrypted: i=1; AJvYcCVdleIiJGU+ECvDcYkOm/n64HuKZ27epRjB6PUpBxeesf61sJWnYFuDqok8zNPXk7UKX1AQsOZtpZionvluTU+D@lists.infradead.org
X-Gm-Message-State: AOJu0YxsEPxxjTkgBm/g9921sxLC4+ArX8zXx+cc9jeQl27bRz/AnTqT
	gZICWSIgVQBKTIElrLBNbLvG03bCfmIDK0hWNcMGox1BlnZgcTUU7ZgapkyEWC3Fo6lzk+cZ922
	isOjmN6PIaNak593GENMIHw08teFdUz3zGoD/RO45HeMGxBT4eUfZUTmvLEMuPF5XS7gDdEbRzX
	Z8sQ==
X-Gm-Gg: AY/fxX6WKp8438fXOGDAKPPzUrw33yJPJZeAD43MSoHxmCqe7XjUE2SSctG76DL01G/
	Oc/nSZS9dFDAPbXMaGMUM1umgIjUEyuDia8Mu13MAflTYXOHxsb3iMKwe+XNFSQsM9dJ7SD9G1t
	ADC6Vd6SViiTHyFiBIYFtVNeJhkGEXdgg77zD5osnfX4bxwxYhbHBA/fj6indpf8FpXRt02vF4j
	/hgtmrff0McZ/umcf387rbT2RPNvqF94G687oQ73A+y9zYQvuIl5gsYxUdHP7mBEAvtWJsWtt6s
	mqdauBXqTiltDlI6Hm6l6wl/w0Z5Cm1FFJwpV8/2grq9YQ2gA1bkvBFVEDsuijkMALfym3biUER
	qZz05TGrPA0gP1UG2QzpuSUsJBfjFN5SdwZlhceVJJHlGnA39Ovwk6jNEHDabvvfwc/ranFOW
X-Received: by 2002:a05:6a00:420f:b0:7ac:1444:6777 with SMTP id d2e1a72fcca58-7ff646f9380mr9193342b3a.12.1766383387714;
        Sun, 21 Dec 2025 22:03:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGelIbl8UPQw5CQS7wicZ3KHbIyIwAWm9ywp2f3HNYxGAhfjpZFry+SLWCOvwZjNo6zXhnt0g==
X-Received: by 2002:a05:6a00:420f:b0:7ac:1444:6777 with SMTP id d2e1a72fcca58-7ff646f9380mr9193324b3a.12.1766383387236;
        Sun, 21 Dec 2025 22:03:07 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e892926sm9070130b3a.66.2025.12.21.22.03.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 22:03:06 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 14:02:24 +0800
Subject: [PATCH v6 4/4] coresight: tpda: add sysfs node to flush specific
 port
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-add_sysfs_nodes_to_configure_tpda-v6-4-b27143d45c86@oss.qualcomm.com>
References: <20251222-add_sysfs_nodes_to_configure_tpda-v6-0-b27143d45c86@oss.qualcomm.com>
In-Reply-To: <20251222-add_sysfs_nodes_to_configure_tpda-v6-0-b27143d45c86@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Tao Zhang <tao.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766383370; l=3743;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=YhrWWZcvphBxdWQngeTl1wZUK9CcQMLSULdlcXKLSig=;
 b=z+7ls+Ln1AZ8pgGq238ifoMXP/lvdihUzoNmklNPO93d8QMf67oRGQxs3bUS4uonJ/700+ula
 prTaWG3mgWLDGME3NlEWanU59KBrzbtPEWfhJW9ps3gMfEmJEVnSTZt
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: zDCbwrysy3dKbGvqLVDtpXrZF5AAKF9O
X-Authority-Analysis: v=2.4 cv=EvnfbCcA c=1 sm=1 tr=0 ts=6948df2a cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=Uaz1Er67hVaxBR8z2rIA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: zDCbwrysy3dKbGvqLVDtpXrZF5AAKF9O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA1MiBTYWx0ZWRfX1HaNi3aBrcJv
 a+/yenv+O7s+ELcW9Rbwr5uPNbZST/VMXRLpLD3cW6HQ4rr3pGX78FJ0q4IYOgMq4VrakwlboB7
 zbGJuNYpzAP+B5WTZVkeBiElGCGM/M3t/LA6CGMxnrnxF4NCjU50EU48l+D7CabmYSRTyFXinC0
 unPQtbdKjpObEsQcAS3ahdzN9Yui8KPzkOxp7WBX9rrwaSYORmu57LygdQudihvUIvZCXE/tl/k
 76Mg3NrogXnhb1UCfVEl6NvFdwiTPDkgyGSH2nQoZtwZ9pY4cyahMLrD81qyC/emvqvDt6nvO24
 o50hFl4oiLq3XLUV1In6ot2Euc5cnB+scXebUpQyHnBY1zFN1749u5f8z8NqmDwbtGEi0XdfzUG
 wrBDIUyI6DA2Q3f5RoabP0nY0io8nGUG9os8CFbeSWN+1tSHrg2O69wmoi/Z4aEnoHSDdB8V9j/
 0LUcGJ1GLiX3G/3izCw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_220323_700416_EA0AD145 
X-CRM114-Status: GOOD (  17.99  )
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
 drivers/hwtracing/coresight/coresight-tpda.c       | 40 ++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.h       |  1 +
 3 files changed, 48 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
index d359d90dca72..df8f03d4b573 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
@@ -51,3 +51,10 @@ Description:
 		mode 0 - COUNT[11:0] value represents the approximate number of bytes moved between two ASYNC packet requests
 		mode 1 - the bits COUNT[11:7] are used as a power of 2. for example, we could insert an async packet every 8K
 		         data by writing a value 13 to the COUNT[11:7] field.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/port_flush_req
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Configure the bit i to requests a flush operation of port i on the TPDA.
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 7baa8a0965d3..f79fea4fbb2c 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -430,9 +430,49 @@ static ssize_t syncr_mode_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(syncr_mode);
 
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
 static struct attribute *tpda_attrs[] = {
 	&dev_attr_global_flush_req.attr,
 	&dev_attr_syncr_mode.attr,
+	&dev_attr_port_flush_req.attr,
 	tpda_trig_sysfs_rw(freq_ts_enable, FREQTS),
 	tpda_trig_sysfs_rw(trig_freq_enable, FRIE),
 	tpda_trig_sysfs_rw(trig_flag_ts_enable, FLRIE),
diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
index 1d2de50bb9f9..ef1ce2ce36a9 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.h
+++ b/drivers/hwtracing/coresight/coresight-tpda.h
@@ -10,6 +10,7 @@
 #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
 #define TPDA_FPID_CR		(0x084)
 #define TPDA_SYNCR		(0x08C)
+#define TPDA_FLUSH_CR		(0x090)
 
 /* Cross trigger global (all ports) flush request bit */
 #define TPDA_CR_FLREQ		BIT(0)

-- 
2.34.1


