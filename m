Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F666C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 14:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tni0DswMrCD5TnIk9k/V3+/ZJa/XagFEwHSR8GX4s6s=; b=NI/GhIVxV1XmmouTlZrcKcP33c
	ItCcjwWttOywyoFYfKVCcgVtwrk6Q4fmLvaybKG6GWqNhIepD4DICuD6rcnVwNnqn3yh0yopDjzQ5
	SV7cDsKd6kJWVDHSLRjzZzktarVaTyUVUoeS6Fa2zDKGUyks4gTA1Z5M1DiiMJ38g5tq/S4sh7tk7
	kRAf8QiuGItWlwTkSyArwOHhXIpKov8F19xF+b0gzeghrngdT8pdYBTEXNq9egYGYe/YR5UCt/IHd
	hepZtcz+km2Tsq7KVa0weMw/S5M2RwyrsqzQtK5D1WSiuMUKGisNl3s6MGu2f1oAiHJ76PfCnS/Xj
	Y97QsXwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udrBL-0000000HSsK-03Pp;
	Mon, 21 Jul 2025 14:07:55 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqCm-0000000HKqf-1FfG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 13:05:21 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-451dbe494d6so47289675e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 06:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753103117; x=1753707917; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Tni0DswMrCD5TnIk9k/V3+/ZJa/XagFEwHSR8GX4s6s=;
        b=XEZEhiUo3UlUsfcj0lJxH2y5y4f2Dfyxgac4Tk40fP5Ep10rL8m5Z41nduB8dI+aPw
         FpNc0VrBS/4qWFY4HR/L6NaLXVtkvelwRbnX0UoaWOZlzYnda9WbdS7ejmidj559v144
         qScvFrdwaJJKhuGWsGoM7h0IEOWD0ocW3XcFT1pniPtILcsWyxSWB+KFIHLWmv2CWIlc
         /Q2dbqLtwL/hk9nyX/XZiccI8WGXS/om89o/cCBfV561DuFwqWeIX3JWFM3UEJXPIFqP
         8bVmjKKIPcsTpk1QUKYMDJD/NR1RhIsf0ck668NIifqnjbQKpRm6rSbNoJZvClwdS9Jt
         SRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753103118; x=1753707918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tni0DswMrCD5TnIk9k/V3+/ZJa/XagFEwHSR8GX4s6s=;
        b=LE17fDPZY8oDOEzP39OMjLJJd1800CtVTDU5iuWvDMVbdm4D9RBQOO5kfJ3QZ5Wt4B
         lpA9xR15RQDCcaU9MrK77FU/EzyhQ+c/jTxSmJwx6wdArSgfHEJ3dvXYoAHf3eBrOZf5
         FKKzE2760SeeNxqN6LEV/+5ZXfhLSQ4kMsmzXHhusEEjA+dLtPMCsuTe4dwXqaJ+kiOB
         xH9K790wku3YhdHOz0gbh0Nnfyqb/3GsXhucDQzP9pVHhxG6iVANb/Y+LEYSvGxjPIoq
         KVNr8NYL4FqlatsEis1UuU9l9z5EG1zSVx9I9pbrd8CBkXnq+6PuJo+vbFo3o79vnsrJ
         SNQw==
X-Gm-Message-State: AOJu0Yzyk9yvlcyghtQ1KaU/19mpSC9sWEImb3Efu+wdZ73qW9ix879d
	7ym6CcJcvBPk8VQOrkRDB04dwsQVnIDAkD2uLCSZijT2v0+3erZt8m3tLrXzm3VdK/o=
X-Gm-Gg: ASbGncvhKX+20Gy0VpAB3LMe4jpsaqTIItHN2YxZU2SHENT+oYtc4N7KOQtonBQXCKz
	q59cFJYqbov0sEk511P+m9A7QZYxPZrd6jyyCH4fygAP0/twWFGHjREHmv0Vhn10J9OW1UVM/qa
	U5wypyvbEjtLPAGHyFhxAQ2N0IhLkxBD6wscttBShqxoqmP26ox0IPtbs1EKIGymO07Pznt0l2e
	BHVpg5hy9+c+lNHDUgqaKCH8hdKeUyABBCDEdeKNpG0Uzg353RkVQ8HjNdAYBd1bJpf8E0vzZBx
	xQ5mVsQK2Gyy69PssJ4NxBDhWdV7sVOSmk3zIBqQ1hRB7VwEUSJBOY7OV2M7/g+GcV+5jKYUrpA
	N4cpPeNc3DpnUzbZRPOHxnhxFmliv+0ecky8hE8dHpQ==
X-Google-Smtp-Source: AGHT+IEbTWNhdSsCoye5ChJxrRKNCcL1bytD0ny/gbd0G1tPqNJCslwd6wNxX0L6BGInIzH8XxTY9A==
X-Received: by 2002:a05:600c:5298:b0:456:15c7:ce90 with SMTP id 5b1f17b1804b1-4562e38a72fmr200645775e9.12.1753103117481;
        Mon, 21 Jul 2025 06:05:17 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca5c632sm10485077f8f.80.2025.07.21.06.05.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 06:05:17 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 21 Jul 2025 14:05:00 +0100
Subject: [PATCH v5 06/12] arm64/boot: Enable EL2 requirements for
 SPE_FEAT_FDS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-james-perf-feat_spe_eft-v5-6-a7bc533485a1@linaro.org>
References: <20250721-james-perf-feat_spe_eft-v5-0-a7bc533485a1@linaro.org>
In-Reply-To: <20250721-james-perf-feat_spe_eft-v5-0-a7bc533485a1@linaro.org>
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
 Adrian Hunter <adrian.hunter@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_060520_343862_06945E59 
X-CRM114-Status: GOOD (  11.92  )
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

SPE data source filtering (optional from Armv8.8) requires that traps to
the filter register PMSDSFR be disabled. Document the requirements and
disable the traps if the feature is present.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 Documentation/arch/arm64/booting.rst | 11 +++++++++++
 arch/arm64/include/asm/el2_setup.h   | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index ee9b790c0d72..b4f6d487a322 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -404,6 +404,17 @@ Before jumping into the kernel, the following conditions must be met:
     - HDFGWTR2_EL2.nPMICFILTR_EL0 (bit 3) must be initialised to 0b1.
     - HDFGWTR2_EL2.nPMUACR_EL1 (bit 4) must be initialised to 0b1.
 
+  For CPUs with SPE data source filtering (FEAT_SPE_FDS):
+
+  - If EL3 is present:
+
+    - MDCR_EL3.EnPMS3 (bit 42) must be initialised to 0b1.
+
+  - If the kernel is entered at EL1 and EL2 is present:
+
+    - HDFGRTR2_EL2.nPMSDSFR_EL1 (bit 19) must be initialised to 0b1.
+    - HDFGWTR2_EL2.nPMSDSFR_EL1 (bit 19) must be initialised to 0b1.
+
   For CPUs with Memory Copy and Memory Set instructions (FEAT_MOPS):
 
   - If the kernel is entered at EL1 and EL2 is present:
diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 2bb0d28952e4..7c89e0d6e739 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -284,6 +284,17 @@
 	orr	x0, x0, #HDFGRTR2_EL2_nPMICFILTR_EL0
 	orr	x0, x0, #HDFGRTR2_EL2_nPMUACR_EL1
 .Lskip_pmuv3p9_\@:
+	/* If SPE is implemented, */
+	__spe_vers_imp .Lskip_spefds_\@, ID_AA64DFR0_EL1_PMSVer_IMP, x1
+	/* we can read PMSIDR and */
+	mrs_s	x1, SYS_PMSIDR_EL1
+	and	x1, x1,  #PMSIDR_EL1_FDS
+	/* if FEAT_SPE_FDS is implemented, */
+	cbz	x1, .Lskip_spefds_\@
+	/* disable traps to PMSDSFR. */
+	orr	x0, x0, #HDFGRTR2_EL2_nPMSDSFR_EL1
+
+.Lskip_spefds_\@:
 	msr_s   SYS_HDFGRTR2_EL2, x0
 	msr_s   SYS_HDFGWTR2_EL2, x0
 	msr_s   SYS_HFGRTR2_EL2, xzr

-- 
2.34.1


