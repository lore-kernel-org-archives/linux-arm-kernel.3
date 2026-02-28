Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CDFAFEE4D3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 08:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lkYifvfXKRVdgYb8NPXREQxR5YK/1Q9ocsKi9yC5ZeM=; b=obv9oj0T8DSNCvKlvX+zY2sPI8
	rxb2AVkbc30eXvp3H0PyPIdXP9tVeEMe8KkyhTdX4OdisPzWtKmxjP3wPE8UygZmSwp87G95Vmd3r
	N/EYd2sM6tM5jd/D9+biv32RyNlKwY+GIzOdg7PKOGeez2A68WzpuA5YF63/y1LFMm3E7TN/k8jIk
	EF9wgOSCbGEeDojKHC1NcrBdABraX7ePF19qeLU4zwW5Xwi4RuFV1zwMH8gGlhWzkXH8/EDOXQIFE
	lTcnt3rcIGB6AJsRC46YnkJPlFjzIPauOFUqgp/KAtzt9LDKGXbmGP59pgRVVCjNGehsw0jvf0+IL
	6GEq1esg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwFtY-00000009ez6-0D5c;
	Sat, 28 Feb 2026 08:41:52 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwFtU-00000009eym-32XN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 08:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=lkYifvfXKRVdgYb8NPXREQxR5YK/1Q9ocsKi9yC5ZeM=; 
	b=SI9pmrmuPEpwloTMotyH/k4bW5MNBmgMvSB0j8UCfo170e8E0qCyZ3R3glt64+1HBj5QSjZM8Zu
	KIPEOzh0DAUnOarhTMXjI7+Oum0PfRxQhxWrXG4ruKIA8ulaTxoH9QnAkg8ClvzdnsLHDBpvfX2ob
	F7fMuV5o72jdkuFzLxpmX/MTZ+ftVCKiWM28lTx+bHQqwrzsBnqXPTZzX0g/0SORJKDvh7EWML/+O
	J1iudjWs+0YzBMvSZ16MTv/2SOBwxR8hhi2HrHkB7faBuB4MZO4PZszMHmCJ2l5Y5qodBP/XmjUwM
	N1IPzM42fjq/3bS3ohktBqssWEgaIPjavakA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1vwFt0-00ADl9-1y;
	Sat, 28 Feb 2026 16:41:19 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Sat, 28 Feb 2026 17:41:18 +0900
Date: Sat, 28 Feb 2026 17:41:18 +0900
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Aleksander Jan Bajkowski <olek2@wp.pl>
Cc: davem@davemloft.net, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, linux-crypto@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] crypto: tesmgr - allow
 authenc(hmac(sha224/sha384),cbc(aes)) in fips mode
Message-ID: <aaKqLk9U1wcqxbea@gondor.apana.org.au>
References: <linux-kernel@vger.kernel.org>
 <20260206192732.478178-1-olek2@wp.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206192732.478178-1-olek2@wp.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_004148_783953_67C50B62 
X-CRM114-Status: UNSURE (   9.64  )
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

On Fri, Feb 06, 2026 at 08:26:59PM +0100, Aleksander Jan Bajkowski wrote:
> The remaining combinations of AES-CBC and SHA* have already been marked
> as allowed. This commit does the same for SHA224 and SHA384.
> 
> Signed-off-by: Aleksander Jan Bajkowski <olek2@wp.pl>
> ---
>  crypto/testmgr.c | 2 ++
>  1 file changed, 2 insertions(+)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

