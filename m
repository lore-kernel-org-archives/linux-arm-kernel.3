Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C165ECA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 07:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vG+JLCn6L4Ic7MLBU6Y9jQ5LFWamplScsqK99+l+ZYQ=; b=AOd/2T5hHlYg7fObShYJCaBCZG
	s92/Q4oWE7+dDTi0B/yk9z+mK9PFc0+TZRqFnsouBJfyccEhoedVmKbQKx6MVAQP+Tq4jPVbg/i8h
	vZfU5XypwyNuIDeRHsaJFUM23lD3/+RCBFGPGvzZyddMtBSdQxOqwJioyH6oLiaSzlF7vTqDcGASj
	wwK0pUntF8GNYwXLEOXfAgIOSGD2qBBB3NargQB52C1h6v2dcX0vEiCcsEaCZt5kwXgRbnpEWAMuM
	8FcFf7WJ7tyoKqGCQhoqy1ZBHYPfebnd23cIpI3r8gj0a4JksnFX9ZAaaSwgbmoATecJVlL5bj1ez
	dtOrD4EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqnou-0000000Anow-1Hqk;
	Tue, 26 Aug 2025 07:10:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqngz-0000000Amxn-1cNi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Aug 2025 07:02:06 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57Q58kjK020343
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 07:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vG+JLCn6L4I
	c7MLBU6Y9jQ5LFWamplScsqK99+l+ZYQ=; b=CJp1yoeXIk3Hu7FSl8v7E4T1S3m
	eu+FK5k+wa/7oMn4u1oolfigvAHAeoVivW8wlOtG/HEhJDDWPorfDLZ3iNFmM6tI
	H2p1TZPOkciZiYyWDSXCZ4qrJsj2+CzzgvcBpS1RiPQcfXCjK+nNeFGg/i9ZbvGp
	yvuwpJ0Q9PPidUj+npiH/emQuN1vxp6iQbDOrDFLxpFDQr1DGyOsgxSwCA4Y5/uv
	tyFkQdDghu4dwN2oBGhFaFjHUT7TOrLwZJblOF/2ySGHun1JCSDCpJ2Ltxj3zeVv
	jVJzFTF6IIVOSfk18aadt0s5oFix763RRe/1JSxnrWOkwhCY8uOGofnRG6w==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q6thytsc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 07:02:05 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b4765bf9ed2so4143412a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Aug 2025 00:02:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756191724; x=1756796524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vG+JLCn6L4Ic7MLBU6Y9jQ5LFWamplScsqK99+l+ZYQ=;
        b=XPrELZ0aUpL1uwwoqH766FDZAbNb4g8TjLw5KzD4GRSpzKpKoxZfkaxUI+hp16yygA
         HhudMuQK+gXrNDFrlJUKNmJUqLZP6L2mRqYEc/LmN+O5+edmCrKFQ9OuZJRfTXN2t4ra
         b6CIegaMNtZxE2UG5Ix7Nu2jNlv9KUig1DXsKN0uXon5JqElmXhZVwCIL6wM8h78Vhj9
         6shuC40RDd7e7JLrZLsGxEQjL1eZSEK7sFxue1wpp8gGO15L1iSD/vhYtR1ixY75ZNLM
         RouHSS+6j8OKrlzEKOYPJodZ55oqTbSP1Ev1XjT48hWk99qQDB9PCtZ0RHC16KSvnzEp
         qYcg==
X-Forwarded-Encrypted: i=1; AJvYcCUNqLDLArHTXhUHN17VrtSuaV87Mga2+zrCHfItYd4lwz7msysiLGwvde5sR/V9vdI08TZ3EqUVWBAdMLEoY0Xg@lists.infradead.org
X-Gm-Message-State: AOJu0YyYaUQojboE73WeFe+Vv/LkFjtq8WUWhNW8ZQSVOaA2LIrHP7fW
	xEo+jVXrKUOlOf65Wei6r9jE5OO7VOzAZOo3Nlm+xveJ7yGrOFGWJyGWmAFoKBrZR9tvoY34mn4
	6+firIHuJZHQqXbDgt/FqXykJ6P6A4HZ1fKQKPInayQw+gjOcegkDuRVZDlfbXqQnFELKr/bup4
	fSIA==
X-Gm-Gg: ASbGncsoDqUicO6g1aRy+d4VPfNzO2q0JkC24sELmlxpP1v9Gjb25UqQllcjikpK2D9
	1BSUSBEa/TjoiRbVrQO0AM/1R6eZp3KRC9Dl8SlJui4yY2T0cU8f74+WL87q1E9JGGr2vLazf2L
	HTqhLmU48S3yYHx25A59LmFyePOG7JUv1Du3zrMXPWSWCAwXlKgj34ecFqB7Wkud9phulLtpkrC
	HyQDJhhK+YDMsONzefV99MPC/oreqOzYZSV8qeS2KxuWFhVEBJqx1mXNsMPju/P4Ny2JoyP+EMs
	jofTFwYSTmZM0/fIyRMvLx0InzTVyxSYhOooI83ViUufql9almo/vSGwKsa6Ovv16DTNCVVXZ/x
	Ag0TFKc35lrwN9YSfapmd
X-Received: by 2002:a05:6a20:6729:b0:243:757a:8859 with SMTP id adf61e73a8af0-243757a8d66mr6775837637.24.1756191724004;
        Tue, 26 Aug 2025 00:02:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsB6DgGNhNRZIVnU1LaZzXfbxjCKpRrkugicqU0gWrNG6/1baUumt0mfh3z5afOb2+MFXU6A==
X-Received: by 2002:a05:6a20:6729:b0:243:757a:8859 with SMTP id adf61e73a8af0-243757a8d66mr6775769637.24.1756191723268;
        Tue, 26 Aug 2025 00:02:03 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-770b5bed428sm5628582b3a.16.2025.08.26.00.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 00:02:02 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v1 2/3] coresight: tpda: add function to configure TPDA_SYNCR register
Date: Tue, 26 Aug 2025 15:01:49 +0800
Message-Id: <20250826070150.5603-3-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250826070150.5603-1-jie.gan@oss.qualcomm.com>
References: <20250826070150.5603-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA0MyBTYWx0ZWRfX0JXYNyh9lN5v
 i6GBUcpmrhpr6t5SEDIpw9YXuSXBYyKGMA2JwxCtiwbzOocbcu41J4DOXRPgasNzbR+5kNHq18f
 2AVgv2nO/i+1ZsUwf5eMdMhY4QHw2epZfkLDUmqZD01y95rUSRdd6D08IlO/i+ptAUzLJbvVfJ0
 F0qGvsqSJvtZV6cRiRyAH22JwuIyop/eTG9yYBa/HKn2WB90ISTK7fQ+iyuhfGUyYgZC1KSGxxf
 4tBJj1/3XLW8aTHHdL8xbOtz7prRYghLEF9qh+Yq+BN3slPKyxINnntvK+H0Vy9CIs54DqMNcya
 FOfOxsk91YI+HUbSlagHZm+umdE2omPrEGrIRCe59q3Hcpwge1AO4kCIMrE+hbdUdW2Cr40Nr41
 oHWOlIK3
X-Proofpoint-ORIG-GUID: Y_vfWTdkxRzBpBE04785HO05o6mxyH4L
X-Proofpoint-GUID: Y_vfWTdkxRzBpBE04785HO05o6mxyH4L
X-Authority-Analysis: v=2.4 cv=W544VQWk c=1 sm=1 tr=0 ts=68ad5bed cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=8xtsYS7Ed2DtWhKBhe4A:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-26_02,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 impostorscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250826_000205_719773_07369123 
X-CRM114-Status: GOOD (  15.19  )
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

From: Tao Zhang <tao.zhang@oss.qualcomm.com>

The TPDA_SYNCR register defines the frequency at which TPDA generates
ASYNC packets, enabling userspace tools to accurately parse each valid
packet.

Signed-off-by: Tao Zhang <tao.zhang@oss.qualcomm.com>
Co-developed-by: Jie Gan <jie.gan@oss.qualcomm.com>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 drivers/hwtracing/coresight/coresight-tpda.c | 15 +++++++++++++++
 drivers/hwtracing/coresight/coresight-tpda.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/hwtracing/coresight/coresight-tpda.c b/drivers/hwtracing/coresight/coresight-tpda.c
index cc254d53b8ec..9e623732d1e7 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.c
+++ b/drivers/hwtracing/coresight/coresight-tpda.c
@@ -189,6 +189,18 @@ static void tpda_enable_pre_port(struct tpda_drvdata *drvdata)
 		writel_relaxed(0x0, drvdata->base + TPDA_FPID_CR);
 }
 
+static void tpda_enable_post_port(struct tpda_drvdata *drvdata)
+{
+	uint32_t val;
+
+	val = readl_relaxed(drvdata->base + TPDA_SYNCR);
+	/* Clear the mode */
+	val = val & ~TPDA_MODE_CTRL;
+	/* Program the counter value */
+	val = val | 0xFFF;
+	writel_relaxed(val, drvdata->base + TPDA_SYNCR);
+}
+
 static int tpda_enable_port(struct tpda_drvdata *drvdata, int port)
 {
 	u32 val;
@@ -227,6 +239,9 @@ static int __tpda_enable(struct tpda_drvdata *drvdata, int port)
 		tpda_enable_pre_port(drvdata);
 
 	ret = tpda_enable_port(drvdata, port);
+	if (!drvdata->csdev->refcnt)
+		tpda_enable_post_port(drvdata);
+
 	CS_LOCK(drvdata->base);
 
 	return ret;
diff --git a/drivers/hwtracing/coresight/coresight-tpda.h b/drivers/hwtracing/coresight/coresight-tpda.h
index b651372d4c88..00d146960d81 100644
--- a/drivers/hwtracing/coresight/coresight-tpda.h
+++ b/drivers/hwtracing/coresight/coresight-tpda.h
@@ -9,6 +9,7 @@
 #define TPDA_CR			(0x000)
 #define TPDA_Pn_CR(n)		(0x004 + (n * 4))
 #define TPDA_FPID_CR		(0x084)
+#define TPDA_SYNCR		(0x08C)
 
 /* Cross trigger FREQ packets timestamp bit */
 #define TPDA_CR_FREQTS		BIT(2)
-- 
2.34.1


