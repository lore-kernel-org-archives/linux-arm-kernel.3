Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74F11CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 16:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gh3vMEF4O5Y9+yoCyMybdxDQhBSSdSchlz6ofFPnkg8=; b=ifT5yqZq3CtlPKcnNkeE0fD1h9
	CUIDPigzVpMd8qCyF9FcJDZKY8skF9ngsKTMnr9xDu2uY6cYYRnQsoYpxl0SlrvH7rjD8nrXaJJq8
	mfLNTBBdEzUUIqd0VRbRctRyc6vWlCyb5QfKKxm8gcNmFXpyAhtmd4g+o6AjLZYjjCxsil6mniQVq
	2Ow4hJpiktz97riox36LdSP3FmnbC9UT0d3qPNa4c3/kepDb/fUKZcnpONBqVPd9ePL8q9+nobJcK
	jAgMR1fU1UNbhsq/kD/VfMM/2RIua8iowTXx3eOYJKElYfo91FMWiqEXKj1TiJSgmB26CWyVgWMk9
	iYSthXHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux6lA-0000000AYmc-382q;
	Fri, 12 Sep 2025 16:36:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux6l8-0000000AYlg-1Hcd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 16:36:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A09B0418A2;
	Fri, 12 Sep 2025 16:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03545C4CEF1;
	Fri, 12 Sep 2025 16:36:22 +0000 (UTC)
Date: Fri, 12 Sep 2025 17:36:20 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Will Deacon <will@kernel.org>, broonie@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, james.morse@arm.com,
	ardb@kernel.org, scott@os.amperecomputing.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 RESEND 5/6] arm64: futex: small optimisation for
 __llsc_futex_atomic_set()
Message-ID: <aMRMBEdro1YJ5RLW@arm.com>
References: <20250816151929.197589-1-yeoreum.yun@arm.com>
 <20250816151929.197589-6-yeoreum.yun@arm.com>
 <aMLqsez5y9R6FIdJ@willie-the-truck>
 <aML2fwGfeubY6HgA@e129823.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aML2fwGfeubY6HgA@e129823.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_093626_366169_CDB4DB0A 
X-CRM114-Status: GOOD (  15.71  )
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

On Thu, Sep 11, 2025 at 05:19:11PM +0100, Yeoreum Yun wrote:
> > > +static __always_inline int
> > > +__llsc_futex_atomic_set(int oparg, u32 __user *uaddr, int *oval)
[...]
> > Hmm, I'm really not sure this is worthwhile. I doubt the "optimisation"
> > actually does anything and adding a whole new block of asm just for the
> > SET case isn't much of an improvement on the maintainability side, either.
> 
> TBH, I had the same question, but I thought this code seems to modify
> freqenetly, I decide even a small optimisation -- reduce one instruction
> only.
> 
> But I don't have strong opinion for this patch.
> If it's not good for maintainability perspective,
> This patch can be dropped.

I'd drop it for now unless you can show some performance benefits
(unlikely).

-- 
Catalin

