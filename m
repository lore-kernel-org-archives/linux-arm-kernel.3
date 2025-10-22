Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41987CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 13:36:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pSXvFHnsg3gE0TnhtI6deEWwdXcIUCjdU1iFuLYkx6E=; b=XTq4SK9KCNvMJC2JGElylW4atL
	gV0tCdzTIAUP7RB5fo1eIu11Pfx7n2Pp4h6tU3Mx4akK6Bv5tYxo5ydC2ghujnP/cjAHS3JCjh16c
	Oj6FcJGjoUmBt2aJgyUUhrgHxPKqsD1BanbD1HRsm6GZO5H+NUiLnt6TsmUEva01Am29fhNd0/8H8
	cGijkmCJ3Vr1F47IecrfN6ia1GSs9N+zjVZCf1Geb0F35SlykCyssKw5/05gsGnCRPshx1W/8Sh87
	8DgBRCGSZhJZ482oXP4gZ3JrG8c9jrscHQqqevhA+p5lsmhqlVC5PC7K0NRbmU1T8SFXXzo9Zxit1
	24VQMEow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZ1F-000000031xg-47l0;
	Wed, 22 Oct 2025 13:36:49 +0000
Received: from mout-p-202.mailbox.org ([2001:67c:2050:0:465::202])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZ1B-000000031wU-40g7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 13:36:49 +0000
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4cs9Dn2s2sz9tTY;
	Wed, 22 Oct 2025 15:36:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761140201;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pSXvFHnsg3gE0TnhtI6deEWwdXcIUCjdU1iFuLYkx6E=;
	b=QthS67NrFA51itYxmyCjrd13ia2jXXgjDANyNqjRbU+K6EzpWkG58KSMtL3VzSCZjNgeXG
	0WCFQJT3G5LQ+xZSH4rWZwtoraurEAJkj9vRRyO8aBbjnAWy8EI1Z8wgd/UoiWbaY82DK/
	Ph3naii/TvfhILosfDjG8zk4Kp4aSfr+nu7Hl28v1kiatWMFGSERVxodZJRwa6OgHjyY7k
	sKGii8Jy+ktQmp/EcOVoCRlTLths6agdrYnJFKXFxVyTOpmq1oH2yIvtyFRbQdVj34O4ga
	9tNkxkucjaX/ITvePg81gCmneOocz1RVOcRjhcJf+ICP+LOYbyuuunlRZ+agCg==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=nuQQfQDw;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1761140199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pSXvFHnsg3gE0TnhtI6deEWwdXcIUCjdU1iFuLYkx6E=;
	b=nuQQfQDwRj0nrsG0sUOKFHzuJnTWCuDjRvrD4KzqURc/vnh5VedFlhmPlYJWXH1ABEPgcg
	iYCo5IuCfNtImeBJVxGIG3Q2Wm9Gr6UyGRdAJLli4RN1l91U89dsR+SFIdQ8BJOcVmxmwh
	gtBQPsCKMTi3+w9v+wzoR4BDqT0nJxnCThr0EaWaE+oO+JimrR4seuN5dvdi48akSHTM24
	2q/F3q7q9GyJhCJl2QwxXEczB0zH1nVcL4tifgMaS3m82j6+9KRTZZp5Vk/Xfy5aKoYDWR
	jEsDkEyYEj8SCJDu10fkZDPsWYURnxFc894FMKw3bBfiJEOP+0i60GNlVANxnQ==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Marc Zyngier <maz@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Will Deacon <will@kernel.org>,
	Yicong Yang <yangyicong@hisilicon.com>,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH] arm64: guard AMU register access with ARM64_HAS_AMU_EXTN
Date: Wed, 22 Oct 2025 15:35:28 +0200
Message-ID: <20251022133621.178546-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 5qzjs5xwh74r54byqbt4ttz9b7joqbh8
X-MBO-RS-ID: 88e9880ea370458bc62
X-Rspamd-Queue-Id: 4cs9Dn2s2sz9tTY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_063646_820915_E6CC1B51 
X-CRM114-Status: UNSURE (   8.17  )
X-CRM114-Notice: Please train this message.
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

The AMU configuration register access may fault and prevent successful
kernel boot. This can occur for example in case the firmware does not
allow AMU counter access from EL1. Guard the AMU configuration register
access with ARM64_HAS_AMU_EXTN to prevent this fault if ARM64_HAS_AMU_EXTN
Kconfig option is explicitly disabled. Other interaction with the AMU is
already guarded by similar ifdeffery.

Fixes: 87a1f063464a ("arm64: trap to EL1 accesses to AMU counters from EL0")
Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Yicong Yang <yangyicong@hisilicon.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-renesas-soc@vger.kernel.org
---
 arch/arm64/mm/proc.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
index 86818511962b6..123538ffeda6b 100644
--- a/arch/arm64/mm/proc.S
+++ b/arch/arm64/mm/proc.S
@@ -145,7 +145,9 @@ SYM_FUNC_START(cpu_do_resume)
 	ubfx	x11, x11, #1, #1
 	msr	oslar_el1, x11
 	reset_pmuserenr_el0 x0			// Disable PMU access from EL0
+alternative_if ARM64_HAS_AMU_EXTN
 	reset_amuserenr_el0 x0			// Disable AMU access from EL0
+alternative_else_nop_endif
 
 alternative_if ARM64_HAS_RAS_EXTN
 	msr_s	SYS_DISR_EL1, xzr
@@ -470,7 +472,9 @@ SYM_FUNC_START(__cpu_setup)
 	mov	x1, MDSCR_EL1_TDCC		// Reset mdscr_el1 and disable
 	msr	mdscr_el1, x1			// access to the DCC from EL0
 	reset_pmuserenr_el0 x1			// Disable PMU access from EL0
+alternative_if ARM64_HAS_AMU_EXTN
 	reset_amuserenr_el0 x1			// Disable AMU access from EL0
+alternative_else_nop_endif
 
 	/*
 	 * Default values for VMSA control registers. These will be adjusted
-- 
2.51.0


