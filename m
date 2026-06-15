Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64EF5CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 12:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GNI6ksAXL/DrtC3IeqIlUaV+PKxeh0XyGU7QIg4Ghf4=; b=3PywvaS3eP9rPpBPSbd5utGB5j
	ojR8lkbrsiB4JndTGcgdVExVn6IR4LsWappSAeGsju1cD+iJ91Cd5muRPmrH4NOQMwcjlfcasaGVt
	N03NfJ7pTSrbQlHr/TYBUuHOjduSonyBNMm0w47I/FJ3e8r4MQDPpBbKJzOfohbA72ZukHPgmcQPf
	+d7shiW4dnvWKmJk0M1fBfDSKbNiEGD0lfKoM18Nb4eg+Lh6eYvQ0hE5UIk/K5wZV+J0b1OgPNNvk
	cWCgPpfNOjw2u0GCUpP9cGZ7BPxXm9/1N55yqLgAvopnblrE2TMswgjIDf/BYtbvdAgHHeEmh1Wqm
	2aA78atw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6V9-0000000ECfE-312p;
	Mon, 15 Jun 2026 12:33:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ6V6-0000000ECdG-1RjT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 12:33:13 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FApf1s151836
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 12:33:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GNI6ksAXL/DrtC3IeqIlUaV+PKxeh0XyGU7QIg4Ghf4=; b=DtNF5OxLlhgajS4o
	bDf8sqxRm1zOlnY0BqD+pTkSGsc3M5JH7F8MhQnUF/vtqrrsoln2HmMRY34PAGqt
	3htW0zOmT38PnmFb4RyJEKZp3RuclOHFKPm6FAt7CaU+Mv3ppUkAisXYL/B+AYAm
	Gv+kw/eES6OQTTveK4bDdBFbT/G5gwb3VBqTyw8PCFoiIYWIK6JzvMEYKZz2jWWX
	9te+ZL+zahtK9WBJfVGX919TNYy6JmfNh78VFS7OdL+bnrz6rELlf3knXDYpMbyR
	aH/j5+o75imRGz/p9fk3KZNWH/ch+TlS7pX4fLA4XbLOVlQeWiWQG2HZanctcatr
	V0CCLw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetf0nrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 12:33:11 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-842cb4c62f9so2735313b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 05:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781526790; x=1782131590; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GNI6ksAXL/DrtC3IeqIlUaV+PKxeh0XyGU7QIg4Ghf4=;
        b=e2T/J/XYlF24ubE1XFHLqipsd9pmrp8Mck36ujadHoc1ZO5AZaBPDOgDf0vTbsmmuJ
         Ky0Tr5kBcX26OILd3GC5/x7Gn42LOCz4g9X+ya9dMyG2meQzD3QXChck21E8wW3LVNzV
         ngl/JjhmbG9HCSjYBiOpDsshRnDB1LMAGGZb51yUx4h6/tbWNZHkCwTlfBnK8PTh0fHr
         EXCJEN9VCndm/O3XZK/LmP3H4uvfHPnnYM5Folv1qU7gETB88IBsioIQ60Qb+2a6CPIn
         w7nXIKkbVLcac1FLynIUNAc0XyQeZwFQQn6qgbXH9TBCM0dax5r9DsY5ULVh2RorPqrv
         4q8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781526790; x=1782131590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GNI6ksAXL/DrtC3IeqIlUaV+PKxeh0XyGU7QIg4Ghf4=;
        b=kXe76wCHlNq3nLLSLN86oogcAkxAH7xNaKg60phNS2iCD5Nff8/xe2GWH+1SBoF+b3
         GiPDN/GuLCkXtclmAVlu7biXu9ZYS0Y/ceFwP6n/mAzabhsTNBml8japQ4p8F7Dt8CIw
         7sfcE4Jjl4zkAth4s6GiyrTQz8dQhnrbGG/X8ncB9ZNASAU3lzjes0HDIIS9FVWrOH1A
         Fsa2ttnRDcuyqoabu7Sc9D2zfz398z4YEq7vu4aMy/9nN0pZ371VEqzRVDU/+QBhHYnZ
         peXra0lBocPAW6yJt2GgUwPr6EVMo2BEOWQk4q+LzWq8k1sdi/Uw/MKc68InlfeHpia6
         7MLw==
X-Forwarded-Encrypted: i=1; AFNElJ95p0H0wfAaokXrcFxPSbC+zYmPUQ8P8+9nsoXgifZdJOInPFn8TCRg/1yzJkXVoNmEHLGAMIo2u98PXTYEyKi4@lists.infradead.org
X-Gm-Message-State: AOJu0YziPgeSDdEBqr6PzgaxsJoh+VhO+H4XUeJ3zOInKKAUbqmo8SA8
	MTJ4A1aa8zI3XcSAEyDswOwqQEqdobG2jX9TkfvUFmgxM7qcNcArLUDoUF+742+QDoO75Qp1XoG
	gc23ppaXon49xtRN/uR230ANI8I8wAPcTutAwWYgkJUAEO7N4ycak9z2nR9n1v7HuDVaFzxAu22
	i9x0BKH28gEQ==
X-Gm-Gg: Acq92OHzc7yUPzwo9thpChIcwSRfPLeYQzPXp4lEnAk8x9qcVnzXLFiuckg8gjbJOXC
	zlVFUNb495OOyyZKlPmwgwDYydVWGF2JVzZFyVg5o4SWpb2WsgaFqI0JsiemNWlzJzbBGYlQCnf
	guRCBe7lc9fz1N1uozA9miOhTY+PvTQJNwvjUtZYpp8thLpwkmK4RyGhC8D35gyhqkLndIQ1dR3
	Nw9+yqFnkEWq73jHv3xqt1UCeh6SL8fPJZIbawRv1xxldILnstUi6K+Ikvq6I5hy174BnENru1r
	i8in49duEF6XFTg+KVEvOWBxuEkuvliOLRFJMbWqE5vKdH3JPnBY4w8DaUGqU6bMVOa8QY+mm0C
	808If1oMYFGk0bZWy06zVoqNoRQ1t4WBPXXmvu3pjvedi9edPDqA8MWyWwzS9CxKoaETJLYADZM
	Cain0CzG4Xy1lPeQ==
X-Received: by 2002:a05:6a00:2d27:b0:842:6259:5e2b with SMTP id d2e1a72fcca58-843497cf3famr10610728b3a.33.1781526790076;
        Mon, 15 Jun 2026 05:33:10 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d27:b0:842:6259:5e2b with SMTP id d2e1a72fcca58-843497cf3famr10610691b3a.33.1781526789523;
        Mon, 15 Jun 2026 05:33:09 -0700 (PDT)
Received: from jinlmao-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434b03fd0bsm9968393b3a.50.2026.06.15.05.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:33:09 -0700 (PDT)
From: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 20:32:29 +0800
Subject: [PATCH v10 1/5] coresight: cti: Convert trigger usage fields to
 dynamic
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260615-extended_cti-v10-1-1c1694b6d8ed@oss.qualcomm.com>
References: <20260615-extended_cti-v10-0-1c1694b6d8ed@oss.qualcomm.com>
In-Reply-To: <20260615-extended_cti-v10-0-1c1694b6d8ed@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, quic_yingdeng@quicinc.com,
        tingwei.zhang@oss.qualcomm.com,
        Jinlong Mao <jinlong.mao@oss.qualcomm.com>, jie.gan@oss.qualcomm.com,
        Yingchao Deng <yingchao.deng@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781526782; l=12354;
 i=yingchao.deng@oss.qualcomm.com; s=20260611; h=from:subject:message-id;
 bh=TAOMHPwZ/2RDPjN7qrbBuJn2lZJcCG9fJ4QI233NyUI=;
 b=VHCzRSuqfbFvWtVe5AcdjRQlCzVjmpVG5VrCy1cejDmCXWkgaagQBiARuQs+cbtJLfZw+A3C/
 2L3ZOGVqO5xDdtv6p+EDJJ2dVQg9Ek+YiGTGVfIV+eBpMezTP/3oYf2
X-Developer-Key: i=yingchao.deng@oss.qualcomm.com; a=ed25519;
 pk=+y3U2mIt7mf0C+x6qBUD670cd9S2QV+yl5015bUYMgs=
X-Authority-Analysis: v=2.4 cv=adxRWxot c=1 sm=1 tr=0 ts=6a2ff107 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=RZ9YlW45n8Y3xjBI2tUA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: t3nsOAG0AkfjadT6pmcqx0vcwknAujeV
X-Proofpoint-ORIG-GUID: t3nsOAG0AkfjadT6pmcqx0vcwknAujeV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEzMiBTYWx0ZWRfX37KinT2OSThc
 fOVaiKkkSdEERmDAeTaNkHCXIFvYyc2ciQTQoXRwUoIfoe0iNaWDGJ2o6qqPoCNFu/kRoasvlA6
 kNcw3nk5jSEPr4rvcB94gcKVa9qhbvQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEzMiBTYWx0ZWRfX+jXEal/wmkk2
 ebfh0tBv31lllBCSYj4EnCGlpVmmynf4afrWkv/lUtb3WGNVUmWBWJ1FPrwm9mRiXPeXCqK/7NQ
 6JKuYY9/k19IusBJdkGucmzXz/4sdfPGLl5xziXoxqM3mtPUESJ+7O6Zo7GdTwTpZsYVBygkdTA
 d/xpcTmZbuW92VOQ3VUF3sBrcYp9UdszNnb42oFPjDLC5/NJYyffcraYf4JTU3dzdanLUgiIhvj
 cgGu6DivLwV+OxoF2HNhnq4dSmhqWCOm7wVKKEAqC9unbnIIVjAFtkW9GyFZ7sS0cV0BC+cpgsz
 M6qTXyRdA8w5d2QmjYIbn9q/TWrMbOME0ec3LufttUk+nllnPi9x4aFzdZC2puZosqIEDiK8nS/
 3fnJjWoohLoFUyQVMfMepP6RP/vsjl7CY2hP8V25/TBKJRKH0BZv9XGFVwqgvfDyJrK1A1S3dqU
 a71P8put9YbIG5D/nmw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 impostorscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606150132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_053312_510753_7A93E9D9 
X-CRM114-Status: GOOD (  22.51  )
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

Replace the fixed-size u32 fields in the cti_config and cti_trig_grp
structure with dynamically allocated bitmaps and arrays. This allows
memory to be allocated based on the actual number of triggers during probe
time, reducing memory footprint and improving scalability for platforms
with varying trigger counts.

Also add a bounds check in cti_allocate_trig_con() to ensure the caller
does not pass in/out signal counts larger than nr_trig_max.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: Yingchao Deng <yingchao.deng@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c   | 70 +++++++++++++++++-----
 .../hwtracing/coresight/coresight-cti-platform.c   | 26 +++++---
 drivers/hwtracing/coresight/coresight-cti-sysfs.c  | 14 ++---
 drivers/hwtracing/coresight/coresight-cti.h        | 12 ++--
 4 files changed, 87 insertions(+), 35 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index b2c9a4db13b4..572798ab504c 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -161,8 +161,8 @@ void cti_write_intack(struct device *dev, u32 ackval)
 /* DEVID[19:16] - number of CTM channels */
 #define CTI_DEVID_CTMCHANNELS(devid_val) ((int) BMVAL(devid_val, 16, 19))
 
-static void cti_set_default_config(struct device *dev,
-				   struct cti_drvdata *drvdata)
+static int cti_set_default_config(struct device *dev,
+				  struct cti_drvdata *drvdata)
 {
 	struct cti_config *config = &drvdata->config;
 	u32 devid;
@@ -181,6 +181,31 @@ static void cti_set_default_config(struct device *dev,
 		config->nr_trig_max = CTIINOUTEN_MAX;
 	}
 
+	config->trig_in_use = devm_bitmap_zalloc(dev, config->nr_trig_max,
+						 GFP_KERNEL);
+	if (!config->trig_in_use)
+		return -ENOMEM;
+
+	config->trig_out_use = devm_bitmap_zalloc(dev, config->nr_trig_max,
+						  GFP_KERNEL);
+	if (!config->trig_out_use)
+		return -ENOMEM;
+
+	config->trig_out_filter = devm_bitmap_zalloc(dev, config->nr_trig_max,
+						     GFP_KERNEL);
+	if (!config->trig_out_filter)
+		return -ENOMEM;
+
+	config->ctiinen = devm_kcalloc(dev, config->nr_trig_max, sizeof(u32),
+				       GFP_KERNEL);
+	if (!config->ctiinen)
+		return -ENOMEM;
+
+	config->ctiouten = devm_kcalloc(dev, config->nr_trig_max, sizeof(u32),
+					GFP_KERNEL);
+	if (!config->ctiouten)
+		return -ENOMEM;
+
 	config->nr_ctm_channels = CTI_DEVID_CTMCHANNELS(devid);
 
 	/* Most regs default to 0 as zalloc'ed except...*/
@@ -189,6 +214,7 @@ static void cti_set_default_config(struct device *dev,
 	config->enable_req_count = 0;
 
 	config->asicctl_impl = !!FIELD_GET(GENMASK(4, 0), devid);
+	return 0;
 }
 
 /*
@@ -219,8 +245,10 @@ int cti_add_connection_entry(struct device *dev, struct cti_drvdata *drvdata,
 	cti_dev->nr_trig_con++;
 
 	/* add connection usage bit info to overall info */
-	drvdata->config.trig_in_use |= tc->con_in->used_mask;
-	drvdata->config.trig_out_use |= tc->con_out->used_mask;
+	bitmap_or(drvdata->config.trig_in_use, drvdata->config.trig_in_use,
+		  tc->con_in->used_mask, drvdata->config.nr_trig_max);
+	bitmap_or(drvdata->config.trig_out_use, drvdata->config.trig_out_use,
+		  tc->con_out->used_mask, drvdata->config.nr_trig_max);
 
 	return 0;
 }
@@ -231,6 +259,14 @@ struct cti_trig_con *cti_allocate_trig_con(struct device *dev, int in_sigs,
 {
 	struct cti_trig_con *tc = NULL;
 	struct cti_trig_grp *in = NULL, *out = NULL;
+	struct cti_drvdata *drvdata = dev_get_drvdata(dev);
+	int n_trigs = drvdata->config.nr_trig_max;
+
+	if (in_sigs > n_trigs || out_sigs > n_trigs) {
+		dev_err(dev, "trigger signal is out of range: in=%d out=%d nr_max=%d\n",
+			in_sigs, out_sigs, n_trigs);
+		return NULL;
+	}
 
 	tc = devm_kzalloc(dev, sizeof(struct cti_trig_con), GFP_KERNEL);
 	if (!tc)
@@ -242,12 +278,20 @@ struct cti_trig_con *cti_allocate_trig_con(struct device *dev, int in_sigs,
 	if (!in)
 		return NULL;
 
+	in->used_mask = devm_bitmap_zalloc(dev, n_trigs, GFP_KERNEL);
+	if (!in->used_mask)
+		return NULL;
+
 	out = devm_kzalloc(dev,
 			   offsetof(struct cti_trig_grp, sig_types[out_sigs]),
 			   GFP_KERNEL);
 	if (!out)
 		return NULL;
 
+	out->used_mask = devm_bitmap_zalloc(dev, n_trigs, GFP_KERNEL);
+	if (!out->used_mask)
+		return NULL;
+
 	tc->con_in = in;
 	tc->con_out = out;
 	tc->con_in->nr_sigs = in_sigs;
@@ -263,7 +307,6 @@ int cti_add_default_connection(struct device *dev, struct cti_drvdata *drvdata)
 {
 	int ret = 0;
 	int n_trigs = drvdata->config.nr_trig_max;
-	u32 n_trig_mask = GENMASK(n_trigs - 1, 0);
 	struct cti_trig_con *tc = NULL;
 
 	/*
@@ -274,8 +317,8 @@ int cti_add_default_connection(struct device *dev, struct cti_drvdata *drvdata)
 	if (!tc)
 		return -ENOMEM;
 
-	tc->con_in->used_mask = n_trig_mask;
-	tc->con_out->used_mask = n_trig_mask;
+	bitmap_fill(tc->con_in->used_mask, n_trigs);
+	bitmap_fill(tc->con_out->used_mask, n_trigs);
 	ret = cti_add_connection_entry(dev, drvdata, tc, NULL, "default");
 	return ret;
 }
@@ -288,7 +331,6 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 {
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *config = &drvdata->config;
-	u32 trig_bitmask;
 	u32 chan_bitmask;
 	u32 reg_value;
 	int reg_offset;
@@ -298,18 +340,16 @@ int cti_channel_trig_op(struct device *dev, enum cti_chan_op op,
 	   (trigger_idx >= config->nr_trig_max))
 		return -EINVAL;
 
-	trig_bitmask = BIT(trigger_idx);
-
 	/* ensure registered triggers and not out filtered */
 	if (direction == CTI_TRIG_IN)	{
-		if (!(trig_bitmask & config->trig_in_use))
+		if (!(test_bit(trigger_idx, config->trig_in_use)))
 			return -EINVAL;
 	} else {
-		if (!(trig_bitmask & config->trig_out_use))
+		if (!(test_bit(trigger_idx, config->trig_out_use)))
 			return -EINVAL;
 
 		if ((config->trig_filter_enable) &&
-		    (config->trig_out_filter & trig_bitmask))
+		    test_bit(trigger_idx, config->trig_out_filter))
 			return -EINVAL;
 	}
 
@@ -687,7 +727,9 @@ static int cti_probe(struct amba_device *adev, const struct amba_id *id)
 	raw_spin_lock_init(&drvdata->spinlock);
 
 	/* initialise CTI driver config values */
-	cti_set_default_config(dev, drvdata);
+	ret = cti_set_default_config(dev, drvdata);
+	if (ret)
+		return ret;
 
 	pdata = coresight_cti_get_platform_data(dev);
 	if (IS_ERR(pdata)) {
diff --git a/drivers/hwtracing/coresight/coresight-cti-platform.c b/drivers/hwtracing/coresight/coresight-cti-platform.c
index d6d5388705c3..ba5a7e4b6bff 100644
--- a/drivers/hwtracing/coresight/coresight-cti-platform.c
+++ b/drivers/hwtracing/coresight/coresight-cti-platform.c
@@ -136,8 +136,8 @@ static int cti_plat_create_v8_etm_connection(struct device *dev,
 		goto create_v8_etm_out;
 
 	/* build connection data */
-	tc->con_in->used_mask = 0xF0; /* sigs <4,5,6,7> */
-	tc->con_out->used_mask = 0xF0; /* sigs <4,5,6,7> */
+	bitmap_set(tc->con_in->used_mask, 4, 4); /* sigs <4,5,6,7> */
+	bitmap_set(tc->con_out->used_mask, 4, 4); /* sigs <4,5,6,7> */
 
 	/*
 	 * The EXTOUT type signals from the ETM are connected to a set of input
@@ -194,10 +194,10 @@ static int cti_plat_create_v8_connections(struct device *dev,
 		goto of_create_v8_out;
 
 	/* Set the v8 PE CTI connection data */
-	tc->con_in->used_mask = 0x3; /* sigs <0 1> */
+	bitmap_set(tc->con_in->used_mask, 0, 2); /* sigs <0 1> */
 	tc->con_in->sig_types[0] = PE_DBGTRIGGER;
 	tc->con_in->sig_types[1] = PE_PMUIRQ;
-	tc->con_out->used_mask = 0x7; /* sigs <0 1 2 > */
+	bitmap_set(tc->con_out->used_mask, 0, 3); /* sigs <0 1 2 > */
 	tc->con_out->sig_types[0] = PE_EDBGREQ;
 	tc->con_out->sig_types[1] = PE_DBGRESTART;
 	tc->con_out->sig_types[2] = PE_CTIIRQ;
@@ -213,7 +213,7 @@ static int cti_plat_create_v8_connections(struct device *dev,
 		goto of_create_v8_out;
 
 	/* filter pe_edbgreq - PE trigout sig <0> */
-	drvdata->config.trig_out_filter |= 0x1;
+	set_bit(0, drvdata->config.trig_out_filter);
 
 of_create_v8_out:
 	return ret;
@@ -257,7 +257,7 @@ static int cti_plat_read_trig_group(struct cti_trig_grp *tgrp,
 	if (!err) {
 		/* set the signal usage mask */
 		for (idx = 0; idx < tgrp->nr_sigs; idx++)
-			tgrp->used_mask |= BIT(values[idx]);
+			set_bit(values[idx], tgrp->used_mask);
 	}
 
 	kfree(values);
@@ -316,24 +316,34 @@ static int cti_plat_process_filter_sigs(struct cti_drvdata *drvdata,
 {
 	struct cti_trig_grp *tg = NULL;
 	int err = 0, nr_filter_sigs;
+	int nr_trigs = drvdata->config.nr_trig_max;
 
 	nr_filter_sigs = cti_plat_count_sig_elements(fwnode,
 						     CTI_DT_FILTER_OUT_SIGS);
 	if (nr_filter_sigs == 0)
 		return 0;
 
-	if (nr_filter_sigs > drvdata->config.nr_trig_max)
+	if (nr_filter_sigs > nr_trigs)
 		return -EINVAL;
 
 	tg = kzalloc_obj(*tg);
 	if (!tg)
 		return -ENOMEM;
 
+	tg->used_mask = bitmap_zalloc(nr_trigs, GFP_KERNEL);
+	if (!tg->used_mask) {
+		kfree(tg);
+		return -ENOMEM;
+	}
+
 	tg->nr_sigs = nr_filter_sigs;
 	err = cti_plat_read_trig_group(tg, fwnode, CTI_DT_FILTER_OUT_SIGS);
 	if (!err)
-		drvdata->config.trig_out_filter |= tg->used_mask;
+		bitmap_or(drvdata->config.trig_out_filter,
+			  drvdata->config.trig_out_filter,
+			  tg->used_mask, nr_trigs);
 
+	bitmap_free(tg->used_mask);
 	kfree(tg);
 	return err;
 }
diff --git a/drivers/hwtracing/coresight/coresight-cti-sysfs.c b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
index 3fe2c916d228..2bbfa405cb6b 100644
--- a/drivers/hwtracing/coresight/coresight-cti-sysfs.c
+++ b/drivers/hwtracing/coresight/coresight-cti-sysfs.c
@@ -719,12 +719,12 @@ static ssize_t trigout_filtered_show(struct device *dev,
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *cfg = &drvdata->config;
 	int nr_trig_max = cfg->nr_trig_max;
-	unsigned long mask = cfg->trig_out_filter;
+	unsigned long *mask = cfg->trig_out_filter;
 
-	if (mask == 0)
+	if (bitmap_empty(mask, nr_trig_max))
 		return 0;
 
-	return sysfs_emit(buf, "%*pbl\n", nr_trig_max, &mask);
+	return sysfs_emit(buf, "%*pbl\n", nr_trig_max, mask);
 }
 static DEVICE_ATTR_RO(trigout_filtered);
 
@@ -931,9 +931,9 @@ static ssize_t trigin_sig_show(struct device *dev,
 	struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *cfg = &drvdata->config;
-	unsigned long mask = con->con_in->used_mask;
+	unsigned long *mask = con->con_in->used_mask;
 
-	return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, &mask);
+	return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, mask);
 }
 
 static ssize_t trigout_sig_show(struct device *dev,
@@ -945,9 +945,9 @@ static ssize_t trigout_sig_show(struct device *dev,
 	struct cti_trig_con *con = (struct cti_trig_con *)ext_attr->var;
 	struct cti_drvdata *drvdata = dev_get_drvdata(dev->parent);
 	struct cti_config *cfg = &drvdata->config;
-	unsigned long mask = con->con_out->used_mask;
+	unsigned long *mask = con->con_out->used_mask;
 
-	return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, &mask);
+	return sysfs_emit(buf, "%*pbl\n", cfg->nr_trig_max, mask);
 }
 
 /* convert a sig type id to a name */
diff --git a/drivers/hwtracing/coresight/coresight-cti.h b/drivers/hwtracing/coresight/coresight-cti.h
index c5f9e79fabc6..ef079fc18b72 100644
--- a/drivers/hwtracing/coresight/coresight-cti.h
+++ b/drivers/hwtracing/coresight/coresight-cti.h
@@ -68,7 +68,7 @@ struct fwnode_handle;
  */
 struct cti_trig_grp {
 	int nr_sigs;
-	u32 used_mask;
+	unsigned long *used_mask;
 	int sig_types[];
 };
 
@@ -145,17 +145,17 @@ struct cti_config {
 	int enable_req_count;
 
 	/* registered triggers and filtering */
-	u32 trig_in_use;
-	u32 trig_out_use;
-	u32 trig_out_filter;
+	unsigned long *trig_in_use;
+	unsigned long *trig_out_use;
+	unsigned long *trig_out_filter;
 	bool trig_filter_enable;
 	u8 xtrig_rchan_sel;
 
 	/* cti cross trig programmable regs */
 	u32 ctiappset;
 	u8 ctiinout_sel;
-	u32 ctiinen[CTIINOUTEN_MAX];
-	u32 ctiouten[CTIINOUTEN_MAX];
+	u32 *ctiinen;
+	u32 *ctiouten;
 	u32 ctigate;
 	u32 asicctl;
 };

-- 
2.43.0


