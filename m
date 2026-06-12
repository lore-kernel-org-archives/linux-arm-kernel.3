Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FA8CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 13:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iHq2uwDGJgB0qiB9weh1rH/HnAsP1NxbR0PVnQr+Mc8=; b=Dto8/tTGkhe4Ce5YUM2w2NhXyz
	hWbMOcUtze3O2HdN2AxviWfpuGka8rbf5agXObUvMC1jE8dEiwV4Mg/Q4YQD5NtyluWdJ02j6gbG3
	mxvZTqcRl9UXqvj1OYyJlbRebM6m9tqV3lTdgp5+ELlSrdjNvTnRvzgYcsb0F3FI01HyUKI7Fl+XJ
	Yz5+s7dDLiIO7HKMYAQzjsVqDRNLuqLFgHoVZIIYtkCX0CHWal6SqdWF6Q8wJSNnabmRVxFI1Jzb8
	kcXLLDOUE9Qk16UteLSva31nFosLq6NafG0hEDGVcsGK5U9OlQmFVPOA5+Dm/FnJKv6PJI5hxwHG8
	qD682hzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1zD-0000000AzGp-0VUc;
	Fri, 12 Jun 2026 13:31:51 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY1zA-0000000AzGU-3Hm5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 13:31:49 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-460166910e6so556867f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 06:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781271106; x=1781875906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iHq2uwDGJgB0qiB9weh1rH/HnAsP1NxbR0PVnQr+Mc8=;
        b=YadyKzopKn6njUdyfKT/nD+NU/StlNQuFKhuKGugjIRI0btmwQajlM7IJjhfFup5tN
         SKcDaquJ/N23jvs6S/uVXRom3lay3NCAtFwOtWz0O+N9tm0NU/prdPStIJeXkPksOxfj
         s3Y5b4djseaZgNenQfbTsJuOkLrmHp6br+iSmMBc5JoTRRZf670Wktsaw/KygUc8ZjYu
         wdcml88uAnekGHadX6HQ1sP4+NQg3LmcIRb6NWuz+Zc5y2G+R+Q19LVGDi0cTkwo/Mst
         awgUYZh/n1r+XWd4ivZ9YsRgmbCiIKlXDkb3pPy2nx2Ilw3TdxCzpJFG/twvttqDIn4v
         avMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781271106; x=1781875906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iHq2uwDGJgB0qiB9weh1rH/HnAsP1NxbR0PVnQr+Mc8=;
        b=HUwnsEJMvomRXC97yve3t3zUNOAJn21VJAuafwrQXMmB3bls/aX9Ju0XWHSozl87/h
         josugP7H6nWliB5GZYzuVWcyrj+Kcib/2wHGSX7W41xG7ZU97Lk4zLTHQgYvnKl8nzA5
         9S+XVMGT1pBTjuvc+KWb1LdxvCEfuis0geWvOdaxUhW59JFjwsXkX9WCMhm2pKAsCTwE
         2dVMTrm5KKYSOCZ+X8uP7QXFUScPKP9m5ECa5shRwgQOMkQvbrDzuBdqIsIHyybJo+EE
         sfMZ5LCbLDXzG0fNkiv+FkOzcx5ArQgksNQndK4+Ctrc8DYNemoc0rrH9PO9v4k9NeJ5
         ZQlQ==
X-Forwarded-Encrypted: i=1; AFNElJ+blyxDR3IYAg2YMrDlfYmyLLp7JjSDIQr3b97x4/SudjER2h9oPEX3WNuzeYwOL2/s/5Xl5mUJ1QrC63N+cu4R@lists.infradead.org
X-Gm-Message-State: AOJu0YzyeThP/zfZf1q/9UvViOH3G7ia4TnS+5WphtMVi+HCyyMZohWp
	J+yvApbJMDa7wERMxu82oZj0ijlSAn4OuewIrghROmYGoPi2DzvY8uvNFLLjDqVHuAI=
X-Gm-Gg: Acq92OFdZzmd2Yi7AVx9DJQWNwYk2d2iVXzrKlpb9VV2fBrwHdzJkHc5XbjGEmmFZD0
	m+teY7RAAhPTwl4BGI0aCGpzjyQS8xN92R8u00tf3NLj3XQ+AHseaVFy4AQ7KxUzdu8Mh7rLCG6
	a9xEFdpHmgc53SGFaWiyTBgO4X/vquu59lq4E8cTw3kdycATJot3XOKCD1YuwE2e1m7iCGH5vRF
	Sf24WMQtT0TE89yI48i5/dVcXhSZ756zCxwWpC/VGk+nysrmHEM68C0OHEXar1MNOVQOgFormIs
	smoNz5u2xYLRMMGN0b1rt2zLlNQpq3RQwnV5zZOKLlB4zFrC4gxPOPZcR6qkWmP7J1rSQE10CFz
	hYjuZqjmIKHEG8zrBY6IcXhA7SfTHNyzxDKRsmcpWhH91cev+GEVsw8sQW3O5dK3SlcJ4gDnSQP
	/tj42fQ+BmR87l93eoiTQxFsRftTRCFKld
X-Received: by 2002:a05:600c:c1d7:20b0:490:6237:521d with SMTP id 5b1f17b1804b1-490ec4b186cmr28517655e9.13.1781271105722;
        Fri, 12 Jun 2026 06:31:45 -0700 (PDT)
Received: from zovi (109-81-1-107.rct.o2.cz. [109.81.1.107])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26434dsm6222674f8f.1.2026.06.12.06.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 06:31:45 -0700 (PDT)
From: Petr Pavlu <petr.pavlu@suse.com>
To: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Peter Collingbourne <pcc@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: Use --force-group-allocation when linking modules
Date: Fri, 12 Jun 2026 15:31:37 +0200
Message-ID: <20260612133139.1919042-1-petr.pavlu@suse.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_063148_835839_B969AD02 
X-CRM114-Status: GOOD (  12.69  )
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

Specific code, such as outlined KASAN checks, may be placed in
COMDAT-deduplicated sections. When linking modules as relocatable files,
the linker by default preserves such groups, potentially leaving multiple
copies in the resulting modules and unnecessary group metadata.

Use --force-group-allocation to have the linker resolve the COMDAT groups
and place their members as regular sections. The option is available from
ld.bfd 2.29 and ld.lld 19.1.0.

Remove the workaround in arch/arm64/include/asm/module.lds.h that was added
for the same problem but limited to CONFIG_KASAN_SW_TAGS and .text.hot.
Note that this code currently has no effect anyway because all .text.hot
sections are placed in the .text output section by scripts/module.lds.S,
since commit 1ba9f8979426 ("vmlinux.lds: Unify TEXT_MAIN, DATA_MAIN, and
related macros").

Signed-off-by: Petr Pavlu <petr.pavlu@suse.com>
---
 Makefile                            |  6 ++++++
 arch/arm64/include/asm/module.lds.h | 13 -------------
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/Makefile b/Makefile
index e156e2696efe..1729af0690b3 100644
--- a/Makefile
+++ b/Makefile
@@ -1189,6 +1189,12 @@ KBUILD_RUSTFLAGS += $(KRUSTFLAGS)
 KBUILD_LDFLAGS_MODULE += --build-id=sha1
 LDFLAGS_vmlinux += --build-id=sha1
 
+# Specific code, such as outlined KASAN checks, may be placed in
+# COMDAT-deduplicated sections. Use --force-group-allocation to resolve these
+# groups when linking modules. The option is available from ld.bfd 2.29 and
+# ld.lld 19.1.0.
+KBUILD_LDFLAGS_MODULE += $(call ld-option,--force-group-allocation)
+
 KBUILD_LDFLAGS	+= -z noexecstack
 ifeq ($(CONFIG_LD_IS_BFD),y)
 KBUILD_LDFLAGS	+= $(call ld-option,--no-warn-rwx-segments)
diff --git a/arch/arm64/include/asm/module.lds.h b/arch/arm64/include/asm/module.lds.h
index fb944b46846d..792a0820757a 100644
--- a/arch/arm64/include/asm/module.lds.h
+++ b/arch/arm64/include/asm/module.lds.h
@@ -4,19 +4,6 @@ SECTIONS {
 	.text.ftrace_trampoline 0 : { BYTE(0) }
 	.init.text.ftrace_trampoline 0 : { BYTE(0) }
 
-#ifdef CONFIG_KASAN_SW_TAGS
-	/*
-	 * Outlined checks go into comdat-deduplicated sections named .text.hot.
-	 * Because they are in comdats they are not combined by the linker and
-	 * we otherwise end up with multiple sections with the same .text.hot
-	 * name in the .ko file. The kernel module loader warns if it sees
-	 * multiple sections with the same name so we use this sections
-	 * directive to force them into a single section and silence the
-	 * warning.
-	 */
-	.text.hot : { *(.text.hot) }
-#endif
-
 #ifdef CONFIG_UNWIND_TABLES
 	/*
 	 * Currently, we only use unwind info at module load time, so we can

base-commit: 4549871118cf616eecdd2d939f78e3b9e1dddc48
-- 
2.54.0


