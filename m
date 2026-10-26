Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9413606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 19:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kZfrwMJn;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jz1aYOFB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9Q3+v3GR7ZhEH6o1z10j/nYGlQFCqSiOFWl4b/lYCXY=; b=kZfrwMJn3JbwTES3jEbopxsqC+
	sR3KM7tUBURvyhP+POWkStTcba7H8G14murILMImTy9Edi1IoXk1ecTzfNIDic1nTOCqZgaT1Dtxd
	/PwT1kUGal7qhZMjImhCMweVugjj1Cih00Y9o0cfG1qSHFKsSgbTKKJDsRJqqeMYcUOgopc0pHqyB
	LM/f9cFDjylv+95tA7mVjKiroWFp2M0mLb5CEMcORzhEQeicD0v1vW4nxHSvQKSDSbeEUeP/SeDcR
	WKFc87j7QzYiu2W8GQm1bmjsEJ0PWfLWdYucThaIR/AxLFTo/aAJybDbacGdJNe2KMvq4Ajl3Stwl
	6NF0cHyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQ47-000000038Ei-0zMq;
	Mon, 26 Oct 2026 19:09:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQ46-000000038Eb-06Fc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 19:09:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 20F61601EF;
	Mon, 26 Oct 2026 19:09:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 901031F01825;
	Mon, 26 Oct 2026 19:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793041740;
	bh=9Q3+v3GR7ZhEH6o1z10j/nYGlQFCqSiOFWl4b/lYCXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=jz1aYOFBJsbfbEPwQpmnRudtsa80TD5qRFNVVS7AgOHc5hvYzADRoZlGJEDhhBxmR
	 zCSsxcpMkiEnbpW3nOco7+Pbad36IMfT3gJihWaLaS0UW0IXmKx5UtUpW9LR5RbuiL
	 rFV9eFb9xaPHWFakuPr6xjhFFijS+Z4wCdD/n6vL5bHTsx9i43LBhtoQTe8da+tiAL
	 x1+XsFelr9T4yiOhM0UUZTIZWJijssSK19m/UG/o8hk4kMEils2nhc6TPrxN7cTa9N
	 BhdA8CIXZKSKmg29OjyRfDkheBjDC8mQM7v3rBaRNzPWCfhCTBMTT0LOm1iN6iErJ0
	 oeEMbzoiE6j2g==
Date: Mon, 26 Oct 2026 12:08:59 -0700
From: Oliver Upton <oupton@kernel.org>
To: Leonardo Bras <leo.bras@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	Tian Zheng <zhengtian10@huawei.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/3] Set DBM bit on writable pages
Message-ID: <at-lSy7H-K60LhCB@kernel.org>
References: <20261026144413.441566-1-leo.bras@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261026144413.441566-1-leo.bras@arm.com>
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

On Mon, Oct 26, 2026 at 02:44:06PM +0000, Leonardo Bras wrote:
> When HAFDBS is enabled (VTCR_EL2.{HA,HD}={1,1}), having a DBM bit allows 
> hardware to promote a non-writable page to writable by setting (S2AP[1]=1),
> without having to take a fault.
> 
> The reason for this patchset is to add the DBM bit when setting-up writable 
> pages, so the code is prepared for future patches that make use of 
> HDBSS/HACDBS to accelerate dirty-tracking. Write-bit detection still 
> happens based only in S2AP[1], so no change in that aspect.
> 
> Having DBM set on block entries is undesired, as we benefit from the first 
> fault for splitting it in PAGE_SIZE entries, which is the granularity used 
> to track the dirty pages in KVM. So introduce a new walker that, on top of 
> clearing S2AP[1] for every entry, also clear DBM for block entries.
> 
> Also introduce a new VCPU request to reload Stage2, as it will be needed on 
> future HDBSS/HAFDBS patchsets. 
> 
> Please let me know of what do you think!

I'm pretty sure I shared this feedback before, but patches that enable
DBM do not make sense in isolation. We need a single series that
contains the DBM enablement as well as the corresponding HDBSS support.

> Changes since RFCv1:
> - Dropped patch #5 on enabling HAFDBS on non-dirty-tracking guests, as it 
>   proved to be counter-productive on wrprotect, contrary to expectations
> - No more moving writable-bit to DBM. That does not seem to be the intended 
>   use. It makes sense and it's easier to convert code to new DBM approach.

Sorry, where was this concluded?

The abstract permission flags need to have a WRITE an DIRTY state, which
we then map to hardware based on the capabilities of the system.

!FEAT_HAFDBS:

	DIRTY	=> S2AP[1]
	WRITE	=> S2AP[1]

FEAT_HAFDBS:

	DIRTY	=> S2AP[1]
	WRITE	=> DBM

Beyond making the whole HAFDBS easy to reason about, I want this for
FEAT_S2PIE which reimagines bit 7 as a literal dirty bit that can be
managed by software or hardware.

Thanks,
Oliver

