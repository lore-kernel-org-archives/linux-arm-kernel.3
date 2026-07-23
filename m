Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FF5C531CB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 12:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ozfq5gikbCoWJbMbKjAazD55EdoqLFPDxpnp89eTylA=; b=Sd2yMhVCyW+NLPd9t8ZtnMTz62
	zf+sxA+AI6p/XHfy2WMhJs9iHprVi+nMRyu5yWEwWUmjQVI4MJ9Jlo3/KTpSfDFzjZ8ew7bI0n4bR
	w6aJJ1oReKbSAED9YfJFXVSvL5x7OEkqtpqM4V3OuZuLP5HLthuDoFXe3l9IfsNZklvr4nxOp2GDG
	16rH7dmBcMNqZDDQwk1e0LyC1mz7P7Du+rQuqGi9jOopx7Aegl//wuNn58VovOkF5N3pmbUiNGLLK
	kQiJIZxmQNCcSJI0NDG1h1ueHqyKSZF0qZgXGCRSmiKDFDt4JUHayU5TbLgkIqeMnhCg696cxjJvs
	ZQkSx0rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmt0J-0000000EJ87-33tQ;
	Thu, 23 Jul 2026 12:58:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmt0G-0000000EJ6l-2IdO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jul 2026 12:58:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C24621595;
	Thu, 23 Jul 2026 05:58:12 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF5C93F59E;
	Thu, 23 Jul 2026 05:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784811496; bh=tS3qt0hTqrRoA8Eare5/U/grQvdhUHhuH5FDy08Szas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JCu95jwuHdwvgEvwvBRQDHTAQhAyscg4Z8nM8CbNlXkEBNN9gvC/tjSRPEY9AmFXQ
	 YlOHo0P+NdKWLi4XGlyaQyNr57TtZJX3FgvYYRvRnaRCalGAv6LHFycsfnB6W1ne1S
	 ROoF87dO/gNP+odtZMxPE972Iu4paqR7pLVdgbOc=
Date: Thu, 23 Jul 2026 13:58:11 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>, Dave Martin <Dave.Martin@arm.com>,
	Fuad Tabba <tabba@google.com>, Ben Horgan <ben.horgan@arm.com>,
	Jean-Philippe Brucker <jpb@kernel.org>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>
Subject: Re: [PATCH v13 02/32] arm64/fpsimd: Ensure all of ZCR_EL1 is
 initialised from idle
Message-ID: <amIP42yILYNsNk0e@J2N7QTR9R3.cambridge.arm.com>
References: <20260720-kvm-arm64-sme-v13-0-d9abd3ffa245@kernel.org>
 <20260720-kvm-arm64-sme-v13-2-d9abd3ffa245@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720-kvm-arm64-sme-v13-2-d9abd3ffa245@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_055820_627828_3744FAE4 
X-CRM114-Status: GOOD (  15.92  )
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

On Mon, Jul 20, 2026 at 12:07:29AM +0100, Mark Brown wrote:
> At present when exiting from idle we do not fully reinitialise ZCR_EL1,
> we update ZCR_EL1.LEN with a read/modify/write cycle when loading task
> state but never set any of the other bits to an explicit value.  Since
> currently they are all architecturally RES0 or RAZ/WI this is not a
> practical issue but it may become one if further fields are defined in
> the register so we should explicitly configure the whole register.
>
> Rename the existing sme_suspend_exit() (which handles this for SME) to
> fpsimd_suspend_exit() and add set ZCR_EL1 to 0 there, if needed LEN will
> be updated when loading task state.
>
> Signed-off-by: Mark Brown <broonie@kernel.org>

While this happens to work today, this is a more general architecture
problem, and I think we should cc stable such that kernels will work
reliably on future hardware.

All stable kernels support SVE, so this needs to go as far back as
v5.10.y.

One minor comment below, but with that fixed up (and a CC stable):

Acked-by: Mark Rutland <mark.rutland@arm.com>

> +void fpsimd_suspend_exit(void)
>  {
>  	u64 smcr = 0;
>  
> -	if (!system_supports_sme())
> -		return;
> +	if (system_supports_sve())
> +		write_sysreg_s(0, SYS_ZCR_EL1);
>  
> -	if (system_supports_fa64())
> -		smcr |= SMCR_ELx_FA64;
> -	if (system_supports_sme2())
> -		smcr |= SMCR_ELx_EZT0;
> +	if (system_supports_sme()) {

We should move the 'smcr' variable into this block. That way it's scoped
to where it matters.

> +		if (system_supports_fa64())
> +			smcr |= SMCR_ELx_FA64;
> +		if (system_supports_sme2())
> +			smcr |= SMCR_ELx_EZT0;
>  
> -	write_sysreg_s(smcr, SYS_SMCR_EL1);
> -	write_sysreg_s(0, SYS_SMPRI_EL1);
> +		write_sysreg_s(smcr, SYS_SMCR_EL1);
> +		write_sysreg_s(0, SYS_SMPRI_EL1);
> +	}
>  }

Mark.

