Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA14E77180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Dec 2024 22:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pIkJ82YpAd373Lm3jdjH7WVok+Vci+XmzlJ+wlUvg10=; b=Nxrtlb1WT4gL7KxPkBY4CuhJvZ
	LVKj+ldI2BNNybpsKdpsW4vbR+uQCZNBgrZc9Ndy59bIDTxcMRdJh35QgW0i6jRRJRndyIOyPQ+Tf
	pkJYK9qEjR9XcMwIEM1jjxwKPZtCVHS3mndlXjcYCTuA8pqAIYRodQI8jNdXEhD5FbwCYHNIzKy8x
	j22Jm/IIbBrC7OsMc0IU5+V3PfwTIKAKrXEajv3DXKV0HFKXLe6QtjNVF8f4HOszRM5xj9yXoOE6Z
	kURd0AD51N1oW/xMq6Hz/PFH4UOF5JKiG2OyzsMHkLdU0igebSJAKwa5+zLILA2JMDiXjO/vQxEci
	qGDQJgsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVST-0000000GOXW-0U0R;
	Wed, 11 Dec 2024 22:45:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVNb-0000000GNcd-334Q
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Dec 2024 22:40:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=pIkJ82YpAd373Lm3jdjH7WVok+Vci+XmzlJ+wlUvg10=; b=lM+q9zzF2gghkRr0niyhRLE5w/
	/96eCu5ooUNXfVLQmRBSDSCfieo9G/M31xEAVrzAq9OeVRC9XKCgQr6Lj3FRymQtrcGEy+7nRVoYT
	5HTrmP6Y6uhrJMrW671Voe9hm+kPQMCuwp2bp9DKFeCWi+fzEDErkNQY0lPpWNv51KDLPsiw9vBds
	1zBJdGPxzq1FgxJt6QPK3sGJGJ0QkSoJyXQWgbkKoaYStYuAlH1W1V4YbU5RYCld5kooXKZNVbtof
	6pCNFhzKHRLNKbvTi7bo4j2F+lwA33dGHo8froysl27pGeO0/pdNlIUM6WjEJz0KYlbEmBj+GJMGl
	mJbSArIg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLVNY-00000003trA-2kWT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Dec 2024 22:40:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E94285C543F;
	Wed, 11 Dec 2024 22:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1AC7C4CEDD;
	Wed, 11 Dec 2024 22:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733956821;
	bh=hD8/P8msz1Ork95b5s3aX3duWl/S0eBHHPkq0olmuXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Leq5SNJmh6z5QJtQMQJACDt4lasqGOaOAngRVE/wMFXEMuvlApieRAfGYeEFX5tO8
	 VfHDAn0SvseO7e2tofEC7y9LdInHBx3a8tqkg8rNdP2ITGLM3up/IODHssACnpduCw
	 jOOZ7cxJ/gdeOc95Tvs6I3FdIviZ8j+MIXIEMnR9vWY1KDwdn+l61JI1Pg0lucDqcl
	 WFPZn/cFhqetVURxnNv5m3tCf1k/WG/6JOaU9CSA9NZnuzpDjMy2qm1Okr82ArcRKd
	 ODhqdafz6ncwa62FO6sN1Y8fSqrYW7eTe0ETHyx6wlklenvH9UKWPs3Ic+PzxhDLdV
	 mu4oOmWLtF9ww==
Date: Wed, 11 Dec 2024 22:40:15 +0000
From: Will Deacon <will@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 2/9] arm64/sysreg: Update ID_AA64ISAR3_EL1 to DDI0601
 2024-09
Message-ID: <20241211224015.GB17836@willie-the-truck>
References: <20241203-arm64-2024-dpisa-v3-0-a6c78b1aa297@kernel.org>
 <20241203-arm64-2024-dpisa-v3-2-a6c78b1aa297@kernel.org>
 <20241210170953.GB16075@willie-the-truck>
 <b859bdcd-7343-4d53-9f3a-f374deca725a@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b859bdcd-7343-4d53-9f3a-f374deca725a@sirena.org.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_224025_065133_88F9AD81 
X-CRM114-Status: GOOD (  17.09  )
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

On Tue, Dec 10, 2024 at 06:43:05PM +0000, Mark Brown wrote:
> On Tue, Dec 10, 2024 at 05:09:55PM +0000, Will Deacon wrote:
> 
> > Can we _please_ just generate this stuff. It feels like we've been
> > making silly typos over and over again with the current approach so
> > either it's hard or we're not very good at it. Either way, it should be
> > automated.
> 
> > Others have managed it [1], so it's clearly do-able.
> 
> Yes, the issues here are not technical ones.  Though there are some
> complications -  eg, IIRC the XML doesn't encode the signedness of
> fields like we do and there's areas where we've deliberately diverged.
> Given the amount of review I end up having to do of sysreg changes your
> reasoning is especially apparent to me.  I've passed this feedback on
> (again).

One thing we _could_ do is have a tool (in-tree) that takes two copies
of the sysreg file (i.e. before and after applying a diff) along with a
copy of the XML and, for the the new fields being added, shows how the
XML represents those compared to the diff. It should then be relatively
straightforward to flag the use of an unallocated encoding (like we had
here) and also things like assigning a field name to a RES0 region.

So this wouldn't be generating the patches from the XML, but more like
using the XML as an oracle in a linter.

Will

