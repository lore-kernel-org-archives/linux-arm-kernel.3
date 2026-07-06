Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC13C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 18:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+aIUat1jATCZ6Y0HWmZRfqf3fPfOHunP2DqpN7t2mWI=; b=2SUb6KyTEgIxxolOouDEZKEy40
	ddA7QGLYmfo2sQUxSm7tsjwGZ3RBt2Y9qNmWPjXPQyW1x9Fmcf7ha8ZQnZOd8mZtJt+TGE3rxL9mp
	6RAjZ6tADXMC2AoFpLnDUuVUSGJBwAG+m2gnTGrIVk21404dbXO2m30ITvpZTyeDqQaosgHpTSvsB
	lqTGlsRoBRCObsRg1iHGlxsZg9huqFeZ4Py+ck66op2khjr+1I/xbo/LnccUlzUj/sgKr65xRRkfI
	VlRLmca+XUheyyfjxK0KxyQQy/449IoLwXB0gnDA5sTnxYOmBlgmp5MXWoreoORsNPRV3RrJwXTdW
	w1mZETFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgo3L-0000000DLSz-3fQs;
	Mon, 06 Jul 2026 18:28:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgo3K-0000000DLSS-2gPq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 18:28:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 59803404A5;
	Mon,  6 Jul 2026 18:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE1851F000E9;
	Mon,  6 Jul 2026 18:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783362502;
	bh=+aIUat1jATCZ6Y0HWmZRfqf3fPfOHunP2DqpN7t2mWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OtEwGHPJb9dNat2pDDCdWaRNwPuhB79FT/k4d7QeHvuOpngT7uk2YJXIpwxRU7dSg
	 hL7ucRIloAeRfJyWtxjsIMObTY7Ur5FgnUBD0MNnBdPcrrvqwf/CuQk7iTWvgdUEkl
	 if+rWtqzNlxH/rQ6PYRip0/b/3RlnA/B/z4ZhPV50WrvewSrTwxscvXYFeOR2orJau
	 ssmhBD5FkRnAut7zPu6ciMjVNxD2mTeRWqXc/iuPleBVPDsuP1NjkDLSmFK+9ehpuj
	 H3zvnlwueIcKxIbpoT0tdcA+Wu9pae7LIKouhwFaHjOuLzd9eh939HFMuTvUivL2VU
	 jp6qcVhrimzdA==
Date: Mon, 6 Jul 2026 11:28:20 -0700
From: Oliver Upton <oupton@kernel.org>
To: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
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
Message-ID: <akvzxDwZbj_sZ4pI@kernel.org>
References: <20260706-hybrid-v8-0-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-hybrid-v8-0-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
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

On Mon, Jul 06, 2026 at 07:03:23PM +0900, Akihiko Odaki wrote:
> Akihiko Odaki (7):
>       KVM: arm64: Disallow vPMU when pPMUs do not cover all CPUs
>       KVM: arm64: PMU: Protect the list of PMUs with RCU
>       KVM: arm64: PMU: Pass the pPMU to kvm_map_pmu_event()
>       KVM: arm64: PMU: Pass the target CPU to kvm_pmu_probe_armpmu()
>       KVM: arm64: PMU: Implement fixed-counters-only emulation
>       KVM: arm64: PMU: Introduce FIXED_COUNTERS_ONLY
>       KVM: arm64: selftests: Test PMU_V3_FIXED_COUNTERS_ONLY

Thanks for respinning the series, I left some comments. I'd really like
to get this feature picked up, hope you have cycles to work on it soon.

FWIW, we're considering adding a new vCPU feature flag to deprecate all
the ugliness of the old PMUv3 UAPI. I'm tempted to say that the
FIXED_COUNTERS_ONLY feature is conditioned on the new feature flag...

https://lore.kernel.org/kvmarm/20260702190421.420992-1-congkai@amazon.com/

Thanks,
Oliver

