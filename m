Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE90260A3820
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 05:48:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=O4z8HmV3;
	dkim=pass (2048-bit key, unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=pps82601-s2048-2026-q3 header.b=JrbiJLBV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=V+HvE9QnqA10mngcxh5K4uhaL32+pv8FcAiS3KEQuaU=; b=O4z8HmV3SEs6DZExo/LOiL+CUq
	yjdQZrl0xvDvsUIbtNbL30Bux3AAfsJGtEfmiGABpVJaKdMoxKxJFc4S4tcuQl24Q5Qq51czsU4hV
	WJoGjXR2cT25F8gdMUnckXp8DcM3gCEE50FqugKE4P8Ohb6g650a7W8h/AhUcwKLWGSxm/8RF58lU
	WUw1UKs71RuGgpfOmCUqIOfPRjOTBvTltiEOiQirfbSAGkIwI/Xec1+0nyHhf1hYURUa6cT9uFEI9
	wEKtvG8e264pBaZmP9pJrRiR5mpf4Q1rhrJpn/uHEM6kOlMAlc7c0ukf6SxzWPKQ+LeLE3WBEl3tM
	/wcwsIgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLDZi-00000001ksH-0w2M;
	Mon, 26 Oct 2026 05:48:50 +0000
Received: from mx0b-00082601.pphosted.com ([67.231.153.30] helo=mx0a-00082601.pphosted.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLDZg-00000001kqm-0zbO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 05:48:49 +0000
Received: from pps.filterd (m0001303.ppops.net [127.0.0.1])
	by m0001303.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 69Q38YlM934645;
	Sun, 25 Oct 2026 22:48:34 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	pps82601-s2048-2026-q3; bh=V+HvE9QnqA10mngcxh5K4uhaL32+pv8FcAiS3
	KEQuaU=; b=JrbiJLBVKJkkQ5Ao9603lTx52demKVp7Ojoo28tarmJ1RYfl4EloO
	FKDucvUCuHA3la9H/Rqq1HI0BEP6NYNsuMJRok/gDzgDxg/sth8PWReLz3JF17M0
	y7wJaXAdohbbGVv2qrYaX8SRuTgW29T8D1t3m1I+JNodK0WnYWJbvYsoKexqGTMf
	CQrPN05BcGBtrP9lvchv8Ky1SkcqGjZqsFepEhPFFcO0yJsqZ8/GDslyaLVSA5o+
	bed3QzWpuO/3yipNbojIDwjZvb6EFPsTkcz699pKvQ3Rju2N4kogpcZcpdwfSfIa
	QebYNtukENCzQhQ5Em7RVqXV0QgzydkWw==
Received: from mail.thefacebook.com ([163.114.134.16])
	by m0001303.ppops.net (PPS) with ESMTPS id 4hgrbbya4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 25 Oct 2026 22:48:33 -0700 (PDT)
Received: from localhost (2620:10d:c085:108::4) by mail.thefacebook.com
 (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.2562.56; Mon, 26 Oct
 2026 05:48:32 +0000
From: Amir Ayupov <aaupov@fb.com>
To: James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Suzuki K
 Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>,
        Alexander
 Shishkin <alexander.shishkin@linux.intel.com>
CC: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
        Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Randy Dunlap
	<rdunlap@infradead.org>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Daniel
 Pereira <danielmaraboo@gmail.com>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-perf-users@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 3/7] coresight: syscfg: Match feature capabilities separately from device class
Date: Sun, 25 Oct 2026 22:48:23 -0700
Message-ID: <6fd94860b3c13c0ddc1a5184d5d9331edc27d9f0.1792989860.git.aaupov@fb.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <cover.1792989860.git.aaupov@fb.com>
References: <cover.1792907332.git.aaupov@fb.com> <cover.1792989860.git.aaupov@fb.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: bQwmj7zWjwGfSQVogxvhW5d_aPvqKpfS
X-Proofpoint-GUID: bQwmj7zWjwGfSQVogxvhW5d_aPvqKpfS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAyMiBTYWx0ZWRfX/whWNXK10H1R
 54hQlKlgZBO7Dij0uYZkBGLNpZLJvRFepfkVV5Pca8+ZGEKMwynLyEScRejTn0s3YTxC+1kr/10
 MD73OPHVC+CUhl884Nxhp4/nbrNFQ6A=
X-Authority-Analysis: v=2.4 cv=R6GWitRX c=1 sm=1 tr=0 ts=6adee9b1 cx=c_pps
 a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=7x6HtfJdh03M6CCDgxCd:22
 a=_78whYxrdx1mplLwxq1U:22 a=FOH2dFAWAAAA:8 a=mif2P4nyd6mfzKxTjdEA:9
 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAyMiBTYWx0ZWRfXxWqezGMmkXje
 8ARic7ZAZ4DQejvysrehxs1xkFGDcLzgYp9wXBUUzm2x2G4wtBfVaXLOyjce7EJvaywtmm2d9o2
 i3S7RYMU+V71Upej/qXOQRn/Eyv+zdELZh76bSNOxBR/NAuhvcai+S31qXA7qp1rW8lSLgj7sRz
 Rwxavfd7XpAD889zgwy2eIDFIboUV3XS0zkt6/GWAj3QGywaHLCE1ECmkfjC5N3xfTpIvuhuuD0
 OCsF7PpPY9TkfeA5k2YrEmRpFrg3CXRem5Nvz429wolUT2+tTzKih1QnjqNL+STqPltwD9+pD2x
 Hi+G47wLgI/RzsLvdtqZOR7HHw7LteHXECABPdIcEFZ5DdICYNMTTfcwyM9mL7WqmPQ/GIorDoN
 ZY5s7CAGgiTc/JmbIifKqXvFRR29uWz6ulyJwYPTEiBk+hyz5MbiSoiOS73/mVjm2wABP0u9kXq
 NJkFhL1d3Qekk438M7w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_224848_412252_104F8D8A 
X-CRM114-Status: GOOD (  19.22  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

A feature loads on a device when the two share any match flag. That works
for device classes, where a feature wants any one of them, but not for
capabilities a device may or may not have: a feature that sets a class
and a capability would still load on a device of that class without the
capability.

Split the match flags into CS_CFG_MATCH_CLASS_MASK for device classes and
CS_CFG_MATCH_CAP_MASK for capabilities. A feature now loads on a device
that shares one of its classes and has all of its capabilities. Check
this once in cscfg_load_feat_csdev(), which both the feature and the
device registration paths call. No capability flags are defined yet, so
matching is unchanged.

Assisted-by: Devmate:Opus-5.5
Signed-off-by: Amir Ayupov <aaupov@fb.com>
---
 .../hwtracing/coresight/coresight-config.h    |  8 ++++
 .../hwtracing/coresight/coresight-syscfg.c    | 37 +++++++++++++------
 2 files changed, 34 insertions(+), 11 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-config.h b/drivers/hwtracing/coresight/coresight-config.h
index ae6295e308131..f04e73b91d9a6 100644
--- a/drivers/hwtracing/coresight/coresight-config.h
+++ b/drivers/hwtracing/coresight/coresight-config.h
@@ -7,6 +7,7 @@
 #ifndef _CORESIGHT_CORESIGHT_CONFIG_H
 #define _CORESIGHT_CORESIGHT_CONFIG_H
 
+#include <linux/bits.h>
 #include <linux/cleanup.h>
 #include <linux/coresight.h>
 #include <linux/types.h>
@@ -30,6 +31,13 @@
  */
 #define CS_CFG_MATCH_CLASS_SRC_ALL	0x0001	/* match any source */
 #define CS_CFG_MATCH_CLASS_SRC_ETM4	0x0002	/* match any ETMv4 device */
+#define CS_CFG_MATCH_CLASS_MASK		GENMASK_U32(7, 0)
+
+/*
+ * flags defining device capabilities a feature can require. A feature loads on
+ * a device that matches one of its classes and has all of its capabilities.
+ */
+#define CS_CFG_MATCH_CAP_MASK		GENMASK_U32(15, 8)
 
 /* flags defining device instance matching - used in config match desc data. */
 #define CS_CFG_MATCH_INST_ANY		0x80000000 /* any instance of a class */
diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index a816c22c87bc8..3ee104e94a4cd 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -171,8 +171,22 @@ cscfg_alloc_csdev_feat(struct coresight_device *csdev, struct cscfg_feature_desc
 	return feat_csdev;
 }
 
-/* load one feature into one coresight device */
+static bool cscfg_match_feat_csdev(u32 feat_flags, u32 csdev_flags)
+{
+	/* The device must be in one of the feature's classes */
+	if (!(feat_flags & csdev_flags & CS_CFG_MATCH_CLASS_MASK))
+		return false;
+
+	/* The device must have every capability the feature requires */
+	if (feat_flags & ~csdev_flags & CS_CFG_MATCH_CAP_MASK)
+		return false;
+
+	return true;
+}
+
+/* Load the feature into the device if it matches, otherwise skip it. */
 static int cscfg_load_feat_csdev(struct coresight_device *csdev,
+				 u32 match_flags,
 				 struct cscfg_feature_desc *feat_desc,
 				 struct cscfg_csdev_feat_ops *ops)
 {
@@ -183,6 +197,9 @@ static int cscfg_load_feat_csdev(struct coresight_device *csdev,
 	if (!ops->load_feat)
 		return -EINVAL;
 
+	if (!cscfg_match_feat_csdev(feat_desc->match_flags, match_flags))
+		return 0;
+
 	feat_csdev = cscfg_alloc_csdev_feat(csdev, feat_desc);
 	if (!feat_csdev)
 		return -ENOMEM;
@@ -212,11 +229,11 @@ static int cscfg_add_feat_to_csdevs(struct cscfg_feature_desc *feat_desc)
 	int err;
 
 	list_for_each_entry(csdev_item, &cscfg_mgr->csdev_desc_list, item) {
-		if (csdev_item->match_flags & feat_desc->match_flags) {
-			err = cscfg_load_feat_csdev(csdev_item->csdev, feat_desc, &csdev_item->ops);
-			if (err)
-				return err;
-		}
+		err = cscfg_load_feat_csdev(csdev_item->csdev,
+					    csdev_item->match_flags, feat_desc,
+					    &csdev_item->ops);
+		if (err)
+			return err;
 	}
 	return 0;
 }
@@ -739,11 +756,9 @@ static int cscfg_add_feats_csdev(struct coresight_device *csdev,
 		return -EINVAL;
 
 	list_for_each_entry(feat_desc, &cscfg_mgr->feat_desc_list, item) {
-		if (feat_desc->match_flags & match_flags) {
-			err = cscfg_load_feat_csdev(csdev, feat_desc, ops);
-			if (err)
-				break;
-		}
+		err = cscfg_load_feat_csdev(csdev, match_flags, feat_desc, ops);
+		if (err)
+			break;
 	}
 	return err;
 }
-- 
2.52.0


