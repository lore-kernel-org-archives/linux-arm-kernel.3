Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0755EC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 10:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iioHZAmwo6hVI3zR7ywnoptK7Vb4ysh42C1NxdoaAPI=; b=hjVnXfBgoRCq0CctQOJDeB1lXC
	J65yqA8G2YOMTJGZ9I2KL6/KmZ2lfXqrJYAK8cPW2Vnf/JfXPf2bi5OfUB2Iu/Mwe0XutdGq4tWna
	b6SmYNHCIggqVMIx6HKnAtihvNkvqEkTFPGZJvDdx2EFrEwo4EQgLro4g3+9YxAlZ4XBv7ZF0egvP
	rXGmiaVsun3PJ5fgSjFte16QExg8LKx2mCJlx84MX5T9VPrWV5qfyG2g+CFSa+NziBeqAxSJRm3g+
	duesriyC2+IUggjoQ3tw3zrF4xdpYenWvAgRpEQSt/seQ+VwrkBd6W51dhZ8wBxq7nAqtE18IncYp
	uXE2havA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufG04-00000009dRp-0vXt;
	Fri, 25 Jul 2025 10:50:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufFLp-00000009XBa-1FlV
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 10:08:30 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56P9PWSG015932
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 10:08:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iioHZAmwo6h
	VI3zR7ywnoptK7Vb4ysh42C1NxdoaAPI=; b=CDNvYbQcGhtKLx9YYOO5H3V+Rtq
	c98QbHIIIwjm5AUAo/pudKMnvsbjfahJr6CsPc9XFLGkLU3Q0D1PwwlQS419TWgT
	XopKBIMU5AUrdi4dAc9NpevFtCG7z0sunBbXl60m/ffddRhxSy5JLqw/Mp5VIIGQ
	Wj6UqKq6ZNSmrVyQV51Vr3Be8RXyhF3WqVhL6ZB3n7zWnR9tQH20AJbR9khJNF6f
	hh2ELWVzGXc62FmMsE1lLcdR6r7hI2atoQzfJ3oUaTfUVg+8sOc2rhl8J3VRsd0t
	v1Z27QvGHOmAaQfMZi+T8Xic2qSUeISxAKLfIHgY1/rL+eYvkpIlsBvCq+w==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 483w501np3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 10:08:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3138e64b3f1so3164869a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Jul 2025 03:08:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753438107; x=1754042907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iioHZAmwo6hVI3zR7ywnoptK7Vb4ysh42C1NxdoaAPI=;
        b=kadjIRhk9q7A+OkRPPqOLkpGvJ9lZaBvnCoZOgOpaw3vpGxa4dMOfJXnk1AU8sosgj
         Tj4ba5UMXv2+FsIqcS3eWJmtXaDzvde/F00IPfchN9r7MbG+ElY9yaU13keMVMNUPcsS
         FxkHV+mi0TWh8d5NAcZ8E9CImgrkaUmb4dMaqydapxRJ0LBwse0PpEu/1kKEZYP56JaW
         YhW1hlaUWzGgL3NaRM2odXuQCb7pjRKu0nSTIRz3JR0q+liitqwl5MKl0jjGBr8AytlQ
         N7VkjuDYSmYMjwRvwFx+y6xM85iXiKK7cW5iIEiPq9j96MvxnxZpevp12ldw22tETOHf
         OhWg==
X-Forwarded-Encrypted: i=1; AJvYcCVUDRu+0kBQcamlWnPKddlxcmJEvUgDF1UsXd8DMwp63cGBD5vX4hQqxDu6x2ThhaTbLB5Bf6woWhR6cwFAuqz5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6vYixMAtD1MvJN/Z4swCLS6KqzcBoZRqx8mFOa9qgTCUcIF0u
	et9D9DmfSHZgBRhCjjTsS8oVwixATgNwznMpV3cs73Q8ucO8LnFsmMSbXMz2lL/FwtaAa4TC+H/
	O4Q74T6KcJrysDdRnI5hhMzE1EGLpOmtMx/bErU1S3XgvnQPFbX8XC7i0IS+W0K7L08xCUOzLds
	l7+A==
X-Gm-Gg: ASbGncvA1PlhmMMiQGoLHLGwr87J2l3MVpnpBPMjamXfRGEek2LIijQg3QJjCJQw6lQ
	Fi62sMwLsU0GVC8BfpasvVrU33ukFrsUgCywxhGxD4+s/bH4fafNMt/vrUpsj9zrr6QzyGKEK4Q
	0I4ryv3eDl/8261GpbNACDMgaQS/7fStItodAE626vFcZfIXSAJYWHD2vTgWhlxHQhye8qKVWdx
	qoxB43yTdC667cDK8ywzzQuW4nZJ3rew98q84izM35cjEndAaClwUKxyKd+4PKmeaZM78rHfgRm
	iCWGSfXoU8eWBbKsmVnMU2ec+bvxaCIt2AnHGjfnWi2jBgxJzu4Hx+gVHtGZGHMoY1p9Qwi2JRr
	JxmM8QAMcB5Prjof9tqw=
X-Received: by 2002:a17:902:e891:b0:236:94ac:cc1a with SMTP id d9443c01a7336-23fb3179530mr21392095ad.27.1753438106758;
        Fri, 25 Jul 2025 03:08:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYXuxwAizhGCHBsUFAQoY3a/Si1ZEE+tQGtHTUl73AhqAID/L4Somkm1pNUofePJE1ndnHaQ==
X-Received: by 2002:a17:902:e891:b0:236:94ac:cc1a with SMTP id d9443c01a7336-23fb3179530mr21391735ad.27.1753438106353;
        Fri, 25 Jul 2025 03:08:26 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23fa48fd29dsm33641435ad.176.2025.07.25.03.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 03:08:25 -0700 (PDT)
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
Subject: [PATCH v4 03/10] coresight: tmc: add etr_buf_list to store allocated etr_buf
Date: Fri, 25 Jul 2025 18:07:59 +0800
Message-Id: <20250725100806.1157-4-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
References: <20250725100806.1157-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: E5z2yQze4FxlY7JXtntpE3XwYiwB-WSz
X-Proofpoint-ORIG-GUID: E5z2yQze4FxlY7JXtntpE3XwYiwB-WSz
X-Authority-Analysis: v=2.4 cv=bKAWIO+Z c=1 sm=1 tr=0 ts=6883579c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=ORm1qb0EFYpRwVLUulEA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI1MDA4NSBTYWx0ZWRfX4XXkZ0SLOHlP
 3hO4fAtyzvWpaEPxK7755psNjAI4xCepi6XuD18l/YVtVh9+fODpKJk0HERsjTvMfgyTlhcvsWS
 y7V2N3oJ4oiBT5hdtGSDkQWPGwS3wlKXpaxHERaZTx7zVVZAIeBt02xG9Es6eQosni3CgJN2uOu
 3i6LvX6avEPnBpDEZvZPbtlhRCT4cAXSJuO8QscUFnHvo15a5yAhCwVu8B0sIq/gl9Mbe2P6Jtf
 l2+KPkFUi1ARbVp7+RDGsaE9jLMLnjmreSpswT4yOrUu9U61y6YN//QNWwYxQwmZSPNn3BxUo7e
 86/4PNz47NyFDXnIwrLGsB9YR/cwAvVp/TggFjUimr21xwyb4Ibj1m1TNrLJhUxfgw5VnNXD953
 VBoGsCZBr8Yc/aMWK7OiRb+DJZRdK97OxFdqrKBBDpKjkvhqh27S3D5H7GocHI1iRmSoER+j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-25_02,2025-07-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 clxscore=1015
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507250085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_030829_456986_1EE6B6F6 
X-CRM114-Status: GOOD (  18.53  )
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

Add a list to store allocated etr_buf.

The byte-cntr functionality requires two etr_buf to receive trace data.
The active etr_buf collects the trace data from source device, while the
byte-cntr reading function accesses the deactivated etr_buf after is
has been filled and synced, transferring data to the userspace.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-tmc-core.c  |  1 +
 drivers/hwtracing/coresight/coresight-tmc.h   | 19 +++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index be964656be93..4d249af93097 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -830,6 +830,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = &etr_devs;
+		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 6541a27a018e..52ee5f8efe8c 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -208,6 +208,21 @@ struct tmc_resrv_buf {
 	s64		len;
 };
 
+/**
+ * @sysfs_buf:	Allocated sysfs_buf.
+ * @is_free:	Indicates whether the buffer is free to choose.
+ * @reading:	Indicates whether the buffer is reading.
+ * @pos:	Position of the buffer.
+ * @node:	Node in etr_buf_list.
+ */
+struct etr_buf_node {
+	struct etr_buf		*sysfs_buf;
+	bool			is_free;
+	bool			reading;
+	loff_t			pos;
+	struct list_head	node;
+};
+
 /**
  * struct tmc_drvdata - specifics associated to an TMC component
  * @pclk:	APB clock if present, otherwise NULL
@@ -242,6 +257,8 @@ struct tmc_resrv_buf {
  *		(after crash) by default.
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
+ * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @reading_node: Available buffer for byte-cntr reading.
  */
 struct tmc_drvdata {
 	struct clk		*pclk;
@@ -271,6 +288,8 @@ struct tmc_drvdata {
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
+	struct list_head        etr_buf_list;
+	struct etr_buf_node     *reading_node;
 };
 
 struct etr_buf_operations {
-- 
2.34.1


