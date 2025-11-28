Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FD1D116F5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 11:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ae53kt1kaP5kLWZ/U4gl1GbpsgIlbD/90J2vkmwtJMY=; b=HV5uiWJqI4oVMXt+zBILeW66IL
	FZPOp69vbhQZkHoe9ynxs2O1g0Far6FykOfJFdyHyr1PnqxNsCJwAaNLZnLP/rbuIaZ4PBUebqLrK
	qCv9DCzVpBkUDw5NFIY54q1H9FyPuZkaen07d0+OggoC2vQbziMtQTURylJB25X5xFRO2/velAZXu
	i3T/CK44+8ZtEtt68Wz2FQNJ+3l4VAnodaAM5LsBNXhSRh1jR8qmYzw3dbmk/61La7gQVVON9g5PG
	ubr3RxFzkPxS7PVv1pH22Ech18sPN4/v8aBBvnd7pT+eaksflxztQzguXYO4Qr1r3+nwMZVtqh4Ry
	rbDwwtjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOx5B-00000000Ntb-3ah3;
	Fri, 28 Nov 2025 11:56:13 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOx4z-00000000NlG-12ob
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 11:56:02 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-477563e28a3so12395625e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 03:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1764330959; x=1764935759; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ae53kt1kaP5kLWZ/U4gl1GbpsgIlbD/90J2vkmwtJMY=;
        b=dJOUOd83q6pYoIn5UIoeOVtW5B8vrYfQ18BrddSxlgqL8/eJYR1OF5da7xeykBiWht
         Ky5oDapVGBP0BMk10OVCco2ybvGFrp/FsO/hq0iXg4Md87eNiBs/q55Gzp3Op1Q/EMnl
         JCVfIQK6BOX/B17w5W0J6LNm+vSFz6SIOgj6piGh06ljvyKRTb7kdUhaL8c6zTHEdy9H
         o5ED7rNiqTR6ftp/V7I2sQs84SxPBQMDgxbbFr22XQ8/iwfmxOs767fE2lPBHY8VXBFj
         BskQXDgyx0sKPwvr3kda0lzYtYoUlVjRml9ne9c5Zy7VbRiYCvJhGZGwmJQNBfn5fHf4
         SUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764330959; x=1764935759;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ae53kt1kaP5kLWZ/U4gl1GbpsgIlbD/90J2vkmwtJMY=;
        b=QFovJnpEzVhrTeUW6LCHshY0jro98KYpoQU2J4cj4gqvP+njU1SRjIG361jVMuwiOv
         I/53JqKc7p76jQs418LwmLJH5wbjOoWkAf8gZ1Cax0yFoN5ESsQoV7TgdRO8Gr88tZKe
         rxSqzUpkqaDxoukozGO42VXOOPsnzk/fqJ+yKq83a4vMgyNEcKmCfEz5Xpo5Alh1Imdv
         ExBRxAwlIPVKfuG2otmFDm4NGnqWGz1SCkFrUWlftr3njAYXYYuORkETUSbxBYw30chX
         jb+g5RrUmycXHibMjeAzKo6Z1x6TTrUD088FwkYXgOHhA09uUiHeF/BFZs4ZXGqw1d4n
         7LWQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAmr+2FMhRMfnLf3GLEc4igUIHH0ZhfVzDunlxYrCiiUINOY5TySZI7bDIPvY9cr7vA9g/P1sQxs6SSI56rUrk@lists.infradead.org
X-Gm-Message-State: AOJu0YzV/vCmytCPccXXDNBJ75LFsxOcjgJBwz8L7ZfDMGNoniUaMgLQ
	gYHonbK7149qaSRd86avvx6uD86cYiRiG+Pi5FGnKnthlR2NODYQ0+ue3Nu2HEzI+Sc=
X-Gm-Gg: ASbGncsB+f4vpkFr/yRluClaTgo9xiFBgy3pjidQdkAl20rzkHVZPdrliklAdXmPYJN
	+VBwNs6TEVeb09fLKB/boMRffGWoIkKS/KhmCCVpaHAPBlIRwVYs5MZiIXi9QO7FVJHKtRatrSy
	ObTA+isOggY7h83NChjvkq/L/s2iAYFn8WXxt1LWqaCJAJIV+XRn1uE0iIYzOP1oRGaK+x//HrZ
	8HY2Zy00D7kdUc+lfocDZ4cubiao8QcbDvup0+QpVfQBPH6cn6xoWi8KJXESMd6It6TgAaJZX6B
	CiR+mmu3dEh/kNfjLJpWqDK+lRedFk0HaJgLa734B2FrEG/t5ipFpMOaqQWn4qIHA9p35uYyd5J
	KaB+hqFgTm7xMojd6QsFDaGvUMk+rjYz305Q3H4n3A1iIqupfjTuuI2xfdvjkiJotSYqNrYLdfa
	Cy860JLO+Db13c0WL++z8a
X-Google-Smtp-Source: AGHT+IHmmXmZWvxFJIN++KvkjNQAu8BrPSpq+PPtR4UIJjgdT7j1BzkY1f2m+jA5FMpwm/eknom5XQ==
X-Received: by 2002:a05:600c:3784:b0:479:1348:c63e with SMTP id 5b1f17b1804b1-4791348cca8mr38526545e9.9.1764330958941;
        Fri, 28 Nov 2025 03:55:58 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4790adc8bc7sm158974465e9.1.2025.11.28.03.55.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Nov 2025 03:55:58 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Fri, 28 Nov 2025 11:55:22 +0000
Subject: [PATCH v8 10/13] coresight: Remove misleading definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-james-cs-syncfreq-v8-10-4d319764cc58@linaro.org>
References: <20251128-james-cs-syncfreq-v8-0-4d319764cc58@linaro.org>
In-Reply-To: <20251128-james-cs-syncfreq-v8-0-4d319764cc58@linaro.org>
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
X-CRM114-CacheID: sfid-20251128_035601_320778_AFE14A56 
X-CRM114-Status: GOOD (  14.74  )
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
Tested-by: Leo Yan <leo.yan@arm.com>
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


