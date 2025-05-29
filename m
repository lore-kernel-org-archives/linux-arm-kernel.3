Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FA6C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 12:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YBZfytqoLfoLLkCHGYVhQ8mByrfQ3MODercYrOljLZA=; b=SqFwSExai7xabUH/qWvm+rmnt9
	mL0wHxYBRQl7+IWpENLYu4RlKlPPe8wPYniuWT0SjIP3zP1+L8fSTcuDcwy0pAugwNK/PE7UkF6Mw
	bo8n2JfSL7nbW+RnUvM3mw/P6Vh1hJu8Hh2OhFIQhNF94SVmbfYlPlS3FoX5uLP+rEelDtlt3lL3R
	IhdJfFNsT5VwGtiuEyzPGDl4BByy3XlmLue9NeSTCw37p8tXSQxc6mfTFP5A0OfYlfYDHPdKj5GPL
	NImRZv2hhueoyxC9EWnpAHtc/sAT5AB84+W/ewtvcGwepFHfwtQplRsqA6M29bLZNi3NXX9FXT2hv
	nYdFZx7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKcKB-0000000FjDO-10Z8;
	Thu, 29 May 2025 12:25:31 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKbVc-0000000FdBX-3nvt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 11:33:18 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-441c99459e9so5694195e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 04:33:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748518395; x=1749123195; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YBZfytqoLfoLLkCHGYVhQ8mByrfQ3MODercYrOljLZA=;
        b=GFzLQtNYL9QYqTdyvrERh2nhYRSlbuwFl/B/0ki2U14uj7c4ID2oMEppVQzNAA+SoS
         GWMXb4NasR+SF7pyNxSzBEhaoCLfM5Ycdsrq+zbbQKAW53INArOfW6XZ2TmpqNzZaLak
         7vcdJIazg43j8FXhFP9NKNXGf0cuwMkNG9NsqkZeepsNkEgWP4y0JQnrogFZXHcKgd0w
         EgoqyaSHF2Lk3sFQwSY5C9LAag4ruORIgPWTRvUIwws8ZCPH41DBKFo//ft8TOEnP+1z
         mMF4pXRhmbNmVWqhpSGD12wxJWTX4nFOtxYm8OWPjeuQlidUZ0oi6PYYqVcppPDSkgfk
         XoyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748518395; x=1749123195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YBZfytqoLfoLLkCHGYVhQ8mByrfQ3MODercYrOljLZA=;
        b=H9/fXtO07EBc2KFu//LT6ARN9uC/LCaA3kMBVgxniJmhtMK9L1ShruOJiClgYeIDk3
         kgm7OIW/2KiOYR88t8bNOaIsk8+CScQMw6EUm9f8kIT8qTqr/pBlV9gsoO2/yGPJH0In
         ovjtcGQ545VgijOUgz++Z4QIcGhTdANTidJxC/fdhpk4qxWzgKHSiuhPuAJTg5yQTwXn
         U40+WYiBPMyI2g/Ge6PG9PqjT0A0MWqc+g5d9jkvaftJF12Tjdn2PWucfVw4O5pLjCcc
         4X8NwVP0JtarPJ3BfLYtvo2OYXxiw4ZNtzIMH5K2s0fcBE/ge6qLSPiraylc3maeDDfY
         oEgw==
X-Gm-Message-State: AOJu0YycT5bOSzxesIQY+0Lj8SJIYh/+qrjP2UJKNgHq+qLE6MwBmZB3
	oX2QgQ5S3ZbUXEX9Ga/chDrchbjHD/C0DTYmURsOWGlnqAOsGazWtxexN0k//I76VvM=
X-Gm-Gg: ASbGnctDE6tYL3MxytWcEvCfG6WyntrDno5PDMF0zsKRIvZGl4eK56EDSmRX2iI5Tyv
	74WfHpbdHScjwqPxJJ6MTnoEkI76u4qozi6chXS4JxkzvICvQ64WT62h+oJbxyKYycdhl+Uve2X
	PkehToFjjVxYcjWF3kUHMUTzxPIOwulcHSfilEF9mMw8eQu1khwYnNt+nS8x6Z6d8Q9PEyRO0p5
	hmwUQW8bvGEdwp/Q/J7+QMMrAevf2JZEZMXHDh6pYFf3f1fvVOH9POWGaYUddpE06WRoAaoTgvD
	zu5XbWeE7JLalA2nzcW6wata/2v1aHheJgbMNV0dF4u2egkeVi+r6fIVMybR
X-Google-Smtp-Source: AGHT+IHMMfVW7IE9nbkSMy9wDfF0tmM1c9IXy+rbxej/RhTBlE7UtH3OLrCFPOGZOGsnCFRe6FkZLQ==
X-Received: by 2002:a05:600c:4394:b0:450:cc79:676 with SMTP id 5b1f17b1804b1-450cc79077fmr23266695e9.20.1748518395511;
        Thu, 29 May 2025 04:33:15 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc3785bsm17443945e9.40.2025.05.29.04.33.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 04:33:15 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 29 May 2025 12:30:26 +0100
Subject: [PATCH v2 05/11] arm64/boot: Enable EL2 requirements for
 SPE_FEAT_FDS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-james-perf-feat_spe_eft-v2-5-a01a9baad06a@linaro.org>
References: <20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org>
In-Reply-To: <20250529-james-perf-feat_spe_eft-v2-0-a01a9baad06a@linaro.org>
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
X-CRM114-CacheID: sfid-20250529_043316_953841_C202196C 
X-CRM114-Status: GOOD (  12.29  )
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
 arch/arm64/include/asm/el2_setup.h   | 14 ++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index dee7b6de864f..abd75085a239 100644
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
index f6d72ca03133..6d0d8c25e912 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -279,6 +279,20 @@
 	orr	x0, x0, #HDFGRTR2_EL2_nPMICFILTR_EL0
 	orr	x0, x0, #HDFGRTR2_EL2_nPMUACR_EL1
 .Lskip_pmuv3p9_\@:
+	mrs	x1, id_aa64dfr0_el1
+	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
+	/* If SPE is implemented, */
+	cmp	x1, #ID_AA64DFR0_EL1_PMSVer_IMP
+	b.lt	.Lskip_spefds_\@
+	/* we can read PMSIDR and */
+	mrs_s	x1, SYS_PMSIDR_EL1
+	and	x1, x1,  #(1 << PMSIDR_EL1_FDS_SHIFT)
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


