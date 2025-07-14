Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03FF6C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 07:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/fz+LGoddWmiY1/jAhIAcksrU+G3xmeGky/QljdjsCo=; b=s4mKXh7KxXNqG2jJtc7KVreAqr
	9mF0BqDHZDmQmg/GmTl/z+ijdqxwseFgeg6xSWO247VOHAm9jLny/9fI4zSQFzSSZwnd0aKiRbczY
	ZtCOQ5qUowTaFgPjcBLm0ajhQX7J4rJl4TNgD5LRAzTidqazSmSzv2v2uPjqSK8DEh1RK7IDIUL+f
	4BkNnSztuuaoho9K02zzWx3C6G+UxUt752p0bd6pd/5eNSQ25QFv1gyV2ziJiRxYDyUH4zdX82N47
	OaezVN41CJqELhaJhCSA6asumRwsD41LnxDAN/G6fdXmArkUaMZB1DfDbmpXd1jf8p8AZBn/xpjM3
	hqTo640A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubDLM-00000001R6Z-30kY;
	Mon, 14 Jul 2025 07:11:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCjN-00000001MON-0gds
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 06:32:06 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DNphu8004347
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 06:32:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/fz+LGoddWm
	iY1/jAhIAcksrU+G3xmeGky/QljdjsCo=; b=F3AZEB+Xa9w97TbTTc4fAGYqe/j
	SkzXlJLOV6BuDzAs8whaFtIaoJ79hijzSFWI/8HZIU1tmbjjKvuw8Eo04ispnMzf
	XLeLtz/PbCEbpSMmqk5VN3pqd9LlGBPEeO0SbasJaGzhiOfy8NfGgPehOhEpfGOr
	gTSzaCuxIy78dnzW52X1Ukri+7x7oq2zGSD6CZIt1tzzwj/TEp86HzxlJjtLS3kA
	5/fRy7fjXRWiSizc4AnaKaILIXWyBK/umcGO0yixTL4VleTupJziZwEWyhXuT6gc
	NWYG/gJmLQvngf+wg+9AYf3akQrcgrJOxbI34+FKrL3pryVjPKdTUT84kzA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufxauh80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 06:32:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-235f77f86f6so37967825ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 23:32:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752474723; x=1753079523;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/fz+LGoddWmiY1/jAhIAcksrU+G3xmeGky/QljdjsCo=;
        b=YesCENKUrpuLaRhRAibx2USGWj5P+0czDFHQZiox9btwwTH/Pao9nl8W+cu/EnmU1E
         665eQffswF54dJtuggW9dvANdLbLbFWTY8WHJCQL5IciCEGUtFpnSuV6MkZ4jbILb45A
         EMGfMcQMQCs0xwqsKq3wBJAkEuXu1FexOLj1qeXXluEY9lSeNSxDQAB0PSMxOlh+rlZe
         RYYgdHSU46PK1aHXh7ozuzdcH3pnV/jqY8/T8dtSrvSglbkvg+dZB77rb0I/DzJwCnQv
         K3+6XUfFeMG59nyq09bENYz9SoytNWmNx5oeqjGXoe81VkhjglxRZRgx7kXXsxRSxuLA
         aJ7Q==
X-Forwarded-Encrypted: i=1; AJvYcCViS+eCFaNBnAyfUaCAJAcI8yKAsv/6knxJM0gIetdZ8CMKZceRTA2aDLcv5d7YsnbjZfu5I5lyK4UIR9tPfjJ5@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9BZeLkEJbeHbIIIF40OXPxgudNlZ/TdLHEIBmUazesn1cyA7a
	rC9u+x7+1Cgry0QCAzRJK3YJFmeDpoJl+GP8CASRsuHBMvq193qm5i+2bfq16gjVsbUkq7qq6xb
	KLJaIbvZ+XbDRRf//9mPtJ7IPqWTJiEyPZhWLn+YKh7ZK+jIHHfA0jLjOgE7PEdOnQUNPga8hCA
	C4Pg==
X-Gm-Gg: ASbGnctfgaR7CCeeVpBS7Q7CgqEYjXflDJ/4IRxt73EpmikaguxwMY2kiJ1SL6I5FFL
	TIrM1XNBslCzM5UdnubesSDZTnZRyecwnDxygnl2GukH2vCxnXtNEnyqYV4ENhZXgMF7Bb+co0R
	+H9SWt56Bulnr6ZHZRTOLfzXJ8jRYYglec9JDPBU9ibqaaSGILLit3uvDXGKk9JP+Flcm2K3RIE
	Q4I9EG/qRRRIH99cF1Kg+D4aacrQxojkvB7pmndGOG47S5dpyZknYKee9tL+YOjiYNKrO34gyBK
	xFX4g8bV1PKieLCTL1L0fu5X0Hpain9obrh1JGe95IRcssq+35fU73fWjEAX4FLN6hSpIb4jG/A
	LKLatI9s72Fw+JNsjWx6w
X-Received: by 2002:a17:902:f691:b0:235:880:cf70 with SMTP id d9443c01a7336-23dee1e8c82mr157439885ad.14.1752474722705;
        Sun, 13 Jul 2025 23:32:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbEosWbcJHr08zZ1EkpTq27v410DV5/hiU//rvj4mE1PTiP9bG8uglFbxS8uo2dt3oI8k2ug==
X-Received: by 2002:a17:902:f691:b0:235:880:cf70 with SMTP id d9443c01a7336-23dee1e8c82mr157439485ad.14.1752474722239;
        Sun, 13 Jul 2025 23:32:02 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4334005sm86138255ad.158.2025.07.13.23.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 23:32:01 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Jie Gan <quic_jiegan@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 RESEND 09/10] coresight: tmc: add read function for byte-cntr
Date: Mon, 14 Jul 2025 14:31:08 +0800
Message-Id: <20250714063109.591-10-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
References: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: LLFtB7BBKuPlUbOuiqNTa2IAhExELL4g
X-Proofpoint-ORIG-GUID: LLFtB7BBKuPlUbOuiqNTa2IAhExELL4g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAzNyBTYWx0ZWRfX1nIalHegiu+M
 yLK4SaKWQijw8kJGHUJ24wNa5/9p7E/k68vjGLGhR+bpmKC+Zmmjcl1gveo6UWSDfhAeWiMRf0P
 jJEf/3byrlExIxhZnMpZdgFc5FmeJRZ/IU3DQxwYEoMpziUh3v/xC6uJgpnAwcqoi0mLgYVnAf2
 3W4QaQSZfjMnvmA3S4jipoxUZ7zo1x6a8jJnBXj5WZzWtWv0Yj6C5Hzpo9xiQhS56qax6xAevd1
 jCNaB7dP/PyTMGf6e4jKA/aEmcn9kOIIelS3wnUA84/nl3ssknLbVZSB0sTr+klDSgcvPmMu0lk
 uDWy0YEg5r+G8gszwk6glIK27w+09DvMlxh/o3mvMfpvQXbDSpWXcuV0S6R2w7/T0hAV1u+vcv2
 ikxET9LMjsRVQ2iD70RF+BZYTfgRIUmIbbRz5+Jh95MTaznXJ2aATF6c1oOD2Pe8/jt/6HFI
X-Authority-Analysis: v=2.4 cv=Xc2JzJ55 c=1 sm=1 tr=0 ts=6874a464 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=56IJ4eEW6NAC_NOVRZQA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_233205_319821_276DFCCC 
X-CRM114-Status: GOOD (  28.17  )
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

The byte-cntr read function always reads trace data from the deactivated
and filled buffer which is already synced. The read function will fail
when the ETR cannot find a available buffer to receive trace data.

The read function terminates when the path is disabled or interrupted by a
signal.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-tmc-core.c  | 31 ++++++-
 .../hwtracing/coresight/coresight-tmc-etr.c   | 90 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h   |  3 +
 3 files changed, 120 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 354faeeddbb2..3ab25adc4e4d 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -318,14 +318,18 @@ static int tmc_open(struct inode *inode, struct file *file)
 	return 0;
 }
 
-static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
-				   char **bufpp)
+static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata,
+				   struct ctcu_byte_cntr *byte_cntr_data,
+				   loff_t pos, size_t len, char **bufpp)
 {
 	switch (drvdata->config_type) {
 	case TMC_CONFIG_TYPE_ETB:
 	case TMC_CONFIG_TYPE_ETF:
 		return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
 	case TMC_CONFIG_TYPE_ETR:
+		if (byte_cntr_data && byte_cntr_data->thresh_val)
+			return tmc_byte_cntr_get_data(drvdata, byte_cntr_data, len, bufpp);
+
 		return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
 	}
 
@@ -339,7 +343,21 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
 	ssize_t actual;
 	struct tmc_drvdata *drvdata = container_of(file->private_data,
 						   struct tmc_drvdata, miscdev);
-	actual = tmc_get_sysfs_trace(drvdata, *ppos, len, &bufp);
+	struct coresight_device *helper = coresight_get_helper(drvdata->csdev,
+						CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
+	struct ctcu_byte_cntr *byte_cntr_data = NULL;
+	struct ctcu_drvdata *ctcu_drvdata = NULL;
+	int port;
+
+	if (helper) {
+		port = coresight_get_port_helper(drvdata->csdev, helper);
+		if (port >= 0) {
+			ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
+			byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
+		}
+	}
+
+	actual = tmc_get_sysfs_trace(drvdata, byte_cntr_data, *ppos, len, &bufp);
 	if (actual <= 0)
 		return 0;
 
@@ -349,7 +367,12 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
 		return -EFAULT;
 	}
 
-	*ppos += actual;
+	if (byte_cntr_data && byte_cntr_data->thresh_val) {
+		byte_cntr_data->total_size += actual;
+		drvdata->reading_node->pos += actual;
+	} else
+		*ppos += actual;
+
 	dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
 
 	return actual;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 3e3e1b5e78ca..174411e76047 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1163,6 +1163,10 @@ ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
 	ssize_t actual = len;
 	struct etr_buf *etr_buf = drvdata->sysfs_buf;
 
+	/* Reading the buffer from the buf_node if it exists*/
+	if (drvdata->reading_node)
+		etr_buf = drvdata->reading_node->sysfs_buf;
+
 	if (pos + actual > etr_buf->len)
 		actual = etr_buf->len - pos;
 	if (actual <= 0)
@@ -1339,6 +1343,92 @@ static bool tmc_byte_cntr_switch_buffer(struct tmc_drvdata *drvdata,
 	return found_free_buf;
 }
 
+/*
+ * tmc_byte_cntr_get_data() - reads data from the deactivated and filled buffer.
+ * The byte-cntr reading work reads data from the deactivated and filled buffer.
+ * The read operation waits for a buffer to become available, either filled or
+ * upon timeout, and then reads trace data from the synced buffer.
+ */
+ssize_t tmc_byte_cntr_get_data(struct tmc_drvdata *drvdata,
+			       struct ctcu_byte_cntr *byte_cntr_data,
+			       size_t len, char **bufpp)
+{
+	size_t thresh_val = byte_cntr_data->thresh_val;
+	atomic_t *irq_cnt = &byte_cntr_data->irq_cnt;
+	struct etr_buf *sysfs_buf = drvdata->sysfs_buf;
+	struct device *dev = &drvdata->csdev->dev;
+	struct etr_buf_node *nd, *next;
+	ssize_t size = sysfs_buf->size;
+	ssize_t actual;
+	loff_t pos;
+	int ret;
+
+wait_buffer:
+	if (!byte_cntr_data->reading_buf) {
+		ret = wait_event_interruptible_timeout(byte_cntr_data->wq,
+				((atomic_read(irq_cnt) + 1) * thresh_val >= size) ||
+				!byte_cntr_data->enable,
+				BYTE_CNTR_TIMEOUT);
+		if (ret < 0)
+			return ret;
+		/*
+		 * The current etr_buf is almost full or timeout is triggered,
+		 * so switch the buffer and mark the switched buffer as reading.
+		 */
+		if (byte_cntr_data->enable) {
+			if (!tmc_byte_cntr_switch_buffer(drvdata, byte_cntr_data)) {
+				dev_err(dev, "Switch buffer failed for byte-cntr\n");
+				return -EINVAL;
+			}
+
+			byte_cntr_data->reading_buf = true;
+		} else {
+			if (!drvdata->reading_node) {
+				list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, node) {
+					if (nd->sysfs_buf == sysfs_buf) {
+						nd->pos = 0;
+						drvdata->reading_node = nd;
+						break;
+					}
+				}
+			}
+
+			pos = drvdata->reading_node->pos;
+			actual = tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
+			if (actual > 0)
+				return actual;
+
+			drvdata->reading_node = NULL;
+
+			/* Exit byte-cntr reading */
+			return -EINVAL;
+		}
+	}
+
+	/* Check the status of current etr_buf*/
+	if ((atomic_read(irq_cnt) + 1) * thresh_val >= size)
+		/*
+		 * Unlikely to find a free buffer to switch, so just disable
+		 * the ETR for a while.
+		 */
+		if (!tmc_byte_cntr_switch_buffer(drvdata, byte_cntr_data))
+			dev_info(dev, "No available buffer to store data, disable ETR\n");
+
+	pos = drvdata->reading_node->pos;
+	actual = tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
+	if (actual == 0) {
+		/* Reading work for marked buffer has finished, reset flags */
+		drvdata->reading_node->reading = false;
+		byte_cntr_data->reading_buf = false;
+		drvdata->reading_node = NULL;
+
+		/* Nothing in the buffer, wait for next buffer to be filled */
+		goto wait_buffer;
+	}
+
+	return actual;
+}
+
 static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
 {
 	int ret = 0;
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 1dbba0bc50a3..4136ec5ecaf7 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -364,6 +364,9 @@ int tmc_read_prepare_byte_cntr(struct tmc_drvdata *drvdata,
 			       struct ctcu_byte_cntr *byte_cntr_data);
 int tmc_read_unprepare_byte_cntr(struct tmc_drvdata *drvdata,
 				 struct ctcu_byte_cntr *byte_cntr_data);
+ssize_t tmc_byte_cntr_get_data(struct tmc_drvdata *drvdata,
+			       struct ctcu_byte_cntr *byte_cntr_data,
+			       size_t len, char **bufpp);
 
 #define TMC_REG_PAIR(name, lo_off, hi_off)				\
 static inline u64							\
-- 
2.34.1


