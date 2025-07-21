Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FCADC83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 15:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJFteMx4M8CuvuwGOOEAn5xVwGW4RJ+pfzFY5hwg8co=; b=hJ21FpA9hLb0NLYbS1VWoPmNuC
	doBT8K0fyW/uXfKKWmLa2mlV0YZZKluPS5mm6ksJUUD6L53JGcfdZfMv6QD9NaYJI4Y9THM6Jv+8m
	2Ib8g55T9dF2Dqximyzfx9jI6+lMy4w/ZFYHlKSxBPazJjdzt9YjLO+A2V1z0CwcZoZXgVSStYye1
	Z80Ss1PS4V/cC7xqVPx+VajAgHfn8frT1HJ0gbczGRywNHvxL9n20I2NCL+ic0sBt7U9UBmmKVyTO
	iTEA59mbgpGHoo0cim1BnvZehiU+n8LiOolCnQhWhRRn5WMRpDT88TlRr7jsY6P04TmDaS14xq/FK
	BBKdWfEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uds5O-000000002PQ-3qpP;
	Mon, 21 Jul 2025 15:05:51 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udq25-0000000HIec-2kXa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 12:54:18 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-45600581226so44955775e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 05:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753102456; x=1753707256; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jJFteMx4M8CuvuwGOOEAn5xVwGW4RJ+pfzFY5hwg8co=;
        b=wqK46OZoX6TXGOpErml3tksumyJ05M3RyQSjuzItDOgAXCWUo4W4u4pb4wKcvFj2ng
         MDRXUYuFq45gMaHTXhjzCTev+5u6zUHiJoxCfAaEvmkWxqpGgf+zLcRGo+HQBOjsUytN
         IMuFZOcvkb/DxMTlUWWPm54G+bAKVpUafMm4+NhQgj3qYaux+dGhBndlqr3+LL4SoQem
         b7aQmJbtm9sNSnMY6OSjY8+l+pR019vK4dROMYKfw026dIox9faW7gt1rqwQXp08qn2I
         x+FWtrpNqevUmWKX13dIyOYtRj5romZzT4JzOU952IHXO53fmsM+7M0a2pupwWI1gS8D
         BxKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753102456; x=1753707256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jJFteMx4M8CuvuwGOOEAn5xVwGW4RJ+pfzFY5hwg8co=;
        b=pxDupLFekGNogMN8qYzYTZ+Lpq29lu6HZtdWcPXbDcbfo+RIM5mzQRF4InafXdFfsJ
         exCEYB8l4vggHgktXPr1jxzm9cw9NsYcqJs+Q1Aaxz6VWEqJA9wUV8NeZzHDv+LMokjX
         QbyhhairhCQXcISUK793a+DU+U1YGWlGM1zitDLOQ27Jrla/xosG9ZBGqLDmiGunI6wj
         H72Y7t+9P9Xz3vPtfHc8jcxoWNrSykA8gi97enfBK2fa5s0qKu8hy4S8nRsntPoOocam
         VOfHLFlZenzCzeSYjRIh93Xfwv7EeBjcuUz+1HA/aSQNsbkSRNIZlxGbrsq1PrzKK2ab
         6eqw==
X-Gm-Message-State: AOJu0Yz2HXwtOSuuA9lrtaNwj+g/AivKaJtag3mXwHXczYntZnHBypWr
	qjn+4VCDJvCjZ1DU/V7XTb8USxHDu3YYKPALQraKGVkFQLSlYhe0mTUjVlvIlUiqNpI=
X-Gm-Gg: ASbGncsyBdz9qmP8OAHBV5yVQf9gChMssQ37//H3ysBnUsbKhvA+i93k35olDtqji1A
	EpQyBAFRyaquWgmY/LMjieds8QHX7hiDZkS3qNo7Fio2UKw4OymwL/HCRbS+nqRO6yLL8N4KP4m
	8Iiw5Kkt9kZomzhzZ2UVsGOjNGXhaaQj2rRY3uJZ6fa8OFfx1rxp/U2johD+DhHFa2uKQmgbFDC
	pNFYqI1nxvV1EwBiusZmUZa2ssxZszVS+LNFmWkeVYNwNI6ZKOAhMHRxdX1QM0SogVG+GPlbfGZ
	+P/0MKGQRxz4tLjylMmw8lVT4y++tfv45bw+Bv2PfDvyoRu7GP8xLQKnDxMlFUi78PJWtbrDQiu
	wHfdmKji/jKncJzrkM9oMtvzxrNBHL7k=
X-Google-Smtp-Source: AGHT+IGmbQWssAINXf1JMCsxu7iT/5v/bYbxuFsBy9x2nb4iGuog7PTzyHokdJFF6f22G9q2Sa/2qg==
X-Received: by 2002:a05:600c:4f91:b0:456:25e7:bed with SMTP id 5b1f17b1804b1-4562e23b6a5mr208680525e9.14.1753102456271;
        Mon, 21 Jul 2025 05:54:16 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.76.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4563b75de26sm98995225e9.33.2025.07.21.05.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 05:54:15 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Mon, 21 Jul 2025 13:53:36 +0100
Subject: [PATCH v4 05/12] arm64/boot: Factor out a macro to check SPE
 version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-james-perf-feat_spe_eft-v4-5-0a527410f8fd@linaro.org>
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
 kvmarm@lists.linux.dev, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_055417_709073_0E37AD2C 
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
index 9f38340d24c2..2bb0d28952e4 100644
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
@@ -189,6 +188,14 @@
 .Lskip_set_cptr_\@:
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
@@ -196,10 +203,8 @@
 	cbz	x1, .Lskip_fgt_\@
 
 	mov	x0, xzr
-	mrs	x1, id_aa64dfr0_el1
-	ubfx	x1, x1, #ID_AA64DFR0_EL1_PMSVer_SHIFT, #4
-	cmp	x1, #3
-	b.lt	.Lskip_spe_fgt_\@
+	/* If SPEv1p2 is implemented, */
+	__spe_vers_imp .Lskip_spe_fgt_\@, #ID_AA64DFR0_EL1_PMSVer_V1P2, x1
 	/* Disable PMSNEVFR_EL1 read and write traps */
 	orr	x0, x0, #(1 << 62)
 

-- 
2.34.1


