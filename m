Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14420CD4F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 09:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=230KIaW9hT+AbOOUOlL6NjIRZroMk5K6aAspsvOlMcc=; b=RrX1x1cGWyjRYoJvsN5/Qeijkm
	VSCymuaREXaxE5f9bxqAaIbWXq0Lc1ksm4Wx9ntwxwkwJUjMYRkkc86V3+qGxvc34bfDFoXN6KXON
	nITaIQ1vUhqJ7xLJET3x5JS5++4M3/QhQw4/5vrLC9zaJbH/79X3UQmjUBcGUmuBPTEqlC9oywR9k
	5yj2C/8ygPdm/bPw5V7uK7t4ChxP8Pw+zAhRTqpo84QiANk2DmlahHT8uGf/6Q2ONAKqVmV4y+OFf
	h0pGIDf6sSb5dyP9isgyBi7f4xSBg83anREp5gNzLC0pfNV8nlDXqpPnmUFWWn4Lnj5vfcbtB0+Wk
	U6whKMxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waVTA-00000002Du2-1qw1;
	Fri, 19 Jun 2026 09:25:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waVT9-00000002Dtv-3Bby
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 09:24:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 44674407E2;
	Fri, 19 Jun 2026 09:24:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D94A91F000E9;
	Fri, 19 Jun 2026 09:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781861099;
	bh=230KIaW9hT+AbOOUOlL6NjIRZroMk5K6aAspsvOlMcc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hYhQOY3xrqUPTCie40QkEQxNyCq0+Tlw/vmMjZyF5izkcWe9haa5YLG+bDjbEysvb
	 9KzQ3A2+1WC/OCFeS+mkqBOJBGFJQ00rS/Ge3hdFieIo7knGTwQC2oYfXtMfnHL4k+
	 KihSHE+T3H4Sk/jo131yrorQz1Her2LNnFzBAihlH+VuRHXpbX28ZyoVi6wAt6GYVX
	 vitCzwJ1Kv38QJzMkeER24Y9mhhdbm2eI6JTTFnaLVMTRw8hn8oDemQ1qIOCvcsdzO
	 KSSDmueFeshkDvwVzELcYXQJ8JOPlMZPcnc8rQcU4PYiy6w5JxUVGWejKaoTVZTCoR
	 qZLQCz5ms4ZVw==
Date: Fri, 19 Jun 2026 10:24:54 +0100
From: Will Deacon <will@kernel.org>
To: Yureka Lilian <yureka@cyberchaos.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev, Sasha Finkelstein <k@chaosmail.tech>
Subject: Re: [PATCH v2] arm64: errata: Handle Apple WFI State Loss
Message-ID: <ajUK5gIX_ZttSsx6@willie-the-truck>
References: <20260615-wfi-erratum-v2-1-59a73467f70d@cyberchaos.dev>
 <ajAT9fWgOd9HY7ei@willie-the-truck>
 <e105c7b2-a5eb-4b5d-955f-685058143e9d@cyberchaos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e105c7b2-a5eb-4b5d-955f-685058143e9d@cyberchaos.dev>
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

On Wed, Jun 17, 2026 at 09:23:03PM +0200, Yureka Lilian wrote:
> On 6/15/26 17:02, Will Deacon wrote:
> > In fact, would wfe be a better choice than nop for you?
> 
> Regarding wfe: Simply replacing the wfi with wfe on these particular
> machines leads to them getting stuck in the boot process (entering wfe on
> the boot core and never waking up again), maybe because some kinds of
> interrupts do not count as as events for the wfe wake-up?

argh, I had forgotten that a pending masked interrupt doesn't wake up
a WFE (it does wake up a WFI).

So we probably shouldn't have wfe in the list of idle instruction choices
(unless we want to rely on the eventstream).

Will

