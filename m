Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 248D2C44536
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 02:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Jay9EfBX3UpMTwsvQnGvQgNS5FLBeKOwQWuoZ1I2KI=; b=Bv9ucgVAGV24s/bteWjbOOCKXC
	P9kKGMaVSm3WghOH1PrO9FDU7RYiVMtZkme1EtPA9PfBG5RQFUKx4wOgSHmtzRKtwrY9RcNOeDmuU
	VSn3Si01KIlAHFZlI9tprB+NvD+1xv3dBlk/gOgfEDNHb/BBLTvF8Q+kBIrBOV79rvAWj6IfOBZiW
	ImJGmerxAFikLJjuSGMtloPxS4StgAmmEDYlBvY6gPt33QTXuTe/9sPV94V4PLbOEk333XxYCdH1o
	dkeYtMqeWCBndLOodzanDLuXrVqF8BOYp10SstCwFm6UtVXAIbzJj8bpqyqRsvSESrV+AxKldCgTX
	258Zfkew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vik83-00000006ImT-0n8Y;
	Thu, 22 Jan 2026 02:08:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vik7y-00000006Ikm-3iDQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 02:08:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60LMr5eb1407051
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 02:08:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Jay9EfBX3UpMTwsvQnGvQgNS5FLBeKOwQWuoZ1I2KI=; b=jOTKGa0kbLdt4M3S
	ss4f2RVWpeRnYfiOZRvKwAa65qoXvAYFlW2vC2XW6m3E9B4RBbcg9CT0USwV/F91
	nmi2jJimwFA29KGkF6mu+Y0cPhfkUjKDs6GSZTvGS35C1tR0iVmpelljY9un9Uzi
	MFAkcmO87emgRINJfGBL2hBqzouHHK7c0XV/AKrJd/NXs9xAFR9s6nI3FlIdx288
	2Ev6b8LsIivRUp0l3wOrsvACF5VwgDs8nxIX5QZVUOlYGwnJXdUHtvWsU6UdAAZZ
	yDB3ulQI62FtnPdYhwW2j7tMyTCa6RzVwzOewZCW1SxovYRA4RLBQ5GPPXlDB5Xw
	/oZ9/g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bu802rf88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 02:08:53 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a377e15716so9164825ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Jan 2026 18:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769047733; x=1769652533; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Jay9EfBX3UpMTwsvQnGvQgNS5FLBeKOwQWuoZ1I2KI=;
        b=cYgCK7AkYBn2hHZvnLZhtIlvIDOUv4cbIvUXt79YNTnPOAJnHkkSux8VTb6KgsymIl
         dvrz4E8wDLJzvt6o/k9nKzRECiWO9uoq43nwee+ElomK8YJ86EsreCCaLfQ5OWTU+QF3
         Inpf3GsW3LSlRS7+NGbnG51XcHIQUwul+a6QEIamhiQ1VoFpvl3bk3u1PKssrJh7S2Mc
         qQCiONgr1zJlCQ6g/UXnwh/7AaJd4TvmjVyQVzzSGv9vX++9vaP4c7t1XyR4B48XJY4K
         HviinOYCetGPDxGhcNmvslDNX/41sDcUNNHzSzAexYqk0s6SNCFIHCVSRIdxWRUQ73Em
         Lfiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769047733; x=1769652533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4Jay9EfBX3UpMTwsvQnGvQgNS5FLBeKOwQWuoZ1I2KI=;
        b=VSDFgFYyAa2bHLJZyHuPJyNtc+k8YblzTmRkjrbtDrt8bMZQ7IjaHA2kG5LyofHOx4
         m6lkSAMMdLS1757wZ5GnHxR/1eUstfdyvKH+frP5iEPvqM4v2aeCDYIKHHo7dj2aWfXZ
         1GMJfVijyLLz4u8pvoY2swiO3drAWIZmcIHlQNqBEjpFFyO90AzciFWUUJ1GT8QurGR0
         ErKVXAb3sTta7Rp9cI07x63ShrSHV/avtnFnXfhv+2Dz9QvW+zB74mY7dNotdumPhijU
         D06a3frrmtLUHDh/iCjoQ5L+fJftDDdVElp7mD/xLsjJJQ7HcXyzjaiJI9fAZ7YAPMqD
         6A4Q==
X-Forwarded-Encrypted: i=1; AJvYcCWbrv87SEFXvNpS0WRHYoGH67xMx4YNnkR9olehSoOgaj+jmU9Lt3rGGgAaZBABaAa1+v0lyqfkmEZERy7SUGQY@lists.infradead.org
X-Gm-Message-State: AOJu0YwVkwsEccRgoO1dhgDxWiuSrUYwjvn5MXLuA2pxEbjsM5y+zFYP
	w233oIYCZEVN186l/QEk6jgTs2CHECURa6huUXaOOUnnvOQZ2qGmhb3XCNHqxHMIQcZA7YUM14T
	mRpWlBaQKAdL9rQOSFR5upPlTMmE5ggAQWRBppu2K6hOHNLuhGK2rr3YnPmDANTV7Eupb0/JsQY
	aK7g==
X-Gm-Gg: AZuq6aKAHtp4ZvbMSY41IeKIvHBS1yh1iuhYBSv9LmQFTk+BeB7LUmj79daHRQ2p2Lv
	7wVtwQKyQAMMKrTf5DFhGkkoFgOkKu5sA7wg4v65KfXCReAWXiLEARzmMIJs04sUWSdDKnzuQpZ
	qbwYIAh7m2+k1HMH5TXQjgXZnoCf3LIulbyYBtSb9vhe65N8kkb4gTQKWrf3B47xf/KkO9RL8mJ
	yl2FWrNT0/3VxjkH7pBLcLEL5+U2u7yINLYM4lB8Ql+71Szo62DMu7w4BNurxosTlJ91zGGm96g
	Fc2EPPKAEDvJP5sSVMraxZAOFuCbXIt/R0cjCyhJk5uJHOWokYQEeNoVudWe1oJkA8l2r51t0tz
	BJz3WDu5/uLKbn1RuMJzNoYiPOpY8Nx6o0FeK2partEIWroK6Pi5tgY3R5fH9F7BRaHWTv407
X-Received: by 2002:a17:902:d50e:b0:2a0:d7f6:e030 with SMTP id d9443c01a7336-2a7188f7fc8mr194760455ad.29.1769047732480;
        Wed, 21 Jan 2026 18:08:52 -0800 (PST)
X-Received: by 2002:a17:902:d50e:b0:2a0:d7f6:e030 with SMTP id d9443c01a7336-2a7188f7fc8mr194760195ad.29.1769047731908;
        Wed, 21 Jan 2026 18:08:51 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a780a4631csm49710305ad.18.2026.01.21.18.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 18:08:50 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 22 Jan 2026 10:08:15 +0800
Subject: [PATCH v10 2/8] coresight: tmc: add create/clean functions for
 etr_buf_list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260122-enable-byte-cntr-for-ctcu-v10-2-22978e3c169f@oss.qualcomm.com>
References: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
In-Reply-To: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
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
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769047715; l=6192;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=iOBlKE7wcNNqdQg697EHs/307n7EmzHjJxd5G5rMLIU=;
 b=jzEtsNMGYZsrezqPbkw/udFfJW0/Nm0vvbpPfSfQrPo9FocDTUoW4Gq9F64MOuJTwGaKjv/CS
 /Wey+mTfDgkBfANVJnQTGDzMuaCQqpeYVBl1+4BFFYZCRlJjG5tA5BD
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=TcWbdBQh c=1 sm=1 tr=0 ts=697186b5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=AScg1gZdVb1XvqdcXssA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIyMDAxNSBTYWx0ZWRfX6YOMXb2acBup
 InzRe3bEtBFIa2L4KDBFh0YiuG3qo5765A32z207iSfD1yHnjgtFv6PajJ941YK0/E5FsEyYFQk
 76NKZIHEaY7ghcQwJEZ9+KNIPxOXo2AkL4TUOeQkwAxFktlQCftpPl0Q25UQaJT2ZZQ/I8cz3Mv
 /+kCi4kyW654RBRLd5srMTloqOOEeX2/aECtHLdulhkMqnSBo4H4kO80C2N9bByDWKxXqoVqwFr
 dgJldFYhusdo4YKNj7i7c6WbJ+PMtxc6kVz3QIAlK2cnebQwcj6mjds+oDku43sVX6yOd4/oOni
 DidT1GX/GbXyOKJQh4iwaRgY4DTPk8N8X3QniMrJHEjLnMbZMMoLOX6CDn0ydRgrndZyM1Cu5mQ
 3YwwwcdVzg5fuGksmuHn5XQCyrCtzcC8rn/AVEJGLRJj9sGD7bDRWxQmwUs0hXCuX0IoOcOsYok
 0p2oRf9rNp79cOqfuSQ==
X-Proofpoint-ORIG-GUID: UB9bMOySYi2xTM2-Rc4L-wrAD9tPaEl6
X-Proofpoint-GUID: UB9bMOySYi2xTM2-Rc4L-wrAD9tPaEl6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601220015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_180855_053010_A0DE01A8 
X-CRM114-Status: GOOD (  27.43  )
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


