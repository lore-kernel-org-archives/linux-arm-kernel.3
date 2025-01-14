Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E3E8E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 19:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zjPSmGagsH0v8BRh7RqgTWU2umihKyaeHVzwlH5BliU=; b=BqAwlA42DISLR50DvohqXczIFW
	iFsZEgfqm9HPV6f8pSybYjyteqHMidz4NDz+BbckJmXn7vmbjM0x0Gk1VAy6Vbtd/NZhoE6CWqMJZ
	f52ivkpwi5PoS1s94d7pPoq/hC7d5w0V3RHLpLnziCx+Qk02Nl8ii0uMqj9f8HZGvlB9t7Mj5KTcW
	YAIFkzvkIJgG9N/P160/kkI8/lXFl2VOEilfP/BVhZnmKeaGFOoKjB5Qs4grieo2wohyNBhcBUQh8
	0IhJWVAWiCMF9aB9TGtzinx+D/qpKtFB9NnuW1Q/nyAKJ410XQflxclaygjl0LUmvtzTuZegnp2xB
	lSIVkNPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmj6-00000009Yhh-02Ae;
	Tue, 14 Jan 2025 19:37:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmhq-00000009Ycd-1hYl
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 14 Jan 2025 19:36:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=zjPSmGagsH0v8BRh7RqgTWU2umihKyaeHVzwlH5BliU=; b=qodnBvwJOlXeFl9+qRSTBpvvrQ
	JydMoMmWS55JLRzk+P6YD7PFi86laIZXZivUcFSwD7hiIZavLUyefB4+Dj0Pji0guLyr8/Yt1vCXi
	wSpQuGCrusUVD5SH/cAYrmudRrgUXUZh9EZBfcot3gCnfvs17FnA3rtSJH4CQ1U1jHGjnsk4mq5dd
	TZYTuOcaz/ALIAG7iWCib0DCYcH7w5EpH4gGOAcTW5fwUyQ8EUaEAIfxVBZ8S8q6ZFC0YUpCqPw8+
	xb2jXjzcvP+QhzdvD/lEYjwKAmMoPDEY84AcpO45ACgjJgdzMiJLfTFCVzo1x8S5K+yQS9bq7sUW7
	jjOLxrcg==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmhn-0000000AaXp-1w6x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 19:36:05 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2166651f752so132981015ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jan 2025 11:36:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736883360; x=1737488160; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zjPSmGagsH0v8BRh7RqgTWU2umihKyaeHVzwlH5BliU=;
        b=t9Sw/v/9kMOKiMaolefLRilAoVQgO0dppGWWVUN1R2Jm6u4pu2mAHZeinhfyBsJTUx
         CEIrbDDVcrBKnRPmIATby0L7wH3kIXEg0sleZiW3VOLrkrkj0YitbhLYiXpMBiPr5tBW
         NOF99/+GWElSsOgqNsrZWxCKHvjuJ1KbKZkDVOlnVjPOfYte6Dhowvoep/CRQMdwoQDF
         QiXx42H+dzMlIvLpRIV/5mYyY30zvVUL8cGKFT1aj/h5r6b9hEF2EPAL7pBDTxOEaSLO
         PYNdvWLgU6e/b/+sDoe0hThJfFpA7k+JdtIcRnKGJzzLQDWX18iQGCbs4PZt33bomLi2
         e6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736883360; x=1737488160;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zjPSmGagsH0v8BRh7RqgTWU2umihKyaeHVzwlH5BliU=;
        b=of81xTUrYFEw6Q+OpEFaxFcnp37PdIGQoEClz6jiB1kNErMz4J7tD1Qb+88TcBby4Q
         CsqMUFM8vvQdJemNTexJr6i3DO4G5mHeztE75fjfZzGgsZyXzMxgWfhahIL7S7Zf+OQF
         DKUqE2s5OgiZZutgmHGAweP13d4ogOGHGTffqTBPFEbKLf/snjHQDtQjEI8o0LwCjnI4
         9WGZtm5tB2IIh03q1OXPLKrPCe7PArew2WExipdDYYkQrzoGgLbBAuT8oqQxLTSmCmVg
         ZU6xtTj7P2TXsX4xX+KCkNLNID5LKalGya4RUEpeRbcztzmkTu1CSwiJ5DbwJAF8bwCI
         yfww==
X-Forwarded-Encrypted: i=1; AJvYcCWYjFTJQoy3w7yB1fIokmtd1v68DAFvdkUagV8/qdLgL3VVLYRNr8Vo9Cp0uCo3NB4VWdbyhy29y/M1Oh6Xtv1/@lists.infradead.org
X-Gm-Message-State: AOJu0YyShzVcBWlLUcbukRbDPIu2c/mjFZlniZrLl3tWNNBK8hCELpdB
	3EahWkYwhkvG6/hTZw2u58V49eFNsX+AlfqYq9VUIhSJQdzIg9jfAEmq2oCheeZL5v2XJYbyhrR
	E
X-Gm-Gg: ASbGncs56xXDXXzSl8CqMElLocL4eOMkybzOJ7xmfMxwDan2xvZJy/e024HWZZNnnF+
	qCUEbJlMsJS4js71Inr5N1s/IdJuWeWrNSF6BZHdFmoK2Dlu4NMZit8TIhK/5vSA1a3olSwQRl5
	KJrrGxQrqVjJPifJTIulg7b1jzRvtmGukaZ4JZrH7epfth1o+8w8DYWow/FDHohU8+CR2bUnbim
	Wlf15qyHJc1fouiaV1xJZD9kF7sWo7OScB/epZEsoFAcheDkSpX9hbefhdLw1E74lqZCeDq
X-Google-Smtp-Source: AGHT+IEgEQ10/D4X/vMFHIRsZzWMSEwp0cQc4L0bKoR1oseHYe1ipJQlzxnnAZuOmG10fkB2fgzL1g==
X-Received: by 2002:a05:6a20:c89b:b0:1e1:aef4:9cd0 with SMTP id adf61e73a8af0-1e88d139b44mr40009862637.3.1736883360270;
        Tue, 14 Jan 2025 11:36:00 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a317a07c769sm8491598a12.7.2025.01.14.11.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 11:35:58 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 14 Jan 2025 11:35:44 -0800
Subject: [PATCH FOR-NEXT] perf tools: Expose quiet/verbose variables in
 Makefile.perf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250114-perf_make_test-v1-1-decc1c517b11@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAI+8hmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDQ0MT3YLUorT43MTs1PiS1OISXaCQYYpJYoqFhbm5ElBTQVFqWmYF2MB
 oJTf/IF0/14gQpdjaWgCHfi1magAAAA==
X-Change-ID: 20250114-perf_make_test-1141d4ad8877
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Arnaldo Carvalho de Melo <acme@redhat.com>, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4609; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=O+yA0BcFooderA43nycapEcPhnF2b5ugZ03N5RSt6H4=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3rbnqnejl0F6ecsvs39q3Ts5bNnu7cvFnvp+oZNc4vm5
 V7n/u8nOkpZGMQ4GGTFFFl4rjUwt97RLzsqWjYBZg4rE8gQBi5OAZjI7Y0M/33Xrl5X5eh0cIFq
 UJt83mrJvXmVV1i51kZYiin3vmNZvZORYcvzKPOOdemOtbvtu16f1bfbHZ4exGB+qGziPcb3O/P
 imQE=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_193603_692750_1AF368EB 
X-CRM114-Status: GOOD (  13.11  )
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

The variables to make builds silent/verbose live inside
tools/build/Makefile.build. Move those variables to the top-level
Makefile.perf to be generally available.

Committer testing:

See the SYSCALL lines, now they are consistent with the other
operations in other lines:
  SYSTBL  /tmp/build/perf-tools-next/arch/x86/include/generated/asm/syscalls_32.h
  SYSTBL  /tmp/build/perf-tools-next/arch/x86/include/generated/asm/syscalls_64.h
  GEN     /tmp/build/perf-tools-next/common-cmds.h
  GEN     /tmp/build/perf-tools-next/arch/arm64/include/generated/asm/sysreg-defs.h
  PERF_VERSION = 6.13.rc2.g3d94bb6ed1d0
  GEN     perf-archive
  MKDIR   /tmp/build/perf-tools-next/jvmti/
  MKDIR   /tmp/build/perf-tools-next/jvmti/
  MKDIR   /tmp/build/perf-tools-next/jvmti/
  MKDIR   /tmp/build/perf-tools-next/jvmti/
  GEN     perf-iostat
  CC      /tmp/build/perf-tools-next/jvmti/libjvmti.o

Reported-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/build/Makefile.build                | 20 -----------------
 tools/perf/Makefile.perf                  | 37 ++++++++++++++++++++++++++++++-
 tools/perf/tests/shell/coresight/Makefile |  2 +-
 3 files changed, 37 insertions(+), 22 deletions(-)

diff --git a/tools/build/Makefile.build b/tools/build/Makefile.build
index 5fb3fb3d97e0fd114e245805809e4fc926b4343e..e710ed67a1b49d9fda11db02821bbd8d36066b44 100644
--- a/tools/build/Makefile.build
+++ b/tools/build/Makefile.build
@@ -12,26 +12,6 @@
 PHONY := __build
 __build:
 
-ifeq ($(V),1)
-  quiet =
-  Q =
-else
-  quiet=quiet_
-  Q=@
-endif
-
-# If the user is running make -s (silent mode), suppress echoing of commands
-# make-4.0 (and later) keep single letter options in the 1st word of MAKEFLAGS.
-ifeq ($(filter 3.%,$(MAKE_VERSION)),)
-short-opts := $(firstword -$(MAKEFLAGS))
-else
-short-opts := $(filter-out --%,$(MAKEFLAGS))
-endif
-
-ifneq ($(findstring s,$(short-opts)),)
-  quiet=silent_
-endif
-
 build-dir := $(srctree)/tools/build
 
 # Define $(fixdep) for dep-cmd function
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index a449d0015536442273a9268b37be34e4757f577a..55d6ce9ea52fb2a57b8632cc6d0ddc501e29cbfc 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -161,12 +161,47 @@ export VPATH
 SOURCE := $(shell ln -sf $(srctree)/tools/perf $(OUTPUT)/source)
 endif
 
+# Beautify output
+# ---------------------------------------------------------------------------
+#
+# Most of build commands in Kbuild start with "cmd_". You can optionally define
+# "quiet_cmd_*". If defined, the short log is printed. Otherwise, no log from
+# that command is printed by default.
+#
+# e.g.)
+#    quiet_cmd_depmod = DEPMOD  $(MODLIB)
+#          cmd_depmod = $(srctree)/scripts/depmod.sh $(DEPMOD) $(KERNELRELEASE)
+#
+# A simple variant is to prefix commands with $(Q) - that's useful
+# for commands that shall be hidden in non-verbose mode.
+#
+#    $(Q)$(MAKE) $(build)=scripts/basic
+#
+# To put more focus on warnings, be less verbose as default
+# Use 'make V=1' to see the full commands
+
 ifeq ($(V),1)
+  quiet =
   Q =
 else
-  Q = @
+  quiet=quiet_
+  Q=@
 endif
 
+# If the user is running make -s (silent mode), suppress echoing of commands
+# make-4.0 (and later) keep single letter options in the 1st word of MAKEFLAGS.
+ifeq ($(filter 3.%,$(MAKE_VERSION)),)
+short-opts := $(firstword -$(MAKEFLAGS))
+else
+short-opts := $(filter-out --%,$(MAKEFLAGS))
+endif
+
+ifneq ($(findstring s,$(short-opts)),)
+  quiet=silent_
+endif
+
+export quiet Q
+
 # Do not use make's built-in rules
 # (this improves performance and avoids hard-to-debug behaviour);
 MAKEFLAGS += -r
diff --git a/tools/perf/tests/shell/coresight/Makefile b/tools/perf/tests/shell/coresight/Makefile
index b070e779703e9fbd70f88c826172b2150ee3d302..fa08fd9a5991dd889583edc1afe8304e72278f64 100644
--- a/tools/perf/tests/shell/coresight/Makefile
+++ b/tools/perf/tests/shell/coresight/Makefile
@@ -24,6 +24,6 @@ CLEANDIRS = $(SUBDIRS:%=clean-%)
 
 clean: $(CLEANDIRS)
 $(CLEANDIRS):
-	$(call QUIET_CLEAN, test-$(@:clean-%=%)) $(Q)$(MAKE) -C $(@:clean-%=%) clean >/dev/null
+	$(call QUIET_CLEAN, test-$(@:clean-%=%)) $(MAKE) -C $(@:clean-%=%) clean >/dev/null
 
 .PHONY: all clean $(SUBDIRS) $(CLEANDIRS) $(INSTALLDIRS)

---
base-commit: e9cbc854d8b148e3491291fb615e94261970fb54
change-id: 20250114-perf_make_test-1141d4ad8877
-- 
- Charlie


