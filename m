Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6D4C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Feb 2025 17:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnvWKZs75WCihl2RK6XN/hRaYXzrXSYWLy9EHEla2Gw=; b=RHq1QQOo/FVqegrj7U3eHeRKqA
	1GFrXELvrqaXP9JX5YoBWm6kykxtu8BdAHrwKTI+tzbIPLcA7HF33YbOiIvxatCD9+G4KgRFJdmn6
	e11oQkTLHoAfT7tAzHGazmKwS4WocG9GBOxy+QsLDOe1Wj4Lux9EHvAeB2OILGh4lJrflYQP5bMt7
	hD6t22u5QTwHtAUoqAo+W7fJ/6MrV35i5WdtzrQP88PFVCLR7AadBe3T32BDhsm1MdE1/+JUSe4EA
	wcylCSC5BHKIC3kKzpA6Kd1LkDlDCeFE0Bu8qxdW08Gs5iLUpw3EJRJS2FKJeXHsdT1vV/NeBlZ6u
	XYqni5jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tjLbu-00000000SM6-3Dza;
	Sat, 15 Feb 2025 17:05:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tjLaR-00000000SDx-3OTA
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Feb 2025 17:04:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5D4CD5C065F;
	Sat, 15 Feb 2025 17:03:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D17FEC4CEDF;
	Sat, 15 Feb 2025 17:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739639054;
	bh=WnvWKZs75WCihl2RK6XN/hRaYXzrXSYWLy9EHEla2Gw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ak36cCJGIrDMyh8JLoBwWJiYVWmf3huXTUGfoyTfnuZpGXjQ+worJ/7PW4lqmh2XY
	 PYtsLtQ2vZoVSEl+fUHGhQdA4mmCjtF8c3nnP4011ahg5XFRhb5Mj01McFZex0Pogc
	 GmCKwtSclIvKvylbEQDbk2qFGGpm+z53vQeHt1UxcSkuZnmGH+O7fo9SDhqnwaz9NE
	 cIAXkIiab1/bYW7UaaWNFK/0ZVsP+pP7xcE4+MJkOcy1cIcBEJSOeRDNnbyinemZiU
	 TRbhAUGAfr0EftL6DQgiiFtm7B4ummm5LBzhEPBOb6WkjJQCKdDDh8s9wvF3/5w06P
	 Zy4mrHEzz8nvw==
Date: Sat, 15 Feb 2025 09:04:12 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>, fsverity@lists.linux.dev,
 linux-crypto@vger.kernel.org, dm-devel@lists.linux.dev, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Ard
 Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>, Linus
 Torvalds <torvalds@linux-foundation.org>, Mikulas Patocka
 <mpatocka@redhat.com>, David Howells <dhowells@redhat.com>,
 netdev@vger.kernel.org
Subject: Re: [PATCH v8 0/7] Optimize dm-verity and fsverity using
 multibuffer hashing
Message-ID: <20250215090412.46937c11@kernel.org>
In-Reply-To: <20250213063304.GA11664@sol.localdomain>
References: <20250212154718.44255-1-ebiggers@kernel.org>
	<Z61yZjslWKmDGE_t@gondor.apana.org.au>
	<20250213063304.GA11664@sol.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250215_090415_892304_107AF1BA 
X-CRM114-Status: UNSURE (   6.51  )
X-CRM114-Notice: Please train this message.
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

On Wed, 12 Feb 2025 22:33:04 -0800 Eric Biggers wrote:
> So anyone who cares about TLS or IPsec performance should of course be using
> AES-GCM, as it's the fastest by far, and it has no need for multibuffer.

Can confirm, FWIW. I don't know as much about IPsec, but for TLS
lightweight SW-only crypto would be ideal.

