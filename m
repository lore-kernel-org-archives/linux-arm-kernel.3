Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F087DCD8C92
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 08:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pvf0tOC7mTFxwCrEWNHyHWtzHGoBY12hIxMDv76SqCk=; b=l5nVCyyAkOORGPaJfNA5GxPvvh
	BXUqiHFoKyCQAhXkV3q2rXke4w9qxdxjDNEH6MHWTDrInnMjq3143o5kHvQjbgn7iQHEhm0x/OTxc
	nuQ1p8J1A4lneWjyPNZyOaRjzQ4C41+W+R1+y1DQdM4XsGOleZy97AQV6s7iQu106fQxohmZQZf7E
	IXt25NHrKqAlUYAPlx9znrdHpmMosBgO5gENeINqTHGSpo3tsXWiSAU+qvLif7HHu9v0mNrmYtgGt
	W7z72VX36w0ytxNUNrjCxjZMyh+WkJ4gcRkpi8HGbKKFhPRRjJBGtqfKuJcmAWIvbI+iQrPwvfUjC
	ctTzUpSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWVVz-000000036Gr-3K04;
	Mon, 08 Jun 2026 08:39:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWVVx-000000036GH-2Q6c
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 08:39:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E93D943B77;
	Mon,  8 Jun 2026 08:39:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 723D21F00898;
	Mon,  8 Jun 2026 08:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780907960;
	bh=pvf0tOC7mTFxwCrEWNHyHWtzHGoBY12hIxMDv76SqCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MLHvzxjxOcnDaAI/0TCOB51+C97JsSw5I2CEfgADKLcil2Fj5Fy+qPueOBbFHc+nr
	 t//H9ANpp3pp7m2+z0ZbIMQaKEvApXQZ28OQa1dmAhwW5/GxSzc9bpNEo41Ol/WeSL
	 M0dbjy0ABgDSxjDPQIkzykZ8Dd6IhdUST5U95GN+auhn0wgDSwHE4MbtjbobdHEL8s
	 3cduGyoLkfr/BD4x+xgUPbkVBEh4TeUnCel2+8ebPdRAwCYF1R32XtrOWe3VI/Ss7j
	 n7a2a4n6MPU84h8grH02QuOaJ9kJ7mpmG/W43lZg7ixnaGMOMK3Jr8e9yxdq8IQx5n
	 0zEDsTi1XBwdw==
Date: Mon, 8 Jun 2026 09:39:16 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH v6 3/4] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
Message-ID: <20260608-economic-lucky-phoenix-2eaeaa@sudeepholla>
References: <20260527100233.428018-1-aneesh.kumar@kernel.org>
 <20260527100233.428018-4-aneesh.kumar@kernel.org>
 <20260603-determined-bumblebee-of-promise-e633d6@sudeepholla>
 <yq5ase72qvwb.fsf@kernel.org>
 <20260604-juicy-daft-starling-3eec1f@sudeepholla>
 <yq5ao6hlzbpa.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yq5ao6hlzbpa.fsf@kernel.org>
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

On Mon, Jun 08, 2026 at 01:49:13PM +0530, Aneesh Kumar K.V wrote:
> Sudeep Holla <sudeep.holla@kernel.org> writes:
> 
> > On Thu, Jun 04, 2026 at 06:56:28PM +0530, Aneesh Kumar K.V wrote:
> >> Sudeep Holla <sudeep.holla@kernel.org> writes:
> >> 
> >> ...
> >> 
> >> > +static const struct smccc_device_info smccc_devices[] __initconst = {
> >> > +       {
> >> > +               .func_id        = ARM_SMCCC_TRNG_VERSION,
> >> > +               .requires_smc   = false,
> >> > +               .min_return     = ARM_SMCCC_TRNG_MIN_VERSION,
> >> > +               .device_name    = "arm-smccc-trng",
> >> > +       },
> >> > +};
> >> > +
> >> > +static bool __init
> >> > +smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)
> >> > +{
> >> > +       struct arm_smccc_res res;
> >> > +       unsigned long ret;
> >> > +
> >> > +       if (!IS_ENABLED(CONFIG_ARM64))
> >> > +               return false;
> >> > +
> >> > +       if (smccc_conduit == SMCCC_CONDUIT_NONE)
> >> > +               return false;
> >> > +
> >> > +       if (smccc_dev->requires_smc && smccc_conduit != SMCCC_CONDUIT_SMC)
> >> > +               return false;
> >> > +
> >> > +       arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
> >> > +       ret = res.a0;
> >> > +
> >> > +       if ((s32)ret < 0)
> >> > +               return false;
> >> > +
> >> > +       return ret >= smccc_dev->min_return;
> >> > +}
> >> > +
> >> >
> >> 
> >> I am not sure we want the check to be as simple as ret < 0. Some
> >> function IDs may return input errors based on the supplied arguments
> >> (for example, RMI_ERROR_INPUT). In those cases, we would likely want
> >> this to be handled via a callback.
> >> 
> >
> > As I mentioned in response to Suzuki, we can defer that to probe of
> > that device. If *_VERSION, succeeds SMCCC core can add that device and
> > leave the rest to the core keeping the core and bus layer simple IMO.
> >
> >> We also want to use conditional compilation for some function IDs.
> >> Given the callback approach and the #ifdefs, I wonder whether what we
> >> currently have is actually simpler and more flexible.”
> >> 
> >
> > I was trying to avoid conditional compilation altogether and hence the
> > reason for keeping it as simple as possible. Also IS_ENABLED(CONFIG_ARM64)
> > in above snippet must come as some condition to this generic probe.
> >
> > Adding any more logic or callback defeats the bus idea here if we need
> > to rely/depend on multiple conditional compilation or callbacks IMO.
> >
> > Let's find see if it can work with what we are adding now and may add in
> > near future and then decide.
> >
> 
> If we move all the conditional checks to the driver probe path, then I
> think this can work. Something like the below:
> 

Sounds good to me.

[...]

> We can also move arch/arm64/include/asm/rsi_smc.h to
> include/linux/arm-rsi-smccc.h. There was a suggestion to move these
> firmware interfaces out of architecture-specific code:
> 
> https://lore.kernel.org/all/agsNO9cc7H-b0H8L@willie-the-truck
>

Ah OK, sorry I had missed this.

-- 
Regards,
Sudeep

