Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A62E83057
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 05:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Jay9EfBX3UpMTwsvQnGvQgNS5FLBeKOwQWuoZ1I2KI=; b=FH9Vwf0lUXvMz2IVJtRb802b5o
	esFcYuypAv9dydMCIgBhdBPRLaKkN4fFM2dBHmmtM6DLwAlK5CP7yGtZ4xXibAfHJLPIXqn0rdlg/
	VKnokqnHaNXejlSZeWCEvZDFGYpG3S6Nzy3fjrD0DC7OZp7L5m2wT31ZCfaDZvxb0Pjjk07mvgbKt
	Or85nVBIcsiZYIZLvm+McVgx5nMuUkJZma403q1rak4DZUlJr9poJnt/0PEjZwRhwew6Hf2MMxDMv
	OTPcyFtzCtTO7sKavrYNJe40MV08TNNu99fFiYU+AXJR/95pUeom4lCnb3CQC7EO0DjvwUJpsJCYc
	digwSGsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9KT-000000068QF-2Rnp;
	Tue, 03 Feb 2026 05:52:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vn9KS-000000068Oz-03Fr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 05:52:01 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612JwcOh2899840
	for <linux-arm-kernel@lists.infradead.org>; Tue, 3 Feb 2026 05:51:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4Jay9EfBX3UpMTwsvQnGvQgNS5FLBeKOwQWuoZ1I2KI=; b=P2nCuFX7safyPSt4
	md3wzsabmXuDGIOuzhF+VIlU4aQol5XzPLFz9VR5mgZb2tF0EqW7wBeKb05L/Mk2
	Twuu2UKx1g1XmLKBX+k4u+zKSiaPyEBrL1Z16MnPCEEPTpeU4k4NDluH5bVO5pvu
	Ylr4gZahpdoCJopOnL4MIiUznzvkhrB3WtBXUzpvu1l7TkfRJkOHSP35dDuamwnF
	btTQgB5uFIayj6PqjKtF6bPCzDHogxhSdcP5GZD8vsEvJMWCirIq2Bo9praryObV
	lI0uRINWiVAGIrpk8OCIFBZTVzagFGHbN1fMZjK7mBNS4WtGIy+LOKNtMxEFHMQI
	pTi6Tg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2tp0u1k5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Feb 2026 05:51:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a08cbeb87eso58176955ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 21:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770097918; x=1770702718; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Jay9EfBX3UpMTwsvQnGvQgNS5FLBeKOwQWuoZ1I2KI=;
        b=LpygafXfcd6XB34Ma47w/gIGLExf3p71aFQUQ7QRwsU4m8PWtND5c1I282ISMW+1Sp
         TFsGWTEztTXPetjlOsB39BhAqEn8lsjvF/sCWut7cB5kZ3wmPffRGPG6vyi2/XYQmy8t
         ANWfpc3pUOIW5TA8cKvQlkXUnLc+k9/lzexoSwz1x2O1qOvRJqcY0oh2+/ElExSKmZiZ
         qWL5M4umQ4g+gDcYk3u+5pCXEn8e0gPU8R3NXQwtFdPuBFkBXtUC/VMzX71/SBPZgGTM
         YlD+rrD4W4KiLoaP5061eBrRQBgsNgjUALolpM8fa5BMup1R+lpjcXM7V2FI3Pk0sHh0
         uDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770097918; x=1770702718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4Jay9EfBX3UpMTwsvQnGvQgNS5FLBeKOwQWuoZ1I2KI=;
        b=VfX+x37V/ACraO4UDY6+bH3vihtascTmOmH+8zuRqHKHrxZl8WB5mXN4ENdzxeK9HS
         5K64Sfjvw4yK3cuGfc1mLqCAorBtByE6T6AsirxnN7AfBG4LzX5sdCkgHrqTtbi559/e
         kqeHOMoNaeyv3rL0wJb+oy3XZyAy2GNhXgyyiSOS7PRY9VqJAOiyFXoH6ymPROZfZlFs
         UqINEYCeguwyQUa59smN+zIC500yoML5sXw4LyY+SnAYMhAqDohZ0Nr9/2fgAW0LqyKg
         /CpI66iLnQvbi38oaGSUT1TxWr2U9/hRPK8ZEll0pQEUS9gxW/FSR1BHN0rCwoRwqJR9
         rNYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOKOL2wUI1WloBCzx0CAPdbL9DawEmNqQEJXr3QYOznRbbiDd7/OYKz1jFre4myPiBa/B4Yr1hxdkM2TtSDQKi@lists.infradead.org
X-Gm-Message-State: AOJu0YzRHpeD2mw+KgpNGhibkdss1G44fGxnDrmsg9+XIVB4ezvMqdep
	guw6CTFnYwxiPVgC5mqmIl709wxfm5XMcbtvdK1o77N6qhw/4w14HyYljGNWEy5a/r7+Jo9d1Xt
	0Oc0lI9Ta5dajvRgH7pSYStLK+RQfegauy364hQrhawdMssN42P0TXNpgjMC8c5YjpLI2xrzlwh
	HQYA==
X-Gm-Gg: AZuq6aLLBlk8KZE5qujWOn6NjbwYO3jMa4yjYKHNAlS4vXakZKPTSM5mgkrzMJFsBtc
	qmfdX1yGTxB1b6FuImjWNc76OZwFjaSyw58h8t0TLKF93P6tgFcmanwg2gnTX8MTu+MkmzLklZ4
	OdZcreccjuGDENrbJVdznlrkU599rvgFsF3y2G7jEkLAlo4YcAzX/+hxoxgvxYp0P7RO/46MMVu
	xaQJ7T1WalNkKrTxl3/3gwXGcnPAogRTg1pRXVF5jyC9JO3MfRA+/bTVc5vYHUD2w1mIZ/D6r2a
	HbJh26+4JdbVJuF7XsTNqt4X5xQcWLQZi+xI/oUXOYnNTI3URJAT5/kIgD3ioKcIheTygwMkEXD
	4ru/KY4jTusWmnDYPdTNUWGHKWoNSyB1YX+kotslr2ex2UX5QoIo3aFEHezi4tMppZFjcygzk
X-Received: by 2002:a17:903:41c2:b0:29f:3042:407f with SMTP id d9443c01a7336-2a8d96a521cmr137241275ad.21.1770097917906;
        Mon, 02 Feb 2026 21:51:57 -0800 (PST)
X-Received: by 2002:a17:903:41c2:b0:29f:3042:407f with SMTP id d9443c01a7336-2a8d96a521cmr137241115ad.21.1770097917398;
        Mon, 02 Feb 2026 21:51:57 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b6e4189sm157424735ad.83.2026.02.02.21.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 21:51:57 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Tue, 03 Feb 2026 13:51:18 +0800
Subject: [PATCH v12 2/8] coresight: tmc: add create/clean functions for
 etr_buf_list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260203-enable-byte-cntr-for-ctcu-v12-2-7bf81b86b70e@oss.qualcomm.com>
References: <20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com>
In-Reply-To: <20260203-enable-byte-cntr-for-ctcu-v12-0-7bf81b86b70e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770097896; l=6192;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=iOBlKE7wcNNqdQg697EHs/307n7EmzHjJxd5G5rMLIU=;
 b=VqcnM4vNbyRGQwAS7LjKD/ijBNX9/5TItxTwYFrPQTUdNQ8N938fH6Incwj8y6Zf3Ls5c9MmF
 ihumcsv1vgPCwdqoLuvnKUdD2LhamMVlLN8dukCCpdJdg7i699WMtMU
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-ORIG-GUID: cpfvqdX-m-NOrGIYyb5utsJTF1Rh6V4b
X-Authority-Analysis: v=2.4 cv=VJ/QXtPX c=1 sm=1 tr=0 ts=69818cff cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=AScg1gZdVb1XvqdcXssA:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDA0NCBTYWx0ZWRfX1u7AzBHpK9SV
 nq1Mo/m7voSgKL5uAmPfmwdHIkH5f3Hty/gVDdjVcfSmkFeGQLNC+EwnlgcmNai2iVrUmXf+2q3
 TezoD+6lIn+U4p0fb8eefkALdthDxbLYIC/NK7hnU2SiC6PuBXE0zsf6Y2ZXIgDj62ZITDv5osU
 yD/CmuCl8fZuHmLgHv/o+mrCsAbM82bSRiy/n6hc+cfPZrMiuiFwSs2KhnKBl649Yy8OYwS5H4P
 297AY4gDkhI4wf5KcFaibmmyZq2vyzgZqxGVNDg+v2PBAPzTrB5brZsFnFyWTuhG7Kpj9AoBayh
 cg7sRp8DurE7FlytfK5KHIRj6kwUVNCO+LR5rIhqjXaEIOGmHa+kLUTl71fIQX3I39ItHbNOfmG
 43cxwW34aSZTP6dGWdLVY0KTFitMSDsKjWrWcaYDPfwvfbxJwwSFwnVE163+CO4uaqrxvold84h
 1S5BMkOqtAcHMxJSLQA==
X-Proofpoint-GUID: cpfvqdX-m-NOrGIYyb5utsJTF1Rh6V4b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_01,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030044
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_215200_189504_77C2D805 
X-CRM114-Status: GOOD (  27.23  )
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


