Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18427CF3959
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 16:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0ofk2DnhJ+xH+9yXlJaWK4ofE7g/nNzRBk1/VuwE+Y=; b=m+i5hS/OlHVbNlu7oqMTZO3Apc
	VeV3iT2BLuUZRsBciylZYYxYMQelKk8mTSGK2tWW18o5szQfKdrfx36YMpCIwjQ91ncj9Q0SR0sVD
	DhTQ+bMuEEmAvye8V6m3U0X3i7t1Fgh1hd2EQLkySvD/FGQQ5RQWzrqBW7epcAx+mBAuYc2rv+pzx
	v1KLWYHdwYAY3D7wTyCiujFU52IgWWXT+ZfTol2F7W5/l3DcEGOyy3y2Q/mVhhoFzEzwW+YA6BDNl
	n5rwvtOFiBXMUZLY+XvTYcZLvP3pkmZlXZ8XGL/jJQXyGQid2etVEIBX+lsRFAvSuWonPY/639fjt
	bfW/vnAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLktH-00000003fCl-357j;
	Wed, 19 Nov 2025 16:18:43 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkt4-00000003eyk-1jbG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 16:18:31 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4779a637712so31512675e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 08:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763569108; x=1764173908; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d0ofk2DnhJ+xH+9yXlJaWK4ofE7g/nNzRBk1/VuwE+Y=;
        b=ajXeZiKuJ60SgAB3N+MBK7dvlU6uf3I8kbaL+M1zFHrL4vY1hS9z/4z1ECenYvyJHy
         R+HmqSTLRRuz7FhRwVbFvWiNM9Z2pWzqYyJvQx3qcQpaSnXsuQfCj/hxs+O/rYFKvuIt
         +aio4plRDEbheG7qYVQODFFzc+YK587gTxdoWHlynLlVGwgZW/zjv0p6ypSP+aVLY1Nu
         YCZwa5PZlJ+IOCS8FPVA+xo7+e89sFc9sFIef2Gx9c6M6gTxTrZfbgHkBQkrx7WSPKFM
         LtEIgLKhxCzk5yKU0NvZOHIOJhRPplQz49wgbiyt80hxUNQllXOZFSgX5K7KiZMMCTew
         G7Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763569108; x=1764173908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d0ofk2DnhJ+xH+9yXlJaWK4ofE7g/nNzRBk1/VuwE+Y=;
        b=IjYMcfEgdYRehnbQhEh+s1QTm/7UllBlxly57Z8qKNWeRanRhYu0WczcnQAm7PNZ2B
         gQy8hca6aUx3mhre6VwtwzJn1SCp8vLv5gUkY6E5SHlIY9yzz1m6GJ6pGsJUWMDGtuhW
         0uHx/kMKUBdou38oAKI7z/r6rw5gDDYs0r24wNTs+cBKyRE7RwL+lhsnV1kQV9SwT3zL
         g8OyTXL4Er8zNvlkb4ljLPPCkqRkIz7HNoE2ZldbQ21xPjp6sc26WAfKTXGaNLPzFoHu
         txkfzVo5XxWJusho3w/xjvRdDSotFcoX8uq9nxn1/dO9qjTzJWVJpiRfRRbdhMssg5dg
         YiEw==
X-Forwarded-Encrypted: i=1; AJvYcCUewQNWaX53ow9Lbv1ajExac+WQGf/RzSmvxoVhN5kD0Z7CYjXFhqbJZT8JN9QLnHQEVU4Lse2Cm9FsEuv6hjGX@lists.infradead.org
X-Gm-Message-State: AOJu0Yytwepyu8RuRBQgj2pPbmhp4dfHysVZSqejr8hA4A02EaZ/ihQO
	j4zKYZxQ1mDHbK4jAnjEKcrnVbyOJRO0mEKrh0sJnBnyqSO3U/IIWcAWQzpxz/9hsZR9RJ9Yy6/
	BaZOVe3o=
X-Gm-Gg: ASbGncvCcTehwUnuffO/nzKIPHIEAi+XFGUgjy93dLJyhMh35ZdTDujJyCGA7gO3T7d
	RiDzWDxR8fGy2n6gUCcn2bnEAnH5weJsmUDvQETM4iPg6Y7GVGySLiOgqJ6OmkhKwZ1IjsJOvaf
	twnljtgPmCg/fhPnbzli/t3arGv+0Gtd38mvM8caHb1sjG90NgcJbFjUsYKm0la2ETX/ZVGXTq9
	eSo54iF+0EJxvxjYvda4Ba/tjcoMBuEmCcXIq4rd0BieyW0UNVPdy3GDNQRnhRW8OP5D9m7p8U3
	rYowQ14nWbKH5/BZPpuuH/afKGxIbltU6kxiNbeO9Wjmv94ITXfmI/3fYNT6ZlSItBf2Udl2LKW
	AWJ3WB97pqppqtimE5Rt+eTtZRhlvqiiv7RNIUIIcjPNG6KcehACr/flcFhsxiXJBXJu8ZVsryf
	UXV7tXexmaaIXyghi7LLp5ICF0/ekZUVI=
X-Google-Smtp-Source: AGHT+IFsnnLdq4HmiJTipQU11eFgkr91zE4cIVpOobeHeqJ1i8hpmzg559qdmMNA7bAMZf8QSN84zA==
X-Received: by 2002:a05:600c:1caa:b0:477:76cb:4812 with SMTP id 5b1f17b1804b1-4778fe0694amr230601115e9.0.1763569108491;
        Wed, 19 Nov 2025 08:18:28 -0800 (PST)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477b10142d3sm63205425e9.5.2025.11.19.08.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 08:18:28 -0800 (PST)
From: James Clark <james.clark@linaro.org>
Date: Wed, 19 Nov 2025 16:18:06 +0000
Subject: [PATCH v6 10/13] coresight: Remove misleading definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251119-james-cs-syncfreq-v6-10-740d24a29e51@linaro.org>
References: <20251119-james-cs-syncfreq-v6-0-740d24a29e51@linaro.org>
In-Reply-To: <20251119-james-cs-syncfreq-v6-0-740d24a29e51@linaro.org>
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
X-CRM114-CacheID: sfid-20251119_081830_474837_9F2605CC 
X-CRM114-Status: GOOD (  15.58  )
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


