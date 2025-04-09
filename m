Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A012C36002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Apr 2025 08:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ENiLxrZmoDckOJtASvweiIDsrXIatxbamkFYlhQSny0=; b=icJKR8/aGoNwyoHdDrAcjcodgQ
	MuQ5UAzotxYOysEh6haIHzwk7Ef1X0rc0YjG6NgDbIRZazjfLkE4lOM/1OTJN0OGAvzBKhU846OQq
	aL8Re050p9DI95X2+3/IRJEHQ+dl7h9FyinLMO0SQPdYYo9EMbyM0q2kCHQEASifBSP+5Ob1T1h24
	BBgONen7zIeRTOU6zN7Jj7e06j7tnXlIiKgjCUYgMHOFOo+4D/L7yriesQ/Ok3ZtoOXthoeXz0Su1
	WURhJ8Wivar/C6gpw4p8fMeS9riphYQ7rEqpkOzq0b/9jgwDE2YAH6h9g6QJczv05Nq8U0m5n7L8v
	Cq4eFYXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2QlE-00000006ZWg-0TFS;
	Wed, 09 Apr 2025 08:26:16 +0000
Received: from fout-a3-smtp.messagingengine.com ([103.168.172.146])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2QjK-00000006ZKM-3uya
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Apr 2025 08:24:20 +0000
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.phl.internal (Postfix) with ESMTP id ECFCD13801EF;
	Wed,  9 Apr 2025 04:24:17 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-12.internal (MEProxy); Wed, 09 Apr 2025 04:24:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1744187057;
	 x=1744273457; bh=ENiLxrZmoDckOJtASvweiIDsrXIatxbamkFYlhQSny0=; b=
	hQnE6zRKO1PZI38LSU3vzazuK/bDhLPPNDebrjG6CVv6enrWKXlKJO4xZ55XmDCe
	sp7hwidnxKGu72TFPIdKPRtmgWwqBTbmH1gIjSCvGvFXOUEcH+NSnQg8lx2yWNKL
	VhSwuUaAdG+DasY1vgo1c2MxvixgQDx9bWZAA+SnkJj8HCct0/Vflt5XguR8moXK
	h6A6luiAlW8taMtY/cZaa325fATzm+bB/xepT0cFqJix5k1PEJMn2+jidwvFnqgD
	z+jzoDx1YT/3q+QRNYu0qjUTz8qb8IF4JlvI3JgBRw0z/MHGg1VmzriBso86mK2v
	YaZu8qrVEwTLWJQBbekdrQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1744187057; x=
	1744273457; bh=ENiLxrZmoDckOJtASvweiIDsrXIatxbamkFYlhQSny0=; b=W
	ZOUbe1UZ/LGrEdVdgK/SaMbKkRGBk0jR3pNh7gSDB8L5iZsVzJzOJivhCMJxztJN
	D9HM/aYksFO+b4Dod/c2bzyf/b6fqvfhpGDJK6zuyLwBRAjhyjMcEkz7dpPTvisE
	SH3SgnZDO3gMPaPblRLfcedlaqcfrOGzs2D9V+ww+eyAMK846KPeu89s4grtVW0y
	T+IJBhXzJTK4khpnmqV3qaLd5l/yFjPV+5vX/XPUYLycdG2pFamlFU5etFcs9qKD
	GkuUdC7K4K01hH1wRtY7xoE48AGAuwW10iX8BBvM7ni8o3KOuWHoQ4ZkkOhuvQzM
	TPJtIC9LSKdWGHcXA00Lw==
X-ME-Sender: <xms:sS72Z0D-XbSobP2uNGGUgsC_ldZWZ9T76xIDbjV8RTGVndlwqjqeBQ>
    <xme:sS72Z2jdaGlkSno-C999pE3Ft_Kp_xTK9oCVBuIa6tKreBPjhDPy_RiQXe1LK1PQC
    6p_yAY_hxsZ3eNZzM8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdehhedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    udefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrdhmrghrih
    hnrghssegrrhhmrdgtohhmpdhrtghpthhtohepshgrshgthhgrrdgsihhstghhohhffhes
    rghrmhdrtghomhdprhgtphhtthhopehtihhmohhthhihrdhhrgihvghssegrrhhmrdgtoh
    hmpdhrtghpthhtoheptghonhhorhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehkrhiikhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlphhivghrrghlih
    hsiheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepmhgriieskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheprhhosghhsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllh
    eskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:sS72Z3kN0ltrrSaTV53OcJmmhaYnl2xcfigBHwMKSq5oOoFf-SJ7kw>
    <xmx:sS72Z6ze-W5htbLwDMMcI5celWJfMbnK_TDijN_w8nJZljsQr4Bkwg>
    <xmx:sS72Z5QbRmlUeFzg6sLCY5c1dv7R0JkgzZjfOkIcwZo6m1roHMwn1A>
    <xmx:sS72Z1ZS9xTU0zIfEfJ-zVb5u7wrEK_Xh6drTBR1Z8lKuuFFoxHrYg>
    <xmx:sS72Z3efnl_iVnkOvjGkdGPvh8gdYfZ4feQP_0de21Pg4iZCQ54qKK40>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 744A32220074; Wed,  9 Apr 2025 04:24:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T274101974a25e0dd
Date: Wed, 09 Apr 2025 10:23:57 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Lorenzo Pieralisi" <lpieralisi@kernel.org>,
 "Marc Zyngier" <maz@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Rob Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>
Cc: "Sascha Bischoff" <sascha.bischoff@arm.com>,
 "Timothy Hayes" <timothy.hayes@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Message-Id: <ed63bb91-e9ac-409a-a9a0-25b233fe2e15@app.fastmail.com>
In-Reply-To: <20250408-gicv5-host-v1-20-1f26db465f8d@kernel.org>
References: <20250408-gicv5-host-v1-0-1f26db465f8d@kernel.org>
 <20250408-gicv5-host-v1-20-1f26db465f8d@kernel.org>
Subject: Re: [PATCH 20/24] irqchip/gic-v5: Add GICv5 LPI/IPI support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_012419_310779_D10B209D 
X-CRM114-Status: GOOD (  20.17  )
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

On Tue, Apr 8, 2025, at 12:50, Lorenzo Pieralisi wrote:
> @@ -22,12 +25,346 @@ static u32 irs_readl(struct gicv5_irs_chip_data 
> *irs_data, const u64 reg_offset)
>  	return readl_relaxed(irs_data->irs_base + reg_offset);
>  }
> 
> +static u64 irs_readq(struct gicv5_irs_chip_data *irs_data, const u64 
> reg_offset)
> +{
> +	return readq_relaxed(irs_data->irs_base + reg_offset);
> +}
> +
>  static void irs_writel(struct gicv5_irs_chip_data *irs_data, const u32 
> val,
>  		       const u64 reg_offset)
>  {
>  	writel_relaxed(val, irs_data->irs_base + reg_offset);
>  }
> 
> +static void irs_writeq(struct gicv5_irs_chip_data *irs_data, const u64 
> val,
> +		       const u64 reg_offset)
> +{
> +	writeq_relaxed(val, irs_data->irs_base + reg_offset);
> +}

I think the use of _relaxed memory accessors needs some code
comments here. The definition of these is that you don't care
about ordering relative to DMA master accesses, yet you seem to
very much have accesses to the 'ist' from the GIC, as well as
DMA accesses from an MSI device, and I would expect both to
require ordering.

> +/* Wait for completion of an IST change */
> +static int gicv5_irs_ist_wait_for_idle(struct gicv5_irs_chip_data 
> *irs_data)
> +{
> +	int ret;
> +	u32 val;
> +
> +	ret = readl_relaxed_poll_timeout_atomic(
> +			irs_data->irs_base + GICV5_IRS_IST_STATUSR, val,
> +			FIELD_GET(GICV5_IRS_IST_STATUSR_IDLE, val), 1,
> +			USEC_PER_SEC);
> +

What is the significance of the 1 second timeout? This is probably
a million times longer than I would expect any hardware interaction
to be specified to take. Are you waiting for another thread here?

> +	l2istsz = BIT(n + 1);
> +	if (l2istsz > KMALLOC_MAX_SIZE) {
> +		u8 lpi_id_cap = ilog2(KMALLOC_MAX_SIZE) - 2 + istsz;
> +
> +		pr_warn("Limiting LPI ID bits from %u to %u\n",
> +			lpi_id_bits, lpi_id_cap);
> +		lpi_id_bits = lpi_id_cap;
> +		l2istsz = KMALLOC_MAX_SIZE;
> +	}

The use of KMALLOC_MAX_SIZE seem arbitrary here. I remember discussing
this in the past and concluding that this is fine for all cases
that may be relevant, but it would be good to explain the reasoning
in a comment.

> +	if (irs_data->flags & IRS_FLAGS_NON_COHERENT)
> +		dcache_clean_inval_poc((unsigned long)ist,
> +				       (unsigned long)ist + l2istsz);
> +	else
> +		dsb(ishst);
...
> +	baser = (virt_to_phys(ist) & GICV5_IRS_IST_BASER_ADDR_MASK) |
> +		FIELD_PREP(GICV5_IRS_IST_BASER_VALID, 0x1);

Here it seems like you are open-coding the DMA mapping interface
details, in particular the mapping of the 'ist' memory area into
the gic's DMA master space, the coherency and the barrier that is
normally part of a (non-relaxed) writeq().  Is there a reason
you can't use the normal interfaces here, using dma_alloc_coherent()
or dma_alloc_noncoherent()?

Do you expect actual implementation to not be cache-coherent?

        Arnd

