Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8EF4D60CEC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Nov 2024 22:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=14OsMhdGfdcpS80IHQ9XNfdJp63ZxqrrUOpqJIR6RjE=; b=ZvJFvmWpWib2fP28NsUOhxPz5r
	2xDKy4hi8BHC/c/KuWX9cZHKmtqZ1Osi0yleLjLkG3fFOVwPyMkJCu/UTkdPtk5fF4qz5gVMyxRmX
	tWKujDCBeS4QkF1JTx/05/n90r/U3xtEPaXZMB7BtngMgLP9oXFk0uzV/jMgYs59FwrVE/iYBcUSN
	bj4kC1NVuUpQbFbewrRrYiXM6WEwKbJS84NtJZJeIS+Ue0LCpHaPijgRBTzTC8QrDstO0QjA9zejj
	cPCeskMucu8jp1xZm3GIxfZWDNRbMWLDGIjZ5s9yX5+NwA00s/poEAq7PYy+uV4ibPId9m+0AdlbP
	559f3Nsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDACi-0000000Al2u-0zr8;
	Mon, 18 Nov 2024 22:26:44 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDABm-0000000AkuK-1hr8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Nov 2024 22:25:47 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6eea70c89cbso7400587b3.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Nov 2024 14:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731968745; x=1732573545; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=14OsMhdGfdcpS80IHQ9XNfdJp63ZxqrrUOpqJIR6RjE=;
        b=cfHw5yOPkLupbMLxbC9iGBpcLO+dvHfOtEQb9nl9nkV5+PPehPktQV3G1oZEi8g/k2
         CtEHp9xBTOcJ0QtpGzGan5FQcUlqIU86FO8SEZUU18xqHjpehFtGy72jAPWNid2ZraxQ
         1ZqeaWNhGKpraVWyX5acFPEZxKtkoYS5yPGg7Mlj4NxjxVLsr1cUEhdyGgZgDZHSOarS
         FwInYyR5CULJvSFERAEyV58iYKztjgmueC96zshGyl7oLfLCil39LoyzVbmnEOwRYYsE
         V/pBakrom4fq4NSNa4tHwxyAlE1h+7UJf8R76oML/FOb4UZircOiEpGQxoFU+kemsUWH
         905Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731968745; x=1732573545;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=14OsMhdGfdcpS80IHQ9XNfdJp63ZxqrrUOpqJIR6RjE=;
        b=GcCbT1ryogrJw2WogvNizng8PA4sKAU4WfT0tT8z1Rjq3nq8omjZRVLOEEfcpxR53m
         86muzYwzbgUR9s2iHi5UgvBYbHB+4CVtHuWLAe6a4mC3AKiDmIJgBtteJLEkOd7TgFxv
         zYBV0TwkMIxlGY6dRLKQNomDYj+U4K8PQfa2xDgCEmgv5O3erjkWukaNScrUl8FSRKoV
         fuhWiIg5jf6kBADiVsEvl2pZl7rkbQsgJYpvVmXVTKFDbnwiD+tsdsOLRErPH/q8hCtC
         NcLNlzlR0Az22ka5tHz+dJj5Ys4aSB03Wo74L/2RoPWwkXd6dNC2o98O8FiRKqIJNXQx
         tFAw==
X-Forwarded-Encrypted: i=1; AJvYcCVqv0a302vjiWFdy7WdRTiVcXDJwonhTJMdbNbmHBZztT2LDwzgcB+CLWcnbLkogssL17VH3olWTQ7f4HBBsECk@lists.infradead.org
X-Gm-Message-State: AOJu0YxT2Ep3je6alW8zlQJd/H5u+j1txyygwZq2wQJJi6DwAT6xcEQ2
	YCzuPLbe8Qa0jZv+opPaWnfK6ok5mAxBcsXvwqq17PGRGpQgFCmWCN0750OgcpCZg3cvJtTgxrY
	2
X-Google-Smtp-Source: AGHT+IHaqSLX7qNc1UhlL7DMMonDFnZRihYI5SIMh0lBI+T2x10S5W6DAGbzQyiEudeWnrky5v96GHNZfoI=
X-Received: from yabinc-desktop.mtv.corp.google.com ([2a00:79e0:2e3f:8:bc56:3202:f6e1:c119])
 (user=yabinc job=sendgmr) by 2002:a05:690c:2e08:b0:6ee:9a08:7686 with SMTP id
 00721157ae682-6eeaa3a3e90mr127907b3.4.1731968744961; Mon, 18 Nov 2024
 14:25:44 -0800 (PST)
Date: Mon, 18 Nov 2024 14:25:40 -0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241118222540.27495-1-yabinc@google.com>
Subject: [PATCH v2] arm64: Allow CONFIG_AUTOFDO_CLANG to be selected
From: Yabin Cui <yabinc@google.com>
To: Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kees Cook <kees@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Cc: Yabin Cui <yabinc@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_142546_443984_911AF84F 
X-CRM114-Status: GOOD (  13.41  )
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

Select ARCH_SUPPORTS_AUTOFDO_CLANG to allow AUTOFDO_CLANG to be
selected.

On ARM64, ETM traces can be recorded and converted to AutoFDO profiles.
Experiments on Android show 4% improvement in cold app startup time
and 13% improvement in binder benchmarks.

Signed-off-by: Yabin Cui <yabinc@google.com>
---

Change-Logs in V2:

1. Use "For ARM platforms with ETM trace" in autofdo.rst.
2. Create an issue and a change to use extbinary format in instructions:
   https://github.com/Linaro/OpenCSD/issues/65
   https://android-review.googlesource.com/c/platform/system/extras/+/3362107

 Documentation/dev-tools/autofdo.rst | 18 +++++++++++++++++-
 arch/arm64/Kconfig                  |  1 +
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/autofdo.rst b/Documentation/dev-tools/autofdo.rst
index 1f0a451e9ccd..a890e84a2fdd 100644
--- a/Documentation/dev-tools/autofdo.rst
+++ b/Documentation/dev-tools/autofdo.rst
@@ -55,7 +55,7 @@ process consists of the following steps:
    workload to gather execution frequency data. This data is
    collected using hardware sampling, via perf. AutoFDO is most
    effective on platforms supporting advanced PMU features like
-   LBR on Intel machines.
+   LBR on Intel machines, ETM traces on ARM machines.
 
 #. AutoFDO profile generation: Perf output file is converted to
    the AutoFDO profile via offline tools.
@@ -141,6 +141,22 @@ Here is an example workflow for AutoFDO kernel:
 
       $ perf record --pfm-events RETIRED_TAKEN_BRANCH_INSTRUCTIONS:k -a -N -b -c <count> -o <perf_file> -- <loadtest>
 
+   - For ARM platforms with ETM trace:
+
+     Follow the instructions in the `Linaro OpenCSD document
+     https://github.com/Linaro/OpenCSD/blob/master/decoder/tests/auto-fdo/autofdo.md`_
+     to record ETM traces for AutoFDO::
+
+      $ perf record -e cs_etm/@tmc_etr0/k -a -o <etm_perf_file> -- <loadtest>
+      $ perf inject -i <etm_perf_file> -o <perf_file> --itrace=i500009il
+
+     For ARM platforms running Android, follow the instructions in the
+     `Android simpleperf document
+     <https://android.googlesource.com/platform/system/extras/+/main/simpleperf/doc/collect_etm_data_for_autofdo.md>`_
+     to record ETM traces for AutoFDO::
+
+      $ simpleperf record -e cs-etm:k -a -o <perf_file> -- <loadtest>
+
 4) (Optional) Download the raw perf file to the host machine.
 
 5) To generate an AutoFDO profile, two offline tools are available:
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fd9df6dcc593..c3814df5e391 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -103,6 +103,7 @@ config ARM64
 	select ARCH_SUPPORTS_PER_VMA_LOCK
 	select ARCH_SUPPORTS_HUGE_PFNMAP if TRANSPARENT_HUGEPAGE
 	select ARCH_SUPPORTS_RT
+	select ARCH_SUPPORTS_AUTOFDO_CLANG
 	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
 	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
 	select ARCH_WANT_DEFAULT_BPF_JIT
-- 
2.47.0.338.g60cca15819-goog


