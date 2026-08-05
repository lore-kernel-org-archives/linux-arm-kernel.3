Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3FBC55822
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 08:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GmYyrdZe1B0PBpV7nWZEHOZ78x8Fhml0/nyFckT8Q5U=; b=RqLhCsQOsz3lQOXotvfVXecIor
	OOPBHUDg21tpVoOyEuZPg6GZKiocMsPZH8O1bUdub5FHJYwyxVkEzTr1wI44y4jQUrfbFVvCD68la
	AH6aO4O7f6Cl4hjP3YFIKlN4BQJ9pBoyEqiRupaizNnVIJWM+aaiXe3+R+f0OzRFaRLCidMVoTNrH
	IB/jNUurqmHOs8SEQH/jmx60CvEkZFC+ppqxJhf7qjTBivyNP7m5txX83XMd6nSLHa/1FnFwpNQT0
	cQAvdA9gdwVgeCWnkIoE6f+WY3oTIbPggAtacDsr53cW+E1LEhx/izyy3DWp8qHzrauJeuFERQa7E
	mjiOTCgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWo0-00000003VwI-0j0R;
	Wed, 05 Aug 2026 08:16:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrWny-00000003Vw2-2Xdd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 08:16:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 124D7600AE;
	Wed,  5 Aug 2026 08:16:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B6411F000E9;
	Wed,  5 Aug 2026 08:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785917809;
	bh=GmYyrdZe1B0PBpV7nWZEHOZ78x8Fhml0/nyFckT8Q5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T1dfoJYrP3ggTDguqaQhaDmZLHe3mJjru4jCT/1ANuiGL1fot3+s/dHfHfhjYoyEX
	 Y/aoGoTTs2LxtCJHGd5OZv4Owb8anEX7nZ58Cgw3J9H/zzQiBn6w/oiPjSeGxP3u+E
	 mYDuXnJmHjwfW6tfBp1xS0WGTKuLh8ZX8Yh8rSfPMcpsINud33uvR4MdiF0syKhk7T
	 utgpQXaaxlwgXTCPSMKCC9+pkhuX90w61xunWQsdzZiRliIxSsrtcJDlhjr4Ykn/nQ
	 XHnITQrz2tNu+rbNWvGoQt9hshksDufbzvK3Orz/AFL06/C0FFAzaDTVmR0YTcEHVn
	 UuniWlaO51HGw==
Date: Wed, 5 Aug 2026 09:16:30 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Yang Shi <yang@os.amperecomputing.com>, Ryan Roberts <ryan.roberts@arm.com>, dennis@kernel.org, 
	tj@kernel.org, urezki@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	akpm@linux-foundation.org, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC v2 PATCH 0/16] Optimize this_cpu_*() ops for non-x86 (ARM64
 for this series)
Message-ID: <anLr5Xd-sD7frihN@lucifer>
References: <amCPBrdltFSE_fEf@J2N7QTR9R3>
 <25d1e09b-53e4-7cd5-87db-b58437e4e690@gentwo.org>
 <4887267b-dc26-4c33-96ca-8dff054a0d1f@kernel.org>
 <anHuLy52o5S9Nlwp@lucifer>
 <CAHk-=wgJ0wO=T+1G5zJwoeE-N4bAptCNo2TFirK364iPhnGG6A@mail.gmail.com>
 <dadd8268-3cef-3a3a-e277-b593bef3b788@gentwo.org>
 <CAHk-=wha5um2rB9u7EDeEhZJyaWOUFye-wTKzsykQqJH41RNdw@mail.gmail.com>
 <CAHk-=whjfRaeYsAVS9VfYO5uaSB43sT7zPOmNWR6gC8h=t60=g@mail.gmail.com>
 <anIhSGs70TTzymHM@lucifer>
 <8d6119c7-2216-fcdd-d0b9-cc60ccc8caf3@gentwo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8d6119c7-2216-fcdd-d0b9-cc60ccc8caf3@gentwo.org>
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

On Tue, Aug 04, 2026 at 02:40:27PM -0700, Christoph Lameter (Ampere) wrote:
> On Tue, 4 Aug 2026, Lorenzo Stoakes (ARM) wrote:
>
> > On Tue, Aug 04, 2026 at 10:01:45AM -0700, Linus Torvalds wrote:
> > > So I'm just trying to clarify my stance - I don't hate percpu TLB
> > > contents per se. I hate the notion of codifying them.
> >
> > I do worry that changing per-CPU data structures to support this is exactly
> > codifying this (and will encourage other arches to follow suit).
> >
> > And I really don't think there's any way to implement this without
> > fundamentally changing core mm or assumptions that core mm can make.
>
> Would it be possible to discuss the technical issues instead of throwing
> up this and that foggy objection? Lets not get into the complexities of

Christoph this is very unhelpful. I and other maintainers have raised
_specific_ and _technical_ objections. If you are having comprehension
issues it'd be more constructive to ask questions.

It's really simple - convince us or the series doesn't go upstream.

>
> The fundamental problem is that your patchset does
>
>
> <preeamble establishing restart point>
> RMV per cpu op
> <post handling cleaning up setup of restart point>
>
>
> What x86 does and what we can get ARM to do is:
>
> RMW per cpu op
> Why do you think that your solution that requires a complex restart
> mechanism is better?
>
>
> These are operations that are key to the performance in critical parts of
> memory management and this code is replicated by being inlined thousands
> of times in the kernel.

I mean this is just silly :)

Provide data to back any of this, and no your benchmarks of your approach
vs. nothing isn't it, nor do they demonstrate anything about what you claim
here.

You've been asked for this multiple times now.

(And please no hand waving about 'critical parts of mm'. Be specific
please.)

>
>

--
Cheers, Lorenzo

