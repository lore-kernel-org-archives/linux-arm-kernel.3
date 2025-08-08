Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792D3C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 11:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XzFFhgGYuB4xjedzO7rx53MXxPvJ8n/ZLwqm/7UkgOI=; b=M4VB5fGbt/e0eOjmHrZ7HWYgWP
	zrNQgvyIveuhsz8FM8cFq2vMUnBDXEAx26WSI7WjSWMfM3sQyz8/5zuWWzP1i1sRB/x3jJJmgG4a0
	6fL57wBVlCJlyuFOUXiyv+PHruG8C2MEnVcow2u8GXy0AL/IqakRovFAw99mJ8b9NeJl4D/8Bbmn6
	M3OXboZVHoHxOEdBdsk+VWqL9StobZYTXyGJHaWiOfwoZCnvGfsKHpj2/vj3ZM8+eHKAnbnjDGn5u
	MO8ub5RypM8/0szu23EbCLl5tSYWEhK0gITA6+Lq+67E1EBMIix9wjIRMUpQ56JLEtlkOVtuqu64L
	sQR6ThQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLTX-00000002hST-2d9j;
	Fri, 08 Aug 2025 11:41:31 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLCU-00000002epv-0pc7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 11:23:55 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3b79bddd604so1148561f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 Aug 2025 04:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1754652233; x=1755257033; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XzFFhgGYuB4xjedzO7rx53MXxPvJ8n/ZLwqm/7UkgOI=;
        b=RQvP1ZyKOel7uV6WnsvQinx+34+CKWuQVzmMO4THKfiIS3qs1YOW0NbBQibwlILxCp
         fhetKs6eKKsutytcD/PQTbLHM5qF0o4KQHhovZhkNBxVDWMjjjjc8ruXthLg8z9Dk8Ft
         nXpkp5AM1GMeST4LP4gdZ//f9QKoKbKrgxWvDMWhg8SgYnBX+j2NoBhmGxTQ9ZAqGA1a
         nJ1zEsFOW6Xo+noFvsP+ulwL0BGbVey2gI2Kg64B3bUZS7oR43VjwOSkXoNRJk+iHIYV
         dNBCUhswTUpzIp38DbWy1Mov/F6GgjpBVlTT7I0+FfTw7rTlkZwxgjEHtXkwtdl0ZxWq
         WpaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754652233; x=1755257033;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XzFFhgGYuB4xjedzO7rx53MXxPvJ8n/ZLwqm/7UkgOI=;
        b=LkqKUR962cB9eUn+yqQWQpzbXmrM0Ho76Hk3uScxbkr70P/0HSzMiV8VNsEwisPiFg
         5WjGIc9MdN6Zz6zi7X3Goj1Abqzw7/UYIbyIAZffV1b3dYDjoMZiTYcCiH6j0u+sNaRr
         2jwg5kyeUeiI+DB/nMeGtD8Ng+VImaEZDKx6/JrLCtMUpjZFTvE6b/y6C2PO99jwkqD2
         fF/sT5j+mAQZj7X4bE+amxqhCGQP1MSMnODKGXqY1Or195WRpps4mcmBeneXshufMZw5
         ngfSjS2NSscBP+54r6pgAv4ogeFxfYefaRUSgNVC3+AVXdgWN4EzSJsPbc1yeY2b9dJI
         nPwA==
X-Gm-Message-State: AOJu0YxHy4Rw9PBrC1nIWl1KaBluMh6P3BI/pFK7XBMy3B8u/oNTWgG+
	HMHbbF6oWSz0TNUtzeCp+tMiMPVuXfFDOR5B1DH44TYF7RpoXK2KvNCKnKGb8HM+ndQ=
X-Gm-Gg: ASbGncv2YhRelqpSZYuoiMcJ50Yf8XhIMyMndMm/CoNMYBSp1HMvdnxji3w53Pwdjh0
	GnWBV1fKb2v6HREdbKEm/8PkFcsDzKZknFHHBimtdo9JuVn9nxFdmCUO1L09T0eAKCdcIwH3l/U
	l91BDZDK1Pab66HMa3kwWpSfDNr3XCDwTvA3hnpJc03rIjtxGTLoZGpMavrCVmnXSAFsc/1wvUB
	ukxjf/SVdXLtTe7SFplFOCrOGG1+A6oPb8IPqR3jgsGL27BEIs6MSScaOlELL9G/KoBVxDTMDyV
	6/8gJUHc+5UhDn5GxgSoH07jfUGcHvV5JWen0PdCZjdcIIJptMd+b5yzkkKF9qIXexjGkIK5rAF
	aIxzgdEKtqgzRMcLkd/QKeU5EPtn3VTTvjRXAZk2tJQ==
X-Google-Smtp-Source: AGHT+IFA08gaH/PE8BI7LMp8YziJ1EgstGveIjmcsXTetOJTEOPbmTHS6Iwam90twv6fI5T7D1HpPA==
X-Received: by 2002:a5d:64c3:0:b0:3b8:d337:cc33 with SMTP id ffacd0b85a97d-3b900b5026dmr2094550f8f.28.1754652232546;
        Fri, 08 Aug 2025 04:23:52 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45923c34af8sm233482635e9.24.2025.08.08.04.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 04:23:52 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Fri, 08 Aug 2025 12:23:03 +0100
Subject: [PATCH v6 06/12] arm64/boot: Enable EL2 requirements for
 SPE_FEAT_FDS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-james-perf-feat_spe_eft-v6-6-6daf498578c8@linaro.org>
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
X-CRM114-CacheID: sfid-20250808_042354_229837_997DAAA5 
X-CRM114-Status: GOOD (  11.91  )
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
index 3a4ca7f9acfb..a0361ddcdca4 100644
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
+	/* disable traps to PMSDSFR. */
+	orr	x0, x0, #HDFGRTR2_EL2_nPMSDSFR_EL1
+
+.Lskip_spefds_\@:
 	msr_s   SYS_HDFGRTR2_EL2, x0
 	msr_s   SYS_HDFGWTR2_EL2, x0
 	msr_s   SYS_HFGRTR2_EL2, xzr

-- 
2.34.1


