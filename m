Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36356C5B555
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Jun 2025 17:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+US7plg1nUi/tNcrcTbRg68+uKx2W3vNq0vkWat981E=; b=N4+4EWt/sNwntE9NOKXwo22a4C
	h+VJLhp3kqs0E9YZmnawog+pRhUhdLX5blG//TRiwJrgvZ6UlbOIVwaxl7/aF39TqYuxhkJbeY+XA
	99Y/7+eoXUfzsvkEGiTLQLFvVAAUV5jQJwhd5E/5E5+F1zlMMAkQRaanqvX4Ds638A7ht/pSprXEu
	feugdHhg+ySp2WzNkWi4uvsr0pmkhgnNKrNfrw/C70CmSOHvM1xgAJi8w13WV2TinVVG5qX5Cjnyv
	UcH0H4veZBMzMpKuZMEQ5aVf2CApx+5X9zgeDCFU0OU5x/CdO/XOxxqwx0R09mui7eJWsCY9Skkmi
	C3QzHUIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM9LN-000000087w7-1UwK;
	Mon, 02 Jun 2025 17:53:05 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM9J9-000000087Mw-3VvS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Jun 2025 17:50:49 +0000
Date: Mon, 2 Jun 2025 10:50:29 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748886642;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+US7plg1nUi/tNcrcTbRg68+uKx2W3vNq0vkWat981E=;
	b=bccasQbKXwtK2x8QGEDjUYasWPuU6PbsRWQOr1WkfYutbqDabCVecf0vq3N0o2zly2Eda5
	dCz2lKOViYAqVv92HovqxBuhQ9iT9XwzOWhqQV4Jn92DcWImCw5mWf5kiRr+UTwG+QwW/5
	/yhZsaPV4FkSZoDZN++Wpmbx2sRccvA=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Mingwei Zhang <mizhang@google.com>, stable@vger.kernel.org
Subject: Re: [PATCH] arm64: Add MIDR-based check for FEAT_ECBHB
Message-ID: <aD3kZb0ZZQxsrNF6@linux.dev>
References: <20250522204148.4007406-1-oliver.upton@linux.dev>
 <20250602120831.GC1227@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602120831.GC1227@willie-the-truck>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_105048_316103_77DD7F0A 
X-CRM114-Status: GOOD (  16.92  )
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

On Mon, Jun 02, 2025 at 01:08:31PM +0100, Will Deacon wrote:
> On Thu, May 22, 2025 at 01:41:48PM -0700, Oliver Upton wrote:
> > +	/*
> > +	 * Prior to commit e8cde32f111f ("arm64/cpufeatures/kvm: Add ARMv8.9
> > +	 * FEAT_ECBHB bits in ID_AA64MMFR1 register"), KVM masked FEAT_ECBHB
> > +	 * on implementations that actually have the feature. That sucks; infer
> > +	 * presence of FEAT_ECBHB based on MIDR.
> > +	 */
> > +	if (is_midr_in_range_list(spectre_ecbhb_list))
> > +		return true;
> > +
> 
> I really don't think we want to go down this route.

Like I said, not a fan of doing this but...

> If finer grained control of the spectre mitigations is needed, I think
> extending the existing command-line options is probably the best bet
> rather then inferring behaviours based on the MIDR.

Looks like all of the Neoverse-V2 based VMs available for rent are
unintentionally hiding FEAT_ECBHB despite hardware support. I wouldn't
expect CSPs to go and change this field after creating a VM, so that's a
lot of hardware we're giving a poor experience on.

I just don't think a command-line switch is going to have any practical
impact on the situation.

Thanks,
Oliver

