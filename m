Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9234CEDEBEC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 19:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KMGjuveVK/0VdEZtEB1srp5B3GwLURnt2HUgyVzfB/s=; b=E5X4EVMzPmIHmgxc7NqQ2Ii0Ow
	trMOCeJM1YG2OqCth+x70CHA0Tr5fnYKQTn07vd2BmtpZ27UHHo7PlnHC9MhI07QpXpzQeEly7KLC
	DFOEvqno5KQAWkOmzQsYe64HmWmr+djG4R1CCHlTm8HzK09BGsvMm6MNOq++zHtJkvDGZYqT3kUzq
	6eog1ba6+YldmQ1uWCtShgPTsC0W0NAxjyBGwilN42N1tx0Sf0w+bpIK816aqa2v6kMGr9/5qM0pH
	62CfNtoO8RDXDbZ90MxN+SqQDfCSjg9WEx51M/Ymp6DSQXH+nB3rtM1jQjWYGaU1j4nNJTDrmaq15
	kmI6d4Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxVTN-0000000FnmU-28ph;
	Tue, 03 Mar 2026 19:32:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxVTL-0000000FnjH-26jx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 19:32:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 755DC444B8;
	Tue,  3 Mar 2026 19:31:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAD2DC2BCB2;
	Tue,  3 Mar 2026 19:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772566318;
	bh=i9EZozHW8XRAVLe8EAr2xfM/6NutGAKezx67stLre7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LBMtiYqdzTeup8FJVWXxT6ukyG6zRobBUe/9Mx8IhAhFrfRxHAAIym3RpikfeMD8m
	 v+A2VcjZ21cSREjyMLdsu4gGu0wL0kRMhC4IlX1qyyeULlbBGl5uw6UGuBBquOolxm
	 Row+8ruBmAX+JL+HmOC80eEVQkVtrtMP8DP02cDIuI7a5crnsN/KD8SglZtR0sV8T2
	 FSzBQStrg4lKjjyetLh5Js0XceJBji3eyotTabSoV8O5Bg2+oeRAjkkb6HQGmyyYd8
	 IiX+5wsaOMUgS37UEGItnTYawAACGA3cYTgx4ebBRCK2MxWOXqEBOSJPb1mhDQEhyr
	 p8K4qxyCPAlBg==
Date: Tue, 3 Mar 2026 11:31:02 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Cc: Joachim Vandersmissen <git@jvdsn.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dm-devel@lists.linux.dev
Subject: Re: [PATCH] crypto: testmgr - block Crypto API xxhash64 in FIPS mode
Message-ID: <20260303193102.GA2846@sol>
References: <20260303060509.246038-1-git@jvdsn.com>
 <aab5ptuamQ7d_tTi@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aab5ptuamQ7d_tTi@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_113159_575520_A895FDB3 
X-CRM114-Status: GOOD (  20.31  )
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

[+Cc dm-devel@lists.linux.dev]

On Tue, Mar 03, 2026 at 07:09:26AM -0800, Christoph Hellwig wrote:
> On Tue, Mar 03, 2026 at 12:05:09AM -0600, Joachim Vandersmissen wrote:
> > xxhash64 is not a cryptographic hash algorithm, but is offered in the
> > same API (shash) as actual cryptographic hash algorithms such as
> > SHA-256. The Cryptographic Module Validation Program (CMVP), managing
> > FIPS certification, believes that this could cause confusion. xxhash64
> > must therefore be blocked in FIPS mode.
> > 
> > The only usage of xxhash64 in the kernel is btrfs. Commit fe11ac191ce0
> > ("btrfs: switch to library APIs for checksums") recently modified the
> > btrfs code to use the lib/crypto API, avoiding the Kernel Cryptographic
> > API. Consequently, the removal of xxhash64 from the Crypto API in FIPS
> > mode should now have no impact on btrfs usage.
> 
> It sounds like xxhash should be removed the crypto API entirely.
> There's no user of it, it's not crypto, and doing xxhash through
> the userspace crypto API socket is so stupid that I doubt anyone
> attempted it.

dm-integrity, which uses crypto_shash and accepts arbitrary hash
algorithm strings from userspace, might be relying on "xxhash64" being
supported in crypto_shash.  The integritysetup man page specifically
mentions xxhash64:

     --integrity, -I algorithm
         Use  internal  integrity  calculation (standalone mode). The integrity
         algorithm can be CRC (crc32c/crc32), a non-cryptographic hash function
         (xxhash64) or a hash function (sha1, sha256).

         For HMAC (hmac-sha256), you must specify  an  integrity  key  and  its
         size.

Maybe the device-mapper maintainers have some insight into whether
anyone is actually using xxhash64 with dm-integrity.

If yes, then dm-integrity could still switch to using the library API
for it.  dm-integrity would just need to gain some helper functions that
call either the xxhash64 library or crypto_shash depending on the
configured algorithm.  If the full set of algorithms being used can be
determined, then dm-integrity could even switch to the library APIs
entirely, like many other kernel subsystems such as btrfs have.

- Eric

