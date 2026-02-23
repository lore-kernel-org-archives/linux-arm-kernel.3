Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94101E98DEB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 06:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jI9VMtFL2iZSHiAcQIxgD0sR6qS7voT+SLIQjeTVTZ4=; b=dYLmbMKXMr9U6h9Qs/CMdXKTZa
	cCQmlPDVj2ewGgxs66X4E42qokjVnAFUY3/Trq97oNa1l8AVv95ODBjiuQWc1sY1/XvSfwa/0BtLs
	+OMS1g8j7Hldasp5wABh1Xli2NXDx5lLADqBRRZskecQs+4cJhv6b7hj3oOcBdHokJqe/uh0fu7CV
	wjdQ5Msi0llvGBl2JElrx8wjjcIx7QN06etkU5AT8v5g+KUbDZgkZiFxdOPSoFZnGvwGvJYYzhsAI
	nwGMJsIhOsz521lQlhVFSkFpsIO4QPaDMs7jyh/GBTPW3SsxEae6SPcegjfL3wfOd1axeKcfY3SMe
	JdyNdEXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPhL-0000000HJOZ-3ITR;
	Mon, 23 Feb 2026 06:45:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPhK-0000000HJMR-0TE3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 06:45:39 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61ML3mVw1518366
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jI9VMtFL2iZSHiAcQIxgD0sR6qS7voT+SLIQjeTVTZ4=; b=kQr8LKbnIdWOnO3q
	E5Bo3HZi2RVbxdnWm+EJxOggxeGkG8iTO3a0PiF5aCrvHtQUgAoZ6wIoABNBHzDJ
	T4N8D53Ng2Wg0f7nifMxXcXnIpiRRGl8Z/aKkI78yM6V0Jlpyq7nui4tRFlolCUw
	vtQFXBHXdwBajDGb7Gg1AtYL51sXnFfBd6d0XLLhWmBTupuAdYOmdvkvYfelVrkn
	TBFZKiozc/EW4xkAFJfZniDSPZjRqxKvFSiWkRp4GjLxXYcyYYTaP9SejQl6xVWI
	+f5NyyGVtijiHeWhF/t+4MPLZaTfPwb0fcyT2YsYr1+/h0+9LcwZ68/AUCWCP5ue
	0sZijQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u9upey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:45:36 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aae3810558so46122465ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 22:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771829136; x=1772433936; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jI9VMtFL2iZSHiAcQIxgD0sR6qS7voT+SLIQjeTVTZ4=;
        b=UlqeO4n1MKwnfdSPIBkgrQ/o0gft5qcGu1vYxgwQdFbLXpt0qh89L5Y8Iooh2eNtDy
         0s/vlWN4i8sfEQiU27zytAvumXb7QtRAfbcJxQM3VjPLcJw4H5QlQ2DwjWnP/bXMJSaC
         qw5qpgHQEXG4dNewJymrZmPFbBxlmv4OXwgkHTiwPY7L9/4m4RO5qjWQHUkMSCtO1Aah
         cQPD6E5kOXCjZlpNFRr3opnjESJA1DMbmy01kJYmOKBb4DBgm+/OvGeIYxud/DhzMWhD
         rzs+iWg4CktDE7ZAD/DnVtoAhxaBr4BRFNBbiACcQyRv3Kb0sBc4/jIXegizrWlbqbf3
         Z8Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829136; x=1772433936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jI9VMtFL2iZSHiAcQIxgD0sR6qS7voT+SLIQjeTVTZ4=;
        b=TnP7QhgV4BQyqa4moyOmEftCco34NZampcsS2s6QpD1+uIyevMOf9sF4npIK9/vbAp
         KDpw/v/n6rx7x0DQ2MMqsEv9TcDx/H5en+MCyvg6DSz5puS0Ap0Vs70JcCeu23hpuD/E
         xIfELjVXyUZFZuDu6kxCuK0Th5GPa3ewu4qooTzGzjwoTVeiRQVkP8BmRUPvFkGP2xQ/
         SDf15+NrV2Ghw0c/h+8m8OUPtz8nAP5QUXi9VuE3whoyfgNk7ydI463wIuhdE7/LJJj3
         9/N4yPoUE/hsPOG1hLTxYZBGimZwckjnaQ7G1HDFikMYu+k2f2GLj8wYn1SLbO1ZOStc
         Gckw==
X-Forwarded-Encrypted: i=1; AJvYcCVmlTSLN54oWH4Vw3mqo5RrhTlSaNt2lazYTIU30Blom6hehVloMw/x/Vq+YX+cCiQyOaFTs7oVyLtG9rJTdES9@lists.infradead.org
X-Gm-Message-State: AOJu0YwRIFCFYKCHxruidAcOBirk7R+v5SLJMZP6qeXViORFl3MnyJyH
	xXdob3sFhv8RWBHGnQ6KXzRuHU0WDle7Wfa157nuFLvGqj6gSqKK7jmFpHy3qXxuQmh6PWrF8YT
	K0EhN1lAmIvYQZ1gFvrdUjZsCdrQN33Bpn/n8UQIqFr44NR2xqrveeTmpB3GlOfkn4NnOPld6Xe
	Yr1Q==
X-Gm-Gg: ATEYQzyk6h719NHx3qf9yvjK5EP2Px24HqebnjGYpy+vBoKpWkeaMyEB0ibYWXswOBS
	PdQ21m4BDxZCjrMFFi2gtp0diIfo0s95Zrpcg1tomGL6qSn3pkIcJjDsYsiZ+NbEBYKkNj2bsN/
	0irEV7X/bLFmh7L7JoVLimNNJnSjuBv5WihCFoI+/uxmi8FJOGo+fQgzZ2bHnqDi5J6sPwxnOb0
	khBwxNz8iSsJZZx9HPUwb6tkl61SW9f1uI8j4X0mXWY52++Sd9w9uNvfs78SshjtXqZu45aWy8f
	o2M8Kh369ykloSl5BkTFMgo5ELBnN5CPebY6X8ER5ZCpHFmXm1mnNQRcxLqZXzUfh8tR5mXLzzC
	fxDB1Kg1gLQKP85tlfo2vEjkNAW6t8dG0AUHRgxlX6nf6Zr9xOxk99x3XtKVllFuh+GxlBx4Mf2
	6rbG6i7WCURrwq
X-Received: by 2002:a17:903:3850:b0:2a7:d42f:7065 with SMTP id d9443c01a7336-2ad74511791mr53085065ad.27.1771829135894;
        Sun, 22 Feb 2026 22:45:35 -0800 (PST)
X-Received: by 2002:a17:903:3850:b0:2a7:d42f:7065 with SMTP id d9443c01a7336-2ad74511791mr53084845ad.27.1771829135433;
        Sun, 22 Feb 2026 22:45:35 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b71839d6sm6483993a12.6.2026.02.22.22.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:45:35 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:44:43 +0800
Subject: [PATCH 7/8] coresight: tmc: integrate byte-cntr's sysfs_ops with
 tmc sysfs file_ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-enable-byte-cntr-for-ctcu-v1-7-042fb35bd37e@oss.qualcomm.com>
References: <20260223-enable-byte-cntr-for-ctcu-v1-0-042fb35bd37e@oss.qualcomm.com>
In-Reply-To: <20260223-enable-byte-cntr-for-ctcu-v1-0-042fb35bd37e@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <Mike.Leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771829097; l=3465;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=+caVanCR1MkRvTlDCUseywuTVg2NMA0xm0dQkI5ZlEc=;
 b=3ejEy2E3BRft9RB3V1QrLiiFOb5rAhjQ2kogpVIj7yrQui20Lqdro3f8n7UQxkghk9OuO/i3C
 +8B8KlvbavECf4ep/LIJizpUXLv2Nv07u+F8EQ8f/XXbFEQIKNcQx/J
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA1OCBTYWx0ZWRfX/WjMw/gE1o8q
 4maOOwjCdzzLX07BFAp/S19Sg/pev9auzJ8nIQ/lzGnUtKzmsgirXw513HEkwmc53RxRN8FGXLO
 MWdhBxxnkhgmE20Gf9P0bqLF9hmEYssbvoxzRk2YhgpC6zNrCmydjKeNxdUhXWLi85EyvL3rXO0
 yxsrcJEhqK5ixE8Vdo/kBRZKYItuQ9jTUKn5PAYBbV03QwEtl9GfBmkvD0/1HVh10eCmjgsAMvo
 IP5jTpTyNf5cXYfi/bb+K4EHX4D8bwacRDsxKBdGHG1wS0lawgC8kSAAK3AAenM51Mo0ugJEeS6
 Bi9EPiWRatDtGJyHCS7jvUVMemXeFFdW5y7B3FSyDHCwbHGCfPU0ZqrP8xiHwX/hQIK4WpsPVDZ
 onesg4dqGE/in4759FfWBAwJyrKSRB0XxUeZ0c0u+wslZlb5eUs8awz+TLpBPEgztuhcSZHrYN1
 VuC98GtmOq/+7qedtGw==
X-Proofpoint-GUID: B0Ddvq8bJ8k6bkmlYSxoavlHsu0kiuB0
X-Proofpoint-ORIG-GUID: B0Ddvq8bJ8k6bkmlYSxoavlHsu0kiuB0
X-Authority-Analysis: v=2.4 cv=RpDI7SmK c=1 sm=1 tr=0 ts=699bf790 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=i2GxayCjj04of9N-vEoA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_224538_368917_EC21E180 
X-CRM114-Status: GOOD (  18.41  )
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

Add code logic to invoke byte-cntr's tmc_sysfs_ops if the byte-cntr
is enabled.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 53 +++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 32ca2ec994de..6486bdafdddc 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -31,6 +31,7 @@
 
 #include "coresight-priv.h"
 #include "coresight-tmc.h"
+#include "coresight-ctcu.h"
 
 DEFINE_CORESIGHT_DEVLIST(etb_devs, "tmc_etb");
 DEFINE_CORESIGHT_DEVLIST(etf_devs, "tmc_etf");
@@ -228,15 +229,47 @@ static int tmc_prepare_crashdata(struct tmc_drvdata *drvdata)
 	return 0;
 }
 
+/* Return the byte-cntr's tmc_sysfs_ops if in using */
+static const struct tmc_sysfs_ops *tmc_get_byte_cntr_sysfs_ops(struct tmc_drvdata *drvdata)
+{
+	struct ctcu_byte_cntr *byte_cntr_data;
+	struct ctcu_drvdata *ctcu_drvdata;
+	struct coresight_device *ctcu;
+	int port;
+
+	ctcu = tmc_etr_get_ctcu_device(drvdata);
+	if (!ctcu)
+		return NULL;
+
+	port = coresight_get_in_port(drvdata->csdev, ctcu);
+	if (port < 0)
+		return NULL;
+
+	ctcu_drvdata = dev_get_drvdata(ctcu->dev.parent);
+	byte_cntr_data = &ctcu_drvdata->byte_cntr_data[port];
+	if (byte_cntr_data && byte_cntr_data->thresh_val)
+		return ctcu_drvdata->byte_cntr_sysfs_ops;
+
+	return NULL;
+}
+
 static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
+	const struct tmc_sysfs_ops *byte_cntr_sysfs_ops;
 	int ret = 0;
 
+	byte_cntr_sysfs_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_ops) {
+		ret = byte_cntr_sysfs_ops->read_prepare(drvdata);
+		goto out;
+	}
+
 	if (drvdata->sysfs_ops)
 		ret = drvdata->sysfs_ops->read_prepare(drvdata);
 	else
 		ret = -EINVAL;
 
+out:
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
 
@@ -245,13 +278,21 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 
 static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
+	const struct tmc_sysfs_ops *byte_cntr_sysfs_ops;
 	int ret = 0;
 
+	byte_cntr_sysfs_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_ops) {
+		ret = byte_cntr_sysfs_ops->read_unprepare(drvdata);
+		goto out;
+	}
+
 	if (drvdata->sysfs_ops)
 		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
 	else
 		ret = -EINVAL;
 
+out:
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
 
@@ -277,6 +318,12 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
+	const struct tmc_sysfs_ops *byte_cntr_sysfs_ops;
+
+	byte_cntr_sysfs_ops = tmc_get_byte_cntr_sysfs_ops(drvdata);
+	if (byte_cntr_sysfs_ops)
+		return byte_cntr_sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
+
 	return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 }
 
@@ -297,7 +344,11 @@ static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
 		return -EFAULT;
 	}
 
-	*ppos += actual;
+	if (drvdata->reading_node)
+		drvdata->reading_node->pos += actual;
+	else
+		*ppos += actual;
+
 	dev_dbg(&drvdata->csdev->dev, "%zu bytes copied\n", actual);
 
 	return actual;

-- 
2.34.1


