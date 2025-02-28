Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73D3C19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 09:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xv6pZalwrXme9baFyWmsdEZnRmanzletEI9BwGhOKQw=; b=snxMmzC7oPSWLGmSq8Ax6YAzg9
	j5dQdbCJES/IunUJXrYtornq306OeamQXhU6kyxfTDKYleI0KjUAtZxE5qBLeo9GsVs0zYL3En04o
	6GdGtpMtZ2jBC4by0uSuyt+fE7XQvERGcyTuyRYJ76Dco/u1MclU6BbqHbkLP3mvAjILx2qJKWMVm
	/MFB2d5xoZ20cVXfxoQWibWkVTX5wgqp60vnYxZDvovuYNLhtEgrSKqtTOzQYykkvLe7e3prcix+B
	WZF9pcsSWQskQJtkbD6HpUbf+8F7neNg/JbnzjAWO5ThtjgJ3p/4mkzdKDMp8oQRjk83DELRPGOqv
	KOwUQoQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnwjb-0000000ANrm-1GXF;
	Fri, 28 Feb 2025 09:32:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnwh2-0000000AMzD-35Ep
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 09:30:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 79A751515;
	Fri, 28 Feb 2025 01:30:15 -0800 (PST)
Received: from localhost (e132581.arm.com [10.2.76.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC9783F673;
	Fri, 28 Feb 2025 01:29:59 -0800 (PST)
Date: Fri, 28 Feb 2025 09:29:55 +0000
From: Leo Yan <leo.yan@arm.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, ahmed.genidi@arm.com,
	ben.horgan@arm.com, catalin.marinas@arm.com, kvmarm@lists.linux.dev,
	maz@kernel.org, oliver.upton@linux.dev, will@kernel.org
Subject: Re: [PATCH 1/2] KVM: arm64: Initialize HCR_EL2.E2H early
Message-ID: <20250228092955.GC2157064@e132581.arm.com>
References: <20250227180526.1204723-1-mark.rutland@arm.com>
 <20250227180526.1204723-2-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227180526.1204723-2-mark.rutland@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_013004_826254_13A252A1 
X-CRM114-Status: GOOD (  13.68  )
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

Hi Mark,

On Thu, Feb 27, 2025 at 06:05:25PM +0000, Mark Rutland wrote:

[...]

> +.macro init_el2_hcr	val
> +	mov_q	x0, \val
> +
> +	/*
> +	 * Compliant CPUs advertise their VHE-onlyness with
> +	 * ID_AA64MMFR4_EL1.E2H0 < 0. On such CPUs HCR_EL2.E2H is RES1, but it
> +	 * can reset into an UNKNOWN state and might not read as 1 until it has
> +	 * been initialized explicitly.

For ID_AA64MMFR4_EL1.E2H0 < 0 case, the code actually clears the
HCR_EL2.E2H bit.

Hence, the comment should be corrected as: "... it can reset into an
UNKNOWN state and might not read as 0 until it has been initialized
explicitly".

> +	 *
> +	 * Fruity CPUs seem to have HCR_EL2.E2H set to RAO/WI, but
> +	 * don't advertise it (they predate this relaxation).
> +	 *
> +	 * Initalize HCR_EL2.E2H so that later code can rely upon HCR_EL2.E2H
> +	 * indicating whether the CPU is running in E2H mode.
> +	 */

I think it is even better to clear the HCR_E2H bit first. This can
avoid any dependency on the passed parameter 'val'.

        bic     x0, x0, #HCR_E2H

> +	mrs_s	x1, SYS_ID_AA64MMFR4_EL1
> +	sbfx	x1, x1, #ID_AA64MMFR4_EL1_E2H0_SHIFT, #ID_AA64MMFR4_EL1_E2H0_WIDTH
> +	cmp	x1, #0
> +	b.lt	.LnVHE_\@
> +
> +	orr	x0, x0, #HCR_E2H
> +.LnVHE_\@:
> +	msr	hcr_el2, x0
> +	isb
> +.endm

