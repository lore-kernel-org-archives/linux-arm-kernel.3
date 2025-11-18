Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F0A8CEE339
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 16:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0ofk2DnhJ+xH+9yXlJaWK4ofE7g/nNzRBk1/VuwE+Y=; b=Bn3iJhAY9EyV7pk5xG+94MKLOI
	GhxwTe6xU0mDoqhX/o7LTBzkYxL2MuZjBql3KOOFgo3LNcDD3vaaj7SPdCkCIxET0sZB4DL1pAvwt
	o8ZH5OczpISp7xalbQ6/nSXS097Y50EaougY5M8540pD2ZXs7MKZXZlsW8zvRb6teHRH5lcZoXShU
	7hz/tDvMkjyJIQEOBjm74YoNjjyIlh6nhlCFkaAuaQhCEqiqe/+YquPBpHx5MhQZJcigoVwHWqq1l
	oecVodsTNPEeKmD/kzmbGwUTrenB/1+bwGlO2kL12/54ICE3rjB5KqHFl8pdQbaC+ZmKxFvlRyPqn
	ZYpYtQOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOZR-00000000jol-3Zb2;
	Tue, 18 Nov 2025 16:28:45 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLOZ8-00000000jTp-06dx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 16:28:27 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so27471135e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763483304; x=1764088104; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d0ofk2DnhJ+xH+9yXlJaWK4ofE7g/nNzRBk1/VuwE+Y=;
        b=YAsBijwdnnINwzMHvZV1ln3hNX4b2dHUYB47piats18M7aBM996BdPl0igD171yUdo
         4JXPL+la/VuYDlfa0PhbPuJn8AdESlIIxPZmiWoJiGNu3qFnxXVvuJnLREn1ftAA2HQc
         RWaLVn4e/K3z/PWEP+OK7b9540ykUv/LeUD4dftsX5G3fcI2QZI9xMxm7bSjfS3mBGED
         +QgaysaLRgpIToiMUXkD9Xg1unCP8MA6xDuSinRE2GzE+uF98VCdTAMqHOMnc6nvUUh4
         8gJQVVM0bBZSu9LBqUk5sJXkskbBgIHpMtlmU0dZFe8rpShAC3+c5ar1cB94EwrV7iKz
         lPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763483304; x=1764088104;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d0ofk2DnhJ+xH+9yXlJaWK4ofE7g/nNzRBk1/VuwE+Y=;
        b=UAWLKRNbZ+rNXixFVN1FMshxLrDyjbI2G5qjLOM4rsrkYsfDQXWcvBxrZFjewk1aGn
         aCv9n2Vuis7N1DKwmypGREb7aFzZtsa8h/dY3PHBwcWS1qo9wuN9IFkMnsvxECJX3b7C
         JugAG4wfDqXMrhHOcjj7CZdHOZ+42CbHcGoPVl7UrMPPG2Be4cIN+CDr1sphcYhR8xOc
         /71QFvlHAJ62lDOqebauPoDLtG7q30VYxgKHrsCVoS1Mm/mdTQxdOjPQ46yQYp7UuWH3
         LlPI5rm5RrgaA9904RJ9sYN0TpZwn90e3+nnZ+Q5AUmBh5Yi/B78de7uBDrf7VcVMyOG
         flLA==
X-Forwarded-Encrypted: i=1; AJvYcCXx8cfKy8gLaaNDBdD5XPt8+S1mSXi3vj2yFUQhihdM0nPQnJe8KNCpGxamBq6OCb+a9Y3YN7hZA8hsKYQAelm/@lists.infradead.org
X-Gm-Message-State: AOJu0YweMNi8Tvu9tUWc8FGAsJ9YuxFU2dlPyhXds+408NT3I37+gxHH
	6XuLN0giqIziN1O5fsDgPYr7kVTeKC8GzN1C4/K7MIBVI+RTFpEw33UbGJK641sXld5ie1sC53J
	FvcHOaaI=
X-Gm-Gg: ASbGncvVuZU7J7VuJPV3C0dJ4neZJjXzwfj2kdHlrMGnMV4jJzbHsm56O5TFolDXP/j
	qlm1YLNfTy5HQfU0tURdatxY0ntHpQmKj1Os6RuSDKpPWPI2CmeZyWQzkSFrk8pBX+hVXK/Etnc
	z3klJxPM4mJEMMcckwe87DZr8yPDHS0HvYuzOo4Sb25a5r9wP/KliaiZc9SBSCovvKjBCOdJ6/B
	vRtVD+verwHJSnI+A6j/YHszwI/IEftbQSS/y9eweHAvJTnJnVlLOWq2xcbZGQqR9yA2wwrxPcB
	Ck4ynhsZObTfCdB3yWlnyU23VhAbfjfVvLP3rc0zZi/yoH2efKlu0/T438jtXqK7yaUlRLKP98e
	9408vUkgF5GaYZbBslbhNfWozGZHEqE/ugazCdkbGLG3vOw6Gtpy1NCsMTNyQe45YpjbmTDew+F
	NPjo8zu+SjR05E4hXY3Al82DsHk1HO1HGayzGjLup2RA==
X-Google-Smtp-Source: AGHT+IEOUUUOt7+haNfNY7f4WMr2XAw5LyRTouQ6puNuomap6F1bvehMt9KTpJ7UVZBkfF6l25TEgg==
X-Received: by 2002:a05:600c:630d:b0:477:89d5:fdac with SMTP id 5b1f17b1804b1-4778fea1becmr184750085e9.31.1763483304287;
        Tue, 18 Nov 2025 08:28:24 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9dea7fcsm20369125e9.8.2025.11.18.08.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 08:28:23 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Tue, 18 Nov 2025 16:28:00 +0000
Subject: [PATCH v5 10/13] coresight: Remove misleading definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-james-cs-syncfreq-v5-10-82efd7b1a751@linaro.org>
References: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
In-Reply-To: <20251118-james-cs-syncfreq-v5-0-82efd7b1a751@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_082826_142001_B4204871 
X-CRM114-Status: GOOD (  15.08  )
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

ETM_OPT_* definitions duplicate the PMU format attributes that have
always been published in sysfs. Hardcoding them here makes it misleading
as to what the 'real' PMU API is and prevents attributes from being
rearranged in the future.

ETM4_CFG_BIT_* definitions just define what the Arm Architecture is
which is not the responsibility of the kernel to do and doesn't scale to
other registers or versions of ETM. It's not an actual software ABI/API
and these definitions here mislead that it is.

Any tools using the first ones would be broken anyway as they won't work
when attributes are moved, so removing them is the right thing to do and
will prompt a fix. Tools using the second ones can trivially redefine
them locally.

Perf also has its own copy of the headers so both of these things can be
fixed up at a later date.

Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 include/linux/coresight-pmu.h | 24 ------------------------
 1 file changed, 24 deletions(-)

diff --git a/include/linux/coresight-pmu.h b/include/linux/coresight-pmu.h
index 89b0ac0014b0..2e179abe472a 100644
--- a/include/linux/coresight-pmu.h
+++ b/include/linux/coresight-pmu.h
@@ -21,30 +21,6 @@
  */
 #define CORESIGHT_LEGACY_CPU_TRACE_ID(cpu)  (0x10 + (cpu * 2))
 
-/*
- * Below are the definition of bit offsets for perf option, and works as
- * arbitrary values for all ETM versions.
- *
- * Most of them are orignally from ETMv3.5/PTM's ETMCR config, therefore,
- * ETMv3.5/PTM doesn't define ETMCR config bits with prefix "ETM3_" and
- * directly use below macros as config bits.
- */
-#define ETM_OPT_BRANCH_BROADCAST 8
-#define ETM_OPT_CYCACC		12
-#define ETM_OPT_CTXTID		14
-#define ETM_OPT_CTXTID2		15
-#define ETM_OPT_TS		28
-#define ETM_OPT_RETSTK		29
-
-/* ETMv4 CONFIGR programming bits for the ETM OPTs */
-#define ETM4_CFG_BIT_BB         3
-#define ETM4_CFG_BIT_CYCACC	4
-#define ETM4_CFG_BIT_CTXTID	6
-#define ETM4_CFG_BIT_VMID	7
-#define ETM4_CFG_BIT_TS		11
-#define ETM4_CFG_BIT_RETSTK	12
-#define ETM4_CFG_BIT_VMID_OPT	15
-
 /*
  * Interpretation of the PERF_RECORD_AUX_OUTPUT_HW_ID payload.
  * Used to associate a CPU with the CoreSight Trace ID.

-- 
2.34.1


