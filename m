Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3D4C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 21:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNzdv87a/rWq9tLSyEQPN0gDEde6E0UtRnippuxMHZM=; b=ar6QaEtRnEWMBLb1dPDP4IdrYz
	M89apPGRyLSEWZZ4NvLdBu6GLH7IjJ06HA8NJG61EUBP++HWXp2ii/zHOAIA2EsOl8gSKUwEjotAV
	xQLGuOR2Kl30fLeC+/W1B3UHTFv5e+JT4+UAfdXG13HcytuVf6Cq6Zqv5ZnBI5bNRjWmBlojWQ421
	6+ZF0EVogiqmpSLezqQOrbhLxNa2gkmeyIhfMdNcMRWGSaB+ObonkHbbkhCDdJgabgL7M52/t3ns4
	fSL4OP9iStimtxH14VVAnqBxwH1Auktj/uTNxzF0uOcg06nTcu3WTo79jS1Y53mdcSbXUL3XL+/7L
	DH0tkeLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucse6-0000000DTbb-0PLZ;
	Fri, 18 Jul 2025 21:29:34 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucsbe-0000000DTSo-3pct
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 21:27:04 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1752874020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HNzdv87a/rWq9tLSyEQPN0gDEde6E0UtRnippuxMHZM=;
	b=1k3SEokf2DBVJWgiF+T/xnJOe2eEqWGJLJ00C8SsTwH8x1nM5SZiBDmLZUebOhfii+iVuG
	s4+tESctQnG48CFtQHqPgJwTltmpCoGIi2OyV/1oz6yHpnLeulrQnGooaWGSkHpY97elqF
	InEmN3BmvnWJfTfz45eaVaHk6La2pBV3EkfKx5fZcSwca6eNLFm62SJJiOaBxlZcpCzbYg
	F14bdVOShusu5A7bNHEUESC4troKiGYNlYfZHIlCSEsEvyHEM94Q3CRWKsE7NscCOwM2bo
	4maJC7nsozVTPffITe3MFsv8Phg/ZQJ/8iR76dyJuWP6JP39vHxYHCpfCb0ZpA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1752874020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HNzdv87a/rWq9tLSyEQPN0gDEde6E0UtRnippuxMHZM=;
	b=XTTfwGcffydfGuv9QlkDzZ39VMlTjrkghsf4EOfBdgI7BhVW6CZYXQHAY0fGzaXv/laho9
	ZnSs1FsFSv4KQoDA==
To: Marc Zyngier <maz@kernel.org>
Cc: Breno Leitao <leitao@debian.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Conor Dooley <conor+dt@kernel.org>, Jonathan
 Cameron <Jonathan.Cameron@huawei.com>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, Sascha
 Bischoff <sascha.bischoff@arm.com>, Timothy Hayes <timothy.hayes@arm.com>,
 Will Deacon <will@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kvmarm@lists.linux.dev
Subject: Re: [GIT PULL] irqchip: Add GICv5 support
In-Reply-To: <20250717122306.4043011-1-maz@kernel.org>
References: <20250717122306.4043011-1-maz@kernel.org>
Date: Fri, 18 Jul 2025 23:26:58 +0200
Message-ID: <87y0slur4t.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_142703_097942_E2E65FFF 
X-CRM114-Status: GOOD (  16.57  )
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

Marc!

On Thu, Jul 17 2025 at 13:23, Marc Zyngier wrote:

> Thomas,
>
> After some time simmering in -next without much catching fire (only a
> single regression has been reported, which was promptly fixed), here's
> the pull request for the GICv5 core infrastructure.
>
> There are still a couple of patches on the list (mostly addressing
> error paths, and actively being reviewed), but I don't see anything
> that would warrant holding this any longer, and these fixes can be
> added down the line. If anything, this work has allowed us to
> pipe-clean a number of issues in the tree.
>
> Please note that the kvmarm tree also carries this branch, as this is
> a dependency for enabling GICv3 compatibility for guests on a GICv5
> host.

I'm fine with keeping this in the kvmarm tree only if that is intended
to hit the next merge window. There is no point to carry this
redundantly in two trees, unless there is some conflict to resolve in my
tree.

If the kvmarm stuff is not ready yet, then please let me know and I
happily pull in the pile.

Thanks,

        tglx

