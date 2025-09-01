Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF70CA1007
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Sep 2025 16:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IH4IhsI7u0PxrBs1+bnHSTEJenEfrd4F7dzjVPqlBZM=; b=AM6u40kAFVHkWiv/z7pvr13600
	EkgOOmEX4WvYAmRtEK2uU/funrXORw88MpGS+T7OPLV0dnUfqFBBbLCpQ+a9X7fNT68dEh6KAPdN3
	OdFYHjEOMAf4UDtSbOLSVM5rspaIYF409E6Bq4hmUe5sonxe5ZL3Ao8UScssF3c68KMATJ0wwByUY
	Df/s/qh8AsYlKc6NYql4H+Hemn0l9E+jZVZiT7/ATyixa/i5QYAxWb6t8hf0ot7PczZZkWBufN5ca
	IEoD6bkp3LZMQig6+yHIV7j0uuzZy4SHrep/EudxspmvnGLvi7YECF6QeVXo39k5KzqbLJ6OHTvBw
	kBMlIR6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut7VP-0000000DGxK-3crB;
	Mon, 01 Sep 2025 16:35:43 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut3rB-0000000CYyB-0A9L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Sep 2025 12:41:58 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-45b4d89217aso25802785e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 01 Sep 2025 05:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756730516; x=1757335316; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IH4IhsI7u0PxrBs1+bnHSTEJenEfrd4F7dzjVPqlBZM=;
        b=jVYX6fJoJTLWZBcVST/TfY4EG2DrD5ZYJzkKnTxNBHkHShYwXYHRUxk/1KKmjAhodc
         rRoP5cXqJbGWXjD1e+0gvuHda7I2qVkor5y4H+/7E0llVWdC/1YDPOHo+NZwwaVV5QBQ
         NBHFjfrYXUz3QgFsdiu0S0cNEXMslgvxMJekW1XcOuKMQ0q+eGY0MxznupTK+YyH4Rju
         dlJL8t+qPGm6ebeh+dkAM5nNjLqpBQarkX16hEA6sw0k27crwUYxVJbqeUd1K1+IHeLG
         0mXoapb0PUI0ynuyvF8iD9FMunQiHW5HWlyBlwJEceiNc/Cnt3TzFbdkGvvLoKonqOfY
         S4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756730516; x=1757335316;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IH4IhsI7u0PxrBs1+bnHSTEJenEfrd4F7dzjVPqlBZM=;
        b=cwTccy0rjvuDsbJ9TYLwIcYJfjMGBaKdWZOPp4dP5eJ0R3vufaRaINWPqqJKmXy4GR
         w0U/UZUj4wUBVk8aUovbeVjyVjQB++C8wcVBMeVMlDx/nfbX9a1YOqJ3WycuipGMgsaW
         COaAxiv2ddGnEWb+Ugz39RFpvwN2bVGXfO8aTpozJyleCpRd/uPTzE63df/fDak5ifM4
         jLT/C/2buLkwZgOL+L7G+YzMIikPKZIiaRXHeZ6fL1uJ7lvvtXyceVrVDkW38ORAtxA5
         APC6D5nM7xEBNEuy1RwKVZBnJkBx24/YlVIrN+21rh/lxr/biTjS1+R/ZMA33UK4cW/g
         nKNQ==
X-Gm-Message-State: AOJu0Yw3JdhmD6g1t4vaC1cbR28LH1EVIUwgfM+nNPtpiBxrZk6qA8NA
	71puFbewGl7gVG2JKXyGqp1FBAcmkTCe6jfNapeufRszgZhb+4y0A9IwIFaQgtUbwsc=
X-Gm-Gg: ASbGnctrd+Z2zyPR3VxF755dnnFO2jj0viCqPSVW10do/FF+/Q7xSwU2bh8+KCSweBw
	J0l0/qNmM8elk/kldhrd6fUvENKfzRdJELV+oddCEGH6W+O7tn/xR5dNidww3Ff/h2zCr9dYA4k
	ONjtJ04dkKM7Gm3+UueIOI9sMXRSml2mX8PJP1ChaXBuLG1qfVY5hU2kLUDva5eSsPdQD+XAMC1
	2ymc7XmLmJ715TCHA4cjkkJKV7mCp17Uyk/sGVB0wiQX9dge01LlYtC4YQuRoGzc0tjCyQanzQ3
	RYM5FzcXKxOYHztLdMfW3N3pUMDuyP4OB6V6I0byGE81BGRQgYvNk3/X6skCk2Ilh7BJcDk/auI
	UMYc+ddOFy+uSFMXwnVMFxpMENjs6sykErnBaSw/ZCA==
X-Google-Smtp-Source: AGHT+IHhau7EY0MQDlSyqPT+GtgoSvzp5Mp3oC9O8x1gCNdLj74/uD4J58UjK1u3FTzG5sPU+DMpPg==
X-Received: by 2002:a05:600c:3b10:b0:45b:8f38:8d36 with SMTP id 5b1f17b1804b1-45b8f388f6bmr19047285e9.30.1756730515555;
        Mon, 01 Sep 2025 05:41:55 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b7e898b99sm154946315e9.19.2025.09.01.05.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 05:41:55 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 01 Sep 2025 13:40:34 +0100
Subject: [PATCH v8 05/12] arm64/boot: Factor out a macro to check SPE
 version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250901-james-perf-feat_spe_eft-v8-5-2e2738f24559@linaro.org>
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
X-CRM114-CacheID: sfid-20250901_054157_093825_FDC1B82B 
X-CRM114-Status: GOOD (  14.60  )
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

Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Leo Yan <leo.yan@arm.com>
Signed-off-by: James Clark <james.clark@linaro.org>
---
 arch/arm64/include/asm/el2_setup.h | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/el2_setup.h b/arch/arm64/include/asm/el2_setup.h
index 46033027510c..a305386eb2e3 100644
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@ -91,6 +91,14 @@
 	msr	cntvoff_el2, xzr		// Clear virtual offset
 .endm
 
+/* Branch to skip_label if SPE version is less than given version */
+.macro __spe_vers_imp skip_label, version, tmp
+    mrs    \tmp, id_aa64dfr0_el1
+    ubfx   \tmp, \tmp, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
+    cmp    \tmp, \version
+    b.lt   \skip_label
+.endm
+
 .macro __init_el2_debug
 	mrs	x1, id_aa64dfr0_el1
 	ubfx	x0, x1, #ID_AA64DFR0_EL1_PMUVer_SHIFT, #4
@@ -103,8 +111,7 @@
 	csel	x2, xzr, x0, eq			// all PMU counters from EL1
 
 	/* Statistical profiling */
-	ubfx	x0, x1, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
-	cbz	x0, .Lskip_spe_\@		// Skip if SPE not present
+	__spe_vers_imp .Lskip_spe_\@, ID_AA64DFR0_EL1_PMSVer_IMP, x0 // Skip if SPE not present
 
 	mrs_s	x0, SYS_PMBIDR_EL1              // If SPE available at EL2,
 	and	x0, x0, #(1 << PMBIDR_EL1_P_SHIFT)
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


