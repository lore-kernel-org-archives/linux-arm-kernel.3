Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08458CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 09:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0/luRpdNvze2pCejIkTcXaz0Po23baj/UwWF7iM1wto=; b=JEqLb0uT6tBXO2NtoTOA7LH6E4
	olVRNjOtAp4DK17qNpva3JXOEAUCkclTUnDO8yvMU2Iv5k4M43CKG9D7pAZ57IHxCgstuTQ7ez6gD
	os3q/RVpCUWzPdMQbsvQZP43E0wVmQPqa6sxFmR/xeC72AceRiFQ+4vJWle1kY5Zp3ipT5s7HdEHJ
	EJU9614FF/iBK5Bf2IUTjctiGu9o7MSmehluxrumjoSU65Mr8BLhyB1c2T7PMI3SZvAtg5G+Amd+r
	j81FPqtFfNyBYpzny+N7bpqW5m38mui3hABZ9qWCUtJmO7P+EFVIkXae07Mi0TNH7OUOhDFYoe1qC
	x3PmjbMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUbI-000000032ah-0K7W;
	Tue, 29 Sep 2026 09:58:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUb6-000000032Ys-0IRn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 09:58:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 514F560008;
	Tue, 29 Sep 2026 09:58:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2DDD1F000FF;
	Tue, 29 Sep 2026 09:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790675883;
	bh=0/luRpdNvze2pCejIkTcXaz0Po23baj/UwWF7iM1wto=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ogB2QEzth7HT0QX3a0wnderNpXhz0ZZOK2dFMZC1T5OFluPQZi3eYJ8VV6xVnSrPU
	 WABAito16faLT92FOh2pAZu6PftBHzwiIDiZptvqT/gi1g7jghoHMUwkkuQs23/ee6
	 CoeM8/Wb5/WEFosWv53Dd56eyEt9ptn1A49iZiI7DCybkykDHJQ7RG/pPIBthL1gar
	 CDdqndKuEj2PUOkywMzI/USEIB5OC3MhaFcQhJa0QP2I3Pm+Dx0HSzfx4/9JAHG26V
	 X06NVBOOO9tor0tnZ9GWGQ1b6Rw7Wdu4Rbn1kmb9czIFKNA6TyS71dWF43UzXGrdI5
	 qWxCAirpFosoQ==
Date: Tue, 29 Sep 2026 10:57:56 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Peter Maydell <peter.maydell@linaro.org>, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] KVM: arm64: selftests: Check ID regs are
 immutable after a failed run
Message-ID: <aruLlvDysARBIjSZ@gremlin>
References: <20260901-kvm-arm64-idreg-final-v3-0-a0ffa06fa872@kernel.org>
 <20260901-kvm-arm64-idreg-final-v3-3-a0ffa06fa872@kernel.org>
 <arp7mig_PrD9Jbc7@gremlin>
 <83a389d3-6328-4762-a96f-46f9f7145b0e@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83a389d3-6328-4762-a96f-46f9f7145b0e@sirena.org.uk>
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

On Mon, Sep 28, 2026 at 05:31:56PM +0100, Mark Brown wrote:
> On Mon, Sep 28, 2026 at 03:46:51PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Tue, Sep 01, 2026 at 07:18:50PM +0100, Mark Brown wrote:
> > > From: Fuad Tabba <fuad.tabba@linux.dev>
>
> > > Assisted-by: Antigravity:gemini-3.1-pro
>
> > NIT: we changed the rules for the Assisted-by tag, it only needs to be
> > 'Assisted-by: LLM' now. Not a huge big deal but FYI :>)
>
> > https://docs.kernel.org/process/coding-assistants.html
>
> That's Fuad's tag not mine, I've just picked up his change verbatim.

Ack yeah, understood, and it's not a big deal at alL! :)

--
Cheers, Lorenzo

