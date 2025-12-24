Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9FDE75426
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 09:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJrhvTjKt1gwCDmMIJvxf5jwPN8hV2K72Dpp7uCkoXc=; b=Aq+XsQWyMqXQuf0x1SA5Rf8WhD
	q6lZ90fH/2OmmkR6HTtJqaXHlhiIBlTJqG0Epfggf4T4hwVpvFnK1Fuogk9airNsjfd73rNCyBHRF
	3IEzGCcbmHOq2inDMnSPeMJxzKDwl3YJCtWwd68ML6bucuWZaCB8SP25+S9GbbPwU48u9RmdyaIvK
	KxvFSZpsqf/g0id3euMcnhjKmRbVSTK2hFmEY6AolHv17IO7KhoNzyA+iP2FppdebzRnQDhgVoYAw
	wdqWIS7rpslJutrjTy49N7ZmiI6bVKN8HLTCfQtjOZDHZs4PMETkguXAb6z4WzephLsBpqSQr2JG3
	TVGjuXUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYKpy-0000000GbaH-00fj;
	Wed, 24 Dec 2025 09:07:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYKpt-0000000GbZS-3XHZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Dec 2025 09:07:15 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO2SP4A913513
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 09:07:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yJrhvTjKt1gwCDmMIJvxf5jwPN8hV2K72Dpp7uCkoXc=; b=HUVZDb6sIubFr3ur
	KfOD+Dui0I2bup1HzqpAQ2uG+49BeSS8aas3QyLBKvktk2Kaau8MyZYuOrEWNk8W
	fYELGZoFtpm2wuALGq0lS8NH3ibMcAV9Gnr+krOex+bSwnH1oo8zqf1qCGa8pLGv
	9/s4qC9oND1P7z+JA7XbfpQX7UhkxtbXig7gQbA2oyjP0dsgL6bKbvc9HLN9Si8i
	IcSG4R9E+69BkMoQQDrzDvVutNn+pcFyk9c1Go8Yu9gtGGR9vu03xGdpbEVr37K7
	eSTZnS77eHykS2SfmRWzMLDRxcVAAwv46xvA7lfh+1RXrmcTo26MywkPGwjBcCZl
	cWoraA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7vt2jqna-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 09:07:12 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a08cbeb87eso93036875ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Dec 2025 01:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766567232; x=1767172032; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yJrhvTjKt1gwCDmMIJvxf5jwPN8hV2K72Dpp7uCkoXc=;
        b=XyM2eRoK8VOv0Quw4p7W8SJ1mUJ4qcoh8iljjakVCEMERlwIjHcXll2jDxY1srMRBL
         2ylQLUeBiGeIfMEHolVoy+xTlFZgNs4wxHfvtTj3rrf1DyZUSr3Y1n9yLpkwSVnoxV9J
         0y1RExlUjE9ABBNgZOQyh2NbhSZeJhDGy0+bD2Wz+AJtOnXfUjoV7SU2/LBH1KB+3hff
         qNs1DeEAH+FqEyXbQxM0rHtEfup8CigwEZuFE/ZI94EyKAqyXoM2smw4Sa/xVQc7kMrK
         MV8htK+eGXFa/XvYab5XYuVYwXooLSoWmXBdY7wduDGl2rRBQjAwToaAfCkqkjyI05A2
         b+5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766567232; x=1767172032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yJrhvTjKt1gwCDmMIJvxf5jwPN8hV2K72Dpp7uCkoXc=;
        b=Oh0KJ0Pcz0hJMOLD78nXlb9eHwDLmA76zGGKwcUlK0q0tMYZjR1fh4mLfdFKzOAf6g
         y7JPsxwGEfzHl+lC0wShrPw/IPRpME9E8+WEJ/9RsOB8O6gKXaECidxWgb69EVHeLPIY
         7Y4gWjA0lo/0uLtsm8icWP9TjfL7boyX2KZSq4FPZ3O6LNe+n0LG4pCqiVOkvhiyN2Ya
         jtguwBGoKFAZDCYYDWauivuKl9lLSQ7UQms/KJeE6owG/OcgoJK3WUjK6DxBhvcms/QB
         DqQCeOlySI2kBQuwV0r0vlJCpb1Q+WRIzdbVpEcV5pLglZSo4Sk+hO0q54ngZUW91ghp
         qnkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDrAJbky5D92cli6JjIO5Z61iGkqoPHk6u92CGaL7P9nd7bmVpaK+BFivAgU6PG47j6lHJR2voogWTHAX0+fgy@lists.infradead.org
X-Gm-Message-State: AOJu0YxGVLLj4qPqLzq+Jow45MCITszCh+bWGVZEOZsIU5gSoj/bfji7
	vZ0xhdDEjvtJgLdcrG/42OE6S6XbKU5l6+HTNfC+I1Sjg94t2Cq1Nu+JAuk9U7bJ2tUkjZhqsiV
	Vxe/Em4FekWX+mvJ+Tdn+yNx3a2mQ5jv+TMWGLjZ7JoQvdBnNkuAaeEWd8DeX/yGHg+nYOvWFap
	H/NJbL20kKqA==
X-Gm-Gg: AY/fxX58DtfSArT1WmIZs/CCRNIl3lU2sitf+c7f90yRndkxv6fk4/BSXCGkPypBFOk
	DwoGCy+0mSWO9aixN/Lfhgz6n2DnZB9S+7RaDdDj9ieJPmmazYSC+D+qf38lUXWtNVyDIppTyg6
	guqT3JNzzbXkrJ7aBNXQPY1ya0JCU9sIKTHAp+SvoLxBDk+rPtXPl6dbVDmKAmmP3Riw+rcv7ip
	5BTikYXPi6W5Z6k9NgtDVoP9xqLVsR3wz43UUEosm2Ib8BzeRN8lJIj1RmmrHU5p22Q8Dfxrwc5
	CaNVpPFZSwiam8c+o7KJ3lcyiRqZtg6QStBwplTugCrdeUIBJMLZIh4FMhwxO5EzkTRKA2DXW1p
	64kE1SWsuy2atJ86VU0MYKCIV0raV7LAtxJDye3QZTRKTnOcAShlA1PnDrXNOk7QKokuNjGNN
X-Received: by 2002:a17:903:228b:b0:2a0:f0e2:94b7 with SMTP id d9443c01a7336-2a2f2735298mr158517325ad.30.1766567231628;
        Wed, 24 Dec 2025 01:07:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9R4j+4A+H8ctHEtX19Z9Z16cJ9cTeGwAKw7LskVs0+ffbYTqFmG+XNTiuFk9yR0FXsiA20Q==
X-Received: by 2002:a17:903:228b:b0:2a0:f0e2:94b7 with SMTP id d9443c01a7336-2a2f2735298mr158516845ad.30.1766567231081;
        Wed, 24 Dec 2025 01:07:11 -0800 (PST)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c666d5sm148418095ad.21.2025.12.24.01.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:07:10 -0800 (PST)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 17:06:12 +0800
Subject: [PATCH v9 2/8] coresight: tmc: add create/clean functions for
 etr_buf_list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-enable-byte-cntr-for-ctcu-v9-2-886c4496fed4@oss.qualcomm.com>
References: <20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com>
In-Reply-To: <20251224-enable-byte-cntr-for-ctcu-v9-0-886c4496fed4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1766567215; l=6191;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=DQTHwrw5ZG2QGJ8ed13ET3tSu6napM1SixB2aelNLzY=;
 b=YVcHaQwkrn2AAtWFiqYdJr9AiveFl+f25fpc3B8TfSHyb4UoTyTk6ns89oIx1UcuHl2fU+b6/
 qUzSCoXYQs3CI1p8wZN5hXIQ4BaMmSq8XR9n5JvBCbqRgq5I6P8FJrm
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA3OCBTYWx0ZWRfX05lTkDofr+yi
 FQAqmc3GZb3ALetfQRi5eSSsbSmh+YMDcVcGNnPnJ6blvl0bNYNUiXSafTqeIDpP8U3bLynQ/X7
 Qq56DUI4pQ/aepi1AqVbU15vaptLgGbnWevvTQ/9yERjyzlAw+RgmvY93f9XjC663Ksch/2yJhO
 6MXmW/8aQ59zgLCcV6AbCYUB9s4xN7/2kpJMDOYinuH7TcN4B8EgpLN41vlrm4uiEjb6xuZDp5m
 kyyqoQC3wUswt7Gi9ul53comSUmRFb2FBTjHMzXvt9vVvmnIva2m1Potk3D0IYNnaCXDfJcnZS9
 h+xKHrmqKgiVQIA0nxvvlcJW8XR5hgkCsDJHXAHVT2BHQDBNisBVqCo73MKo2tBqn/z+7vncy43
 JlI5ptnhcXPpX1gGBfSXtRWqHiI/ed7biSQxlDS8Pw4ZJXlvKVXzZXmjgTKVMQ9EG7nIZzi04ji
 mKscaSe7nSOnEd1fGEQ==
X-Proofpoint-GUID: nAzWbRm83J41IIcstCJhpWRc-jOWTDWM
X-Proofpoint-ORIG-GUID: nAzWbRm83J41IIcstCJhpWRc-jOWTDWM
X-Authority-Analysis: v=2.4 cv=brtBxUai c=1 sm=1 tr=0 ts=694bad40 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=AScg1gZdVb1XvqdcXssA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_010714_027889_9C63C868 
X-CRM114-Status: GOOD (  27.02  )
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
index e0d83ee01b77..2b6ca1f8bed2 100644
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
+			ret = PTR_ERR(new_node);
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


