Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03B48C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 15:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ei/HnJSvouST6mpmth1X7iDdKdrsxcGxYeWK5nNgG1Y=; b=b2ZsCOznwaWNQC53L2en6+wFXm
	Rkb3/86flEaJfsHJ30AV1IR5QBF6HIObTk66o8hUmGjpS4Bo//UBw0LEyjJr93POHdUPXJxf5W0/I
	sBTTEHQIIJMFj/XasNcKCsCqI9BUgr4HiH0tqVbA+JD6VCCPR+108E1MrhSej+oVEjTThWne6yJ5z
	VZJGiOPcY2RdVwfG/512CrEdgt90mT/1S7fKi5aaTJAA1YfxmMs/jREstA0iQUkRHFI772jbywfZt
	aTQlSOusNhsHW86FUIKPlkVD/v4Z+sHf2MsT3bIODYl+FqFfSwEhY63TcmucKpxBTiVZfSUDTOmY/
	1lD0HLJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uds7p-000000002gK-3Ss5;
	Mon, 21 Jul 2025 15:08:21 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udq27-0000000HIfI-129X
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 12:54:21 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-451d7b50815so32589055e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 05:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753102458; x=1753707258; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ei/HnJSvouST6mpmth1X7iDdKdrsxcGxYeWK5nNgG1Y=;
        b=Lm/lYvWFY+lkmurN2Q7xyQ/bp31kbaWo3nNY5cJy/1de6J1bMaf8+n4c/LA9+zKmAQ
         TyoICdR+6CM+abSmbczUlqlAjVB0/VrhBoxUT5UtqdjKFpw56dUdU3FKmYHUBGoqj0zn
         knBHhTxXKBFGfw0RDF+qYxV6way1LeJ4AzhfQf3S4wCvkHmogl3ueq8nP4HBECTLAru0
         Km+r2sJmnqnp2V7yD4vOOZoMj3TKlqXQx+5731VwjUcQMTJ8MxXBEh+T3bxjBQUU+wNu
         omeKeT0EJg08e0FMGTwhYj03zoOKu/TaBhfG3rILaWO3l/MpwBcPGCie8DD7D4ti6MTV
         B04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753102458; x=1753707258;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ei/HnJSvouST6mpmth1X7iDdKdrsxcGxYeWK5nNgG1Y=;
        b=KgxM0y8HjJOggqJKl6rE1neTCLaz0FoxbdzMJc8dSd+gmp/fZvCAnDiZIDB99im/P0
         sTs0WhpsGhyLMpe2LYdjIxoEqgsnduMLsnQoWg7BXrHys3HNUNyWWg2qHAdEvdfRGPjv
         GG11tod9es9ilM7VwwPYxr0kE6V6bkWjryEgQpWs7maP4eiStpMnF8lK7eAJ/5j+1clx
         Z1AXaGuTVztRFKbeVB45U7TfRs8/aHKDJz7MnflmjhwhnXmZc6L4ZRmkNr9d21M8EzlG
         fkK3B9mKCgAkAr0JCilpfrOZQjy7zkozTMNQzcZ56W17aYp6HANZ8uLiRCTonlvsOykA
         MFdw==
X-Gm-Message-State: AOJu0Yxfcc2R7ZF7NWMapSjUl3ckHSPiG/WEyTE//BZnKprsuukMSIq1
	fF3b4MvDSYVWTDt5ZJVrRlK/Oq1z3RP+ukEogYATrkhDc+xn5wR8pRqwdJQEbzPiS2s=
X-Gm-Gg: ASbGncu0V/1PiIP5vET/dNkuC6qQ+NzomklNKuyt3uPRox/unYT4BNY6bx2oqMNqXKb
	eQe1Nih41mS+oRvHllqBoRhRzucWnFyJ8jeNmSqkqGwBV5YoXABqhKfLPMaSIRTU17eyMTWFOjC
	kgiDSdaUh5wcmz1Bztk2aN3lkhEAAth8+/xAOt4ydqhvH1SzoYN2NLefr2RIEQHASHDzFxS3UYt
	YRM6+JZ9R7nC4fZqnWeVAO6WMbd4wuDkBq1pN7uw+1z6NItFfQv//QoAa+rrR6DPhDXEs8ivZLg
	Jad6J5NnLgItsiMw1Q9i6aKKihPNs538mKeP/4qQ3Cr5ye+nisK0gLK3qeH4wgY8o+GzImYLj5X
	YvJivHkK7rFdWVVTtuguO2uVsy8G6m18=
X-Google-Smtp-Source: AGHT+IGXHG3FB2msUxbdeDts98g2pPebzoNgn/wdUbPPp8qpa2AIRfLTEy0hX7PjnhlcduPhaxdQQw==
X-Received: by 2002:a05:600c:1c0b:b0:456:285b:db24 with SMTP id 5b1f17b1804b1-4562e37c48cmr144674035e9.28.1753102457591;
        Mon, 21 Jul 2025 05:54:17 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563b75de26sm98995225e9.33.2025.07.21.05.54.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 05:54:17 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 21 Jul 2025 13:53:37 +0100
Subject: [PATCH v4 06/12] arm64/boot: Enable EL2 requirements for
 SPE_FEAT_FDS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-james-perf-feat_spe_eft-v4-6-0a527410f8fd@linaro.org>
References: <20250721-james-perf-feat_spe_eft-v4-0-0a527410f8fd@linaro.org>
In-Reply-To: <20250721-james-perf-feat_spe_eft-v4-0-0a527410f8fd@linaro.org>
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
 kvmarm@lists.linux.dev, Leo Yan <leo.yan@arm.com>, 
 James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_055419_304386_F3DDCBFB 
X-CRM114-Status: GOOD (  11.81  )
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

Tested-by: Leo Yan <leo.yan@arm.com>
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


