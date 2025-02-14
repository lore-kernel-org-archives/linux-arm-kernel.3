Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD2E7C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 03:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSVMhfzPHKYPcVMTMnZqyr4OBSa7KstYIVuVF6WaaZE=; b=h+MBKxT8OsXSsUePmQpadjs9QT
	MqvqYoSzrYBjLJf1iitNWiauAuf3/2Q5An4S2WeEFcu5mt+JE+TyiGGoxf7xjEH6caRozZ/OR2KjY
	Y7VwvI2nKkZuEiPF6oV0raATZ2y1Cc9fudn/Cst1XAf3/GOCyxbJ3rIo/dkMA+7cGoxtgOnB6jARi
	r/58jAI/JvVVNkQHnqBME2a1Kbq5+ePpkT88Ra6ye2uegivzR85NeQRq/Hi2czE/wVMD/61nR58yy
	gWSY0lAr5swuEyAUAOvO66SuYDqQkOr3/tKPQYFVmj+WgjNvjYqlVWC9soVAIZ0hLOQqztzo0SRO2
	0PR7dpKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1timke-0000000DXam-08sQ;
	Fri, 14 Feb 2025 03:52:28 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1timjA-0000000DXGL-2lKm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 03:50:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=dSVMhfzPHKYPcVMTMnZqyr4OBSa7KstYIVuVF6WaaZE=; b=dW5AinHJmfj9B8vPIT+PpH8p4X
	E9tbjwbP/7wkcyLd+7sXxX58tjMwHxgdYqCUnjCq2y3EV6DvI5dHMmIqBJx5RcbPC41sPPB/qHzqD
	DnXPfplfBE8Lzcj92BjefT+OSoF1ac4O+emS3L0bh1SW6GZIkLEK2h7cxO62cRc+WruGGmtlpsp2z
	cd/cOJUlID0579rcCEtdaJxHwHa3T86WicSQUzIUC5qqpLFqyk8mHG6kJFzVVjfYyNSYkZeWHQlf+
	nw9tUS5yUsXxq/inwkcvsEtiiYaSg5osggt/GuCvCF1XgUlTTuhqu80zPRD+6i0bhuByHydOalCwH
	YAbom6bQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1timWA-000DqF-1W;
	Fri, 14 Feb 2025 11:50:52 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 14 Feb 2025 11:50:51 +0800
Date: Fri, 14 Feb 2025 11:50:51 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, linux-crypto@vger.kernel.org,
	dm-devel@lists.linux.dev, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	David Howells <dhowells@redhat.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v8 0/7] Optimize dm-verity and fsverity using multibuffer
 hashing
Message-ID: <Z669mxPsSpej6K6K@gondor.apana.org.au>
References: <20250212154718.44255-1-ebiggers@kernel.org>
 <Z61yZjslWKmDGE_t@gondor.apana.org.au>
 <20250213063304.GA11664@sol.localdomain>
 <Z66uH_aeKc7ubONg@gondor.apana.org.au>
 <20250214033518.GA2771@sol.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250214033518.GA2771@sol.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_195056_695345_50504637 
X-CRM114-Status: GOOD (  14.66  )
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

On Thu, Feb 13, 2025 at 07:35:18PM -0800, Eric Biggers wrote:
>
> It absolutely is designed for an obsolete form of hardware offload.  Have you
> ever tried actually using it?  Here's how to hash a buffer of data with shash:
> 
> 	return crypto_shash_tfm_digest(tfm, data, size, out)
> 
> ... and here's how to do it with the SHA-256 library, for what it's worth:
> 
> 	sha256(data, size, out)
> 
> and here's how to do it with ahash:

Try the new virt ahash interface, and we could easily put the
request object on the stack for sync algorithms:

	SYNC_AHASH_REQUEST_ON_STACK(req, alg);

	ahash_request_set_callback(req, CRYPTO_TFM_REQ_MAY_SLEEP, NULL, NULL);
	ahash_request_set_virt(req, data, out, size);

	return crypto_ahash_digest(req);
 
> Hmm, I wonder which API users would rather use?

You're conflating the SG API problem with the interface itself.
It's a separate issue, and quite easily solved.

> What?  GHASH is a polynomial hash function, so it is easily parallelizable.  If
> you precompute N powers of the hash key then you can process N blocks in
> parallel.  Check how the AES-GCM assembly code works; that's exactly what it
> does.  This is fundamentally different from message digests like SHA-* where the
> blocks have to be processed serially.

Fair enough.

But there are plenty of other users who want batching, such as the
zcomp with iaa, and I don't want everybody to invent their own API
for the same thing.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

