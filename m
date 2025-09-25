Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC174CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 10:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8CLWFz7RuVZjswljNK7uzTq6+mx1G/m7eJ8hvj0C84=; b=JEjkf1yAJZ7hit3BXfdHhpPWF2
	sPXFb0oH4Fhmjjt/61hjgtABbbe0dFYEHJuTbb/DvI48qrus5nsewLimYOpqRanMJP1dYy3jrsj+u
	JenFnm7sf7fv3jE1DLVC6Fk4DT0qgfb9C33SAYs5wgSpjVjtBxuO6PEqU7z+yd8AusqKKQZIyQ3D3
	7ATggqEkKMx+3UTlbA7M3zjAJ7IicwYevd7opX/NvYoCwKI3odjGo4fWmxUk5BMdAC6aVDk2px9YI
	CymVncr0RyfqKWKnYlSfk9Rw+fVeGRb4PCpYX92T4VCFoXZy/KinBgRum9IuGgXnHkNhgTCttzWBb
	7mMWaZOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1jRG-00000008CrM-3ned;
	Thu, 25 Sep 2025 10:43:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1jRA-00000008ClE-04dk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 10:42:57 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PA6YK3025158
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 10:42:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J8CLWFz7RuVZjswljNK7uzTq6+mx1G/m7eJ8hvj0C84=; b=joVRSOVc/dm0JlQb
	PhYDpKrP1FGgPA3nBgvwjqWPuCImILBpZtq0TD4+fvgAbqnUj6gDmiRKX6FoEh1T
	5bquaprrLQS0jLF0MAZ/4wXER42RYVIGYu5aKEB+PGHYW++DfEw4WmU9TGmOhWgO
	G9vMTObCTlZeGtIxtaEZoxsVIUBkzBCxHUkGhUTdP9VyYL7f6ZmHIUfkZW9oVf1O
	bjrt6bhj8yYx/HHXy64Dk6sCPxtgngk+6xvICtQum/Y8RXHpMJbalvLEPtNEFcUD
	Cp1Nqj6VTlKuU2tQMJIzPWi2MM/AO/Fd0+TknvJRxPR9EtPjHglBCNNIp1k6w9Ec
	Z6FCow==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499kv17spv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 10:42:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-267fa90a2fbso19438355ad.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 03:42:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758796974; x=1759401774;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J8CLWFz7RuVZjswljNK7uzTq6+mx1G/m7eJ8hvj0C84=;
        b=ui0axXxlyM779jsTuDEZp2uG+XQH/pgCA3oE/VvH+GOCOvsRxFJindfAwkl7NUTWCt
         gQriaSSvLbx8cjng0Andzpi8TmxFFUtL/gFlt82GlXCwJw0r4NG/9q6/nME0NqBM7QVO
         SYbD1mpabxlV6xiXSlGr3OdfiiV0qdq+zvTcZSfGpREC6LOvGI8r9tVgRiU+JynKl9F6
         pxsr5JG1SRMJoE9OMNPavB3I/S6eIbphc/r6vYLglE+irfJe7W0dA4izqTc29x2pFPUX
         fUopX5+JGkYmOMB4k3P81Eyma3TXItYcpMkRh88ZH6Z6IUli/jgUzP9Q9qkPGccmDqWh
         6ITw==
X-Forwarded-Encrypted: i=1; AJvYcCW3IaSfylsjGxGqUPpu6ziEUmly9Ue7ua/SixYfP13oXrFuSTyzgbRIU2L8wFv8ZPBn0ll/VDEsUmOiFZMNvK5K@lists.infradead.org
X-Gm-Message-State: AOJu0YwsCoiLNJjDmKYfk1ujXIORyyn8GiBBHcqhKi1wh+l2fy/N6upB
	lad7pSf/IA5pH2h1FcsMVyYTBi9hzoCp6IbED4UWwpMu5k4In5u9mk3DgS9CEn/B2tmIJQ57CTo
	rTeo39L4EBwB9oWkvmS5sOjLPUHcwWLR0HXMytG679qsrkyQFOrwZPlbYjgPrnjL5BQN+QblW/i
	uoIw==
X-Gm-Gg: ASbGncsRBTJnrJvm5PqM7u9WQpCk4q7k0sg7C03+Y4FFRYjfdklfeVWQpjAhMW5JWao
	xUP1pH3gDOHv6wA1JLbDB9d+vRjI+WJEmVm8ylypyxziTPBHqhn2VYAYMYfOGQk8i/7j/D5eqok
	jKYxQfLOzYKfhQTwvOxw48lBEa592JAy2aftY8vkOWi1oO4/yGDBD8vm3GSvfAO9uhuDgNiqDJm
	y5d6mWixm34SIuF6EpjHUg/hVbhFfpCUP5yRRIEVXGN8kkkfhWIwR74Hkjch1/i0H+LT+cFGDnV
	16WxiwIt/ZfshRlkiLsVTGfJNNVIoc/Fzmxto1oS/KWG3WT/xWPZDw7ypJq0b4BcQKuOJz1Geb5
	BL6KlodrKtwpNEcFPWxK8gn78CBk=
X-Received: by 2002:a17:902:ec85:b0:267:9601:dca0 with SMTP id d9443c01a7336-27ed7218e13mr24249045ad.27.1758796973828;
        Thu, 25 Sep 2025 03:42:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0G8/NZgKJnhaVOdgJM09KwUXkWI+O18jBUOCePLdswg8OrdCjedFCc4xPV83qBAglXjkWmg==
X-Received: by 2002:a17:902:ec85:b0:267:9601:dca0 with SMTP id d9443c01a7336-27ed7218e13mr24248715ad.27.1758796973333;
        Thu, 25 Sep 2025 03:42:53 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6727ea7sm21046845ad.61.2025.09.25.03.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 03:42:53 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 18:42:31 +0800
Subject: [PATCH v2 1/3] coresight: tmc: add the handle of the event to the
 path
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-fix_helper_data-v2-1-edd8a07c1646@oss.qualcomm.com>
References: <20250925-fix_helper_data-v2-0-edd8a07c1646@oss.qualcomm.com>
In-Reply-To: <20250925-fix_helper_data-v2-0-edd8a07c1646@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jie Gan <jie.gan@oss.qualcomm.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Carl Worth <carl@os.amperecomputing.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758796966; l=3140;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=tHg1S0/CMUeFUXHjzpKxW+80GxEVQnIjGvOC2sWdHXQ=;
 b=45YdQeepVPMs1UJloA72VJbiseOSEnSPvY2N9hB65a2vqAiKihPLdSEGOvAeVAcsWyyueiMy7
 lsX3i2P8+rUC80cqx/w+RsXyQIrecHWkUkf06n9rVmK/BMnntQdMKKH
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-GUID: JIOsdFZBHDD2EL0AyoN-L3ZJL321GSCt
X-Authority-Analysis: v=2.4 cv=RO2zH5i+ c=1 sm=1 tr=0 ts=68d51caf cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=ck2vDrGU2QCsmqff:21 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=vzhER2c_AAAA:8
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=3z9VKJkIq1Abr3NU0PoA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=0YTRHmU2iG2pZC6F1fw2:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyNSBTYWx0ZWRfX8G9IRS6uyERc
 VleUZe8otQ1/JppdxHdQ5pggCR9g+LnbQM80i+D02fanuZpXac4hO1ii7GGqrwifMPGzoSB3XO6
 0eJWjS9YcReeIgrUdn9XLmtx+L4uEC96h1P9WwHPsjqusX6lgeJ+arQ9ItiC1rbNEtgs7thjHYk
 PsbljIUgfUvvmpA/w3fpnFldT4Vjlz1IXDkdJHyxXNA0WrApQ65pOoQuBpKZwVxJJwjJUExG3vh
 MJGtAPYbRX/YvxSiqTMjdsT9SjDyFxrLzhQ1j1U1AZjR4Qcc3MiiszK+mbUxCFt1ApMLdv0Cdiy
 mHecibR0BXD+8oXPooK7NCZcSs7ab5TfKSb5HtPId4Bp16V2EeTxfn36YYtx3K7BPbzL13xiF0c
 RDU+46RF
X-Proofpoint-ORIG-GUID: JIOsdFZBHDD2EL0AyoN-L3ZJL321GSCt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_034256_184479_C9002177 
X-CRM114-Status: GOOD (  21.09  )
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

The existing bug can be reproduced with:
perf record -e cs_etm//k -C 0-9 dd if=/dev/zero of=/dev/null

Showing an oops as follows:
Unable to handle kernel paging request at virtual address 000f6e84934ed19e

Call trace:
 tmc_etr_get_buffer+0x30/0x80 [coresight_tmc] (P)
 catu_enable_hw+0xbc/0x3d0 [coresight_catu]
 catu_enable+0x70/0xe0 [coresight_catu]
 coresight_enable_path+0xb0/0x258 [coresight]

Fixes: 080ee83cc361 ("Coresight: Change functions to accept the coresight_path")
Signed-off-by: Carl Worth <carl@os.amperecomputing.com>
Reviewed-by: Leo Yan <leo.yan@arm.com>
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
index 6de59ce8ef8c..2626105e3719 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -332,12 +332,14 @@ static struct coresight_dev_list (var) = {				\
 
 /**
  * struct coresight_path - data needed by enable/disable path
- * @path_list:              path from source to sink.
- * @trace_id:          trace_id of the whole path.
+ * @path_list:		path from source to sink.
+ * @trace_id:		trace_id of the whole path.
+ * @handle:		handle of the aux_event.
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


