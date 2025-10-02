Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B89FACAC5B0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Oct 2025 10:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JRa7xRBz2y8KpSGnCFzpBD76XugU/yocJFlrtOCXiPE=; b=fD/CZUSS4BNb0O7CeivT7RVE/k
	OxVWwnKscImvUzWF310Hgmu529fFtTmjPZPEUa4gKuJE7zDgb8znF+RBT31mY7iowluEit6DCDnvH
	1pRySnaXX6OS+no1eR6/DS0nev+X2ZgLhQu6tv5Pq390ZLN6JXW8Ul/ImHMHAxCR1QjN0bb99dKC2
	YaYKGTwNNak574ybGWXzGHuk9DhXH8h2R9Zyl81RXF6vBdzetjPXeKdVs9u92NH3jO4NllvG1D9Sr
	16ZSrzld1QDlyVC8Tj8UzYzyKkez/tEhUw3sEc6s3RC0NetyTqLSSFgsshvIw1dhjxJ/dyB+14oQr
	Gb0F1/Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4GG8-0000000ACpH-2JrL;
	Thu, 02 Oct 2025 10:10:00 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4GG6-0000000ACnU-3PRG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Oct 2025 10:09:59 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-42421b1514fso374782f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Oct 2025 03:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759399797; x=1760004597; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JRa7xRBz2y8KpSGnCFzpBD76XugU/yocJFlrtOCXiPE=;
        b=N5sFikSTqMsNW2Wwe4l70X4zc81PNtQoUMgFesRQeAS9ob8sTl5ZWaTGjnqWexsxlJ
         YzUo9LymBDHOlyWLiduhGnS+2iUpyBs05G/e6Inbi/FSr4+dHlY7p8e1tOLsG1gxSwAB
         X2npUCDjwVh+mT5cRyRyXjhGKS810cgwBoWgjP8SoMbpLnFlY65ibSXsFEawEhZazTXs
         LRK1KPMPK8FgROc+4oQYKeJKQGxZhDurrRgsEd5B5AoZXwmvd8FqDxz6hk4c1Zdx/UtP
         Q1jGMQEtAYyXbPaARGR2iE4E+NaxnScpKAUZzLP7E52T+UqGM1T/JARn6igTD9EqIkxK
         FUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759399797; x=1760004597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JRa7xRBz2y8KpSGnCFzpBD76XugU/yocJFlrtOCXiPE=;
        b=EGaBRoPrtBlOZULU19KqsbB35M2Tq5OfAOQnjdOYwLjCAZ17bOD/3xTX/Mc6DVdaek
         wUe+3OVguaFC2U3/ZFNexMwF63EWAB1VzkLHae1aasQ0GBmMTF16CSIBCXOeH8AvuR1R
         dY2PVcGRbzOlB80Ru2OaoartofwAYZ1BbNW7hu1rM56vcjZs05T10clZjhW4R/gQyufb
         H+FCFPxaRWO6T9L88Idx3Wp5ydkNuUeyXNmQyj6/K5jTCu0rAX9u8eCnhP8x6aBr2Kt0
         giIr2CDFRjZPoHhWyMS/kX3mkhx5Y9nT0R13pB/e0ZxNlvmAvEBmut/CJTh+y32Q5+F7
         8GMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUgDW2i8FgZXXStTV4+Jl8ZbwbyLYM5INKxoK07qPf27mXK9+1vna1DQLdVPgQzWISUyZqMrl9RF0ENueSNjF87@lists.infradead.org
X-Gm-Message-State: AOJu0YzoRjnge5Vf9C+bXTcCZEuCinrlyXzV2ZO772xS1qoMkS0ctQtK
	K6FgVxq4nZRXrNRaAWTmMRj51+eVEnME02tI9rblV5KELvPOlHBkNhd4QPktyGFiklc=
X-Gm-Gg: ASbGncsupCRYSs3kIHDhCdxqh18HpChCH9JCxqJrRFG5kB3soz0OPPwB5LtXDOJhyld
	3nUVPNcfvlyFDI7IfgwE4A8T7yo6S884j5oq60Icpz0tpfuALULOax3rQDRkuEaQn6n581x0dl4
	zgjzKOvYGK7dGp7+waMcLxclzeh27otembY/s2LtbLG+WCDb80/fJJWpvmSQOd23rhmcGuCX/nH
	79pg4JfBdfH7frb0CxhwSYcqOsqo02SM4wFMSYN96kwrlv05TKZX7ehebX+O48xzPYhTKxyJS7x
	HG59ah9IBDiqm8PvULiCSrpskOP3ajL6CwsPuzlI5XIY0U6om1muqVtpdfJQm3vyiFEcohjidUV
	M6Rac062CLraAf9A9nrVyIEZdFBjoiT4CnUA18deFSw5WDOugfe1/A+NtMra5
X-Google-Smtp-Source: AGHT+IG4GBS3+OrAu9Dh83TZttIqZGo8QRmCmJgUPzocrKlVSt2VDpydcJ4X+uH+k7EMuUUvSzSyQg==
X-Received: by 2002:a05:6000:4382:b0:3ea:c893:95a7 with SMTP id ffacd0b85a97d-4255780b1b8mr4828795f8f.31.1759399796900;
        Thu, 02 Oct 2025 03:09:56 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4255d8ab960sm3017289f8f.13.2025.10.02.03.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Oct 2025 03:09:56 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 02 Oct 2025 11:09:30 +0100
Subject: [PATCH v3 2/5] coresight: Repack struct etmv4_drvdata
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251002-james-cs-syncfreq-v3-2-fe5df2bf91d1@linaro.org>
References: <20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org>
In-Reply-To: <20251002-james-cs-syncfreq-v3-0-fe5df2bf91d1@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_030958_873492_96D7E529 
X-CRM114-Status: UNSURE (   9.61  )
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

Reviewed-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 drivers/hwtracing/coresight/coresight-etm4x.h | 39 ++++++++++++++-------------
 1 file changed, 20 insertions(+), 19 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h b/drivers/hwtracing/coresight/coresight-etm4x.h
index eda3a6d2e8e2..813e7208ad17 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -1019,29 +1019,30 @@ struct etmv4_drvdata {
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


