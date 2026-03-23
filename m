Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D171EEC01B6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 09:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aTJDJgY9ATjCAHRG1W16e0NWqYe38EB68qyE9RQn52c=; b=Lk0iqYWNrkL8cXw3AGF2lJyJv3
	fSG0KyLg6+dg1ORZWoAiN4/WFVIbZYXdSGh+TKQseWpZVEZ1TLc+5vlDbderYy5YTWOUxzqgK+aF6
	uBG10gA3n7AZ0jX7X3atATRKrs4+1wkmzKJLBkgmPUtupUUnsvdPDpMYIFyviXhe6rREqncMasGOG
	mPNSr0wrP+2TDLnIDOL2D6mH6o/cF/a2/EEsHrcAuALc7L7ELixjuWPcGLKEYMMxj+cj3BnRjYByX
	M+9yY2IelmNwa6qymhVls3ztyobCrB2s8fTvgNGTMdC/u1HDRgXdhqH2dK6N/zkMLRXpPSEH3lgIr
	+uGIEiMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bvC-0000000GPFB-3ioM;
	Mon, 23 Mar 2026 09:50:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4bv6-0000000GPCb-3Z6g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 09:50:03 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N73JHi3452104
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 09:50:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aTJDJgY9ATjCAHRG1W16e0NWqYe38EB68qyE9RQn52c=; b=F/v5HfO705xH/vJB
	SbtOD/UJD6A0luaLs8qQTTMKjZK1pZymr3FST00FbGEerxLOcogUuB589xEbPphy
	hrAzmP6O6dDKAMp3OcGbsxNmhBpF0YLOi4upryTxgS2vcq2d/Osa8xVHsXOC4/g5
	R5XnMphB3DXKvtFYtNAViMlOsDexgm4/EdVWfbetedbeKkGvA6GFsBJrj0lPySmn
	pNThk9WcWGCKOdX0ZOom/OxX9TYiOAuoD5XNaxfA1JcEbAEoTs1GpKbXTLn0l3yU
	sf+OLw8kG+lDgrbj0jr+niLuH9wr8xliur61mwAbQ5VVGzFxIBYE9+W1Xcjtbvew
	jm0H3w==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d2ca8jr4t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 09:50:00 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-358e95e81aeso234386a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Mar 2026 02:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259400; x=1774864200; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aTJDJgY9ATjCAHRG1W16e0NWqYe38EB68qyE9RQn52c=;
        b=Rm1H97Zyj4cSlpvYxCGvSW4NUnb9DLmNEgUKUk5ob5vh0Ht2+F2MA8IfprB6v1BVYM
         kI8HNgf1bQDEKZ2mWMBBeaOGwkEqWak/MhPGOY0YgTMlPvRTGpB1uq7YRvqu2YJJaGRk
         FhhxcTqXSiob0hm3+77F1mtGD4WvuIRjK0ZNHpUfyBfhIBMzXcc10ucC6ISgj+yAUfT7
         4PSuWeE9c3zkN61RXSrHfXLInNUN0/ouoo8TT+/FdzmN9QbOYua0y/QgNvfAPpeThrLj
         CMrds354MmhZo5JvhROqzuU8Zte4gH/NfIHgKHoasopTCDmUAHRuiKOjo+BeV4Iw4jlL
         +5gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259400; x=1774864200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aTJDJgY9ATjCAHRG1W16e0NWqYe38EB68qyE9RQn52c=;
        b=LqwRo6kH4btsOE5tgOepnc1y/Lo+WFTljEpfv0v5ES2NNAytOiehyhtzE0CFAQNOc/
         n1JleU2o9Vkt2JmzED6JH1YnikoKfm4XBWu90z88/6cPQiENlxKU9oqXX7Ck/LIl92nu
         R2kmHv9yfqScqERyxCqzgwavMITFE/cMi9WHLdz9yfYZsX6XTlUaouqOpCpWYtv6kjMN
         siQpcpD3TOX/tCUjkaS5j7njRQ0+/f2SenAW3pczrpBQNLWy/x8O3DqJXMQYnmXBJBkP
         gmJlo+0iHZ4uv4CUavmOAd3wkbGM9MsgVdagsUnji0zzRmJJosT/e14oER0L0/7EcMQk
         dOhw==
X-Forwarded-Encrypted: i=1; AJvYcCWvbLcsTiqv0C3AsdK+7rbt4Qq6IFmV4dXWacPvvUn3aitY9YO/8kZT0l+uKHs6F0ZNuVTbB+0CHNb+kQlcNU/h@lists.infradead.org
X-Gm-Message-State: AOJu0Yx87Uucq7DItzqbyocwfE80hKAmiKqv3y8lDd5oLR3x3n9g392B
	S8oOAt5e7Bn39aWILXgNmewqhb9B5bTlXHdHrv0ibDwMJ6nzwvIwU9hD1KUHMgTxvwpV4cgIGvK
	p3MqsSqpuzeEk9EGHFH6/8LEqOp9SStK9ElQikU8EuYCH71d9GQDurWSjE9QNz34kwOCyddvguq
	q3Nw==
X-Gm-Gg: ATEYQzwIo2TR2kRzUSlI8hcME6LXHXL+g8N0mRUc2x/+WpyAJFRr+GriX4XTRvo8541
	Dn/c93orNjiazqIAVdoYbFk1sAQBq2ZLl7XjWx3Xtl9k8L6vcDUbd7GhUrl9O6WnrAauqHmol8M
	og05qwpkShRZi/7eeXT8SBH0E8SDpovzn6hwbgd8QfjqpUJmIpExw7x3BEH8wDckW229jnHR1Qe
	B6Dk1M13G31oaFHjEUjIoJJFAv8as8DNAKz7Tq0R0KMUyqSxU7fl5fBfuFT4ucYtcxAfQ29SaKu
	6fWDxocRm6WYOhGGpCfr7MVosA3utfY9o1UwuEsnovbzOUyDYFRnZ4I1ms71vh1IV/PEk5KDlbj
	U7vgJsbSgayvmU2okprsMm8PDYNqW9BfGjHtO2L+Qt2sDn5lD8pOGvZrr/n/a5DTRyxlxwU3kfG
	4EQZgaQyVn
X-Received: by 2002:a17:90b:4a84:b0:359:ff8a:ee4f with SMTP id 98e67ed59e1d1-35bd2bd8b5cmr10355270a91.7.1774259399444;
        Mon, 23 Mar 2026 02:49:59 -0700 (PDT)
X-Received: by 2002:a17:90b:4a84:b0:359:ff8a:ee4f with SMTP id 98e67ed59e1d1-35bd2bd8b5cmr10355240a91.7.1774259398986;
        Mon, 23 Mar 2026 02:49:58 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c743a939af0sm6591935a12.16.2026.03.23.02.49.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 02:49:58 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 17:49:27 +0800
Subject: [PATCH v16 2/7] coresight: tmc: add create/clean functions for
 etr_buf_list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-enable-byte-cntr-for-ctcu-v16-2-7a413d211b8d@oss.qualcomm.com>
References: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
In-Reply-To: <20260323-enable-byte-cntr-for-ctcu-v16-0-7a413d211b8d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774259383; l=6204;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=FFceOaqM6wu7CDdoDhopkNKARk15nwOEHek364eGNLA=;
 b=IxYt/7EWVEDsCF4b7tnmVPQ9RVLcT/lR15WOFzdR6hqbCMhYuQEXRluud+4FVD3Lk5YXocrsX
 oWbe/GW9qWtB6KsrbrOt6MFOi22gzWTP6IOOljrd0am8sPMzK69IDG0
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NSBTYWx0ZWRfX3CiA54XLSEaV
 EsDjW9Lrx69e+Yx1l+9QONqDAZu/M83lKCOgxaXHrSTi5CD52asx5vL0M+8Ob5cJFm2GWr1oDFL
 Qa3PSRkyzSRJqDzI7SFiwNPo43yj8jnuMIBnLOxNa5WlSw1Xnm9slVUUMdLr1gz5ws1TQp/unhG
 FlQJ3BI9E0c/51pfPbUgcT/pcMoz932jehxJc4mA3XZC27SCVYbp5Col1JdOdUDO3Rk+zR9COox
 Yq/jjLOCkgUpLGHRtGFN3+iabxPxAdFr26Bx014cvXKaEMisyOM0+oCW7JL0uRIaltKU/N1PnGE
 /EF8AGxRO1ZoUYSuuYi9isj4NiDd0BYYkqW7ryiOmSyxkqHuzp5inngj55E4IZUw220hXeRKImJ
 A+sbyeleWeNRIzTqYSOrj5nswrYskXyv9Hg3mbbgJR3IWRC2k7TYJIcUBEpAgFbIRTJhepzF+52
 VWpgZ9OIxQ6IgtkMcsQ==
X-Authority-Analysis: v=2.4 cv=cf3fb3DM c=1 sm=1 tr=0 ts=69c10cc8 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=AScg1gZdVb1XvqdcXssA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: K_5ei4uFG2Ap7Q0xdDgJHx8SZ3pkLP-z
X-Proofpoint-GUID: K_5ei4uFG2Ap7Q0xdDgJHx8SZ3pkLP-z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_025000_956771_2D47E1AC 
X-CRM114-Status: GOOD (  27.91  )
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
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 98 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h      | 17 ++++
 3 files changed, 116 insertions(+)

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
index 4dc1defe27a5..306982e88dbb 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1918,6 +1918,104 @@ const struct coresight_ops tmc_etr_cs_ops = {
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
+		} else
+			new_node->is_free = true;
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


