Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EC6C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 06:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gbtexVl8cn7s6dLp3Pk/zhJx463eI0itM2/mzeX7Ixo=; b=hg/uqBFf5KLMEGXtriRAOpnuyT
	i/a3SY4p8Vh18RSZQefJE9S0yUcDErsor3TOKuv3VEIaCrPeM8zis34ozHUHYv2RDDJEN8zW5rzoS
	qjTiiNLksMRLlpHNYAciEHXOoUQe11rCfi9YwxSL5lVhUfPhzMv2uBXn4QLI8VWhuTU/6WjdqRrT9
	yg4HfoM/vlXVJAfpswOdDxKg/XKs6CuK1EgoxUb8Znw1DMFbTAyCmIFvzqeayubOMDf86kVRe2/2r
	t7MxSai9lsCxtFNKM1rEvGW9Q/eJfmnYQodpQYDAluxM0u8E8amg8a+L+hC1pDzXVg73Fccj6BuSy
	mGTOxFrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTxA4-00000004lW2-2zO5;
	Tue, 24 Jun 2025 06:29:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTwme-00000004jHF-3LZU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 06:05:30 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NHBar5006109
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gbtexVl8cn7
	s6dLp3Pk/zhJx463eI0itM2/mzeX7Ixo=; b=Y2Io+6KlVtGgDnl8eTkmBjbzuiD
	vusDMEAoAl/dEprcwBUvXhP1l1zht8LOP3KcxwxSRVOXEVSGgUoBtjE1FOkSiTzJ
	XOxU5gyGVt5lLG6i/1UjVPLcYra480HMDUzd+DLUkgjngUQSP5ruWibU6pOAgqMj
	H/rsq0JBoTafxJL3EMumuOlnP897x2xWj3ozSmHxNb8NkC3VOlOZCpR7X9TJml2H
	mtFF489O8ebMCwkzgOz9bNXKHIFW5bYFqlS++4ZloxpvNiA5AkELs2/hM9EP4U8L
	GnDwG4JKAemJvjfZh9Ick/w9clactHXhGjV6TtSHa+8piM1M1tj829pk6mg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgb0dx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:05:27 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b31bd4c3359so3134119a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 23:05:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745111; x=1751349911;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gbtexVl8cn7s6dLp3Pk/zhJx463eI0itM2/mzeX7Ixo=;
        b=JO9XdOdBbNx09FNZXCheyUL0EezRQTdEiaY7ReWNBoeUabn65SXUA+sbnjstydW+BH
         6sbOMmdYzbAtbLeEoPwjZH/mR/M/ITtiM1FZEOtzfX7/3d2mqTriJD6B05OEUNvcSQqw
         kpTX+36qJM9qOOwu4ze5kHQ2WcKnt8N7tl+LIMWKwlsWerPI1c4zxQyJg5ShIMptPsCS
         i/Qq8Mh62ymwbXlq7lHmvXhF6Raj7SVKAuqkaO9BA+OVYk+Rz1MiffAX2SXp8PaB8RO7
         gGvRlSjFczhg3pYUvG7EqdZpDIpsIDjiZ3o5xv3fgEKuLdIBL0yqKAtw2U56fD0qMjGn
         z1Ag==
X-Forwarded-Encrypted: i=1; AJvYcCV/LbY1EbKD/hh8Lvbv2lQk9W0DugKexCA8bavHxWxlVeVxRum5HipWOZu8vH/qQbLy6WRJUTRlpCyBkT8CnSDJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxA0XEmRjaQ3JpHHo0INQ9SGGzkFf3OttbwDY9MJDHDCqzvIrZm
	MJQmG0/y650X0jYNn/wfwytxLdIDID1RxzNx0MrByviX/5U0zRWyrsFXCVbcoyJnLVgbxmEfPLK
	gorAcFZUQAg0jwub9JOO8yIrp7ACHVc7K/CottSDOy5w3MbBxe+GCoy1bP9Dxot+AQowNgpupc9
	nyUA==
X-Gm-Gg: ASbGncsXMhxXHC+l1bLA3+dg6n6gEAg0894y5DhshZEtAnvjEA3F+jxUuhwD6JxZYQk
	F0PQllq8k7mFxDVLV5jH/J3aXWurXobWjzWMHfeJXu0Vhc1ao8vq76iURbeblh5NkMxKsnvVdmV
	egdyd2+9YMuzHOL8xPghAyhMYX+gY5DHednCj+Kt68eQzMTJGdfhYZjnrX833oaSaYnYNbLSeES
	zpvu5g+T4Cy/TbExFgt/8Guw/oEomhl6U57Xy+5S2GDRb2a9/U0XXSFsNdG+17i+DbgYxVZS6q3
	5eguUArcWrAh6tsC6in5WZTl/EfY8n3K1FVwJmDZAOjPK7AIhoj6s9lo+7fsgGc/iJQtjDkJYzJ
	orw==
X-Received: by 2002:a17:903:1111:b0:235:880:cf70 with SMTP id d9443c01a7336-237d97f8c47mr201278715ad.14.1750745111409;
        Mon, 23 Jun 2025 23:05:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/6alQ8oVUf4oBoB/kDRpinRzRgdoo/fUtBrPtywrip1OTrzz7TjJGaNQaFksnjaq2AYvlSg==
X-Received: by 2002:a17:903:1111:b0:235:880:cf70 with SMTP id d9443c01a7336-237d97f8c47mr201278405ad.14.1750745111051;
        Mon, 23 Jun 2025 23:05:11 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83937b1sm101371455ad.52.2025.06.23.23.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 23:05:10 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jie.gan@oss.qualcomm.com
Subject: [PATCH v3 06/10] coresight: tmc: add create/delete functions for etr_buf_node
Date: Tue, 24 Jun 2025 14:04:34 +0800
Message-Id: <20250624060438.7469-7-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
References: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: tGsdqq-DqrUE3qih0Q6h2RtDHOr1mA0l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1MSBTYWx0ZWRfX6HXy3/3dExjc
 NYcW2drV62FZalnA1HTS3iN5BI/MUI1yrZm7I98Jw3UnmwbQt+y4MyqcvDWceLkLmWFFMtVVBO4
 5guckl9ij69ZIYBlB4a8wf1iSoqol3rTuLwRI3/Bx5ljps8jpa7GBJ+pCmriTmBXZR+pT14Mj5a
 aPDNaRDmYpmwJxjLZRRI8ujJfIQFehDwmVzc6+F0pF2P7LjJniuxIbNo8cuz8EA0Xi8dW5P3Ok2
 GAyh2ZMNRWIb0723i//2KyD3Jg9WguHFu8iUuL1VSC7Ym91nQNhebDrhiaLxvhs8pbh7+X0M5xt
 C5jSHfNSXH+F+25tSoMJdrsb55jn3yfi9Tl0Sk+b0KQtx65AIPcOk63J32LiVPwxkHE5z6E3BcJ
 QDX+etv7rNzjs580FUvFWlmmzGBpZ7DuwYECtE/r70eikwTJHpALHSx5WWpUPDGrRsQ3QMpF
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685a4027 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=k3jFKW3szlTOC2bxmxAA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: tGsdqq-DqrUE3qih0Q6h2RtDHOr1mA0l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_230528_957590_582B7056 
X-CRM114-Status: GOOD (  16.72  )
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
 .../hwtracing/coresight/coresight-tmc-etr.c   | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index b07fcdb3fe1a..4609df80ae38 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1909,6 +1909,55 @@ const struct coresight_ops tmc_etr_cs_ops = {
 	.panic_ops	= &tmc_etr_sync_ops,
 };
 
+static void tmc_delete_etr_buf_node(struct tmc_drvdata *drvdata)
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
+
+static int tmc_create_etr_buf_node(struct tmc_drvdata *drvdata, struct etr_buf *alloc_buf)
+{
+	struct etr_buf_node *sysfs_buf_node;
+	struct etr_buf *sysfs_buf;
+
+	if (!alloc_buf) {
+		sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
+		if (IS_ERR(sysfs_buf))
+			return PTR_ERR(sysfs_buf);
+	} else {
+		sysfs_buf = alloc_buf;
+	}
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
+
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
-- 
2.34.1


