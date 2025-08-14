Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D326CA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 15:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3GDsN9LxSDEitQ0pzvRQqf9bGA4AutUNUEYwRrkhQ70=; b=O1Nq/uUYOlk0DeFDu4J7QEoqnh
	DE+hEWE93GF4xi9XOED1A99WQY6VZLJ+US6Cih+ixg2kXv9g3UmApCXyLk/NZJGjTPJlwRcWKwlaw
	+d05dK6nb6eXSym6AHMapVFRDjsdNONgsTE8zmnnVTe88PyxM569oAY8JCg4H0kyiJm+s7SAAGR1T
	gy3JWim/bgCh16jBgyRButMI5h/kjtMwn4rBLPz89yQqGUijq9SFYkOA1NXZC0Sdu1LgHNihXgZXI
	4XGloGj9pT/gGV2IlfqrIZpjn0bpoYyUgJEd/ZjC75gMwCgRBOz7mbX5PWmDMTCoz9RDbTHNY+f4B
	/vaXEimA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uma0c-0000000HT8o-31pV;
	Thu, 14 Aug 2025 15:36:54 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umVYK-0000000Gf7r-2W28
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 10:51:25 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3b9edf504e6so383377f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 03:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755168683; x=1755773483; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3GDsN9LxSDEitQ0pzvRQqf9bGA4AutUNUEYwRrkhQ70=;
        b=CJ1lf/bTJh+arAqqGGXYmepCP5mi6X76AVcxlcr1MqF+EmieSrIrQ0MP7eH/tMqlxI
         c9pCKSoy1QgKTfunHg5tN0fGy1sFyfjXbAdRBhO1M+vQOQqUbgONXjZwuAeuEJX0gHXr
         ZEnEfTqDU9aj2rIfRdny3COaWMQWuwe33f4vmTiDvyFgVQu+96aZhH8I4arVaryIC4hh
         PxJbdjHg73RGcl5CWLZ50Z+UCrYz1XK7khir4uH+aPepb4avfFlgp8qhqIO83jdUvVgr
         LFCHSXpHdc2/0Ty3gOSVLlr2xybTozLm2llewz6OTFlXQ59IWv6WxZnPHAR9L73/sU7Z
         OdVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755168683; x=1755773483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3GDsN9LxSDEitQ0pzvRQqf9bGA4AutUNUEYwRrkhQ70=;
        b=UUJb5Cu4zwty9OAVhyPXgrH2F1Gx58eQjGlBS3utturnbThArI47UaaILlX5U/Mga5
         UFSTd2MjrMN2wmui6EZiqvYh+jUB851yHiJNqXcFwfT7PtsRtJDFaFaytKRbn+ZXRfEz
         77ZMPWo7/h8A22KYkVLblazFTaN+w5gx3RQnFBZbQTwh3EAfKsfoGjDNjJYlIlzr5tjg
         ncFx7xWGDioxdmKE3SGIWhZF6/VHTfBn0HtfgDtizfKCvSPoK4efe9wxYfMYA29bhgKm
         F4yGPjEa5RHvNf5vkVN+J2sLSCCUh1Tapdj21YIMRSH0beFc0GaqWoLauBVf1Q9OPeSM
         /sKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlzYSlmLRKP+9wj/FdWeTP21GVnnAuM21auuPEOhh5PVI8dSmyvHIsCbOv/ktxl19osFYaaEDi8HyzHzjKhMjF@lists.infradead.org
X-Gm-Message-State: AOJu0YxfF/z9CC1mH1tYyERN80RIlXHuej0aZwrSQEaKmCSC9OKCrVR4
	EvR/ocVhKXmVrKEWX63UvnGMXjfiwwtEg+iSIzRWGYjgjkFeTkNFm5Qn7JqOL5ejHCc=
X-Gm-Gg: ASbGncvlPXVPWieas2fhpNhvNrM3HlQzHoEWs/Wec0uf15mJaP8jlc1tZEjdjogJAdD
	JYyNucP59XkkEjlZyLqSpBaS+4UQsqU2lILb0gXKSgeZ5QahdiKybfjMHhfyOmEWafA4/J6R2tW
	Epbkjqgjk1Y05H2vXMYX1uoPi7yTvubjO0Um/vZ5LcKYA4qQidmmX8V+A8ijzAEBHk6ODlCFAgJ
	kaun5t1ohrid8W3XT+nL1q1G450QswpCrsrXrOviAUGjrxiWSNXX/BtqfatCOnoFgEue9erof5z
	53S9T5D3aWb6NaL94V90B0cZ7dQuQBetNmQ4Th0KDaw/jBp6SxKo9j3VQzWH8fBpGhsytShr1xc
	c0FdJbrS74Q2NOqOs4pmV50/3w2+L4Tg=
X-Google-Smtp-Source: AGHT+IF5P4dyVkR12cBMw+uYpwiYnNAlcSu0vH+8udQzxGRbHLddJ/1K+6aeezIw6lInsN/G1CLYWg==
X-Received: by 2002:a05:6000:1889:b0:3b9:7c1f:86b1 with SMTP id ffacd0b85a97d-3b9edf35019mr1847829f8f.37.1755168682900;
        Thu, 14 Aug 2025 03:51:22 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a1b226eecsm14228345e9.1.2025.08.14.03.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 03:51:22 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 14 Aug 2025 11:49:54 +0100
Subject: [PATCH v2 3/6] coresight: Repack struct etmv4_drvdata
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250814-james-cs-syncfreq-v2-3-c76fcb87696d@linaro.org>
References: <20250814-james-cs-syncfreq-v2-0-c76fcb87696d@linaro.org>
In-Reply-To: <20250814-james-cs-syncfreq-v2-0-c76fcb87696d@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_035124_662521_AB84A5D1 
X-CRM114-Status: UNSURE (   9.64  )
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


