Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C98C5DF9D
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Aug 2026 13:54:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NcGHYE7YHIQuleStFkafOmsPgUJAwjDqEsHvPsytY4A=; b=J8kMipPDI7nKkA0riN8CIbDV5m
	yUxtiH7gcN4H7amOSncTRnWgux/LahEK5VXYsFrV1vvI1IiSWTkmE2mnbXWDfUFI+63JSNqx4B6Hg
	y/mScD7vXuJZ6xxypCPYUt/Xdndv5TKYsXneabbOZcSPcuFloownhLxSwz7TRByyhrMK6RHrT7RAC
	fv1nfz/yKC+jGhz70znDeVT8Ud5q59ZFh5qB4SqDt0V7gPASVS6LSbo83ROVGsKzuAQOrHWQkSSDX
	86wOda4g8ZX38CtYXbuLryhm0SLNDiMhE+xLVRpanSoAnTzLZdykJSL9GJwrL3mZOPSQh6oW2WblD
	7uG5lEzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxmB0-0000000EYmu-2ftx;
	Sat, 22 Aug 2026 13:54:26 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxmAn-0000000EYbS-06gI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Aug 2026 13:54:14 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4955843c6cdso15912155e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Aug 2026 06:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787406850; x=1788011650; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NcGHYE7YHIQuleStFkafOmsPgUJAwjDqEsHvPsytY4A=;
        b=kY7L0g1E71qIFhFb78f9Nrt9O06XGoHkvZGyNtypoOh/10JnXthNFR3OSD7fKB5WR0
         d+BBy1G5/yWT/3yAdvWm+oHxD/OEhvwezkUYUk7T4s/TOSSbT1xJkF7X6pvj/uSCN2eg
         /+2whcy30+VJdndPH8pY9nfeSwnGrNCJ0TB5OWxmRju92S1BvwmhpD/loovOCR0/wjiF
         m9QMr5/Mjyd0nR8r4+oPzJ6kpHVZPEf+Vbn4Kz+Yix7EiWrcUkmIccoYVQYTm0LJBCAo
         VK8Bi1YrdpLN2CMP0UiY1IK3SvakoWouRN9SD0rAJUmUVvWk5bWRHgLAVshx9b8UCiG0
         fPZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787406850; x=1788011650;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NcGHYE7YHIQuleStFkafOmsPgUJAwjDqEsHvPsytY4A=;
        b=j2qLu0mEUpl6nOAh/E5ZjzqGMqoZLKeqgNmf125mZoCCD7VJI/fyzrYiTLFeI++9HQ
         qrtEFT9DFWRXm5l73C+8KUPej3VtN1wBZuQ3q0rXy9IdoUzVWPdZnTbgcLoX3q6RgQtb
         Y/U5dlCwqOy2METEfQ9qcFUZqn/fQJzFyafrglDiTC3qTq81ldAlQ+WjrTkGeyJR7ayo
         Rsk2/tBWMqHwV7ncFaf8w1NEqUms7HpQcDPPVgV4HmXrKuFIQFn0itumMKHvA/F7/LV+
         5VwoWIW88Fi3FbSWLJfIBOuxjrxS2r1681ISpaSindbYip8bLOFHC+nPjPbPYsvUoqs+
         zGpQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr1czS0AJDm+KYPkihObYEC3+b4gATpPP+C3mtjqV1+r6PU4Q7A6dA3A7z7Xhcr3uGY5DtkqpqqkatqTzuB+RdE@lists.infradead.org
X-Gm-Message-State: AFuF++lYekUlAMyTrj+6ZP7SW5GlXRS1+Zl7NKYp6Ti5e3kH+yZ2OVf6
	6oePtO8PyHLkktPSykyQ17R5sQSqqmq5QcPTc9RY25BzD3B4yyZbcDF73umSYU3bV/o/Ey9SMQ=
	=
X-Received: from wmbeq6.prod.google.com ([2002:a05:600c:8486:b0:496:c04d:501e])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:8b77:b0:499:48bb:417e
 with SMTP id 5b1f17b1804b1-499b82f4163mr187121695e9.2.1787406850393; Sat, 22
 Aug 2026 06:54:10 -0700 (PDT)
Date: Sat, 22 Aug 2026 15:53:28 +0200
In-Reply-To: <20260822135323.795946-11-ardb+git@google.com>
Mime-Version: 1.0
References: <20260822135323.795946-11-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2053; i=ardb@kernel.org;
 h=from:subject; bh=ZgfBeS04NmMym7tXXunDIhp6k1y9y951qTGwH0jNq+o=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIatz5R0+ffGnRqHZvHKiZ171Tuq2SUp6rLQk556gl5X1W
 i/DWes6SlkYxLgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwERETjH8M/j158SWE9PaK6yK
 v2ytKl+pf26qsfCdLZf/86WJtv8K2sjwP73gZ/33YNcPt9OyeQsCeNaV807jMt4k6LzywRmh2Rv W8gAA
X-Mailer: git-send-email 2.55.0.860.g4b6b3295ed-goog
Message-ID: <20260822135323.795946-17-ardb+git@google.com>
Subject: [RFC PATCH 6/9] arm64: Enable the execmem ROX cache for module text
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260822_065413_115898_B3B9D3BD 
X-CRM114-Status: GOOD (  14.49  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Wire up the existing support for the execmem ROX cache on arm64, so that
it will be used for module .text and .init.text regions. This will be
relied upon by a subsequent patch in order to allocate those regions
from a single chunk of memory.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/Kconfig   |  1 +
 arch/arm64/mm/init.c | 19 ++++++++++++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index b3afe0688919..080b97b0bbd5 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -27,6 +27,7 @@ config ARM64
 	select ARCH_HAS_DMA_OPS if XEN
 	select ARCH_HAS_DMA_PREP_COHERENT
 	select ARCH_HAS_ACPI_TABLE_UPGRADE if ACPI
+	select ARCH_HAS_EXECMEM_ROX
 	select ARCH_HAS_FAST_MULTIPLIER
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_GCOV_PROFILE_ALL
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 97987f850a33..e6c98045046e 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -531,7 +531,8 @@ struct execmem_info __init *execmem_arch_setup(void)
 			[EXECMEM_DEFAULT] = {
 				.start	= start,
 				.end	= end,
-				.pgprot	= PAGE_KERNEL,
+				.pgprot	= PAGE_KERNEL_ROX,
+				.flags	= EXECMEM_ROX_CACHE,
 				.alignment = 1,
 				.fallback_start	= fallback_start,
 				.fallback_end	= fallback_end,
@@ -548,9 +549,25 @@ struct execmem_info __init *execmem_arch_setup(void)
 				.pgprot	= PAGE_KERNEL,
 				.alignment = 1,
 			},
+			[EXECMEM_MODULE_DATA] = {
+				.start	= start,
+				.end	= end,
+				.pgprot	= PAGE_KERNEL,
+				.alignment = 1,
+				.fallback_start	= fallback_start,
+				.fallback_end	= fallback_end,
+			},
 		},
 	};
 
+	if (!system_supports_bbml2_noabort())
+		execmem_info.ranges[EXECMEM_DEFAULT].flags |= EXECMEM_NO_HUGE_VMAP;
+
 	return &execmem_info;
 }
+
+void execmem_fill_trapping_insns(void *ptr, size_t size)
+{
+	memset32(ptr, AARCH64_BREAK_FAULT, size / sizeof(__le32));
+}
 #endif /* CONFIG_EXECMEM */
-- 
2.55.0.860.g4b6b3295ed-goog


