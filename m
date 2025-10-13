Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 782D0CCA476
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 05:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aYcq8RLq3GEaww9PDCIrz1x+sabd6SzQwWj1jmTGFa8=; b=W9YazhmMhqnF1y+Dm6ox4HJlNf
	fxOlvqczNhYsP9BoqzfQL4zmlmzr4sohm/jqCnjTrps5C4UksEa7EL5HgjJuNzgKxKk6H9LLGlb8J
	3gv9VXeIjyhIwG1sR8BJBHI1EXSYW4YF+hvey/d7kSA0dQFk7ZarQrFk0YEdmAOPUX1HFIVzyE1o7
	RJDfkY2b6eDvyiseddWPVguv++hQw/3pKcomPisbZOTVKvcVXnOSbGdtLxK6jy8cWbWmFwS54gzru
	uNOoHPsSi+g1bBpzEBWEFW+SXW9L6LcMy6dLEMefgUIfaE4uBIXEoYD6YyjERf4YZiTKVmuvHSFq+
	JRsnEoGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8BRX-0000000CIBM-45hJ;
	Mon, 13 Oct 2025 05:49:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8BRV-0000000CI8t-0lmh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 05:49:58 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2nJE8011079
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 05:49:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aYcq8RLq3GEaww9PDCIrz1x+sabd6SzQwWj1jmTGFa8=; b=L7M9vKm3cLrNv08R
	1/VekvKguheOHvohgBD6dEOGXH/aUf4ZolDD1AIwmnXQfUoayK16pAoE0XWlrydS
	MJTFtq3wXwziCFMVXxUl7rpId4JjOLpC9yKOV9jewd6DJAqhERzMCFqp5Mb9Yo5e
	IlSfa/462SEQ3lwkCAiFhBvQYqmR4w/zykaT+KqQViLsLc6VDP0K/A91AZ0ACwMU
	Me2AWp9AhxDJcmJJGw0MS0w/LjVQCy3ukTAh/Pw5SK2IZKO2ZTLOeux6brBOBmV7
	Aav7mAJXYkBqkcXlR/LYuZhWogO0YmQ7WGtgSBA2LdPgUjSgxwT+TJvKGpTVO5Md
	94/onA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0buat0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 05:49:56 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b5529da7771so6261331a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Oct 2025 22:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760334596; x=1760939396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aYcq8RLq3GEaww9PDCIrz1x+sabd6SzQwWj1jmTGFa8=;
        b=Xbv2i6oYL1gSsLScNhlHv3AddAuDq2+GAqla5m80nYVx/0TtV+/h+B7BseMDx9X6g6
         VE7xLBycZGiH42D/cF4kehwtHRaMFjhfdxgqCKX6YKlpv1Jm9w6G4zHnhGm38BwGXEZe
         Vq0z6VI54jZdBnuKsaDecs7fjVEc38QEMR8gbWL/iFIKDp/ZyS04hXMwm6vjf6SjdxCz
         2S10TILvDifU9AE8rAyXeo2GNmpqzH6jR0p1hHVdvsE2EguE6f9mLr8O/6pSTzZixQdb
         6oMDYQxcHzUTjrO/oFFDiPT9GnScJ+7HbiFFIKqI+N1wRzIGocATD39Fydtubh2XJClK
         5NTw==
X-Forwarded-Encrypted: i=1; AJvYcCXOqyWBc1OkOGdFyB/4n4np0nEL5pSjY9pQwUTooe/HgtglGa0WPKin+bia/yXNYff4H1omwBDT56WfvIf+xmJo@lists.infradead.org
X-Gm-Message-State: AOJu0YwJPNzc1mJ3nL7Xx0mGPr3Ls7sFPFhtlMNFz+8DR7UfQDSsddbe
	DUnocKXNEqRQV1XTm1bUn+REEQhqVQ2Gak46w+zDxti/+PVg+NkPy0wM7740w8aOdebVFtWm7Cl
	0sjFd6mCSaR3eNo4suKDHGPxQc1vPNgwv3Mb0p3j1O1MEJz4l3rH/pc7DMjqL6WI9kogWr++DhS
	+W2Q==
X-Gm-Gg: ASbGncv9TP9tzJf/q85ZsvXjIcOm0jityL8jicJ7vXHaLmpEwphGfy5nCsiQFAIpbXu
	YSm7e3vEPlKFpG76+mq86dNZgRAW4TK+PosfoIvSqAlhcYlW4rOVZOLkSEizHl4J4QxGvDaXkNT
	PkzxNZt6ICSgzVYMEm0PcFHSZU7y9xfpIT6jHZavJzy1rNV26RVUwL5a9IW2rYXf3+nDugnL9wu
	vyVA5Suku15oz3h3HhfbLlvae8BrcMaTo1oqFJrO4WXjq0TkBinRWFDeIDN4LaMg7WyvzTvVkHB
	P+cgCzEnVEc4a1kJ1fU5EBh+HsAeChw0U8ioy5ZR9ctLnfJVhY/SwH4PZ+ln/+7AeIgx+K9Z4wF
	j74B2yzUPev3+7jIjznMgkQL2LZk=
X-Received: by 2002:a05:6a20:7286:b0:249:ba7b:e361 with SMTP id adf61e73a8af0-32da8511961mr27030252637.49.1760334595858;
        Sun, 12 Oct 2025 22:49:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7LvePajPfCGBrDB3UBpDITIFqXGX2Q3RL9cwCvFyt4LKIBynMkXTnqxbMSG5t5Ee+JQLwOQ==
X-Received: by 2002:a05:6a20:7286:b0:249:ba7b:e361 with SMTP id adf61e73a8af0-32da8511961mr27030214637.49.1760334595339;
        Sun, 12 Oct 2025 22:49:55 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e1336sm10129898b3a.59.2025.10.12.22.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 22:49:55 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 13:49:13 +0800
Subject: [PATCH v7 4/9] coresight: tmc: add create/clean functions for
 etr_buf_list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-enable-byte-cntr-for-ctcu-v7-4-e1e8f41e15dd@oss.qualcomm.com>
References: <20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com>
In-Reply-To: <20251013-enable-byte-cntr-for-ctcu-v7-0-e1e8f41e15dd@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
        Jie Gan <quic_jiegan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1760334567; l=4084;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=L4bB/4x9HRGWluep/4LcqZEwsWYNFYbPF6SpnxWAKBg=;
 b=hKsJBah/TFS6zLR53QjFr/ajQFFUd4v2fpkqyLlBaw5PA4yQViDQwvJ+UgUySjQUjd0rlOaLB
 XPLMactZz6nB1gij1laeF985/O8gBYK4dbrq5AZy0GsiMJLZgSa99iE
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: MAsIzUu2mnFnhPEEAp30NznosOOc1H8J
X-Proofpoint-ORIG-GUID: MAsIzUu2mnFnhPEEAp30NznosOOc1H8J
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ec9304 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=iCabL5HRm4xHoUrnq98A:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX3Y2W8Rfv0bZY
 smBa0IFxzLXeKwvp9lqwDCumw7xF6G7zqSHekRVvFgZP2QwSh/N7uWfmJxNEB8yW+WiJ79bmHmE
 fHh2l/L1o6lq5lGQPlTR+qqXPEJOFXoWhzDpGsu3kO/5GSWUHjcu/4fkJM2PNNzgtChuDGPNSZt
 K0s6cK3CJ+rwxc2JvjgODSwOiNTh0H2NV+YPkqTGfA9TcrlqMy4mrF+abxClevBECx7SQNXA7/q
 fmdZCVdPiCbNGJ8drHfdQvmwJvGeRcRxphKJi89y3Ohg7KjWVGCB7HAvLry2fmY2cgfazezbdS6
 hy8LKtZtBlFYvc/KqsEEZLEULQ32Jigj8C7fRMOCLoV2v928XC2/P9H00X5q7zuhvQ7uTfhGxmq
 5BYTaPIZu6PwlnB6raEw5sdU7EZxsA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_224957_233323_BE784E38 
X-CRM114-Status: GOOD (  22.29  )
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

Create and insert or remove the etr_buf_node to/from the etr_buf_list.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 94 +++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  2 +
 2 files changed, 96 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index b07fcdb3fe1a..ed15991b3217 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1909,6 +1909,100 @@ const struct coresight_ops tmc_etr_cs_ops = {
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
+			ret = PTR_ERR(new_node);
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
index 3a6484998530..4bfb3db44482 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -461,5 +461,7 @@ void tmc_etr_remove_catu_ops(void);
 struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 				   enum cs_mode mode, void *data);
 extern const struct attribute_group coresight_etr_group;
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
 
 #endif

-- 
2.34.1


