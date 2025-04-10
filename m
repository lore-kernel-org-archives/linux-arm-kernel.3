Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C373C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 01:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/hbu+J38OslkyyaqUl3TD0hhOvybI072r0nxhEaLcKQ=; b=4s32HxtqBg7fFHeCPfiMFJlMKY
	r1Ar7VE0AdaiDD46r543ah9YhdRzupE3X6dKF3meKFWfEnniHuXiTVMhpL1MZyzf60mBuOm0PJsYh
	DzfB/hobW8E8x6a7QeNZ1kOmO1fRGNR68AVxSGE1A/NLk4ZE27Y7pteRC1LByJ76eBdqzHKs3zeUE
	Zo2tay3lLHgElr2aHzcZZtVW1HFe1nSxKV88+2hrpwf+Gw81OXyCmtxOiIxY3U1MKimNFYRaNM+hh
	2S0IgieFm+tVAZDzSy46UXHdqvX2X9IPwHHdyLmQzukmhyZC+N0D8T7KDwg9lKTlqJOeLpH9yf2Im
	RCvnBnyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gr6-00000008xM6-0JOb;
	Thu, 10 Apr 2025 01:37:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gnd-00000008weE-202Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 01:33:50 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539H4PU7027520
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 01:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/hbu+J38Osl
	kyyaqUl3TD0hhOvybI072r0nxhEaLcKQ=; b=H9yJUA9bw3vdhwFOIqJSwaKyDPs
	VH7D+VDM0GQ7CVhfxld0MT66iEEwGqU+XnAmi5bFqjn22L85W9fVXZW7IMSfWJ9T
	XUI+zEbIUhB8RiaZ6fddg/RtKp5jaP2vZg1QRg5WNgeAHP2Ixrnw8eUEoB9ETKA2
	M1p52z+mdIRgU4FIW7mwx6rLK2NYKABmFJMelJA2BDu6WtX8nPhkElITkFuw+Ir+
	q7l31eH/ItXMqwT84tH53XwCEYzRv5eYNZkc5XBh7KrqXmYzg5J3a5w3d6yVsZPX
	iZS+8GihNblIq6kFOr2Eyzk5+8PP0QQvLLUzpoIyN432Tl28GS4Ax+SVHaw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrnbjh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 01:33:48 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2240a960f9cso3061025ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 18:33:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744248827; x=1744853627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/hbu+J38OslkyyaqUl3TD0hhOvybI072r0nxhEaLcKQ=;
        b=FUyJ9XAauH7uYrzBuNV4kChWRpDpCIYXjWDZOGNvh6rw3L1rxwen1YFg6F3RrUleAD
         7qHrE5MzdBpALEwPZ6SFgIMkPNAaR0QtogtH18T4PNwJvb9Q4lX5AIK5+D3R6yd32aKf
         9ZdGwHu1NaQbASxRLrTYHl+Wo/Xda+VGmJRyr+aH6clEYj3047jyBWIwzskFK6q0ZEOs
         zkxUF822Q9qK//e2UNhKvvE5JkzVOnvhbE/OGT9+tNWj//B+gBlC1rCSo/OQCLmGLOaB
         gJ3kh3K4qJRfwWsOayJodvDXpeKXnHhAVSUCTSalYzz5O9rg4b9UAR1yc+NNTbSCmDHZ
         n3Jg==
X-Forwarded-Encrypted: i=1; AJvYcCVhiW/MVFHMquBzZGgP54rPEDtmi645SHs6JZJZ8s9NXkWb2iEFI8CcKXzc75aL/TEGA7YoBcfTTMBd/U9ig41h@lists.infradead.org
X-Gm-Message-State: AOJu0YwElyiaSUXnzEEV02d0j19seSn67cxUFh9xsYA/BuyhKgqXWgtj
	DtZuiVLflr2CHWFRXKb0QWp/f7D7EgliZD+35CQEgqmihtdiuvyLDJ6FZnnynkpKb8M/nikUaZQ
	iTGju+r3S+q8nuzFopSAo3mXjo8CsIikLZ0om6FvNbrCwPN5Ykf7CDbf6eJ1P2CU9Sq5trMnOLw
	==
X-Gm-Gg: ASbGncvOj5tHDjuo5xxzG5z8n/rz4lAPH457VbpR/4XZ0c986bIAREzt+L1PgwqnCR/
	bbJxFRYMbmTgYhRb2bPxQRGABjKC+GDLv/pcPEiXNZs0JyeZxlLQg0lXAhX6snExBk629kX0JSS
	fkBeAeRjHxGUvOe5KxH/9nnbERaiwybsxVxYNEJ4MSN381Kps3ZE9HtCl70QcNENvc1iEJ/L982
	2rxtY79IvM8mKucHcHwG5y2Ukx0GP5//x0sMKcdTFtnUnSCz3C7/DhZfEz6TaZHy1HNsF2tbhkz
	AIYOtBNVOyYpNd0XE2vOXqPCfO/XoKElgetO37/T20w/QWTD3zMctKR4106m3UZCl0hVFDs=
X-Received: by 2002:a17:902:d2ca:b0:223:5a6e:b2c with SMTP id d9443c01a7336-22b2edd2d5amr14924705ad.17.1744248826345;
        Wed, 09 Apr 2025 18:33:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEbZM9pDJc+QEgclUt66GbWgtrAL7JKUny/wc6kcLIOC46cExebvjVHkQBn+tXU3uwE77c53w==
X-Received: by 2002:a17:902:d2ca:b0:223:5a6e:b2c with SMTP id d9443c01a7336-22b2edd2d5amr14924405ad.17.1744248825829;
        Wed, 09 Apr 2025 18:33:45 -0700 (PDT)
Received: from jiegan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb596sm18801815ad.220.2025.04.09.18.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 18:33:45 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 1/5] coresight: tmc: Introduce new APIs to get the RWP offset of ETR buffer
Date: Thu, 10 Apr 2025 09:33:26 +0800
Message-Id: <20250410013330.3609482-2-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
References: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: CIZICk8jfFfFZf5ZO-My5-MxAP5nexjv
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f71ffc cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=QSMfYRlErQPllaMuWGUA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: CIZICk8jfFfFZf5ZO-My5-MxAP5nexjv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=937 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_183349_654927_DEC600C1 
X-CRM114-Status: GOOD (  19.27  )
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

The new functions calculate and return the offset to the write pointer of
the ETR buffer based on whether the memory mode is SG, flat or reserved.
The functions have the RWP offset can directly read data from ETR buffer,
enabling the transfer of data to any required location.

Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../hwtracing/coresight/coresight-tmc-etr.c   | 62 +++++++++++++++++++
 drivers/hwtracing/coresight/coresight-tmc.h   |  1 +
 2 files changed, 63 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 76a8cb29b68a..ed8a89fcd3fc 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1236,6 +1236,68 @@ void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
 	drvdata->etr_buf = NULL;
 }
 
+static long tmc_etr_flat_resrv_get_rwp_offset(struct tmc_drvdata *drvdata)
+{
+	dma_addr_t paddr = drvdata->sysfs_buf->hwaddr;
+	u64 rwp;
+
+	rwp = tmc_read_rwp(drvdata);
+	return rwp - paddr;
+}
+
+static long tmc_etr_sg_get_rwp_offset(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf *etr_buf = drvdata->sysfs_buf;
+	struct etr_sg_table *etr_table = etr_buf->private;
+	struct tmc_sg_table *table = etr_table->sg_table;
+	long w_offset;
+	u64 rwp;
+
+	rwp = tmc_read_rwp(drvdata);
+	w_offset = tmc_sg_get_data_page_offset(table, rwp);
+
+	return w_offset;
+}
+
+/**
+ * tmc_etr_get_rwp_offset() - Retrieving the offset to the write pointer.
+ *
+ * @drvdata: driver data of TMC device.
+ *
+ * Retrieve the offset to the write pointer of the ETR
+ * buffer based on whether the memory mode is SG, flat or reserved.
+ *
+ * Return w_offset of the ETR buffer upon success, else the error number.
+ */
+long tmc_etr_get_rwp_offset(struct tmc_drvdata *drvdata)
+{
+	struct etr_buf *etr_buf;
+	long w_offset;
+
+	if (WARN_ON(!drvdata) || WARN_ON(!drvdata->sysfs_buf) ||
+	    WARN_ON(drvdata->config_type != TMC_CONFIG_TYPE_ETR))
+		return -EINVAL;
+
+	etr_buf = drvdata->sysfs_buf;
+	/* Disable the ETR if it is running */
+	if (coresight_get_mode(drvdata->csdev) != CS_MODE_DISABLED)
+		__tmc_etr_disable_hw(drvdata);
+
+	if (etr_buf->mode == ETR_MODE_ETR_SG)
+		w_offset = tmc_etr_sg_get_rwp_offset(drvdata);
+	else if (etr_buf->mode == ETR_MODE_FLAT || etr_buf->mode == ETR_MODE_RESRV)
+		w_offset = tmc_etr_flat_resrv_get_rwp_offset(drvdata);
+	else
+		w_offset = -EINVAL;
+
+	/* Restart the ETR if the mode is not disabled */
+	if (coresight_get_mode(drvdata->csdev) != CS_MODE_DISABLED)
+		__tmc_etr_enable_hw(drvdata);
+
+	return w_offset;
+}
+EXPORT_SYMBOL_GPL(tmc_etr_get_rwp_offset);
+
 static struct etr_buf *tmc_etr_get_sysfs_buffer(struct coresight_device *csdev)
 {
 	int ret = 0;
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 6541a27a018e..945c69f6e6ca 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -442,5 +442,6 @@ void tmc_etr_remove_catu_ops(void);
 struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 				   enum cs_mode mode, void *data);
 extern const struct attribute_group coresight_etr_group;
+long tmc_etr_get_rwp_offset(struct tmc_drvdata *drvdata);
 
 #endif
-- 
2.34.1


