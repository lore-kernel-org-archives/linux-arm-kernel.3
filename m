Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4915BCE7B16
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 14:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zlW9sVY3dHmO2QQaQTwq9Tqd8agWgn9nVM7+PnbVmYo=; b=Y3j+qK+M8BuydXWJqQWWoOwaBs
	lOURirOOho2F3/GwcPWn4dAHQnb3156IjR0JLi9oaGI6AQPoeB/m4Z/0915sGheilMDovFrysorNc
	vuA/uYTmBlG+2bNBBPPYNDO2wGJ26elE/Vx50VG+xyGVK9Wj2fy40RsRwfsNIXb7tcOO/yWwjv8HF
	5ojQTgmxb9rV48QRE8btreg/j5k6b+Te/FwixAui8fSfrEkwIHromewuDVvVdrQU0VUd2w52RYkM1
	1smWb5LbYrvV59pcaEhdiKehyHh2ar4/P3BTGm5ySd4hvIdhMXcegRwKCh25BJqITrLc9jT9p9bp3
	+gAF/NFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJumj-0000000CMzS-1AyH;
	Fri, 14 Nov 2025 14:28:21 +0000
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJumd-0000000CMvG-3sZk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 14:28:17 +0000
Received: by mail-il1-x129.google.com with SMTP id e9e14a558f8ab-4330dfb6ea3so8126995ab.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 06:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763130494; x=1763735294; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zlW9sVY3dHmO2QQaQTwq9Tqd8agWgn9nVM7+PnbVmYo=;
        b=I397cYA58ZIuyUSRhQZb8VBLJZjrsfX3IzecdGDXeDM8i3EbRThVSkNIv//lZqr9+n
         Hz143xs/MjTfiDeubtuisFG/kSAkxO17eYMegdENmE8EqhYu4L5prHmNhaABJyiH+eeY
         v6vV4nU/9ye17XNlpvotCv5Kb4C2/145iHTpc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763130494; x=1763735294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zlW9sVY3dHmO2QQaQTwq9Tqd8agWgn9nVM7+PnbVmYo=;
        b=CjLqRs8AIABo5w5K/W0bRUqRn0tMLPW7JnGdS4XUF2X1JxUrAzzJKPGZRtMV2yI9pe
         zXcuhaFZ3N+9y9A2Q7R4ngXkCEZDx9IIxPBe/GN7Z7Y+srfLgQXI5pkAVMkXZP4WDj89
         1bru/m+xeTLQyaBl1fXspVHCglLIZE/ayrtv3qm9E4sWB537B9fD6tym4K4zuFUfzuux
         l+72sjgv61OUzmV5XjW8ovET3ulhvHJp6Iit9IvxIF2FkBanKyfkDOqqSTW2vzlCGI/j
         gZ5lIaaF5zTwWGN1cA0mr7EBuwwYNO+ivvhoIPB+9w5vQLYCrAtFFoUnjlQOFaLvOiU0
         mwfA==
X-Gm-Message-State: AOJu0Yz+3cMUe5crTAhDLSUfDEua04KVJmNF1z06ekjr+Eas59AgL2NM
	yx7ixGqwgtgZefIPN+ewFKkDWVrYYDv2+Do2dhArMEcKhTVCPWbixfns8iI9SJpnYAVw93naNv8
	RUSY=
X-Gm-Gg: ASbGncv/TyOdyc8lD6xAPoDta/fdNwAO8zg1FfY43SpnuVmKBlfbL6us3sEShbQIp5F
	KMwF6V8kx63R4SYIEZvuyog5Oe/226g+QWYJgB0X6rYrQ5nJ8QUPj+gMoFLCIhJ6SVN9hQ9pnL7
	ExgYZmYIErWAWqGHC7OI7Xahfy5C7G9BJUc6hTdiLqOT9JwcRDup1s8GpbWXwcncF8lN43L7M82
	vx743FWPPcpioFSleCjU4cYRoDQwdMwRKZYBumt4No7zpTr4dYUhBoSv6cLU22o17gGFpwlquiP
	c+BvkqDKTDR3EVxvgUe8M9IphrxrA6XBDyfeJJOpNH2PbBuwFbPyqMANWsXbDv40tADOeClmZ/Z
	yl+nvPbK+4riDRXP2MiQZCp2qZXjFtN3fM5aLIvm/opJIzSZAhhp/1bPj9uWtJw16PyKUcUhYnb
	jA5cvAGDHHPSw9HCw=
X-Google-Smtp-Source: AGHT+IHtlD8phUcrsxxNZnSEeRERBORiCvKi70lR0tOOd7wFG1c+yfIKHGrMPWetfRl4tu7NCPgRrw==
X-Received: by 2002:a05:6e02:1523:b0:433:713d:a288 with SMTP id e9e14a558f8ab-4348c94ad9emr53176765ab.32.1763130494081;
        Fri, 14 Nov 2025 06:28:14 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-434839cdb10sm27500205ab.32.2025.11.14.06.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:28:12 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Simon Glass <sjg@chromium.org>,
	"Reviewed-by : Nicolas Schier" <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Parth Pancholi <parth.pancholi@toradex.com>,
	Rong Xu <xur@google.com>,
	Tamir Duberstein <tamird@gmail.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Will Deacon <will@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/8] kbuild: Allow adding modules into the FIT ramdisk
Date: Fri, 14 Nov 2025 07:27:32 -0700
Message-ID: <20251114142741.1919072-7-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114142741.1919072-1-sjg@chromium.org>
References: <20251114142741.1919072-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_062815_978680_91F39446 
X-CRM114-Status: GOOD (  14.63  )
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
built automatically when using FIT_MODULES=1

Signed-off-by: Simon Glass <sjg@chromium.org>
Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Suggested-by: Reviewed-by: Nicolas Schier <nsc@kernel.org>
Acked-by: Nathan Chancellor <nathan@kernel.org>
---

Changes in v5:
- Build modules automatically if needed (fix from Nicolas Schier)

Changes in v4:
- Rename the Makefile variable from 'EXTRA' to 'MAKE_FIT_FLAGS'
- Use an empty FIT_MODULES to disable the feature, instead of '0'
- Make use of the 'modules' dependency to ensure modules are built
- Pass the list of modules to the script

 Makefile             |  1 +
 arch/arm64/Makefile  |  1 +
 scripts/Makefile.lib | 10 ++++++++--
 3 files changed, 10 insertions(+), 2 deletions(-)

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
index 1d581ba5df66..c6a3aa653035 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -398,11 +398,17 @@ MAKE_FIT := $(srctree)/scripts/make_fit.py
 # Use this to override the compression algorithm
 FIT_COMPRESSION ?= gzip
 
+# Set this to 1 to include an initrd with all the kernel modules
+FIT_MODULES ?=
+
 quiet_cmd_fit = FIT     $@
-      cmd_fit = $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
-		--name '$(UIMAGE_NAME)' \
+      cmd_fit = $(if $(FIT_MODULES), \
+		find $(objtree) -name '*.ko' > $(objtree)/.modules-list 2>/dev/null &&) \
+		$(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
+		--name '$(UIMAGE_NAME)' $(MAKE_FIT_FLAGS) \
 		$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
 		$(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
+		$(if $(FIT_MODULES),--modules @$(objtree)/.modules-list) \
 		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
 
 # XZ
-- 
2.43.0


