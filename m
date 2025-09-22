Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19818CAC5AA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 13:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GAmMkv9PBlMPNZeWiba7rRc6JhYgYjLSoqSNMkHBxZk=; b=bc42xzuoTFmtHLEIIMN9Tk+Gy7
	k1ikldybEvQS+3iWoZkBGVgMf8obGviWfd1w/VW0g4CvNLnIti199MX3efhDp5RT6j7uhA43k5LCW
	Pmr4GmnRUpuVHq4LbChnm1QxXArbh08beE/snQiajdN9h1SCNOy8px2VUTMD4DLU9RYqeJpjpRjq6
	WMfg+VBensysXU9Uua4RGPWqFZim0i4+hwrQf1CsU04iaq3k3c05ISGAJjSAjkv4JZrZqzyICIalP
	moIanTK+rgLAiXXxrnJZDyAa153vWtEPVZoO36apkpR1J5F2WQ/TlBXlLWCXXMGG++PrcZ2+VM4Rb
	ELjvWRRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gNq-0000000ASA5-0jgc;
	Mon, 22 Sep 2025 13:15:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gNm-0000000AS7t-23CC
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 22 Sep 2025 13:15:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=GAmMkv9PBlMPNZeWiba7rRc6JhYgYjLSoqSNMkHBxZk=; b=UtEojBegr4eQB6POWXBuPsVeF9
	a/Jl96i7a0pJKzF3WrmOdFmkpeVShO3e4mnaHmaslmAmGCQezrKqVH63VNfCHxDFgo7RlUMOHK8Cm
	hXsg5W9HVezUEFqYIvfSb0M1H3EfGMfgrtkeuh0ZK2nKhsogCX7D7RJ7T5PW083/IUekC1um0VQMy
	Q2vWYLEn24yi9nONhA0alQ1VURhZAni9Z1DaItVZFsiMvNnPO0dmJkHCnEgv6BtHhHUI/V2WCzlRo
	AZwLmVnYFlpgKSonbc3GfXKOZd2v3wnv/DB//Euk3a+otJZoz0O/Cj/MCt9A61N/VoCnHpCi4Qv7O
	ZCQGMUuA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0gNj-00000008ICQ-0kYe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Sep 2025 13:15:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B38E9448A9;
	Mon, 22 Sep 2025 13:14:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E95EC4CEF0;
	Mon, 22 Sep 2025 13:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758546899;
	bh=4mwrs79JuPeoSlr3rsZo4cRqZdSiJmSWsd/KzugKZww=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cSzdRVWTEXnok+wOor+BG+ngHJBbovfZ7w9cS1mQasnBEmOlLoMISVKtkGotLTX3+
	 Cex0Na6mlq18lF0qGcAUk/WdfroRhXA2GC6QqZD/6LRQ0G9SIYBsh8aCvjUMt1qNfo
	 GtukSZ3WM9X1qq6YJ5E0oe1DqRorHBLNljP5w1e4itzrXFsN7zFzsDjH4lzCzb1NtA
	 V1PYYrjHg+etxLlV6Eo4VIgm70BNq+zXwA1vSZx/lEQ1AfJOsfsujJPco1OCoJE50K
	 JaLX4/ZXdG4DA6Suha0YGwyzFWoqJ3KXQ3lZLUhyieOH3jtkzZoforjKBvF1yWzlEt
	 mY/G6aIVxezuw==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	Anshuman Khandual <anshuman.khandual@arm.com>
Cc: catalin.marinas@arm.com,
	kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH V5 0/4] arm64/sysreg: Clean up TCR_EL1 field macros
Date: Mon, 22 Sep 2025 14:14:45 +0100
Message-Id: <175853863661.3125743.12776771359177737990.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250921005300.2535994-1-anshuman.khandual@arm.com>
References: <20250921005300.2535994-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_141503_484302_2C00BA67 
X-CRM114-Status: UNSURE (   7.00  )
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

On Sun, 21 Sep 2025 06:22:56 +0530, Anshuman Khandual wrote:
> Currently TCR_EL1 field macros are sprinkled across the arm64 platform code
> including KVM implementation. Clean these up via updating required register
> filed definitions in tools sysreg format and then subsequently doing all
> necessary replacements. All required TCR_XXX macros have been moved from
> (asm/pgtable-hwdef.h) into KVM header (asm/kvm_arm.h) for their continued
> usage in KVM.
> 
> [...]

Applied arch parts to arm64 (for-next/sysregs), thanks!

[2/4] arm64/sysreg: Update TCR_EL1 register
      https://git.kernel.org/arm64/c/14f158552eec
[3/4] arm64/sysreg: Replace TCR_EL1 field macros
      https://git.kernel.org/arm64/c/4f91624778b2

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev

