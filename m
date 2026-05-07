Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38BAFCD343F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 14:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dNjLWVZN9ymVqqwg7nxMwcVKTOzZb6j0YCHbt9QKnGM=; b=VbHB7l/LDKy7PHDVZ6ciLTU+GJ
	LwbL8ZwbHJEo++wW9i2v3UN0KWtX5fVK1ADUc4BZy4OAKeWmHoHRKeBcx8byGZHKCAN/ouD+AO7xH
	o5dTsVBETlCaH1UuqsZv1RFof8qHSF1c9OaxkiipASH/F3a+vVWF0WcEjyDDLg5wv6C7tX1Ol/FtF
	XTBshQuowXzQ1H0eWN26EQ94+6+nGkaYHZ1NareJrlfIQkseWJlDlgfaXVJmInbwjBEM29LLgc9Tr
	clB533igw5a5+TK18ucndB5UiBqHxINCRPp8DNlW3J2pW5VaX2MUva39F2h7oSBMMRYt4+ApFqJbc
	ijahs8JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKzT6-000000041ak-0dZm;
	Thu, 07 May 2026 14:12:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKzT2-000000041Y0-32QN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 14:12:45 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647C5Wjp1971630
	for <linux-arm-kernel@lists.infradead.org>; Thu, 7 May 2026 14:12:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dNjLWVZN9ymVqqwg7nxMwcVKTOzZb6j0YCHbt9QKnGM=; b=mD8BaHm3MLAwaIZP
	u5sZcxhdOeMzMDqeR3i7XG2l4WBe3m/MAZ3GdiI2Uv07+VsclECVbd2OMo4M4l2C
	6zgVu7Odiu8kYnvRjcGdfBNcssTZcNPx096Py3UrVl1VAdRWnO9y3fYCl7qNlpLc
	7LhexuBoU1AhXZeR6Rp03CbUHuJFIiFRy2HoURxx/c3Xx162GGaRX065LCUQp+St
	5RTK5bGy7iJJz3RImUKMj1MvCPt1KAO+DpdI++mOcHK1jjxx/PooEGFx9OZdyEOA
	Zxl5MxHKQjHfpHdHyiL8oTDkcNfeQ3m2H3T73jEaM6AolNyNYICo8knZBqBFmYIw
	AheKKQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0tej8fnu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 14:12:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ba3245a43dso10165885ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 07:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778163163; x=1778767963; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dNjLWVZN9ymVqqwg7nxMwcVKTOzZb6j0YCHbt9QKnGM=;
        b=kHTMdwKIuanYIUZ4ULkjCPYoFBpSjLf257bleXHmel3qXnzyJO8PS2B3E6cPPscgl2
         DhZnxudRVCKJuO14Y3AsLiLKRTDl1bz2GYaxK2fL4bLOAHqoSGWVufGjBuZ4RhKI42TR
         dGjOkKPIrsZSy5UNBmJBqTPJ9z06AXns5olM1CBJgDt81xZcpeE7I0NG9N3llz3osfRH
         bsO9STjZmSKi59r71SgCon1MQ4XhEtTiXQa7zMX3TXpatdlk6A0v7ix//iGuHxcCrW7J
         hS4EAJlJLcFD1nFpIsRzRLhvsfI5NALWVSoE/lIul2xGrLWVj1Kl/oOWcVXp7O8uLUsQ
         yBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778163163; x=1778767963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dNjLWVZN9ymVqqwg7nxMwcVKTOzZb6j0YCHbt9QKnGM=;
        b=LfmcQ/qdM/2kv/6zny4JkKYxO2FOBU0ZG6kPGRh0PkbKUK5Y1xpNdCosc5Ol/vro0z
         7s27uHSFb80PrGf18ORO+2WXwXQc+Ox/ZJDmPO6jWN4GdPb91VbmOj41L1chgi/nzQT3
         pWtHd4OFhQR153SLW3MXDLqZkuo0HnMAI334E4jlc6EWqDZjNRsJD+yfcdotI5hIjpji
         jusrtXJmuBXD3e3Xp1FDA6R7i0ZJZ1sRmRTL7LHpwMv4vM9gklYjQ5h/os4m/5lJLRsV
         AJwFx8o9CdMrjgcstdgTA/VWvh0VtluXdLOrqH+LwfQVazIL7xE074UHmEEH406WUbRK
         aBsg==
X-Forwarded-Encrypted: i=1; AFNElJ95zZuFpFSGuV5dHGGDiO6LtS4b5aFdnWhyujQyvfzvji545Y6w/Sp5BA3Rqs6bPRV9y8uCG1AGBu0HSLE5X3gZ@lists.infradead.org
X-Gm-Message-State: AOJu0YzscJjuXglFhSiXUIcU29HHNoeRy8GMPR/MQhmq5xnl4FS7XUSP
	q3msrzVo6ZeHdtcDLm+FhwgulaFGNgam9XVgpd09hvbIYTKC56qrdeIjYR+MeSkP3wD9x51gqGZ
	fwQoutQAycszN374+F3xnFS+kgH21ecAWQMEVjCGZYgxWVfZKV90uEcQ4ZJ5wDSrh7yl7spwBWy
	sidg==
X-Gm-Gg: AeBDievIZM9hg8X7e6j69y26KZYg1H0pgO67GVoHJSdOyy15cuFBtZ9EomrLdDayW8I
	A+iSqpVeuuSqME0hOqarcYef5K7KBQLYn86ECoPYD75e5OmvJPjvNXIi7dZup2CIjZoMdfChxHI
	NPCJtrAQ5D4djf3FSItwMTLY8h7HS45bAYsdem63SRkjQlz/F7SQIm+VDb3IJ6YcarrYUE1v0rh
	8707HOdgab0DJyrDiLzQPtvaFfR0zqzW5BYWZLrcQtL3iOuxk7FRkse6wha/PwteSlmQxTmxzy4
	TXstLScbfJGKEXhxTL9mV+iB3gc9PeustJ/knlrz/gWMkMaw0sGmuY9SZaPXvrgdVvAGIwpp4gx
	8MvaM2ICOiUSpuS6dosNw6heZla2zvo5NZCMDGv+9U8yeo96ikuYaafrlHenU+5grWbHEAX8Wl1
	+Y1yC3xvdP6wbdHGGUAXk=
X-Received: by 2002:a05:6a21:3395:b0:3a3:a9c4:3d60 with SMTP id adf61e73a8af0-3aa5ab5e038mr9423427637.27.1778163163395;
        Thu, 07 May 2026 07:12:43 -0700 (PDT)
X-Received: by 2002:a05:6a21:3395:b0:3a3:a9c4:3d60 with SMTP id adf61e73a8af0-3aa5ab5e038mr9423372637.27.1778163162865;
        Thu, 07 May 2026 07:12:42 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253b493c5sm2343072a12.28.2026.05.07.07.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 07:12:42 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 07 May 2026 22:11:58 +0800
Subject: [PATCH v18 2/7] coresight: tmc: add create/clean functions for
 etr_buf_list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-enable-byte-cntr-for-ctcu-v18-2-2b2d590463a3@oss.qualcomm.com>
References: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
In-Reply-To: <20260507-enable-byte-cntr-for-ctcu-v18-0-2b2d590463a3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778163146; l=6615;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=hixjNT1jMkq758zZZ1hEzrAx1L8FCxRRm5D2VujRxWk=;
 b=wGzEsqp85TWlVQzZ2kT7yOm4VW8XctBS4r24DeLT9H9rJAFZwpFrzKLX95JGw4H0LaxRm6k/N
 cSprM1HBNr4DALEpeUXrliKZmBhBMgBLMIIqZgfySpjxbxG0MpK7T94
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE0MiBTYWx0ZWRfX2pIC2OxGLBsu
 q72ndqDzG5ajRvPF3NYDuQ77beQRlyQcHXgadPg+ENYBpUcOmeJJwvwk9aKEbHgVWZf1axiR2nE
 RwtGxo1bPDcAmSrWevq8gj9xiyt4umdAsK2doUbC5XDSs+IAerjRZNnmuGZpGwTFR9VZtnw78s4
 wNGxFDkES0MMqhmhjAQvwLNj5HmEmkXpvWqHcLpsPqvmXDConyqw07LJb10ri2tmoT+SrJ+101S
 pXDfps9CdkfoAJBYG1enidXYamUdB2pxLJIe5aQq3sGwIURUXyt7tCAYL5k4qS28P4f6ylMz2pj
 t5NzQBIfX651h29W2s6C9PBACiVwmghyYLGOjVhf8BjhCujiQOfvc5ZVz6pky0RxDAVGHlENQLg
 qN6Bl8m8CHxlLsnYZVlWyXZ385vekj+nDWUu0byCZL12+OMm/QfBsl0nt5BFtaOHPmkNkTaDVSs
 3s7v1BXnW6vLpcetq1w==
X-Proofpoint-GUID: hzSU7qosHCJnIonTFfvsFI587RNSh3kz
X-Authority-Analysis: v=2.4 cv=VNbtWdPX c=1 sm=1 tr=0 ts=69fc9ddc cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=SmiEMI61MywFhWxRikMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: hzSU7qosHCJnIonTFfvsFI587RNSh3kz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_01,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_071244_782607_E5BB6260 
X-CRM114-Status: GOOD (  28.91  )
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
 drivers/hwtracing/coresight/coresight-tmc-core.c |   1 +
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 105 +++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h      |  17 ++++
 3 files changed, 123 insertions(+)

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
index 4dc1defe27a5..779d9e479aab 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1918,6 +1918,111 @@ const struct coresight_ops tmc_etr_cs_ops = {
 	.panic_ops	= &tmc_etr_sync_ops,
 };
 
+/**
+ * tmc_clean_etr_buf_list - clean the etr_buf_list.
+ * @drvdata:	driver data of the TMC device.
+ *
+ * Remove all nodes from @drvdata->etr_buf_list and free their buffers.
+ * If a node holds the live sysfs_buf and the device is active, the node is
+ * removed but the buffer is not freed; ownership stays with drvdata->sysfs_buf.
+ *
+ * Locking: caller must guarantee exclusive access to @drvdata->etr_buf_list,
+ * either by holding byte_cntr_data->reading (byte-cntr read path) or by being
+ * in a single-threaded prepare/teardown context.
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


