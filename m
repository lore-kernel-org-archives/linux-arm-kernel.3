Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D330C87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 16:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3eYsDk8pu6SR1Cnt13efDyi3HIRyBbspXwtf/n8uEOw=; b=ZIyivYGdUGXLxHJsMXkUY+D4hs
	yFdJfSs8Fj5fkIbKBEzUoG6GFUhEPejMYyR/p0yzO2SFrMIwpIAvmhAe7Rrfz6ejwO0ScIOe1/5+D
	i9uU9RDP+ErttRVyayDAj7KGaRie9hrkRYppzMNTEqzRxS8xwucyPzq9Ij7z5n8vvOOb57E7urXFp
	sn+ux2vO7gF1nZeP+SAXKxxTHswAS0pD8wxAmiMt0DcgfFPjJqTo+nDqJ2T/jZu2KHfK4TtW3Asc0
	mZqyFg4RzvvFIBP0aAK+Ny/vjUE2sxJx1ETRJBmGC/qePxXJUeYEMLLAcWsnYhD9LwP1pNf0fpLSB
	1/NXAAFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLJe-0000000AELq-2YHI;
	Fri, 25 Jul 2025 16:30:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufLG9-0000000AE0u-1ac9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 16:27:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 673EE5C6B4E;
	Fri, 25 Jul 2025 16:27:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C5AEC4CEE7;
	Fri, 25 Jul 2025 16:26:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753460820;
	bh=3eYsDk8pu6SR1Cnt13efDyi3HIRyBbspXwtf/n8uEOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bpIORBJMxAPx1S1E3OMZq/aNbSK5qd+hauvg1UdVYAJ3pJ7GXuIjpzY3tn6d0Me+c
	 6M1QecyL3T49tOAOIoUBdVEz2n9ejlO7TjUhAyqWHSIOvPGWqnEjZluqe7XzJYTmY3
	 KE3yz3KeGHH7lmeaM9EB02ae0zkYjl8CBq1OV9rgSL/LdbyO1ORf5h3Vldy+swdY7P
	 jtlDnR+/uWF6u/EfvZnLRYskPiWW6Pql3Y69o9CdR7LThdkiWrnSsExaP6kAxgK7s0
	 hPnoGiQH/pF3e2ItgDWWX1zRKjsZVuW6BIZPZu4z/4KpI9x+BAb0lFX+njywTN51zS
	 jYJIhA2JyG7sA==
Date: Fri, 25 Jul 2025 09:26:54 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Justin Stitt <justinstitt@google.com>,
	James Morse <james.morse@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Tom Rix <trix@redhat.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH 6.1.y] KVM: arm64: silence -Wuninitialized-const-pointer
 warning
Message-ID: <20250725162654.GA684490@ax162>
References: <20250724-b4-clidr-unint-const-ptr-v1-1-67c4d620b6b6@google.com>
 <86frek9182.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86frek9182.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_092701_455898_22C0FE3F 
X-CRM114-Status: GOOD (  13.23  )
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

On Fri, Jul 25, 2025 at 08:30:21AM +0100, Marc Zyngier wrote:
> The correct fix would be to backport the series described in
> e8789ab7047a8, which should be easy enough to apply. it would also
> make 6.1 less of a terrible kernel.

If doing that is reasonable to clear this up, I think that would be fine
to do. This is the only stable-only instance of that warning that I have
seen in the build logs, I have sent patches to deal with all the other
instances upstream. We would need this in 5.15 to avoid failures from
-Werror as well but if it is too hard to backport that series there, we
could just disable this warning for this file since we know it is a
false positive.

The whole reason the warning occurs is due to the constness of the
sys_reg_desc parameter in the function created by FUNCTION_INVARIANT(),
which I am guessing cannot be removed because it is present in
->access() and it proliferates out from there?

Cheers,
Nathan

