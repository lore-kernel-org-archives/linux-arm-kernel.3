Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D05CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 12:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37IxNgIC/tK7GQFANkJ90OJqPkAePULSWjzc8XxfLNo=; b=h2LVEGmHjpVvw/xauUMZsxsVTX
	JErDu73YldF3suEAimAJQWq2t57HnbnDcI091zst1or8LHvdjnSrQ7HrGS9tZKVxUtIJ0JVBqnepq
	azDl5OvXfOgDwULBak2ucRfjCX2RBLP6nX3LWS3rUe/9e7i/ja9i9m4zTpD1sNFtdy1z3odTmGKOi
	ZHDU2pLzwsbsW9wH+Lxos1fJ/nogK5F+sGtNb4DNrn1jMBLJVNGTpWIdlI3N6yulOZ/nQ1c0dkrGJ
	ibjhjI9iPgXBxD619BXjB36nUbUHra4Gag1diAHHKa4g9RCp3j2bOXu6i5Mp+GzhrBSQMf4FnmIIG
	lftdLYbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQOzm-0000000AmBC-0KYv;
	Fri, 22 May 2026 12:28:54 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQOzj-0000000Am9b-0VVp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 12:28:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=37IxNgIC/tK7GQFANkJ90OJqPkAePULSWjzc8XxfLNo=; 
	b=D142ZXZFRwKjKdEolsaV7eNlCIJltAQh+FHrmbw7hKm2Ft+HWrB8Dz/PvBpqsoUSfWXqAAII7IG
	nUsKIcihgqzRqiOFzpSkfy4t8VwDm8GoC4K0LIOmbrQDNTr4ADyHyEhGJQsflA2TIpKnhNfyde4R/
	CwrhwbgpXmPQkScjPpA9hYEC7xUJC/fAFXduQP6B9quKHjEZlXhmJOZ/aqP2kO1mWRFh5F79FEASO
	ppaGu1tyTeqlq6whEzceHmj/UzU4dZpcE2Y2nDZEub5+YkheF+Q94iJ8BUOf9h+Nm4BKSSudRlxjU
	LRLV8HFuQ/6voj+XFDYPIZCtoitfmcQS8r5A==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1wQOzG-00GSKP-2p;
	Fri, 22 May 2026 20:28:23 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 22 May 2026 20:28:22 +0800
Date: Fri, 22 May 2026 20:28:22 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel - use min3 to simplify atmel_sha_append_sg
Message-ID: <ahBL5nVfR2oCHhuO@gondor.apana.org.au>
References: <20260512145123.303311-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512145123.303311-3-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_052851_158515_AD18A810 
X-CRM114-Status: GOOD (  12.15  )
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

On Tue, May 12, 2026 at 04:51:24PM +0200, Thorsten Blum wrote:
> Replace two consecutive min() calls with min3() to simplify the code.
> 
> And since count is unsigned and cannot be less than zero, adjust the if
> check and update the comment accordingly.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/atmel-sha.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

