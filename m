Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFC46C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 07:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hwD1lIdtcJvdTFhSGkZrNjpxJv3lx+G0x/gy4Oqkqlg=; b=hB2N9Vjx6teLUBvlr3O+HaS0Yz
	Y01jDrxmW1gZDPuXHZHD5wFw9s8Gctx1/NLcBFFAXh8jV7RtXv7HJn91egveEYdRkt93JkrrtSiCp
	/Y2ImW2ROBVMiemvopW+kBqNvJQPFhBshY9lHDjg8r9D+DNU4I/SvezsHTkhuq8O+d97dzHji8U7n
	upMEI30kdSAg4yv4wZ0iDmdNdXB0dNYX/rn//Eo5p4xttkcA40pXBZyovFyj/ymV7Xmv6WN3EnmpO
	QUt8SBD444jAu+70GlVQs2rSU9eX7ba+FLEaeXd+SYICATBzpfBwuUohe6qFNfx7ZTHdykd5dpXZt
	/qnuvjqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thOC4-0000000GVtK-18Wc;
	Mon, 10 Feb 2025 07:27:00 +0000
Received: from out-180.mta0.migadu.com ([2001:41d0:1004:224b::b4])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thOAf-0000000GVj1-0qNO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 07:25:35 +0000
Date: Sun, 9 Feb 2025 23:25:20 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739172327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hwD1lIdtcJvdTFhSGkZrNjpxJv3lx+G0x/gy4Oqkqlg=;
	b=kXBzap/gTr4HWJcRXQDm7DOBGfeTNHMzoNaXlGUNiV7By6TX5/ld3/RKw3r36+uzamfZRI
	9kgaxEmEWNycuEOd4PYpqoSR5TDvsEOojoBeDhe2bivBUMSPju67z9EPUaf4pn2VbQBK1g
	p83LqS1ZQhg3kef6BQ6B20f6CBvi5hs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Colton Lewis <coltonlewis@google.com>
Cc: kvm@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-perf-users@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [RFC PATCH v2 2/4] perf: arm_pmuv3: Introduce module param to
 partition the PMU
Message-ID: <Z6mp4NeklzORJg5y@linux.dev>
References: <20250208020111.2068239-1-coltonlewis@google.com>
 <20250208020111.2068239-3-coltonlewis@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250208020111.2068239-3-coltonlewis@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_232534_010596_571E1624 
X-CRM114-Status: GOOD (  21.25  )
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

Hi Colton,

On Sat, Feb 08, 2025 at 02:01:09AM +0000, Colton Lewis wrote:
> For PMUv3, the register MDCR_EL2.HPMN partitiones the PMU counters
> into two ranges where counters 0..HPMN-1 are accessible by EL1 and, if
> allowed, EL0 while counters HPMN..N are only accessible by EL2.
> 
> Introduce a module parameter in the PMUv3 driver to set this
> register. The name reserved_host_counters reflects the intent to
> reserve some counters for the host so the guest may eventually be
> allowed direct access to a subset of PMU functionality for increased
> performance.
> 
> Track HPMN and whether the pmu is partitioned in struct arm_pmu
> because KVM will need to know that to handle guests correctly.
> 
> While FEAT_HPMN0 does allow HPMN to be set to 0, this patch
> specifically disallows that case because it's not useful given the
> intention to allow guests access to their own counters.

Quite the contrary.

FEAT_HPMN0 is useful if userspace wants to provide a vPMU that has a
fixed cycle counter w/o event counters. Certain OSes refuse to boot
without it...

> static inline u32 read_mdcr(void)
> {
> 	return read_sysreg(HDCR);
> }
> 
> static inline void write_mdcr(u32 val)
> {
> 	write_sysreg(val, HDCR);
> }
> 

Hmm... While this fixes the 32bit compilation issues, it opens a new can
of worms.

VHE is a 64bit only feature, so you're *guaranteed* that these accessors
will undef (running at EL1).

> +static void armv8pmu_partition(u8 hpmn)
> +{
> +	u64 mdcr = armv8pmu_mdcr_read();
> +
> +	mdcr &= ~ARMV8_PMU_MDCR_HPMN;
> +	mdcr |= FIELD_PREP(ARMV8_PMU_MDCR_HPMN, hpmn);
> +	/* Prevent guest counters counting at EL2 */
> +	mdcr |= ARMV8_PMU_MDCR_HPMD;
> +
> +	armv8pmu_mdcr_write(mdcr);
> +}
> +

After giving this a read, I don't think the host PMU driver should care
about MDCR_EL2 at all. The only time that 'guest' events are loaded into
the PMU is between vcpu_load() / vcpu_put(), at which point *KVM* has
reconfigured MDCR_EL2.

I'm not sure if there's much involvement with the host PMU driver beyond
it pinky-swearing to only use the specified counters. KVM is what
actually will program HPMN.

That'd alleviate the PMU driver from having VHE awareness or caring
about MDCR_EL2.

-- 
Thanks,
Oliver

