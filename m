Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D52E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 09:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uc6AkHxSAkZ2nW0ejwY9TuAU4WyUl5DsEUDPCF/WMmI=; b=IRRRihLOJZrdu6lG30R/HeM5Zx
	ahYHzl9X7LgkEx6lwCrvKBHlelHYGnlswcmIIQYqUPojc9f2Jy0GHG9ELfRUnsdzks8cqxf0InWnb
	As1hH2/ZcueoVhSRbQBIIPfrDjUvPHgMxJzgw1LCNXtrHkhkiN22pNLrhwInTfd0bvL05+ixEL4lm
	oJhOdawyeAPx6/R3a1Z5pZ1eu1dLPKtVbD3rR/hhoiuuyGx7KMDRZOieR9gnok/nCZuTbu3/zMomu
	6U4/dW8TE7PwLhXb97H2JQNqgDVyFxLvwIMmgN1Je+p4WHoL0NTw/sKrOFdyBWLlcz+sdV2GsrQlX
	kX4GoyOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqNd-0000000G6eF-2Hi2;
	Wed, 18 Dec 2024 09:30:09 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNqIF-0000000G4pH-3oz7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 09:24:37 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-7fd581c2bf4so3798126a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 01:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1734513875; x=1735118675; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uc6AkHxSAkZ2nW0ejwY9TuAU4WyUl5DsEUDPCF/WMmI=;
        b=N0UcICCKH1PaSWOJXcfag5SgbQv3gOWUXxBVCQllgQ+skjqUwdQNEwf7v+0Ta8VzGI
         Plc+Ctdo70AFRx9Sxhyl07g20KLWeeIqjPDrVuMok/l0EM1MJmXGIMGFskiwBiuu3L4M
         0imrFROiQxe97K66vDr69ayPpTQvSOEePzCf+z9M36PmdK84RVl878DwAErYidmnXamB
         xgGMvbUrNIhVGAOylrqxk7GlNb13+nudkDw5zykulS78ybaE1/M8PkNv1Xxrw+kj7Isw
         TAOf5RLSyMo1Dm7Feotg/+xCFg10UcbIM8bm+rBz7nUmBGRi8e3ui462pF+ZPLRAQNCk
         agZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734513875; x=1735118675;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uc6AkHxSAkZ2nW0ejwY9TuAU4WyUl5DsEUDPCF/WMmI=;
        b=UbaKNEupkcowKrl+nSLDQmZuEiofs6fkYdKkbIMIFljXBfwC578BzW3JO91YstI1Yq
         ZGr6Yh5m3aMH6fbu9VWJQhOl/lLwhv/l3sci7gGLg7kLbWZjOL9Jy/0ifsOsxm4kEBUm
         gogORVX/AWJbnQkMYy/gkg2ddaEpQ95eS5IVBc1a/sxeidJNI1Fz8h1qJtHuUGCA21gV
         rADONcAE5B/uMmmFBMKRfULEZL40/voZXoTPy3qCu+aOLvPnHIesftTpf5k2dqDn7pPP
         M5pKX2xNAGBwPw32WwAqBdTHnnTkNSmSoC2BJlcyhU1xpCCzmcfyg6FGl5xz7zy6Hiun
         HNTA==
X-Forwarded-Encrypted: i=1; AJvYcCWHPp7MTcsqsFvE7MVtYhjP4IO0SAopUlgDkjjEeDHQpsu25F44mpnJkSJilsv2yGlLHki0x/kU8zUYQrtR3aCc@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0OYKCCmpWJLKieI4AyJfELEZX5POPPr9fPsORgbuqJzC//eSK
	MNTkXsUCGBR4Fj7C/Jwo2tsVrU0DWb/2vBHdv6ARr76Jl5JRSgBIuBv7QGZhgKA=
X-Gm-Gg: ASbGncvaB6mhpawvLlCiSdRHLJ5V4+5JtCzMX44xx2bL1eTkAit4FTTLRp4h6SxDfmQ
	JrroLedSNUDYJ38jhNaE/Jk22CtqCJImZ8LYaZM4whiGXuVImMkzP8W3o3HumDWS4goVex507Xw
	6wwg++1EA2lQdlrP9mVb5GV9vaPwkUCz9DiyUnggLhBvbG33XO2Wx2TgAMwSgLAj58TECv8M5Lg
	DokhJ80tWpnEFlhID23//poZiecHK5i3FMPWEyQsANwnFQcpXXcWv1aKV10byYBtk2NLxwy
X-Google-Smtp-Source: AGHT+IEYfeptiNvPvwhEIFQk4qrtcNpSuwqJU4nqArf0lp9ixOHLB81Va8vS+TepDJm9AqqgSFUpaw==
X-Received: by 2002:a17:90a:1208:b0:2ee:c457:bf83 with SMTP id 98e67ed59e1d1-2f2e9303915mr2983950a91.19.1734513875015;
        Wed, 18 Dec 2024 01:24:35 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e64f90sm72119995ad.241.2024.12.18.01.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 01:24:34 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 18 Dec 2024 01:24:01 -0800
Subject: [PATCH v4 03/16] perf tools: csky: Support generic syscall headers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241218-perf_syscalltbl-v4-3-bc8caef2ca8e@rivosinc.com>
References: <20241218-perf_syscalltbl-v4-0-bc8caef2ca8e@rivosinc.com>
In-Reply-To: <20241218-perf_syscalltbl-v4-0-bc8caef2ca8e@rivosinc.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, 
 =?utf-8?q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
 Christian Brauner <brauner@kernel.org>, Guo Ren <guoren@kernel.org>, 
 John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
 Leo Yan <leo.yan@linux.dev>, Jonathan Corbet <corbet@lwn.net>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>, 
 Arnd Bergmann <arnd@arndb.de>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-security-module@vger.kernel.org, 
 bpf@vger.kernel.org, linux-csky@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2180; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=aj6KhD87JndqJTmCbrJmfbqawzLsCSF87gVbexImUU4=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ3rSlCO7U2T0SlQbfRQzLpk9SV20rivlS+UJhkt/FBjd2
 NQFbOI7SlkYxDgYZMUUWXiuNTC33tEvOypaNgFmDisTyBAGLk4BmAjPMoa/oqfu9xrJb/Deu+KZ
 TKg26/IfpVo/Nm2dM9HFdaPp1bqbDowMaz61s3dXtR1+f+Vd/FWRSaezHH99rY7xvB9xsGqTQ8w
 udgA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_012435_956698_3751B09C 
X-CRM114-Status: GOOD (  14.75  )
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

csky uses the generic syscall table, use that in perf instead of
requiring libaudit.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 tools/perf/Makefile.perf                              | 2 +-
 tools/perf/arch/csky/entry/syscalls/Kbuild            | 2 ++
 tools/perf/arch/csky/entry/syscalls/Makefile.syscalls | 3 +++
 tools/perf/arch/csky/include/syscall_table.h          | 2 ++
 4 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index f717e4628d9e4632f53fed16524a659a3e4feea5..b20daf3769771a7c23cc0f7dd46f562510bc3199 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -311,7 +311,7 @@ FEATURE_TESTS := all
 endif
 endif
 # architectures that use the generic syscall table
-generic_syscall_table_archs := riscv arc
+generic_syscall_table_archs := riscv arc csky
 ifneq ($(filter $(SRCARCH), $(generic_syscall_table_archs)),)
 include $(srctree)/tools/perf/scripts/Makefile.syscalls
 endif
diff --git a/tools/perf/arch/csky/entry/syscalls/Kbuild b/tools/perf/arch/csky/entry/syscalls/Kbuild
new file mode 100644
index 0000000000000000000000000000000000000000..11707c481a24ecf4e220e51eb1aca890fe929a13
--- /dev/null
+++ b/tools/perf/arch/csky/entry/syscalls/Kbuild
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+syscall-y += syscalls_32.h
diff --git a/tools/perf/arch/csky/entry/syscalls/Makefile.syscalls b/tools/perf/arch/csky/entry/syscalls/Makefile.syscalls
new file mode 100644
index 0000000000000000000000000000000000000000..ea2dd10d0571df464574a9c0232ada0ac1f79a3f
--- /dev/null
+++ b/tools/perf/arch/csky/entry/syscalls/Makefile.syscalls
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+
+syscall_abis_32 += csky time32 stat64 rlimit
diff --git a/tools/perf/arch/csky/include/syscall_table.h b/tools/perf/arch/csky/include/syscall_table.h
new file mode 100644
index 0000000000000000000000000000000000000000..4c942821662d95216765b176a84d5fc7974e1064
--- /dev/null
+++ b/tools/perf/arch/csky/include/syscall_table.h
@@ -0,0 +1,2 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <asm/syscalls_32.h>

-- 
2.34.1


