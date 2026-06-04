Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9CCCD6E4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 13:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bG6yD1DR2hEpGh8JtLgi0HKdEg4kb4ZJsmcgeqPHJnw=; b=NE8geUuObWXms/zvCpkp6R8CMk
	hzQiD7hGfZVN5DPUG3mi3Etu2IS9P6lHSJgYaP5rkPUuS2uT/M3blq4snnzLaBPl/gnuyhZAJD/B5
	ZwTQFxM7n+t24fWsjDfwMI8TWIKCXVdta7aB+hwqRvxr6wjjDRV8C9QMmOk7/PwuDfU9gT7oOIlvU
	3SltuIIKCtJ2C29RhfYR11hLvLI9pbefnqCl9lMxbGqRUEcfqQLQPaPirtxl5iQn86RgJt3s+RXce
	5yZpi8Z+38jh/jq3XbnQDiaBrahkVmObBRMFBEVoBJz6e2TXx5xjwGqgMCaZQyZR2yi7h7CNHvefW
	1fCJdVWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8OS-0000000Gp8e-2fte;
	Thu, 04 Jun 2026 13:45:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV8OR-0000000Gp8G-17xD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 13:45:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AB8EF40626;
	Thu,  4 Jun 2026 13:45:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B481F00899;
	Thu,  4 Jun 2026 13:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780580754;
	bh=bG6yD1DR2hEpGh8JtLgi0HKdEg4kb4ZJsmcgeqPHJnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=CS8HmWdr26RcdgrU/GyogvKbgS1oRujsoniyoTH9ATztks9rThxc+Qr4MLP139deS
	 xLxA+SNlv9l/h7DXJkcdMK+T9dovMpswgDvygmLKgFlRJjy51tW8sIKFqVJaNE6g4w
	 ySvi9ANEFpSS/YYmii9DfSr7kxblrs2uezW+maHKsZgRzw2weBk9NCEQ0qInyGI3to
	 QsnyZnSDRqNEtJmnE4tTnpGcziD2JwCAdeDMv3NNXbiGJpJWETYaGJ+EUmX0SasmGU
	 4JSh/sfl7JQpKlCkV9xb/GDeL3/B6R3NREuNEDzDiKCAcmy0yEHrTGEXtVA8uM1fip
	 NRVw9oMkFE0dw==
Date: Thu, 4 Jun 2026 14:45:49 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>
Subject: Re: [PATCH v6 3/4] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
Message-ID: <20260604-juicy-daft-starling-3eec1f@sudeepholla>
References: <20260527100233.428018-1-aneesh.kumar@kernel.org>
 <20260527100233.428018-4-aneesh.kumar@kernel.org>
 <20260603-determined-bumblebee-of-promise-e633d6@sudeepholla>
 <yq5ase72qvwb.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <yq5ase72qvwb.fsf@kernel.org>
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

On Thu, Jun 04, 2026 at 06:56:28PM +0530, Aneesh Kumar K.V wrote:
> Sudeep Holla <sudeep.holla@kernel.org> writes:
> 
> ...
> 
> > +static const struct smccc_device_info smccc_devices[] __initconst = {
> > +       {
> > +               .func_id        = ARM_SMCCC_TRNG_VERSION,
> > +               .requires_smc   = false,
> > +               .min_return     = ARM_SMCCC_TRNG_MIN_VERSION,
> > +               .device_name    = "arm-smccc-trng",
> > +       },
> > +};
> > +
> > +static bool __init
> > +smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)
> > +{
> > +       struct arm_smccc_res res;
> > +       unsigned long ret;
> > +
> > +       if (!IS_ENABLED(CONFIG_ARM64))
> > +               return false;
> > +
> > +       if (smccc_conduit == SMCCC_CONDUIT_NONE)
> > +               return false;
> > +
> > +       if (smccc_dev->requires_smc && smccc_conduit != SMCCC_CONDUIT_SMC)
> > +               return false;
> > +
> > +       arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
> > +       ret = res.a0;
> > +
> > +       if ((s32)ret < 0)
> > +               return false;
> > +
> > +       return ret >= smccc_dev->min_return;
> > +}
> > +
> >
> 
> I am not sure we want the check to be as simple as ret < 0. Some
> function IDs may return input errors based on the supplied arguments
> (for example, RMI_ERROR_INPUT). In those cases, we would likely want
> this to be handled via a callback.
> 

As I mentioned in response to Suzuki, we can defer that to probe of
that device. If *_VERSION, succeeds SMCCC core can add that device and
leave the rest to the core keeping the core and bus layer simple IMO.

> We also want to use conditional compilation for some function IDs.
> Given the callback approach and the #ifdefs, I wonder whether what we
> currently have is actually simpler and more flexible.”
> 

I was trying to avoid conditional compilation altogether and hence the
reason for keeping it as simple as possible. Also IS_ENABLED(CONFIG_ARM64)
in above snippet must come as some condition to this generic probe.

Adding any more logic or callback defeats the bus idea here if we need
to rely/depend on multiple conditional compilation or callbacks IMO.

Let's find see if it can work with what we are adding now and may add in
near future and then decide.

-- 
Regards,
Sudeep

