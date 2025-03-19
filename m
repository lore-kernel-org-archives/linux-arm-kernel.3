Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB11C35FF1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 05:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:References:Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XQUhpTPLVb6N2m+nc4ISL7gti6LwY0Os+AgxG8mcvpY=; b=HAGC8Umd/IyVrHGlGoe2pjIYmX
	Gwtq5ftheaICfnqSCuZUvQiGsknT9qzsk0YCFjbeel/KzkNkeX5eYGyF30fk54moV5VF147dcYcQp
	Vnx76Jb2RTnLAr5tCvcwN9k2j5MKcsXzwxnPqIDR+/qboe/6aqsuKkvxqe3lmDvViDdkZgE+KxosG
	9WQeXdhYIvY9XkXib1dj1B4Ufwmf4EknvZV5e3Fe0X4aiFA6NfZWJXl6NixrjdFoUGi76ORVMi7sd
	3e49UrR2dUBkEo2hIYEfhrplqrMAhtIQn3KxZ7C9PqMMqHsQdt1QkV96AvuEaDF5Y4rNe5ZRxE6O+
	hWmsZQJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tulje-000000081nw-0wCh;
	Wed, 19 Mar 2025 05:12:58 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuleh-000000080hp-3R0y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 05:07:52 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6f2a2ab50f6so94862307b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 22:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742360870; x=1742965670; darn=lists.infradead.org;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XQUhpTPLVb6N2m+nc4ISL7gti6LwY0Os+AgxG8mcvpY=;
        b=H9zOjDEHSRtwjh5Bzz9+hjtmSDY8fUaI6sSjDtXCWwMcqY35xCzgH8lMBMClZ3RCch
         tX8zAYhKM0JAlioSRrH0VUfdvXeBFEFfGMDpXXaHdPpqld5G+w2RidHjEPPIrO7aAoNc
         t+ikV40RZQhw9iz3of60PXoObjWwHac4LDZd9ZJHdu1m0b3Mkzyd7oue2jsA42W9RmIs
         zNLcG2dLwH7b7PeEY4UbyaJ8YOJiyhtCxJVh2HeR6D0NtobyUGnuSnyZFV6VBkezfjtI
         D/X8zRc5Asx8wIBQTqluXsNVPWQ9sj2yJYUUiVgoaUgiEztS/UfEJ4z1pUnXEqykEtmR
         mHdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742360870; x=1742965670;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XQUhpTPLVb6N2m+nc4ISL7gti6LwY0Os+AgxG8mcvpY=;
        b=oN0ROtSLm0KQTdr+Cr++cNl15Kl3dIzAeT4RaVevk6tQlBeAdM91Hf2B/WsPsKsjE3
         yIIuWpOaBNxGjlOYH1nHi7LzMD/cC2u6uF1weFNHkxLki+6wRLXI06ji7MwtQnj2MVuf
         Yb6l7z0INOyWQJxlevgvSLeDR7d6ijxV2Y4o2eK2J1CoTLmQP8vg71Jk82D2V+iuMog7
         KKsmQfCudg4+i14oTGZuMRve43pwMEZAzLKTABExY3ekMkW09N4I64lN4WjQWo8osFjZ
         2JfcqTGtXLmMdY/3lBq1aR5Ihf4L+KYoin9kA50lZiPfPXDTpRzUt4QLYYa+0O0O8hHd
         tvfg==
X-Forwarded-Encrypted: i=1; AJvYcCWFx4FBc2wpYwyBRhuFjHs+H9eHFKkKuFpLHBzDlE/FfY320dkjLAtUQ+Kqie/fwi08f2ugcWc1Wg9liP9sbUPi@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/bICeyKfktQhSxHbEA8MzESoqByJxgV9i9f2ICBvd9HBpSY7K
	pMTv4+T0MPh30xIPYtqALv6iOetoXKY8zRN19FvL+3VTD4VUlciT5zjsYW8gL+5e0sFDwuooT27
	ArSie6Q==
X-Google-Smtp-Source: AGHT+IHOW262Yn1ggfPbRXiaD4JOO6KMlLE7LTu3k1LoYE6sevtUdiYlZtBYV3AOcRBRzOEXQI22siUbHecM
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:8a11:10b5:af90:6031])
 (user=irogers job=sendgmr) by 2002:a05:690c:6912:b0:6f9:98c3:a191 with SMTP
 id 00721157ae682-7009bf44550mr5967b3.2.1742360869976; Tue, 18 Mar 2025
 22:07:49 -0700 (PDT)
Date: Tue, 18 Mar 2025 22:07:29 -0700
In-Reply-To: <20250319050741.269828-1-irogers@google.com>
Message-Id: <20250319050741.269828-3-irogers@google.com>
Mime-Version: 1.0
References: <20250319050741.269828-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.rc1.451.g8f38331e32-goog
Subject: [PATCH v7 02/14] perf dso: kernel-doc for enum dso_binary_type
From: Ian Rogers <irogers@google.com>
To: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, guoren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	"=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=" <bjorn@rivosinc.com>, Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-riscv@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>
Cc: Arnaldo Carvalho de Melo <acme@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_220751_857054_2714AE54 
X-CRM114-Status: GOOD (  14.57  )
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

There are many and non-obvious meanings to the dso_binary_type enum
values. Add kernel-doc to speed interpretting their meanings.

Acked-by: Arnaldo Carvalho de Melo <acme@redhat.com>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dso.h | 57 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/tools/perf/util/dso.h b/tools/perf/util/dso.h
index 2cc1f6593f9e..53e3b9b337e5 100644
--- a/tools/perf/util/dso.h
+++ b/tools/perf/util/dso.h
@@ -20,31 +20,88 @@ struct perf_env;
 #define DSO__NAME_KALLSYMS	"[kernel.kallsyms]"
 #define DSO__NAME_KCORE		"[kernel.kcore]"
 
+/**
+ * enum dso_binary_type - The kind of DSO generally associated with a memory
+ *                        region (struct map).
+ */
 enum dso_binary_type {
+	/** @DSO_BINARY_TYPE__KALLSYMS: Symbols from /proc/kallsyms file. */
 	DSO_BINARY_TYPE__KALLSYMS = 0,
+	/** @DSO_BINARY_TYPE__GUEST_KALLSYMS: Guest /proc/kallsyms file. */
 	DSO_BINARY_TYPE__GUEST_KALLSYMS,
+	/** @DSO_BINARY_TYPE__VMLINUX: Path to kernel /boot/vmlinux file. */
 	DSO_BINARY_TYPE__VMLINUX,
+	/** @DSO_BINARY_TYPE__GUEST_VMLINUX: Path to guest kernel /boot/vmlinux file. */
 	DSO_BINARY_TYPE__GUEST_VMLINUX,
+	/** @DSO_BINARY_TYPE__JAVA_JIT: Symbols from /tmp/perf.map file. */
 	DSO_BINARY_TYPE__JAVA_JIT,
+	/**
+	 * @DSO_BINARY_TYPE__DEBUGLINK: Debug file readable from the file path
+	 * in the .gnu_debuglink ELF section of the dso.
+	 */
 	DSO_BINARY_TYPE__DEBUGLINK,
+	/**
+	 * @DSO_BINARY_TYPE__BUILD_ID_CACHE: File named after buildid located in
+	 * the buildid cache with an elf filename.
+	 */
 	DSO_BINARY_TYPE__BUILD_ID_CACHE,
+	/**
+	 * @DSO_BINARY_TYPE__BUILD_ID_CACHE_DEBUGINFO: File named after buildid
+	 * located in the buildid cache with a debug filename.
+	 */
 	DSO_BINARY_TYPE__BUILD_ID_CACHE_DEBUGINFO,
+	/**
+	 * @DSO_BINARY_TYPE__FEDORA_DEBUGINFO: Debug file in /usr/lib/debug
+	 * with .debug suffix.
+	 */
 	DSO_BINARY_TYPE__FEDORA_DEBUGINFO,
+	/** @DSO_BINARY_TYPE__UBUNTU_DEBUGINFO: Debug file in /usr/lib/debug. */
 	DSO_BINARY_TYPE__UBUNTU_DEBUGINFO,
+	/**
+	 * @DSO_BINARY_TYPE__MIXEDUP_UBUNTU_DEBUGINFO: dso__long_name debuginfo
+	 * file in /usr/lib/debug/lib rather than the expected
+	 * /usr/lib/debug/usr/lib.
+	 */
 	DSO_BINARY_TYPE__MIXEDUP_UBUNTU_DEBUGINFO,
+	/**
+	 * @DSO_BINARY_TYPE__BUILDID_DEBUGINFO: File named after buildid located
+	 * in /usr/lib/debug/.build-id/.
+	 */
 	DSO_BINARY_TYPE__BUILDID_DEBUGINFO,
+	/**
+	 * @DSO_BINARY_TYPE__GNU_DEBUGDATA: MiniDebuginfo where a compressed
+	 * ELF file is placed in a .gnu_debugdata section.
+	 */
 	DSO_BINARY_TYPE__GNU_DEBUGDATA,
+	/** @DSO_BINARY_TYPE__SYSTEM_PATH_DSO: A regular executable/shared-object file. */
 	DSO_BINARY_TYPE__SYSTEM_PATH_DSO,
+	/** @DSO_BINARY_TYPE__GUEST_KMODULE: Guest kernel module .ko file. */
 	DSO_BINARY_TYPE__GUEST_KMODULE,
+	/** @DSO_BINARY_TYPE__GUEST_KMODULE_COMP: Guest kernel module .ko.gz file. */
 	DSO_BINARY_TYPE__GUEST_KMODULE_COMP,
+	/** @DSO_BINARY_TYPE__SYSTEM_PATH_KMODULE: Kernel module .ko file. */
 	DSO_BINARY_TYPE__SYSTEM_PATH_KMODULE,
+	/** @DSO_BINARY_TYPE__SYSTEM_PATH_KMODULE_COMP: Kernel module .ko.gz file. */
 	DSO_BINARY_TYPE__SYSTEM_PATH_KMODULE_COMP,
+	/** @DSO_BINARY_TYPE__KCORE: /proc/kcore file. */
 	DSO_BINARY_TYPE__KCORE,
+	/** @DSO_BINARY_TYPE__GUEST_KCORE: Guest /proc/kcore file. */
 	DSO_BINARY_TYPE__GUEST_KCORE,
+	/**
+	 * @DSO_BINARY_TYPE__OPENEMBEDDED_DEBUGINFO: Openembedded/Yocto -dbg
+	 * package debug info.
+	 */
 	DSO_BINARY_TYPE__OPENEMBEDDED_DEBUGINFO,
+	/** @DSO_BINARY_TYPE__BPF_PROG_INFO: jitted BPF code. */
 	DSO_BINARY_TYPE__BPF_PROG_INFO,
+	/** @DSO_BINARY_TYPE__BPF_IMAGE: jitted BPF trampoline or dispatcher code. */
 	DSO_BINARY_TYPE__BPF_IMAGE,
+	/**
+	 * @DSO_BINARY_TYPE__OOL: out of line code such as kprobe-replaced
+	 * instructions or optimized kprobes or ftrace trampolines.
+	 */
 	DSO_BINARY_TYPE__OOL,
+	/** @DSO_BINARY_TYPE__NOT_FOUND: Unknown DSO kind. */
 	DSO_BINARY_TYPE__NOT_FOUND,
 };
 
-- 
2.49.0.rc1.451.g8f38331e32-goog


