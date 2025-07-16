Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AE3C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 16:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLeTs7FZjD4WJ4kxGKwc0GaLx29L2ONQcpWFPljBYmo=; b=whYewh1XVUzI/id1cCxnrg2EtQ
	/Z35yTsdVO6vgIFE55RdI2FEav6Fqq7iERnhwbm+nKtZCRGIGlK8BCoUmyurwsbG4R8adyBwbckBp
	KHg2gITEi9xuSH9hF2HGlZo0UAMWw3CdpCBS+UnbJwb0j3PGhStC73x7d1OCboD+9p7p3+5vDkdbj
	WtG+embT30j1kCkCqh3Lv916m9taLIkSuZbLDYUAopLKajyW9UgTdAD6SfB5n5ykp5nY1tSu407Sr
	KD1tDj3t0QSnyFh3R8wwV1zifHFw0QATfpC+7ujFC6F9LZqqCCXz26xPxUm6BdiKAAIf2Rlum5u4r
	as1W3mqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc5Ni-00000008EAE-3lFl;
	Wed, 16 Jul 2025 16:53:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc5Ix-00000008DbW-27XB
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 16 Jul 2025 16:48:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dLeTs7FZjD4WJ4kxGKwc0GaLx29L2ONQcpWFPljBYmo=; b=Fd8Hm6xqzHGTiQMH+A9Xv2O6iB
	e9yvLWTlCB9+Spx/LXE/sWoLzgsEHotNCIN/qJ0wXHPjiZ229lXptaLUweCLbpeh7vk8gwaUEPUzn
	hwGYF+a4WP7KXp2zbsRq1fW1n30QlKb0kVbZiaSeX42nN+FG7KP2xwl9VQv+t5wHoVgNBpDuqu7Yf
	VvD3gtPclDdgytVjnn2+5GdimEDolFdXtvrltW7RyL610bzO2nlgNN0yWKRUhYWWBEbRoqqetdpG7
	7fXewJpRmgMwjP2UNjCtvg3TvK+v0swbIdkG0Rx3/piw3erZ2Onc3oQZv1YIAEjKWOpyb2v/Y6LwX
	pFqP3CAw==;
Received: from out-182.mta1.migadu.com ([95.215.58.182])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc5It-0000000A8Tc-0Hh4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 16:48:26 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752684493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dLeTs7FZjD4WJ4kxGKwc0GaLx29L2ONQcpWFPljBYmo=;
	b=Pjt3hVxAAPI5DQD3d/xhtNQ4TvfdzRo47XlJhBw1vrtwqkKb8QDYBQ7/GLI/fW0qfFmyn0
	DI89u4nTkvomLnprtdtM5+l973E29Q6If40UREFo6ErK6LaLWqxHlkjZq/9yPNLpksBKmM
	eBMmBrPqop+EWNuwcUKCqeXo1FxaveQ=
From: Oliver Upton <oliver.upton@linux.dev>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org,
	Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 0/5] KVM: arm64: Config driven dependencies for TCR2/SCTLR/MDCR
Date: Wed, 16 Jul 2025 09:47:54 -0700
Message-Id: <175268446558.2457435.12236491763380805714.b4-ty@linux.dev>
In-Reply-To: <20250714115503.3334242-1-maz@kernel.org>
References: <20250714115503.3334242-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_174823_973926_76BE2200 
X-CRM114-Status: UNSURE (   7.25  )
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

On Mon, 14 Jul 2025 12:54:58 +0100, Marc Zyngier wrote:
> Here's a very short (and hopefully not too controversial) series
> converting a few more registers to the config-driven sanitisation
> framework (this is mostly a leftover from the corresponding 6.16
> monster series).
> 
> Patches on top of -rc3.
> 
> [...]

Applied to next, thanks!

[1/5] arm64: sysreg: Add THE/ASID2 controls to TCR2_ELx
      https://git.kernel.org/kvmarm/kvmarm/c/a3ed7da911c1
[2/5] KVM: arm64: Convert TCR2_EL2 to config-driven sanitisation
      https://git.kernel.org/kvmarm/kvmarm/c/001e032c0f3f
[3/5] KVM: arm64: Convert SCTLR_EL1 to config-driven sanitisation
      https://git.kernel.org/kvmarm/kvmarm/c/6bd4a274b026
[4/5] KVM: arm64: Convert MDCR_EL2 to config-driven sanitisation
      https://git.kernel.org/kvmarm/kvmarm/c/cd64587f10b1
[5/5] KVM: arm64: Tighten the definition of FEAT_PMUv3p9
      https://git.kernel.org/kvmarm/kvmarm/c/3096d238ec49

--
Best,
Oliver

