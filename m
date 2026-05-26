Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 990F2CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 12:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m1QRwhQlDfqiNBLKp34h7frboX4SB5UjwEEIE2eefH4=; b=SKJy/1WdFpv5v6GT5AEII6OBGg
	2deuxQJIz0Av/1qn0yvnUi+7HsVVAFvF8ZgKJ23yUXYPNQV18ZxHEX0k4SuxcMIA+th03VU7J+tw0
	+HDaRu6/b9GvK0eugAH/drpN2Wx8ioAwf9FJJhWWPYJP9QVoQCFgAn1uELyRbgE0zwh3hJjjThGSJ
	pLuTh7uA8I4uG9cuZuhKEwM0Zr6WTg/9JlGfXPQ9gwBMCOOJf1qEXxOh+4CH7XvTVjSh6ZwZZ6ZKj
	8K3i6OUQjMmgFlIVv9QADe03wyGUI7TS9gaD8MZbCRX7U+Hzp2CoH/dUClm/i4h0SZpz35SN2DU/w
	H3JVJIHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrI1-00000001ynd-2CYJ;
	Tue, 26 May 2026 12:53:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRrHy-00000001yn4-2wkY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 12:53:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 42E68169C;
	Tue, 26 May 2026 05:53:36 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1662E3F7B4;
	Tue, 26 May 2026 05:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779800021; bh=Nf1wOqkOkww7+3uMdBvetcAtVOV8bY2s9Q9u+8JrwuI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fCQ816MZEwvQhB2vTUsb+mbg5kA1F2C4IaZMzycKOrNWwB2LbaaEHzwx/x2vWCMUv
	 0VBGW3JPYfEOqoTkaXTM/zomWyYwmUvQyq5zn7+cv9lh20KnTJTDCT6Ug1Ak3AHEaC
	 FuM2eMKuzV+aIV7cOOPVVtxu7NZDNLeIYPXZ5NS0=
Date: Tue, 26 May 2026 13:53:35 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Fuad Tabba <tabba@google.com>, Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v10 03/30] arm64/fpsimd: Decide to save ZT0 and streaming
 mode FFR at bind time
Message-ID: <ahWXz4u7cXtG2PS_@J2N7QTR9R3>
References: <20260306-kvm-arm64-sme-v10-0-43f7683a0fb7@kernel.org>
 <20260306-kvm-arm64-sme-v10-3-43f7683a0fb7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260306-kvm-arm64-sme-v10-3-43f7683a0fb7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_055342_829048_385954F5 
X-CRM114-Status: GOOD (  25.89  )
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

On Fri, Mar 06, 2026 at 05:00:55PM +0000, Mark Brown wrote:
> Some parts of the SME state are optional, enabled by additional features
> on top of the base FEAT_SME and controlled with enable bits in SMCR_ELx. We
> unconditionally enable these for the host but for KVM we will allow the
> feature set exposed to guests to be restricted by the VMM. These are the
> FFR register (FEAT_SME_FA64) and ZT0 (FEAT_SME2).
> 
> We defer saving of guest floating point state for non-protected guests to
> the host kernel. We also want to avoid having to reconfigure the guest
> floating point state if nothing used the floating point state while running
> the host. If the guest was running with the optional features disabled then
> traps will be enabled for them so the host kernel will need to skip
> accessing that state when saving state for the guest.
> 
> Support this by moving the decision about saving this state to the point
> where we bind floating point state to the CPU, adding a new variable to
> the cpu_fp_state which uses the enable bits in SMCR_ELx to flag which
> features are enabled.
> 
> Reviewed-by: Fuad Tabba <tabba@google.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>  arch/arm64/include/asm/fpsimd.h |  1 +
>  arch/arm64/kernel/fpsimd.c      | 10 ++++++++--
>  arch/arm64/kvm/fpsimd.c         |  1 +
>  3 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
> index 7361b3b4a5f5..e97729aa3b2f 100644
> --- a/arch/arm64/include/asm/fpsimd.h
> +++ b/arch/arm64/include/asm/fpsimd.h
> @@ -87,6 +87,7 @@ struct cpu_fp_state {
>  	void *sme_state;
>  	u64 *svcr;
>  	u64 *fpmr;
> +	u64 sme_features;
>  	unsigned int sve_vl;
>  	unsigned int sme_vl;

It would be simpler to store the full SMCR value, and remove the
'sme_vl' field. Likewise for ZCR and the 'sve_vl` field.

If nothing else, it would make the format of these fields more obvious,
and easier to reason about.

It would also potentially allow us to extend the VL sanity-check in
fpsimd_save_user_state() to check all the relevant control bits prior to
saving state.

[...]

> @@ -1632,6 +1632,12 @@ static void fpsimd_bind_task_to_cpu(void)
>  	last->to_save = FP_STATE_CURRENT;
>  	current->thread.fpsimd_cpu = smp_processor_id();
>  
> +	last->sme_features = 0;
> +	if (system_supports_fa64())
> +		last->sme_features |= SMCR_ELx_FA64;
> +	if (system_supports_sme2())
> +		last->sme_features |= SMCR_ELx_EZT0;

With my proposal on patch 2, this conditional logic would be
centralised within a helper function.

Mark.

