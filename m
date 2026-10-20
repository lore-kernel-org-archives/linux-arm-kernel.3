Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E806606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 07:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NkNZ4Yty;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=hT0FMsvH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nsk1TBnHNNZnBq+waXcFjtYh5QBDBxbDOQ+y6FKQ1IU=; b=NkNZ4YtyjXBPxovsdwaQclaR95
	MT5UMsdSLT15odAxdt0X8EnGyPjEltCmZg6y0hO6TR4PxQeRz+7x68DkkZVn6k3tvj2dqVkZbrOLW
	lmVD2niFLA6x0xBf0ERoFba4ChhgvyDEm/ZQXNBl62EsTDZUX9czM7tax79i8d9a3/F5hs5Qc/Y+R
	mUH1kFezi+ekW+amT2ZcTEjZBc7oZBIeFrHz7E2c0Ug2kr3XaU1ROR3RwNL8RnCw58GDKNZzjIWGB
	mKkRUz7hG6o6PFXndc8KCsDtrXgb2LfmsKQgidvGWhbaUSVzfPDai/cOr9qZr2p71yjxuIQo79bOs
	M+7FoQcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ42c-00000008zxU-2uXU;
	Tue, 20 Oct 2026 07:13:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ42Z-00000008zwy-41S4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 07:13:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 751F31595;
	Tue, 20 Oct 2026 00:13:38 -0700 (PDT)
Received: from e129823.arm.com (e129823.arm.com [10.2.213.3])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E26573F7B4;
	Tue, 20 Oct 2026 00:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792480421; bh=GFDZO9lDWHSTyGL8dTcjaGMjKJsBdyYUHFP2AjdoHMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hT0FMsvHDoY0xC/ThqYINdXznUSd57GlgnOJyJBc10KgLlLe1GD/rxSzY/nWLPyx6
	 C9dUI9Bo2pjCAB20PL/0HroDt77p2Yv11XhaB2retpKFIyKSp5t6UxkMDstFcMRYyN
	 Ro1MYjF00Y4C7m5+kkKvopB58yZeEfGOfXfGojjM=
Date: Tue, 20 Oct 2026 08:13:37 +0100
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
Message-ID: <atcUoSdggT9eU8YE@e129823.arm.com>
References: <20261019-firme_interface-v1-0-27895c9cebaa@arm.com>
 <20261019233532.GL14213@ziepe.ca>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019233532.GL14213@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_001344_097728_3EB33DF4 
X-CRM114-Status: GOOD (  18.01  )
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

On Mon, Oct 19, 2026 at 08:35:32PM -0300, Jason Gunthorpe wrote:
> On Mon, Oct 19, 2026 at 03:14:32PM +0100, Yeoreum Yun wrote:
> > The Arm Confidential Compute Architecture (CCA) introduces the
> > Realm Management Extension (FEAT_RME), which enables the creation and
> > management of dynamically allocated, attestable trusted execution
> > environments known as Realms.
> 
> Same remark as the other one, this is an attestation subsystem
> driver.. Stuff like this is *exactly* why we are building that.

Yes. I'm keeping in mind.

> 
> Also this is weirdly structured, it should just be one driver under
> drivers/attestation/ that does the measurement register part of firme,

JFYI, FIRME's platform attestation token doesn't have the measurement
register. ploatform attestation token will include the firmware
information (e.g. firmware hash) and verifier checks the firmware
information. the meaurement with RIM/REM will be part of Realm token.
FIRME's PAT is for host attestation and doesn't include Realm token.

Therefore, in the new UAPI, attestation only have the evidance
interface and MR interface wouldn't be used by making mr_cap as NULL.

> it shouldn't have two components and some weird firme_get_instance()
> thing to link them together. That isn't how to build HW drivers in
> Linux..
> 
> Since ARM has bundled different concepts together into one SMCC FID
> range, it probably make sense for the smccc_devices to somehow spawn
> multiple smccc_devices for the various internal software aspects
> rather than have one driver spawn aux devices to split it ..

If FIRME were intended solely for attestation, I think your suggestion
would make sense.

However, considering that FIRME may be extended to support other services,
such as IKE key management, I think having FIRME-related code scattered
across different subsystems would actually make things more complicated.

I initially considered introducing a dedicated FIRME bus as well,
but I felt that would be overengineering.

In my view, it would be better to manage the common FIRME functionality
within the FIRME layer (arm_firme), either through a single FIRME device
or by exposing multiple SMCCC devices for different services.

While both approaches are possible, I personally prefer the former, as it
keeps the FIRME-specific functionality together and provides a cleaner
structure. The individual service drivers could then be associated with
the FIRME device obtained via firme_get_instance() by setting dev.parent.

-- 
Sincerely,
Yeoreum Yun

