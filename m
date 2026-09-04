Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9547C624DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 10:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tie3/C0PVrS1CpLSqsIk6C5A879AcuKONm6oB8gQBfs=; b=c7JWNBe+aDlW7fwBQza8hTCIq3
	YYt19ugAIOMVu3np58ZhwBUZHqmR5kzaqm5FmPI4RX6v+qnFDblr/dwwrxAH1sZdS/qXLCeBl4tZm
	cdxCzSEpijdkwmshbCtRb652YA4MK3YKoB/byY097aY4WaZpSZ4sGZVPnAyYv5PcZHyJcMI8xncuA
	D5fBRDoP9j7p1aSSVjl1txqPIUeyplOPFBr3dE3zBrgQYElLCgC1vmti99Gydpbg8nBp0/rDdBlvu
	FgO4CNemMdfBxu9GDz8/0mEkFaeqi4XWaihgkQXmknaxcnIlRHCUo/PfUeHD10/NFT0zatjhPMTMM
	paSkj4ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2QlD-00000001c3Z-1Th9;
	Fri, 04 Sep 2026 10:03:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2QlC-00000001c3C-39g2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Sep 2026 10:03:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0A2C46020A;
	Fri,  4 Sep 2026 10:03:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 289D31F00A3E;
	Fri,  4 Sep 2026 10:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788516181;
	bh=tie3/C0PVrS1CpLSqsIk6C5A879AcuKONm6oB8gQBfs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hjDjaDYVxdvm9qd40cjkEQwK/pP/t1zPYfE7eGdI877A2/idGoHsau16XMRI2lmH/
	 FRvP/V1xzlPzY6KHbC9F/PS6glRTXp8eQsaMaB3Mi9nZXiBsSC/EZby9z/ZIe+HN8z
	 hV8FB6e2OKbuqOfHwI8B3A9ppxlxxwql9PeLMqNmdEq27OCgqS4p0GrM9P7Btya5ji
	 eTgH3LcPK9S9iac+Z8dQmDMgi+eXKosOxMCx4aWrPngZRnjOpcVWeO3jed4XCMqW97
	 7HBuABzUBQyssJ7+PcRfG7h4+Dqom+tZ7rnzFYr3bNM3DCm72vXZ9E2ybCOAG7I3H+
	 PX6OzaYr+d6AQ==
Date: Fri, 4 Sep 2026 11:02:56 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>, linux-coco@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v9 1/7] firmware: smccc: Add an Arm SMCCC bus
Message-ID: <20260904-keen-fiery-fulmar-702fb3@sudeepholla>
References: <20260805063255.1638614-1-aneesh.kumar@kernel.org>
 <20260805063255.1638614-2-aneesh.kumar@kernel.org>
 <178794567779.4159892.8785590655735217125.b4-review@b4>
 <yq5ay0diyavw.fsf@kernel.org>
 <20260903125718.GI4157646@nvidia.com>
 <yq5av78mxv0j.fsf@kernel.org>
 <20260903154626.GL4157646@nvidia.com>
 <20260903-nonchalant-capable-parrot-539c8b@sudeepholla>
 <20260903182152.GN4157646@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260903182152.GN4157646@nvidia.com>
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

On Thu, Sep 03, 2026 at 03:21:52PM -0300, Jason Gunthorpe wrote:
> On Thu, Sep 03, 2026 at 05:18:16PM +0100, Sudeep Holla wrote:
> 
> > Oh yes, we need this whatever you term as "duplication". I would argue
> > against terming it as duplications as if you look at the various SMCCC
> > based specification, we have zero consistency in how the VERSION command
> > is expected to work.
> 
> Okay, then that pretty much settles it. Nothing to do
> 
> > > Missing a check means FW upgrades might become Linux breaking. 
> > 
> > Are you referring to the SMCCC bus code or RSI in particular above. I don't
> > see any issue with SMCCC bus code check as that is the least we can do and
> > must not change with future versions of the firmware as well.
> 
> Just in general, SMCCC drivers have to do something smart with the
> version.
> 
> Like, is this OK:
> 
> #define ARM_SMCCC_TRNG_MIN_VERSION	0x10000UL
> 
> static inline bool smccc_probe_trng(void)
> {
> 	struct arm_smccc_res res;
> 
> 	arm_smccc_1_1_invoke(ARM_SMCCC_TRNG_VERSION, &res);
> 	if ((s32)res.a0 < 0)
> 		return false;
> 
> 	return res.a0 >= ARM_SMCCC_TRNG_MIN_VERSION;
> }
> 
> ?
> 


So it will be specific to each FID range, then what is smart about
generic SMCCC logic then ?

We already have
	if (ret != SMCCC_RET_NOT_SUPPORTED)
		arm_smccc_device_register(..)

Not sure what else can be done.

> It means you can never publish a version 2 that is ABI breaking
> because linux doesn't check for that. Was that ARM's intention with
> the version API? It's basically a completely pointless check that
> doesn't effectively do anything.

I didn't get that. The example above checks for minimum TRNG version,
so it won't break in any way for v2. What am I missing ?

> 
> My broader, more general point is that if SMCC is being made into a
> discoverable bus, that's great, but it would be even better if ARM
> could find a way to progmatically enumerate all the ABIs present on
> the SMCC interface to populate the bus. That would necessarily include
> some consistent treatment of versioning for consistent
> interoperability.

Sure, it can be tried for future SMCCC based specs. We can't ignore the
inconsistency that exists in the currently used SMCCC based specs. So it
can't be ideal as you prefer I am afraid.

> 
> > If lower is also set at v3.0, then I would argue it is firmware upgrade
> > issue expecting old kernel with old RSI version supported to work. If
> > that returns v2.0, the driver must work IIUC. Aneesh, hopefully I got this
> > right ?
> 
> There was many long conversations about this and I think the
> conclusion was RSI will broadly not use versions for any kind of ABI
> control. It is too coarse to really work in the real world and we must
> have strong forward/backwards interoperability inside VMs forever.
> 

OK, I wasn't ware of that.

-- 
Regards,
Sudeep

