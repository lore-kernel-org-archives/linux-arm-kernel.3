Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B7FD3E788
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 03:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qzAADVyJ7FleWNTOio9/8Kv9vp7azPgrzyvnUIJLTc=; b=l2bnIpbOf38r7OIrGZVmUuKbjg
	Jfhvrirsyyjr8EtrbqjlQDa1qVLwHxpkxIGY9WAaeVrpSyvLMIQLAD3IUesv5vFeyn0k5R6BAgO2s
	96jsJOrU4gKlDdfvh2YqmfcwWRuzTCGArqrvmslvgyna1ZUhTnFj2j9a726+6iZqNfoa5N5EgvsE2
	tNOhhhrJZVw/wqajQh+YYNTNv8WEoxMEs385DpfHl010KssghWQeGAWKaOSZMFkeByRYADrT/9jjo
	4NNUpWQIYoB7jmoPopHzS2V75JvUoydhBRd7jbpdY1mNE/UPkSuI+q0A1HojR6I0R5yxs6DME3HBy
	Up0YkEpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTWwv-0000000G8ui-1MQp;
	Thu, 11 Dec 2025 03:02:37 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTWwq-0000000G8uI-1aQr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 03:02:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=2qzAADVyJ7FleWNTOio9/8Kv9vp7azPgrzyvnUIJLTc=; 
	b=FgWA3RlzvG3iCj4VMM187zdN7gz7+382CTB9zZwcjMEp8JmXSDAgY21wHPzOYh1grzIvjoMYepd
	qXlPIzQZuBGSxnGXDNgp9WKqVyhIpAAF8yMbSxdJXtXvDnM6Jp0VqlFf0GnwkXRs0KiU7TNZEApUc
	uetg++uBcKcPwFWrDfi5a7Kwaz9Mdcuejo0BA8HxDTGEYm5T7jvkUMy6MQMg+1BwUcopIPClUh4YT
	AmcYyHMF6odS5eEWKJ28vEMrvccjxJrfrRtr/xNTPWjiZM6sURP9FWDeRujBHiGnX5kOgIo0XjtHP
	ghH2ZEC1V/4l5NF0dPY8+n9XKbSsoV5wbv7A==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vTWwa-009PDO-1f;
	Thu, 11 Dec 2025 11:02:17 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 11 Dec 2025 11:02:16 +0800
Date: Thu, 11 Dec 2025 11:02:16 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	linux-arm-kernel@lists.infradead.org, x86@kernel.org
Subject: Re: [PATCH 08/12] crypto: adiantum - Use memcpy_{to,from}_sglist()
Message-ID: <aTo0OIhv3IOHbzvy@gondor.apana.org.au>
References: <20251211011846.8179-1-ebiggers@kernel.org>
 <20251211011846.8179-9-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251211011846.8179-9-ebiggers@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_190233_014636_A9FBF0C9 
X-CRM114-Status: UNSURE (   8.29  )
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

On Wed, Dec 10, 2025 at 05:18:40PM -0800, Eric Biggers wrote:
> Call the newer, easier-to-read functions memcpy_to_sglist() and
> memcpy_from_sglist() directly instead of calling
> scatterwalk_map_and_copy().  No change in behavior.
> 
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>  crypto/adiantum.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

