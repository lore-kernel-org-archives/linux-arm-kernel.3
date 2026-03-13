Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E089105F789
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 09:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R5BQ40AB3tNyoXZiH+BiK3tESl7GRxiIMKHtAS+yiy4=; b=u8e26kd1CztuGyk3xoOKN0tWOK
	fLSkshw68/p2k+u8vwyN7koT3bxs0aHGCzIN2fpbXISscnTLLqnHWDzgrkSI2qpFVRJueHtOakTHo
	a/nm/2e3gmC6HMLNL774bDN5TAQn2OHOKVatGKqNT79fjcsodomdKUJDRyHSry0QCvsfNjJVaW/uC
	Tc1Hifr3f6NVVmz7pj0hlNEgU8iCMCs0Z8fM3epFC6mQ2KUoZxC6H34oHVDOLmlf9X7PjBkZHf9fz
	sBYbp1tw42p6VzS/ZRT40vxvjwLFU9lpoBb12efBsq31q1aF7vElnIVgpJmpLfVXuYEwxrEXEkvwl
	KtaWlYHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zGS-0000000HSXx-2C8r;
	Fri, 13 Mar 2026 09:57:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0zGQ-0000000HSX0-15ks
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 09:57:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B3533165C;
	Fri, 13 Mar 2026 02:56:54 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 697293F73B;
	Fri, 13 Mar 2026 02:56:58 -0700 (PDT)
Date: Fri, 13 Mar 2026 09:56:55 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org, will@kernel.org, maz@kernel.org,
	oupton@kernel.org, miko.lenczewski@arm.com, kevin.brodsky@arm.com,
	broonie@kernel.org, ardb@kernel.org, suzuki.poulose@arm.com,
	lpieralisi@kernel.org, joey.gouly@arm.com, yuzenghui@huawei.com
Subject: Re: [PATCH v15 7/8] KVM: arm64: use CAST instruction for swapping
 guest descriptor
Message-ID: <abPfZ27gbcBoAhEi@arm.com>
References: <20260227151705.1275328-1-yeoreum.yun@arm.com>
 <20260227151705.1275328-8-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260227151705.1275328-8-yeoreum.yun@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_025702_333273_E6C0E08B 
X-CRM114-Status: GOOD (  10.73  )
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

On Fri, Feb 27, 2026 at 03:17:04PM +0000, Yeoreum Yun wrote:
> +static int __lsui_swap_desc(u64 __user *ptep, u64 old, u64 new)
> +{
> +	u64 tmp = old;
> +	int ret = 0;
> +
> +	/*
> +	 * FEAT_LSUI is supported since Armv9.6, where FEAT_PAN is mandatory.
> +	 * However, this assumption may not always hold:
> +	 *
> +	 *   - Some CPUs advertise FEAT_LSUI but lack FEAT_PAN.
> +	 *   - Virtualisation or ID register overrides may expose invalid
> +	 *     feature combinations.
> +	 *
> +	 * Rather than disabling FEAT_LSUI when FEAT_PAN is absent, wrap LSUI
> +	 * instructions with uaccess_ttbr0_enable()/disable() when
> +	 * ARM64_SW_TTBR0_PAN is enabled.
> +	 */
> +	uaccess_ttbr0_enable();
> +
> +	asm volatile(__LSUI_PREAMBLE

I haven't tried, so just asking. Does the toolchain complain if it does
not support LSUI or is this path eliminated (due to
cpucap_is_possible()) before being handed over to gas? It's probably
fine but worth checking.

-- 
Catalin

