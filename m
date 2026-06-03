Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA286CD6E64
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 10:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6wCfr6/7knRhe+IqQ2aSY7si3mhzsIUgoMiVtIEFUs=; b=bCOJ5Z52rYjsdzSzylFaH9CUDd
	oK4CA3qx+vx6LEr2BBU5cfTKhY0PLVXHUlxyKL7xA86QeLGrtnGyedlnfuM2ZY2lGyKN6ZdjaYsuS
	oxdzUVj1IA7lkdq4Hx2dX9Hcu2U6YXwWqBpVoGwZ0Ofkv/hOwKZj8fHKwqhnbBpvlpOd06GhwzJyY
	HVbwsDDSZstGQO5cMJmB6fd3o7bXCMpfLLdVMg7HK0GWqI3zHeusSlvd9lZACmFfx/jarDIFHbP0t
	JGixPsJ4deG9umaQ9b40RNrAYiThtBnLk2I77NqOBEhGt2rsWjfntk6QP9K/3TzYXWosccSN7v+iG
	hpH2Cr0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUj2n-0000000EprY-3l3b;
	Wed, 03 Jun 2026 10:41:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUj2l-0000000EprC-1bfW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 10:41:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B539B49DB;
	Wed,  3 Jun 2026 03:41:42 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 969383F632;
	Wed,  3 Jun 2026 03:41:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780483307; bh=h+ZuVSoyn2f1R6RNdPoshSsNv4hvAn9pMDfj8Vd1zOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TeqeoHSI/x9EM81iEnVCF0ARFOYjblxXEGhx4L1AwcrKZ/mx+ECZwGz0yV4flC78l
	 C/vUc8LSL7MLbs4lCfASYAfEuB+3YUcVRO1dTgBZDy8ncjfTuGgKu92Ep9SeedXpeH
	 /ywK9Tc7Bz2NaHBXdyvP1aEsPCYYDjGqg2RLes4M=
Date: Wed, 3 Jun 2026 11:41:42 +0100
From: Joey Gouly <joey.gouly@arm.com>
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org, Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>, Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 0/3] KVM: arm64: FEAT_{S1POE,ATS1A} support fixes
Message-ID: <20260603104142.GA2078466@e124191.cambridge.arm.com>
References: <20260602155430.2088142-1-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602155430.2088142-1-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_034151_459558_9359938A 
X-CRM114-Status: GOOD (  13.76  )
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

On Tue, Jun 02, 2026 at 04:54:26PM +0100, Marc Zyngier wrote:
> Whilst working on a slightly unrelated feature (FEAT_NV3), I found out
> that an L2 guest wouldn't boot if the host was exposed to FEAT_S1POE.
> 
> Upon investigation (and hours wasted in a SW model), it became
> apparent that while the AT S1E1A code was ready for action, it had
> never been fully plugged in (blame the usual suspect...).
> 
> This resulted in an extremely odd failure mode, with an L2 being
> unable to make forward progress, but KVM at L1 not taking the hint
> that something was really wrong. Additionally, an embarrassing typo
> was spotted in the CPTR_EL2 handling.
> 
> With this in, FEAT_S1POE no longer breaks our NV guests.
> 
> Marc Zyngier (3):
>   KVM: arm64: Key CPTR_EL2.E0POE propagation on FEAT_S1POE
>   KVM: arm64: Wire AT S1E1A in the system instruction handling table
>   arm64: cpufeature: Expose ID_AA64ISAR2_EL1.ATS1A to KVM
> 
>  arch/arm64/kernel/cpufeature.c          | 1 +
>  arch/arm64/kvm/hyp/include/hyp/switch.h | 2 +-
>  arch/arm64/kvm/sys_regs.c               | 1 +
>  3 files changed, 3 insertions(+), 1 deletion(-)

Reviewed-by: Joey Gouly <joey.gouly@arm.com>

Thanks,
Joey

