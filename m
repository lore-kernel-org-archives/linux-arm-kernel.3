Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16EA2C83F1F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 09:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z8WqumyvggfaVXZ7CRDetpHSxcPkOqvMvUK9gA3juJs=; b=swqkK5IsbKSYGdtEs9FoIAfPjD
	3CHsxgxsAv1SXlARxX6FPARPM+xltRr4YWNpgbwgJk8gY3F8RJh+JSdY8rA0Ml/3OIUzCdoO8Opoa
	4P1ObJPIcyi8fzFGtTOse1FNaoHwF+g9vQCp+29r7PkY8LJa9MTQnq/2ceuoTz59EYagE5D+l0pNt
	S/ZNZpesxTybuP7hyjrBgngNnyCb8Q5YEgTCFOkdPXbfXRyFbdsEAmF5kAumANBa+2nEgtXZlhO3c
	SvnlC5UrpeNtA6Jtj9YhHgpv+GneBPv+vEuWIfTrTYAjPfA0Fqq3yTE2DlYMjefpHSKjDzQSLhQNN
	bfJuAphw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnPY-0000000BJkP-0O3E;
	Thu, 10 Jul 2025 09:17:48 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZmO7-0000000B85q-3cXK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 08:12:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=Z8WqumyvggfaVXZ7CRDetpHSxcPkOqvMvUK9gA3juJs=; b=pdjVUrexPJeUIdEs4fUAFkTdrx
	2QM6G36yJWK0PW3KySzVBbvmlK9jZix2jCKYeDzx+SIkCRcU5ewsp9WUwfIRIhZkM6zWjOXATLScs
	k6S5U9P0IsFsaVEYrExQ81aZGNY0wdSdG10eh3qkaaMfBMlo3vM8+/kw1PiqdfOnLOlBRmXtkHk3+
	+1BFBTda3NBOmf9AQ7IrTkCirXMI9NwIkODeiledryhhMYPpbevHIUczrlA3DFkB44PS50cDeWC+Y
	4Q0gVJexLLCWbecgmWLshRueHGLtCo6W0Dd0UpNmVifP7ORkx6B5YqvKGZkqlsn4sB7S3VOSn9lIr
	AxyGVhkQ==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1uZm8X-005Orn-2K;
	Thu, 10 Jul 2025 16:12:07 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Thu, 10 Jul 2025 20:12:06 +1200
Date: Thu, 10 Jul 2025 20:12:06 +1200
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: clabbe.montjoie@gmail.com, davem@davemloft.net,
	linux-crypto@vger.kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/10] crypto: sun8i-ce - implement request batching
Message-ID: <aG911t_b18z7QHe-@gondor.apana.org.au>
References: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_011215_900610_B12914CA 
X-CRM114-Status: UNSURE (   9.84  )
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

On Thu, Jun 26, 2025 at 12:58:03PM +0300, Ovidiu Panait wrote:
> The Allwinner crypto engine can process multiple requests at a time,
> if they are chained together using the task descriptor's 'next' field.
> Having multiple requests processed in one go can reduce the number
> of interrupts generated and also improve throughput.

I think we should phase out the batching code in crypto_engine
as it doesn't really work that well.

Instead of doing batching based on backlog, we should be letting
the user push this.  For example, IPsec can hook into GSO and get
64K of data each time.  Similarly for block encryption, unit sizes
can be much greater than 4K.

Cheers,
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

