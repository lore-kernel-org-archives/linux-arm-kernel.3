Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD805C02198
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 03:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vyRhLFHRB6fmclm1Piz9ZAXQjUujdHyc/1CCpu4kda0=; b=nZBwX/i6zppfPjH3SHR7cuCRz+
	TcUJySC+tG+8FpnqH1LWNejXFkGqjWPB740mDSDaSoIoQdfauKJdcj6M2aXUbJcUMamvZkKMRejX9
	nx7yir86RYDoOiDiqT48ETnxgpvZY0+L4+l02tOkXL9W0TUR1p+6tOAO+KOYZRwZjspdHoFUqBTYY
	OGejAkOirYi+pKYpdarzPjh1JXQN98VqyrWvUiqDG7Hvw0VZh6Qfm++Uh+LLOpu+1C4NwdSeZlYCu
	j9gXYkA4p3yyJ6fFRmnWJaj69LrGTtd2meEwdzErHrbdX1WXSsseHAtP6TdJm7jKBVElL3vZrzDDE
	7xJ7YtAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkEX6-00000006dx0-2C9J;
	Tue, 18 Feb 2025 03:44:28 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkEVd-00000006dnb-0EOM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 03:42:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=vyRhLFHRB6fmclm1Piz9ZAXQjUujdHyc/1CCpu4kda0=; b=aFOI1FU6shtJerIQ7DxiFI+Ewt
	neYE/ji6PhieKsTYzsfnrOIyHGle3ecc8D/lsYZjcRB3ZTlju51sq+UzE1cNTkIUNAWD9aJX0aHU6
	FkCq5fgTjmknPu6V+aWzQ4nimBemr84uYqb4SNiODjzJAQggytL4AXm5q6Ujdz5pGb3sJbrfhT5Pj
	QNBUo/kShIgx7+0rrhrOQxr8Ndt+m7t9dT9Ye7skKBgUpGiN9gH5qvrCyJolhV3Yr8WO694bOTNf2
	cdqRkjUXjZXH47/5bas+iIhxf0+HsIuyEIjs78jtZKjjPxHIQ2Dz7TYfZUmvATqV1uj7lY6kx8yoq
	2Z09xE0g==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1tkEIa-0018pK-04;
	Tue, 18 Feb 2025 11:42:49 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Tue, 18 Feb 2025 11:42:48 +0800
Date: Tue, 18 Feb 2025 11:42:48 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Eric Biggers <ebiggers@kernel.org>, fsverity@lists.linux.dev,
	linux-crypto@vger.kernel.org, dm-devel@lists.linux.dev,
	x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Alasdair Kergon <agk@redhat.com>, Mike Snitzer <snitzer@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mikulas Patocka <mpatocka@redhat.com>,
	David Howells <dhowells@redhat.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v8 0/7] Optimize dm-verity and fsverity using multibuffer
 hashing
Message-ID: <Z7QBuIvr4Asiezgc@gondor.apana.org.au>
References: <20250212154718.44255-1-ebiggers@kernel.org>
 <Z61yZjslWKmDGE_t@gondor.apana.org.au>
 <20250213063304.GA11664@sol.localdomain>
 <20250215090412.46937c11@kernel.org>
 <Z7FM9rhEA7n476EJ@gondor.apana.org.au>
 <20250217094032.3cbe64c7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250217094032.3cbe64c7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_194257_092925_AD9EA632 
X-CRM114-Status: UNSURE (   7.45  )
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

On Mon, Feb 17, 2025 at 09:40:32AM -0800, Jakub Kicinski wrote:
>
> Yes, that's true for tunnels and for IPsec.
> TLS does crypto in sendmsg/recvmsg, process context.

OK that's good to know.  So whether SIMD is always allowed or
not won't impact TLS at least.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

