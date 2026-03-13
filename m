Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEC49105F782
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 09:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L48WYHJuhhkO9dFp26TAm1fpnJhYIgGr7XXmW7vKLpc=; b=zTqQbu1kW0uRIMVpWnhV9S8aKT
	PTQgE7K98aoIV5aOU6vWJsvfvEQRFhKE9/Rporlg70xqQvYEgpKfFNNsJAUt+Ban5inllBB3+nw/3
	b0T8M2ZV8YUU9We9W/po0cZBBRikIsXb8V7Gz2tfzIWDnJkiK3cGK1fblaq+7Y9VkapW4z/bMPpmS
	hxAODs64z4z8044lmBl3u6D3JZJLipwWe3Lj/8R35YJ5+fLT/FhuRnerc2LelmC+u/F8IwX9YhIGF
	/spzhwOv8K+Nm6lT4/ZAb+gtpJjp39qXz/BfD/STWTfl1XXTAVlOvGFJbYIFC3Lwhm5qyclx2SSys
	XJamp/Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yQ6-0000000HL6H-15U8;
	Fri, 13 Mar 2026 09:02:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yQ3-0000000HL4I-0Uzm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 09:02:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tege1574617
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 09:02:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L48WYHJuhhkO9dFp26TAm1fpnJhYIgGr7XXmW7vKLpc=; b=p0TDtLkTPv3bP2+K
	76YjEI1hQq1paFdfLoK5BaWrKQUr5vNoltpAW2sJyXJXn1hc430mPyRk2He1zifa
	Lw/VAXOITvm27EB8SzltmyC9fZdEGyPzFFMRHWBbU70ULyH5ES9T3OwmmCQf4edg
	tc5d8yE6A7LL+4ASrl53OXsQ1eF+k7+7dpkxRFxurrIQ6y5rRG4e2wdT3e23ltkG
	g+OOKGIvSjklQRAFen4QL1jGjKc3rLtRhEgmpImS7noZaUsPjYqaFM6oNH4xHusT
	ZfUOqlwBaid3JFMHZqPacT6n5Rav+FpEvtESIW5utWA1bkZabqvMdRVul+YOwErF
	vOQFEg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh53nbkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 09:02:53 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-358e425c261so2191738a91.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 02:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773392573; x=1773997373; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L48WYHJuhhkO9dFp26TAm1fpnJhYIgGr7XXmW7vKLpc=;
        b=bltBWjhVPoK6hx/6DhZQf3zKUH1dCcEzkKvbEkfGcxhjTT9Oty8oR1GePRXVeMst0S
         +OqlAGGD0k0+wGHj9yWD81XizlKzo5rsw0egJIVbBgvRb6WP9Wm0Wfxa4WujYk/8HGoO
         HWF16ICm0+JptNPR3EkLSQ/0cYDzh0minm1yzKrgQCYpy3083jZGHwKx6qexmpENH4Kq
         3R8FAZ+gExsK25vzA65j6Ea4uRxC1K111NE06td4e03kdBkO+oI7Qxh/Hf4IzcJpYREL
         SAsOmFB9gXAB8P5wy/FNm71G+ZB/JlJTFzoN3lqjoyxmdroZiCEnjRv2/I5EVI6ewZnu
         6OGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773392573; x=1773997373;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L48WYHJuhhkO9dFp26TAm1fpnJhYIgGr7XXmW7vKLpc=;
        b=BocU50KdbZ9BSJXANrxg0Ia1bPxnXSD1id/+36aIeUA+XLC3GwLimvc9rHTvyUdy7S
         d4Aj0RATLYHaqn8QgSl2cYmQuUd46AMcPqe6M0jaXWbMhlQG50C2A+3rNTdF3AVcmJ1p
         feP3OZIK3fkr6DNsKHQ5dO5yxxwz7hnlUuKyhUAeDoadFwgsB7S0Fwy89MIMsOQKvZtc
         chwPTOgI62IlNEEn7GUiO1Z1GPw6NfndMrtqNegNsTngVVOqk+Zb+NpD4/Iwvj7k00hR
         qtP1oeoOl8Tn9/tm6AJ2w/j4DoOBw95tPfR8GZfBb30oO3/C6js8fiYW2a0JW3ApMNmS
         938Q==
X-Forwarded-Encrypted: i=1; AJvYcCWSwMtUOiulZ+xt/5kz8cQGWNlxaJxHlQVHr2XBIQl4h3LABB1UbIrUfiHA0MSAyFMq7dMTPUJ7Q9dJWpFmLy/J@lists.infradead.org
X-Gm-Message-State: AOJu0YyJK6ZdVj8Kk8zXGTCJtB/SLzbHJ0R5/MPMfVnTGrOpaS+VAiKB
	5B/5twyTbnqWZyTjHu89cY5vZ894wS27sCABDiFwnyr2tg+MjG2CPC3vdPVsqp2ISfSPFJ9hqUJ
	ohkR0wXAvWanrZA+5Y6Dpzeu6RTRl7Pgv0Lo8rdBzti+nkPW7M4jO67oMV/D8GVfhtGvmkoQtO6
	vbOw==
X-Gm-Gg: ATEYQzwEM9sUfPEfedmZIQLrNPJMcU+0Tg14xeUHTetKS3XxSwummdlVS3ze5wW2u9n
	6wplkpVIph3201wa85Cq8XvJi64HP97rWQX+g1Jp1ZOYtfgdr/2e4TDfa7GUE+CHJCf3C/iWyXu
	unNWoqzIOiCBATs7wv/X5/q43HBEy8GYYewuJR0/VPmB2IIN5suwSnBMZoRh9JsTR5oVaPcM70z
	da6LWK0LKYRmD4xzLDigs3ylCqiS9H508EnrZ3Kc94dqT/S4xtjRiOvWm5cYj25nc8PMaTNjbma
	zLtTR4nudtzdBzf9rxRfPA3s6tSHpyXwNpW6JM+c70BsLIgfL8blAFOl0yL1FW84GZlMXQmhXmK
	Q50aH2wK8FgzBkEFy9UEDd7GCFlkfK5xovN8KArRKJ/TwTHwJcSxexsa+NLvUQrTaGSaHkHGEPj
	swEagdREkN
X-Received: by 2002:a17:90b:384b:b0:352:d59a:b28 with SMTP id 98e67ed59e1d1-35a21fbe2c3mr2369913a91.19.1773392572845;
        Fri, 13 Mar 2026 02:02:52 -0700 (PDT)
X-Received: by 2002:a17:90b:384b:b0:352:d59a:b28 with SMTP id 98e67ed59e1d1-35a21fbe2c3mr2369870a91.19.1773392572168;
        Fri, 13 Mar 2026 02:02:52 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73ebb9ed44sm1269275a12.34.2026.03.13.02.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 02:02:51 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 17:02:06 +0800
Subject: [PATCH v15 3/7] coresight: tmc: introduce tmc_sysfs_ops to wrap
 sysfs read operations
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-enable-byte-cntr-for-ctcu-v15-3-1777f14ed319@oss.qualcomm.com>
References: <20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com>
In-Reply-To: <20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773392552; l=5200;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=nC4Owf4MXjBHiFj34VEuBfBkJjEC2Xd5I2Sevk5UnH8=;
 b=680OzAf8qsYE3RuttmLZm/HyPOQNsaUyipptyvNuG8EgqR378XZux5Ew4oPnbHNclrPBXigg9
 G4oKQ3bhfgcAefhUXOs3izzV5FOz5ZSQYI/UJMsU5Kh+DhGyugys6lP
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Authority-Analysis: v=2.4 cv=ZN/aWH7b c=1 sm=1 tr=0 ts=69b3d2bd cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ia3uihG--C1vaqsH_ucA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA2OSBTYWx0ZWRfX06noqyGlulEn
 5i/2AHmD/lS6WHp5m5Y8fnKA9auUPV2r5+ROEiSGQv3+2NXdgGpMwsMJxcG0mVUR+hRVwf+oJAS
 HO6C/vgrRr1LXblaKawNV7FK2cdIOg4OFnU68AhJu5LfOqyTuKYyjGmy7WP/d8DZm8uyAGmdcru
 Rh11s8C+h0DKFCswfjRjxiUlTDi3ZCLfBFEuU4zMcUUM64YGpSL7N7fsrxNeZW9RpnN9vq3J1LW
 mCXoTKzykV1ckHYgcAREwa3Fss78tqZDIUNh8OSOnWxkb3t94h0i1tbL3pATftdp8h83JO31mBs
 X6r25VZugSkVB5z8czgiUKW2VIj9Gvdm75vTHmVUe1MHue29lRjwso7Dmc6mkDyE+Gg7Ip/oSYI
 XeLJdOoyNr9GOCoPtW1EkWu8I0OAyJG/ldXEADvFS2ECkcht+/Q/lVJfwIRyCLaipxhvqYOhwh5
 yHfORyvII3T9kRJYboA==
X-Proofpoint-GUID: g01VGVBZyblU0MPX58XMp9T15U-ARmCB
X-Proofpoint-ORIG-GUID: g01VGVBZyblU0MPX58XMp9T15U-ARmCB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_020255_287665_6E7C5DBE 
X-CRM114-Status: GOOD (  17.72  )
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

Introduce tmc_sysfs_ops as a wrapper, wrap sysfs read operations,
for reading trace data from the TMC buffer.

Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tmc-core.c | 51 ++++++++++--------------
 drivers/hwtracing/coresight/coresight-tmc.h      | 15 +++++++
 2 files changed, 37 insertions(+), 29 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index bac3278ef4dd..110eedde077f 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -228,17 +228,10 @@ static int tmc_read_prepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_prepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_prepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_prepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read start\n");
@@ -250,17 +243,10 @@ static int tmc_read_unprepare(struct tmc_drvdata *drvdata)
 {
 	int ret = 0;
 
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		ret = tmc_read_unprepare_etb(drvdata);
-		break;
-	case TMC_CONFIG_TYPE_ETR:
-		ret = tmc_read_unprepare_etr(drvdata);
-		break;
-	default:
+	if (drvdata->sysfs_ops)
+		ret = drvdata->sysfs_ops->read_unprepare(drvdata);
+	else
 		ret = -EINVAL;
-	}
 
 	if (!ret)
 		dev_dbg(&drvdata->csdev->dev, "TMC read end\n");
@@ -287,15 +273,7 @@ static int tmc_open(struct inode *inode, struct file *file)
 static ssize_t tmc_get_sysfs_trace(struct tmc_drvdata *drvdata, loff_t pos, size_t len,
 				   char **bufpp)
 {
-	switch (drvdata->config_type) {
-	case TMC_CONFIG_TYPE_ETB:
-	case TMC_CONFIG_TYPE_ETF:
-		return tmc_etb_get_sysfs_trace(drvdata, pos, len, bufpp);
-	case TMC_CONFIG_TYPE_ETR:
-		return tmc_etr_get_sysfs_trace(drvdata, pos, len, bufpp);
-	}
-
-	return -EINVAL;
+	return drvdata->sysfs_ops->get_trace_data(drvdata, pos, len, bufpp);
 }
 
 static ssize_t tmc_read(struct file *file, char __user *data, size_t len,
@@ -764,6 +742,18 @@ static void register_crash_dev_interface(struct tmc_drvdata *drvdata,
 			"Valid crash tracedata found\n");
 }
 
+static const struct tmc_sysfs_ops etb_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etb,
+	.read_unprepare	= tmc_read_unprepare_etb,
+	.get_trace_data	= tmc_etb_get_sysfs_trace,
+};
+
+static const struct tmc_sysfs_ops etr_sysfs_ops = {
+	.read_prepare	= tmc_read_prepare_etr,
+	.read_unprepare	= tmc_read_unprepare_etr,
+	.get_trace_data	= tmc_etr_get_sysfs_trace,
+};
+
 static int __tmc_probe(struct device *dev, struct resource *res)
 {
 	int ret = 0;
@@ -823,6 +813,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.sink_subtype = CORESIGHT_DEV_SUBTYPE_SINK_BUFFER;
 		desc.ops = &tmc_etb_cs_ops;
 		dev_list = "tmc_etb";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	case TMC_CONFIG_TYPE_ETR:
 		desc.groups = coresight_etr_groups;
@@ -835,6 +826,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		idr_init(&drvdata->idr);
 		mutex_init(&drvdata->idr_mutex);
 		dev_list = "tmc_etr";
+		drvdata->sysfs_ops = &etr_sysfs_ops;
 		INIT_LIST_HEAD(&drvdata->etr_buf_list);
 		break;
 	case TMC_CONFIG_TYPE_ETF:
@@ -844,6 +836,7 @@ static int __tmc_probe(struct device *dev, struct resource *res)
 		desc.subtype.link_subtype = CORESIGHT_DEV_SUBTYPE_LINK_FIFO;
 		desc.ops = &tmc_etf_cs_ops;
 		dev_list = "tmc_etf";
+		drvdata->sysfs_ops = &etb_sysfs_ops;
 		break;
 	default:
 		pr_err("%s: Unsupported TMC config\n", desc.name);
diff --git a/drivers/hwtracing/coresight/coresight-tmc.h b/drivers/hwtracing/coresight/coresight-tmc.h
index 81237944b986..4d80105d3fcf 100644
--- a/drivers/hwtracing/coresight/coresight-tmc.h
+++ b/drivers/hwtracing/coresight/coresight-tmc.h
@@ -259,6 +259,7 @@ struct etr_buf_node {
  * @crash_mdata: Reserved memory for storing tmc crash metadata.
  *		 Used by ETR/ETF.
  * @etr_buf_list: List that is used to manage allocated etr_buf.
+ * @sysfs_ops:	Read operations for the sysfs mode.
  */
 struct tmc_drvdata {
 	struct clk		*atclk;
@@ -290,6 +291,20 @@ struct tmc_drvdata {
 	struct tmc_resrv_buf	resrv_buf;
 	struct tmc_resrv_buf	crash_mdata;
 	struct list_head        etr_buf_list;
+	const struct tmc_sysfs_ops	*sysfs_ops;
+};
+
+/**
+ * struct tmc_sysfs_ops - read operations for TMC and its helper devices
+ * @read_prepare:	prepare operation.
+ * @read_unprepare:	unprepare operation.
+ * @get_trace_data:	read operation.
+ */
+struct tmc_sysfs_ops {
+	int (*read_prepare)(struct tmc_drvdata *drvdata);
+	int (*read_unprepare)(struct tmc_drvdata *drvdata);
+	ssize_t (*get_trace_data)(struct tmc_drvdata *drvdata, loff_t pos,
+				  size_t len, char **bufpp);
 };
 
 struct etr_buf_operations {

-- 
2.34.1


