Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143DED10F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 10:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q5aXjGQaEIx9QnRUCqph1nXShW3UVlX6C3Ll46vEA/s=; b=XRaoZ6YluNfGq3KZ3fPAF1B882
	COK8vo+JdK2pbMSyl88o8bVc0nkAjR+DrnZn5sJGUfyOVIQXgy1ZBc5wkC7onOI386/DWEgtQc2XR
	Pw0QAlcBqpnOoVEy6s2KcA6Ybjitpr5Z6UNucE0wQ+WbHLuJo6lZjX+99T2aA2i/04zy4GNjN7ZKu
	g0kgx3PaaV7Wzqjat7imnAj+aZdrtqMwZANyTrCFT35XXgbdSCwaO5NboKUvO4IWeBLvChTFRfPHG
	96X5bcU5IgkcpSSYoqc7GP8EvNLR0JKmBnkhqF5C64cuqoVOQfjNkOII4S/nquEly31rvbt9uyTqC
	oQ6o02Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODE0-0000000ErHc-3uYo;
	Wed, 26 Nov 2025 10:58:16 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODDe-0000000EqwR-2kMm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 10:57:55 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4779a637712so40295765e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 02:57:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764154673; x=1764759473; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q5aXjGQaEIx9QnRUCqph1nXShW3UVlX6C3Ll46vEA/s=;
        b=YBOpQYdO3PAxKd7/7DDn4jNbztZ6PhkC8rM77B7S80lrI1U4ukFsNZ8kbEXEmc8Udz
         TP465+8j4VrcXs/xXy1idWH2JjvSNAmo5K1/TIgV7xtv9BqwQhDm8cjNqQjRvgWRvzhO
         y3ZtOejwFP+Sc9bmJXl+xXGQtS+y24fdMjfQ3f3IxJpdPNJ6LPN2bOfGqo038pRxgI4I
         qbOosyYTDzTQZe3MUhDX81dxt2xcoAYm0aKGcbTZKhpIiUf5Mx8d8YLR75g1/CoNDuvH
         UE1P7YEOX1AAsXYLIvwWAmrBRM3kKT2O87v/7lyFpHPt43jUT8My3wbhK8jDDmvqi1+p
         14tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764154673; x=1764759473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q5aXjGQaEIx9QnRUCqph1nXShW3UVlX6C3Ll46vEA/s=;
        b=qF+9jJqgGtxRWHAyM7Y/MvJDIhdhUNjaFKbjkUlbqapA8+sXe8mYH7jTCZlLs7aTQy
         QW/L+Ik5qMT8QgSefAr/FxAMyTuRM7tun5teDHHUgEaTXidcX21A5yjm+UcnmdEMBnsG
         sjJQ7NgKm0+sL/1xult2gZjV+OyumlMOj3yEWHDiDxC+mci/174YmkEyd0TKp5NzRKxa
         9jWXZBLoWVt5shdPzFrJJ4Tgcjojz5tIxOiPhZyAOCC0WIhmzs/PM94dB/8iek7GEWyc
         wyiROga4dA9ZCfR0XnpUnoJH+fhUbAPzXPgNxJOA0ANKU7/yK8fYLXRdgp4oF02Fk+jL
         NrIg==
X-Forwarded-Encrypted: i=1; AJvYcCVJwTI1iI5nZFA8k1vPsVnJBBv3BJY5AxLGcJybRlHS8yw9uqmz/8fDp3N/kEWkA/IPMb500xQuwnpjZRX7xX+G@lists.infradead.org
X-Gm-Message-State: AOJu0Yzf5Ev+6mGcnewMAHTto/mVn+HDAlqzYZomJU3a2vwV4lbkW1Ri
	TAgQEo1tMgZkgj8f0J2E5qbUbYABY3y+bRugFh/6vKa/CpQmRvniw/9pZCtZ7HP8Qsw=
X-Gm-Gg: ASbGncs2em6SmLEjWGzJ6Nk2x/NK1IX+4i/9jGzQOPwwmYV2pLgtLolHofETyuOb5be
	BGF0GbvlceHX4uVqmLeJ21YHeJbhwkiVw1+DqhNkABb7IMTZkqXfxjJ8WfBx9Qa6rrcUhmpLA6y
	8RQQHC2mXN3x6NKMP9eIZG7M2yKZhRCn3GL5Ar8mZIyL41FGbpJdGMktQm+bbBDW1cAR7ufvYh7
	5bKT11HniPPtUbilUfXUiOXxfActlONPZZd1xVTybOAgR/4oGUlmMsA9XjAO/W4OVjUkKn2IA3V
	Z7OZWcspr2oxWgSVr6ArLQ8N2ndsamVieHF+SA273bakFh5v631KxHoUQGQLMuIvUjJy58odI2/
	aYxvitqKffpBYhYXtlqZfi9gLcJ+aY+hhMHTP8mDLT1GHeKCGTmhqjFJTDJ9E5pHml3h07pWWFp
	eC6h/8zcrse8fAojZim8kg
X-Google-Smtp-Source: AGHT+IGR9TSNU0qxbU9T+pWTN/C7ccbsqOSfxUJvTfeKj2/349hgmV74rQwiM9Qy4pMFnvlnbdm6kQ==
X-Received: by 2002:a05:600c:1c88:b0:477:9cdb:e337 with SMTP id 5b1f17b1804b1-477c0165badmr221349105e9.7.1764154672854;
        Wed, 26 Nov 2025 02:57:52 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790ade13ddsm36991765e9.8.2025.11.26.02.57.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 02:57:52 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 26 Nov 2025 10:54:39 +0000
Subject: [PATCH v7 10/13] coresight: Remove misleading definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-james-cs-syncfreq-v7-10-7fae5e0e5e16@linaro.org>
References: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
In-Reply-To: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
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
X-CRM114-CacheID: sfid-20251126_025754_718955_76F5D184 
X-CRM114-Status: GOOD (  14.99  )
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
Reviewed-by: Mike Leach <mike.leach@linaro.org>
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


