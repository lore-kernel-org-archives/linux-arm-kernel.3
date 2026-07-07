Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F07C44500
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 08:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lnlzL0KpJ9QqM6hC9iBx7qV7lok+T8DRt7jvPTT0Rec=; b=w99ohw9+CjVWGM7r4WN9EpqyWl
	rDYo+HtpoG0EATuhu7VF/gi6wmGV8HW1/hFVyvkl1SUlXroqv3GmUPUR+tRElqIvx2pouZu0c5Fgh
	elkR7D9chyXO+vXFtL3v0JIxopJl0moZxVsG6KUw+CDbkMdxphMGNP20qEO+qTv4W1TBgNn8a9cjF
	tvgpysYED1pWF9ia1LVUJ8plElU8TePIE/0J53/FZNA3zsYeszpZoeHoBinrOwittYfnqfd85Kylx
	TO7ljoksvOlSxTLgOalUXfaHI/NXUDuriMXlE2u9AUDvkDmlOKyh2nZ/I7/ZUSpH5M5Atf8IAsIKX
	C/Lkd6zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0sn-0000000EQRE-0bWu;
	Tue, 07 Jul 2026 08:10:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh0sl-0000000EQR6-2y7I
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 08:10:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 29E45618A8;
	Tue,  7 Jul 2026 08:10:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90DE31F00A3A;
	Tue,  7 Jul 2026 08:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783411818;
	bh=lnlzL0KpJ9QqM6hC9iBx7qV7lok+T8DRt7jvPTT0Rec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iz6ynNHyejKVsbakGkrHkbKba2CbrnlOqJjuKQSYnFwqiYr/UzDW6vVpNFfQ3BuWU
	 6pNNZ7rFUfkZUkffMXJWIc2S658G8QwKxCH4HoN8hsaMOJFYfZs54ArAfDieA0TvYU
	 +qd/3m6a++PuRtOUrEELCHrY0RFP2cGf6hFxMVPGDaVlR6n8FMWJDTwdzsTq1SWPAh
	 U2EOmsq2JENnhHbBgGJlZAojIoR6RPLnl+cAVCIVnLqzAFdMA9Vg0rAEOYfk4zDpjJ
	 1AbKJGJ0FnNRDHVRW/GYsPhIW2ykD8JIGQE5/0aR1S9TeyFKRd8F+3lCxInOVa5Yi8
	 31Z4DGG69kdwA==
Date: Tue, 7 Jul 2026 01:10:17 -0700
From: Oliver Upton <oupton@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v8 0/7] KVM: arm64: PMU: Use multiple host PMUs
Message-ID: <aky0abet4NfzK4z8@kernel.org>
References: <20260706-hybrid-v8-0-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
 <akvzxDwZbj_sZ4pI@kernel.org>
 <86bjcjp6x1.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86bjcjp6x1.wl-maz@kernel.org>
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

On Tue, Jul 07, 2026 at 08:58:50AM +0100, Marc Zyngier wrote:
> On Mon, 06 Jul 2026 19:28:20 +0100,
> Oliver Upton <oupton@kernel.org> wrote:
> > 
> > On Mon, Jul 06, 2026 at 07:03:23PM +0900, Akihiko Odaki wrote:
> > > Akihiko Odaki (7):
> > >       KVM: arm64: Disallow vPMU when pPMUs do not cover all CPUs
> > >       KVM: arm64: PMU: Protect the list of PMUs with RCU
> > >       KVM: arm64: PMU: Pass the pPMU to kvm_map_pmu_event()
> > >       KVM: arm64: PMU: Pass the target CPU to kvm_pmu_probe_armpmu()
> > >       KVM: arm64: PMU: Implement fixed-counters-only emulation
> > >       KVM: arm64: PMU: Introduce FIXED_COUNTERS_ONLY
> > >       KVM: arm64: selftests: Test PMU_V3_FIXED_COUNTERS_ONLY
> > 
> > Thanks for respinning the series, I left some comments. I'd really like
> > to get this feature picked up, hope you have cycles to work on it soon.
> > 
> > FWIW, we're considering adding a new vCPU feature flag to deprecate all
> > the ugliness of the old PMUv3 UAPI. I'm tempted to say that the
> > FIXED_COUNTERS_ONLY feature is conditioned on the new feature flag...
> 
> It'd be good to have a strawman proposal on the list if we are going
> to change add a new API, specially if this is likely to gate new code.
> 

Patch 1 [*] of the series I linked does exactly this, no? Needs some
attention like a KVM_CAP to make the bit discoverable by the VMM but
gets the general idea across.

[*]: https://lore.kernel.org/kvmarm/20260702190421.420992-2-congkai@amazon.com/

Thanks,
Oliver

