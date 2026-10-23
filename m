Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FA1E606A323
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 14:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fcjPnfOg;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=uO1JOGeJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9cFpvU8rjQOsVqgPNZEW5UiYjM8XcyLp4rMG1r738y4=; b=fcjPnfOgpagw6p
	RHjMmB1QC3RkxB3jTFu3uKI2QhO2bkhcwDhG3UoJ7W/kUZrFsGKgBBe1KGkB4HKYo5BCy/iESbpxk
	+Mg75gsKFXdzi9+aqT/DL9O9UF3kcz0kXyrZsfQZ0YykbJOYtmP44LtS9q+6zZVjZSWXoHdOIaMMG
	Qjrjk0nbbsuD+aXSjA/AbTrl4tXgZPug/qUlinmx+pc3P4kZlhOjMt8Rc1qvpfmGAW6lfvfISC2dB
	eVMLF4wgKxyP/XdrQk7pL6T6P1EuYn4fOb8pkKH+WJRmyf+xZlydncaDriOULjkO0u+zhOxOSDLOF
	fUZqsYpMXIoRADHvpsyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKG15-0000000GUI4-1aSN;
	Fri, 23 Oct 2026 14:13:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKG0z-0000000GUH6-3ucb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 14:13:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 332821C00;
	Fri, 23 Oct 2026 07:12:57 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 805ED3F673;
	Fri, 23 Oct 2026 07:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792764780; bh=sROtlMFSXp8uwtrjh7+47j+s9WQZKDsosHFNWnr1FVc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uO1JOGeJSJYNIbzJmFHsfepKZP6AX2zPVZE1kT3D//zfaqIfdvtvda8w2tRoZgWlQ
	 SErgyDg5O590mBUXaVfW3D6861ml7bejUJcTEeu9PjsF7XgMt7HmBFlaujXBv0nsay
	 5xPT8YX/1c9+tonQ8JOKmBHNuG2e9gaRtY+jWbhc=
Message-ID: <242e6922-2f40-4afc-ab8f-3405da5ad445@arm.com>
Date: Fri, 23 Oct 2026 15:12:56 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/3] iommu/arm-smmu-v3: Add support for hitless
 replace of CD entries
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Samiullah Khawaja <skhawaja@google.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Kevin Tian <kevin.tian@intel.com>,
 Alex Williamson <alex@shazbot.org>, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 David Matlack <dmatlack@google.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 Pranjal Shrivastava <praan@google.com>
References: <20260925011308.3381953-1-skhawaja@google.com>
 <40a2e1a2-138b-42bf-94ea-a42fda128c22@arm.com>
 <20261023134630.GA3977851@ziepe.ca>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20261023134630.GA3977851@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_071304_011974_411ECA82 
X-CRM114-Status: GOOD (  21.61  )
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
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/10/2026 2:46 pm, Jason Gunthorpe wrote:
> On Fri, Oct 23, 2026 at 01:10:56PM +0100, Robin Murphy wrote:
>> On 25/09/2026 2:13 am, Samiullah Khawaja wrote:
>>> This patch series adds support for replacing IOMMU domains with S1 page
>>> tables hitlessly, that is without disrupting the ongoing DMAs. This is
>>> one of the dependencies of the Liveupdate IOMMU support for Arm SMMUv3.
>>>
>>> S1 domains are programmed by CD entries in the CD table. During a new
>>> domain attach these are updated using arm_smmu_write_cd_entry(). Since
>>> ASID and TTB0 are in different 64-bit words, arm_smmu_write_cd_entry()
>>> considers it a non-hitless update and sets V=0. This means such an
>>> update is disruptive and would generate translation faults if there are
>>> ongoing DMAs.
>>>
>>> Replace the CD entries by using an unused temporary ASID in the
>>> following sequence to allow hitless replacement of CD entry,
>>>
>>> - Update the CD entry with temporary ASID.
>>> - Update the CD entry with the target TTB0.
>>> - Invalidate the temporary ASID.
>>> - Update the CD entry with target ASID.
>>> - Invalidate and release the temporary ASID.
>>
>> Why bother transitioning through a 3rd ASID? The old and new pagetables must
>> contain the same translations anyway, so why not just: switch ASID, switch
>> TTB, invalidate old ASID?
> 
> The target ASID may be in use by another CD someplace else. Doing it
> without the temporary could contaminate it with wrong translations
> from the original TTB0.
> 
>  From a driver perspective we don't know why the domain replace
> operation was triggered. iommufd can trigger it for domains that are
> not identical. Corrupting the target ASID when we don't know for sure
> what is happening is not safe.

If there can be "wrong translations" then the whole thing is 
fundamentally not safe to begin with.

> Obviously Samiullah's use case is hitless between the same translation
> so it doesn't need the extra ASID, but the driver can't know this.

Huh? If it doesn't need to be "hitless" then there is no need to do this 
at all; break-before-make via an invalid CD is fine. If it does, then 
the translations must be identical. Doesn't matter how many intermediate 
ASIDs you go through, any time *one* of them could have fetched from two 
different pagetables, you can't say for sure that an amalgamation of TLB 
entries won't create something which ends up looking like a global 
translation, that then "corrupts" *all* ASIDs.

Thanks,
Robin.

