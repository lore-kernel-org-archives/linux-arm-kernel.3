Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B26F5C98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 05:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Bt5dcvEtscZwbFsTWKayy1TU+NMdGF6W9YAquY9XwI=; b=0Qrw5J3kZQhNOMlhDNYFWz9yEG
	Pwv+mNuHIE+gWuBXOy+SaTXtWNJoEpXfWZvdtD0D6V2EOP9TnxJLYH87IFAIZuAcWxg0WUmubS1Nj
	4sF+nObRKZ6nDDABk5TwebOiNnnq09qFyA74iRuKJdoUyvc9LN7M+JpSQ0/q0uIbqQ6o2v1wVSqCZ
	J5s36URtKr5AHly9CEPB15FN+Q93jb2Mrd+6QolAIY5MSUb5ucVLnZDGSnBJC9X9ow3Ogd8QtzRdu
	C65ZsHJZhGSO93IgVlM2ijXA0bMRZR+mCLGfhey+ta7tgGj84Qc9Y6GqUeEhEqBcs+YHgZ+/CTK50
	JjFyl9+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9FB4-000000079tl-0FyQ;
	Wed, 23 Sep 2026 05:05:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9FB3-000000079tf-0LK8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 05:05:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 674AA600AA;
	Wed, 23 Sep 2026 05:05:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79C081F000FF;
	Wed, 23 Sep 2026 05:05:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790139952;
	bh=5Bt5dcvEtscZwbFsTWKayy1TU+NMdGF6W9YAquY9XwI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=m4pTLW9/ipMMEsohyLQEKqXjzHcwkN0abxqiFKnpytgFKVUrqceMZuAAbjlrBMffF
	 CdO1sqCGy/I+4fa+zUShWoTBNHwKuZyGA0wUgCZuN/1qgzhc19lMpVXwyE3kopIDPh
	 xsaF5GYCT9jld3YBh7sBjzHUGLsx/yj0S9EyAhn3oG6QwlUWCR4A3ADfsDf0GA8d70
	 LLyo/WDzrdcRjJT3saEv0417Vyorzdv9KtCxM/YNHdqRTmqIJwT5iDboIP2AvVAhAl
	 9BI9XEA2qlyxB1A/jRfmI8xO2B26EOiIXB5Dudw7TzaVJ3eh185kcBwpIEV1sD+FUg
	 BVMT6WrzF0mJg==
X-Mailer: emacs 31.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>,
	Christian K?nig <christian.koenig@amd.com>,
	linux-coco@lists.linux.dev, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	Marc Zyngier <maz@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Will Deacon <will@kernel.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	"T.J. Mercier" <tjmercier@google.com>
Subject: Re: [PATCH v6 7/9] dma-buf: system_heap: Enforce shared-granule
 alignment for cc-shared buffers
In-Reply-To: <arKhCKdlqNQwZn8E@arm.com>
References: <20260918153642.GD11599@ziepe.ca>
 <d8123f21-d5ce-415b-a05a-392d97b8b57d@amd.com>
 <20260918165315.GF11599@ziepe.ca>
 <6115eaf7-21bc-49ce-8a74-08fd37a1e2c9@amd.com>
 <20260921115141.GJ11599@ziepe.ca>
 <45dd7a2f-8474-4388-b383-2dee3ee62206@amd.com>
 <20260921121739.GM11599@ziepe.ca>
 <cd2b32dc-5a80-4ef5-82bc-dd41ea96dc01@amd.com>
 <20260921123725.GN11599@ziepe.ca> <yq5a1pam4ocu.fsf@kernel.org>
 <arKhCKdlqNQwZn8E@arm.com>
Date: Wed, 23 Sep 2026 10:35:44 +0530
Message-ID: <yq5ald8s36c7.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
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

Catalin Marinas <catalin.marinas@arm.com> writes:

> On Mon, Sep 21, 2026 at 08:56:41PM +0530, Aneesh Kumar K.V wrote:
>> Jason Gunthorpe <jgg@ziepe.ca> writes:
>> 
>> > On Mon, Sep 21, 2026 at 02:24:21PM +0200, Christian Knig wrote:
>> >
>> >> I also don't see where mem_cc_shared_granule_size is added?
>> >
>> > Patch 1:
>> >
>> > https://lore.kernel.org/all/20260904103452.1197239-2-aneesh.kumar@kernel.org/
>> >
>> > Aneesh, please be sure to use get_maintainers on series like this so
>> > everyone gets cc'd.
>> 
>> For v7, I included only the maintainer entries because the recipient
>> list was getting too long, but I added the mailing lists.
>
> I could not see Christian in the recipients of v7. Sometimes the list cc
> is enough but my inbox for example is already around 4000 new email, so
> easy to miss.
>

He is already on the Cc list for v7.

>
> Recommendation: add Cc: lines to each patch with the people that must
> ack your changes (the maintainers for those specific patches). You can
> then collate all the cc's from your patches, add them to the cover
> letter and use --cc-cover with git send-email.
>

I'll do this 

>
> Of course, the list can get large. You can then make a call with who to
> drop: colleagues you talk to regularly can be skipped for example, maybe
> reviewers if there are too many for a subsystem. I would not drop people
> that gave you feedback already on a previous version and not the
> maintainers you need acks from (you can drop them if they already acked
> your patches).
>

sure.

-aneesh

