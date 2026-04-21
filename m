Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A7E7F89256
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 10:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DJZM/77i0yGGMCL2KJnRcbvCvNEOZWU+yEvuuZpru7k=; b=UBP0Y7rkJiMySPIxmG9dhYGdRH
	b+g5tXvc2dBUXs5+NKZ/11QIFCfF1faBU5JGDBJ++KBzq9WHAJrFKuaf3npI2dUWRURofJmRwTRSO
	GJmgoezuthH7rKbeN5ur0lNYu0tI5JXqTtEXihmkKYuY/FRs1WBgRQdtYWX/gRE2fmH8pDj4UTm2D
	qSG5EnwSILUDDHoc6E6H9g4TBS5Wg00np2Loh7VrUhLg3VsGSouzlHnkyuuQ9m417Hx752EU8jK3X
	Ke+LedKpSAttgMLsxxEeY15kIyA8+O7LDHgLOFRoMPwGpY2RBxCKCcTFnxO/YeaJJBtAFj38XycKq
	LQKXaCCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8mU-00000008Tew-30gv;
	Tue, 21 Apr 2026 10:56:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF8mS-00000008Te9-1XsK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 10:56:37 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63L6ePmn3574133
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 10:56:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DJZM/77i0yGGMCL2KJnRcbvCvNEOZWU+yEvuuZpru7k=; b=l6hYDJHLkmNNE+GS
	g6KaCPFJsgaUkgjl1iwwY33LEpG44Ya8nAkMOTJBme2Y2zwIU5CPLQN3kG3l8Rog
	lw4DfXTIQT0PjJKVAsmYmjS+p7NZgHP/z2Lk9E0XzKWAyomTZQrGCeLJQL8sjfXA
	E3NtkgtlghVXhkBEK4ckgyAMhlYTkO3WnPBa2p0BSQ75CyqXiwtlZ7saArV3bQ7U
	OSXtJXOPhA1fN4Od3ElbA3LjTSbACWEU5ApWa2xuZWB3WiEvkf7gUN751hCE+QmN
	XYvpSnSlOVY772splMdLMERUfni8G4RYE7lPvony3LEygDMOrL2vnhJpxdvtbSBU
	OLQV0Q==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dp465gxqs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 10:56:35 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b630b4d8d52so2167503a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Apr 2026 03:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776768993; x=1777373793; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DJZM/77i0yGGMCL2KJnRcbvCvNEOZWU+yEvuuZpru7k=;
        b=DYMSCwIrYIVduO8Y9pDPdq4n8prBtQ9POMCB2yHxK3bk1WGogwI+9RzPn047xabCYD
         +nnl0BZannWSE+/BkNt91UcXE6Ver26Wa71jQhgLpwWfE6EhV/oTr9Io4yXFCw+76joX
         Vxy4941KNvGWlaoiP609gHIsQDp7DuitbVni4SNAwrT4D8wMFFiDl+MTn1Us+WKnXJW4
         +B0SvJdOaJu7T4u5XtzM0nPeVFZ36ruYGQhYTEncZdxLrlJ6ARQYv5b8YwZq3on6v/b9
         KRVTkFnwsTHNhs7p5gW1lkvbuAhw34tO3EJ0jjA+WzLZQW8YD5+oHTShDErUJpHyBm8L
         J2zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776768993; x=1777373793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DJZM/77i0yGGMCL2KJnRcbvCvNEOZWU+yEvuuZpru7k=;
        b=SoDku2ITBWjFX/OwVglaKv2lwCgCpfLW89HHRp+ECcC5iNgRYUdnAT+g/p2OzSf/AJ
         XoGgqRhC12CF4HtyY2lr0PMMqcCQlu5nbUwhp0ZQsCpSImhPGoQxguUKpb+vkRTsPpnD
         b3jKbOMLHLXELKgRkCgNmfWtIw03sZ53r0/CpCX8VRTduUTP+mKKw9ONuRxl2TK3sb+n
         pHjs3hw3Vhczzu5oeV1v4wiiJUcCTfXlj2bQ5BNTnyND7GsXtwqIhpqJmhwIO/nhL6JH
         eQwLgqOci/rphf1eXEHQ0ZV/g/ml7VWHzfpx0mH9e6elnBqVjMOF/dIdiG9kOuydID8L
         JLYg==
X-Forwarded-Encrypted: i=1; AFNElJ8pxjiHfPvTyVexOP3VsDHghdHSYEbkmzE/AaBe1eutTA/jlUZfB3fOYxJQ1G93aY7rL0vrl0LT7aF56ymJ3UvH@lists.infradead.org
X-Gm-Message-State: AOJu0YyIXUyc76pcEzns8A9VIUK3UGVPo/1e71RvfJVys9s8TjRvWSDs
	1rwJp2vrnYBw1/Mcqf7oX/FL4W9Y5eyB1uOyKsxrxW3WrlhL5fg/VpxB/Cc4bcbxj4T6Rm/7889
	ZppHYzgBMLRlEWfKeT/CKOp1XypE91+tVSuBMBY+yU7P6L3vIrB8HPGEB8+xdvpZH3gOMuo+7/0
	yGUQ==
X-Gm-Gg: AeBDievIy/p8QUIn+c7kGMKaiGDsIAPslUTTS9l4kAVgRJJWTJgCKoLfgKhwi+E9wnw
	u6cs4iNyyXdsJm8Pxz79xfhlPhyNsxFbWjp/o4TE8c+YMuvojwKRLEMF4dikz7UYpcY2tPEq0RV
	ofraCFswxNh63hze6LO2uELJEehHHg96cobOxhlexxRGmFClNESats9miffyDkmy7x7KsSxch/D
	a9qsdFRsy9O1MyNs1qpFkMFB+3J3Rd+8ZBNCHSOWLDY7Ac+/fLPJh56La4dU3zNvH00t3WcuOZc
	cOaUoeycrzbXF4yXKJmiNRE1Xzdqehs4rrarj2Sxpm6ojxLjFXKdmegO7KBvvxX/Sgi83G8vDSV
	eqdwmpFNQeiUL2fQbS/qOrzwxlzZIVq4IqiC/0Qc90Ax6XeeZNXFFnKRUDPZ618xL8x89eIBLS8
	xwzIg5pJgkFELzXo3nbG4=
X-Received: by 2002:a05:6a00:340a:b0:82c:ae0e:dea with SMTP id d2e1a72fcca58-82f8c8c39b8mr15944365b3a.32.1776768993151;
        Tue, 21 Apr 2026 03:56:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:340a:b0:82c:ae0e:dea with SMTP id d2e1a72fcca58-82f8c8c39b8mr15944343b3a.32.1776768992628;
        Tue, 21 Apr 2026 03:56:32 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e982fd3sm17077339b3a.10.2026.04.21.03.56.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 03:56:32 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 21 Apr 2026 18:55:51 +0800
Subject: [PATCH v17 2/7] coresight: tmc: add create/clean functions for
 etr_buf_list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260421-enable-byte-cntr-for-ctcu-v17-2-9cf36ff55fc0@oss.qualcomm.com>
References: <20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com>
In-Reply-To: <20260421-enable-byte-cntr-for-ctcu-v17-0-9cf36ff55fc0@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776768975; l=6212;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=Pfl2LKxPOQb/ac7N9QZFTXlGhGaac/cCYyoTMz4qpIo=;
 b=DgDOejqKQhCI2nwimlAlmoNygLDk2TZVQ29ul84szOehWNh96uLe+mHzGpAcgz5HP0r4TksCu
 /bm0DZ7g1uDC6NaKIk1GMN8vB2kMPqEdGI/CdBi6njNx9wEMhQbUrCz
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIxMDEwOCBTYWx0ZWRfX/1Yf3i0SLPsa
 JjGV6n14ARc/us2mm5qY/hr1CD7C02gsVPACq/vgxjRiGeUd0XEczfHLmNior7BHhkbQfSN43bY
 f4T5tmzzfrVbOhWDj2cEhwyhCF94ItDJWXkXC+7SWcuTUhRaseCrJ27NeNsxZ+81BsQSnS4FyRA
 lqjHad9+cRRhEZmbk9nXxU5DGB2H0qgbbJ9eoCTrHCl9pX2arfghchEKhctPYYcdqFSXKBQ1x2y
 QcnUNuROnGmoX/+UBEHa8QPsscLXWLVIYIP7ffNCDinBxVqb7ksUcsVFoafXl+II/LxXUwBkSL/
 7Uv76jND/EHiuomxnGve0zVEPBu/z/AXl0SLyteIo555p3qusFjjaWGhlsKJQn6yZlT0EePc3Y4
 XU5Rhs96XzGI3EAfz1JxZg7PPQFP91niqHwRNOt7OAv6X6HXJmJzTPQtowN8y9YX+rrZY4wvyss
 Vr4RZGeNR8u1EOk6Ogw==
X-Proofpoint-ORIG-GUID: x3ED5U0MOlUWWpdRGExPpSWS5zfuvQM5
X-Authority-Analysis: v=2.4 cv=YOSvDxGx c=1 sm=1 tr=0 ts=69e757e3 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=AScg1gZdVb1XvqdcXssA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: x3ED5U0MOlUWWpdRGExPpSWS5zfuvQM5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-21_02,2026-04-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604210108
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_035636_574834_316CC7A0 
X-CRM114-Status: GOOD (  28.34  )
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
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 99 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h      | 17 ++++
 3 files changed, 117 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index c89fe996af23..bac3278ef4dd 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -835,6 +835,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = "tmc_etr";
+		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
 		desc.groups = coresight_etf_groups;
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 4dc1defe27a5..ac704617097c 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1918,6 +1918,105 @@ const struct coresight_ops tmc_etr_cs_ops = {
 	.panic_ops	= &tmc_etr_sync_ops,
 };
 
+/**
+ * tmc_clean_etr_buf_list - clean the etr_buf_list.
+ * @drvdata:	driver data of the TMC device.
+ *
+ * Remove unused buffers from @drvdata->etr_buf_list and free them.
+ */
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf_node *nd, *next;
+
+	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, link) {
+		if (nd->sysfs_buf == drvdata->sysfs_buf) {
+			if (coresight_get_mode(drvdata->csdev) != CS_MODE_DISABLED) {
+				/*
+				 * Dont free the sysfs_buf, just remove it from the list.
+				 * drvdata->sysfs_buf will hold the buffer and free it later.
+				 */
+				nd->sysfs_buf = NULL;
+				list_del(&nd->link);
+				kfree(nd);
+				continue;
+			}
+			/* Free the sysfs_buf in coming steps through nd->sysfs_buf */
+			drvdata->sysfs_buf = NULL;
+		}
+		/* Free allocated buffers which are not utilized by ETR */
+		tmc_etr_free_sysfs_buf(nd->sysfs_buf);
+		nd->sysfs_buf = NULL;
+		list_del(&nd->link);
+		kfree(nd);
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
+		if (!new_node)
+			return -ENOMEM;
+
+		new_node->sysfs_buf = drvdata->sysfs_buf;
+		new_node->is_free = false;
+		list_add(&new_node->link, &drvdata->etr_buf_list);
+		i++;
+	}
+
+	while (i < num_nodes) {
+		new_node = kzalloc_obj(*new_node, GFP_KERNEL);
+		if (!new_node) {
+			ret = -ENOMEM;
+			break;
+		}
+
+		sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
+		if (!sysfs_buf) {
+			kfree(new_node);
+			ret = -ENOMEM;
+			break;
+		}
+
+		/* We dont have a available sysfs_buf in drvdata, setup one */
+		if (!drvdata->sysfs_buf) {
+			drvdata->sysfs_buf = sysfs_buf;
+			new_node->is_free = false;
+		} else {
+			new_node->is_free = true;
+		}
+
+		new_node->sysfs_buf = sysfs_buf;
+		list_add_tail(&new_node->link, &drvdata->etr_buf_list);
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
index 319a354ede9f..6e994678f926 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -208,6 +208,19 @@ struct tmc_resrv_buf {
 	s64		len;
 };
 
+/**
+ * @sysfs_buf:	Allocated sysfs_buf.
+ * @is_free:	Indicates whether the buffer is free to choose.
+ * @pos:	Offset to the start of the buffer.
+ * @link:	list_head of the node.
+ */
+struct etr_buf_node {
+	struct etr_buf		*sysfs_buf;
+	bool			is_free;
+	loff_t			pos;
+	struct list_head	link;
+};
+
 /**
  * struct tmc_drvdata - specifics associated to an TMC component
  * @atclk:	optional clock for the core parts of the TMC.
@@ -245,6 +258,7 @@ struct tmc_resrv_buf {
  *		(after crash) by default.
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
+ * @etr_buf_list: List that is used to manage allocated etr_buf.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -275,6 +289,7 @@ struct tmc_drvdata {
 	struct etr_buf		*perf_buf;
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
+	struct list_head        etr_buf_list;
 };
 
 struct etr_buf_operations {
@@ -447,5 +462,7 @@ struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 				   enum cs_mode mode,
 				   struct coresight_path *path);
 extern const struct attribute_group coresight_etr_group;
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
 
 #endif

-- 
2.34.1


