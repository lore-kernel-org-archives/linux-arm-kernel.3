Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3E42E98DEF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Feb 2026 06:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ovOi7Obm+BV74hN+gFqooWA+6V4qnwZ8iCgfUiGKqmo=; b=JrZbh8H4sxarED6yySMw2xwJ4X
	7O5W9rwQslhbDCPHazz2dF/zg6uGaIXwub+H4L3griw4Xqo38vMPc8NW9GY7irKM3S6ehBJLVX88G
	POOksxp2YK5RnpEUNNPs1dEAN59XhnEa28nR/nu05ZtJIvF47DIOsEGlmKSPaV6+WlogK/mTwF5hY
	qLO1ajdX4jtZzhEP68P55b/DHEKN6ffCm/TCktIQ4Y0HyRp1a1opgH09/ttAbUgu13A40jG5mYNxv
	RghwtL1VvhyQVa+1rnsO7ivgCnqOurmWIsnaUZhYBcKOsV4zTv/SQN2zzTgo3a871KcRpP0rq1aV4
	aWj0wlBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPgy-0000000HJ9P-2D4R;
	Mon, 23 Feb 2026 06:45:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuPgw-0000000HJ8l-1Ocv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Feb 2026 06:45:15 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMbO3K3017118
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:45:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ovOi7Obm+BV74hN+gFqooWA+6V4qnwZ8iCgfUiGKqmo=; b=MPLVNK4uhQ9LU3oF
	L5YSilKvKcCmYwwZXCZNdCPFrtDF3oBtAydmYJw2ID8mu4802EMGXWPFR37rcgvt
	Zvq61XT+Xv8yEhiLnS77GA3CzicxdsDix/HU4cNXbynmBhb2hzArl1osU1tWWSFO
	lTqpayni2Du3dOa6JlbGSBWwUICTVXB7CqsDN2oHgMqyxGRhynIjZNfmLa4Of3RT
	j53dgtzGOfAuSUL7wYqWp9djTkCMHNCRnR76q1AFBmdMgu9F1JfOp/n1tYn/ovW5
	F2tWaI8sJC7rimKNAPOP92mlWGlXlKmftCK/xV/pEuPV9x5YvfrCSYivigmcVoZO
	6vzMYw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vj3nh7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 06:45:13 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-354c0234c1fso3757513a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Feb 2026 22:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771829112; x=1772433912; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ovOi7Obm+BV74hN+gFqooWA+6V4qnwZ8iCgfUiGKqmo=;
        b=fhFQvf6pgwGNcFrz8h/wXO9YsYfZgxluZNffF3PG+61W9io/OxVLJ5juMLtDzd/EOt
         GSdNT0+98fgQIwmbGd+iWeZbtSj59GAtZ1AHAP8HxNakGseG/y4cSKc3ei8RIsKYYJ8y
         5HOucWol5QMYXl3M/aGY8h3wP9UH9pOgwltC+zlnQwk9bF3iCC5uODcLuNFQwd6FClLs
         J1YH2k2okmHpIlEskaczg7ZuuS3+7EIOCMQMxAfDKofBHODqZ6kJI1il7SCk0Zj3TBAq
         p2tLSRNr7B4sjBWMNQMBIar/gWys5AkJDyUKC+pHEDSAHNNbQ3u1u5ko7NAdB8bi5QkE
         xbxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771829112; x=1772433912;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ovOi7Obm+BV74hN+gFqooWA+6V4qnwZ8iCgfUiGKqmo=;
        b=wnskL+Vl5CnUa5Y4afyuj48J7Ga/T4EAW45auPa1YWRROQTXLJsXoqFmeSVSlQSpJ6
         i39OtDe3ell/isr0J4DO2Xbb7Qetuadd0nnDHML8ZYaCbGDRglfjxh6HLInB1L41h61+
         itOJRgiIc5K+Tt3/8kHHReTy6WIEromj3+Y2wk5tZoodYu+CskIGWJHTyV/kAVmUZDMm
         X2qvxu651JfHf85TL1i5L/ZXoW35vBsv7yy5/AUijeBgZUihGnmuXy4XyVzlQuaQqVr/
         cvGUpAx+2uuI1zQ/lKaXpfEzwd/JhJRtVGGKXdc3heENI9gOBcL6Jnsekdu5AukdWcBw
         AjEg==
X-Forwarded-Encrypted: i=1; AJvYcCU1dYNXB1tKogONQ/o6rcCVhn+7cGdIuOTiWZO6Gdd33FvZnxvBQmb8SanN8vyqRGkA+6c3T5nKkX71gCKFxb6M@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5zQrfjP/MjIw9kco4WziBuUVqUlpC7vXtdFG79/uNnDpwGZUP
	hVwItx35t4PL0aJCcMh2jo6cWC+LW9KLHSgMhynxUY/PKd7ffWdRg8SM/OmbPF/LN12embd3LOM
	6b5tiK6CzP8n3VTCcAHgatc8SK+5vmuSQHCL1kQ5uaCy2m3Pm8g7qeyzltYRQ9UlXzuBz6lwUMJ
	ni7w==
X-Gm-Gg: AZuq6aJESjQ89Tm9F/1atho9r6SxoRZh10qiJdvANDQSNUsz7lzL6C/57pOUMgTxV5i
	RQZazH6rZCEByHPiPtUOK/LjoIyWJPHRB13CMLLgDDYSd0fXZzhtQT5jgsbMdVCHIsaroagR26r
	5LBcUSnxOffG445xvvtvzLZWXg+W923WBZcfxh6f1ML9a0Bl7yebar6RES1890aR/YMIq87Y+Kw
	fRRgKUGLI3ZzRup6LbyGBkt1Y1Lh/HI7GuFBavlLmWx9FMAMW2DWyHlnSgLVPBURIQI/zDCs+V8
	hyZwFNsVdthdhbb6XTWAC80OAa/PwfnbmPtRLNwsIcB5mENpK2yIzhllSicf+lfvH2yflr8pFNA
	ZLwF0GMVoD61oGJk7IP+i1U5SyR5Jf4Dkkq0GdWeSMOSp1eHQbeevjT/Ys6pHHBw6qbM+F9KBeo
	SYnPzXd1AYdeA2
X-Received: by 2002:a05:6a20:918d:b0:38b:e7a3:9d17 with SMTP id adf61e73a8af0-39545f8b3b7mr5728358637.49.1771829112147;
        Sun, 22 Feb 2026 22:45:12 -0800 (PST)
X-Received: by 2002:a05:6a20:918d:b0:38b:e7a3:9d17 with SMTP id adf61e73a8af0-39545f8b3b7mr5728335637.49.1771829111648;
        Sun, 22 Feb 2026 22:45:11 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b71839d6sm6483993a12.6.2026.02.22.22.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 22:45:11 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:44:38 +0800
Subject: [PATCH 2/8] coresight: tmc: add create/clean functions for
 etr_buf_list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-enable-byte-cntr-for-ctcu-v1-2-042fb35bd37e@oss.qualcomm.com>
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
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mike Leach <mike.leach@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1771829096; l=6164;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=fR8lvHhL4oSY/n5eSl541nai+feNwPd8lhB8kmyGxEU=;
 b=uKDG7hCuKtaBtw/peRApH7rv7DLycTy9TzsIu7InQl620hTm7DtJfiAgUqwvyMjC0iPtMCqFD
 PO1vXtX4ehKC+WpBAUXC12qHVjta+Na+bwaeM3TG4uG9wePExyakbQK
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA1OCBTYWx0ZWRfX4p2SFKKQTUH8
 y4LHmENyRUS3ZKKQgmdX2FdHJHNxFBuejw1RB12+3BNMBDTx5vBzTgT3trs96U5GO3EqcLqXLGI
 24nZYMtV2ztdueMrkdYS5ESgzp7QjD5hdDKLK28eWaLq5O95uIjMzS7hqD3xRRABkb28ybDIc1a
 P8uKyvT90V7uuDzm9UXbQ9+5xPLePsTtCTHoCXGznEU1iV3gRBaKRypA4aPkpmbZULL5eTZaGsC
 EoP1ALfud3P26M9jA1UkNVsAVzo34YFS8a/ifKm3fdq5IcfhspJxln8NFO1/jpSMmmTDQQT5yLF
 so0h5dBwDZXpLmuikrP1qD/Wf4Is47WLbe4QB7Gm58HWkp2b0H3qTvdrv9E5gMb5b0zN3+9VQcm
 GO/9mDTh5Ffh1qnE7eUSeuwfmOaor6yiL4r6GXWSZ361vv9LNXT/nRUpVm1lRHGQV817HWROSlv
 UtJf67jlPrDl6v+cLMw==
X-Authority-Analysis: v=2.4 cv=T5KBjvKQ c=1 sm=1 tr=0 ts=699bf779 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=pN8Znu5onTEf3dnVCfUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: c6S6bS5rF7K7YwIHbFHjnXx6BgfoXfA0
X-Proofpoint-ORIG-GUID: c6S6bS5rF7K7YwIHbFHjnXx6BgfoXfA0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260222_224514_497646_482B024B 
X-CRM114-Status: GOOD (  26.87  )
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

Introduce functions for creating and inserting or removing the
etr_buf_node to/from the etr_buf_list.

The byte-cntr functionality requires two etr_buf to receive trace data.
The active etr_buf collects the trace data from source device, while the
byte-cntr reading function accesses the deactivated etr_buf after is
has been filled and synced, transferring data to the userspace.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c |  1 +
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 94 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h      | 19 +++++
 3 files changed, 114 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 36599c431be6..1ea255ffa67c 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -840,6 +840,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = &etr_devs;
+		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index cee82e52c4ea..081498162011 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1920,6 +1920,100 @@ const struct coresight_ops tmc_etr_cs_ops = {
 	.panic_ops	= &tmc_etr_sync_ops,
 };
 
+/**
+ * tmc_clean_etr_buf_list - clean the etr_buf_list.
+ * @drvdata:	driver data of the TMC device.
+ *
+ * Remove the allocated node from the list and free the extra buffer.
+ */
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf_node *nd, *next;
+
+	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, node) {
+		if (nd->sysfs_buf == drvdata->sysfs_buf) {
+			if (coresight_get_mode(drvdata->csdev) == CS_MODE_DISABLED) {
+				drvdata->sysfs_buf = NULL;
+				tmc_free_etr_buf(nd->sysfs_buf);
+				nd->sysfs_buf = NULL;
+			}
+			list_del(&nd->node);
+			kfree(nd);
+		} else {
+			/* Free allocated buffers which are not utilized by ETR */
+			list_del(&nd->node);
+			tmc_free_etr_buf(nd->sysfs_buf);
+			nd->sysfs_buf = NULL;
+			kfree(nd);
+		}
+	}
+}
+EXPORT_SYMBOL_GPL(tmc_clean_etr_buf_list);
+
+/**
+ * tmc_create_etr_buf_list - create a list to manage the etr_buf_node.
+ * @drvdata:	driver data of the TMC device.
+ * @num_nodes:	number of nodes want to create with the list.
+ *
+ * Return 0 upon success and return the error number if fail.
+ */
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
+{
+	struct etr_buf_node *new_node;
+	struct etr_buf *sysfs_buf;
+	int i = 0, ret = 0;
+
+	/* We dont need a list if there is only one node */
+	if (num_nodes < 2)
+		return -EINVAL;
+
+	/* We expect that sysfs_buf in drvdata has already been allocated. */
+	if (drvdata->sysfs_buf) {
+		/* Directly insert the allocated sysfs_buf into the list first */
+		new_node = kzalloc_obj(*new_node, GFP_KERNEL);
+		if (IS_ERR(new_node))
+			return PTR_ERR(new_node);
+
+		new_node->sysfs_buf = drvdata->sysfs_buf;
+		new_node->is_free = false;
+		list_add(&new_node->node, &drvdata->etr_buf_list);
+		i++;
+	}
+
+	while (i < num_nodes) {
+		new_node = kzalloc_obj(*new_node, GFP_KERNEL);
+		if (IS_ERR(new_node)) {
+			ret = PTR_ERR(new_node);
+			break;
+		}
+
+		sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
+		if (IS_ERR(sysfs_buf)) {
+			kfree(new_node);
+			ret = PTR_ERR(sysfs_buf);
+			break;
+		}
+
+		/* We dont have a available sysfs_buf in drvdata, setup one */
+		if (!drvdata->sysfs_buf) {
+			drvdata->sysfs_buf = sysfs_buf;
+			new_node->is_free = false;
+		} else
+			new_node->is_free = true;
+
+		new_node->sysfs_buf = sysfs_buf;
+		list_add(&new_node->node, &drvdata->etr_buf_list);
+		i++;
+	}
+
+	/* Clean the list if there is an error */
+	if (ret)
+		tmc_clean_etr_buf_list(drvdata);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
+
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 319a354ede9f..57d8394d09b7 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -208,6 +208,19 @@ struct tmc_resrv_buf {
 	s64		len;
 };
 
+/**
+ * @sysfs_buf:	Allocated sysfs_buf.
+ * @is_free:	Indicates whether the buffer is free to choose.
+ * @pos:	Position of the buffer.
+ * @node:	Node in etr_buf_list.
+ */
+struct etr_buf_node {
+	struct etr_buf		*sysfs_buf;
+	bool			is_free;
+	loff_t			pos;
+	struct list_head	node;
+};
+
 /**
  * struct tmc_drvdata - specifics associated to an TMC component
  * @atclk:	optional clock for the core parts of the TMC.
@@ -245,6 +258,8 @@ struct tmc_resrv_buf {
  *		(after crash) by default.
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
+ * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @reading_node: Available buffer_node for byte-cntr reading.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -275,6 +290,8 @@ struct tmc_drvdata {
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
+	struct list_head        etr_buf_list;
+	struct etr_buf_node     *reading_node;
 };
 
 struct etr_buf_operations {
@@ -447,5 +464,7 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 				   enum cs_mode mode,
 				   struct coresight_path *path);
 extern const struct attribute_group coresight_etr_group;
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
 
 #endif

-- 
2.34.1


