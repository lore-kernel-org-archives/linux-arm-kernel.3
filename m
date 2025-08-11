Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40F0CCA0EC4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 09:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3GDsN9LxSDEitQ0pzvRQqf9bGA4AutUNUEYwRrkhQ70=; b=CUZOkbubSZOgAYcej1NswsjhUc
	H+AjaQNngrq1PL5YUzIifres0Ygyv9o0FuBhKwICGaayVLtQK45SeD3keuoWNJY97c5pDy6LhTRN5
	+gPAoR/cZP/CJkCt9eSRt7RtIEeWuI/FRGmjh+ed3eMOwuMf2O6NTno3NZfjlc3FERD818pwKl+F7
	MSlfymEaeT4bwASpKDrqGPJPJGpyPdXKze7kPtpxjybl+U8+uuP+FANOiD87ci24U3d/zoi+eaT4o
	84qvlhXk3CoYsEbnHj5pyM8WFvY+wwoTPK88Lhvq6c3dg9dOkU0TJQTZBZvKjDiSr86XsZZV25qDt
	ia7OFIdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulP5I-00000007C8q-49W5;
	Mon, 11 Aug 2025 09:44:52 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulOtY-000000078it-29dF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 09:32:45 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-459ddf8acf1so34524865e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 02:32:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754904763; x=1755509563; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3GDsN9LxSDEitQ0pzvRQqf9bGA4AutUNUEYwRrkhQ70=;
        b=Vfi857h/PZVK4Ff4Yx4nWItiewgnsY82k2K4VF9oBhPjX1TgnO0Kr534igaS+fCOHM
         Z39QpmE4ZzgBsu9RDWDWHKh8HT2oA7cpXw/X6kBl57Wzad8Crv6H0GBfNlgVo7nGaKtD
         Cm7v4bOdS55sbUHFj5NsIPuEhFYqYrSKZOaN6q6ocIPq6vvbRVAjoEVZzRjvKTVa8ENs
         yPFIGYrTYHOb6v0bGboIwyxjfIzcpRDLDUeFl9RAWLEzYSrOclu39OgvaA2kyMxtPPou
         ScDPOPOs0733lXICRk6oxmtWJOQgzh8mAoY5ptbyW6a0lbAZvgXnwWqIUZQqCAAzBT6j
         RC+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754904763; x=1755509563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3GDsN9LxSDEitQ0pzvRQqf9bGA4AutUNUEYwRrkhQ70=;
        b=XRYLw5hEO7qlFf9DPENZJBhDffKezBx0E6hZJLhCqWkGeGM3TxUpxyt3mSjc1y46iy
         c1SkJ71SlISEL6rPeGKjD9kSCt8J5QYd2TG2/o4bjm/6UX9jC7xOEsgUb3YXOJ9PSG+/
         IfkVPrrSCGgLTeKHjgKHYEKWrjGg1+NKyxBuWhKVnFqok/oS+xOZfsaxjPnAaA1cXbdT
         APYdltv0gK5yKZ1Eqdi2DUOlBxNm6QJNhG3PgYGkpGTghC4CP9FNqpejVMm8Dmvd/IRJ
         cklCvx1iQKlzIFtbXG9eyUmxnTaN/7yurowWgPnR6a6S0WaMHALr6MpPx1YaZQiHfHsV
         uxiw==
X-Forwarded-Encrypted: i=1; AJvYcCVLqXc4BLxwrHiGBgpqyYPtvSFrQ9H1A/p8oi86bQEmqs1pXc0pqH6kOwaipXKXN2RJbmbLQdHDClPiYr41XBZa@lists.infradead.org
X-Gm-Message-State: AOJu0YxLpjnp/spA6SGti6KvJTPRHzEV9PdWzYKVGnxn+OUJLmLtpiWF
	uf3O7u6HKMDXRnF3Epg9/QH+7KaTgx/SSEhsfheXlJxVwACD10U0/Q6Sz5tMoq2ffw0=
X-Gm-Gg: ASbGncsDV4O6cO3b+e9uF9OdLUCAJj0+iGCSx+wHQja4bffhjZZbzvXvqPdaKmyHeMh
	V7QNEmHMDOcB6SGSsAKRaYF3HPJCBuiUkVdkG60ad1urLLfXcZp35EodBqmrLxvec3V2vztth8m
	dkFx+QhA0UCx6wYyCfv+bPWQPpNUeKh3znUiSchn2A7VXB8f5T8+2ji7/tf/RigYjb0N+d1UvWb
	AkFNnovh8artWWu7UWRx4YuNXYzFTJ6r2eyRG8eYhOk4L9L6P8H4LFKTsg4x76Eyzg9JdMom/ro
	5wqZa+mL3SFRQeiXfk2yNyGw91Ed3T3mJ1Lom0HBim4Y7fRrb2jPpIN6fLq2fWEusxzgb8OFkHo
	XlhxLOJTmM7uE8RBp+D8F9qhQQ0NRbT4=
X-Google-Smtp-Source: AGHT+IGq+ywQDRPYbHWh34YnCQ/IpGU3if6J27Zgp8ZmTttsheGYVInR3KO4d/MWZnAmbDz0jxuqcA==
X-Received: by 2002:a05:600c:450e:b0:456:1006:5418 with SMTP id 5b1f17b1804b1-459f4eb5e2dmr95609655e9.13.1754904762901;
        Mon, 11 Aug 2025 02:32:42 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c45346asm39904799f8f.39.2025.08.11.02.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 02:32:42 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 11 Aug 2025 10:32:08 +0100
Subject: [PATCH 3/6] coresight: Repack struct etmv4_drvdata
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250811-james-cs-syncfreq-v1-3-b001cd6e3404@linaro.org>
References: <20250811-james-cs-syncfreq-v1-0-b001cd6e3404@linaro.org>
In-Reply-To: <20250811-james-cs-syncfreq-v1-0-b001cd6e3404@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_023244_564127_9FC92C9D 
X-CRM114-Status: UNSURE (   9.74  )
X-CRM114-Notice: Please train this message.
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

Fix holes and convert the long list of bools to single bits to save
some space because there's one of these for each ETM.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x.h | 39 ++++++++++++++-------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index a355a1e9606d..1c67b263b01b 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -1020,29 +1020,30 @@ struct etmv4_drvdata {
 	u8				ns_ex_level;
 	u8				q_support;
 	u8				os_lock_model;
-	bool				sticky_enable;
-	bool				boot_enable;
-	bool				os_unlock;
-	bool				instrp0;
-	bool				q_filt;
-	bool				trcbb;
-	bool				trccond;
-	bool				retstack;
-	bool				trccci;
-	bool				trc_error;
-	bool				syncpr;
-	bool				stallctl;
-	bool				sysstall;
-	bool				nooverflow;
-	bool				atbtrig;
-	bool				lpoverride;
+	bool				sticky_enable : 1;
+	bool				boot_enable : 1;
+	bool				os_unlock : 1;
+	bool				instrp0 : 1;
+	bool				q_filt : 1;
+	bool				trcbb : 1;
+	bool				trccond : 1;
+	bool				retstack : 1;
+	bool				trccci : 1;
+	bool				trc_error : 1;
+	bool				syncpr : 1;
+	bool				stallctl : 1;
+	bool				sysstall : 1;
+	bool				nooverflow : 1;
+	bool				atbtrig : 1;
+	bool				lpoverride : 1;
+	bool				state_needs_restore : 1;
+	bool				skip_power_up : 1;
+	bool				paused : 1;
 	u64				trfcr;
 	struct etmv4_config		config;
 	u64				save_trfcr;
 	struct etmv4_save_state		*save_state;
-	bool				state_needs_restore;
-	bool				skip_power_up;
-	bool				paused;
+
 	DECLARE_BITMAP(arch_features, ETM4_IMPDEF_FEATURE_MAX);
 };
 

-- 
2.34.1


