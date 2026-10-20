Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65DC4606A32F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 16:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KrIQcRtV;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=pBQbK8i4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ewCscBlQYB+vPK+Xqfw+9Sad8O9fhIaGkOJBrs7Ba7g=; b=KrIQcRtV6KefENco2giucQRXMP
	WYpJjdMCLivs8l0SbhCDg66aa9lZ5chytJPk3vkFUhzOY/8u29qGBblP/v+voSMGd6WNHDjxZBfvG
	Uxe5xj1u7yRogsVjAH3OsT2CFLW1/mqNWxN/fykKX3XhF1oAlpZg3bE+b+ZbCf5IhAYzo7nUROprJ
	+VkFd35p8c7TlNcLxgrM1tbvasnAtr2RG5iNPEz309MRE3zwlZ30u1xZnWdEzcTuiVOTCRIVg5KFR
	xtYhb/1h912Tlbr59UHsov6JVhSox+V3CN6aLyq5XO3CjRSzF5xNV4ab/GcYbvAa4no1XM1MRgNAq
	DoxNvnpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBcJ-0000000A2vJ-0M1c;
	Tue, 20 Oct 2026 15:19:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJBc7-0000000A2u8-38ZZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 15:19:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9696C16F8;
	Tue, 20 Oct 2026 08:18:46 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 41D4A3F7B4;
	Tue, 20 Oct 2026 08:18:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792509529; bh=VVwbVMu3i3VOH5ngKiwj6CES+RBeJ4MGRARMfIf4G14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pBQbK8i4l9pOUPMWXQ1WQfoQqwIORc53q0so0n3LGglh5gBf3+6HVs2LB5P6/tIFY
	 A/ETnN4nuSj4xrX5PCK24vqwAz7+Ywh/M99cizAFaJVbllju7sY/4kYjkuSoGURBzf
	 wiL6IdcWDiLqRTSdyuq/ng7bb4Rnf941BgX1oAAk=
Date: Tue, 20 Oct 2026 16:18:45 +0100
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
Message-ID: <ateGVeZmDcOSxaOD@e129823.arm.com>
References: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
 <20261019233532.GL14213@ziepe.ca>
 <atcUoSdggT9eU8YE@e129823.arm.com>
 <20261020124536.GM14213@ziepe.ca>
 <atdvnMJuHUJlqX8t@e129823.arm.com>
 <20261020135006.GO14213@ziepe.ca>
 <atd2_9Q2wTv_3MXz@e129823.arm.com>
 <20261020143620.GP14213@ziepe.ca>
 <atd-I059nHAwcZFE@e129823.arm.com>
 <20261020145806.GQ14213@ziepe.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020145806.GQ14213@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_081856_364160_E65C2A2D 
X-CRM114-Status: GOOD (  30.87  )
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

On Tue, Oct 20, 2026 at 11:58:06AM -0300, Jason Gunthorpe wrote:
> On Tue, Oct 20, 2026 at 03:43:47PM +0100, Yeoreum Yun wrote:
> > On Tue, Oct 20, 2026 at 11:36:20AM -0300, Jason Gunthorpe wrote:
> > > On Tue, Oct 20, 2026 at 03:13:19PM +0100, Yeoreum Yun wrote:
> > > > > I wouldn't over complicated it. We already have smccc bus to do this,
> > > > > we don't need layered stacks of busses here. Just change smccc bus to
> > > > > be able to break up the multi-function SMC into several devices.
> > > > 
> > > > I think my explaination was poor. Apologise...
> > > > I'm not saying another bus making but just wrapper of smccc-bus APIs
> > > > for firme specific and definietly, this would separate the
> > > > multi-function SMC to defien each firme device (attestation and IDE).
> > > 
> > > I don't see that kind of complexity is necessary.. I think it is
> > > better to just have the root smcc bus spawn them 
> > > 
> > > > But, the *base* is common. and I couldn't find any proper location to
> > > > deploy *common* code unless making arm_firme.
> > > 
> > > What common code excatly?
> > > 
> > > There shouldn't be? Getting an attestation is entirely orthogonal to
> > > set link ide, for example?
> > > 
> > > If you can identify what you think would ever be common that might
> > > help clarifgy what to do..
> > 
> > I mean the BASE service of firme and typical example is shared buffer
> > allocation. I agree IDE and attestaion service are orthogonal. but
> > in case of base-service is not. it could be used for both service.
> 
> It doesn't look like it needs a "shared buffer", just allocate it
> right before invoking the SMC that needs the memory. Use a simple
> library function to help allocate it. No need for a struct device
> layer.

Retrieving a PAT requires a buffer shared between the worlds. Before
allocating that buffer, the driver needs to query its requirements
through the BASE service's feature-query calls.

Considering possible extensions to the BASE service, my preference
would be to expose these operations through firme_device rather than
standalone library functions. The intention is to keep access to the
BASE service within FIRME-specific drivers and provide a consistent
interface for those drivers.

With this approach, arm_firme would handle the low-level FIRME calls
and their associated helpers, while the attestation driver would use
the service operations exposed through firme_device. This would keep
the attestation-specific logic separate from the details of the FIRME
interface and changes to its implementation.

If we implments this with library, are you thinking that file should
be located at driver/firmware/arm_firme or other place? though we make it
with library, I still think it should be located at
driver/firmware/arm_firme or some place in arch/arm64, but as
perspective abstraction to mange firme helpers in one place,
I think this design seems good.

-- 
Sincerely,
Yeoreum Yun

