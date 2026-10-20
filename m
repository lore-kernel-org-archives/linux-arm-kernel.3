Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3EC7606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 17:06:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=B+/zDpW2;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=C5kzCuEo
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sfkxhp2YPni25pk9lAqihLFxxjnCFT2yCSxPUm/Y7qE=; b=B+/zDpW2qT/WwxlTFhW67qmpAp
	LmNPlp/2ju0zDcWUEdHe199t5S277rScD5todWZsvqHPj4TUxY27fD1vk7QwMmZlS74Ixn4vrYmrH
	IrkK0OncMHQ0a4lujNIz6DofiN8ZqMxsLKLO5eOjb8t9sLJiIYRtwlDNK2dZ7FiUVj+T2NR+o/NEO
	yOiEgABX57L4bP68YZlPbOctUB7weuwdmro0S5sqHaMLUUAgbA3rwYTWIQCIR6xHeTcqwvjx+lUox
	e0FPSVU9THaUH4BDxt//z8Qa6hm+TQ5ZyOoF73pn1pGZKsfwLmcswn84ELv5FvrF1OA4iZFBIvK30
	ViYsEM9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJDHT-0000000AJIN-1xuh;
	Tue, 20 Oct 2026 17:05:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJDHQ-0000000AJHW-3cgl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 17:05:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F28FB1596;
	Tue, 20 Oct 2026 10:05:35 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D8973FA32;
	Tue, 20 Oct 2026 10:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792515939; bh=Neo80ApyG7pQv+dI5x32cAG8lDQTvw41mtuVfq5grwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C5kzCuEoVbtzk+iW3NiFBraTqEDwSW05GvXjZNIJKIssRTnabAGY5qnWFeWvi7Qrp
	 TsaXg2Z0gZK/lvymuXrTeeDT/lr/mR7zPSYfXJYakHbJbwEpSieg2+zHedWdYsLZYn
	 HUDilYCH9SJKM7sJBM72OfetZnIlq+7/+PNz4g5o=
Date: Tue, 20 Oct 2026 18:05:35 +0100
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki Poulose <suzuki.poulose@arm.com>,
	Steven Price <steven.price@arm.com>,
	Sami Mujawar <sami.mujawar@arm.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Jiri Pirko <jiri@resnulli.us>, GONG Ruiqi <gongruiqi1@huawei.com>
Subject: Re: [PATCH RFC 0/3] firmware: arm_firme: introduce FIRME support for
 host attestation
Message-ID: <atefXz-0cD9viNHK@e129823.arm.com>
References: <atcUoSdggT9eU8YE@e129823.arm.com>
 <20261020124536.GM14213@ziepe.ca>
 <atdvnMJuHUJlqX8t@e129823.arm.com>
 <20261020135006.GO14213@ziepe.ca>
 <atd2_9Q2wTv_3MXz@e129823.arm.com>
 <20261020143620.GP14213@ziepe.ca>
 <atd-I059nHAwcZFE@e129823.arm.com>
 <20261020145806.GQ14213@ziepe.ca>
 <ateGVeZmDcOSxaOD@e129823.arm.com>
 <20261020164755.GR14213@ziepe.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020164755.GR14213@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_100541_234808_019B2379 
X-CRM114-Status: GOOD (  40.26  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Oct 20, 2026 at 01:47:55PM -0300, Jason Gunthorpe wrote:
> On Tue, Oct 20, 2026 at 04:18:45PM +0100, Yeoreum Yun wrote:
> > On Tue, Oct 20, 2026 at 11:58:06AM -0300, Jason Gunthorpe wrote:
> > > On Tue, Oct 20, 2026 at 03:43:47PM +0100, Yeoreum Yun wrote:
> > > > On Tue, Oct 20, 2026 at 11:36:20AM -0300, Jason Gunthorpe wrote:
> > > > > On Tue, Oct 20, 2026 at 03:13:19PM +0100, Yeoreum Yun wrote:
> > > > > > > I wouldn't over complicated it. We already have smccc bus to do this,
> > > > > > > we don't need layered stacks of busses here. Just change smccc bus to
> > > > > > > be able to break up the multi-function SMC into several devices.
> > > > > > 
> > > > > > I think my explaination was poor. Apologise...
> > > > > > I'm not saying another bus making but just wrapper of smccc-bus APIs
> > > > > > for firme specific and definietly, this would separate the
> > > > > > multi-function SMC to defien each firme device (attestation and IDE).
> > > > > 
> > > > > I don't see that kind of complexity is necessary.. I think it is
> > > > > better to just have the root smcc bus spawn them 
> > > > > 
> > > > > > But, the *base* is common. and I couldn't find any proper location to
> > > > > > deploy *common* code unless making arm_firme.
> > > > > 
> > > > > What common code excatly?
> > > > > 
> > > > > There shouldn't be? Getting an attestation is entirely orthogonal to
> > > > > set link ide, for example?
> > > > > 
> > > > > If you can identify what you think would ever be common that might
> > > > > help clarifgy what to do..
> > > > 
> > > > I mean the BASE service of firme and typical example is shared buffer
> > > > allocation. I agree IDE and attestaion service are orthogonal. but
> > > > in case of base-service is not. it could be used for both service.
> > > 
> > > It doesn't look like it needs a "shared buffer", just allocate it
> > > right before invoking the SMC that needs the memory. Use a simple
> > > library function to help allocate it. No need for a struct device
> > > layer.
> > 
> > Retrieving a PAT requires a buffer shared between the worlds. Before
> > allocating that buffer, the driver needs to query its requirements
> > through the BASE service's feature-query calls.
> 
> So? Make the query, allocate the buffer, get the token, free
> it. Simple, one driver, no convoluted flows. Use a little library
> style call or inline to reduce duplication if eventually necessary.
> 
> > Considering possible extensions to the BASE service, my preference
> > would be to expose these operations through firme_device rather than
> > standalone library functions. The intention is to keep access to the
> > BASE service within FIRME-specific drivers and provide a consistent
> > interface for those drivers.
> 
> Try not to overdesign things. If we don't know we need it now based on
> how the current spec works don't imagine something else.
> 
> ARM spec design is informed by Linux implemetnation. Having a sane
> simple implemtnation in Linux will motivate future specs changes to
> align better.
> 
> > If we implments this with library, are you thinking that file should
> > be located at driver/firmware/arm_firme or other place? though we make it
> > with library, I still think it should be located at
> > driver/firmware/arm_firme or some place in arch/arm64, but as
> > perspective abstraction to mange firme helpers in one place,
> > I think this design seems good.
> 
> Will has indicated a preference for driver/firwmare

Okay. with this let me make a driver/firmware/arm_firme as library not
a module format and make this library APIs (base, attestation) to be used
attestation and other. This means device / driver registeration with
smccc and done in driver/attestation/provider but use the APIs from
/driver/firmware/arm_firme.

Thanks for clarification. let me post next RFCv2 after initial
attestation subsystem is settled in :)

-- 
Sincerely,
Yeoreum Yun

