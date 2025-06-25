Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518EBC7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 20:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MbdKsFMrWiXAdz6z5VjmjO1NWvH2RnZEyCuJ4jJ9oGE=; b=0dObulRjQ1BzdQHUYj84803Wxj
	YpjXomFDgWN1gwE6Eqj8RlsB5BO9DPkYiyTYBoqBtHFh0XF2yaimRoymyJ4O2qbH8/cHJZNhY7/d1
	RS6GIzCHGBzaTOeoJ0ZtcAtVQJl66vDrSpHKtFDzmhhiRmv7wKuKcxCheyr97XhusRu8C7prHl6Jl
	OL1rN765oJfbp7C+EMNxZdxL4M/SdHdY0cY3BAwvBp72JXopaSbn5+84ese9ODGKTggIshdesA+Li
	5Y1DpvKzsgPhhhQLUt9Nlp8QPOwm6NOpnfqmK2gBp5jngNIdNSDBQ/NM67lGmV/1mPGzSQjplVt58
	JKZ+oAPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUX5S-00000009uz5-3XNa;
	Wed, 25 Jun 2025 20:51:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUTei-00000009RMV-2YY8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 17:11:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7DF4E60010;
	Wed, 25 Jun 2025 17:11:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5690C4CEEA;
	Wed, 25 Jun 2025 17:11:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750871487;
	bh=yuXva1Qx1cHz7GN4Wu1hZkhXNKPSN9nx5xNzcpqFH8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K0ntKY+gftWtEEABQyJCk2YpIwO6IgM/V+h85pu1TsNwn7ZGQHjd4HG45yfqPzkOR
	 rUMmvgeobbNJJvLSkpjzj1Aa/VYV9C/P/239HTiNMWA7YMs3KDRBf5EDvpHL+1KsJZ
	 GJssBRwa4gO9I8ggGtvTalEQmbZkIAncZTLJxp1SnlPbap13hZFLS4bYu5hdq6VpP2
	 dGHSSG00VbsIrGZtiCjHK+Pqd5m5dc4zGJn+FZ2FR7/o8GUx48oqVF/GEfdNMsbVUj
	 B+cWDUY+5TnotdGmlkRKaNNfAwkdVIs+QvWM7ef5Mtliee8D8QibAC5qSwjGTtarfl
	 UYQ83Zagwm4Hw==
Date: Wed, 25 Jun 2025 10:11:18 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>, stable@vger.kernel.org,
	patches@lists.linux.dev, linux-kernel@vger.kernel.org,
	torvalds@linux-foundation.org, kvmarm@lists.cs.columbia.edu,
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de,
	jonathanh@nvidia.com, f.fainelli@gmail.com,
	sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de,
	conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
	Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,
	Julien Thierry <julien.thierry.kdev@gmail.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Andy Gross <agross@kernel.org>
Subject: Re: [PATCH 5.4 000/222] 5.4.295-rc1 review
Message-ID: <20250625171118.GA2987959@ax162>
References: <20250623130611.896514667@linuxfoundation.org>
 <CA+G9fYvpJjhNDS1Knh0YLeZSXawx-F4LPM-0fMrPiVkyE=yjFw@mail.gmail.com>
 <2025062425-waggle-jaybird-ef83@gregkh>
 <CA+G9fYvNTO2kObFG9RcOOAkGrRa7rgTw+5P3gmbfzuodVj6owQ@mail.gmail.com>
 <2025062508-vertical-rewrite-4bce@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025062508-vertical-rewrite-4bce@gregkh>
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

On Wed, Jun 25, 2025 at 09:52:27AM +0100, Greg Kroah-Hartman wrote:
> On Wed, Jun 25, 2025 at 10:03:22AM +0530, Naresh Kamboju wrote:
> > The git bisection pointing to,
> > 
> >   kbuild: Update assembler calls to use proper flags and language target
> >   commit d5c8d6e0fa61401a729e9eb6a9c7077b2d3aebb0 upstream.
> 
> Thanks for that,  I'll go drop all of the kbuild patches that Nathan
> submitted here and push out a -rc2

Thanks and sorry about the breakage. This is a bug that we missed when
d5c8d6e0fa61 was merged upstream because there were no uses of as-instr
for arch/arm at that point but there are in this tree so [1] needs to be
merged and backported with that series. I will resubmit when it lands.

[1]: https://lore.kernel.org/20250618-arm-expand-include-unified-h-path-v1-1-aef6eb4c44ca@kernel.org/

Cheers,
Nathan

