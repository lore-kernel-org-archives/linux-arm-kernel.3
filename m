Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B7DCCD19F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 03:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q2KZUH63v1Z8gu1t2jNlUjejQ4cQ+t1iEooXe+pEjmg=; b=1qySlSzfqvsj3iIi98DanUr7f5
	FXJpCMJwbyX/RSkI89RXVoM0cworEnGuBTwFIRx8XIa6mefBU0+9Up6/rirwx2tLJV5HBKChuYmFa
	UZXNZkdElzNQTRzhMmycnvWMDHDLl7CMCpnpA+/I+IniWJll9C3DYiCfUh1I4PbvwGlBsB9ju5AIj
	3ZY4OgjHjUiJDTUufZlhum9Ed9oEYr7/DfBV8AIHPil3cjqr1hST4ehnHa+tmBkjKjx0R5wnNbzGr
	JCOwN5i3cafn0Q1KvFwEWxLFueaObf5IWTPJ0rPzmzne5ceB751d5T6cCitbG6gedUA7AMTtqvZnm
	wAWEH17g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB2bM-0000000FeJe-3rAy;
	Tue, 21 Oct 2025 02:59:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB2bA-0000000Fe6j-0aA1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 02:59:48 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KL0pZK026868
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 02:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Q2KZUH63v1Z
	8gu1t2jNlUjejQ4cQ+t1iEooXe+pEjmg=; b=b7vRCAm6vc+JZHzuyHA37icbPxN
	octSjv9TS4jn/91ehA8YQPIkZ4Udi8jFapcPHWcJpY6mzsocg4r+PXRBqBAP2abf
	gTv5JFUg8Olv4kGt/JdhQaIzd0ap0PY9arR5FmUUHJ98blhvlUsCkLRoUH82S6i+
	3oB9nIsKFQIAyIqxux2MhiJmO5ylneRRQBWZ7cTzjx/d0IOUw6T0pQ2ft+xg0HVb
	0NDV1zw8Dqrzr9MAtmIiFqSfrktpCatxDtAgFnQmgYYy/Zj6ZvD1/O9d/945OJ8n
	ztNmoDiKQCrKZsXJaJeSp0Klad9SLqs8xiUsKR/CfOb8Re6TztHYHwtGhzg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v08pf4j5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 02:59:43 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b55283ff3fcso3262274a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Oct 2025 19:59:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761015582; x=1761620382;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q2KZUH63v1Z8gu1t2jNlUjejQ4cQ+t1iEooXe+pEjmg=;
        b=jbLbjOMP5SPdDD+xC9cG/G/CmfOctHRv6Dw1fe0XFB10GNBUzcoONnXt5LFPC7Aefc
         GE3Tu+vxUX/L5S75bhMcAfm3msmN+n/1CqFcZsp3GrgeAWISjaTfdcF/95xohCGG1CG9
         6/XpNg4y9OsZmNEyzmlCkNQpeyqqETwRfRH8FRdK6tleIE65lvDLnyh+Bhyu24qPZYBa
         jRnuICylcQXx4xm9otbpXWvAZAH86odsEpvRhjy6UsrPpmF7J/BHhx7VMs/FOOq+wiYY
         L+Fx4AWVfXIo0R2w5TTpotiNzuZfp91DBzG4cC2cQg8Hi3K1o3asiqEOmVFeKsovtjuE
         fdaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzciscgypy4TymBtBG7AyxhjBHboS42wJFlJMP7MHgRQSnGf8/N99JqP9rM3a3jIjoAZoW/Qvq5qZx61q0iWMk@lists.infradead.org
X-Gm-Message-State: AOJu0YzRb9VZaOc6uROJvDcfPo9n+MYZdMWiG18rIzhmSaueBpynvZpO
	iawIhJzP0UDh9tGuazjOmO+lRw7l0ULpmoZVj1q3h2fBfA/FNGBNUDpb4txyybIrUFscfOeDJtm
	XdmDrpq91P6OquOLyglPAktMdaS3E5zKB0IVYO51IFyzPgbfB7cvgFmKhqQpWaaoWbB8DbXrrB+
	tU2Q==
X-Gm-Gg: ASbGnct3tfu0byeCbzChc68LyNGPNIz4u2JWffJgwU55PKxWhnTHlmd+P9FRbQG846L
	2AyUbaht0E/swHHFxrI3QnTKlbUgG93GccCtfzSz+Sh0wVaro4QlcAF1KzlJiS2YDIhtwlJaktj
	5DqWNapa6yhG/DlBTRN4iXVc/m0oqLs+ZoyKKmKi1BPqwB8JmjdVZ9+0bGrB1hOyLF/cd/baUen
	P5WkV5IZ946vWaCpCVWkjvQ+Vhq+t87eImPhKMp/ux3aqBPUdV8PTB8o7J3jo7PfmRr9VGpLRHp
	joNH64HyUKrlDoY/idtmcz4o1SkKSpTmzKqujc5aoBf/n2AJ9HuDA+jY2OfbbUPFffOmZu54vye
	CPfNXErLmvc9A+3rnoEDQdEX7jYutiEwZIDh93bEaImyHCQYXQY/FUw==
X-Received: by 2002:a05:6300:497:20b0:334:b29e:f446 with SMTP id adf61e73a8af0-334b29ef982mr12607076637.0.1761015581825;
        Mon, 20 Oct 2025 19:59:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0jcVn0s+dyUWucjh1b0Aarnd0rcpt32mcd9fvHDrPCKI2EP2xhQcn0BCYnp6dEz622/jaig==
X-Received: by 2002:a05:6300:497:20b0:334:b29e:f446 with SMTP id adf61e73a8af0-334b29ef982mr12607054637.0.1761015581397;
        Mon, 20 Oct 2025 19:59:41 -0700 (PDT)
Received: from hu-songchai-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76673a86sm8855787a12.10.2025.10.20.19.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 19:59:41 -0700 (PDT)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: andersson@kernel.org, alexander.shishkin@linux.intel.com,
        kernel@oss.qualcomm.com, mike.leach@linaro.org, suzuki.poulose@arm.com
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org
Subject: [RESEND RFC PATCH 7/7] qcom-tgu: Add reset node to initialize
Date: Mon, 20 Oct 2025 19:59:09 -0700
Message-Id: <20251021025909.3627254-8-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251021025909.3627254-1-songwei.chai@oss.qualcomm.com>
References: <20251021025909.3627254-1-songwei.chai@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAwMCBTYWx0ZWRfX5i/iRICeYWx3
 PRJo+zbWk6QRkiHhi5StEx+d5j+FeRhNESMMDHmzPOoqQ5FUIfCE3MlxUGzFdKv7wBcyXLayJB/
 445mIyV/eWsprEtr0uyC69qKHjsTl/MtVvgQnY4jGVi1W/j8H8emd94j+HJSaov2HGCF3PXf15z
 vvZnM4Q4jzne5pqNraY+abvJxf7CIB9zpblUq9u0BGxNLhmNAIzovONC+E373uRunnEZj/1CcQU
 x1B/jwEoBJ+VEouqIaPqBAms1LBZaSznpGbifJOB/FL859s1rYgtP8FHF5mx0/OPsd894pCnzF8
 R8yAL1Sex8giVWznPyrJBp9gKn1TRZ4ZmXfDZWH6I5Ztmb1csOGGbFQXRiWKc4UIRuJwTPk1m0/
 9bNrAyyIc4oL7wOwwUDGFa3NRjU5ow==
X-Proofpoint-GUID: T9GskqA8kE69zGhHrJwFwhKkFcQr3GDC
X-Authority-Analysis: v=2.4 cv=Up1u9uwB c=1 sm=1 tr=0 ts=68f6f71f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=IgPCHI2mAnvcCQI4J_AA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: T9GskqA8kE69zGhHrJwFwhKkFcQr3GDC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1011
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_195944_439980_EEB51DE9 
X-CRM114-Status: GOOD (  18.96  )
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

Add reset node to initialize the value of
priority/condition_decode/condition_select/timer/counter nodes.

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 .../testing/sysfs-bus-coresight-devices-tgu   |  7 ++
 drivers/hwtracing/qcom/tgu.c                  | 75 +++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
index a57bf9783641..c9e12b298b23 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tgu
@@ -42,3 +42,10 @@ KernelVersion	6.18
 Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
 Description:
 		(RW) Set/Get the counter value with specific step for TGU.
+
+What:		/sys/bus/coresight/devices/<tgu-name>/reset_tgu
+Date:		October 2025
+KernelVersion	6.18
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Songwei Chai <songwei.chai@oss.qualcomm.com>
+Description:
+		(Write) Write 1 to reset the dataset for TGU.
diff --git a/drivers/hwtracing/qcom/tgu.c b/drivers/hwtracing/qcom/tgu.c
index c4ae1f27d9ff..9bef9d8b4690 100644
--- a/drivers/hwtracing/qcom/tgu.c
+++ b/drivers/hwtracing/qcom/tgu.c
@@ -434,6 +434,80 @@ static ssize_t enable_tgu_store(struct device *dev,
 }
 static DEVICE_ATTR_RW(enable_tgu);
 
+/* reset_tgu_store - Reset Trace and Gating Unit (TGU) configuration. */
+static ssize_t reset_tgu_store(struct device *dev,
+			       struct device_attribute *attr, const char *buf,
+			       size_t size)
+{
+	unsigned long value;
+	struct tgu_drvdata *drvdata = dev_get_drvdata(dev->parent);
+	int i, j, ret;
+
+	if (kstrtoul(buf, 0, &value) || value == 0)
+		return -EINVAL;
+
+	if (!drvdata->enable) {
+		ret = pm_runtime_get_sync(drvdata->dev);
+		if (ret < 0) {
+			pm_runtime_put(drvdata->dev);
+			return ret;
+		}
+	}
+
+	spin_lock(&drvdata->spinlock);
+	CS_UNLOCK(drvdata->base);
+
+	writel(0, drvdata->base + TGU_CONTROL);
+
+	if (drvdata->value_table->priority)
+		memset(drvdata->value_table->priority, 0,
+			    MAX_PRIORITY * drvdata->max_step *
+				drvdata->max_reg * sizeof(unsigned int));
+
+	if (drvdata->value_table->condition_decode)
+		memset(drvdata->value_table->condition_decode, 0,
+			    drvdata->max_condition_decode * drvdata->max_step *
+				sizeof(unsigned int));
+
+		/* Initialize all condition registers to NOT(value=0x1000000) */
+	for (i = 0; i < drvdata->max_step; i++) {
+		for (j = 0; j < drvdata->max_condition_decode; j++) {
+			drvdata->value_table
+			->condition_decode[calculate_array_location(
+			drvdata, i, TGU_CONDITION_DECODE, j)] =
+			0x1000000;
+		}
+	}
+
+	if (drvdata->value_table->condition_select)
+		memset(drvdata->value_table->condition_select, 0,
+				drvdata->max_condition_select * drvdata->max_step *
+				sizeof(unsigned int));
+
+	if (drvdata->value_table->timer)
+		memset(drvdata->value_table->timer, 0,
+			    (drvdata->max_step) *
+				(drvdata->max_timer) *
+				sizeof(unsigned int));
+
+	if (drvdata->value_table->counter)
+		memset(drvdata->value_table->counter, 0,
+			    (drvdata->max_step) *
+				(drvdata->max_counter) *
+				sizeof(unsigned int));
+
+	dev_dbg(dev, "Coresight-TGU reset complete\n");
+
+	CS_LOCK(drvdata->base);
+
+	drvdata->enable = false;
+	spin_unlock(&drvdata->spinlock);
+	pm_runtime_put(drvdata->dev);
+
+	return size;
+}
+static DEVICE_ATTR_WO(reset_tgu);
+
 static const struct coresight_ops_helper tgu_helper_ops = {
 	.enable = tgu_enable,
 	.disable = tgu_disable,
@@ -445,6 +519,7 @@ static const struct coresight_ops tgu_ops = {
 
 static struct attribute *tgu_common_attrs[] = {
 	&dev_attr_enable_tgu.attr,
+	&dev_attr_reset_tgu.attr,
 	NULL,
 };
 


