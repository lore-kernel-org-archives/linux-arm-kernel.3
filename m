Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECD9DC02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 08:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WMUQZRQIhgP1DqRoKFKVytGvZcO014vRgMYtE+1LX14=; b=V4S8K3qQs7iFp0HSRjVXSJJY9U
	DpeRY8Q6JYhOGAk3osT5oxYmBRZp7yMkWqd/RJrpoNMOI/K9bwOnJHgOm3ILuSw4EuwZ68/LhA1VO
	WD4/vZnPBD+QSnj96Pru4myh2QeYCJlAxDTXWVMpf5iph8VpYN1xENH/hR7bk2XwRUnCP1lYi7ONZ
	D9BFakAxQccQ1KTp5YYqBF79ah8H3qgSkNjtu2jzySeqmoxzip2Eea/HuOKhzy+G4JFlSKGwNVpeu
	iuYsgRK4CmhA1VTvahF5P7/BsB9SKxnPppkKK4zTh1X9Sk6X+nrX+lS4yNx+O09NAsGOCiklzrKl5
	jVFfIR7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkIi7-00000007CIL-0ghn;
	Tue, 18 Feb 2025 08:12:07 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkIYs-00000007Ab2-40Ma
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 08:02:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=WMUQZRQIhgP1DqRoKFKVytGvZcO014vRgMYtE+1LX14=; b=iCfF8/cMHupM+auCxOveCoQwin
	+bUN0CgMRVLMFVoLXpQD+rL32YVolkozFLuEEBf9NTFkw7It9d8HIhYwoQ8zAn5/QMv2Sx7i3hXsg
	do5CtLg7SGdoQdUfBYlxsse8HhOOXfZQ134pYZ9Rz0MebOD7PjRBHvz7gGPoHScPX4BjOfo4on+/6
	jxaoEQaQFxarurr56rzMThVq7nfz+T1cVd0jOIVzH9NCNoZ/99zd6u0skT5A1Vmjwn9y7jlhKWTD9
	XRP1akQc6OgYsb/aY5ml3pmflQyDLVIzq2OWXPyFERhfm0h4JUBRX8KDXVVnvzzJjcpUoBbVCjbLr
	trfhZnTw==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tkILs-001BI4-2J;
	Tue, 18 Feb 2025 16:02:30 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 18 Feb 2025 16:02:29 +0800
Date: Tue, 18 Feb 2025 16:02:29 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Jakub Kicinski <kuba@kernel.org>, Eric Biggers <ebiggers@kernel.org>,
	fsverity@lists.linux.dev, linux-crypto@vger.kernel.org,
	dm-devel@lists.linux.dev, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sami Tolvanen <samitolvanen@google.com>,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	David Howells <dhowells@redhat.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v8 0/7] Optimize dm-verity and fsverity using multibuffer
 hashing
Message-ID: <Z7Q-lRwkCbXFpgXS@gondor.apana.org.au>
References: <20250212154718.44255-1-ebiggers@kernel.org>
 <Z61yZjslWKmDGE_t@gondor.apana.org.au>
 <20250213063304.GA11664@sol.localdomain>
 <20250215090412.46937c11@kernel.org>
 <Z7FM9rhEA7n476EJ@gondor.apana.org.au>
 <20250217094032.3cbe64c7@kernel.org>
 <Z7QBuIvr4Asiezgc@gondor.apana.org.au>
 <CAMj1kXFe2f0cCYznorrO-wJyh-qxJP5z-HdR9rbQiuMKC5u6qw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXFe2f0cCYznorrO-wJyh-qxJP5z-HdR9rbQiuMKC5u6qw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_000234_993076_E946B7BC 
X-CRM114-Status: GOOD (  13.28  )
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

On Tue, Feb 18, 2025 at 08:41:57AM +0100, Ard Biesheuvel wrote:
>
> And for IPsec, I'd assume that the cryptd fallback is only needed when
> TX and RX are competing for the same CPU.

Which can happen if the system is handling encrypted data in both
directions.  Sometimes you do want to have the hardware steer a
given flow to the same CPU in both directions.

> So for modern systems, I don't think the SIMD helper does anything
> useful, and we should just remove it, especially if we can relax the
> softirq/preemption rules for kernel SIMD on x86 like I did for arm64.

Sure, if we can ensure that SIMD is always useable even in softirq
context then we should definitely remove the simd wrapper.  But until
that happens, suddenly switching from AESNI to the generic C
implementation because a system is loaded is not good.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

