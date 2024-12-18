Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A66E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 18:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O1e4i2yJb6M8JWolS3FF1qtbGtdKGQDJ3R3qFDxNx2w=; b=tZyAJubXT1yR9Q6GG5GAZO1xbB
	UJzL63Va2Vr7iClMk/aFl9C1DIYSxxMDdnTBPx/m2T5g/wDI/Ol3KOqxfP4W3sWYsAaMfUo1M3fue
	0T4nleWv+be/bgi9p7FWzCfOfzXCcObgzIwYEf84eZKwVRF2jZSVZHw1dJEzan6N/nrD6FHCGKb+U
	RWHseSUOO22mgl7ySgegulck6xHaxm7I16ef1RrQemi9UEPij0zPemBQoMdTwJA4DAPu0T7WLqmyB
	RsOXTpl5OKQPumRyGQGl57dkLUAqDydL9XeQgarlZ2HonPp4aBVMV2k3hvGakLjaZ/hiqS/ekxk6U
	O5Qsdfwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNyue-0000000HScO-1mnA;
	Wed, 18 Dec 2024 18:36:48 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNynP-0000000HRKj-0GJz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 18:29:20 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-725abf74334so6076414b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 10:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734546558; x=1735151358; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O1e4i2yJb6M8JWolS3FF1qtbGtdKGQDJ3R3qFDxNx2w=;
        b=MIV0rakwCCc1SeUdIhlXMR+2ZdEBh3I5BSZKXeov98gY3P/BZHeUp0gU+oy8yM48J7
         M5Z5egbX6TBHd9q9ZPR+njM9ty3mV0uiKO1Aj1mbvgIV5Q3tr3NSIdccXYOKfjBQWmjf
         bndpoWgKuiaos/b+/uMLebDiccYdn7CI+gehvJlQvnK23y86gv1CbSpcfw8EHJisMLRi
         PkviFuVcHWT4rHBB/0s8vO/4Cuu6WbEqgqNLw4fmGy56rnf4R6jnmaO4IXx1X3MAJThl
         RPNClrwc9EihR5wS52dJB0Vxr1TVeAkMGLKlkRWBOYJnXSlUOiwuIWPNnhtPmAejCJCg
         ZR2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734546558; x=1735151358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O1e4i2yJb6M8JWolS3FF1qtbGtdKGQDJ3R3qFDxNx2w=;
        b=WtbM/IHQ5sxoCyZEaw/oF5dDU0yJ/8PO+TKyNTXsKrTk13eYs9Cs7f8kC2Rm2KH9yu
         NBkbUh7X6OvpMXoiVmbF3pbXlTxKA+JXa8GsorzVEHGJG8iiF7BARyafmATXcS6rNWAR
         xzAipT5dmTBoR/4QGSn0F9BrOoUrdXXglGc/j+vOTOSL/+mD5qcNjGzKWOSCoTphnS2R
         B9zt218i0/1OBGI4aa07AN8MnXapy3jG3Tv/WriS+CdNO4rXzUhF9fUnOMxjd66LSS9v
         b6hgWqHXHjelSeYLkFNaGRAUIu5VjhTlA4BKocq2jVXIV5IKTd4uRJ+mSpzDjM8iKFex
         7BVg==
X-Forwarded-Encrypted: i=1; AJvYcCUs5hDy29At4ywuuflAOiYTQfDEkjPTs3f1/JNwgO9F566k5G4nqgwq6dQ7xw+NeCF2Lf1DgQRPgDMRPYk0vMBM@lists.infradead.org
X-Gm-Message-State: AOJu0YzS3Y6dMCKpSbjHLB+pPHt3BxbMpP1YIX1QSMt3H8aqPG/C1obs
	GNttuBjZ+ci0JEKGAvHQA6YhF+jsvEL0bfYN/MpxAFvrDAbcfDen
X-Gm-Gg: ASbGnctvGuYgvI/LdZ9UqdFxK3RngcFzTYhWcVLaDtCFt4Zxutpx9eIk48xc4GkgF5C
	QgmXeCYGy7EoZiz4Q30js15KDak3BLJKy6mSn/gRXepn4Cb+KV8G9DqjnjtRfFXwXzJjK34HWRx
	ztw/3DYKK4jCPJFpKlXNFnRiAjtDp4eLbDAw39VIj87QXmDGOTCa8gW/6vlcPOc02IfLvxeufPA
	Tlxx+TzTrnGM765Ix9IWaIKjYKbUJEVHU0nXBnRv5PuAwpvIL0lgixHHw==
X-Google-Smtp-Source: AGHT+IHIJQZvEA5f5MqvLKQRVSuowhIimcNsdQUZGQd0bWhhesTYwzAxxO/1ARL7Nrb4NCT2ZfdFZQ==
X-Received: by 2002:a17:903:2306:b0:215:a190:ba10 with SMTP id d9443c01a7336-218d6fe1a96mr58866725ad.15.1734546557853;
        Wed, 18 Dec 2024 10:29:17 -0800 (PST)
Received: from nick-mbp.. ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-218a1dcb3ffsm79202565ad.75.2024.12.18.10.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:29:17 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Asahi Linux <asahi@lists.linux.dev>,
	Linux ARM Kernel Architecture <linux-arm-kernel@lists.infradead.org>,
	Linux power management <linux-pm@vger.kernel.org>,
	Devicetree <devicetree@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Cc: Nick Chan <towinchenmi@gmail.com>,
	Christian Loehle <christian.loehle@arm.com>
Subject: [PATCH v3 6/7] cpufreq: apple-soc: Set fallback transition latency to APPLE_DVFS_TRANSITION_TIMEOUT
Date: Thu, 19 Dec 2024 02:25:08 +0800
Message-ID: <20241218182834.22334-7-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241218182834.22334-1-towinchenmi@gmail.com>
References: <20241218182834.22334-1-towinchenmi@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_102919_168371_8399057D 
X-CRM114-Status: GOOD (  12.97  )
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

The driver already assumes transitions will not take longer than
APPLE_DVFS_TRANSITION_TIMEOUT in apple_soc_cpufreq_set_target(), so it
makes little sense to set CPUFREQ_ETERNAL as the transition latency
when the transistion latency is not given by the opp-table.

Reviewed-by: Christian Loehle <christian.loehle@arm.com>
Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
 drivers/cpufreq/apple-soc-cpufreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/cpufreq/apple-soc-cpufreq.c b/drivers/cpufreq/apple-soc-cpufreq.c
index 94e57f055a5f..879ddec9e557 100644
--- a/drivers/cpufreq/apple-soc-cpufreq.c
+++ b/drivers/cpufreq/apple-soc-cpufreq.c
@@ -291,7 +291,7 @@ static int apple_soc_cpufreq_init(struct cpufreq_policy *policy)
 
 	transition_latency = dev_pm_opp_get_max_transition_latency(cpu_dev);
 	if (!transition_latency)
-		transition_latency = CPUFREQ_ETERNAL;
+		transition_latency = APPLE_DVFS_TRANSITION_TIMEOUT * NSEC_PER_USEC;
 
 	policy->cpuinfo.transition_latency = transition_latency;
 	policy->dvfs_possible_from_any_cpu = true;
-- 
2.47.1


