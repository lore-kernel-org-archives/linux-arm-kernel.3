Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE8A1CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 02:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sa1G+6fQ53tFpugkuIt/tI8SnQtTsLjqcg2Jm4DIfOQ=; b=KSea1ivD9EmlWmOuC3FFfPar76
	kszNYWfBi+058PGXoPzRDLTe3snVNf3YDDeSlpnKTuVhmSanQ4YO3zxhEEk1B1/baMpkgEYcD9VKw
	l+nfQdmy5ddvpOECla3gngQTZNrPoD4teodxiufb3SoOoAeKM1vGSb21Zwp9QZaWVRoat1Ly/C+zw
	cyUOOKsezyLVFi9QYt2587ado6+M7Xt0M6LaZKTB5QuJGLFBKAfxED+hL0mr6ocnMPBodicOPCSii
	UlwZpxTchBcFQs9+1ArP4MdMstkki9MEpUkxXED2/zjKi+uFoEWeLCFL2axusyE1BQJkaMlGExh4E
	eC93Tm0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvRRD-0000000DyPG-3boz;
	Mon, 08 Sep 2025 02:16:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvRDU-0000000Dune-3Eqz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 02:02:50 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587I88Qg002547
	for <linux-arm-kernel@lists.infradead.org>; Mon, 8 Sep 2025 02:02:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Sa1G+6fQ53tFpugkuIt/tI8SnQtTsLjqcg2Jm4DIfOQ=; b=QwrBeEegAs9RlE3n
	Md82rc2JVOOIPmeqSrHxqcWm/Ou/cYbUrlkMW2/oVBhgPo3loP31DiAhm4J0Ljc5
	TLdCW6k3FAkkDTHMbzK/a0ixRTzpErrs32YeiQVdZi3LzZGVM+Xw8sLdO5aSctOQ
	fXD2iFRexTZSqq3dF7cQLgVaHme9TYK0qPA1n8cqdy/CyoVGelVh3bxGHUiCVb41
	7nHrAoXBnNtmmyjxjqd7r6IHjBSmafSNcs9lYoZV7OdO5ElsCSJ7G7hzLLdUH/FI
	iCANYapDTbmNM53F9IVh3yf8iFMExfhFbv7HmX+m29mwzJm8PIIor0cuEvOHJUPs
	TIYr6A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0jxks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 02:02:47 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-7741f6b939dso2353263b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 07 Sep 2025 19:02:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757296966; x=1757901766;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sa1G+6fQ53tFpugkuIt/tI8SnQtTsLjqcg2Jm4DIfOQ=;
        b=sE0qkg1G/cVhMXpDcIyT+cmmmOZ9RHSX72mPcTjOw3vEgQ5rr3NQ7xV+LupIhs/JnI
         QO3eIUo33eSl1fEvyf8wNK1TGKLk78kvKGn8ICyFqOfY0JWcgvuZ4ZLSoSd0OmtvoQ4U
         1lzRcsXDwJfCeFBlhYtEPAoF5ixVuixQ92zKg/TGPmb8cCk/1Ag8GB8qGL6+lUPZbKvl
         bZbK/oPBXm8Cz14bumxy7T8kRzpp9wJDPZl/AhcOszHqKZ4NQPgyYxaNW5Lalld94Rnn
         +a5ia7AYNrCxU8RhrB/IHyAzAWYklvNTPAjxyVEDn9r0hu36yxhWmk1Cg+242JLHsQ6H
         Kt8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXTlcYP5FSBVrbfAzr8iGxqmX2chfMY27k0YgVmUgvn/jLy4/7twvsoalq4wA8iPe12d49oAWCIpG5hz5Sv9Afx@lists.infradead.org
X-Gm-Message-State: AOJu0YwQCpy29FlDE9Emzd6B/aqqY9Gz2yB67jY7MWWco6yT97r9arvZ
	6pfLTdJLzazDMNLSccqglZ+LPjty5eLIUBFxpjvKJuAjuGfGA9RfhJk5hASKDGBZPDHqSd+4oll
	1CTN4OBhfyaanbDjjf1GhJtktm2tCsWxV7Ae4XV+efJn5UY7LrNuql8hnnQvEtMW92hyiDyf0RC
	L++OYhtGjUYqs8
X-Gm-Gg: ASbGncuBVpLrm8zjQWOGtXHJ4LDnVjo5DwNCppBPdjERbEVfotVGj9HAJgmQJU28foa
	dnDgrMog/89BpyKVtQivg3aTQ+5shT5lr/HL8ur4BlpXdWQGw5o2u7ZERA7417+L+zYwxH9Uvvn
	p821XfxoZ8eurBZQ8gjqq63SrrM/LyxrhIS9+VNmJmYKUmdZShLrgLFWVdjxOVe9Zq53MkskSFj
	/CSq/sFB389n9zWHnIi9lVHkzqGcQJxftT80Ww1OsyVimUugNa56j9Gln6dUd8zZZsH01KUdJe5
	hBWg/XQfrSVAiUm0bqyj0hshTdfgdx6Fcwx5i5MPL9XkNIcZ4BHgTehcyJrNLZ8E6hgmvA5OElR
	pMa8ry8zmBDwjqlEhbbCfydfDPEM=
X-Received: by 2002:a05:6a00:4650:b0:771:e5f3:8840 with SMTP id d2e1a72fcca58-7742e4a0b84mr6365773b3a.13.1757296966309;
        Sun, 07 Sep 2025 19:02:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEy9b5ueRmogyPXkCj4ZLin/RA5hSyK7llchgmHX3Cc/3cKAgWogXXGMxrbrLzv2ZohGQo4mQ==
X-Received: by 2002:a05:6a00:4650:b0:771:e5f3:8840 with SMTP id d2e1a72fcca58-7742e4a0b84mr6365735b3a.13.1757296965814;
        Sun, 07 Sep 2025 19:02:45 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7723f4858e6sm24285076b3a.4.2025.09.07.19.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 19:02:45 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 10:01:56 +0800
Subject: [PATCH v6 4/9] coresight: tmc: add create/clean functions for
 etr_buf_list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-enable-byte-cntr-for-tmc-v6-4-1db9e621441a@oss.qualcomm.com>
References: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
In-Reply-To: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757296940; l=4084;
 i=jie.gan@oss.qualcomm.com; s=20240927; h=from:subject:message-id;
 bh=9ZOyPv6bhMLRODUqaJ5ztJAwxo4d0yjUaaXYVxTCAts=;
 b=Ext6XQLN/vl2Miak4a6zi3Ok0V3h/UEyTz5zaNVhvOcLYXMtifEtk3eMxF/scd+Y50Uy8GxSf
 KSShG160avQD2blhk4TJzYjiKYrGLH/EM2PNXbqrQAafCaUfoSk3nWR
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=OZh7JyRifqJh4xmrcGgmwa8/LCS8O11Q+mtx4aZGmi4=
X-Proofpoint-ORIG-GUID: 8Ney41lvu-FE_haZFLWtGM0VSC7Vn-8q
X-Proofpoint-GUID: 8Ney41lvu-FE_haZFLWtGM0VSC7Vn-8q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX621MWeVB18iW
 whV/MA9vtDZydPuj8pqiiLbpttk0rmn0Ks3QEPbDwMXW3nTR8h6Sc/GPAuld+3VinWsqXgc33xB
 7tvAQeO79QgXbROkdfPlQVWUOrbV9xkeWuktBKH0sq4FteMhJuA4hVdHlWlBA/sF/dcYBZz95m0
 77wuTHoaYH+w+U/kxdDuQuIIBxgrNyhdaNsXmrShSPMts5XAm1RoABzMfzhG6K0gJUpllvE6/Al
 6SGFG6LjX5TSqJ3mHWkaCVz5Qt0zHtMALfHDoKECgvb7rKIoNv8IRxRtB7ilW6CsrTpiMzNRiOj
 iDJW0CEz9TWT0+OlSNKBhjkRxh0LfcWPWa8aKMBZNl3DEGGxzQNCLyKTM6zJS83joc9CFr+UNij
 V4rhnFc7
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68be3947 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=iCabL5HRm4xHoUrnq98A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-07_10,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_190248_934756_74A326E8 
X-CRM114-Status: GOOD (  22.78  )
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
 drivers/hwtracing/coresight/coresight-tmc-etr.c | 94 +++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h     |  2 +
 2 files changed, 96 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index b07fcdb3fe1a..ed15991b3217 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1909,6 +1909,100 @@ const struct coresight_ops tmc_etr_cs_ops = {
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
index 292e25d82b62..ca0cba860d5f 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -459,5 +459,7 @@ void tmc_etr_remove_catu_ops(void);
 struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 				   enum cs_mode mode, void *data);
 extern const struct attribute_group coresight_etr_group;
+void tmc_clean_etr_buf_list(struct tmc_drvdata *drvdata);
+int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes);
 
 #endif

-- 
2.34.1


