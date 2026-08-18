Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8695EC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 17:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hcD1cr7UQPZGV1CZ99tI4YDeunETgJ5XLCW/qpgT2hU=; b=EtiYmbGyWLltRZyX5pnLDLTShE
	dG6zdaEu4TYAGLMUC5jeANsCgPqs3aSJgd8joEpeZJoRsdts4ckO5Z5dMLAWYKGk9gFSwLNirVR1U
	AOmmhIHtUK/r9F7Vl6wxGHDWfQai5MKmGQFXbZGvQY8c9op82vneVNksnND6igf/Oswe3HgCx+nao
	ODvwEm0vSUcQYt4SxDedn2onkYldmlnMlop9nYFVgFG7JvvzBA2QbzjsUKE/+maJ9oQI/n0uBvLh+
	ZoD6+9nrzxb1efbvCJrdmaNDhAFp8mRNSc1IS3ZHTxEjQAZnJs+rnOlaWtxG+f0ZV0MpOXNi/wcJ+
	VWasngpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwNXt-00000008PyD-0680;
	Tue, 18 Aug 2026 17:24:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwNXr-00000008Pxy-12xN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 17:24:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 473AA60204;
	Tue, 18 Aug 2026 17:24:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F8271F000E9;
	Tue, 18 Aug 2026 17:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787073853;
	bh=hcD1cr7UQPZGV1CZ99tI4YDeunETgJ5XLCW/qpgT2hU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=WrBDJ4QaPEkHzOUnhzKcHCdU0E7M/FTAFv1fBf7i/5PE4O/bpmfO91oqK08d4QBVF
	 l5QD/frgNSCU8waHJg2okI5lx0+pU469tbOqN9FKsEqsvctzdSlPsqJhtrRbIn4WtV
	 lJWqCzeDiPq8/ySLPlNEHFs8L9YbrFLwKyhY/ltVaOaiS9bzPaRwfj7WToEeZIS0Kv
	 HpGH7WoeT5/mwLc62t06E9N6tG0legSl2bQ8kMbUx/f85wyNvJp90/Wkha2/oVqxJm
	 s0Y4WyTCutQmlYtdj4gXRmBkXIiy+JqXohMHdAd7xj4udzjm41h2kIsRgPsXIDJaL+
	 EmZGlXj+aophA==
Date: Tue, 18 Aug 2026 10:24:11 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Marc Zyngier <maz@kernel.org>, Linus Walleij <linusw@kernel.org>
Subject: Re: [PATCH 00/12] arm64: Remove unused big-endian support
Message-ID: <20260818172411.GB2249@quark>
References: <20260811140132.22778-1-will@kernel.org>
 <6632712f-7782-4580-84c0-62124a016f46@app.fastmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6632712f-7782-4580-84c0-62124a016f46@app.fastmail.com>
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

On Tue, Aug 11, 2026 at 05:11:47PM +0200, Arnd Bergmann wrote:
> I had not expected the removal to come this soon, but I'm not
> complaining about that. I assume you are planning this for 7.4,
> leaving 7.3-LTS to still have the code in case someone wants to
> still use it, right?

It's already been BROKEN (and thus is dead code) since v6.18.  Some of
that dead code has already been removed.  Other code never actually
worked correctly on big endian in the first place and no one ever cared.

Acked-by: Eric Biggers <ebiggers@kernel.org>

- Eric

