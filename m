Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD5CCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 06:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4xLxLPPJJ37uZZ+ZptiZV4B7ZVIbN7nFKLLB0qfoAU=; b=iVl6PVGPLMwFqXtJqOg/uV8Qze
	qwEwrUowd3GDZuKmPYlcyvdOUGLTXzjBrZfsHPI0OXH9yoUIgo+FhK0wBIc7qB80jSvUGRG2Eefp5
	qI2OzTxtcKCNZFm9OFQjFe1JHVmk20N8aRgGe+81aUAHmIXVGjbl5tkax8ASqX/CBrv7oqZBcPbc4
	LOB/eS9SvJUKI32QZuPmJZn8PUeOetOWXYYXE3AWTPJy3w5CMU0pNuqjfsVZju/Fp6JAw5qA6Bdo1
	RfHgeecEmiZH9XZrleCB5ZBOHuhYJ1XL498351E/NTCW/8T9iK49zhsqWlaVv67cSmFt2ISGLSDph
	Nw2T/oxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdCF-0000000FLDb-0Gp1;
	Tue, 28 Oct 2025 06:28:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdC5-0000000FL4i-2x6R
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 06:28:34 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59RL3Osc2750294
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 06:28:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y4xLxLPPJJ37uZZ+ZptiZV4B7ZVIbN7nFKLLB0qfoAU=; b=NZzUxsY/wYd/IPcs
	SOFdU3O7eKMw728p4mmgAh73BPK72Lo25EmvUmcAlGsbydgVq2nMqDPMImsvUy5H
	sLi4gfhizzBChJB2MgJOOLRfk0kJkrJySqE0ssJBXa+sqOddipj2d/z1SC0xscx5
	lFn2h2OB/FiEVu2HAS/Raj00NHCf1eXFiqrH70yapdZ8zI+zUOJJclV7RwX7hYJQ
	fc8eWxYY2x0pZ9OzXyPH2W0M1ixwX4M7KSx8C+OHq/uD48t9Te3ba7djA3USXFWE
	u1ngdjJg+Ps4cW5ZNuIi4A99RaV1ykmzafHM9Jn7sMJf05SCppoNbDfI5iGUkgDC
	TBtF8g==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a28nstw87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 06:28:33 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-290ab8f5af6so35436275ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Oct 2025 23:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761632913; x=1762237713;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y4xLxLPPJJ37uZZ+ZptiZV4B7ZVIbN7nFKLLB0qfoAU=;
        b=F6D+PWBcN6JW2hONdovJKUdcRfTdfpH1Aynqd1qRne64NwFJ729gfBbZx2OQOQTBn9
         Ifipayhd3omURv7NMZCS/nO+kx34ZhKi6tCSiqRyYxC8wV+SGJItNo2RkMekdOnla/kd
         fxDaopXe2rZWacBGE69aUExACAN6duQPEbD02UrrI7VylGBAI+EdSJyyprXBiw1VUXWk
         /tI1zPKuC+KLgh567Yt7YsG68Nat4WfdDklExBvtIYCelq3sDV174f/N0AoXRdYHPG1Q
         K9P/llsPy10D/rcDfkWgth4rQgG77UVLczmJ1Sk/VqVBvjvsC9K85Q8/j1c4YkpTeoQt
         tE6w==
X-Forwarded-Encrypted: i=1; AJvYcCWAxRxwzxSJeX8t9Imr1nM6A65uIjOP3L8aZnfDSkHTPHlaoeRLiL0GHXy9x/uGp2RcXSP6JQ43PK8IGpjLVZad@lists.infradead.org
X-Gm-Message-State: AOJu0YzJ31AWIHnDoGqzwlY0zaJ4GZ9vd/sXeFoFJMo9UPfpZmq8sWFx
	eXIm7g4IxBQg5JD/b+6lntd5Oft2UVgQ4idsaX0wVgELuLe2rFICCx+sATNyWV3eejIAKYi3cV0
	zdJRJAizQhX0BShpu75zPShSSSlBgqAfwxHG1/Pl6Z/60KI3g1rv5uszNSThGaLTmESuYv9cvxN
	v8CA==
X-Gm-Gg: ASbGncvO1Wi5liYKOWIXScawMlK/E/tXdij8bueDkIweuAlz5KIfGOjEN6Sy3OGRP4P
	mgnXkBnkpL/lPZw8En3/zEp3gkcUfn0HK4pO9996OFb+2jZA4AHTqLscwWZIZKx1ntUu+U7NAF/
	V3/t4x+Ke1VVi1tqQmjsM7Wm8Yk1VTvy2+kwCbHWtguuG6Fi2f86mSJRCpVotIW9vf1ntgEavDX
	sN6O6bBwe3m0Xe0wZ4yhfn0Z8CsEpaSvZVypH/0IZwWRVsH9WbKse/+AbKZ1/4LQC1jHU91YZn8
	AsVgbwQMQ3UjrkIX6znqTTZ77xUIiLmi1jalCT5ywh3e7RMZuGkHMNm+ZStWkBYpUa8t9xQY7Tv
	5NZ5zRcjwsF/6ow6kAMa7MQeKBmneLmIQXEOzs9L2Mj9lbKcoqQJqXbpM
X-Received: by 2002:a17:902:cec3:b0:26d:e984:8157 with SMTP id d9443c01a7336-294cb3916c2mr24210825ad.8.1761632912331;
        Mon, 27 Oct 2025 23:28:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsl++Agz9c3ubNi9GgpEKLSw2gjzo0PZ2U8dAXsigtV8l5SB0KneSo4vetGMv9vfVE6Yt4nw==
X-Received: by 2002:a17:902:cec3:b0:26d:e984:8157 with SMTP id d9443c01a7336-294cb3916c2mr24209385ad.8.1761632910108;
        Mon, 27 Oct 2025 23:28:30 -0700 (PDT)
Received: from hu-yuanfang-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf359asm102503265ad.12.2025.10.27.23.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 23:28:29 -0700 (PDT)
From: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
Date: Mon, 27 Oct 2025 23:28:13 -0700
Subject: [PATCH 11/12] coresight: add 'cs_mode' to link enable functions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251027-cpu_cluster_component_pm-v1-11-31355ac588c2@oss.qualcomm.com>
References: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
In-Reply-To: <20251027-cpu_cluster_component_pm-v1-0-31355ac588c2@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: kernel@oss.qualcomm.com, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761632890; l=9332;
 i=yuanfang.zhang@oss.qualcomm.com; s=20250814; h=from:subject:message-id;
 bh=RHNEaGFIW3gpssw+cDFCs3tIQo8VomibUYN0C5T6Wmw=;
 b=rBSWcpEK5L0N76d9lDJjO+2xVcgd0HyPQtiJDwUETgJrGbIE7jjS4M/bf2UYaV+RH2+5C31OG
 BZ8U5uDoHp6BeJTY53bqc/p2TOD0qAj1uC9WUYimjqjN69EJhGYhfC9
X-Developer-Key: i=yuanfang.zhang@oss.qualcomm.com; a=ed25519;
 pk=9oS/FoPW5k0CsqSDDrPlnV+kVIOUaAe0O5pr4M1wHgY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA1NCBTYWx0ZWRfXzvAIrOZcHmLZ
 qf3q8mWEo/ohfP/KNnMGbtnjRbsJa8BGnZXGJkjqMay6dWLFbs7qOoHDMZD7EFeVQlB9uGCDE8a
 Fe+oWC/hMPlMpU8NVXw11wSj80H4OvVcTSLFxuJy4S16fzt4J5xSufjr3COpM6OJR6DLc144djH
 nKBA+wJaKQfdnWA1hXS+9wPjmCKCoDLfS8dnQHwKVwmA3yhrm198dZOCfED+sKUyimZKPv3eghx
 lsUZhBD07+cvCAUZkzLjhp6IDzAPk1sQisoenTvQuPPZAnzgLbs0vV5U5s1fu78HQChGg4Sm5zi
 lqSZb2B59ve1/SHw/iAPXyGJG+2zFLlaVQzwgyexHV7MMEVmUDqJljbSNXQpqlstiTdnzWDo/qr
 9j4J5EKqPry66GSxZ4flvV+2P9wqPA==
X-Authority-Analysis: v=2.4 cv=RIW+3oi+ c=1 sm=1 tr=0 ts=69006291 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_ycWAoKx6aYVZ7XB0rUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: PmaN924k479M5lC4s5rnvAz7rfeim8pK
X-Proofpoint-GUID: PmaN924k479M5lC4s5rnvAz7rfeim8pK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_232833_758689_2FAD19E0 
X-CRM114-Status: GOOD (  18.64  )
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

Extend the coresight link enable interfaces to accept an
`enum cs_mode` argument. This allows link drivers to distinguish
between sysfs and perf coresight modes when enabling links.

This change is necessary because enabling CPU cluster links may involve
calling `smp_call_function_single()`, which is unsafe in perf mode due
to context constraints. By passing the tracing mode explicitly, link
drivers can apply mode-specific logic to avoid unsafe operations.

Signed-off-by: Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-core.c       |  7 ++++---
 drivers/hwtracing/coresight/coresight-funnel.c     | 21 +++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-replicator.c | 23 +++++++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tmc-etf.c    | 19 +++++++++++++++++-
 drivers/hwtracing/coresight/coresight-tnoc.c       |  3 ++-
 drivers/hwtracing/coresight/coresight-tpda.c       |  3 ++-
 include/linux/coresight.h                          |  3 ++-
 7 files changed, 70 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 3267192f0c1c667b0570b9100c3c449064e7fb5e..2e62005655dbcb9b504a1a5be392a5b00ed567d4 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -313,7 +313,8 @@ static void coresight_disable_sink(struct coresight_device *csdev)
 static int coresight_enable_link(struct coresight_device *csdev,
 				 struct coresight_device *parent,
 				 struct coresight_device *child,
-				 struct coresight_device *source)
+				 struct coresight_device *source,
+				 enum cs_mode mode)
 {
 	int link_subtype;
 	struct coresight_connection *inconn, *outconn;
@@ -330,7 +331,7 @@ static int coresight_enable_link(struct coresight_device *csdev,
 	if (link_subtype == CORESIGHT_DEV_SUBTYPE_LINK_SPLIT && IS_ERR(outconn))
 		return PTR_ERR(outconn);
 
-	return link_ops(csdev)->enable(csdev, inconn, outconn);
+	return link_ops(csdev)->enable(csdev, inconn, outconn, mode);
 }
 
 static void coresight_disable_link(struct coresight_device *csdev,
@@ -546,7 +547,7 @@ int coresight_enable_path(struct coresight_path *path, enum cs_mode mode,
 		case CORESIGHT_DEV_TYPE_LINK:
 			parent = list_prev_entry(nd, link)->csdev;
 			child = list_next_entry(nd, link)->csdev;
-			ret = coresight_enable_link(csdev, parent, child, source);
+			ret = coresight_enable_link(csdev, parent, child, source, mode);
 			if (ret)
 				goto err_disable_helpers;
 			break;
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 43b9287a865eb26ce021521e4a5f193c48188bba..fd8dcd541454bd804210fa0f80f2dcc49a908717 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -121,7 +121,8 @@ static int funnel_enable_hw(struct funnel_drvdata *drvdata, int port)
 
 static int funnel_enable(struct coresight_device *csdev,
 			 struct coresight_connection *in,
-			 struct coresight_connection *out)
+			 struct coresight_connection *out,
+			 enum cs_mode mode)
 {
 	int rc = 0;
 	struct funnel_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
@@ -135,6 +136,23 @@ static int funnel_enable(struct coresight_device *csdev,
 	else
 		in->dest_refcnt++;
 
+	if (mode == CS_MODE_PERF) {
+		if (first_enable) {
+			if (drvdata->cpumask &&
+			    !cpumask_test_cpu(smp_processor_id(), drvdata->cpumask)) {
+				raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+				return -EINVAL;
+			}
+
+			if (drvdata->base)
+				rc = dynamic_funnel_enable_hw(drvdata, in->dest_port);
+			if (!rc)
+				in->dest_refcnt++;
+		}
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+		return rc;
+	}
+
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	if (first_enable) {
@@ -183,6 +201,7 @@ static void funnel_disable(struct coresight_device *csdev,
 			dynamic_funnel_disable_hw(drvdata, in->dest_port);
 		last_disable = true;
 	}
+
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	if (last_disable)
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index 22c9bc71817d238c2d4ddffbb42678bf792b29af..6cb57763f9b10b68f9e129adfd6a448edce2637d 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -199,7 +199,8 @@ static int replicator_enable_hw(struct replicator_drvdata *drvdata,
 
 static int replicator_enable(struct coresight_device *csdev,
 			     struct coresight_connection *in,
-			     struct coresight_connection *out)
+			     struct coresight_connection *out,
+			     enum cs_mode mode)
 {
 	int rc = 0;
 	struct replicator_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
@@ -212,6 +213,25 @@ static int replicator_enable(struct coresight_device *csdev,
 		first_enable = true;
 	else
 		out->src_refcnt++;
+
+	if (mode == CS_MODE_PERF) {
+		if (first_enable) {
+			if (drvdata->cpumask &&
+			    !cpumask_test_cpu(smp_processor_id(), drvdata->cpumask)) {
+				raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+				return -EINVAL;
+			}
+
+			if (drvdata->base)
+				rc = dynamic_replicator_enable(drvdata, in->dest_port,
+							       out->src_port);
+			if (!rc)
+				out->src_refcnt++;
+		}
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+		return rc;
+	}
+
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	if (first_enable) {
@@ -272,6 +292,7 @@ static void replicator_disable(struct coresight_device *csdev,
 						   out->src_port);
 		last_disable = true;
 	}
+
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 
 	if (last_disable)
diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
index b8a1c10d4b4c49144449b33f26710cf11713b338..281c3b316dc3c0d4fab4f06b7093825b741cf595 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
@@ -424,7 +424,8 @@ static int tmc_disable_etf_sink(struct coresight_device *csdev)
 
 static int tmc_enable_etf_link(struct coresight_device *csdev,
 			       struct coresight_connection *in,
-			       struct coresight_connection *out)
+			       struct coresight_connection *out,
+			       enum cs_mode mode)
 {
 	int ret = 0;
 	unsigned long flags;
@@ -443,6 +444,22 @@ static int tmc_enable_etf_link(struct coresight_device *csdev,
 	if (!first_enable)
 		csdev->refcnt++;
 
+	if (mode == CS_MODE_PERF) {
+		if (first_enable) {
+			if (drvdata->cpumask &&
+			    !cpumask_test_cpu(smp_processor_id(), drvdata->cpumask)) {
+				raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+				return -EINVAL;
+			}
+
+			ret = tmc_etf_enable_hw_local(drvdata);
+			if (!ret)
+				csdev->refcnt++;
+		}
+		raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+		return ret;
+	}
+
 	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
 	if (first_enable) {
 		ret = tmc_etf_enable_hw(drvdata);
diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index ff9a0a9cfe96e5f5e3077c750ea2f890cdd50d94..48e9e685b9439d92bdaae9e40d3b3bc2d1ac1cd2 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -73,7 +73,8 @@ static void trace_noc_enable_hw(struct trace_noc_drvdata *drvdata)
 }
 
 static int trace_noc_enable(struct coresight_device *csdev, struct coresight_connection *inport,
-			    struct coresight_connection *outport)
+			    struct coresight_connection *outport,
+			    enum cs_mode mode)
 {
 	struct trace_noc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 
diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index 333b3cb236859f0feb1498f4ab81037c772143fd..4af433145728c9e5b600a4e58dfe8931447200f8 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -197,7 +197,8 @@ static int __tpda_enable(struct tpda_drvdata *drvdata, int port)
 
 static int tpda_enable(struct coresight_device *csdev,
 		       struct coresight_connection *in,
-		       struct coresight_connection *out)
+		       struct coresight_connection *out,
+		       enum cs_mode mode)
 {
 	struct tpda_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
 	int ret = 0;
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 6de59ce8ef8ca45c29e2f09c1b979eb7686b685f..f4d522dc096cb9d0f8d2d8b7ce8a90574bf7c5e1 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -385,7 +385,8 @@ struct coresight_ops_sink {
 struct coresight_ops_link {
 	int (*enable)(struct coresight_device *csdev,
 		      struct coresight_connection *in,
-		      struct coresight_connection *out);
+		      struct coresight_connection *out,
+		      enum cs_mode mode);
 	void (*disable)(struct coresight_device *csdev,
 			struct coresight_connection *in,
 			struct coresight_connection *out);

-- 
2.34.1


