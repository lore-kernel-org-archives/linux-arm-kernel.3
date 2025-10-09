Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23743CCD184
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Oct 2025 16:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TXR48XkojV/V0PQ1lQAt8P0W3flwJb75+Hb8kwATGlE=; b=0OS0ION+WPKwh7XEgStpsM/K92
	lDNn2yQHFYtoGP30gvEW5SoLfEZsTfcXY68tw6iZnIPKjvxjATvZ7528bfg8oK4UBYHh4Cc31fzNN
	zEHkEtMJpvHpzXyKo2WZ1nRCt7V+1oA/HyEmWnhk7yBNAJs1mfat/YtXS0K3j7E5impAg37rSsjTb
	FLq9DRipZO5ck7su7Uu2nHsJsVqTZsUvlPmLI7cBUXW4EagYi2JdBrpat5OKNaZ509i5x8KduT67p
	u0rq2l3G/KSgBgO1S5lSO1wtDpUS0BNcNeS3K8OXzwuYNFV3phQoNl5MOY13v+R4vAEdOjD1A0Dhc
	WhqooUbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6t53-00000006cgp-2ShM;
	Thu, 09 Oct 2025 16:01:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6t52-00000006cf0-0gvK
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 09 Oct 2025 16:01:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=TXR48XkojV/V0PQ1lQAt8P0W3flwJb75+Hb8kwATGlE=; b=muwFkV8L09lVRfUC1C4IrYK7z5
	UlS5NP7r4RVV/Yccdu+ZZG1jiS0HPYc6HNJOfoDCEwHVVsTyWQAD+r4K6N4bMGR5+PfOJoJYPxaIW
	Dnl15mP9oMfIC/PA9/kfzLpEeAWyp5xnQKY4F/ZSwI22Vk+6r225Tk4FGjGXuxP/UcD3a+760Kw/J
	1+DB5iIa3/fjJQOaKzuwPqov5iU9r3fYOhI05PKKSoBxuAsmLlu5TzWs+t+9zOr1W2Szq+QZp87Fl
	MTL79SsvdhE2C26qSMxQejh8HJEZeHk+kARuA4gzzIu3QkPj3LsnGgApDj/QRYUObVMlfPzthzJGQ
	Xq5ETLHA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6t4x-00000001XuR-2JaU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Oct 2025 16:01:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D19943B23;
	Thu,  9 Oct 2025 16:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40515C4CEF8;
	Thu,  9 Oct 2025 16:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760025672;
	bh=vgTvzbuaErSOmNKUcF02F+y/az0JKy9Pe3Vija2d2N0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HAEDLbebriCaMUmhik/TelHHejTzGDAdNwpxRtx381NgCRGipNVvleEJ35JopDfuf
	 xoaC6zb5nAPIXZhtjt7B+c4uaNSA5Jdr0444k50prVyr0twZk3FfDzUxTm0umnS/G7
	 KgXuvLQDWuwkJplyS001x18Fy4zodscy6cUDeYDSh01IsKdNiJTj+fQhPT3QV5LXG7
	 cIjLPmYBQ+sv8jFF8Q+NaNdUBcmEIu8gVjuUnIf/Tg7OOJzMa6vF3esDiIbWSphK32
	 y1+WIu7abDxQQV/EJMZ3y4SGNbYcgcwcHx5bP/ToHQ9UGCAnKoCofgAIFHaaUWa7lg
	 DskP3l//WnKkQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	Lee Jones <lee@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.17-5.4] mfd: stmpe-i2c: Add missing MODULE_LICENSE
Date: Thu,  9 Oct 2025 11:56:12 -0400
Message-ID: <20251009155752.773732-106-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009155752.773732-1-sashal@kernel.org>
References: <20251009155752.773732-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_170120_216593_7980DD71 
X-CRM114-Status: GOOD (  13.63  )
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

From: Alexander Stein <alexander.stein@ew.tq-group.com>

[ Upstream commit 00ea54f058cd4cb082302fe598cfe148e0aadf94 ]

This driver is licensed GPL-2.0-only, so add the corresponding module flag.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Link: https://lore.kernel.org/r/20250725071153.338912-3-alexander.stein@ew.tq-group.com
Signed-off-by: Lee Jones <lee@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

YES

**What Changed**
- Adds missing module license declaration: `MODULE_LICENSE("GPL");` in
  drivers/mfd/stmpe-i2c.c:129.

**Why It Matters**
- Without a `MODULE_LICENSE`, modules are treated as non‑GPL compatible,
  which taints the kernel and blocks access to GPL‑only exports:
  - License compatibility check: include/linux/license.h:5 treats
    `"GPL"` as GPL‑compatible.
  - Taint on unknown/non‑GPL licenses: kernel/module/main.c:1742
    triggers `TAINT_PROPRIETARY_MODULE` when license isn’t
    GPL‑compatible.
- The driver carries the SPDX header `GPL-2.0-only`, so the module flag
  aligns metadata with the actual license.
- Avoids user‑visible nuisance: dmesg warning and kernel taint on load
  for this module when built as a module.

**Scope and Risk**
- One-line metadata-only change in a single file; no functional or
  architectural changes.
- Very low regression risk; does not modify probe/remove paths or data
  flows.

**Context and History**
- The driver is modular-capable: `config STMPE_I2C` is `tristate`
  (drivers/mfd/Kconfig:1600), so a module license tag is appropriate.
- Commit 9e646615df195 (2023) removed `MODULE_LICENSE` under the
  assumption the object was non‑modular, which was incorrect for this
  driver and led to the current regression (missing license).
- This commit corrects that regression.
- Affected stable series: In this tree, v6.6, v6.8, and v6.10 lack the
  license line (module taints if built as a module), while v6.1 still
  had `MODULE_LICENSE("GPL v2")`. Backport is beneficial to stable lines
  where the line is missing.

**Stable Criteria Fit**
- Fixes a real, user-visible regression (kernel taint and GPL‑only
  symbol ineligibility) with a minimal, contained change.
- No new features or API changes; confined to MFD stmpe I2C driver
  metadata.
- Clear alignment with stable rules for small, low-risk fixes.

 drivers/mfd/stmpe-i2c.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/stmpe-i2c.c b/drivers/mfd/stmpe-i2c.c
index fe018bedab983..7e2ca39758825 100644
--- a/drivers/mfd/stmpe-i2c.c
+++ b/drivers/mfd/stmpe-i2c.c
@@ -137,3 +137,4 @@ module_exit(stmpe_exit);
 
 MODULE_DESCRIPTION("STMPE MFD I2C Interface Driver");
 MODULE_AUTHOR("Rabin Vincent <rabin.vincent@stericsson.com>");
+MODULE_LICENSE("GPL");
-- 
2.51.0


