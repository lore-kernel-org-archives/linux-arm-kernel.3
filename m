Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E406C02198
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 02:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y9+hkKcIL5jQkFdJahh9xqkgSYeTDR5t8Rp+kO8v1rA=; b=J3GMUtHVhCa0yzRdsiDH5HIh/R
	dH3c7vNu+w7uP71etxLDQj423Pa8bXXrBxbn68bYKVmidmeJtqEQxmS91fdYTWGNg3YfkP/Xv/QB7
	oNsJvd/5UuwvxHFmI3lzc7q7vBRknffYe3Ymm8cYkxreeITOo5rxuzxubEU6c5vHrL0Q481pO1Mu8
	b+1uarW9SxzK5HTYpK3Ocijfrws9x9O9UVh1Pi0mTcPJlkLYG5+BMWhneJWxFoxkk++lzBYpYB5ZK
	4bGAA43O+uqZMgEl/pXGc1C0CEW5SzUqoESmsxRC9SXByYUWN5c16fVmQ01ZutoCAjKA+45mjIW+S
	anT7/bxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiPFP-00000009XN9-2CHJ;
	Thu, 13 Feb 2025 02:46:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiPDy-00000009XCv-1iyq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 02:45:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2E1A85C5EBC;
	Thu, 13 Feb 2025 02:44:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3773C4CEDF;
	Thu, 13 Feb 2025 02:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739414709;
	bh=rFCOY1gFGh4xAz2GXJr9L5uIUyO+fu9QPIO7RB4RRZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BOQ0ZOY+ohAab/jMFSuCRCoi1bj/2eMme4j6Rf24dK8+5WkbkIA4y7FdCUOCRf5rE
	 1qEuJ1TRWTTOhIOUMb9mYlrTwOcfIDYJ22tgAKwSf/suKWUoLCgo7xpmBa/WOiiCVH
	 Pej3lFI73HOZ7azBj0bA2OxrwEaVJrGOXW4tk2XYe7a+OJXBWDiYCQNSil5j0XOBY5
	 dclODV5/KmDoabmbjCGPQqhKyY/pnJ2rLQI6Ro2nly1H+lKA+6a72bsVVZqI7RhOA1
	 WridrQ1jdH3nBsWML15ZrneuFFhHfn34eYckz4nwv1+LgtKbrUooUUfXV9+x4RzsA0
	 9Vi4ogMe33kRQ==
Date: Wed, 12 Feb 2025 18:45:07 -0800
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Song Liu <song@kernel.org>
Cc: Weinan Liu <wnliu@google.com>, Steven Rostedt <rostedt@goodmis.org>,
	Indu Bhagat <indu.bhagat@oracle.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev,
	Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>,
	linux-toolchains@vger.kernel.org, linux-kernel@vger.kernel.org,
	live-patching@vger.kernel.org, joe.lawrence@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	Puranjay Mohan <puranjay@kernel.org>
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
Message-ID: <20250213024507.mvjkalvyqsxihp54@jpoimboe>
References: <20250127213310.2496133-1-wnliu@google.com>
 <CAPhsuW6S1JPn0Dp+bhJiSVs9iUv7v7HThBSE85iaDAvw=_2TUw@mail.gmail.com>
 <20250212234946.yuskayyu4gx3ul7m@jpoimboe>
 <CAPhsuW5TeMXi_Mn8+jR9Qoa=rAWasMo7M3Hs=im6NT6=+CrxqA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAPhsuW5TeMXi_Mn8+jR9Qoa=rAWasMo7M3Hs=im6NT6=+CrxqA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_184510_500787_289BABFC 
X-CRM114-Status: GOOD (  14.26  )
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

On Wed, Feb 12, 2025 at 06:36:04PM -0800, Song Liu wrote:
> > > [   81.261748]  copy_process+0xfdc/0xfd58 [livepatch_special_static]
> >
> > Does that copy_process+0xfdc/0xfd58 resolve to this line in
> > copy_process()?
> >
> >                         refcount_inc(&current->signal->sigcnt);
> >
> > Maybe the klp rela reference to 'current' is bogus, or resolving to the
> > wrong address somehow?
> 
> It resolves the following line.
> 
> p->signal->tty = tty_kref_get(current->signal->tty);
> 
> I am not quite sure how 'current' should be resolved.

Hm, on arm64 it looks like the value of 'current' is stored in the
SP_EL0 register.  So I guess that shouldn't need any relocations.

> The size of copy_process (0xfd58) is wrong. It is only about
> 5.5kB in size. Also, the copy_process function in the .ko file
> looks very broken. I will try a few more things.

Ah ok, sounds like it's pretty borked.

-- 
Josh

