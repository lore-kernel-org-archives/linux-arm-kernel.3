Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D07BC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 14:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W+2lCKUyGF8/O6BsT294dlEBEwU0x3zSazuq682bNhY=; b=afugvfwjfYPYNTg662iLN7kZKe
	EX5iAi4UoM6wvHspPjdh7xzEoa9nX4gR5uxF+AAVILWflx/JZ9q4TrMK20VPeZSKACG3daU+bePUz
	sNmWVJpJf/ARdYEPceEwqxDQMUsKuhZBHU3s4LTPu4S7JStkUNRPT5k5a7QrD+mCUbEAUb2pE42sf
	vghOzteZoJiVWct5Pr6ZArWe0q7bWjI3PTNWbqZjmPPUclJwEHDGRnOIRaMc9CT1uZzHbHAV4vDxa
	frNW/ye1jQL3UhQDgmpxuEQEmqaZhYUUj21FogpYmD8YDmrg/tzTCg9UoBHliVKDzDEy7CDmihf/j
	h8oKG9xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x28NW-0000000HVcY-0WJi;
	Thu, 03 Sep 2026 14:25:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x28NU-0000000HVbs-0DFz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 14:25:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7DD541596;
	Thu,  3 Sep 2026 07:25:13 -0700 (PDT)
Received: from LeoBrasDK.cambridge.arm.com (LeoBrasDK.cambridge.arm.com [10.2.212.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DCC123F673;
	Thu,  3 Sep 2026 07:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788445517; bh=FAjoOuGipr40QiwzM2evOA8xAZV5FlCngQRcbypDFLA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=C0hi7Ch2VkJHWm6dS0wldrgEsQ35FIqApi7yGdjic/mCO3EGqZ9dqFwT/BpLpIHQ4
	 CY/+w2G0Eq/CsUvAJqs6oDz28uwhXFR2xWCToD9vWUI5EnKqO8nRSLW1zCkmLkC0Vm
	 9mwQhfyz+w0/XUoR1eAgrrEdwDdwBtbuZ3XxhEfE=
From: Leonardo Bras <leo.bras@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Leonardo Bras <leo.bras@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Peter Maydell <peter.maydell@linaro.org>,
	Wei-Lin Chang <weilin.chang@arm.com>,
	Yao Yuan <yaoyuan@linux.alibaba.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v20 05/14] KVM: arm64: Set PSTATE.EXLOCK when entering an exception
Date: Thu,  3 Sep 2026 15:25:09 +0100
Message-ID: <apmDRXBvS-XOi1NJ@LeoBrasDK>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260901-arm64-gcs-v20-5-f31750bdfadb@kernel.org>
References: <20260901-arm64-gcs-v20-0-f31750bdfadb@kernel.org> <20260901-arm64-gcs-v20-5-f31750bdfadb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_072520_130293_2809718D 
X-CRM114-Status: GOOD (  13.22  )
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

On Tue, Sep 01, 2026 at 10:47:03PM +0100, Mark Brown wrote:
[...]
> +	/* When taking an exception to a higher EL EXLOCK is cleared. */
> +	if ((mode | PSR_MODE_THREAD_BIT) != target_mode)
> +		return 0;

"Higher" is mentioned here, but the comparison is a "!=", so I suppose 
here we trust the fact that we always have "mode <= target_mode", and only 
2 possible target exception levels (EL2h and EL1h).

It's a nit, but maybe a "<" here would be more clear?

The rest of the code seems correct based on R_WTXBY.

[...]
>  
> +	// PSTATE.EXLOCK is set to 0 upon any exception to a higher
> +	// EL, or to GCSCR_ELx.EXLOCKEN for an exception to the same
> +	// exception level.  See ARM DDI 0487 R_WTXBY.
> +	new |= compute_exlock(vcpu, mode, target_mode);

Same nit: am I really setting one bit here? or could be 
more stuff depending on the parameters? Having an "if (cond) new |= bit"
seems more clear to what is being done, without needing to read the comment 
above.

In any case, FWIW:

Reviewed-by: Leonardo Bras <leo.bras@arm.com>

Thanks!
Leo

