Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F509C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfhiX1ygP2AvXXrs0gcWYMD2ZsFc5ZoIj7fNw/kuGXI=; b=aqASxBRhIvvIf51QQDuz3vUILI
	JHL51O6zvIXQQsw5DzPNXTHNW38JfAdHSU0r9dMay4X0s0M4RVKVTmLpTTKmO5rbV58YzmaikwQr5
	zjVlQsfESrNWI/tyxz/rZ1Ml5+3Z4bjPWDECluOwuZtuqkFzpamWtKN45+jG9LiANP/lhM2kd3nnj
	mXda6lJPAn+UpITPicylseDCyUb4tT54OU9dZnk7dwfkxBr98/htRG9Xuq/yZYTY7/254IwVlNW3i
	LebQz5Eax9ie7BhUKuLmSesUqj6WTrc2lV4GRLGFl2YzGqvbVpAIylm7yGZrsGf6BBmvOPlQ76xTW
	21WNchqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloH3-0000000Akq2-132J;
	Tue, 12 Aug 2025 12:38:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulkWA-0000000AGSP-0Gjl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 08:38:03 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57C3x8sF029349
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 08:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=nfhiX1ygP2A
	vXXrs0gcWYMD2ZsFc5ZoIj7fNw/kuGXI=; b=a848246DTWrr8GBfTijf6OIzLAI
	HTGVIOm9ZWPzxG9azZHVn6sXBR28x0/U7pScZwW0t6U9fopH9vRS6BvJOLIm4K9o
	zSFoN+rwtXwSDowODTuZd61v3jO3VkgS7SSiNpTe+gm8zkMVKyWmotgOlnycazmt
	nvqKKwSccD8kJP6s2bGcAhoZdnI6u3Xo8ju6VEax8NDfsq8cGb0TKWM6xpvwdkIk
	uVmrquZa99DPS08LBiUfA8pA7O5K9L63pemdNdCmxaTH9eJ2DciVT0bopDqffzmC
	7Wctb8Pc62rlpiGTJ8THL40wP93NU5oKO4ZyiE4p5M1Q1N8CZrlLwWkemSQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dw9sqkff-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 08:38:01 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b26e33ae9d5so9109807a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 01:38:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987880; x=1755592680;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nfhiX1ygP2AvXXrs0gcWYMD2ZsFc5ZoIj7fNw/kuGXI=;
        b=Serdapi885sJrhT/EuHNBhbM7qZ4IkRl5ky7RG72CYES2dbS63ZAKmrnX1cfoUCAsD
         Hfm8fVvhxxyrA0sMqDU66Roan3xPLlY/gUwSDsmJk7uHWJ1OzR0ycZW1ky1Xijgv8zTi
         YG94lWOKkO1Bk5FaX49nFv38TQaUh0a5UcjRajgJN8KuuNUCJF5s5/Mn4JSidk4nMSt4
         TqNgQT45PQLDShiMiU5PzM40oPz1lWjNadRraxt8IeMwxqnYtvNSGbgW5mmc1VjC4YKo
         QwHiAry7tdTjp58ckxrGvJjzGDM5pdn/X2YbxnVf2vJqEZQq/Poq3tCry0H3pQuB5rpM
         3EkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUs751lp8IiWgCv/rJCb6EQ/s4fKQRR6ns5yYHqBVJADWLPMOXIMIxv4ge7AnbbzMAfHv0R4TK5EHMu/b5xMcgG@lists.infradead.org
X-Gm-Message-State: AOJu0YxJNvOjQq47AKIEbDRn1lPvc+kab+kt5Ns/YFwqvHzfc0L0uomj
	cYTrI6f7/P6YMnu17qU5AkX9lRjA6CJ5lC6t0yd7Y3ar9T6U067/CJ7USHo+8ZjNFxCuSwF1+m7
	DVwhUDWwGqSFdPcgT+PqGIod4oOqiOEm3r1U4A8uqOMS1b3/cnpTPa6BY74SFwr+QPFefotUXve
	Q/ew==
X-Gm-Gg: ASbGncuX2B2JcdhGJVO14lHNzkP0ceTnhjJbJ9WOOYFsHi5IjtlPoG6C0XDaY2GxDz+
	xfgpE300OnpwKb2upnkbKTwcubs3ii6B6SVYINe3xzyPErALxzsUa65yeqZ26ePSBRXKfn8NLtQ
	Tvi42MZzWB8Y7PmP1H2u92/qEo/XVL4sGO0hd80JJRWpwNy0S2HZlW5FgNkV8u86wLvfSZ0vBn8
	ZYvywMwz7yjlxcaU3+XQAb/Hl18Ld3mWLP9ssIpd5FZXJU/qk2a4Vd62Cxybu5FzxM0AA4UpPN4
	w/KW2PBVnPFjjRQ6Nsp+yNPAtxEHSxOnbWUNmXp183MKsK6dyaucfpDZ5FQRX0zZNsXwAKFADnK
	HCxNvvuLVHZIDlumkjy4=
X-Received: by 2002:a17:902:fc4c:b0:242:9bca:863c with SMTP id d9443c01a7336-242fc38a0f1mr34907795ad.54.1754987880445;
        Tue, 12 Aug 2025 01:38:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGnaHE1ZpiwMNn4UsN08f5Kfog+omLIJ5L0j2dBUjCm2KGFIcXRJMShYCrtbagzF0cmN8OXg==
X-Received: by 2002:a17:902:fc4c:b0:242:9bca:863c with SMTP id d9443c01a7336-242fc38a0f1mr34907345ad.54.1754987879947;
        Tue, 12 Aug 2025 01:37:59 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-243086849b3sm1915345ad.175.2025.08.12.01.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:37:59 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Yuanfang Zhang <quic_yuanfang@quicinc.com>,
        Mao Jinlong <quic_jinlmao@quicinc.com>,
        Jie Gan <quic_jiegan@quicinc.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v5 4/9] coresight: tmc: add create/clean functions for etr_buf_list
Date: Tue, 12 Aug 2025 16:37:26 +0800
Message-Id: <20250812083731.549-5-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812083731.549-1-jie.gan@oss.qualcomm.com>
References: <20250812083731.549-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=J+Wq7BnS c=1 sm=1 tr=0 ts=689afd69 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=HgEQyz239O5rJIWi_rYA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: BC52R04QySKY56usfnx2ciCEuriJX2IJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAxNSBTYWx0ZWRfX/R0PbcWiw5be
 Z/C1Tt8zKcLwicrcd1lBxOs3u/jgrQfIeUt3PGDyCG8+0r/xHiCCPzXhCsAwaHOpRr7DHdqjOKz
 gCzQxo2q/3hnMyNfqHKiRPX2bKx18HHdL9aZ/lWLlX2j5fVZ8CBnTbRkkadt+785F6vO/Vvl6FT
 590Eaz8wNC9VXPcJ0qYcsFL8hDVOkSlbgkE0/KBSWdv8HVeNxWgXiSGofGlXmKvUvZwyINb+JOn
 OQjs7Bc49YsdzsQt70lbu7L+fceZ2XSaLXgzGV5N4dgsU6LFdTDbONb72UKEiTUDlIz2KMQ5WXt
 bNd9HR0s224795hGv0mKTQe478PvtjGONzNd13GiABZGe/yPd7vD+cEqfUTwQXj7+lrhEJNWVCf
 S0xKCFsB
X-Proofpoint-GUID: BC52R04QySKY56usfnx2ciCEuriJX2IJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_04,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 spamscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090015
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_013802_110040_E13FD792 
X-CRM114-Status: GOOD (  22.92  )
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
 .../hwtracing/coresight/coresight-tmc-etr.c   | 94 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h   |  2 +
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


