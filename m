Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2EEC624D3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 11:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYpjpY9VpDbdUoIIwbwVBXNpp2PNQ8zhNKLEb84EfHU=; b=MLBhDUhnshBrVTLe1Ed9Fh3erf
	NUp3k1KRQXiJ15RSw+JNzkWfiuPh8rVpQKmzvW7JL41w8GYHyYGQED2dea0t76k4YT0bBWafuNuPS
	8ci6Pc6zxA878tI7dxFXS95Z6JM4aXzMRumrn3V7ebJuBfozolGT/lj3/Z4BjCUUtnLzmxNvkP+R3
	wlWiykDpzFZSf+iLAPxKuvViID17wocSZO2kW9QVLMmME9HN/v5DABwRfhm04+s6fEaVTxFwwkTJz
	/WqfYdUvlHOsgbwx40e4i5uBiyvm4T7X9DeU2hfjEh31uyHPHfAJQxziRbTT8tQtxuGApKTHkdjXh
	7YjZ+7mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2S6t-00000001pAM-336m;
	Fri, 04 Sep 2026 11:29:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2S6s-00000001pA3-41cU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 11:29:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4468243E1F;
	Fri,  4 Sep 2026 11:29:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A148C1F00A3D;
	Fri,  4 Sep 2026 11:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788521370;
	bh=nYpjpY9VpDbdUoIIwbwVBXNpp2PNQ8zhNKLEb84EfHU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S3CW6oLxq2m/d2er71gcF7/MEcC2C3Zyuzp3q8J50daHhYe3UiXkZJ9KoEaLSd+5C
	 kuMeT3+jZkBRHoYpvzrExZkOtjpBsBGbubNUr52OiR8vHHp5Po+vnb3JqXgQRvpOlr
	 x/bKiZiCrfMaeWqG0efDs7l8s7hs0Y9/hF41NtlZjoNoToxCyO6FbPBkVtM0gNpLKl
	 NIrEsjKSAt2fBa+Vueb3zT08UWPTSBS4mCMwTz0RaGA2xJzjzRL+lXrdjPowASEPXP
	 LalJghHsVQdMYISf+XJPy+8Y2YKuWMvM60Ivcp+S3WnzcPgg2BgezXqOQK01gLxA/k
	 ngQcjBD7Uumgw==
Date: Fri, 4 Sep 2026 12:29:23 +0100
From: Will Deacon <will@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] KVM: arm64: Enable S1PIE for nVHE and hVHE
Message-ID: <apqrky27mJmUV9UA@willie-the-truck>
References: <20260904-kvm-arm64-nvhe-pie-v1-0-29d59f245e6c@kernel.org>
 <20260904-kvm-arm64-nvhe-pie-v1-2-29d59f245e6c@kernel.org>
 <86pkyt4gvt.wl-maz@kernel.org>
 <eb788ad5-5bb3-4767-87b8-d35d9e3ab220@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb788ad5-5bb3-4767-87b8-d35d9e3ab220@sirena.org.uk>
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

On Fri, Sep 04, 2026 at 11:33:24AM +0100, Mark Brown wrote:
> On Fri, Sep 04, 2026 at 08:25:58AM +0100, Marc Zyngier wrote:
> > Mark Brown <broonie@kernel.org> wrote:
> 
> > > When FEAT_S1PIE (stage 1 permission indirection) is supported we
> > > currently enable and use it in the hypervisor when running in VHE mode
> > > but not when running in nVHE or hVHE mode.  While systems with
> > > FEAT_S1PIE would normally use VHE users can configure them for nVHE or
> > > hVHE, for example in order to run protected guests.  Enable FEAT_S1PIE
> > > with nVHE and hVHE.
> 
> > No. nVHE is dead, and I'm not adding support for random stuff that
> > appeared over 10 years after v8.0. If you have S1PIE, you have VHE.
> 
> > If you force the kernel to run with E2H==0, that's your own problem.
> 
> What about pKVM, my understanding was that that is very much an ongoing
> concern and uses the nVHE hypervisor?  My expectation was that this
> would only ever get used in hVHE configurations when people enable pKVM
> on modern hardware, actual nVHE mode was mostly just carried along with
> that.

pKVM uses hVHE wherever it can nowadays, so I'm fine with only supporting
S1PIE on hVHE and VHE configurations if that's easier to maintain. We
just need to make sure that the failure mode for nVHE results in the
feature being gracefully disabled, rather than e.g. crashing or quietly
doing the wrong thing.

Will

