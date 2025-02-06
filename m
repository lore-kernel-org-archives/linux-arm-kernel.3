Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E66E1C02194
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Feb 2025 22:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h/rUZaXRYLxrgBgshCQbA6+1bE3H/k/sIM+X94Cx5yk=; b=0dwsVBmA1dbUdB37u4VImE35PI
	xmt18Jzj7bfmIFmLB6Q/2V0VZ8LEMEbYcPxGYkpHpyzysfnsp/l5is3PdwzM+z6XIJy2h4UL+yDr/
	T7lQIr+t/WmkXOkiOMtLdXg8QW6C0+oS4YAL3Fvl/zGAfYzIUJjMJzb0L3dRK8fgATZ+XFiJ+BJ3x
	qbP/zG4Ve7PXM32Qls7fUNcF53jnHhsd4f9YgFYgKil/BQvBpHLJwLhw528xvH8QUm7XQrYhZDqKs
	aXLDB0kbh13IBMrAU2S25uspCwAhilit9LpXaX9i5l7vtOjMyFELEPZW7+D+dHSAVVE3G5+febrQL
	qBRGoftA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgAaH-00000007hkO-3G0f;
	Thu, 06 Feb 2025 22:42:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgAYt-00000007hdM-3h3U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Feb 2025 22:41:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8F51D5C483A;
	Thu,  6 Feb 2025 22:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F18F8C4CEDD;
	Thu,  6 Feb 2025 22:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738881691;
	bh=qSJN84svPdMWH8aktcRiZHTS6zg+RmikFW+FS9uQhxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CPLy65USrvJKh1O4UBNVOzteiSFzuXeFerLTb+QfV5TWiJR91p4EYvI8e1wIozhmq
	 mBHh+a4brX8oUQGHiI9fEl4mptmMRtN+ilHcPNMjdWcnh8pzA3ZVtef0ryiT5h6UKT
	 BBXtAuGf/+iaqZhdwI2ZYA8nNBC4yvJnKpc6XYZ6ilSh+HdDw4v/97jDG7htOuIX34
	 rrEBhpt4wYRzTL4eRzOjqqEaGJOcs2FMvVPIFak//CM7yxbIyO5/vY+J7JG5RkPHga
	 HOga/YPGjWP1Gh4gKO4w3i6miIzZlq7prT8DIUgCu+DdC6//nGDqwcsUtZEuNvWGuc
	 cZa70cGISwVkw==
Date: Thu, 6 Feb 2025 14:41:30 -0800
From: Kees Cook <kees@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Mark Brown <broonie@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Jann Horn <jannh@google.com>, Jeff Xu <jeffxu@chromium.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andy Lutomirski <luto@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Pierre Langlois <pierre.langlois@arm.com>,
	Quentin Perret <qperret@google.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	x86@kernel.org
Subject: Re: [RFC PATCH v3 00/15] pkeys-based page table hardening
Message-ID: <202502061422.517A57F8@keescook>
References: <20250203101839.1223008-1-kevin.brodsky@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203101839.1223008-1-kevin.brodsky@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_144132_004987_331FBF4C 
X-CRM114-Status: GOOD (  29.70  )
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

On Mon, Feb 03, 2025 at 10:18:24AM +0000, Kevin Brodsky wrote:
> This is a proposal to leverage protection keys (pkeys) to harden
> critical kernel data, by making it mostly read-only. The series includes
> a simple framework called "kpkeys" to manipulate pkeys for in-kernel use,
> as well as a page table hardening feature based on that framework
> (kpkeys_hardened_pgtables). Both are implemented on arm64 as a proof of
> concept, but they are designed to be compatible with any architecture
> implementing pkeys.

Does QEMU support POE? The only mention I could find is here:
https://mail.gnu.org/archive/html/qemu-arm/2024-03/msg00486.html
where the answer is, "no and it looks difficult". :P

> # Threat model
> 
> The proposed scheme aims at mitigating data-only attacks (e.g.
> use-after-free/cross-cache attacks). In other words, it is assumed that
> control flow is not corrupted, and that the attacker does not achieve
> arbitrary code execution. Nothing prevents the pkey register from being
> set to its most permissive state - the assumption is that the register
> is only modified on legitimate code paths.

Do you have any tests that could be added to drivers/misc/lkdtm that
explicitly exercise the protection? That is where many hardware security
features get tested. (i.e. a successful test will generally trigger a
BUG_ON or similar.)

> The arm64 implementation should be considered a proof of concept only.
> The enablement of POE for in-kernel use is incomplete; in particular
> POR_EL1 (pkey register) should be reset on exception entry and restored
> on exception return.

As in, make sure the loaded pkey isn't leaked into an exception handler?

> # Open questions
> 
> A few aspects in this RFC that are debatable and/or worth discussing:
> 
> - There is currently no restriction on how kpkeys levels map to pkeys
>   permissions. A typical approach is to allocate one pkey per level and
>   make it writable at that level only. As the number of levels
>   increases, we may however run out of pkeys, especially on arm64 (just
>   8 pkeys with POE). Depending on the use-cases, it may be acceptable to
>   use the same pkey for the data associated to multiple levels.
> 
>   Another potential concern is that a given piece of code may require
>   write access to multiple privileged pkeys. This could be addressed by
>   introducing a notion of hierarchy in trust levels, where Tn is able to
>   write to memory owned by Tm if n >= m, for instance.
> 
> - kpkeys_set_level() and kpkeys_restore_pkey_reg() are not symmetric:
>   the former takes a kpkeys level and returns a pkey register value, to
>   be consumed by the latter. It would be more intuitive to manipulate
>   kpkeys levels only. However this assumes that there is a 1:1 mapping
>   between kpkeys levels and pkey register values, while in principle
>   the mapping is 1:n (certain pkeys may be used outside the kpkeys
>   framework).

Is the "levels" nature of this related to how POE behaves? It sounds
like there can only be 1 pkey active at a time (a role), rather than
each pkey representing access to a specific set of pages (a key in a
keyring), where many pkeys could be active at the same time. Am I
understanding that correctly?

> Any comment or feedback will be highly appreciated, be it on the
> high-level approach or implementation choices!

As hinted earlier with my QEMU question... what's the best way I can I
test this myself? :)

Thanks for working on this! Data-only attacks have been on the rise for
a while now, and I'm excited to see some viable mitigations appearing.
Yay!

-Kees

-- 
Kees Cook

