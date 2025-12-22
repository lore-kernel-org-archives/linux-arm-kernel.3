Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18EC4E6748D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 06:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XdOVcIcuDLUCqeTtx9Xz49VBdyYG7vFvks0bntyge/4=; b=wpGBIh0VO08+hl2dCP9nxvNX1m
	WK3Doku+Sdj1WdYKmV4kk3xwYG888I3AC38Sq0FrOr7w7lDqWufCuXVrOKmJvgsZGnXmF9r278CbK
	wEBNwSfM3kAwq3KnzZc1B3t4c6gaGAJsRn16bJoJKkORjb0QTQzOfi4Ajcv3VxH67taSR5N+/OF4S
	YA7NkgWptxE0RhMOd8WK71eabu7vDq7QDTqEQRWkk9wdQwCwUrEgTXtpkS36K6AMaOzv8V3Z7Y7nA
	KtFX9mPWOAUW3ENSK7re1+XVqhnSwQnldnk/vsZbxhYE+9ZDnLuWLscWoHa7vD4jzrQsbHjALYMeV
	J0wK1Ujw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXZ0f-0000000DEKt-1Rvi;
	Mon, 22 Dec 2025 06:03:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXZ0Y-0000000DEHS-2Tcd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 06:03:03 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM37t94613016
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 06:03:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XdOVcIcuDLUCqeTtx9Xz49VBdyYG7vFvks0bntyge/4=; b=e/hHy1JavDxXfeIe
	dzACv3FDleS/EWWlZsT3pEP73GDcjsZx8lsNnev3vt4KYZVbYdgEYYa9i2nCmClx
	I1+2WkQaHFFoxxkVffvYV9FIxkA2NP18bAZ6dE+MFeKHi2PhfSks89dlUwrsWDU5
	JRUCe18++ANCLpotzFGCAN1s0QddmkQmIyTAtgtIcrL4Yoci4ofmtBVFU2hNwzCP
	yNL3Kg8rpQHMWF1mpSJ4mDgbTCjn50nYG6CAFUj5CPbNCh9A8BCDT1L5VX9ieQlv
	f1Bt5FYfEzXakKqNO5WzyTJ4dYHa4U7vQxsB3/ps1pc+de40UJX3D/vhkL3cGAOx
	HAjE8Q==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5n36kw4u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Dec 2025 06:03:01 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7ae3e3e0d06so3142694b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 21 Dec 2025 22:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766383381; x=1766988181; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XdOVcIcuDLUCqeTtx9Xz49VBdyYG7vFvks0bntyge/4=;
        b=hijEIzLZJ4b+l6VBPdEuyM2qbx0+bQYdhoN8f5JkANY20+CBI78gC2yjv7MT9IUp1l
         DbmusVmEgeBj+cSvjmC8kwNem8ZivAtMBTZvT8YuNV6/nd8rjYMa7WIUFAAqbo3Cskoa
         23ftKVYE9FzftLx4ufDhEnBCFCGXIT8RgO5T5Kw7/SG6b7D1N5rk1ug2cd9JNK/yqXLq
         kfJaTE2LsUfw3GW0+5BmaH3o0gzfLT7S6Y2kjXq0nNpwrUeP6eJxMKCyMfMNHa9fQFbU
         pCpXZcfvHvV2lpZcpU9ijbdLjZmkXMcWoJUQylNBokDzwDcK+XIwzL8KikWMTwHUFPYi
         0xCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766383381; x=1766988181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XdOVcIcuDLUCqeTtx9Xz49VBdyYG7vFvks0bntyge/4=;
        b=LeB7YDHO29/1nkDAP4YNGbvQ7GpPwmrIpfoAl71eFqZq/k+WqE+3abpVaRVXYkTbUs
         gJxZNocsMxso+Cma+HiINXiHXrrrD8wqr6xnnaD0wiKpb2WnZJsPnXGKjUnGLexy9/lC
         C8tPDggoa88AQCZl4zlTk44gtTO+iyuBA/A55E/nD03EBvoM40OAZmG3BlrA4EJvNCYz
         dl+IphDkyMScN7tQUegv7U6TwxnM1EAXpfbi9uPXEkFeI0sBNGCC43NmLOIjZSAkoSeN
         WBCTwiE0snr9vCI/Ggru8RoW6SgOnZwtyv1R3jCfKB8Yzc1XDc52BvMZF3sVrlXItAtc
         zYaw==
X-Forwarded-Encrypted: i=1; AJvYcCWr8bREx1tFlbozIL/USWR5xTDcgNX/qifmLaRv/hotOvlqWdOCkfSOOve50Qp+4nDIz0B72jdGPeNTQ6Rtipk/@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1TxuWiKK8+09StCma3rHOggwF2K5WgkzHPXjH4uRCQSbve6Nk
	6NlDSybmrgpu681vDrwAaP4QPn+nBadF0+LvP91rL9Gk8OEvGFv6ak5YlsMkBT7iI4Mgw9Q+nYc
	Tgi6SOko7nafONIGQ8rzVoXNNUgCV9nBzR1jsSOcSOSYg872q5SPqdQ4cU2KZMi3xP6hviMQODo
	kqeAdEZFlxTsuW
X-Gm-Gg: AY/fxX4Bbi01wrScBVoRigP2Kw0dSpzYItwLGp+w5iwoK2CWic7mRLTjlI1nSehgKty
	qh7+qWU6Rk4IhHWYZyrt7XDM9X50xaSjeLT4lh/sl+xpF6+yNQqHNluNUtyBn9ddADRq7b2WBvp
	+zikeNid03rwVZBpLvvbjXZwfPxuyBd26DzuFVl3e4ADuYh49A9KPTZ5ptB7ZYAnBYBG1nJM427
	yaGAR/++0dJchB07f3OZPqDYBc1txLxVfd/R9xAqzcn/C//CJhg/bn7jSMhQ1qIwBy+0wt5bjQG
	dG3dsbL0kwxDDX9XZME72Bb+0mhrRsKrAoABfYjv6x+gTWvKzq/viiW0rvqidD/HgPbUnvhIMkU
	rtC3rxnZX1FKA6QGDlHRJsnc4Ucbl5WNON+iKB3WdYuBHlXNKM56wbxKArNrSWNL0DKItp5MP
X-Received: by 2002:a05:6a00:bc90:b0:7e8:4471:8c1 with SMTP id d2e1a72fcca58-7ff6627b86fmr9129755b3a.34.1766383380826;
        Sun, 21 Dec 2025 22:03:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHM132Nl1vG8j/fibSJa40euGUkY2t2TEvRsDEjQDLLr622K65kx7ju3v/5RcdiaBf9HAKrjA==
X-Received: by 2002:a05:6a00:bc90:b0:7e8:4471:8c1 with SMTP id d2e1a72fcca58-7ff6627b86fmr9129743b3a.34.1766383380278;
        Sun, 21 Dec 2025 22:03:00 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7e892926sm9070130b3a.66.2025.12.21.22.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 22:02:59 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 14:02:22 +0800
Subject: [PATCH v6 2/4] coresight: tpda: add global_flush_req sysfs node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-add_sysfs_nodes_to_configure_tpda-v6-2-b27143d45c86@oss.qualcomm.com>
References: <20251222-add_sysfs_nodes_to_configure_tpda-v6-0-b27143d45c86@oss.qualcomm.com>
In-Reply-To: <20251222-add_sysfs_nodes_to_configure_tpda-v6-0-b27143d45c86@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766383369; l=3748;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=BRgMyJQu9Kzy/G9nmhSYpMl8s8NAvtzMpAI0JLWtcFU=;
 b=EXZFc3Z4bi2JO/27/BDFQxBKcwM7rzcHZLhfFpLFeKpBBph7KsHSYdhr9oG8c9hwKEQ7lfMeF
 2cRjsqcJEPKDaz52PFqehtYE88ngEwrhi28td0TGxAVCbZk4SKQnNTm
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA1MiBTYWx0ZWRfX3HJuv9geVCz+
 aiDJGjsS/jE03xOklbP+OYpIj1+njvLxFOOZPWPXiye8nlS/K/4mqySovFLrSVRO8z5OX0ztJyV
 UBr4ucbYT58ZE1k1hj8355wWbRVQXZRpLStXL115JWR38Vz//w/QbByfhnr2MORtCZLP3fOodK7
 URuGzOOj7KvLwtFObXkXoPDFXcqu7uDZgAw9bgivEoGlGV3q3YScRwaGBot+TMMXncdl4imN5yI
 OP+N6Fs1+1IX0QHs0eXv2WgUIrOLmmHc3ufCwHKm4tuNuRN2dp7p5thtSCgG1HAG4DzO3cgQc+k
 P7YCI8Jm2qPPQZin8KWB4g8l7RFTUR1LJhCTJ3RPz3tloNjz44MZJZFhcEHYXmuggopeZcClvUw
 l/80IRUc+kDn7TFEMGNKBXpQGSv/pb7BAZhl7fqKcdBhDzfHChk+u65LlYizqOUUCOOxmwt6g49
 O+J7ouvpDBZiDMZUwEA==
X-Proofpoint-GUID: NKyVUsO-kpi1QUnizFOcJXjQD1EqRm9w
X-Proofpoint-ORIG-GUID: NKyVUsO-kpi1QUnizFOcJXjQD1EqRm9w
X-Authority-Analysis: v=2.4 cv=VJ/QXtPX c=1 sm=1 tr=0 ts=6948df15 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-PhlUL0ANfhXhD-FZUEA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220052
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_220302_644960_C6079526 
X-CRM114-Status: GOOD (  16.14  )
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

Setting the global_flush_req register to 1 initiates a flush request for
all enabled TPDA input ports. The register remains set until the flush
operation is complete.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../ABI/testing/sysfs-bus-coresight-devices-tpda   |  8 ++++
 drivers/hwtracing/coresight/coresight-tpda.c       | 45 ++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.h       |  2 +
 3 files changed, 55 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
index 735ce0e494da..c8bc7b19ab25 100644
--- a/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
+++ b/Documentation/ABI/testing/sysfs-bus-coresight-devices-tpda
@@ -33,3 +33,11 @@ Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qu
 Description:
 		(RW) Configure the CMB/MCMB channel mode for all enabled ports.
 		Value 0 means raw channel mapping mode. Value 1 means channel pair marking mode.
+
+What:		/sys/bus/coresight/devices/<tpda-name>/global_flush_req
+Date:		December 2025
+KernelVersion:	6.19
+Contact:	Jinlong Mao <jinlong.mao@oss.qualcomm.com>, Tao Zhang <tao.zhang@oss.qualcomm.com>, Jie Gan <jie.gan@oss.qualcomm.com>
+Description:
+		(RW) Set global (all ports) flush request bit. The bit remains set until a
+		global flush request sequence completes.
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 2186223ad33e..d24a9098f1b1 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -341,7 +341,52 @@ static ssize_t tpda_trig_sysfs_store(struct device *dev,
 	return size;
 }
 
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
+	val = readl_relaxed(drvdata->base + TPDA_CR);
+	/* read global_flush_req bit */
+	val &= TPDA_CR_FLREQ;
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
+	val = readl_relaxed(drvdata->base + TPDA_CR);
+	/* set global_flush_req bit */
+	val |= TPDA_CR_FLREQ;
+	CS_UNLOCK(drvdata->base);
+	writel_relaxed(val, drvdata->base + TPDA_CR);
+	CS_LOCK(drvdata->base);
+
+	return size;
+}
+static DEVICE_ATTR_RW(global_flush_req);
+
 static struct attribute *tpda_attrs[] = {
+	&dev_attr_global_flush_req.attr,
 	tpda_trig_sysfs_rw(freq_ts_enable, FREQTS),
 	tpda_trig_sysfs_rw(trig_freq_enable, FRIE),
 	tpda_trig_sysfs_rw(trig_flag_ts_enable, FLRIE),
diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
index c93732e04af2..1cc9253293ec 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.h
+++ b/drivers/hwtracing/coresight/coresight-tpda.h
@@ -10,6 +10,8 @@
 #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
 #define TPDA_FPID_CR		(0x084)
 
+/* Cross trigger global (all ports) flush request bit */
+#define TPDA_CR_FLREQ		BIT(0)
 /* Cross trigger FREQ packets timestamp bit */
 #define TPDA_CR_FREQTS		BIT(2)
 /* Cross trigger FREQ packet request bit */

-- 
2.34.1


