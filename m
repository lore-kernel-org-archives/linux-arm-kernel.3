Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7554C55822
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 17:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tdo0g0OzljhYp8D7Lk64Y0YwWCc5s5e0e2hV/SX6BIE=; b=pXlCnlx8Zmjh+jDRera85EmpRQ
	odsaGVxJ62yklW+FzzpPhMrCvTTHCzugjzHx/dmwdloIswJhkiUGXNppQZ9rjqiicM3Cq1RSyh9wY
	mgaS3ZGg4Fd9gfQntdQgPgIzQT2Taqk/EV7E26OGscO3dI270v1VtnmBfDXkqnTXHgmszW8BH3afc
	F/dWeGoMusaPgIK0iOScDl4UhbhikqsV5hbw9XsJMkyoWBG3hp8E24/IdHV0IWOTxPJahj+gbQ2ce
	5IV8iMUuqK+UMPWFXzK8nw06ZLc2058ogfVZkKvn0fSc0mQd6h4R312eJCJQCvcsgc+tZqxkNq3wj
	Ad6ZyPhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIs6-00000002UFv-1XLI;
	Tue, 04 Aug 2026 17:24:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrIs4-00000002UFH-3xRg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 17:24:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 053D060A83;
	Tue,  4 Aug 2026 17:24:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD2EA1F000E9;
	Tue,  4 Aug 2026 17:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785864247;
	bh=tdo0g0OzljhYp8D7Lk64Y0YwWCc5s5e0e2hV/SX6BIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FYxC6jQHQoCG8KneX3WjShKc9ImEL+D6mwQ9pJ4Fum1n1E+DR0vkFF0VuzOhnMncP
	 UTljgqnABgSWALppud8dEdIzp5SiDln9LtWdrr/rVNq7njEEP0GxtiVN0R5oIDJb2U
	 XnIHGdreR/x+oGSbu0/tCGhc9JaK+I6u8p9sTcuooOUqhSe2qROtgvgazbhUm2wrIO
	 LvCGtZoIpfCvZN2DiugJVKPNaapL8SdnnBSC+Mfk9BNLtUDlhhGne3ReNiXgdn3Sc6
	 BvWwj5wNaqy7WkfldfQn6woSljyNqfmuyplDKZQV4LLVD7j7gSiOq3gMBYPAQ4dSGQ
	 0wcV7RmRmpNbQ==
Date: Tue, 4 Aug 2026 18:23:48 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: "Christoph Lameter (Ampere)" <cl@gentwo.org>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Yang Shi <yang@os.amperecomputing.com>, Ryan Roberts <ryan.roberts@arm.com>, dennis@kernel.org, 
	tj@kernel.org, urezki@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	akpm@linux-foundation.org, hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com, 
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [RFC v2 PATCH 0/16] Optimize this_cpu_*() ops for non-x86 (ARM64
 for this series)
Message-ID: <anIXr4Kbn59Ac31Y@lucifer>
References: <20260715180455.515692-1-yang@os.amperecomputing.com>
 <0344c559-1959-4531-9265-d5a5180eb7cd@arm.com>
 <fc21c840-1584-4844-963f-80cea7f2e674@os.amperecomputing.com>
 <amCPBrdltFSE_fEf@J2N7QTR9R3>
 <25d1e09b-53e4-7cd5-87db-b58437e4e690@gentwo.org>
 <4887267b-dc26-4c33-96ca-8dff054a0d1f@kernel.org>
 <anHuLy52o5S9Nlwp@lucifer>
 <CAHk-=wgJ0wO=T+1G5zJwoeE-N4bAptCNo2TFirK364iPhnGG6A@mail.gmail.com>
 <dadd8268-3cef-3a3a-e277-b593bef3b788@gentwo.org>
 <CAHk-=wha5um2rB9u7EDeEhZJyaWOUFye-wTKzsykQqJH41RNdw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wha5um2rB9u7EDeEhZJyaWOUFye-wTKzsykQqJH41RNdw@mail.gmail.com>
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

On Tue, Aug 04, 2026 at 09:30:08AM -0700, Linus Torvalds wrote:
> On Tue, 4 Aug 2026 at 09:27, Christoph Lameter (Ampere) <cl@gentwo.org> wrote:
> >
> > We certainly do not want to replicate that approach. We are using the per
> > cpu page tables to avoid address calculations in the VM that other
> > platforms can do with a segment override.
>
> Right, and I said that that's ok as long as it's a internal
> architecture thing. Not a "this is how the VM works".
>
> Because people really have wanted to make it a "this is how the VM
> works" thing. And that is very much what I object to.

Well :) it fundamentally changes how mm works - now we have a whole new set of
kernel page tables and PGD's that we have to think about.

And the series either tries to hack changes that fundamentally alter how
vmalloc works or will add its own duplicative kernel page table code to do the
same kind of thing.

So now core mm has to worry about TLB coherency and synchronisation, how this
might interact with things like page table isolation, and a lot of other
headaches (and I'm not really convinced they've been thought through here).

IOW - breaking fundamental assumptions about kernel page tables is inherently a
whole-VM change (See [0] for instance for an example of what can go wrong).

If Christoph + Yang can provide compelling data that advocates for this change
AND the core mm and arm64 communities agree to move forward with this, then
things are different.

However, I think the best approach here is to find the least invasive way of
limiting the change to the architecture itself.

Mark has put forward an approach that eliminates the exact overhead that this
series aims to address but does so without having to fundamentally alter core
mm assumptions (v2 posted at [1]).

So that seems very clearly to be a better alternative to me.

Ultimately we need mm and arm64 maintainer agreement on the way forwards (or in
the case of a truly isolated arm64 solution, arm64 maintainer agreement).

The LSF session was not encouraging ([2]) and as an mm maintainer I'm not at all
happy with this myself, nor does the arm64 community seem all that enthused so I
would against gently suggest to Christoph to be a little more open-minded about
the the proposed alternative which he seems to have dismissed out of hand.

>
>               Linus

--
Cheers, Lorenzo

[0]:https://lore.kernel.org/linux-mm/20260723-series-vmap-race-fix-v6-0-8cc77dcc0018@kernel.org/
[1]:https://lore.kernel.org/linux-arm-kernel/20260804170503.3513916-1-mark.rutland@arm.com/
[2]:https://lwn.net/Articles/1073395/

