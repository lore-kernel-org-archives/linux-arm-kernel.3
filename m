Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29AB4E8FDBA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 22:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6YZZU/iwW88zjNDDGdCYX7IlRTUynqMqN8pEJHwT790=; b=ffp/XF8NnkahWr
	FoYUGW1Zu0kGEtacrq4Ikg+YS7C85ErUU9FGF/Ar2nqGyuzot5NcveS4No4wl0a69kn59uvSGeCB6
	qD8ocZC06C2XbirAKwpcOSDcZsdNKCAoEpcb79TOXm5z3aJu1APfemt/gwKk6b3W5MqGFwrS9Su4G
	5C+biUnhhSm8oYFX/FVE/kZAAdMzeSguMl8wQA+cuN1so6lo7E/NHJmvigi2aAqqzGN0erCHbqLuP
	G/16zJIyyqN+mFVV9v40K3mVTrptfRAZEwi2otnoy7BWLohGsKDXPLWVJedEXR/Noizwn5RZcc/cX
	ToxkgCLydwA7ABOSXV7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZGgb-00000001X4O-2RXX;
	Fri, 26 Dec 2025 22:53:29 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZGgY-00000001X41-26Nq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 22:53:28 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2a0d0788adaso67078715ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 26 Dec 2025 14:53:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766789605; x=1767394405; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6YZZU/iwW88zjNDDGdCYX7IlRTUynqMqN8pEJHwT790=;
        b=XcJWJU5L3apFApbnQ9doiutAYnNMS2Rp2QETfouK8dMVyWNhDPWWWIGUnFHfbCBwuq
         LILxWa6P52kTsJ7v2nS/+W4VcLo5WxpvVv7YIJWt5N9hK4cb2/MySr9As6Ywq77ojncr
         2LDG7IOEZ/H6LSe3QTiDbIdn1Z0YBsPFID4CpOTysQ0+14QM195VYNEv5qVbt8Vcvv4n
         kC5PFMvoualtAF//sd4n7lTk2endsdcrMbflDwSpB6RL1GkL8mW4UN6va182Q1p7PxDa
         tKh3EU0PJtdkco/4IUCOs1eEvHFsCdm0T0EZnJwWSubL56kDsYYbF8Cm3r2GnNLDu7ju
         phTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766789605; x=1767394405;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6YZZU/iwW88zjNDDGdCYX7IlRTUynqMqN8pEJHwT790=;
        b=Xv8sNLG07CZ3HMH5tYTg4lKA2iQybPGWrZ7sqx0pNuRsDzQJTEbPPHyE5kIxDf4cq/
         OM4vYHEDnT7uClWnBmWEw+3YZ4xb12ycBGqjkvkWZQ55Oj3rGDJ+yJJe/hrF+BAGqqtt
         7gfMwyaa0/fP82p60tI29MWg0yMxC+w/MIuslujs9oRqN2YiUmI52kQ326jRpnnbuu1P
         a4vmGmtV13YpB+OQttZIMFNXp5CQ4hQyyK74P5IHMikxLAnMVB7+9sVW12IUGRs6ZIiq
         rm56GfIUoKXuXEIU0nBjZtJGyNB7kRmo0mhVkJw++GwokTKo2LaJ71FV4oipde65RYkb
         kwDw==
X-Forwarded-Encrypted: i=1; AJvYcCW9KaR4caM0lUeQuT96P/kfdV18wwu5XUEg7ZvtJRck9PNJJYIYBbzhg42Dynk6SnwDyUcFSHVljlsw+Zugx375@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6vXZ9T1RwXZODSG+Gt+S38IoP7Kz9OhY3dcuM5vI7cOTy2EX8
	Ezm3ozZVxFRmff0Q30oiug7JP6M77zW0Fq6rkMt6Qz485zjucgnIPCYk
X-Gm-Gg: AY/fxX4iU0LenHdvXilDH/F4JBMcu0OpiATm3WrDQ39bdt91nvWr7swmiLROO0KG6JO
	mKlbNND5VH65u7yG82E50FoluAxXOKmqMUVOIDmxkhAzoBURBVKR07pOTw773vsR1V7WBzGbCcC
	a4EgpfaG4NJQFZ4XjJJNxuYZsICwsezySls/lUTuXpJvWgiBdy+u6bzIx6Fd+2GVfYSQIEz8ubT
	cWpZ4O97DjKgvr88wJs49IkPKl2AOMCht/zxyUHc++6oVgfVNZaeN8dbY9fUlQnI7UYxGcYBi0p
	hugl+gH1sql4kvhhvPAUWpYOUx+9kJbm/R8pnmbMD1NxPwpxSnYAor5PuXoQ7FSU9omX/aLUuJh
	5yDcQlCITYa70wXMrlzCXVWd1sey9jmI+i7fdTE4aD5sHeB7st1LS750XjxMoE0n2c5gXtPen29
	CR+JUgIgPnGKDq
X-Google-Smtp-Source: AGHT+IEPpw6k3H5B3GfQJ5gfoJrvfI68uwFervPMjcjEQdlc2KG+bnnPwgqGQJuYg9SuR5JsgGZOMA==
X-Received: by 2002:a17:902:da81:b0:2a1:c72:a41d with SMTP id d9443c01a7336-2a2f2940678mr262079485ad.40.1766789605397;
        Fri, 26 Dec 2025 14:53:25 -0800 (PST)
Received: from barry-desktop.hub ([47.72.129.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e772ac1acsm9981428a91.9.2025.12.26.14.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Dec 2025 14:53:24 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: catalin.marinas@arm.com,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	will@kernel.org,
	iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/8] arm64: Provide dcache_by_myline_op_nosync helper
Date: Sat, 27 Dec 2025 11:52:41 +1300
Message-ID: <20251226225254.46197-2-21cnbao@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20251226225254.46197-1-21cnbao@gmail.com>
References: <20251226225254.46197-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_145327_478281_A741FE2E 
X-CRM114-Status: GOOD (  13.10  )
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
Cc: Barry Song <baohua@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Leon Romanovsky <leon@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Tangquan Zheng <zhengtangquan@oppo.com>, xen-devel@lists.xenproject.org, Suren Baghdasaryan <surenb@google.com>, Ard Biesheuvel <ardb@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Barry Song <baohua@kernel.org>

dcache_by_myline_op ensures completion of the data cache operations for a
region, while dcache_by_myline_op_nosync only issues them without waiting.
This enables deferred synchronization so completion for multiple regions
can be handled together later.

Cc: Leon Romanovsky <leon@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Tangquan Zheng <zhengtangquan@oppo.com>
Signed-off-by: Barry Song <baohua@kernel.org>
---
 arch/arm64/include/asm/assembler.h  | 24 +++++++++++++++++++-----
 arch/arm64/kernel/relocate_kernel.S |  3 ++-
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
index f0ca7196f6fa..b408ed61866f 100644
--- a/arch/arm64/include/asm/assembler.h
+++ b/arch/arm64/include/asm/assembler.h
@@ -371,14 +371,13 @@ alternative_endif
  * [start, end) with dcache line size explicitly provided.
  *
  * 	op:		operation passed to dc instruction
- * 	domain:		domain used in dsb instruction
  * 	start:          starting virtual address of the region
  * 	end:            end virtual address of the region
  *	linesz:		dcache line size
  * 	fixup:		optional label to branch to on user fault
  * 	Corrupts:       start, end, tmp
  */
-	.macro dcache_by_myline_op op, domain, start, end, linesz, tmp, fixup
+	.macro raw_dcache_by_myline_op op, start, end, linesz, tmp, fixup
 	sub	\tmp, \linesz, #1
 	bic	\start, \start, \tmp
 .Ldcache_op\@:
@@ -402,14 +401,13 @@ alternative_endif
 	add	\start, \start, \linesz
 	cmp	\start, \end
 	b.lo	.Ldcache_op\@
-	dsb	\domain
 
 	_cond_uaccess_extable .Ldcache_op\@, \fixup
 	.endm
 
 /*
  * Macro to perform a data cache maintenance for the interval
- * [start, end)
+ * [start, end) and wait for completion
  *
  * 	op:		operation passed to dc instruction
  * 	domain:		domain used in dsb instruction
@@ -420,7 +418,23 @@ alternative_endif
  */
 	.macro dcache_by_line_op op, domain, start, end, tmp1, tmp2, fixup
 	dcache_line_size \tmp1, \tmp2
-	dcache_by_myline_op \op, \domain, \start, \end, \tmp1, \tmp2, \fixup
+	raw_dcache_by_myline_op \op, \start, \end, \tmp1, \tmp2, \fixup
+	dsb \domain
+	.endm
+
+/*
+ * Macro to perform a data cache maintenance for the interval
+ * [start, end) without waiting for completion
+ *
+ * 	op:		operation passed to dc instruction
+ * 	start:          starting virtual address of the region
+ * 	end:            end virtual address of the region
+ * 	fixup:		optional label to branch to on user fault
+ * 	Corrupts:       start, end, tmp1, tmp2
+ */
+	.macro dcache_by_line_op_nosync op, start, end, tmp1, tmp2, fixup
+	dcache_line_size \tmp1, \tmp2
+	raw_dcache_by_myline_op \op, \start, \end, \tmp1, \tmp2, \fixup
 	.endm
 
 /*
diff --git a/arch/arm64/kernel/relocate_kernel.S b/arch/arm64/kernel/relocate_kernel.S
index 413f899e4ac6..71938eb3a3a3 100644
--- a/arch/arm64/kernel/relocate_kernel.S
+++ b/arch/arm64/kernel/relocate_kernel.S
@@ -64,7 +64,8 @@ SYM_CODE_START(arm64_relocate_new_kernel)
 	mov	x19, x13
 	copy_page x13, x12, x1, x2, x3, x4, x5, x6, x7, x8
 	add	x1, x19, #PAGE_SIZE
-	dcache_by_myline_op civac, sy, x19, x1, x15, x20
+	raw_dcache_by_myline_op civac, x19, x1, x15, x20
+	dsb	sy
 	b	.Lnext
 .Ltest_indirection:
 	tbz	x16, IND_INDIRECTION_BIT, .Ltest_destination
-- 
2.43.0


