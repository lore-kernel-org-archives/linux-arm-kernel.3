Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 431FEC88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 07:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Jay9EfBX3UpMTwsvQnGvQgNS5FLBeKOwQWuoZ1I2KI=; b=dUojYCv5Mup81IxsG88t1Tcfjd
	lg/NG3E4KfA8JKXP2u8SunHVxWwAycx/4iY55ZfuJqSX29DWndOnpU8bm1tCXHNyu+WAd0D4oGOYn
	iaTzD7BP3htvCgMEnRB6F/eUuHD+MP5XIN0JKLlWcMtMlwr+gozLB7q96ivbBY/WRu1If1GDedj4w
	czYI02u+L26NNuTIShjpw0B083iSDyYydIOIxEEHfAoVRIcusIn/mNX+h4bWRaoQ/oRFD5dlFLFXR
	jObbH/4YjxFJaAFTYrHVXM1OT28lDP4gOLHsZpn4NLbG+aNQn8TLgz/zCggfh3L6ffVN4s0DUDiaj
	KgWZNorQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHL7-0000000C35b-0AVB;
	Mon, 26 Jan 2026 07:48:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkHL3-0000000C34B-1JeZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 07:48:46 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PKhaf62135451
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 07:48:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Jay9EfBX3UpMTwsvQnGvQgNS5FLBeKOwQWuoZ1I2KI=; b=bhd012ynFFUsIiZ7
	hUldVPgyTc9JXLZcVbVAJjrszmwTXRySM/0XxmeDq1hxIEpcQb8zuWjCXul9Gxkp
	8k6m1m1H796IzkBN0VVgCiclhxz5gV4p5fTci9bBDg18haTMJGruyByGC08aSJDj
	YOxB4pxwMn/+9E6/hH3y+RNbJJnaPV7bNcB/fMkHMlQqpg4l9bxJAQTPzl/IIEPJ
	1BoMpUfgL6nzY57mCYL51xK+4FRoY3wsg8uAAaOPW8ZY2pHpU8JaxKBRAFjCi+4h
	tVmTNsGl86F8TQWmKhDSsGlut9Pc0ROCmgZuh5ItiSYS8KjUOl3tvDfpTNRokTKo
	BacvJg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq8dktw0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Jan 2026 07:48:44 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c5eed9a994dso2144588a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Jan 2026 23:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769413724; x=1770018524; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Jay9EfBX3UpMTwsvQnGvQgNS5FLBeKOwQWuoZ1I2KI=;
        b=Lm9NQbM+QB2zOwrbQuDi9a0/7xYHI78UBbxucEWyoTGnFTmBVToriJ+/ItOH8yd1QU
         q45tl2HwrlF8wAXQEQstVxCcR+TbjZG6m6iTMB6XBtVvml6VeUiqRQDzK0bkLX+IdMHa
         yaXmnV+W8do9Cw+1r5yFEzp7K+yn09r7KSNsIGfNJgILPnnqCuHdJNlzDiqlv+K8x0l+
         yCK/zngX2jKKLOd5Yvtd5WZetJf2b75LM5CVARHuaJT2P3fRnhpLj55yjoIVS+lXw9oN
         HBErmPiAtEx21Vaqo4yc8bOBMG5SxJz8R45uDVPkVt7fkYY9s/ojOsTzw2vN7v5jHuaB
         5EBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769413724; x=1770018524;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4Jay9EfBX3UpMTwsvQnGvQgNS5FLBeKOwQWuoZ1I2KI=;
        b=QP/L5Xa2VxTvPLTXOXTkS2ka7mTeTw7Ks0c23YOj55GAREryNY9EnNRVZltbn1QXVU
         Gbr945jqCXxoR8KbNdOTCLK6sLUi8y/sLMo5exTj7nNUfACHapqDhJZv8zryKxzjR4/d
         GDbaO4DpJ3aw47gFj/Y8d6Nr/5tvmXSLIIp381k2csnQ895cxcZo8Rdr1rY9tcpd1yik
         K7VSujs/+xob8YCzpfj54WwL3aSUebv6oody1nkjUUioE5MlILFNy3NhBvVUzC0Gnuju
         mVt1gbSw/q+pn6LSOALZkeB1frRHN1UME/KUYMcjJ/am+ItJm7DdXl5SmzXXZx6Yzlby
         kJtw==
X-Forwarded-Encrypted: i=1; AJvYcCX4IptlCmozpd5M9oYzb6jRRY6UDDTTVnZMFCu1644JXL6mWz2uD26pJWzoF/qn6t0lWMVt3M5T/VS3h+rLb2+Y@lists.infradead.org
X-Gm-Message-State: AOJu0YwVZHeYXyjcdDmjW7P6VQsiAgveSSvZlw2khumT84jtVCdVE2B6
	roLy1dfzZJdGmDlBSgvbQamdgsvM0q9PILENRSWhu3rmOwhmv6qT6kz9STTIl/+pftph7DoorZd
	d/gM5SJfTgIP3PAL6ebC3uLTMScCzh1TlWUS4hHvw/aWf6QvJ8uhFiQ6fjpeil2n1T2Hb/e9ZGl
	rCGQ==
X-Gm-Gg: AZuq6aLBFo95LAjcY0lTq9vsXnMKCaH56XozcJIwwIgPp57otoUreyFeR9pI2ek2bPY
	jngB+dsXxa9hoQlRfDWgcGmVP5TSAoA25zyx+5+MlRJcqDOzja9rtWhHBKUxcrLOS/j9wItXk6b
	64OcNxZMr+cFsetofeSkyGy96P0IXV4CWg+5NXzbRVpjacQOeufzGMBkmClrPQ3NPrQ6eDRHtY7
	rXdzSxBx1lhB+4pgV/DprK4narNadouPte/qtTCVK2jpODXaCDJ/gyGvKg/fo1a7RYY5Ed31uV6
	n93Y5f8k2w5vN5H/QZ4NcEeXLAIYzAGghU1UtsIsTALWPMwYvBPrrBldCcXZ1sMmho0zEcN9BEQ
	DTtj6kvJTV7JoQCH7oNvCxybVgCK1GGuOKtRI5S/amsHkMnms4cs4MQAfNr1xygqi2getOlunYt
	22
X-Received: by 2002:a05:6a00:3e02:b0:81f:4999:ae46 with SMTP id d2e1a72fcca58-823412be9afmr3126529b3a.48.1769413724014;
        Sun, 25 Jan 2026 23:48:44 -0800 (PST)
X-Received: by 2002:a05:6a00:3e02:b0:81f:4999:ae46 with SMTP id d2e1a72fcca58-823412be9afmr3126506b3a.48.1769413723357;
        Sun, 25 Jan 2026 23:48:43 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8234fd9a5a7sm1223418b3a.63.2026.01.25.23.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 23:48:42 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 15:47:54 +0800
Subject: [PATCH v11 2/8] coresight: tmc: add create/clean functions for
 etr_buf_list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260126-enable-byte-cntr-for-ctcu-v11-2-c0af66ba15cf@oss.qualcomm.com>
References: <20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com>
In-Reply-To: <20260126-enable-byte-cntr-for-ctcu-v11-0-c0af66ba15cf@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.org>,
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769413705; l=6192;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=iOBlKE7wcNNqdQg697EHs/307n7EmzHjJxd5G5rMLIU=;
 b=ru4rBEls9TKgFexG6YSC8o9GwR+E4SQnSYPxvf6VcG/iS6eyoEXXLZhgwyRXMkXb125QZPGn9
 aHQY+jERHp8BxfLZ/nFr4OGARDp8ZygOuKu0thZkz2N8lCOlOxxrhqy
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA2NiBTYWx0ZWRfX1K8tZWJe7pD8
 re1/xP39fAVMhOT+vf0J0vAWan2sL/ZTpo+5tyDdjSpkZObCKnC/3krlrX545jLh8/of8VoCtTL
 9avwUOE8Gu0puhOVzm5uT6l80tX+3e5jf39QbXtOXsfbBFdLVGDCaJZqfUxc8yTpg0qpA53rAAt
 kCxkznqc8f35m+a0wuV6ek3n7iZNctsFPYa9PcrMh5Wi3myHxq7oxLo1JApozdYer7ZVbI5DYvn
 HjL8elFKB3U4s6dhpSox0NmspMUxjpO7tgFOsAOFfcmxALzEGWLLo2gyW80EHLTlOWPnaRD9H1t
 6XlNWE36IMInOJiLlM7IqYqQ3LP8mSO43m95drLP7mSTtFXd3WP2lkwGF/QDFiObB3XCxJNNqJm
 g/Bq5xOizUW7+K6Hi/N+p+ThO1hJ6pVgw4RkxLTqpRAb1MILdY9nksYryw57zpOwJ9yXwQCdCjI
 yJdF/kVyriU8vHBjc2Q==
X-Authority-Analysis: v=2.4 cv=RIq+3oi+ c=1 sm=1 tr=0 ts=69771c5c cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=AScg1gZdVb1XvqdcXssA:9 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: c_LuV8LspZnF7YG5aVm8_BX4_wW7xAlC
X-Proofpoint-GUID: c_LuV8LspZnF7YG5aVm8_BX4_wW7xAlC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 adultscore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_234845_369186_9FE3CD6A 
X-CRM114-Status: GOOD (  27.56  )
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
index e0d83ee01b77..cbbb15648fb7 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1919,6 +1919,100 @@ const struct coresight_ops tmc_etr_cs_ops = {
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
+		new_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
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
+		new_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
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
index 95473d131032..9b3c4e6f0a5e 100644
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
@@ -243,6 +256,8 @@ struct tmc_resrv_buf {
  *		(after crash) by default.
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
+ * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @reading_node: Available buffer_node for byte-cntr reading.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -273,6 +288,8 @@ struct tmc_drvdata {
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
+	struct list_head        etr_buf_list;
+	struct etr_buf_node     *reading_node;
 };
 
 struct etr_buf_operations {
@@ -445,5 +462,7 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 				   enum cs_mode mode,
 				   struct coresight_path *path);
 extern const struct attribute_group coresight_etr_group;
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
 
 #endif

-- 
2.34.1


