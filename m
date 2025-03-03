Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BFCC282D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 14:49:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3AaXglqBPlc/ouLZcp3hxFj9nawQ7T6NNeT4rwMrQgc=; b=RlX8RjJDGWW/QRaXVUUFiUt8Lm
	pM9/5W7P3KQMMpT4eSZEgE/X0lt4vrpfme3+PPujyqnR4Pxf+w7o2Jsn87WzzUNQmqslZOLSBGZUg
	sXuU+6zWtXuOXimMFG8SLKHn/Woc/Y+QZc4wsGaIWp/Piuzr7TYxOPyVREm82Ai9aNuwDj7+aw/3o
	6vTiFQhk9RlngUB7KbdoS1QgMjEfV9A3AABnUGZ4R4JWZB28JSgB3JRhoSwFQuhakFZJ8Sb3vxltm
	rQEfLrNCsvq77MljKsmbmtigHctqSCcSxSBNH9Y/kTOZSoH+UwWFyaFBireB4rPCFV56nZ+vCbIRr
	9bQo6nSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp76Z-00000001Ac2-12Mk;
	Mon, 03 Mar 2025 14:49:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp72z-000000019uD-0jLP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 14:45:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72BAD106F;
	Mon,  3 Mar 2025 06:45:46 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41B9D3F66E;
	Mon,  3 Mar 2025 06:45:31 -0800 (PST)
Date: Mon, 3 Mar 2025 14:45:28 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Paul Benoit <paul@os.amperecomputing.com>,
	Mark Rutland <mark.rutland@arm.com>
Cc: <linux-kernel@vger.kernel.org>, Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v4] firmware: smccc: Support optional Arm SMC SOC_ID name
Message-ID: <Z8XAiMSoaOmR5JxY@bogus>
References: <20241114030452.10149-1-paul@os.amperecomputing.com>
 <20250219005932.3466-1-paul@os.amperecomputing.com>
 <Z8W6HXZy46K7ebWe@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z8W6HXZy46K7ebWe@J2N7QTR9R3.cambridge.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_064533_301991_D27DF7FA 
X-CRM114-Status: GOOD (  26.79  )
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

On Mon, Mar 03, 2025 at 02:18:05PM +0000, Mark Rutland wrote:
> Hi Paul,
>
> This looks generally good with a couple of minor nits.
>
> On Tue, Feb 18, 2025 at 04:59:32PM -0800, Paul Benoit wrote:
> > Issue Number 1.6 of the Arm SMC Calling Convention introduces an optional
> > SOC_ID name string.  If implemented, point the 'machine' field of the SoC
> > Device Attributes at this string so that it will appear under
> > /sys/bus/soc/devices/soc0/machine.
> >
> > On Arm SMC compliant SoCs, this will allow things like 'lscpu' to
> > eventually get a SoC provider model name from there rather than each
> > tool/utility needing to get a possibly inconsistent, obsolete, or incorrect
> > model/machine name from its own hardcoded model/machine name table.
> >
> > Signed-off-by: Paul Benoit <paul@os.amperecomputing.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> > Cc: Sudeep Holla <sudeep.holla@arm.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > ---

[...]

> > +static char __init *smccc_soc_name_init(void)
> > +{
> > +	struct arm_smccc_1_2_regs args;
> > +	struct arm_smccc_1_2_regs res;
> > +	size_t len;
> > +
> > +	/*
> > +	 * Issue Number 1.6 of the Arm SMC Calling Convention
> > +	 * specification introduces an optional "name" string
> > +	 * to the ARM_SMCCC_ARCH_SOC_ID function.  Fetch it if
> > +	 * available.
> > +	 */
> > +	args.a0 = ARM_SMCCC_ARCH_SOC_ID;
> > +	args.a1 = 2;    /* SOC_ID name */
> > +	arm_smccc_1_2_invoke(&args, &res);
> > +	if ((u32)res.a0 == 0) {
> > +		const unsigned int regsize = sizeof(res.a1);
> > +
> > +		/*
> > +		 * Copy res.a1..res.a17 to the smccc_soc_id_name string
> > +		 * 8 bytes at a time.  As per Issue 1.6 of the Arm SMC
> > +		 * Calling Convention, the string will be NUL terminated
> > +		 * and padded, from the end of the string to the end of the
> > +		 * 136 byte buffer, with NULs.
> > +		 */
> > +		str_fragment_from_reg(smccc_soc_id_name + 0*regsize, res.a1);
> > +		str_fragment_from_reg(smccc_soc_id_name + 1*regsize, res.a2);
> > +		str_fragment_from_reg(smccc_soc_id_name + 2*regsize, res.a3);
> > +		str_fragment_from_reg(smccc_soc_id_name + 3*regsize, res.a4);
> > +		str_fragment_from_reg(smccc_soc_id_name + 4*regsize, res.a5);
> > +		str_fragment_from_reg(smccc_soc_id_name + 5*regsize, res.a6);
> > +		str_fragment_from_reg(smccc_soc_id_name + 6*regsize, res.a7);
> > +		str_fragment_from_reg(smccc_soc_id_name + 7*regsize, res.a8);
> > +		str_fragment_from_reg(smccc_soc_id_name + 8*regsize, res.a9);
> > +		str_fragment_from_reg(smccc_soc_id_name + 9*regsize, res.a10);
> > +		str_fragment_from_reg(smccc_soc_id_name + 10*regsize, res.a11);
> > +		str_fragment_from_reg(smccc_soc_id_name + 11*regsize, res.a12);
> > +		str_fragment_from_reg(smccc_soc_id_name + 12*regsize, res.a13);
> > +		str_fragment_from_reg(smccc_soc_id_name + 13*regsize, res.a14);
> > +		str_fragment_from_reg(smccc_soc_id_name + 14*regsize, res.a15);
> > +		str_fragment_from_reg(smccc_soc_id_name + 15*regsize, res.a16);
> > +		str_fragment_from_reg(smccc_soc_id_name + 16*regsize, res.a17);
> 
> Please get rid of 'regsize' and use '8' directly. This only exists for
> arm64, where the registeres are 8 bytes, and the comment immediately
> above refers to "8 bytes" specifically anyway, so 'regsize' only serves
> to make this harder to read.
> 
> It'd be a bit clearer as:
> 
> 	str_fragment_from_reg(smccc_soc_id_name + 8 * 0,  res.a1);
> 	str_fragment_from_reg(smccc_soc_id_name + 8 * 1,  res.a2);
> 	...
> 	str_fragment_from_reg(smccc_soc_id_name + 8 * 15, res.a16);
> 	str_fragment_from_reg(smccc_soc_id_name + 8 * 16, res.a17);
> 
> Sudeep, are you happy to fix that up when applying?
> 
> > +
> > +		len = strnlen(smccc_soc_id_name, sizeof(smccc_soc_id_name));
> > +		if (len) {
> > +			if (len == sizeof(smccc_soc_id_name))
> > +				pr_warn(FW_BUG "Ignoring improperly formatted Name\n");
> 
> It's odd that 'Name' is capitalized here. Not a big deal, but it doesn't
> look quite right.
>

I can fix both of these and apply. No need to repost.

-- 
Regards,
Sudeep

