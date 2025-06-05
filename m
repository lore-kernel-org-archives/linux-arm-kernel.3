Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E612FC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 11:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJT+aMqYEQmL5PQmYJEFo4Ezn3ppsHm7b3c7sVHPycc=; b=k3rsFa4LqL3l6R/QMCYU+3BOWU
	cHDULaLTHSMgqm5bRAGSgwVBaAn/Y6NDMMxiM961oUIsuR8wYtX9HKWjZ5S1/CP8cjqLP0PxwnAPB
	Kd2iL4/5JU41HGbDbBQXMVfW/fxD9q2fiazGwUY+0ixuGcVBhCE1OcCPuZsjE3VqlwmjKy1O87Xq4
	u+23pks4pScW0F6l1Xq6kzPAQQfEcwv6ST7d6DAxx5x2gkCExXwDmvE7g5UhURLz0odtQv7bt00lJ
	kCCDXNGzMUfK1r8JSFyIErT7SDuwYncgJ0kdl19LYY/w3b49+w5pEV92cYhGfXvVR4KWW3kL7j8ZX
	Nz4697QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN8Lw-0000000FKCC-1CBl;
	Thu, 05 Jun 2025 11:01:44 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN8Aj-0000000FIFr-2vs9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Jun 2025 10:50:10 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-450cf2291bbso2800495e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Jun 2025 03:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749120608; x=1749725408; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qJT+aMqYEQmL5PQmYJEFo4Ezn3ppsHm7b3c7sVHPycc=;
        b=G2Q/PJK0vitfzLPVrQfzSsmTGlDL0iEhWF9/TSTDoRE7gLyH+fA0CcXjgjSO3BhicY
         QZSDJl7eoXGnCJ/sMV/Hq6R4UehULEOIG8tRgLJL+mzP3PO5gDCXhGwf51GxeGeh3MgU
         YPijcJNLyG8A7iJvWkPW9+ahdl7OCbkvHU+/2zLYGdbzT08Q/BBo023qOizqUck0GEas
         vlD9rQy04XrdriFuK8f1R/MMUo2GUjC8Bt96WhU1eQQNOLlq/oL+H8oS56ET0harThv2
         09cgF7cgCeeeKve3gnxOMi0Ir/FMrU1y8LOdR1nmFurDSRXc4weIST6sLRw/ZjcoO3Z8
         d4hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749120608; x=1749725408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qJT+aMqYEQmL5PQmYJEFo4Ezn3ppsHm7b3c7sVHPycc=;
        b=nZSu6q98xAK7m4/d0QZq8Fppo6I6hI6jg7C6Ovf1YLB31NYfnsOXp6xZlOkGcPdXp0
         oASDruxLCd8ZYFJOiuRHkpq/wyyK18AEOCfaUuGhkTwljqIdzItgF16BjKvUzYtERTw0
         akaK4Kw3u+EYYBme/NYDYMN0d1Yf1EXmtfarZUPS9PuNdGsiL8p8TZQdgGXiK72asIKe
         d2VjZQHZ1deVvDrJXXZQU7IyG0Jdk7tFlRibMISsylEQWtHdkqaNX7zC7t7Kv2Drv3ts
         oBpL5uh0ttt0255y9BhvnPdwz6rx3jjI0NkvLbN+pg0gJMnSM3XY4JF7q+BzSgQ73SBO
         3+4g==
X-Gm-Message-State: AOJu0Ywqw8FzA1EKWpIuDTqu0E2VqxqNdI85CV4VEoSzCFZscF+4ovTj
	dR393zLgeegVv27tM5aOoQtH53oo07kTS9dn9DkFSbv0gIrI04esG7x6Gwx45cwNBqY=
X-Gm-Gg: ASbGnctHnW6vsK1xsTjpur/OS2QiRtbr2EOE4assDGLazG44s4qY2jndMtXtLSPRi+7
	Z4Yr7nnSyXdjYFJ9k3QDWeDPWc1mcXki3hBF/qp+7mVF/5DBxsE2f3M7TmU1nWo2Kci8wy6cs5R
	IYG4arX8BKDpqqzqsv3wJ2B0Tw/1fSec/utPUJcIqZmxTL1sMb/tvKqyag6XDDhkh5ApO/sGemw
	MTXfv1vvmuRa3BpcG3n3GE1mRH7sze3giVdBHRku8I3DIB/IQqA79t319LcU0wIQ6qp4GWho8cD
	DbVVmpsV6D9vbrd7PRy0aHL4ldHqipNzJtF3rEgenZjGNBZxHKUafp1hMg1P0xPqksxl0S4=
X-Google-Smtp-Source: AGHT+IEIHZpq8QHSEooXwNXyVEvqtUmnqaRzbft3GX1X+wZQal8zl6fwpJ0RAE4/3G1qpRtDL/8FwA==
X-Received: by 2002:a05:600c:310e:b0:44a:ac77:26d5 with SMTP id 5b1f17b1804b1-451f0a7c518mr63230645e9.14.1749120607969;
        Thu, 05 Jun 2025 03:50:07 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451f990cfe3sm20629965e9.23.2025.06.05.03.50.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 03:50:07 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Thu, 05 Jun 2025 11:49:02 +0100
Subject: [PATCH v3 04/10] arm64/boot: Enable EL2 requirements for
 SPE_FEAT_FDS
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250605-james-perf-feat_spe_eft-v3-4-71b0c9f98093@linaro.org>
References: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
In-Reply-To: <20250605-james-perf-feat_spe_eft-v3-0-71b0c9f98093@linaro.org>
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
 Adrian Hunter <adrian.hunter@intel.com>, leo.yan@arm.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-perf-users@vger.kernel.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_035009_786055_96BA9011 
X-CRM114-Status: GOOD (  11.97  )
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
index 1e7c7475e43f..02b4a7fc016e 100644
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


