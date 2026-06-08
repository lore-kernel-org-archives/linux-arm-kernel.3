Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51E2FCD8C9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 12:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BaD5dzE0XkKaVHaRfsV559bcL81Tx1hd4V5yWiB2MWI=; b=1X6r/MOKasrxjtDfG7w8tLV5NX
	Bi0oB4vFpCclVD1a3x+ScVNRQpR90qgS0tyeG+skg4r4qlu/vah8SwzoxMy8ZqmGxXISOJJ9XpjKM
	VzfcHHalK7MNLXx/lV7b3wmUbqtPa5nM8hK0QsIDVNDr/8l1b+epLtd+pzKZpRnBpTw5lQEO2525O
	9T38yEZ7w4qft5GukgNNfQr+5RjgiYQwTz7Ike4apjYg+mPReD16DziyhGSqMUXMcBPb44TgOkJmA
	vkxi6sH74L6BSnCwedfZrT5Wj60Mn7FwSUNC8zpQ4Go3S8gLnoWB0l1kkBkc1OUqmgzTDlDcQ1PPg
	sOS+/z2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZ9r-00000003WBJ-31tj;
	Mon, 08 Jun 2026 12:32:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZ9q-00000003WBD-1oJL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 12:32:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CB36640463;
	Mon,  8 Jun 2026 12:32:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 787581F00893;
	Mon,  8 Jun 2026 12:32:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780921965;
	bh=BaD5dzE0XkKaVHaRfsV559bcL81Tx1hd4V5yWiB2MWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BuHvmcAkpVGMkltyGW5aMyXfTrfPJA1k4i74plwI7JN1wJOeguiIw1CvPrqOhSDde
	 dHCyfG0M60CGjOsa7iMZ6TzPKuGb8UGDM0Z4ScrWHJXriCcH6wn6abMp4fDWh50xkD
	 Tv5NWdXMsHK2ye6j44vl+qkgNU4cUDGX8imV45eZPrfOmnQK4lkMVa/p9hMk+RNTDg
	 UpK6ulMISI4SVj2GVuJJZTALZQKzJmZIAS5Opzl7tEhVwVvK1yyFLYCffGChBOxYsN
	 JRUv/eci/eKuXmGfW9W4Fb+oRn1iu/CLpzVzHkRs72GKoSg5hLK01oJbp3iCX0Qu0a
	 q879RRED3Z4VA==
Date: Mon, 8 Jun 2026 13:32:41 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: linux-coco@lists.linux.dev, Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v6 3/4] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
Message-ID: <20260608-hot-fascinating-tortoise-cccc61@sudeepholla>
References: <20260527100233.428018-1-aneesh.kumar@kernel.org>
 <20260527100233.428018-4-aneesh.kumar@kernel.org>
 <20260603-determined-bumblebee-of-promise-e633d6@sudeepholla>
 <yq5ase72qvwb.fsf@kernel.org>
 <20260604-juicy-daft-starling-3eec1f@sudeepholla>
 <yq5ao6hlzbpa.fsf@kernel.org>
 <e0071e90-c2f5-4d15-b3c6-fe05bf1464e4@arm.com>
 <yq5aldcpz316.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5aldcpz316.fsf@kernel.org>
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

On Mon, Jun 08, 2026 at 04:56:29PM +0530, Aneesh Kumar K.V wrote:
> Suzuki K Poulose <suzuki.poulose@arm.com> writes:
> 
> > On 08/06/2026 09:19, Aneesh Kumar K.V wrote:
> >> Sudeep Holla <sudeep.holla@kernel.org> writes:
> >> 
> >>> On Thu, Jun 04, 2026 at 06:56:28PM +0530, Aneesh Kumar K.V wrote:
> >>>> Sudeep Holla <sudeep.holla@kernel.org> writes:
> >>>>
> >>>> ...
> 
> ...
> 
> >>> I was trying to avoid conditional compilation altogether and hence the
> >>> reason for keeping it as simple as possible. Also IS_ENABLED(CONFIG_ARM64)
> >>> in above snippet must come as some condition to this generic probe.
> >>>
> >>> Adding any more logic or callback defeats the bus idea here if we need
> >>> to rely/depend on multiple conditional compilation or callbacks IMO.
> >>>
> >>> Let's find see if it can work with what we are adding now and may add in
> >>> near future and then decide.
> >>>
> >> 
> >> If we move all the conditional checks to the driver probe path, then I
> >> think this can work. Something like the below:
> >> 
> >> struct smccc_device_info {
> >> 	u32 func_id;
> >> 	bool requires_smc;
> >> 	const char *device_name;
> >> };
> >> 
> >> static const struct smccc_device_info smccc_devices[] __initconst = {
> >> 	{
> >> 		.func_id        = ARM_SMCCC_TRNG_VERSION,
> >> 		.requires_smc   = false,
> >> 		.device_name    = "arm-smccc-trng",
> >> 	},
> >> 
> >> 	{
> >> 		.func_id        = RSI_ABI_VERSION,
> >
> > Don't we need parameters passed to this (Requested Interface version for 
> > e.g.) ? See more below.
> >
> 
> The idea is that we only check whether the function ID is supported. All
> other conditional logic should be handled in the driver probe path, as
> demonstrated by the changes in drivers/char/hw_random/arm_smccc_trng.c.
> 

+1. Yes, we just want to know whether the firmware is aware of that feature
before creating the `smccc_device` for it. The device probe can then perform a
more thorough, feature-specific check to determine whether the device/feature
is usable.

That is the main idea behind the approach I suggested. Please let me know if
you still see any issues or think this may not work.

-- 
Regards,
Sudeep

