Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D6FCA100A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 16:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OSNn3QEar0+QuKyDmtURSQ4BVOB8JOPxQiblvR548LM=; b=RFc40hj2B7mkygHNHo7fn4rQNy
	uc9ADRN0cucAjWlUpzffT/HGthxX6Fh0E1Tu1i5hHGImaSCFp0XfIZsxCdztJFt3K1lLCfeqJlOP/
	jMaut80vQwQ8Kl+sMFKUmwPhwTE0N1J6jQ59awu3Z0/5nv8b6d2dJswJ8mhvL2pWOPfROK+nzCTU3
	Hypa8nvnTcSnsUw4xFT+FLoPb+PpepobCwoEhC1nrZSLNKaemkav4mteKrUCGUnWAkaXn+rfbyj5N
	+Ar05O1Rn+nkz5n7+Pi3B/kTHa9/dPinuiTrLdchcQgzFpN+qNbPsoMnaYh7P7n9KQdWcs5Mt9tP+
	qKpFglGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7VQ-0000000DGxy-2DKK;
	Mon, 01 Sep 2025 16:35:44 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3rC-0000000CYyw-2aj9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:42:00 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-45b7d87b90fso27015145e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 05:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756730517; x=1757335317; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OSNn3QEar0+QuKyDmtURSQ4BVOB8JOPxQiblvR548LM=;
        b=Bemhx+w/3tEkGoT3ulqvrThkEjIbxOKLSJ+MPEWy5BC+TZL4p6BKWItpRdHh9AhU1s
         ptkGV3i+8FcPhl14ArzIxWI9PmM4dEym3F994ksvElPkjn4Vvv/fcw93a7YCnuZfeo4w
         KCL3GHIeKZsM5JAr3RuzFvJKJzixJRDCA3v1EuugqwPWb38TqchFrrmEe8UtaxW8LHD/
         7g8UN2ttjK34nl0edxl7+KTjoxs55knw+IkQLhg3mHujeIMz+pEfBuUDzH7+kdVBOhjm
         M2C/3GWN55pSjYCHTLWB4sdm21D99TT2Vut0754y0EyEevcIuu6vVx2IeTPo0xh0yj4o
         k9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756730517; x=1757335317;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OSNn3QEar0+QuKyDmtURSQ4BVOB8JOPxQiblvR548LM=;
        b=lvC+z87wMg7qE7NCFuIG7L2R7unJ2jnHJ6n87V0jT2nd0Njs9gOedfccg3ITqvBh+5
         m4SvMjej+H/qJlVzP/x+UBGoxVLZbrSvVchZy20RuCfq+rzGT2KgH7NKmf4Df5icJ0hV
         370wfUV48Vj+yXMD6tvaB64nqfhxCDmOiZDrDlfSq/I16E3CDuFpB19RBCoTDFUUza74
         zczmCbJ+NuvpxdDPBt79uNkctzERwvg6O4Q6sul4Ka8wpGak06laaaDjC1Cecevaf1fN
         dPDVn5iQCiHR2YVLRw0DG8/Cj8RKHbNaLPhsLgUhrzqrslRrv33f20+OtMUFtVMt1mEL
         C9tg==
X-Gm-Message-State: AOJu0YxzhXDIrtZESFAOICE3MfKHHtDWyRN/7PljtgBV3WCgQTcuN2DI
	95XsjRkCP5vr7J44s4O8eVBv1xhQd+D8R/2oR2LZIhd6DAnv8l457BuJfX/gp4/Abo4=
X-Gm-Gg: ASbGncsjEwAASARvrzwqomeAw1sEilSnqoYvSnXAnFn7+mGBXmoFZEaWzqrlW+wNwaG
	JuhaAFuZrIoLoviabsYkQPUFAzbr0GZOfMvUd8iCfM9MX8901zPxK7fFsckBjb2ivMQL+PxssrW
	rKn6bhxbCNFLMNScw8LdC8fq5BChqVTwGYLIKQZ2iMP+hfOtv3Wc+2FVbiqA2fh+GuwgAeeIKpa
	30A7DrJvQqkZOFPPClO9aOKrGODTLItprzk/q/HRSpK44Eao5GAainQagrsZi5aA6gfBPRLMSEF
	n3qQVr+8tGf9wY705IUvk5GTO/IV6Y9TGKlGxpkhUXzSQLxyaa9sf4KYjkFBIk4rLi8xZ7WV8YC
	nu8Yf1BB8xqdvMPYFCeV+Ht4korm6ChEO6/2FUgcHrHTiF8WoQoeA
X-Google-Smtp-Source: AGHT+IFhQWkNlLbN+/KIksY266G8T+wNBjSFtPM3Dq8DGWiTprcVcLD3OEdLOpKY4eMNn6tRYHKpVg==
X-Received: by 2002:a05:600c:810c:b0:45b:92a6:63e3 with SMTP id 5b1f17b1804b1-45b92a665f4mr3191135e9.9.1756730517057;
        Mon, 01 Sep 2025 05:41:57 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e898b99sm154946315e9.19.2025.09.01.05.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 05:41:56 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 01 Sep 2025 13:40:35 +0100
Subject: [PATCH v8 06/12] arm64/boot: Enable EL2 requirements for
 SPE_FEAT_FDS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-james-perf-feat_spe_eft-v8-6-2e2738f24559@linaro.org>
References: <20250901-james-perf-feat_spe_eft-v8-0-2e2738f24559@linaro.org>
In-Reply-To: <20250901-james-perf-feat_spe_eft-v8-0-2e2738f24559@linaro.org>
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
X-CRM114-CacheID: sfid-20250901_054158_665122_7CFF0183 
X-CRM114-Status: GOOD (  12.49  )
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
Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 Documentation/arch/arm64/booting.rst | 11 +++++++++++
 arch/arm64/include/asm/el2_setup.h   | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/Documentation/arch/arm64/booting.rst b/Documentation/arch/arm64/booting.rst
index 2f666a7c303c..e4f953839f71 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -466,6 +466,17 @@ Before jumping into the kernel, the following conditions must be met:
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
index a305386eb2e3..b37da3ee8529 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -392,6 +392,17 @@
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
+	/* disable traps of PMSDSFR to EL2. */
+	orr	x0, x0, #HDFGRTR2_EL2_nPMSDSFR_EL1
+
+.Lskip_spefds_\@:
 	msr_s   SYS_HDFGRTR2_EL2, x0
 	msr_s   SYS_HDFGWTR2_EL2, x0
 	msr_s   SYS_HFGRTR2_EL2, xzr

-- 
2.34.1


