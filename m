Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D793C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 14:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2LJ8ZLIjDVC5fijUJQfad9+mmQw33lNnVTO/5Fbzfl0=; b=hIq63uNjWAPANNm5oP+iXMuBte
	/PJG242c+SLFAJYylH6xfE5Jlh0/Kn4Hj/ZkfhshQLhoDbZ+GJIWStczXi0LJg3NahgjYgC/JQMct
	0LfHvS2+av1cqR53mnirlGG4JdV2l82iG+dHEyV/Opalt1wcXgfYYuzx0dPrOYh58W5E1/IWk6i5s
	Wp8T6YO2NittG0lc/Tgflb6nSDFBbyyDp594lbc3V/A1re/6oDZ5qwFJsjXSmarg6/z66XaLU9lyx
	upu9KdhRPDEoEMZmIEW3lKWcZEL/mgrTtc6E5ra0OMRZROEs6/XEICpiDeXg412bNeUgoZJtAgNCC
	VZB8uSWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCJRu-0000000CM1M-2rsh;
	Tue, 06 May 2025 14:39:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCGhC-0000000BmRs-00BH
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 06 May 2025 11:42:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=2LJ8ZLIjDVC5fijUJQfad9+mmQw33lNnVTO/5Fbzfl0=; b=NoZQ1qWt6K3/3TydmNWf3GIh+E
	kmzTZlsO3rLYf3ZSq04fokYtLGXoS3zxy2EvgyNPDXu/qmd/Cnj2jr/3+As/R1Xrgg+Lq8KG3YSBD
	uzZSpTmP0iSyzmGROVeQQuValqKobgD0JY21bhfCazAF/B02w8Evw1Ro+614mGikQO3H14m6MrESL
	IlXU/ZXoyVYJlve3pn7BzZLmIrgmYfhvwwT+oLV7JwRfP7lGWBg/aS1/5mQiRaxARMSH03qRBTmXS
	z9pomRH8tPl5UF1bS0UDQaSIqeQnR5xDwmbG1WJEzxtLAojRceVk4WECaZ+WCWFh3C3bIVByHb1go
	RP7kvtDQ==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uCGh7-0000000FdP2-0ErE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 11:42:44 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-441c99459e9so17309595e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 May 2025 04:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746531758; x=1747136558; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2LJ8ZLIjDVC5fijUJQfad9+mmQw33lNnVTO/5Fbzfl0=;
        b=aeQFjQXQI3R/3junKBm8UWHKbakvpyHkSPx7mqohO9MDpJKaEMKxAKkm7n7ALA2BaB
         KR75Hgw8PnNLCa/eA57S2niIIIj2usytiMwJjWIdlOCv7GLd66P5o1k7ZfbIvZkx2oz1
         fZUkethomxjQYeLt6jLmcR+y5ME1n9OhnpnrZdarpTd7eaRjQrL/An1+V2aTVS+ym81w
         ulYkSmyHBoyqXHgTUoTNrnjfw+D69sPGBhk/+QvHZDhcKTVDZ09wPErW6GBOgqYNrjpI
         bK0HFspNnrPcpN/sr2fCTdaL/A/hoAraEN4OvDQFCjcfAL655YNAxd+//f/ud2dkXwaG
         ypQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746531758; x=1747136558;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2LJ8ZLIjDVC5fijUJQfad9+mmQw33lNnVTO/5Fbzfl0=;
        b=puglpG3Y6jah/Q9ITTn/jFmcx0cpbXNPmbcL36pcfP/Of7tSjv9+nszflfnuUZ/JTj
         835cxRCHZvqR5JYrmFZy1BQ7GTSNvlp5PXdW1G6JwZOO9prFwAn7SUODJ8Y5R7pNS7Ek
         qB8coGoMS/S5Okxt8lRcjEXtFl82DSVjxsIrqhZUS9aDTPXQn7Sjm3MBleMohvDypJbu
         LQMhpb59nCyiwsJeAIX+veIUATRahQU8SXxRgYK5+vORIiDNclc9bz+ZBr8enSvnNcZ9
         /2sEhEvLFdrhig6LrG96WhXH3sx6wAUhqM2GAIwMTf9OtVjAKemuqUEgP9wdjMJmwZ7R
         vZUQ==
X-Gm-Message-State: AOJu0YweDpli7uhR0aIDUVY5FiaeFst76zbPC4uSHrmz7Zq+dASXPUpv
	p+qXsoZYnv6J5awp4fgvAA29O2pboyF3JvfbzqhYvTIdNVI+xtIUqewrb+G3S6c=
X-Gm-Gg: ASbGncvTkHgfjegz4yqVFM3I2XBj+jv5z+qnJvLTgqhIP7jHTbHco2cTZ3Khs7c+oYK
	U5z/k4t+qGvWT4LyjZ/ca/rpQKmmcgIDmJVUJbctWs7AIZ1o4Y5Kglm4CCRUsWFovkgL3YE775+
	AlkfnA1bQfLPFU7yptW8rJj1cxDmnnc7byZna/ts8nuZjL5kzIZmd7smC4NZ1gD3FzukDqnw9ng
	XrUwYBTP4PwghM3aikDBumtRkBwjXWFslP8yhiPyCMrRvCrYH+dtykIVSmFS9QGWdynXg+EHr+Y
	YkTNHySCq2Ka56fCo2zhVXXXbsMkRfFPleDBOC9Fryuo4NY=
X-Google-Smtp-Source: AGHT+IFY2PTkM5OGqyGQ1rieutDdi16VfttDeC1GlcJYbSC4zGE/aIwEggIDkiNucqgP5hbvdPyHIA==
X-Received: by 2002:a5d:5f8b:0:b0:3a0:b133:8d4a with SMTP id ffacd0b85a97d-3a0b1338f93mr1496745f8f.5.1746531757737;
        Tue, 06 May 2025 04:42:37 -0700 (PDT)
Received: from ho-tower-lan.lan ([77.81.75.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae344esm13198473f8f.25.2025.05.06.04.42.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 04:42:37 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 06 May 2025 12:41:36 +0100
Subject: [PATCH 04/10] arm64/boot: Enable EL2 requirements for SPE_FEAT_FDS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-james-perf-feat_spe_eft-v1-4-dd480e8e4851@linaro.org>
References: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
In-Reply-To: <20250506-james-perf-feat_spe_eft-v1-0-dd480e8e4851@linaro.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Zenghui Yu <yuzenghui@huawei.com>, leo.yan@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, James Clark <james.clark@linaro.org>, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_124241_666368_D935500A 
X-CRM114-Status: GOOD (  12.07  )
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
index dee7b6de864f..8da6801da9a0 100644
--- a/Documentation/arch/arm64/booting.rst
+++ b/Documentation/arch/arm64/booting.rst
@@ -404,6 +404,17 @@ Before jumping into the kernel, the following conditions must be met:
     - HDFGWTR2_EL2.nPMICFILTR_EL0 (bit 3) must be initialised to 0b1.
     - HDFGWTR2_EL2.nPMUACR_EL1 (bit 4) must be initialised to 0b1.
 
+  For CPUs with SPE data source filtering (SPE_FEAT_FDS):
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
index ebceaae3c749..155b45092f5e 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -275,6 +275,20 @@
 	orr	x0, x0, #HDFGRTR2_EL2_nPMICFILTR_EL0
 	orr	x0, x0, #HDFGRTR2_EL2_nPMUACR_EL1
 .Lskip_pmuv3p9_\@:
+	mrs	x1, id_aa64dfr0_el1
+	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
+	/* If SPE is implemented, we can read PMSIDR and */
+	cmp	x1, #ID_AA64DFR0_EL1_PMSVer_IMP
+	b.lt	.Lskip_spefds_\@
+
+	mrs_s	x1, SYS_PMSIDR_EL1
+	and	x1, x1, PMSIDR_EL1_FDS_SHIFT
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


