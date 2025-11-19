Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3DD0CF58C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 18:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4cU75xuJ/5xIhcW50wA4hHS4Fk7gDNqRb9uRUlMbq3I=; b=u08JgDi2US1S8PiGuiId5ntquX
	q6KFNMTaqEyDlO06GSnugHa+U8j+hFOKx/+qDERA/jzWqBnPGPjCnEu0J6Vh85aiZFCoQ2cjftAL3
	pQEHvO53djZHp/LGXksKhCvtA6t0DC6fS7/dMRI7oeEy96/nItkRfRAQEfyn9hn6sAJUdFetpmior
	AvaCNDH2yf+yk5IK2t+AKLDv6O0G+et3ehlYYZcI6vFgT8vGX0EjP3TBMG3MxkDGZ0j2EdJ0cIAG6
	MIKYb0tVA6n85eQlXasPyKmRuA2aOJda3c3KYer5qsodjZbMbvt3aK8E3Z4yvnDSECMR0eg0cQF7A
	E36LaA8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmhF-00000004TrO-3vx1;
	Wed, 19 Nov 2025 18:14:25 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLmh9-00000004Tj3-1yT5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 18:14:21 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-948c58fe8c2so64339f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 10:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763576057; x=1764180857; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cU75xuJ/5xIhcW50wA4hHS4Fk7gDNqRb9uRUlMbq3I=;
        b=EsRpZ4WFA86sFabPwBmpQ/xxvVl1/PLC1bQypo5fWv70vLGnJc9Ub2aWoaLsFBOS/L
         msXTggCfew2qhvz84BPJ9ec5zL/uu0zhORa80qz4h6HbSsug5fz70aLGTYHhKdvkcugG
         PiULczSzwoaAFfmnhW2Nn0zfdDEtxM5CZk9rQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763576057; x=1764180857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4cU75xuJ/5xIhcW50wA4hHS4Fk7gDNqRb9uRUlMbq3I=;
        b=Gbh6RV/sQwQGx0d3zJsaG1BMG6XrPwKfCzEfj4BclCIwkyJwypTvqpg46KgcSdJkZG
         5ey+HtvxKU5Tb/nRx1rWZIVd0vUFYjvfrUg9JUHBwSaSawjZuV9dT7+nIlF/PzT20JXC
         JXpJVNUZ4l/mYABIvUAX/VFX90BCPe6lehkSTtDlaN5ifO49fQKEi5bHtENVGhfcoags
         RHKKCay07aKW0dhz7fDCmPL90Kw6416A88H4sCze6AAUWYyRf/3UqJ2R0ybye4nLyKUY
         w1hgiiuCi7cenhpA1BkHzsXJuk2JnF71fbuK0JGTaGlao1y/Icn0QU2WM9xmIDnhQz/R
         Co6Q==
X-Gm-Message-State: AOJu0Yywse+kZd8pfWFbtxEGKJocECWihOLVszEqn6Rbpx3jqlYGiMgW
	I7MKMrGD8TsD7rZ9s7ydVTXK5S7lHhEKF7nDt65FwIm/xZyROK50agyxHLzJIzvnTnkoaZkxzuS
	VM38=
X-Gm-Gg: ASbGncuAGIieHk/jWu26Se7LXH64Sgk/+d+TzMl936mSDPTOD3fKR6xecE7uRXmGeNv
	7GyKGcfwlKPPcgN6QDuEGbctZSExfssWnaHow+9DwN2VYAZf4stXbZz/1TZouqSZZZn43IhDtzo
	qKsTLL3oRmedsGXTYagom3eBPJLNQqrbPT+uziCtXL2mqFd+rHXj/BLjFZ/R5WijQcHocsUDHXK
	tofA27TZ3my4hyZ+ByIgRfJei8nj1POQiaJNzpHPcJETpIVoOm7c7nfdUQwYBW+WgN/JDfVexVg
	RkfLQfZTV7/EICadIZNnk+nIH7mIGgbvTU5Ilxc5p5Ggdk+FNNYAqULhRKYytTWduBRxLPSelXC
	jQZt+o79YzcOPqcNXCGPb0+3nDv2e1DYQ9RSyNLZggVwqCCpZpAc8f+Ovyk8haRUOOHbbxKx7mR
	1w/mdY
X-Google-Smtp-Source: AGHT+IEIAcWoFGwcNgccxAP828+yd7/kMEFFY+sH8+j/iQjjBsmYniUh67wbp4Ar9H6A3QqKNZyn4Q==
X-Received: by 2002:a05:6602:1607:b0:948:e11f:5b4c with SMTP id ca18e2360f4ac-9492b6ed063mr334288439f.19.1763576057415;
        Wed, 19 Nov 2025 10:14:17 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-949385ae254sm4838639f.1.2025.11.19.10.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 10:14:16 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Simon Glass <sjg@chromium.org>,
	"Reviewed-by : Nicolas Schier" <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Rong Xu <xur@google.com>,
	Tamir Duberstein <tamird@gmail.com>,
	Will Deacon <will@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 6/8] kbuild: Allow adding modules into the FIT ramdisk
Date: Wed, 19 Nov 2025 11:13:27 -0700
Message-ID: <20251119181333.991099-7-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119181333.991099-1-sjg@chromium.org>
References: <20251119181333.991099-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_101419_545569_6F107F1A 
X-CRM114-Status: GOOD (  15.88  )
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

Support 'make image.fit FIT_MODULES=1' to put all the modules into a
ramdisk image within the FIT.

Add image.fit as a target which requires modules, so that modules will
built automatically when using FIT_MODULES is not empty.

Signed-off-by: Simon Glass <sjg@chromium.org>
Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Suggested-by: Reviewed-by: Nicolas Schier <nsc@kernel.org>
Acked-by: Nathan Chancellor <nathan@kernel.org>
---

Changes in v6:
- Mention that FIT_MODULES just needs to be non-empty
- Make use of modules.order instead of using 'find'

Changes in v5:
- Build modules automatically if needed (fix from Nicolas Schier)

Changes in v4:
- Rename the Makefile variable from 'EXTRA' to 'MAKE_FIT_FLAGS'
- Use an empty FIT_MODULES to disable the feature, instead of '0'
- Make use of the 'modules' dependency to ensure modules are built
- Pass the list of modules to the script

 Makefile             | 1 +
 arch/arm64/Makefile  | 1 +
 scripts/Makefile.lib | 6 +++++-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 8cd46222fc48..4eccaef95826 100644
--- a/Makefile
+++ b/Makefile
@@ -773,6 +773,7 @@ endif
 # Just "make" or "make all" shall build modules as well
 
 modules-targets := all
+modules-targets += $(if $(FIT_MODULES),image.fit)
 modules-targets += modules
 modules-targets += nsdeps
 modules-targets += compile_commands.json
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 73a10f65ce8b..7036f251ab40 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -174,6 +174,7 @@ endif
 all:	$(notdir $(KBUILD_IMAGE))
 
 image.fit: dtbs
+image.fit: $(if $(FIT_MODULES),modules)
 
 vmlinuz.efi image.fit: Image
 $(BOOT_TARGETS): vmlinux
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 1d581ba5df66..28e0cc0865b1 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -398,11 +398,15 @@ MAKE_FIT := $(srctree)/scripts/make_fit.py
 # Use this to override the compression algorithm
 FIT_COMPRESSION ?= gzip
 
+# Set this to non-empty to include an initrd with all the kernel modules
+FIT_MODULES ?=
+
 quiet_cmd_fit = FIT     $@
       cmd_fit = $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
-		--name '$(UIMAGE_NAME)' \
+		--name '$(UIMAGE_NAME)' $(MAKE_FIT_FLAGS) \
 		$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
 		$(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
+		$(if $(FIT_MODULES),--modules @$(objtree)/modules.order) \
 		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
 
 # XZ
-- 
2.43.0


