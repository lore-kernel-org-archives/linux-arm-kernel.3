Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FD8EE2084
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 10:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s6PtmROzd+O5nnBGS1z+1XPE++3x1xM/uYQ3FTegpig=; b=e9EC0qgtvuda0icS/I9IRxu1A4
	YOeGrWaPuKQxuQA63s0V8afl66LXOcowjI7jYV+P4eWh+gHnhVj/4q0a5mb11vHpPUnWOyAIrB6OB
	ZAOPxUnEfwVYcGZz5PUL4LJckZBkgCKIajpaBSd9JsbsAtQTHe2jz2FT01OAMGu5ARwzSWTLoaWH/
	6GqC4KVhZA4uV8a3DUcUd2js2yJkOkM+YZYGXUjQ+DVklgOMYDGyUICDuxllxbUoAj/MyU49Ubj89
	hAEztlOMmKYWFT5mkWttG4gpeFDKNtUco7t5il9HmDwGonRGf6f2uFosJtPljKTjQL7o4hnp/t2X0
	RACEo74A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voJY4-0000000BCkx-3Bg7;
	Fri, 06 Feb 2026 10:58:52 +0000
Received: from abb.hmeau.com ([180.181.231.80])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voJY1-0000000BCk9-46hi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 10:58:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=gondor.apana.org.au; s=h01; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:cc:to:subject:message-id:date:
	from:content-type:reply-to; bh=s6PtmROzd+O5nnBGS1z+1XPE++3x1xM/uYQ3FTegpig=; 
	b=f+sdyDzhPnXhAHbmjoz7F5jqlUJAHke1M4DzR5WLsbftfgrKV4QuLSEK26w+SyCV4KUMy5Fl0Es
	yCXTBOwWUuW6/Jc3hT7QM6I4mnmwE3ysXH5Yq2G6im6h2vdr/WT40lm1Qq/azWlc5wAak+JiquIba
	qeJxZFn0RSInlqt+26sORY+0I3Lh/oG46RrBxcRISjQ8DEndNtY7qWuuoY5Hz0O97KrB4rojwc3Mi
	LIJtMVBw6kNPSwqYValqPeF/6u0eGgRaX+uQ+DbTZBzXwXzzo4vBQhR8cOSQ+rF5sTMuNwBHBmSot
	TvHSuDJ6048W+3eadAbkYNhx3jF/UpIxy6KA==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1voJXj-004zUe-28;
	Fri, 06 Feb 2026 18:58:32 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Fri, 06 Feb 2026 18:58:31 +0800
Date: Fri, 6 Feb 2026 18:58:31 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: Thorsten Blum <thorsten.blum@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] crypto: atmel - Use unregister_{aeads,ahashes,skciphers}
Message-ID: <aYXJV-XUwtAEXfz2@gondor.apana.org.au>
References: <20260126174704.237141-1-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260126174704.237141-1-thorsten.blum@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_025850_041966_74E8B8CC 
X-CRM114-Status: GOOD (  11.30  )
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

On Mon, Jan 26, 2026 at 06:47:03PM +0100, Thorsten Blum wrote:
> Replace multiple for loops with calls to crypto_unregister_aeads(),
> crypto_unregister_ahashes(), and crypto_unregister_skciphers().
> 
> Remove the definition of atmel_tdes_unregister_algs() because it is
> equivalent to calling crypto_unregister_skciphers() directly, and the
> function parameter 'struct atmel_tdes_dev *' is unused anyway.
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---
>  drivers/crypto/atmel-aes.c  | 17 ++++++-----------
>  drivers/crypto/atmel-sha.c  | 27 ++++++++++-----------------
>  drivers/crypto/atmel-tdes.c | 25 ++++++-------------------
>  3 files changed, 22 insertions(+), 47 deletions(-)

Patch applied.  Thanks.
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

