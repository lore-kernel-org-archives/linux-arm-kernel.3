Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16797C369A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 22:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=icbPkrkUd1De4/wRlfQxCHPa3ucnmbOW4BGuGjTGkgM=; b=ZzNYl4rGo2RLdUbJECxrCxd5lH
	SvDUIfdHrthrQQV5DUoTNW0ZfJQd+z8mZETzu03B+pWteNzZpqceeJ3PuBFOWWUnb3n7Z2lQtG7Fh
	idpq8m8KPl2ne//9pJtfGYnIp9pap6IaYx4AJAtNmmGkrK9UPiQ7r6nibe+1l49z4c5dW7AXibN/N
	H7nM1y3825+CVESMbbDN1zadlFF+AHZdyX/1OZc1p2psZMw1U7XrfdW3e7np2yNLiCRJtvvRQROS6
	Ql3YW7C5JyJbEsgIaW4gTSG4c7+9ATZZGNpLjGx5rdihXVCyuN3iqNntE/7LOHqU+EhwXSOzUvsSz
	1y4x0L0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ppU-0000000D1AH-28Ow;
	Fri, 04 Apr 2025 22:48:04 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0pnj-0000000D0wY-0Uax
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 22:46:16 +0000
Date: Fri, 4 Apr 2025 15:46:01 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743806772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=icbPkrkUd1De4/wRlfQxCHPa3ucnmbOW4BGuGjTGkgM=;
	b=QRFDrlVXyeKYm2auWsnzd21S31ggUiVTESz37sca/elBzIWiLNknM2FIh5SUSNnCRe54b0
	sjQO6yUYmITskjDTi/PpqBwTl26+n2loNJ8I11WPulIigWcmGzePbbUy9Cyk3amqBVg/6I
	BLVUr6+FIXMOnJxuxpCWz5b68q7rF50=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Raghavendra Rao Ananta <rananta@google.com>
Cc: Marc Zyngier <maz@kernel.org>, Mingwei Zhang <mizhang@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	Oliver Upton <oupton@google.com>
Subject: Re: [PATCH 1/2] KVM: selftests: arm64: Introduce and use
 hardware-definition macros
Message-ID: <Z_BhKUAgkLCdeWDB@linux.dev>
References: <20250404220659.1312465-1-rananta@google.com>
 <20250404220659.1312465-2-rananta@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250404220659.1312465-2-rananta@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_154615_628454_4C72B3CE 
X-CRM114-Status: GOOD (  18.72  )
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

Hi Raghu,

On Fri, Apr 04, 2025 at 10:06:58PM +0000, Raghavendra Rao Ananta wrote:
> The kvm selftest library for arm64 currently configures the hardware
> fields, such as shift and mask in the page-table entries and registers,
> directly with numbers. While it add comments at places, it's better to
> rewrite them with appropriate macros to improve the readability and
> reduce the risk of errors. Hence, introduce macros to define the
> hardware fields and use them in the arm64 processor library.
> 
> Most of the definitions are primary copied from the Linux's header,
> arch/arm64/include/asm/pgtable-hwdef.h.

Thank you for doing this. Having magic numbers all around the shop was a
complete mess. Just a single comment:

> No functional change intended.
> 
> Suggested-by: Oliver Upton <oupton@google.com>
> Signed-off-by: Raghavendra Rao Ananta <rananta@google.com>
> ---
>  tools/arch/arm64/include/asm/sysreg.h         | 38 +++++++++++++
>  .../selftests/kvm/arm64/page_fault_test.c     |  2 +-
>  .../selftests/kvm/include/arm64/processor.h   | 28 +++++++--
>  .../selftests/kvm/lib/arm64/processor.c       | 57 ++++++++++---------
>  4 files changed, 92 insertions(+), 33 deletions(-)
> 
> diff --git a/tools/arch/arm64/include/asm/sysreg.h b/tools/arch/arm64/include/asm/sysreg.h
> index 150416682e2c..6fcde168f3a6 100644
> --- a/tools/arch/arm64/include/asm/sysreg.h
> +++ b/tools/arch/arm64/include/asm/sysreg.h
> @@ -884,6 +884,44 @@
>  	 SCTLR_EL1_LSMAOE | SCTLR_EL1_nTLSMD | SCTLR_EL1_EIS   | \
>  	 SCTLR_EL1_TSCXT  | SCTLR_EL1_EOS)
>  
> +/* TCR_EL1 specific flags */
> +#define TCR_T0SZ_OFFSET	0
> +#define TCR_T0SZ(x)		((UL(64) - (x)) << TCR_T0SZ_OFFSET)
> +
> +#define TCR_IRGN0_SHIFT	8
> +#define TCR_IRGN0_MASK		(UL(3) << TCR_IRGN0_SHIFT)
> +#define TCR_IRGN0_NC		(UL(0) << TCR_IRGN0_SHIFT)
> +#define TCR_IRGN0_WBWA		(UL(1) << TCR_IRGN0_SHIFT)
> +#define TCR_IRGN0_WT		(UL(2) << TCR_IRGN0_SHIFT)
> +#define TCR_IRGN0_WBnWA	(UL(3) << TCR_IRGN0_SHIFT)
> +
> +#define TCR_ORGN0_SHIFT	10
> +#define TCR_ORGN0_MASK		(UL(3) << TCR_ORGN0_SHIFT)
> +#define TCR_ORGN0_NC		(UL(0) << TCR_ORGN0_SHIFT)
> +#define TCR_ORGN0_WBWA		(UL(1) << TCR_ORGN0_SHIFT)
> +#define TCR_ORGN0_WT		(UL(2) << TCR_ORGN0_SHIFT)
> +#define TCR_ORGN0_WBnWA	(UL(3) << TCR_ORGN0_SHIFT)
> +
> +#define TCR_SH0_SHIFT		12
> +#define TCR_SH0_MASK		(UL(3) << TCR_SH0_SHIFT)
> +#define TCR_SH0_INNER		(UL(3) << TCR_SH0_SHIFT)
> +
> +#define TCR_TG0_SHIFT		14
> +#define TCR_TG0_MASK		(UL(3) << TCR_TG0_SHIFT)
> +#define TCR_TG0_4K		(UL(0) << TCR_TG0_SHIFT)
> +#define TCR_TG0_64K		(UL(1) << TCR_TG0_SHIFT)
> +#define TCR_TG0_16K		(UL(2) << TCR_TG0_SHIFT)
> +
> +#define TCR_IPS_SHIFT		32
> +#define TCR_IPS_MASK		(UL(7) << TCR_IPS_SHIFT)
> +#define TCR_IPS_52_BITS	(UL(6) << TCR_IPS_SHIFT)
> +#define TCR_IPS_48_BITS	(UL(5) << TCR_IPS_SHIFT)
> +#define TCR_IPS_40_BITS	(UL(2) << TCR_IPS_SHIFT)
> +#define TCR_IPS_36_BITS	(UL(1) << TCR_IPS_SHIFT)
> +
> +#define TCR_HA			(UL(1) << 39)
> +#define TCR_DS			(UL(1) << 59)
> +

sysreg.h isn't the right home for these definitions since it is meant to
be a copy of the corresponding kernel header.

Since KVM selftests are likely the only thing in tools to care about
setting up page tables, adding this to processor.h seems like a better
place.

Thanks,
Oliver

