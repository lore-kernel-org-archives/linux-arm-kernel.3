Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAFEFCD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 13:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fPCXgtiaTRlNw+XrRu9Mrhi5II9N3m97uCboARgaE64=; b=DXCMCTu2CnYl2hzV+GOQ+i9H4+
	ziqFz2F75PnynGJk7kCcmpf2e2KBUtOcNHM176MWsSu6pe5JdwpTBO296zCFdBQhP/Lh156cU1+fR
	TRRSrSM3ElPp1sgkyAM9EL2Fvh9ZbFNx+j3Z2MBVmz2W02AaDOmdn2EABiz9TLqHcfqHPMFoR916D
	ELcUEukDtC7EfpkTThwuoWWKkJ20NayhNEJCHTcmqfjt8AvuzVsX333qE0z5QTudcpqoWxSbMnu4h
	0fyrLSdV4rDX5U6xuXE/6IRXMrnG5LiBi3QBLEnmgmNogZvrBN/2Cs7hnHIireAIHoH2sitVqUU1Q
	lmMN8Agw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKIa-00000001bfC-2ggk;
	Tue, 19 May 2026 13:15:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPKIX-00000001be7-3agB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 13:15:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BDD3A43788;
	Tue, 19 May 2026 13:15:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F47BC2BCF5;
	Tue, 19 May 2026 13:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779196547;
	bh=Gwwo2EWak0iwDGHZWNHmG6wAwA0ZrKZ9UzaMAHAmmmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DQi3bUFw6VBkHixJTgH3HPk7tFkN7gxRgNt76wjDyQALvsAW6HL6XAM0Sgrcby025
	 2S/xKE/4hMRTUCFfJ+74yRnOadzDpJElrjEMxYJTLSa3ZDJ3JGOpzH6T0hJlNluxAf
	 mTxlCVJXItjlQC1n3J7g68yIgCgDW3hT0fKU6FeNnZIkk/uPgU6UF6ZMJXt0vaBZ9Y
	 3KHIbeudIYaRQEOxuKqYOZaP/4+bwVA089mUMGP3xCwsTfG2rOVDi/sJrNdUTFHilH
	 loeG4KeS1l13W8Tc/uQPjPmuD04wlfins0OjNeu9ZZEqSEh+/UxJHtL+ANA1eGifdv
	 I8sinrVEnZZVQ==
Date: Tue, 19 May 2026 14:15:41 +0100
From: Will Deacon <will@kernel.org>
To: Leonardo Bras <leo.bras@arm.com>
Cc: Oliver Upton <oupton@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Raghavendra Rao Ananta <rananta@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 1/2] KVM: arm64: Introduce S2 walker SKIP return
 options
Message-ID: <agxifbKzGcYQivBz@willie-the-truck>
References: <20260515195904.2466381-1-leo.bras@arm.com>
 <20260515195904.2466381-2-leo.bras@arm.com>
 <agq-RyKhBy4CIThm@kernel.org>
 <agrTQMw4QJX6HGrm@willie-the-truck>
 <agsYF-Dav2bpxWK4@devkitleo>
 <agxa-TydN1PoKsYn@willie-the-truck>
 <agxeEA14cP3yMV1m@devkitleo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <agxeEA14cP3yMV1m@devkitleo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_061549_934909_030A6AB0 
X-CRM114-Status: GOOD (  26.19  )
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

On Tue, May 19, 2026 at 01:56:48PM +0100, Leonardo Bras wrote:
> On Tue, May 19, 2026 at 01:43:37PM +0100, Will Deacon wrote:
> > > > I was wondering along similar lines, but maybe it would be useful just
> > > > to pass a maximum level to the walker logic? That feels like the most
> > > > general case without complicating the existing logic.
> > > 
> > > This proposal seems simpler for me to understand, and indeed looks like a 
> > > better solution than what I have proposed, taking care of  the 
> > > 'already split' case with better performance, as it don't even walk a 
> > > single level-3 entry. 
> > > 
> > > On the 'splitting' case, it also works flawlessly if the memory is given in 
> > > level-2 blocks. There is only one case that I would like to address here:
> > > 
> > > - Memory given in level-1 blocks (say 1GB)
> > > - Walker flag says 'walk down to level-2 only'
> > > - Split Walker on level-1 will break page down to (up to) level-3 entries.
> > > - Walker will continue to be called on level-2 entries, even though it's 
> > >   not necessary.
> > 
> > If you're only visiting leaves, why would it be called on the level-2
> > table entries?
> > 
> 
> Because once the leaf is turned into a table by the splitting walker, it 
> gets reloaded and walked. This is an excerpt of __kvm_pgtable_visit():

Sorry, I was musing about the semantics after adding something to limit
the maximum level. I don't dispute what the current code would do.

> Example:
> - Split this level-1 leave:
>   - Walker creates the whole structure up to given level (currently 3)
>   - Walker returns, gets reloaded, table detected, go down on that one
>   - Level 2 entries walked (which is unnecessary)
> 
> Please let me know if I am misunderstanding something.

I just don't grok why this would happen if we limited the maximum level
to '2' _and_ said we only wanted to visit the leaf entries. In that
case, I wouldn't expect to descend into any of the L2 table entries
(because that would imply going beyond level 2) and I wouldn't expect to
be called for the table entries either (because we're only interested in
leaves).

Will

