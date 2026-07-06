Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1E0C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 17:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=REmuzwIaNWYa8LGBVvGUzNpeujzoKq+eMU1Gq13kbjc=; b=yU0uExxJUL362ahpHGQbrLC/8U
	jRcbOzC5WP7GrksD9hRD/+NqhqbDli7fGPb9AA22vYy2fQMYyd9TFm6dwvLT8q2+4eRh0t1Nxhe+m
	PGU00dadyUU8Uz/F0fvJGcjZVdQlQs79iM6lRrF5V5XXgjVivBAVsZtRXPAf/P5qp697PxfW3CodN
	IiX2ZSqbibIlwdJ4xFlKGPSxPb+XHrDhCGizA5xbZ+DaZ2M054hJf6K8PWbg96YxqNnfkpghgR+cy
	P/bsgmMWjqdy9cyoeMpFJrqfmUUv6Px/zoPPH7gl5Hy4BGkjJRPDsi7dEWufQiUkiUAqhsc3vHFeH
	P7gdqmvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmkI-0000000D9Or-3RYW;
	Mon, 06 Jul 2026 17:04:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgmkH-0000000D9Oi-2PJl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 17:04:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4D529437B3;
	Mon,  6 Jul 2026 17:04:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9FE31F000E9;
	Mon,  6 Jul 2026 17:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783357475;
	bh=REmuzwIaNWYa8LGBVvGUzNpeujzoKq+eMU1Gq13kbjc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gyaaNu0DZ3lY+wpZZZxQ/iX7UMQqh0yyWYHoi78HU774kBB/02mxwoerTE+/DOWYp
	 ftBdYzRQvBWyb/29euRzLW3wmTKXWID7tadSd+Nb97HQ7Lw24Q07dQc6tis00rC92/
	 8xZPYUxbdNceoDK6j/iBacm63/gI7YctudjwjYi4ceHK5RpWkagVWH7umCwngTYW8+
	 jtsPBAUVsgiN2pTUkDm/0+7BMFzZCznXpYKvpmV6GwD+WlIHud9o4aaWD5Cu3YNgOe
	 hDWiQNhcSgbvwgEyZXnd/V4YDoYbh9ZojTux/OFUUB/09bWTQe07B9eRAbrcWc2BXO
	 kT/8DfH8xtg5w==
Date: Mon, 6 Jul 2026 10:04:33 -0700
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
Subject: Re: [PATCH v8 1/7] KVM: arm64: Disallow vPMU when pPMUs do not cover
 all CPUs
Message-ID: <akvgIWqBjAp_VA_A@kernel.org>
References: <20260706-hybrid-v8-0-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
 <20260706-hybrid-v8-1-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706-hybrid-v8-1-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
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

Hi,

On Mon, Jul 06, 2026 at 07:03:24PM +0900, Akihiko Odaki wrote:
> Commit ec3eb9ed6081 ("KVM: arm64: PMU: Disallow vPMU on non-uniform
> PMUVer") made KVM reject vPMU unless the system-wide PMUVer is usable.
> That covers systems where PMUv3 is absent or non-uniform, as well as
> systems where IMPDEF PMUv3 sysreg traps are unavailable.
> 
> However, KVM can still accept vPMU when all CPUs uniformly trap PMUv3
> sysregs, but the pPMUs registered with KVM only cover a subset of
> possible CPUs.
> 
> Reject vPMU unless the registered pPMUs cover every possible CPU.
> This avoids carrying support for partial pPMU coverage into the
> fixed-counters-only UAPI introduced later in the series.

Doesn't CPU hotplug screw this up? I could online a CPU that doesn't
have a PMU after creating the VM.

I'd rather just change ARM64_WORKAROUND_PMUV3_IMPDEF_TRAPS to become a
system feature. That way any CPU which breaks the system-wide assumption
cannot be onlined.

Thanks,
Oliver

