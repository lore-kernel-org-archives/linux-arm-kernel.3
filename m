Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 073CAC021A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 04:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RgLeQjspT74MnPRQdy/BnqqUlzDaDSRUeORQX7ILuZ4=; b=1NG4joH5TMKbiorBU9coDDAegI
	P+utr1qNNhE0k4YKLiOMVv1VIReXVorowoF5oIp949ygnWWufNc1XkFkMMb7ibkA3p+2BRgdOUEKj
	nPo2T8XKlaCaLVPJXLeDRLM8inWI4AnHwsK33TwtJcnaY7uP8quV1R98l7iiVZH4sNL4RV7xl8Cvv
	m7ptjHBPe5BgRXZyfo33/yzcML1hfoI1klLJCXCzVn4zoJxh1im3jiF45tVSIbfGPLt0heKfoz9W4
	HGZ9pNz7ZPvdJtLPUTKaNMyaje1L82PhL0lFNhP9IFKQQrey7xnZuwjZqqrScfEtdvKGb/YyGttLS
	OaPr3ong==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiQiC-00000009hn9-0I9V;
	Thu, 13 Feb 2025 04:20:28 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiQfc-00000009hLj-28jc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 04:17:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=RgLeQjspT74MnPRQdy/BnqqUlzDaDSRUeORQX7ILuZ4=; b=TaY0sHpQhYJBJrGuUjHmblyVsO
	3nfjIPVNgsz8aIXvokaa92wEtUvu6saTV3ZV/dCn6ESly8nM5nUtYyd+mOiS0dRnM9UXsjdfzQqOz
	zT/JPVvmkDkVqNUaKciZW/VOCHjwe1SoFFjtIazL8O01ndlR1Z3IJSj2h9FBnbxlz5Uf4WSA/Etzq
	PaBGIc6KQx4hJc3RFBkEtZqr/uN1GFAbjE/NKD7pUsIxJwXlocDPZPiU6fgkZRV2a7NouI4rmyALJ
	fyw5cZu+GkRkbLvb5bVRSt3t8ga5fv8vo8ter49SAHAAnishj/tIELSXsclqrf15tkeHsv7MlxCqX
	DeyzhKxg==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tiQSb-00HUzh-1W;
	Thu, 13 Feb 2025 12:17:43 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 13 Feb 2025 12:17:42 +0800
Date: Thu, 13 Feb 2025 12:17:42 +0800
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
Message-ID: <Z61yZjslWKmDGE_t@gondor.apana.org.au>
References: <20250212154718.44255-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212154718.44255-1-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_201748_562534_BA4BE55E 
X-CRM114-Status: GOOD (  13.05  )
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

On Wed, Feb 12, 2025 at 07:47:11AM -0800, Eric Biggers wrote:
> [ This patchset keeps getting rejected by Herbert, who prefers a
>   complex, buggy, and slow alternative that shoehorns CPU-based hashing
>   into the asynchronous hash API which is designed for off-CPU offload:
>   https://lore.kernel.org/linux-crypto/cover.1730021644.git.herbert@gondor.apana.org.au/
>   This patchset is a much better way to do it though, and I've already
>   been maintaining it downstream as it would not be reasonable to go the
>   asynchronous hash route instead.  Let me know if there are any
>   objections to me taking this patchset through the fsverity tree, or at
>   least patches 1-5 as the dm-verity patches could go in separately. ]

Yes I object.  While I very much like this idea of parallel hashing
that you're introducing, shoehorning it into shash is restricting
this to storage-based users.

Networking is equally able to benefit from paralell hashing, and
parallel crypto (in particular, AEAD) in general.  In fact, both
TLS and IPsec can benefit directly from bulk submission instead
of the current scheme where a single packet is processed at a time.

But thanks for the reminder and I will be posting my patches
soon.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

