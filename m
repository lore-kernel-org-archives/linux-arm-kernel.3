Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E70BCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 07:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQi62HqkpD2bVNcH9CMZOAQ2N9Y6g9An2bvA6I9tnx8=; b=AyT27e9qpvK/ljXLQJD5KslDeN
	1IQnqheOs8SLKoEeN7L2bfBde3X/0XKKkFFwmn05XSSLulSDiuV1Pl0PtWR+ii5gOVk0rM+6aEabd
	UxHjuS22QEnt3+QNASCabp+E3Hnu0FlkROAL8NBynQhhB5Fo4LQ8Bq69zhDnApBzKg1S82jkHuit7
	IcJvCf2br5+nLC+yJau65fwD1gdrVtQ4ZHr1b9+wFawuvK0Hj3dmv+ma3AIaD50S3BJHHTqbEalWL
	GBjgkVARFWtNOv0YA9AcdwFSm0J2OfVA1GxcBeP8FxpmQIWKlUefQ2kr0+x4icOYucmXfCspcLGa6
	YZkiVHNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0b1w-00000009LFL-1bon;
	Mon, 22 Sep 2025 07:32:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0b1t-00000009LCI-1UPd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 07:32:10 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58LMUNBr016729
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 07:32:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yQi62HqkpD2bVNcH9CMZOAQ2N9Y6g9An2bvA6I9tnx8=; b=I37ZHM3HnRw/uJ55
	P/nDwboYOSv1Oj0ZOeyqsVTtsEG3BFCbnlcaebzu7WiuBY+lRTaFjFT9ttYzcHwM
	JO8Qz6EsgdJaFLymqOmlRXp9zV8Cc1yrzw+1qYOA4NbcWiwulWye6VUSb4c3buyt
	FuoyOSh81Jk+YJybSnHtLly2El7Bc24gFH/35ABcYWJCUwhh/exX5QQzE6/tMfBU
	W5Q+ylECuI1ZwZRbp72RcXQgmwVk/W2yLn/0eEnRpMJNFSTi0Rfw0Mz65QqDjDoK
	Axwpzi620r1POTybHh4FEcnmHV5ZqMZlGUZPKVMdAN1XEqk4Ks/83VG2lm/uHghP
	aS7DLw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499mbv3r72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 07:32:08 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b5529da7771so1642097a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 22 Sep 2025 00:32:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758526327; x=1759131127;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yQi62HqkpD2bVNcH9CMZOAQ2N9Y6g9An2bvA6I9tnx8=;
        b=ntigizL7oop4+MbMT756NNyBQkAw9L3DLu5DiCAbgew8v1bjcRK8mfdNszeBNmQuXz
         xqY8ZJ61Q7hlHlVL83wZulHE5qqHd1dYrWx6cox0aaiF7tIcQAMn5MVSHdFhDCT6Ati6
         l583i0GfegTDIpN8wPiUHBqY/oXDOFlsoq7XwzBX9bbFfrCDp4DZw3BAtEJxnrOeoTZf
         Pcg/cevArr8Uar1SnsGs6lcMg1LXpkgv+UICKr3f7uhnw2lRCX2geQM+p26bctlgDjca
         Ghv+TaAWfNnz0zQ4wHmHAcNbqJf2U94YoXVlhHg+Yu+P/kdbPTr8/T7l2C+y8MQXD2d3
         rJ4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXjkBM65/jeJSvwToV4QOYI/iZA5RZzznzx37qSX8b6tbVaY2LzAv+conzDLdG39lXmV1MiIv45o+ezED/gbAdU@lists.infradead.org
X-Gm-Message-State: AOJu0YwwOoE3iB/ETZiD1Pdx4YW/po2mTJLiYV6+CxdMp1MWYXb0cyni
	HsKjZ62kpKl0Of0RM8QWji45LmfD7Bwhl1xT1wxzRKkhtT+NsQMCLVRIUvPBAMKRNLjJmV0rh1i
	heTioQelPX6S99DZHPcvvySZDCE9TSoKYsfCyRhAKUO7Rf6mbi7vR1BmCcceGrt6MPjdmDBQFfj
	Gcl50JVdTWr17B
X-Gm-Gg: ASbGncup8rexDb5OxgTRauKqGu15f7bFZoa9DasBvEtUs/OviorQRSPyGjp6Cvs9C0a
	riqmhsudS2R86PFmyPYAZHb9HG39B8nN0CEL4pTfQXPd0J5KG2p9+0hDl1UpYHST3Mm2cHE10xA
	A9w/0Lry7BqU6M8Mz2MnI6o24iZbiJPYppTbVPdqo1Si0TWfbIdBjLHggquK2x0qjOeFcH3hqfm
	x/oGeXfMADw8TWtMndXkuT91nk/pAorh9sUBoeqWcCqudZbmjgp4vv95xpjSazpexV+xW5z58vI
	PliyRhg3iDsE5/WWrcQ9LYK3rymvWPl0jt/F3l4MaBSlBkSkfY3xCzVMaDgrL8kehcqcwlhbQkL
	7+eTaJSSicJFLZo0CJHItMfM6diY=
X-Received: by 2002:a17:903:2d0:b0:24c:bc02:788b with SMTP id d9443c01a7336-269ba53c0ebmr154946485ad.44.1758526326582;
        Mon, 22 Sep 2025 00:32:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHz+nMZTcyNRr0hckCWlDT/UQXZGGtLRJwMI2Ea3XZY0s6XMVkdw7M/B2+CSosx3seJPnCaMg==
X-Received: by 2002:a17:903:2d0:b0:24c:bc02:788b with SMTP id d9443c01a7336-269ba53c0ebmr154946155ad.44.1758526326067;
        Mon, 22 Sep 2025 00:32:06 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-269800529cdsm123806865ad.22.2025.09.22.00.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 00:32:05 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Mon, 22 Sep 2025 15:31:39 +0800
Subject: [PATCH RFC 1/3] coresight: tmc: add the handle of the event to the
 path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250922-fix_helper_data-v1-1-905e8115a24e@oss.qualcomm.com>
References: <20250922-fix_helper_data-v1-0-905e8115a24e@oss.qualcomm.com>
In-Reply-To: <20250922-fix_helper_data-v1-0-905e8115a24e@oss.qualcomm.com>
To: Carl Worth <carl@os.amperecomputing.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758526319; l=2707;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=tPjMdil7gxCwjC8YbC6YODeceMt/ZeL5Vyiw0lVmYeE=;
 b=4mpDNdSNuz9Jpo6MxISK9MiwQupv+EU8xwmuzB++YqlMXtb4VKLAWUNs3Jrz6rmmZ+PG0/aJl
 VZ9AJQs36h+CreAjWtqFq9ahKJi1iB85MmZ4ayZSfNNrTu4q7s2j3St
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=ZcAdNtVA c=1 sm=1 tr=0 ts=68d0fb78 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=ck2vDrGU2QCsmqff:21 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=vzhER2c_AAAA:8
 a=EUspDBNiAAAA:8 a=ml0eKJYL87Gv2QZM9wAA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=0YTRHmU2iG2pZC6F1fw2:22
X-Proofpoint-ORIG-GUID: FUKPN5EHSGYZVcIvZg_F9SxNSu8L7FV0
X-Proofpoint-GUID: FUKPN5EHSGYZVcIvZg_F9SxNSu8L7FV0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAzMSBTYWx0ZWRfX7h2K1jI/Svy3
 JS/GwHHUwmaZxUCQWxoUrg5e9ANqRYG1OwPn2lMuGrDr+uttZRA/xR5OXPmrsk7PHFvEDkEzKMv
 m9eQ2DTZ6373SoLx1zBiQdKhhzn37eLfIgc8Di+66/17VWy19jq6WW6r/KhWJxVNFstYEdlR1x1
 kMWmMXG9mPR5ESbbs3nzLmzbrOKkZBnTx/ewPN7DhiVZpK2AJPG5Jspp4srmrW7wUOKxv6f/CfJ
 XoQ4QvC4xGaab9zVL6UF7ZpPosGz+HhPLp9D02OEUJll1tduDvd4IGZyZE6lDffKhsGYFv6BNLb
 gEDxa6cxuerrNIud/7zss7Kg27a64n4ELUj+qDncUSMol6GabB0T1M4b0uLGpoWB2QCcaw1m3v0
 +DNNKXu0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-22_01,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_003209_532707_2C97925C 
X-CRM114-Status: GOOD (  21.15  )
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

From: Carl Worth <carl@os.amperecomputing.com>

The handle is essential for retrieving the AUX_EVENT of each CPU and is
required in perf mode. It has been added to the coresight_path so that
dependent devices can access it from the path when needed.

Fixes: 080ee83cc361 ("Coresight: Change functions to accept the coresight_path")
Signed-off-by: Carl Worth <carl@os.amperecomputing.com>
Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-etm-perf.c |  1 +
 drivers/hwtracing/coresight/coresight-tmc-etr.c  |  3 ++-
 include/linux/coresight.h                        | 10 ++++++----
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm-perf.c b/drivers/hwtracing/coresight/coresight-etm-perf.c
index f677c08233ba..5c256af6e54a 100644
--- a/drivers/hwtracing/coresight/coresight-etm-perf.c
+++ b/drivers/hwtracing/coresight/coresight-etm-perf.c
@@ -520,6 +520,7 @@ static void etm_event_start(struct perf_event *event, int flags)
 		goto out;
 
 	path = etm_event_cpu_path(event_data, cpu);
+	path->handle = handle;
 	/* We need a sink, no need to continue without one */
 	sink = coresight_get_sink(path);
 	if (WARN_ON_ONCE(!sink))
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index b07fcdb3fe1a..1040f73f0537 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -1327,7 +1327,8 @@ static int tmc_enable_etr_sink_sysfs(struct coresight_device *csdev)
 struct etr_buf *tmc_etr_get_buffer(struct coresight_device *csdev,
 				   enum cs_mode mode, void *data)
 {
-	struct perf_output_handle *handle = data;
+	struct coresight_path *path = data;
+	struct perf_output_handle *handle = path->handle;
 	struct etr_perf_buffer *etr_perf;
 
 	switch (mode) {
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 6de59ce8ef8c..4591121ae1d4 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -332,12 +332,14 @@ static struct coresight_dev_list (var) = {				\
 
 /**
  * struct coresight_path - data needed by enable/disable path
- * @path_list:              path from source to sink.
- * @trace_id:          trace_id of the whole path.
+ * @path_list:			path from source to sink.
+ * @trace_id:			trace_id of the whole path.
+ * struct perf_output_handle:	handle of the aux_event.
  */
 struct coresight_path {
-	struct list_head	path_list;
-	u8			trace_id;
+	struct list_head		path_list;
+	u8				trace_id;
+	struct perf_output_handle	*handle;
 };
 
 enum cs_mode {

-- 
2.34.1


