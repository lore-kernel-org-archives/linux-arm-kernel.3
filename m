Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D06D33990
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 15:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G9p4eTT42fRRi/aG3dYCIILkL00If6Y9C4jHec4Ibr8=; b=FbqVXLuKv0DqR2OZhIuoyr5AoA
	qiPeP8Kk1OAn2/YQX91qNruidj8nDvXuC7MiYW15Ozd14qToZMPgRSPYDMHWFJeln2rQu/epF5j3m
	sik0TRQea5hO0hmJz0+sX9grjNSf+tWhXc61v/n5qeXR91YV8Yw8aVtDHvEx33VqLbPn/vobLrOMF
	sA6EJSom5eUT08rtwdxnDzepY0ilzFuq1MVNqmUd8rSDeGcpQaXDtM8OBqXw7+MdOuOSKuTFsOzAL
	3jrAWwGfHSIC5yWvPoIVOOoRc4iB+dfbdfwu8NnHIPlDVrxo78lDITWIbvXDD2/H2AGHU84rIbU1b
	Bz5EfAmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Ry7-0000000BMb7-1zfT;
	Mon, 28 Oct 2024 15:47:47 +0000
Received: from out-170.mta1.migadu.com ([95.215.58.170])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5RLg-0000000BFlF-13ms
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 15:08:07 +0000
Date: Mon, 28 Oct 2024 15:07:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1730128079;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G9p4eTT42fRRi/aG3dYCIILkL00If6Y9C4jHec4Ibr8=;
	b=klecebeplNRZUQqOUCeOw34Qixgb8QzGW9DuqiouxKrHB5W5WWItPRZJ6eKtfTMlUDe4iK
	P8yqkinF5WEWL1Gu34xZIJewEXbVjnWdOU1q18KnQrsf6uigR/0x9ei5xi1pSNykkLLWbC
	dTiCxPfF+le0YHnc3FQM5rMIp+MZwSs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev, Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Steven Price <steven.price@arm.com>, Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>, Zenghui Yu <yuzenghui@huawei.com>
Subject: Re: [PATCH 4/4] arm64: mte: Use stage-2 NoTagAccess memory attribute
 if supported
Message-ID: <Zx-oyZWF12M_ka-m@linux.dev>
References: <20241028094014.2596619-1-aneesh.kumar@kernel.org>
 <20241028094014.2596619-5-aneesh.kumar@kernel.org>
 <Zx-jWyF7xvFS-Vs6@linux.dev>
 <yq5amsiocmb1.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yq5amsiocmb1.fsf@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_080804_657758_B402FD7B 
X-CRM114-Status: GOOD (  22.14  )
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

On Mon, Oct 28, 2024 at 08:22:02PM +0530, Aneesh Kumar K.V wrote:
> 
> Hi Oliver,
> 
> 
> Thanks for reviewing the changes.
> 
> Oliver Upton <oliver.upton@linux.dev> writes:
> 
> > On Mon, Oct 28, 2024 at 03:10:14PM +0530, Aneesh Kumar K.V (Arm) wrote:
> >
> 
> > NOTE: We could also use KVM_EXIT_MEMORY_FAULT for this. I chose to
> > add a new EXIT type because this is arm64 specific exit type.
> >
> > Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> > ---
> 
> I have used KVM_EXIT_MEMORY_FAULT as part of the initial prototype.

Ah, apologies, I clearly didn't read the changelog.

> >> +		/* KVM_EXIT_ARM_NOTAG_ACCESS */
> >> +		struct {
> >> +			__u64 flags;
> >> +			__u64 gpa;
> >> +			__u64 size;
> >> +		} notag_access;
> >
> > Can you please look into reusing the memory fault exit infrastructure?
> >
> > The entire point of that is for KVM to tell the VMM it cannot make
> > forward progress because of ${SOMETHING} unexpected at the specified
> > GPA. You can add a new flag that describes tag access.
> >
> 
> The only reason I dropped the change was because the flag will be very much
> arm64 specific.

Eh, making it arm64-specific is very much the right call. There's no
shortage of available bits in that structure, and we should make no
attempt to provide a generic description of what is otherwise a very
architecture-specific thing.

> Based on your feedback, I will switch to KVM_EXIT_MEMORY_FAULT in the next
> update.

Excellent, thanks!

-- 
Thanks,
Oliver

