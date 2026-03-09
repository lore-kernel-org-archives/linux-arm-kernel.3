Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA53BEFCD73
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 09:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I9dw+WcJObrPUnwMy7R6sdjv5SOnPFzHWtKFt8DY7KY=; b=F15z9PaDP/8N1ggH/RYmvSjKgg
	XFh8dnyN/RAyDi5aTmNB7C2tU2F5ydERklXFgdk2ExCAI/qpAPyRW+iUgfltRgMbgYkQVi66CHWvK
	38w+mFX88hw5KcFHf8yOnVwJqaU3UJzXdCyFUhF6gsGwfDttXNCS+uHW6eANmTXzedS3L37O5sydy
	uyYO5mSxRElTQd8DSd1Fncld0Mg1iw9S8u7eGqy3NG2liMlMdICWGC7/GC9JyGi1XpqRi5ppVS72B
	YsQDyG5mWJCNUG7e3RIqnEXB/Uq+3CLXZQ5nui7T7rU/xCpTL/snwNBagzKs8g6hOivNhSIgz4teV
	4R1JfC7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXDt-000000070vP-3fRS;
	Mon, 09 Mar 2026 09:48:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzXDr-000000070uU-2MrK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 09:48:24 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62989w9m2661187
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Mar 2026 09:48:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I9dw+WcJObrPUnwMy7R6sdjv5SOnPFzHWtKFt8DY7KY=; b=TdJ0jIabWVqA6Qhf
	ZhNAid9muT4UGDFoFgXZfFb3mQRfqza800NOCD8j5T8Exh8iffBDy2ot41ZKrsPw
	jkFYkcYZtKFL74CiZvjdY62jLU/qwmu38OasR5PEepENC9nm220N7hapgJkN3DL0
	B4SbyxvGxUrcmn2gZBVAEbFNWVAb5rRaVODBE0g9Iq4Hm/OCSzbuFcx5IbzVEAXa
	6C3mfTFuTrnIeraf3Mnw+sJstpm8b0OmHrlXF4CyW5crZZAjuaRZ6akQL5VMsfAG
	IC7cDtfTjWBleV6Y5d7sS9eCqfJSHYmP0y2614ycvywYRIXmLtRq8s5mS/fjBGM7
	MOdHbw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cr9cpn4mh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 09:48:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3598007eb74so42669381a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 02:48:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773049702; x=1773654502; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I9dw+WcJObrPUnwMy7R6sdjv5SOnPFzHWtKFt8DY7KY=;
        b=TKCchl3omGk0MYUY9VsJp8JHAfq3OlIgK6lWlGOL+s0t39ePbm8kN8fAou/j/B9Thi
         x/mnGvFkUnU8eSqW1FsD8JDPs1sBhC4QKHenXveNOp+D3vteocBNLSt51wp5N8zxstbv
         E6kJSw3mQzldwjpP3gGoxpa4ZJZSpy3em32B5LUbzUOOi37tUbtx1GDCcQt4sEaWHaZt
         x0Fy7HBTNkqzN0hwM1C9/2IClbiXCp2r6vJ36rXYg7J/Rd5N4ClVv9au/oYDOB3XlX99
         lROssNE4yGN+AS65xfVRPKgbrsfRyf+7oWrn88/DOrsR9thDAuF3X8LFd6epLwdeRJyt
         Y+1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773049702; x=1773654502;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I9dw+WcJObrPUnwMy7R6sdjv5SOnPFzHWtKFt8DY7KY=;
        b=IvbhLx6Z5VZH6Y1zsfDmeWc9+T+KPuJJRr4JVflJWdKiPG74iFrvSOXc6kzR7ujZ3U
         uEoDqR1hpBFNCHDR7jj9hnL04b2jNekhLxjEUefSVcIrHHQBTIRhkSvRiUZhaSeUjM9m
         /ixGLFWv2NFvw8pQLiVH0JIqPYNgNpMPHQq1D01pwDYkoe4ME431lqiMp3L/iQx6v4sH
         i/sdMq8NOEeANouh9RmsQkuTBDBNd4ldeykC6CMtScawoKrsRqsm95hCEoOUCVBB6rBx
         LX4iEbT58JL7YYRUbqcZzqna7+BbfFNTdBqyhGHO9Az/gAhDkQE2G0XG5hacqqTm2kKH
         C6lg==
X-Forwarded-Encrypted: i=1; AJvYcCVSr7Y+M+4laD9OSiJBJ3q2HMEjAjfXqAVIftNWFQQMzqUjSOGFYFXjAf8trLGO5xpSiVwQnqSvRoUhYz4TL022@lists.infradead.org
X-Gm-Message-State: AOJu0Yxobi7Z2Q7ncnLxhY/5ZVrbc36fK++wIzjyYqMxKWeUNbcLSbWK
	m2FTmTpmuPKmTVn/A1Cfe2ArEnZsOWYPkraDviYzJ4q4PVsDOGklnrRYbpPjiM39QtMO0/v8wWr
	ypSdEsHcVKmU848vNenfaykhsUQoHl/2ThhZS1BbXZ1FELfa1vBQDhxxxFzRZcXhChu5bSZGa93
	Uf1Q==
X-Gm-Gg: ATEYQzwJE+FTwOFtmurj027W6taTBwKq7YxMH+LIFWfXdiUwZgSzIh8ZkK1J64Iy7QQ
	oKSZ2LwD54IWu4SuYva+kCYkvsqrgyGusNau++MpyVZaZQq3FyjBZomU+J1LKGdb6NnUTKqrOq8
	3siNGMe+lj+oOE5HhC9yUUZ5G6kfpbXUBIQxEeBsjl1oGim7xF1qp+dHDcMlVT8r5wu/EYfrGnw
	eLkmSDcJDL47eRV2yZYmknaQTIW9uwZIvBpwOfmq8SZ4porCTNCLCLTI3+UdACp0DMDVgB3YBKz
	jQE2DWFxXEh9eYcL1BrJ5lZjPmz8nJWK844E0isfEhD1J54XiI8g8tfxZmmN6bPtt0t3WZgZTrT
	dwX6tsipeY+W4FnuobO/uLDM6ZJJ/AoZNoYkdelZTg8/KpJl160hM5W01M7KxZ2nLGhjdOozJFh
	4/dz4ajg0F
X-Received: by 2002:a17:903:2c50:b0:2ad:4265:bfab with SMTP id d9443c01a7336-2ae82367abfmr95444445ad.5.1773049701569;
        Mon, 09 Mar 2026 02:48:21 -0700 (PDT)
X-Received: by 2002:a17:903:2c50:b0:2ad:4265:bfab with SMTP id d9443c01a7336-2ae82367abfmr95444295ad.5.1773049701114;
        Mon, 09 Mar 2026 02:48:21 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83e575e6sm104948435ad.5.2026.03.09.02.48.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 02:48:20 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 09 Mar 2026 17:47:41 +0800
Subject: [PATCH v14 2/7] coresight: tmc: add create/clean functions for
 etr_buf_list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260309-enable-byte-cntr-for-ctcu-v14-2-c08823e5a8e6@oss.qualcomm.com>
References: <20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com>
In-Reply-To: <20260309-enable-byte-cntr-for-ctcu-v14-0-c08823e5a8e6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773049687; l=6057;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=cfmc1VLxOy3etVkZ/MkjeByju832awJF6a/lCbGf8bM=;
 b=p9HlbDiLRYUetMVKeBUUGiPvA5RXjctin3mI94zp9naMCYnHV1bF4jaYxPMEFztVftCOEWJUC
 TSVrIhT+X9EC/Q/AaSaaRYoEq7cNkMBB9f78Lb1cjLIN0Wi5o5NJK9F
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDA5MCBTYWx0ZWRfX7FJauS7Lw7kV
 Tnlo+GR3zP+pz7Zf7kYZiircoFToQyy1hwmWczYnqVKOwG46AxRzWpVE37y28BJlWYEQ9nIHZDr
 gS3sqO5O7qiPkmxvg0Rm5N+OqJUocPhkXXJ0xDAZV3O1Vsg7jgJwj4zDQnkin/GtdGSzWblhGTI
 JDI2yODUijQCN1pd+FQFxp++kRBhw8Er7yPGrqsAL3cHRC84HB3U36EnurtxouC1IlN9arZMqiT
 gWUWaNRWWJgZGqDxtro3nRpkDHzuhNpJdlc1Q6memcK/YaeNru88WzlbaPq8LCnjRj821vLtqPV
 qNntjciuD9qVSUX9o1Z2nwbgJ4FZcTJh16E5AWFber4D5UVg16fv0JQhu4TTgmdHr2qeWuwwY+G
 lwouPmhWwF3orcFIsFDEjjXgCp3UyniAT5VnWzThKHP7GDSd/62H+7vpdkAKoJYrdDAzspGBNlT
 85wZH0YjDQjdZlAsb9w==
X-Proofpoint-ORIG-GUID: 8AbFc-IvUtAeh_mE1vayxE3nRRlsvy7X
X-Proofpoint-GUID: 8AbFc-IvUtAeh_mE1vayxE3nRRlsvy7X
X-Authority-Analysis: v=2.4 cv=e7sLiKp/ c=1 sm=1 tr=0 ts=69ae9766 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=pN8Znu5onTEf3dnVCfUA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_024823_728153_1AC5A193 
X-CRM114-Status: GOOD (  26.90  )
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
 drivers/hwtracing/coresight/coresight-tmc.h      | 17 +++++
 3 files changed, 112 insertions(+)

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
index 4dc1defe27a5..15c0874ff641 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1918,6 +1918,100 @@ const struct coresight_ops tmc_etr_cs_ops = {
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
index 319a354ede9f..5ac07e8dd5ff 100644
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


