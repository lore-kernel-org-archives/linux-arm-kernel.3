Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C97C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 01:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DtpCorXC+GJbQX3n4ecrat2Ls9nmYuwZIJdWGIAp89w=; b=DV1CbsdI1Yodw7yP+WRBNzWchZ
	DbZXfqTzgO0erhvwhfWqDfiNe67kgv7SrNpfUEq3GNlPIinFyqAtP5ORk2P+33g+vrybfN4b5qw8O
	QQqMpzbUaEO8kgyuMNJN2AVNQF2No+Ux9K/HhenSVP8pBmuoBvF7CAJhqJQvL7aHwpQQZwU5QmAvV
	fSeHnjYYpYHfCEsKyAGFpVNx7qjMoFLe6tayqffKREuYn59t1WpASxqiL+ZAPfWXp5XdZP+uaIf1R
	U27SeGVOE40dXj9QDbVPCSWYAyJKFWw/H+Skbim+kP2qteNtNlKwt0QUKRRh7xAkzGU8lhyAsBwKT
	s0bh+WjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uikM6-00000009SZ2-2HvT;
	Mon, 04 Aug 2025 01:51:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uijEi-00000009MSy-0SHN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 00:39:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D30484470E;
	Mon,  4 Aug 2025 00:39:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3726BC4CEEB;
	Mon,  4 Aug 2025 00:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754267971;
	bh=F90JFq2DA2hyVOvaTR4oDxz+L1hPDd0NDSpOfIUY/Ww=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TlAaQL2xnLhVzmmeosn2dFahbFk82Ul7KptwtINRaeilAuuLke2tY9/oAxOVcG8OJ
	 0gDSh0GvI7l6h/TrdlyTle5AvqytvuQ2CFk3GR4lFh94bi7Mur3oU2lwEfcGmCVup0
	 z72NbaiTFxuzrbWjd1csGKwlhc1hC9aQ4unaDbPZ9qqJr5r0P8MMZEAmNX5Ci6e0qj
	 GPNjJJR7W7/PLWF5T8e9m8QfRst724HQJL1Vyf88DZsAOcI9a8X9rPfW/ADknvdZkt
	 f+UyDAY0VnDveZUTpSijEus635QYCziq0EkI6yn9brfVre3Lh4YuC+9QfEGpKPsP8o
	 9IpbLFp38pkZQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Aaron Kling <webgeek1234@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Sasha Levin <sashal@kernel.org>,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 18/44] ARM: tegra: Use I/O memcpy to write to IRAM
Date: Sun,  3 Aug 2025 20:38:23 -0400
Message-Id: <20250804003849.3627024-18-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250804003849.3627024-1-sashal@kernel.org>
References: <20250804003849.3627024-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.189
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_173932_178246_CB81C854 
X-CRM114-Status: GOOD (  16.73  )
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

From: Aaron Kling <webgeek1234@gmail.com>

[ Upstream commit 398e67e0f5ae04b29bcc9cbf342e339fe9d3f6f1 ]

Kasan crashes the kernel trying to check boundaries when using the
normal memcpy.

Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
Link: https://lore.kernel.org/r/20250522-mach-tegra-kasan-v1-1-419041b8addb@gmail.com
Signed-off-by: Thierry Reding <treding@nvidia.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Based on my analysis of this commit, here's my determination:

**Backport Status: YES**

This commit should be backported to stable kernel trees for the
following reasons:

1. **Fixes a real crash/bug**: The commit fixes a KASAN (Kernel Address
   Sanitizer) crash that occurs when using regular `memcpy()` to write
   to IRAM (Internal RAM). This is a functional bug that causes kernel
   crashes when KASAN is enabled.

2. **Small and contained fix**: The change is minimal - it simply
   replaces `memcpy()` with `memcpy_toio()` on line 66 of arch/arm/mach-
   tegra/reset.c. This is a one-line change that doesn't alter any logic
   or introduce new features.

3. **Follows proper I/O memory access patterns**: The fix is technically
   correct. According to the kernel documentation in
   Documentation/driver-api/device-io.rst, I/O memory regions (which
   IRAM is mapped as via `IO_ADDRESS()`) should be accessed using
   I/O-specific functions like `memcpy_toio()` rather than regular
   `memcpy()`. The documentation explicitly states: "Do not use memset
   or memcpy on IO addresses; they are not guaranteed to copy data in
   order."

4. **No architectural changes**: The commit doesn't introduce any
   architectural changes or new functionality. It's purely a bug fix
   that corrects improper memory access.

5. **Minimal risk of regression**: Since this change only affects how
   data is copied to IRAM during the Tegra CPU reset handler
   initialization, and uses the proper kernel API for I/O memory access,
   the risk of introducing new issues is very low.

6. **Platform-specific but important**: While this fix is specific to
   ARM Tegra platforms, it fixes a crash that would affect any Tegra
   system running with KASAN enabled. This is important for developers
   and users who rely on KASAN for debugging.

The fact that `iram_base` is obtained through `IO_ADDRESS()` macro
clearly indicates this is I/O mapped memory that requires I/O-specific
accessors. KASAN correctly identified this misuse and crashed to prevent
potential issues. The fix properly uses `memcpy_toio()` which is
designed for copying to I/O memory regions and won't trigger KASAN
checks for regular memory access.

 arch/arm/mach-tegra/reset.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/reset.c b/arch/arm/mach-tegra/reset.c
index d5c805adf7a8..ea706fac6358 100644
--- a/arch/arm/mach-tegra/reset.c
+++ b/arch/arm/mach-tegra/reset.c
@@ -63,7 +63,7 @@ static void __init tegra_cpu_reset_handler_enable(void)
 	BUG_ON(is_enabled);
 	BUG_ON(tegra_cpu_reset_handler_size > TEGRA_IRAM_RESET_HANDLER_SIZE);
 
-	memcpy(iram_base, (void *)__tegra_cpu_reset_handler_start,
+	memcpy_toio(iram_base, (void *)__tegra_cpu_reset_handler_start,
 			tegra_cpu_reset_handler_size);
 
 	err = call_firmware_op(set_cpu_boot_addr, 0, reset_address);
-- 
2.39.5


