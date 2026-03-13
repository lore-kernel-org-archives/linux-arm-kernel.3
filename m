Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C36C105F781
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 09:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KfHNY/tww1SGJwd/uAbJYnDxS5kq3xHdkWpsLjKeguM=; b=yZcfwqT1K6lWimm6NyWTTdNr2P
	yFVoAh7CNoRJTWBhDKgrejrPxWV0rPjzLHTEgi1FfWHJNt/CRxd1XViGfhYbQn4sVxvrR5ci8seqy
	f9JoXU6fT5o8eXcNo98YPxM07dNEHLEkT5KWzEvuxY9VSmDERYXSzaoWjN6p4ImO/aKFjx6GGeoH4
	zJySrcTrvcG8/3Bk0aBjRj+r+2y1joFZt7L1Ex17UHXUPOf6IDEVQGB0WqW+c0R3b+Otx2oB/o5Bu
	AOSuE8CWtj33D/Q1AYYNYAN7zFQbXp2JfG0x28VFTFwIpg9XlU/akmI8Vs2/INp3a2OEOITAVEVLm
	uEprpADA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yQ2-0000000HL4L-40Yw;
	Fri, 13 Mar 2026 09:02:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yPz-0000000HL2o-004d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 09:02:52 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D8v98I481510
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 09:02:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KfHNY/tww1SGJwd/uAbJYnDxS5kq3xHdkWpsLjKeguM=; b=SC9LSw+Pkr92IgIC
	eUAfSTWD7AroXI2r+zTnLCFrBOFwV+3MdubZVPXF8QAFiEgs+FGH9hGodsWdqIu4
	+UH0xBwdBYjwB+EbV6jtY8h5CQMjLprrOLDrlbu+4NHCDcGyIo1Me8+apKjZO9+g
	+mwuHoLrXC73Km4HvIaPJAYr1cWQhbo2ZWjYAOJb7Gzvlo+tUgdOHZgIOHvhNZ6M
	q4okDNRhy3JOG81K6Um6JGJBbO+Yut1qWCx2PtZyEoEwWP7m3bm1rXm28BmeFmNV
	8tvs70FlUGsxqUVJLr45q1YoDQDcQZaa12HndtfL9Hcbmu2j+NDMwTWue+Bvvn/y
	zIxQRQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfh7r0pn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 09:02:49 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso1500886a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 02:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773392568; x=1773997368; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KfHNY/tww1SGJwd/uAbJYnDxS5kq3xHdkWpsLjKeguM=;
        b=HSCiyViWwJS9P6gM9Ac0xkUnyeOGIiWvPYHNb8A10hLQfNZCArDwHi5cj5MpIY36mV
         T5YAMa/McaV2RdedeXAM7lVS8SALPDwgik9vUPx//9YecBOeKGowP85OY9YKGsk1qlnc
         EHIxcH6FJkofTz3Dj5XxjSCJxzxiVC7HzwMrLHBGI9G3e8C4ApMEPkKlZDfOB9FTX2U5
         dw5YHxEL6Ms0jNWmV5WbgUKXfE4L2rfGkvmZmQh5Vqyj/0lCzY2WyMlGlNbDm7+SyWBT
         erEfbhyj7Tj9NuTOp00Zi/jYs87vLO59n/pduS6E7DkDTFhYzxfcR6e8v/c/oKbp/jsj
         zJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773392568; x=1773997368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KfHNY/tww1SGJwd/uAbJYnDxS5kq3xHdkWpsLjKeguM=;
        b=Eje6wzK6JbvGmjKmI6TwQxk3AFaJkKgnB3ZVqmnfQNkViIndlVsmsU+3bA0KQIip2s
         q2BQuExPIA30ukc7CoiBgVmI8fVhadrsCyyw7+BqqSg9kS0XZxBWgCBgtucEWQS29y3x
         G4QYcak2ocRNvFOINcb7qDeg+nwaPZiysUMdsHA1HDkvZPN++zjyGQQW9Ao1h/XhmZp0
         oNJ7cqDnM/sVNdNAGm6P9ElGqDfhATV2ufjhprTE4GRjVMyqtaMSrptr4M+bvzk75rHk
         5i5s6Sp7uGIXBH2t9Ztxz0XggvDnokCTYnjAn8G+s+aiCD2RYE+hEFj3BLuRVK45RL2G
         S9/w==
X-Forwarded-Encrypted: i=1; AJvYcCUjr0D+ZVUufLK/d2+5H3pb+6JlZ8ksVZ1GaUeZvCrABRD6VopZCJuoHTuuatyUBKHkb9SKVzQeTtc2nJrsfxgd@lists.infradead.org
X-Gm-Message-State: AOJu0YxewGELNMeY8DG/O/25bYYE/URHvnbPWI/HZuspMmMqMFVWdpWI
	/jhLTeRYVtusgoWo5dFgiuXf5Y9AZTtLtidXX6fCAhiy1y1ZIGpdSViHX9YEsbwnbmR1BVEyPcK
	9rq0BrG282vdV8aJdDqqhO5wNqgGxp0gi/GZ0vvnqmHq5je7hk8UHoLSEGW91uSOyBdzBxDM4Of
	c1EQ==
X-Gm-Gg: ATEYQzx6gnwPFE/6iU350V5qGle7eQWO7ppCAyUr+HJyzPzI2de4Wy4wajKf8kilxHW
	Si6RPIaBa3v62QW89JnuAxBNivlzXstxMWqNAO4amaboqyF6rsEo4GW0MxE9FYNLLxrREX+41kr
	aC46UWRW8TUbAWaRIdePPEtANJUrR6zsPJlKdtu2NX2Ht27FDKx/xD2fg3xQdhxSgXZrOIlMEHc
	JUWpEWQtEfM8FsQBwbMTGORjEZE2YY51+pSfeJhHuZmGsnnbjzZT0fDIRZasQaojtrEeY8px+In
	uiJRXQfLtmBApWyq4gmecS2+KaVacya30Lu5XhqUxO3aczI8rrqTafHNzr28R1Ee84cRYvUW/HP
	XbbtQagz4/ccK29Y/TZ+7pVezi6UlwZER9AL7hbeZx+wGdqxN0XSSupAmEKqoGPqyqaeMULDpTS
	H95o/T49lc
X-Received: by 2002:a05:6a21:d83:b0:394:5463:7330 with SMTP id adf61e73a8af0-398ecd72c68mr2109273637.51.1773392568062;
        Fri, 13 Mar 2026 02:02:48 -0700 (PDT)
X-Received: by 2002:a05:6a21:d83:b0:394:5463:7330 with SMTP id adf61e73a8af0-398ecd72c68mr2109233637.51.1773392567520;
        Fri, 13 Mar 2026 02:02:47 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73ebb9ed44sm1269275a12.34.2026.03.13.02.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 02:02:47 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 17:02:05 +0800
Subject: [PATCH v15 2/7] coresight: tmc: add create/clean functions for
 etr_buf_list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-enable-byte-cntr-for-ctcu-v15-2-1777f14ed319@oss.qualcomm.com>
References: <20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com>
In-Reply-To: <20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773392552; l=6645;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=ox7XkapqqQFv6BvdfowOKNWDnDUZ/ZoNrcI2LZNMF5c=;
 b=jVA1wfsLfdrODOSjsqgCmf1D8+mwe9eT/Kky4CgBmEZDCatvdZiCN1CHUu35Cn59KBw2jJTTV
 AC264ehcxqhCBP6JFlpVFjSpmslS4XD6tDutbSP8odsSWJIjKfGomAo
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: dW5njDB0nHI4nxhHojhzy18KbYde2Ljk
X-Proofpoint-GUID: dW5njDB0nHI4nxhHojhzy18KbYde2Ljk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA2OCBTYWx0ZWRfXxUAJmu7d53GT
 N5nKz/Kuv4CKy4zdUQ2cNfR65B7fKzCDHtYhI2ikYl7n4EZpYNkADrxh3ydLjypqs0COjLkrS0T
 Y+LMZnGx+wOftzlVl6V0f4sal51AV32dqW8+nK1LOzJZTxG/EP5CYtqBECNKNQpKcamB2IlaUes
 Xxypd5L9pwQzjzvKuXS8lkR21LpL+wclLDA1lyTpe51I49nAOteaJ1TPeel2D67MD9cSwe6lOpZ
 0cJlgccM7R5K950DN3chYkUZr4jIg7YDtCCI3NTs7O9BtiXcx8Y65YZJ4JuduLkbru0QZGTOS+8
 jlWixp+n2le7NwPh2pj+vit3OFr37r12phOfihUv6mxLnWNkbCNn0j45j7TMNUIpEGJ/4OKiyrZ
 a7VDPcsVe+Pr+TDsCiD6E83it+qpQScEjoBeIN9BF6JMbOqzcUTdTEsTcviObRYhuBgqMKjhLcz
 3wGOP2SkkgCdUXhiXNQ==
X-Authority-Analysis: v=2.4 cv=BpiQAIX5 c=1 sm=1 tr=0 ts=69b3d2b9 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=SmiEMI61MywFhWxRikMA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_020251_174722_9A26B32B 
X-CRM114-Status: GOOD (  26.93  )
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
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 108 +++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h      |  17 ++++
 3 files changed, 126 insertions(+)

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
index 4dc1defe27a5..fdf23e1c932f 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1918,6 +1918,114 @@ const struct coresight_ops tmc_etr_cs_ops = {
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
+	unsigned long flags;
+
+	lockdep_assert_held(&drvdata->spinlock);
+	list_for_each_entry_safe(nd, next, &drvdata->etr_buf_list, link) {
+		if (nd->sysfs_buf == drvdata->sysfs_buf) {
+			if (coresight_get_mode(drvdata->csdev) != CS_MODE_DISABLED) {
+				/*
+				 * Dont free the sysfs_buf, just remove it from list.
+				 * drvdata->sysfs_buf will hold the buffer and free it later.
+				 */
+				nd->sysfs_buf = NULL;
+				list_del(&nd->link);
+				kfree(nd);
+				continue;
+			}
+		}
+		/* Free allocated buffers which are not utilized by ETR */
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+		tmc_etr_free_sysfs_buf(nd->sysfs_buf);
+		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+		drvdata->sysfs_buf = NULL;
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
+	unsigned long flags;
+	int i = 0, ret = 0;
+
+	lockdep_assert_held(&drvdata->spinlock);
+	/* We dont need a list if there is only one node */
+	if (num_nodes < 2)
+		return -EINVAL;
+
+	/* We expect that sysfs_buf in drvdata has already been allocated. */
+	if (drvdata->sysfs_buf) {
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+		/* Directly insert the allocated sysfs_buf into the list first */
+		new_node = kzalloc_obj(*new_node, GFP_KERNEL);
+		if (IS_ERR(new_node))
+			return PTR_ERR(new_node);
+
+		raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+		new_node->sysfs_buf = drvdata->sysfs_buf;
+		new_node->is_free = false;
+		list_add(&new_node->link, &drvdata->etr_buf_list);
+		i++;
+	}
+
+	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
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
+		list_add(&new_node->link, &drvdata->etr_buf_list);
+		i++;
+	}
+
+	/* Clean the list if there is an error */
+	if (ret)
+		tmc_clean_etr_buf_list(drvdata);
+
+	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
+
 int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 319a354ede9f..81237944b986 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -208,6 +208,19 @@ struct tmc_resrv_buf {
 	s64		len;
 };
 
+/**
+ * @sysfs_buf:	Allocated sysfs_buf.
+ * @is_free:	Indicates whether the buffer is free to choose.
+ * @pos:	Position of the buffer.
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


