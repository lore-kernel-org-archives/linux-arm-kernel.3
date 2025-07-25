Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A524C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 10:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2YqOEgeLutSX9CVrpfaHefC+VimpWLWmNeizWKJy0PM=; b=UweUEoep3fFzwkhzBuGY6TFNoj
	1TVXS6PnXlSzawoki65t2YOUahcjDqlUuUzMNR6b+8AWliTER1q4/lbfyvkcK0HeA2nOnAP1Ig3PY
	QhaguyelkkPRvXRAzHSQfFQgkCMEHalLFY7noonJquQtJvON9k4ewKXvsMf6NDSl6URBa2bskOynY
	w/m5tc3EZYWwj5k2cF9C8YnE/ApfWMwv4YWVFdwkr49815e8sBhggKnaUqbDu0HGbA5pWSOd51TlN
	1258HHZH7BzvSzIXEWhlbRLU/2E/novrq1/0CyA5vvGbAsBuOniz7WjluQaE73HxL4kQ2j6YlhAzW
	MlitvWsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufG2V-00000009dkq-3xXl;
	Fri, 25 Jul 2025 10:52:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufFLw-00000009XDO-24lu
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 10:08:38 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P9W0E4023666
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 10:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2YqOEgeLutS
	X9CVrpfaHefC+VimpWLWmNeizWKJy0PM=; b=HluR3SDNJWRBzEi0txvIu96SH43
	eH3L0CjTahw9/r6tkys2e8YoDzF1hOgQxI92V1SobmDf7/b9DUUZ5+3PPtRGSC4R
	5n9WsM4YWCwLxhqDrcwS7k3NQuK/QCMSs1/3PRkee2Akw/I8dkuEcEGQMKm7lp/M
	WMlDy6JnzjDYgYCx54faUfqxXnCLRVyKL1HxnJjMusY/j46fqta0zh1FIPhtIQSS
	aYrbVOUhaUcUqYTkGX2emBzyb2uNH/TPiXcUWIw8uh6VAUmesY97fVPABLQlH9t7
	ox7+4mP+BcgpE6I8GtdqU8MLKlXBXeMGUqJZdc7EySpMx9nRIccij+mXGOw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w2r9p18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 10:08:35 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-234906c5e29so25277875ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 03:08:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753438111; x=1754042911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2YqOEgeLutSX9CVrpfaHefC+VimpWLWmNeizWKJy0PM=;
        b=CMjDpBsTPTb1tVVKTc7rGbUUtJMcd7L8bnHah58wtGvb18gC3r464X9gCJqqJlO7fp
         +VCs6PqYsCJUZZAsL3bcr7nGfjELC24tvL3yCT3bz56fE0woVI5gX1F2Q2sh4bIGHyF6
         je/z49JnrSKMyrz3nPvKzzi2l6p14tKuEy8nCH+K3DJIIwfw4DACJaxkSSJWtT+hyOqo
         cIGrra0V47csskkQb16LD0XBvhBOdnjFpoRmnm+NSZ3vKvLS7HWcYIcqR1qkw0oIcLyw
         m4O8eUsZysgfHJQZ70r66CAtWveIs7+yCIvQv3sV0YXlex4E4GSIAM9yD6qlFJt2Sgtr
         MNrA==
X-Forwarded-Encrypted: i=1; AJvYcCUFYPBkQ6Xwuut5P6mMBzdcS8jO0KbuQqDPWSHGucVqt1/oqnFLBTu9uxrAuO6UFmdMBcgpTumJpXFz/e5c1lJV@lists.infradead.org
X-Gm-Message-State: AOJu0YyQHhKRMmY5AV5BFKXfaUmsShB7INqQbzb0EL3VbthbkLFydI7P
	6a5hDSwRZ+pBh4iE9Q/MwZ8x30N5W+4SwdEnNEyUf+7vF/PKvE/KKiebLOXdAf4VEdi0nFx5f5Z
	QqvhKOOBpQdAHyhW9comyNaMUv4FGoDkeDa2b04zOrAuC3hqltNKeeasedhCkpuwEjeGMO7Zu81
	Synw==
X-Gm-Gg: ASbGncuDxy5uBTzg7ZAZF67ZlKkG4LNC1MamM/dxDDbppdkPc4/QjF8o4QxDqL7UTrT
	5IHA3c2vNFumsKdAC8dJmk80tjaowa3TDPEPsw98+feWRqzeWq7D1hF7PQznnbnYI7+L0QKTwAk
	/KR+Hg5eIiDm5iOMeWR1Qty6widVZywLflWmPeRQHyKSSYIoeSv/h3MMkfv8FjpwQ2AgffHniyd
	zCCXSScQNvlsY0InA9oUg3ERlif5DkLLAJ8sMm0cAZ0AJ1cT77gI2+qdnNEEE69A5qf1IyIY6cT
	+l+6EJIwnI89JnZOBFqEuzoj7SDeY3SBY5iujv3XjlvKxaWdrXXbnzfEQ0Q5CvCK5/28wCnwNyE
	ExwVO8HGDtd1S6WJ2ofE=
X-Received: by 2002:a17:902:db0f:b0:237:ec18:eae3 with SMTP id d9443c01a7336-23fb2fd1baemr22232935ad.4.1753438111481;
        Fri, 25 Jul 2025 03:08:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOLZD8/aDWH2qNW5NVOA0ligfQYzNPA7Lh5E8L4mgDT12NfGE3Hpw1sW1jO1CVrShjGA/02Q==
X-Received: by 2002:a17:902:db0f:b0:237:ec18:eae3 with SMTP id d9443c01a7336-23fb2fd1baemr22232445ad.4.1753438111056;
        Fri, 25 Jul 2025 03:08:31 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48fd29dsm33641435ad.176.2025.07.25.03.08.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 03:08:30 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <quic_jiegan@quicinc.com>
Subject: [PATCH v4 04/10] coresight: tmc: add create/delete functions for etr_buf_node
Date: Fri, 25 Jul 2025 18:08:00 +0800
Message-Id: <20250725100806.1157-5-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
References: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NfTm13D4 c=1 sm=1 tr=0 ts=688357a4 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ILCX3kR9VMWRWyEhewYA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: enFrLia9jTKpcvHoo_Plydhd9ucNbqCO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA4NSBTYWx0ZWRfX/sMCGnEI0AVj
 qL+SafHGWPNEj4XBsp4Yd9mkH9qS191S0+Akq3GZjtdQn1upgkBNKpY9F9KA7UIQSSK/VJCx88c
 1Wo3vbm40xQ+Ipe8WkvaDeltdq/DZonBv1A+uaVNj+LTp03TSZUxtWD5B5BpzV4R1pgxVv6rzyG
 v+Vj+KglxNmpmo8kpIFlx/aHuC7mYFpprOFjMw+HyzuFrKt7n4KxyEv8CN6paCeRyqHsyrOZJ4y
 lZ6k2inW1XRks+g6peAL+rTqDZHzsuTvaGw8K7C9uQGJkYm94hhL0Me1CPn8SeLZ6Xa7P8dBGWd
 jFcks9J9f8ooyjvVPhE3Pw+aFVRVDRkGLHLhzua/ya0dlml/YfOoigAtsaHvd4YqTGscrxNFwNj
 N4WVcyu6he24TXQIyPLqUiZAOICHqVAs2cipYu3hlNDW4p+uVYIX6fnCtAlrJiB2G7R/VSUH
X-Proofpoint-GUID: enFrLia9jTKpcvHoo_Plydhd9ucNbqCO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_030836_537559_216491DD 
X-CRM114-Status: GOOD (  21.42  )
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
 .../hwtracing/coresight/coresight-tmc-etr.c   | 65 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h   |  2 +
 2 files changed, 67 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index b07fcdb3fe1a..e8ecb3e087ab 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1909,6 +1909,71 @@ const struct coresight_ops tmc_etr_cs_ops = {
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
+ * tmc_create_etr_buf_node - create a node to store the alloc_buf and
+ * insert the node to the etr_buf_list. Create a new buffer if the
+ * alloc_buf is NULL.
+ * @drvdata:	driver data of the TMC device.
+ * @alloc_buf:	the buffer that is inserted to the list.
+ *
+ * Return 0 upon success and return the error number if fail.
+ */
+int tmc_create_etr_buf_node(struct tmc_drvdata *drvdata, struct etr_buf *alloc_buf)
+{
+	struct etr_buf_node *sysfs_buf_node;
+	struct etr_buf *sysfs_buf;
+
+	if (!alloc_buf) {
+		sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
+		if (IS_ERR(sysfs_buf))
+			return PTR_ERR(sysfs_buf);
+	} else
+		sysfs_buf = alloc_buf;
+
+	sysfs_buf_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
+	if (IS_ERR(sysfs_buf_node)) {
+		if (!alloc_buf)
+			tmc_free_etr_buf(sysfs_buf);
+		return PTR_ERR(sysfs_buf_node);
+	}
+
+	sysfs_buf_node->sysfs_buf = sysfs_buf;
+	sysfs_buf_node->reading = false;
+	if (!alloc_buf)
+		sysfs_buf_node->is_free = true;
+	else
+		sysfs_buf_node->is_free = false;
+	list_add(&sysfs_buf_node->node, &drvdata->etr_buf_list);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(tmc_create_etr_buf_node);
+
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 52ee5f8efe8c..3cb8ba9f88f5 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -461,5 +461,7 @@ void tmc_etr_remove_catu_ops(void);
 struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 				   enum cs_mode mode, void *data);
 extern const struct attribute_group coresight_etr_group;
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
+int tmc_create_etr_buf_node(struct tmc_drvdata *drvdata, struct etr_buf *alloc_buf);
 
 #endif
-- 
2.34.1


