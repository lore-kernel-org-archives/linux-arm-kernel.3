Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49195EDF154
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Feb 2026 11:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1sfEh3PBJWD07hYds4N9dI7mviBas2gIyECRd0DbjpM=; b=S1HuMCpaQcqsX0tcsl54bVBm6r
	REaMWi/qJovxa+yk+FQTRovv8nPA8am0vMK/Gc5IezlPHQmvs80C4LLMRamG5SgINlmAoZdxWqoON
	nxNcJ5OzHaLwZ/Xxxme7A+LvBmkmOiP+fGhHumqNAurtrcICiH23r0wypIHPCXCgpaxDGx01ziGyN
	ayL0lQb9Oo92nK5GP7/NRhzJ0OFhhClNO9cpHQXQxOVanJmH1qdjg5CNqUi1zBxit9w9puXYHgBba
	KvHwPdWM8Pen1zPc7UasoNgwYhBRQ5ugrRHfo+jrwPC+l3qRRnPkF+ImKi1X4M1yuIGruB1jBh6Cz
	bvYWHN5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqrhj-00000003Q2B-0EJf;
	Fri, 13 Feb 2026 11:51:23 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqrhg-00000003Q1g-2JBP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Feb 2026 11:51:21 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-65a3c6f587cso1102985a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Feb 2026 03:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770983477; x=1771588277; darn=lists.infradead.org;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1sfEh3PBJWD07hYds4N9dI7mviBas2gIyECRd0DbjpM=;
        b=b8pZoNW7medpSoaWbmjq3n/GLNmNkeEAqmi8siL92hrO3Px8WTSJkJ7WpnRkhtK69e
         oH3HksUc017wX6XSNauIOn8zNiBlws5UN+gLedMH6y3kjXGgt9013x7lOdwLXtWRv0XZ
         tGtvbLW/2zVHWFtEWQVKv8yHt9H2mxwYWr1pkAMeVcCMRHheWCfKBF7yHJvkDxm2KSEW
         o3d0ja6vwFDb+4EJhmYVc83cna9QzwNhIW7Fq04rV4mzlMCVyWDuUEdKtAayJNSUA37z
         ua/NOc0MrqPbh1v3VuwM+apxQhTNl1/z6e6JXlpNs2cMenZmiCpBLErDxNue226Qn/lj
         XHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770983477; x=1771588277;
        h=content-transfer-encoding:content-disposition:mime-version
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1sfEh3PBJWD07hYds4N9dI7mviBas2gIyECRd0DbjpM=;
        b=ej9/qEWyNScBV+Mdk0KdFQi0s6Dx+xfWsvjfF57l3BXnzX9czKUOvRNeL1BoSAuli7
         lb6dolBetSZznkEcN0wWY1gBEjO39VUt4DgEmVOn9CWe2/vvI6nMCQBa7vnS5vRspcuf
         5zxkSmXoYGwrGL/6etBYO4PtuOEJ7wZj+XKri72Ud+Yu2ShM8Zw2zZx6Wm4FIMO43ks8
         HUZZ4ECMMV8sJ+TEUJro4xO9AYFWwwMNso9GrLk24wkk2KBgL5zjRO5Q9OeYkvLkJojj
         vo5vddA8otm0XSpHFgN4ks4hfhSoVLqAlrAB1NO9+m/QhmMf8noXF414WUUO6RDMx7Ns
         GJZg==
X-Forwarded-Encrypted: i=1; AJvYcCWOxgXkruqUK5WeASD5o1kLiDe7RlLTc3CUlmvS3YTM7tVwaZkKDvjH0HCqHy8mCva2aUI/se/KOgEMzp6vRGV5@lists.infradead.org
X-Gm-Message-State: AOJu0YySv6JjYnQ3YlaLODkA5CuBU6w263o0fyVEeZXYClQdK9Z6kd+u
	nppJQQ3dqCVJ6CmbEGZkR9GRoJDMsdH+O4+szPhVpj3n2VgwNlRXAnGExIAkJo4mHA==
X-Gm-Gg: AZuq6aJY//nUPNkwgWQNYQpsTsywShO7XhhBVQ539p2qi8O4SEECIar3VxkE5qPp7GN
	Yc7jbQRn10/fM0lcU6vL5NWHC2MleomipRK0zN8ydeW9QOhB1yam+RtmC5AjmAQDnOJZKbemRAj
	4khyayrpfds7183BiDdKllLCDD1LTiDByn0nOCLaWah3u8ZP3TijgKngSXHRb4eK2R/Tz8ILpcX
	+POIpnGRHH/2wGl7447PRyhHdWQTlfCmkXF98J8/FrWLc7ja141oG0r7VOw8htvQA7FtIx7bQXp
	I4leJ5hSWLhphdaPOBVbppEHIGmTHk+1bCBnK3HbNfMIO5JtnKa9mk9Yd5lTDvDETcKYHZem/Et
	9iobd20ikqfApnBbQ/pPXIb+8HDS/OgsOh3ShKDC167APMdmQ5ognHa17uf7xr2694ogxbPJBOW
	FA9bxfFHZiXELTVhcJ3stB8BRlHRZxWx98+bI9B/Wf9M2sZVtgLycc/LHQa5YD
X-Received: by 2002:a05:6402:5252:b0:65a:39ad:d655 with SMTP id 4fb4d7f45d1cf-65bb116de4amr646620a12.20.1770983477058;
        Fri, 13 Feb 2026 03:51:17 -0800 (PST)
Received: from google.com (105.165.204.35.bc.googleusercontent.com. [35.204.165.105])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3f0d09sm585900a12.25.2026.02.13.03.51.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 03:51:15 -0800 (PST)
Date: Fri, 13 Feb 2026 12:51:07 +0100
From: =?utf-8?Q?Pierre-Cl=C3=A9ment?= Tosi <ptosi@google.com>
To: catalin.marinas@arm.com, will@kernel.org, suzuki.poulose@arm.com, 
	maz@kernel.org, corbet@lwn.net
Cc: yee.lee@mediatek.com, ascull@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH] arm64: Optionally disable EL0 MTE via command-line
Message-ID: <plslbeuzfag5dfizunxmhyw5axxbuz7r3jdlhjluzdwrm4rtzk@bm5xmxzmy6v3>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_035120_610219_1C7A1573 
X-CRM114-Status: GOOD (  17.07  )
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

Although it is currently possible to fully disable MTE on MTE-capable
CPUs (with arm64.nomte or id_aa64pfr1.mte=0) and to only use MTE in
userspace (with kasan=off), there is no way to limit the use of MTE to
the kernel because CPU capabilities are traditionally exposed directly
to userspace.

To address this, introduce a new cmdline argument (inspired by the
existing arm64.nomte) to only expose the MTE capability of the CPU to
the kernel. Combined with KASAN, this results in only the kernel using
the feature, while HWCAP2_MTE and the corresponding MSR ID_AA64PFR1_EL1
field are hidden from userspace.

Implement it as a software-only feature override, similar to nokaslr.

Signed-off-by: Pierre-Clément Tosi <ptosi@google.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 3 +++
 arch/arm64/include/asm/cpufeature.h             | 1 +
 arch/arm64/kernel/cpufeature.c                  | 8 ++++++++
 arch/arm64/kernel/pi/idreg-override.c           | 2 ++
 4 files changed, 14 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0869294363b3..4d138c1826f0 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -564,6 +564,9 @@ Kernel parameters
 	arm64.nomte	[ARM64] Unconditionally disable Memory Tagging Extension
 			support
 
+	arm64.nomte_el0	[ARM64] Unconditionally disable Memory Tagging Extension
+			support for userspace
+
 	arm64.nopauth	[ARM64] Unconditionally disable Pointer Authentication
 			support
 
diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 4de51f8d92cb..0944ff5084a2 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -18,6 +18,7 @@
 #define ARM64_SW_FEATURE_OVERRIDE_NOKASLR	0
 #define ARM64_SW_FEATURE_OVERRIDE_HVHE		4
 #define ARM64_SW_FEATURE_OVERRIDE_RODATA_OFF	8
+#define ARM64_SW_FEATURE_OVERRIDE_NOMTE_EL0	12
 
 #ifndef __ASSEMBLER__
 
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 6044d463d3fb..81ea00050e56 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -2412,6 +2412,14 @@ static void user_feature_fixup(void)
 		if (regp)
 			regp->user_mask &= ~ID_AA64PFR1_EL1_SSBS_MASK;
 	}
+
+	if (arm64_test_sw_feature_override(ARM64_SW_FEATURE_OVERRIDE_NOMTE_EL0)) {
+		struct arm64_ftr_reg *regp;
+
+		regp = get_arm64_ftr_reg(SYS_ID_AA64PFR1_EL1);
+		if (regp)
+			regp->user_mask &= ~ID_AA64PFR1_EL1_MTE_MASK;
+	}
 }
 
 static void elf_hwcap_fixup(void)
diff --git a/arch/arm64/kernel/pi/idreg-override.c b/arch/arm64/kernel/pi/idreg-override.c
index bc57b290e5e7..758141bf9e37 100644
--- a/arch/arm64/kernel/pi/idreg-override.c
+++ b/arch/arm64/kernel/pi/idreg-override.c
@@ -211,6 +211,7 @@ static const struct ftr_set_desc sw_features __prel64_initconst = {
 		FIELD("nokaslr", ARM64_SW_FEATURE_OVERRIDE_NOKASLR, NULL),
 		FIELD("hvhe", ARM64_SW_FEATURE_OVERRIDE_HVHE, hvhe_filter),
 		FIELD("rodataoff", ARM64_SW_FEATURE_OVERRIDE_RODATA_OFF, NULL),
+		FIELD("nomte_el0", ARM64_SW_FEATURE_OVERRIDE_NOMTE_EL0, NULL),
 		{}
 	},
 };
@@ -244,6 +245,7 @@ static const struct {
 	  "id_aa64isar2.gpa3=0 id_aa64isar2.apa3=0"	   },
 	{ "arm64.nomops",		"id_aa64isar2.mops=0" },
 	{ "arm64.nomte",		"id_aa64pfr1.mte=0" },
+	{ "arm64.nomte_el0",		"arm64_sw.nomte_el0=1" },
 	{ "nokaslr",			"arm64_sw.nokaslr=1" },
 	{ "rodata=off",			"arm64_sw.rodataoff=1" },
 	{ "arm64.nolva",		"id_aa64mmfr2.varange=0" },
-- 
2.53.0.273.g2a3d683680-goog


-- 
Pierre

