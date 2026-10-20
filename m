Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C72FA606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 19:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y7krYmnS;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=FueojkIW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jxi2fFvEa24MYWSBDu89sOuw0Qp/4PEPpzEJpnFw0PE=; b=Y7krYmnSBN8XfSN3rHUHkaaJB9
	SPIl0ieeEMLgnATnWDe/O7r6/163HVh5ZJP1kQSiWQTvEQiJc5C9pK8jY4aWGqmfq1EUewyFZjeEn
	YU9QoeDinyyLWGnTEXXHha9Dw+Ijc3qkBd8KCFPbDfVEK77PTrxnrSwuWlGGE6vH62jwK/fRqTDOK
	Tg7S9loGh9gEnfigd3pvQFjL2CRR1P3ZZ3LtjrS3eVs5c3/d2rasVsWNbOjO1vqH8l2FH4+l5N29v
	saTjlED+soK2oPle14+qfYlNsCpkJbIC7shxZHaim00hRTXm5/ZW7s5pUXJ4GWLPgKgSzcRUslIBr
	vki0FqcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJFUh-0000000AXDi-0Tx5;
	Tue, 20 Oct 2026 19:27:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJFUe-0000000AXDA-1a0r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 19:27:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 93D691596;
	Tue, 20 Oct 2026 12:27:22 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F01F73F7B4;
	Tue, 20 Oct 2026 12:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792524445; bh=cDXIfx6XjE0zhSaK/P3+DuZo6P+vzJag4S/YHbDh6WE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FueojkIW/tSiwfGWb9crQsX5K1mbC+lRJi/M+1eC5fNFkoBCDUU9a9Ff6s0U/l/jF
	 xzjQVZuw46dkbZYBvaZigT9BGNpsWMVEUB7fEKpWhLhBPe+7INi1Hy9Ri2Z4d3FEZO
	 qYPx9mPWIxuRMDcDDMG7XPJpi/ZjAAajAewcFvQA=
Date: Tue, 20 Oct 2026 20:27:21 +0100
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
Message-ID: <atfAmbL7lYkU98_E@e129823.arm.com>
References: <atdvnMJuHUJlqX8t@e129823.arm.com>
 <20261020135006.GO14213@ziepe.ca>
 <atd2_9Q2wTv_3MXz@e129823.arm.com>
 <20261020143620.GP14213@ziepe.ca>
 <atd-I059nHAwcZFE@e129823.arm.com>
 <20261020145806.GQ14213@ziepe.ca>
 <ateGVeZmDcOSxaOD@e129823.arm.com>
 <20261020164755.GR14213@ziepe.ca>
 <atefXz-0cD9viNHK@e129823.arm.com>
 <20261020184737.GS14213@ziepe.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020184737.GS14213@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_122728_559483_F228E598 
X-CRM114-Status: GOOD (  25.96  )
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

> On Tue, Oct 20, 2026 at 06:05:35PM +0100, Yeoreum Yun wrote:
> > > 
> > > > If we implments this with library, are you thinking that file should
> > > > be located at driver/firmware/arm_firme or other place? though we make it
> > > > with library, I still think it should be located at
> > > > driver/firmware/arm_firme or some place in arch/arm64, but as
> > > > perspective abstraction to mange firme helpers in one place,
> > > > I think this design seems good.
> > > 
> > > Will has indicated a preference for driver/firwmare
> > 
> > Okay. with this let me make a driver/firmware/arm_firme as library not
> > a module format and make this library APIs (base, attestation) to be used
> > attestation and other. This means device / driver registeration with
> > smccc and done in driver/attestation/provider but use the APIs from
> > /driver/firmware/arm_firme.
> 
> You should try to structure it with a firme headerfile, and some
> inline helpers to invoke the smcs and then a very small set of out of
> line functions that *are used by multiple firme drivers*.

Might some could be, but want to reduce the time of calling of smc call
for example, to get a shared buffer information, it doesn't need to call
multiple times but enough to call FIRME_SERVICE_FEATURE with BASE
service and cache the result in some where.

That's why I think to provide base service helper, add the arm_firme.c
in /driver/firmeware while all attestation relevant will be located in
/driver/attestation/provider/firme.c

> 
> Don't put attestation in driver/firmware/arm_firme..

Acked.

> 
> You can look at what I did for DRTM for some inspiration
> 
> https://lore.kernel.org/all/11-v2-989a18390eb1+486-arm64_drtm_jgg@nvidia.com/
> 
> After some feedback from Jonathon I think it turned out fairly well.

Thanks.

-- 
Sincerely,
Yeoreum Yun

