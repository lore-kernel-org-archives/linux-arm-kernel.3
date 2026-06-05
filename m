Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E12CD8C81
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 16:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oAXBZW5d5jXNJnm6Pa8041wFx7pArTYcV483iwZEXh4=; b=DpES83Ly08CQQ1IVQfq9Su6fVv
	RlhY/qm2pkcEjs0IUM3QUpQSP2B0rfhsm5lCbLU3JtnzyNtaJgO6Jmbvr7Kr/ZHu49cWixwupZ0f9
	9jJOYViEkvFupc1MrPgVnft7cPQihRfJebXsPA+mwTTgi+6CSOYsxeMFUvip/7uQGBqjvtyHU/13T
	KtutJVhEuUsu5Nd81FinC/ji0V36Yo3937UoJKdGdNuxD733OMZpPqVIW42G2bg2f+j68iukaS7ab
	nn4wypmfpn4Ub0QBDEEnwwnUsMajtHd8W9BwwuXDXV468D+duIxyHKns+V9wJNk8Gh/0ROJjUmB0t
	4HBYmQtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVXde-00000000vKw-1jn2;
	Fri, 05 Jun 2026 16:43:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVXdd-00000000vK7-3uLI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 16:43:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 185C940B43;
	Fri,  5 Jun 2026 16:43:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 269DD1F00899;
	Fri,  5 Jun 2026 16:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780677797;
	bh=oAXBZW5d5jXNJnm6Pa8041wFx7pArTYcV483iwZEXh4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=b6iK9LYrhNjBSxXb+v3te+vQuSblTi0Rveg6gygWIBpXGiFPn4gV6WMKWe3HL+0yK
	 NfHg+9MQWRIbnsVS0+4lEqiDU8bU09RN0jhviQDENOu7OOBs0Qe6OW4BaRJ4cSgVGE
	 Imiwcd8aGo+mGpGEnbTXeqwqXcSxvmXx2PaB1FIGF+i03JdqnZmM5gGvHUAyTTJnAt
	 a+6xuwlRKI+W/Fsqs7paZFZQ/yLen300C52EAXk5tVE6iADf6R/Kjng6kAhRzvYgQp
	 AHWCPHVa7ghVJxr7v4D982JUjKXlF+KPC4HJ/QxChOvuulV80anj63EipBY6nBvNOq
	 CIeBXqxwQFI+Q==
From: Will Deacon <will@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Breno Leitao <leitao@debian.org>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] arm64: arch_timer: reuse arch_timer_read_cnt{p,v}ct_el0() helpers
Date: Fri,  5 Jun 2026 17:43:04 +0100
Message-ID: <178065748094.2118608.15288564842969855420.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260523-arch64_fix-v1-1-283bd4b73d49@debian.org>
References: <20260523-arch64_fix-v1-1-283bd4b73d49@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Sat, 23 May 2026 12:59:26 -0400, Breno Leitao wrote:
> __arch_counter_get_cntpct() and __arch_counter_get_cntvct() open-code
> the same ECV-aware ALTERNATIVE block that arch_timer_read_cntpct_el0()
> and arch_timer_read_cntvct_el0() already provide in the same header.
> The two pairs are byte-for-byte identical except for the trailing
> arch_counter_enforce_ordering() the __arch_counter_get_* variants add.
> 
> Replace the duplicated inline assembly in __arch_counter_get_cntpct()
> and __arch_counter_get_cntvct() with calls to the corresponding helpers.
> This mirrors commit 00b39d150986 ("arm64: vdso: Use
> __arch_counter_get_cntvct()"), which removed similar duplication from
> the vDSO, and keeps the system-counter read sequence in a single place,
> reducing assembly code in the kernell
> 
> [...]

Applied to arm64 (for-next/misc), thanks!

[1/1] arm64: arch_timer: reuse arch_timer_read_cnt{p,v}ct_el0() helpers
      https://git.kernel.org/arm64/c/11c33ffb3a4e

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

