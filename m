Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAAB8C83F1B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 07:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qoFg4KFCsq0JCWNAAHHpPtznsQ0Gp9v6PqKrgQDg78Q=; b=ED9Rk8jZuizBGc5b39wy9sTnGq
	3emd7eFGs1gwr3/T+FGQSSetc299eL7Gp5bCotgzG6GiE1SasA5/qdM9HWdVo1Yf/42/36X+jouPx
	nydYJ6Z6867zpju4ioRGR7p7dggp3NvKbrLk2HJnVzjHWyrtPlGPoFfvk+VyMgJcW1kSl/kUdeBnM
	MpKzj8kzWmKjobfia1ScmJWgfZJHiAB7aE7xmsSbh8QK55FDvPZUhUqCvf1HzrgmqR85SLw+sJpi0
	2u6Bu4IQRUZdRRR3LTmpkyFUx2wxpj3Bbjz531RGTzUq2SJj8G+VJR3RWs/tNT+1rPO9kt3N3A137
	cdRLiMxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubDGa-00000001QNd-118i;
	Mon, 14 Jul 2025 07:06:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubCjD-00000001MJW-0apv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 06:31:56 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56DLPJSa027407
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 06:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qoFg4KFCsq0
	JCWNAAHHpPtznsQ0Gp9v6PqKrgQDg78Q=; b=aEgoj2kwOYv+Ma2QwthyHiCBp9e
	XN3fh1VBMd+VJSJqEk41nWseK/fpw/dJ92fvrfpfEmyePjypRK3jZwioWIiwMc8t
	C7TFokXbvfCVPomSQ09zKdA8T+k6d9wQY61AIWAxRNWaTVgOcu/QoC+h/WW47x6k
	SWmLnWz6YgJa2U09me48h4W9cwEmQ41FndEH+Ei4DQ+IqonTk/PLy1cpjRNYpigN
	6Gjz6C+XtLx1kpQWBmk7/U139c3RRTUNGbOQV1BJHXbHm/Yk1BBH/Fwc8ZKtsDBI
	CIzRCDV22+dwZSTpwb6GMxW3fL1BfTOwF3H8ZjKQTuw9DoshiGv+e4lVxLg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufvxbjpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Jul 2025 06:31:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3121cffd7e8so3051573a91.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 13 Jul 2025 23:31:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752474713; x=1753079513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qoFg4KFCsq0JCWNAAHHpPtznsQ0Gp9v6PqKrgQDg78Q=;
        b=BTmJdocxS59PjWAT3yWs+UYDTU0gc4vZzQQF6HZduUSwQPOFTLnRuF7LzMdFIy6Yrk
         gfu/VGtp3DLHN+L724lJOcJ81cMcpy32JEzRi5UtEadHrV4PcMZjkL1ASZrpcdb0jiMZ
         STfafX+uOxAiCSCtvRThtbRsjdfl2yJqvCI4ZUvFeeXBUYrKa/lLe/VsjTDh9JilcQxR
         xzKxrY/iHQru8Mb60tyju5yDd7THb5I9UbdQizE8IoRyEjIkr8epB6I3ZWJzPidiBnHo
         lIq5qNG3P3l0ReYb9VqEqwHwUi2fdVxUdE6GP0C1MkFoVm9XJssJgPvSvG6J7b73urgz
         XgBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDyoyg81WsVHJI6G38hKjoneQVRqwIkQGaH7UflqX9zsus1FPlRg4Y1c4sZP3djrAiazZOlr59clQ2lZ7PnabE@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg2wZRP1M7/J+W3GXmIzJwcVEeF+mc4JzTKvE4+3jK5qYXtZvh
	LIGvGpKoHGkaqIHZ3A7PNnKPF3CelzsYr1GlR7Bm1NzJSrfGrtzpoB3Kv7l+/nNS2kdtxYs+/lA
	EQnmVO+1AwUPmSAJ0DKEuvWjEIGTlGLNWgFsY6011a660Es45mapW1CNVWN5ylJdkgHLHh8RbnE
	63Yw==
X-Gm-Gg: ASbGncuHpwhhthRdFCt8mkJHdlxmpDQhOW6eTNZM0EeDCvHMjCwKLz3f4MX+nAZyII6
	i0FlYiyq4rkitMuoLBDPFt+Y0XSSvKwpJSKjtD2fJ7w9ngqFW02CYy3JyiXulKcCXpOoK4JxWyn
	2h/A/d3GLYZrlVxuxaa/JmYYXtYLRGtkqnCGLshD/WSuOvH1nvf7/O64vHWXmwXc/YiOyur1WB/
	ZyjCuxNoVoAE1XjBBuuE4gyz/+rNQSJzhT0i++iteYCg3RAZ1Hg4QIxEtJe5EQ5Z2DfQpJQ7vSJ
	8F/rgQUd5FG3XPkkzuBiLF0kVE9cqpnYaJdfLECix3liuzppMil/kcf1GnPNZeUa3FsqH0hbg1u
	qzOEUCBTeA36A5C3Yf/Sn
X-Received: by 2002:a17:903:40c6:b0:235:f70:fd37 with SMTP id d9443c01a7336-23dee204614mr181668845ad.19.1752474712682;
        Sun, 13 Jul 2025 23:31:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6/E8+pWE8Qlpm2Dm9PL72eqb4o7WVOlJWmb4J4fwBoKVGK1/eINOMbAkX7/N7IGeqA2CThA==
X-Received: by 2002:a17:903:40c6:b0:235:f70:fd37 with SMTP id d9443c01a7336-23dee204614mr181668365ad.19.1752474712267;
        Sun, 13 Jul 2025 23:31:52 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4334005sm86138255ad.158.2025.07.13.23.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 23:31:51 -0700 (PDT)
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
Subject: [PATCH v3 RESEND 07/10] coresight: tmc: add prepare/unprepare functions for byte-cntr
Date: Mon, 14 Jul 2025 14:31:06 +0800
Message-Id: <20250714063109.591-8-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
References: <20250714063109.591-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: PvC1qjs03MhcxBnQiiPCb9U7XNxJn-Nk
X-Proofpoint-ORIG-GUID: PvC1qjs03MhcxBnQiiPCb9U7XNxJn-Nk
X-Authority-Analysis: v=2.4 cv=achhnQot c=1 sm=1 tr=0 ts=6874a459 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=xC7plfDI9GgKYcT3xssA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDAzNyBTYWx0ZWRfX/TXYFexF2S7c
 d4jaPENpksjhJvbIxISnLEvZ/bM/6eJtTRosYe9PuApAkX7Syq+/N3qWXTEYBrWXATW60Fb30a5
 BGRqMGG3K4CbeWtkmd5d02/KMgqw0q6Thk3eX5Sv2xdMN9rU+mkdnu76ljRwWTtKB8Ixi4o1ZeY
 qmloMoZ20lhcki5AHAjdiNFfX8BovCjdN/ddj6HiMTcyJnzag/iPUM2KpyHza7+mfWhq5EA8GIj
 RcYzagYisBMArUnynyPgrrr36YDkUyom8AHfnoAxJX40SvihKvYEwkvC1N3JHfTnndm6s/o/ZKh
 PIvbhqvkeuA7q7Lzmiio3DLN+GAWZG+1i7PKrerKJcQDue6RkfFdWZJjNOY2JUHgg+krUhfqyAX
 0brM79rZr/vw0s/7KwqNTWWNKEzn5tBf3izhWH3MJekapR/ybCIhjt0nupm5e+Yp2qSNNpS3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_01,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 mlxscore=0
 spamscore=0 clxscore=1015 mlxlogscore=850 adultscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_233155_195196_41B65936 
X-CRM114-Status: GOOD (  26.54  )
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

Prepare for byte-cntr reading. An additional sysfs_buf is required to
receive trace data, as byte-cntr always reads from the deactivated
and filled sysfs_buf.

The unprepare function releases the additional deactivated sysfs_buf
allocated during the prepare phase.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-tmc-core.c  | 38 ++++++++-
 .../hwtracing/coresight/coresight-tmc-etr.c   | 79 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h   |  7 ++
 3 files changed, 120 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 4d249af93097..354faeeddbb2 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -230,7 +230,11 @@ static int tmc_prepare_crashdata(struct tmc_drvdata *drvdata)
 
 static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
-	int ret = 0;
+	struct coresight_device *helper = coresight_get_helper(drvdata->csdev,
+						CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
+	struct ctcu_byte_cntr *byte_cntr_data = NULL;
+	struct ctcu_drvdata *ctcu_drvdata = NULL;
+	int port, ret = 0;
 
 	switch (drvdata->config_type) {
 	case TMC_CONFIG_TYPE_ETB:
@@ -238,7 +242,18 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 		ret = tmc_read_prepare_etb(drvdata);
 		break;
 	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_prepare_etr(drvdata);
+		if (helper) {
+			port = coresight_get_port_helper(drvdata->csdev, helper);
+			if (port >= 0) {
+				ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
+				byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
+			}
+		}
+
+		if (byte_cntr_data && byte_cntr_data->thresh_val)
+			ret = tmc_read_prepare_byte_cntr(drvdata, byte_cntr_data);
+		else
+			ret = tmc_read_prepare_etr(drvdata);
 		break;
 	default:
 		ret = -EINVAL;
@@ -252,7 +267,11 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 
 static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
-	int ret = 0;
+	struct coresight_device *helper = coresight_get_helper(drvdata->csdev,
+						CORESIGHT_DEV_SUBTYPE_HELPER_CTCU);
+	struct ctcu_byte_cntr *byte_cntr_data = NULL;
+	struct ctcu_drvdata *ctcu_drvdata = NULL;
+	int port, ret = 0;
 
 	switch (drvdata->config_type) {
 	case TMC_CONFIG_TYPE_ETB:
@@ -260,7 +279,18 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 		ret = tmc_read_unprepare_etb(drvdata);
 		break;
 	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_unprepare_etr(drvdata);
+		if (helper) {
+			port = coresight_get_port_helper(drvdata->csdev, helper);
+			if (port >= 0) {
+				ctcu_drvdata = dev_get_drvdata(helper->dev.parent);
+				byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
+			}
+		}
+
+		if (byte_cntr_data && byte_cntr_data->thresh_val)
+			ret = tmc_read_unprepare_byte_cntr(drvdata, byte_cntr_data);
+		else
+			ret = tmc_read_unprepare_etr(drvdata);
 		break;
 	default:
 		ret = -EINVAL;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 4609df80ae38..2b73bd8074bb 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -2032,6 +2032,85 @@ int tmc_read_unprepare_etr(struct tmc_drvdata *drvdata)
 	return 0;
 }
 
+int tmc_read_prepare_byte_cntr(struct tmc_drvdata *drvdata,
+			       struct ctcu_byte_cntr *byte_cntr_data)
+{
+	unsigned long flags;
+	int ret = 0;
+
+	/* config types are set a boot time and never change */
+	if (WARN_ON_ONCE(drvdata->config_type != TMC_CONFIG_TYPE_ETR))
+		return -EINVAL;
+
+	if (coresight_get_mode(drvdata->csdev) != CS_MODE_SYSFS)
+		return -EINVAL;
+
+	/*
+	 * The threshold value must not exceed the buffer size.
+	 * A margin should be maintained between the two values to account
+	 * for the time gap between the interrupt and buffer switching.
+	 */
+	if (byte_cntr_data->thresh_val + SZ_16K >= drvdata->size) {
+		dev_err(&drvdata->csdev->dev, "The threshold value is too large\n");
+		return -EINVAL;
+	}
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	if (byte_cntr_data->reading) {
+		ret = -EBUSY;
+		goto out_unlock;
+	}
+
+	byte_cntr_data->reading = true;
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	/* Insert current sysfs_buf into the list */
+	ret = tmc_create_etr_buf_node(drvdata, drvdata->sysfs_buf);
+	if (!ret) {
+		/*
+		 * Add one more sysfs_buf for byte-cntr function, byte-cntr always reads
+		 * the data from the buffer which has been synced. Switch the buffer when
+		 * the used buffer is nearly full. The used buffer will be synced and made
+		 * available for reading before switch.
+		 */
+		ret = tmc_create_etr_buf_node(drvdata, NULL);
+		if (ret) {
+			dev_err(&drvdata->csdev->dev, "Failed to create etr_buf_node\n");
+			tmc_delete_etr_buf_node(drvdata);
+			byte_cntr_data->reading = false;
+			goto out;
+		}
+	}
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	atomic_set(&byte_cntr_data->irq_cnt, 0);
+	enable_irq(byte_cntr_data->byte_cntr_irq);
+	enable_irq_wake(byte_cntr_data->byte_cntr_irq);
+	byte_cntr_data->total_size = 0;
+	byte_cntr_data->irq_num = 0;
+
+out_unlock:
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+
+out:
+	return ret;
+}
+
+int tmc_read_unprepare_byte_cntr(struct tmc_drvdata *drvdata,
+				 struct ctcu_byte_cntr *byte_cntr_data)
+{
+	struct device *dev = &drvdata->csdev->dev;
+
+	guard(raw_spinlock_irqsave)(&byte_cntr_data->spin_lock);
+	disable_irq_wake(byte_cntr_data->byte_cntr_irq);
+	disable_irq(byte_cntr_data->byte_cntr_irq);
+	byte_cntr_data->reading = false;
+	tmc_delete_etr_buf_node(drvdata);
+	dev_dbg(dev, "send data total size:%llu bytes, irq_cnt:%d\n",
+		byte_cntr_data->total_size, byte_cntr_data->irq_num);
+
+	return 0;
+}
+
 static const char *const buf_modes_str[] = {
 	[ETR_MODE_FLAT]		= "flat",
 	[ETR_MODE_ETR_SG]	= "tmc-sg",
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index f6b05639aeca..1dbba0bc50a3 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -14,6 +14,8 @@
 #include <linux/refcount.h>
 #include <linux/crc32.h>
 
+#include "coresight-ctcu.h"
+
 #define TMC_RSZ			0x004
 #define TMC_STS			0x00c
 #define TMC_RRD			0x010
@@ -357,6 +359,11 @@ extern const struct coresight_ops tmc_etr_cs_ops;
 ssize_t tmc_etr_get_sysfs_trace(struct tmc_drvdata *drvdata,
 				loff_t pos, size_t len, char **bufpp);
 
+/* Byte-cntr functions */
+int tmc_read_prepare_byte_cntr(struct tmc_drvdata *drvdata,
+			       struct ctcu_byte_cntr *byte_cntr_data);
+int tmc_read_unprepare_byte_cntr(struct tmc_drvdata *drvdata,
+				 struct ctcu_byte_cntr *byte_cntr_data);
 
 #define TMC_REG_PAIR(name, lo_off, hi_off)				\
 static inline u64							\
-- 
2.34.1


