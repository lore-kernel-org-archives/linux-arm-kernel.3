Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA143C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 11:39:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pXydwqwRaP7AXP8zkgHzJDBJPfnaYLIQgQCT9Y2uDB4=; b=AXxqlKJgFzOQVxeJL6Z6HMajwL
	4Ra1jQMWBU6d0wfEyqna1GjuBJEKoXbgyGz2k/YOHD0BpVRzF09NVQQ+ZqgIR8pXLAVP1B7c0ndRT
	WnRK9lrqC2QFEIKbzkUtcRDbEz0Y5hMT4QjXXZehzbaR+ukgp7y6cKnCNpgUo+0xr8QTa04vtScje
	3hiAeO5TO7UQqemiY+D9K1j2Mu0B15yNzyPcnxUQOgDOWrclIAGy2mdapFGcz4o8Z40J4fX7zgv/J
	c4USlaNLklaMYFyx9L7emDJ3cUEMLuH+EW0pzGHaGEwD3s9YYSgdrbWLLrqN1stBwQGQsA3v8QFxa
	lV+6PPFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLR6-00000002hBX-3IVE;
	Fri, 08 Aug 2025 11:39:00 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLCT-00000002epJ-0RMN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 11:23:54 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-459e39ee7ccso19562705e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Aug 2025 04:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754652231; x=1755257031; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pXydwqwRaP7AXP8zkgHzJDBJPfnaYLIQgQCT9Y2uDB4=;
        b=k2yFJwE/T7QuBhQuRnW3U0oUx/+abX5VEs2x6hIQpg2cU1ZC0PQpJS6NizPgw+roGf
         EZyctmMoxs7hwZJ9+aaV7KjH/bJ4dePCsqtlC/dMaVohtsv4XKSaBCSfnSvergnf9iEO
         kKs1MBS2CaEGIp8IedGLeXs7yLqJro820YTsn6B+WDKz63IfwhYgCGKlGwBNey2IeHp5
         Eg/GFRqbrdPMaIu2fxuhkeOqa+M6PcAE5PEj1dBU5C2j5VQ9IMWQ+KgjobV17C3SEmm6
         TN+A2sQXiXjGGtXeS2Hp0KrL87jhTW6JUyOIvVUJv1kJXN/UBcbixH7tJxmQOF4SsX3K
         e1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754652231; x=1755257031;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pXydwqwRaP7AXP8zkgHzJDBJPfnaYLIQgQCT9Y2uDB4=;
        b=YC5CTfi3D878xQEFKLkaydty23PGycgCeB4wVhnAGFctRRSQj0uw4PQSvLUtpvPGFE
         A0j0OcHsVisfaa4UXwaXWJdejow/PiPLP8h/sdiX4PfdXb36IMBbN/BEmAckOUlo5hIl
         7ACSQJi5fSa8GasPpWKUHo2O3vsghqAlE1TyOT3fDeAnIPQtZ65U75oqijppWJ+Q1I5j
         7kZOqYtxc2JirnNEk61/9ITk8lwsVyYTwaIe5RXfr/pKc4AHRDPG9VihPn37gS15tkF6
         bI9D49hqpKJWTVLIiId1ifvM7sJZMR0RgPqxML1/2MQfadQz4KwbopD9lnjqlTJCKAY3
         f6cA==
X-Gm-Message-State: AOJu0Yxq4iThyJvC0WWb8wDrybuj2ppeLu3k0NvsAq09wqg42Wp4nCEA
	Zdw84I0H2D9VhjOU6mLqZB+MUxnv5TPMmlZ7vDwwyW4WSzRmXCG03o28KSG/lhnMSg0=
X-Gm-Gg: ASbGnctu21HHUMXG6fRvtJnzFtVCb61gppGzH2zReOYJoUpQgBBKOsrB7dhU9Lv7nn9
	pg04iiLBJLzy/kmKGSeMacR8S7CqgwN0XxsusRLf12XrV7wleAw8KHo7hU58sCwuyydbedgeGuO
	CULwBE5Mp9ZJVB5dzlbZ1srch+Q5ynIm/gC1KEplQI4MTnl3KuyzcebJ2TCFfW/BRnrF8UEL2ys
	Xuch/ZKBPlBqxj1dkPSmRju11QssdyN0X7cnvDL2muJc6YzYH7QtGtzKuscNgXrYiURA7zDN30y
	fD+GX2d8/aGLZviQ1ttRddBDfoUFlhCTlqSbJyWb88i3A23e5mUfbi+7sYwWIaIq0ILKavnFLey
	f7cJtSoLIMhMWAbE1mhhs4wdCkIcCs4g=
X-Google-Smtp-Source: AGHT+IGZt07Gv/AHxus95QP1UL0e334J3rp5xUM7DnDTXPfXeFD0bRifb9xINgGQEjtvNdHSQjLqQA==
X-Received: by 2002:a05:600c:154d:b0:459:d780:3604 with SMTP id 5b1f17b1804b1-459f4f3cf5dmr26410715e9.3.1754652231142;
        Fri, 08 Aug 2025 04:23:51 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45923c34af8sm233482635e9.24.2025.08.08.04.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 04:23:50 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 08 Aug 2025 12:23:02 +0100
Subject: [PATCH v6 05/12] arm64/boot: Factor out a macro to check SPE
 version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-james-perf-feat_spe_eft-v6-5-6daf498578c8@linaro.org>
References: <20250808-james-perf-feat_spe_eft-v6-0-6daf498578c8@linaro.org>
In-Reply-To: <20250808-james-perf-feat_spe_eft-v6-0-6daf498578c8@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Leo Yan <leo.yan@arm.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_042353_149417_F05D6D2C 
X-CRM114-Status: GOOD (  13.77  )
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

We check the version of SPE twice, and we'll add one more check in the
next commit so factor out a macro to do this. Change the #3 magic number
to the actual SPE version define (V1p2) to make it more readable.

No functional changes intended.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/el2_setup.h | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 46033027510c..3a4ca7f9acfb 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -103,8 +103,7 @@
 	csel	x2, xzr, x0, eq			// all PMU counters from EL1
 
 	/* Statistical profiling */
-	ubfx	x0, x1, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
-	cbz	x0, .Lskip_spe_\@		// Skip if SPE not present
+	__spe_vers_imp .Lskip_spe_\@, ID_AA64DFR0_EL1_PMSVer_IMP, x0 // Skip if SPE not present
 
 	mrs_s	x0, SYS_PMBIDR_EL1              // If SPE available at EL2,
 	and	x0, x0, #(1 << PMBIDR_EL1_P_SHIFT)
@@ -255,6 +254,14 @@
 .Lskip_brbe_\@:
 .endm
 
+/* Branch to skip_label if SPE version is less than given version */
+.macro __spe_vers_imp skip_label, version, tmp
+    mrs    \tmp, id_aa64dfr0_el1
+    ubfx   \tmp, \tmp, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
+    cmp    \tmp, \version
+    b.lt   \skip_label
+.endm
+
 /* Disable any fine grained traps */
 .macro __init_el2_fgt
 	mrs	x1, id_aa64mmfr0_el1
@@ -263,10 +270,8 @@
 
 	mov	x0, xzr
 	mov	x2, xzr
-	mrs	x1, id_aa64dfr0_el1
-	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
-	cmp	x1, #3
-	b.lt	.Lskip_spe_fgt_\@
+	/* If SPEv1p2 is implemented, */
+	__spe_vers_imp .Lskip_spe_fgt_\@, #ID_AA64DFR0_EL1_PMSVer_V1P2, x1
 	/* Disable PMSNEVFR_EL1 read and write traps */
 	orr	x0, x0, #HDFGRTR_EL2_nPMSNEVFR_EL1_MASK
 	orr	x2, x2, #HDFGWTR_EL2_nPMSNEVFR_EL1_MASK

-- 
2.34.1


