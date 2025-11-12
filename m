Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19482CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 15:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ILLjcNFKCShCpCjFdgdkPREBFmKKVtEX1F/DK1p7azU=; b=G3AvvuNDG0MotFuDpD8LLUvllo
	U84OsJcNyMq1cQ9RFI5AFZQn40H0BVpDBff5lBuhDAfdBOYGgrkDxNWqeweL3KLCacMGol8yEi3uU
	bm01hdje/SO+fb7yg4VvrCz4ov5hihvpooVhacKeNoPeRzzSiWl6b3FQHwQYXKJSvbxyloBlSsQcn
	eQoD3SjEfTf0UQkosU3WduEAD8Zt+Y1gsrM9VuIRxnwbLvQ/9LoS+JYPAqxNB1QRpXsHTEoz5Q3Si
	Iwoxmx06g4DpOGMppnnrwJUT10ZUal6S+cIk0T5fvCEb8pvDUlvevCCSkW7Xp0KTaVPZihmf1dgzP
	vyekb4SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCgJ-000000092Rw-13AR;
	Wed, 12 Nov 2025 15:22:47 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCgB-000000092Kp-2SqO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 15:22:40 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-42b2a0c18caso795070f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 07:22:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1762960958; x=1763565758; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ILLjcNFKCShCpCjFdgdkPREBFmKKVtEX1F/DK1p7azU=;
        b=RA9uCG93cENU1dDr4f7S8wh7txM4kWemrEwiuXw/IzAJjb7B/4Y9p9i0AWdgZqxK6i
         Xk0dC8Uf5bRzpaat90h6LUQs4CRwnWL2+dVAGl0u/Z4J1lY0w6WmFWJ4b3dRTmZQf4gU
         /q7/pQ7m1PAbBNDKbil5exogGpc5yQy7GMNTqAlYI9Qh9he8qUokMXxH73ZVofVPz8LB
         QPhuVnqaJN6NKcvaBUoxZ5AKjBIlEDQ+esZp6RRP3TDNnpeiYEFYeF9AeRqkBeJLQoJE
         gOoNlZbMXCFIDeMok9WactNgVu/41OcUMkqi+pMQoxxAM8UvV6GTxY+ILvliLWkqU6+a
         wsnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762960958; x=1763565758;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ILLjcNFKCShCpCjFdgdkPREBFmKKVtEX1F/DK1p7azU=;
        b=fsJZpdJFW9gB4nFgBMSqoAvI9K65X+9j+JnzvCe5xvgBoAyzrEdbKj2s1Iv3/JvLJq
         v2uySMHkTHZZ5kWsAG/yez8jzwt2K5nkK5jc8V/aOOsNfhFGM6JtAeT6W+4+GpPPJndw
         IVr+1KxRpxSmz0p6JNMnxUwUHaNQwlnvEXyrMWDdkrQhjhlZWzdz+RezHcdzTWIDE9to
         o/gX6i4uCekjsN2zHY+cdBt7sEtGJ6BG45UQpYAZlWUYigUH6JGUlRLWTcQqHF2f5Blr
         Qy7qDu5mgaV4jDnpFZkfYc1v9CNf3Mu/kpQKKY/fqvVthG44VmxfyUPDmdtL2wpzbyCK
         EziQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0C73VYhEpEiC3PBxiBjUwdq3qa+EJFXNrPHfKVuLkoMIQKIHFUpPAR6K2719M0VE6ULxiV67eW9UCm0zkeFiy@lists.infradead.org
X-Gm-Message-State: AOJu0YzoRyfkZMj3CV7cpW+eecliHJZGaHLqtt0Gvh8o55nXl6yUKf2N
	xxyou5rt7Di+tO1ACsK0ViwW/CjOu3erves65RBSzmUL0MRd3sdMrV6xdD88Fj2PBdo=
X-Gm-Gg: ASbGncvwy4VpsAjQMby3zjaRUL/PHIdAZ5z4UpDpbsFQ2zsh1I5uNgYoVc8aE7aHRsp
	iQDtumf+7rYgxDhia872smbFB2mvAv5UJyRLSQA5gb0i8aiYWk9/sU+bzgjQ17nsj1ll/YmROSF
	MUq/lfko8uy6ilL3CHY6O98zGQsyCPFDBUXiETfJaugmoDfP5Q7U+H0Er7tuxwnF8r4EQpLm2Sv
	kR7G4rRibOP4E+yLjqyiP5d8fxGe58Nu/RnxNqAzVWUhD3OEs59FEV9mi6ABx6IZUANjtlY6m02
	peT9bELWxpXphY37sKA0TH+M6Pgs3eDTt9fPQqIWTgg/7bzC96+GN4lThAI64wXC8QDgQjuHBix
	o4miFfWiZ+r4+pGORZ9bcvT4VjnByNVQicWztHPkJC5xsuvoXvQELusTXthdEL9AajfB/ST6gAB
	E9B5qSz3V14g==
X-Google-Smtp-Source: AGHT+IGjdUCcCG92Q/jqFroCRNOfWwVifVOKjjlFDKz+QCM71f6L1+0atNpuSmvuBiDEBaoYhQJwCQ==
X-Received: by 2002:a05:6000:420e:b0:42b:43cc:982f with SMTP id ffacd0b85a97d-42b4bdb0267mr3253494f8f.39.1762960957948;
        Wed, 12 Nov 2025 07:22:37 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42ac677ab75sm33573485f8f.35.2025.11.12.07.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 07:22:37 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 12 Nov 2025 15:22:16 +0000
Subject: [PATCH v4 10/13] coresight: Remove misleading definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-james-cs-syncfreq-v4-10-165ba21401dc@linaro.org>
References: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
In-Reply-To: <20251112-james-cs-syncfreq-v4-0-165ba21401dc@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jonathan Corbet <corbet@lwn.net>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_072239_651705_608485B8 
X-CRM114-Status: GOOD (  14.92  )
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


