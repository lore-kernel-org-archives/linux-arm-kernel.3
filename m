Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B0BF3026E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Mar 2026 19:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gCBoo+mEV27YB5gthmuXt85o/zjrghRMDfZxPhsyaA8=; b=CMzcEYJ5d1kw41Kbzx+gfot6R+
	JpPzVzEkto4zuNIjHcJiMdwASiV1Z9kFJKfulLFVS62Z3FOzREbh0r+OCOiMvmDwdmn4SldD+GkS7
	o1fVnVf2zznY4a3tia70uFz2IWmwplhHZvu156hRsyN9cmt+edVWZWLf96zJzXrcUlu4Ma0qL+uNe
	Bv0IHHSVfxinI9AO/Qyp2iDjObfc0BqDgNmdfllQK9mQTq/Nb2SHzvzTkHj4aBNCG6oWP4EOb0+aX
	7imi+ZoRCHxZYugjQvUE4BB1c/qZFwqXqR41F4MHzyoFf6K5rswikBBIqHWGP65qmseXKagm9MPOg
	9haTL3Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1rPA-00000002s5D-1wEs;
	Sun, 15 Mar 2026 19:45:40 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1rP7-00000002s4d-14SX
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Mar 2026 19:45:39 +0000
Date: Sun, 15 Mar 2026 20:45:15 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773603921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gCBoo+mEV27YB5gthmuXt85o/zjrghRMDfZxPhsyaA8=;
	b=weobbS4Hv1F8ODlS8vrWdA66Ly9de1e/g6+IFwRauMqfDPzEvvQGB9UikORp9TjGoxceDy
	JJXuoMaefqyuydDUNb3E9EicVyvq/DFMUuH/qp18ZIz9jw0WEcpW1TCS+LcCdpr4ymlctI
	Q6tCYw+/ml9fVDadMvXinAU5Q59kjmU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Linus Walleij <linusw@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	stable@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] crypto: atmel-sha204a - Fix potential UAF and memory
 leak in remove path
Message-ID: <abcMS4YYrHOF6ud1@linux.dev>
References: <20260314193627.728469-3-thorsten.blum@linux.dev>
 <abY2HdOs0768G8G3@gondor.apana.org.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abY2HdOs0768G8G3@gondor.apana.org.au>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_124537_795086_8692E4AF 
X-CRM114-Status: GOOD (  15.39  )
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

On Sun, Mar 15, 2026 at 01:31:25PM +0900, Herbert Xu wrote:
> On Sat, Mar 14, 2026 at 08:36:29PM +0100, Thorsten Blum wrote:
> >
> > diff --git a/drivers/crypto/atmel-sha204a.c b/drivers/crypto/atmel-sha204a.c
> > index 98d1023007e3..aeadbc9a2759 100644
> > --- a/drivers/crypto/atmel-sha204a.c
> > +++ b/drivers/crypto/atmel-sha204a.c
> > @@ -191,10 +191,8 @@ static void atmel_sha204a_remove(struct i2c_client *client)
> >  {
> >  	struct atmel_i2c_client_priv *i2c_priv = i2c_get_clientdata(client);
> >  
> > -	if (atomic_read(&i2c_priv->tfm_count)) {
> > -		dev_emerg(&client->dev, "Device is busy, will remove it anyhow\n");
> > -		return;
> > -	}
> > +	devm_hwrng_unregister(&client->dev, &i2c_priv->hwrng);
> 
> Is it OK to explicitly call devm_hwrng_unregister?
> 
> Perhaps it's best to remove the devm management?

Yes, it should be safe since explicitly unregistering the hwrng removes
the devres entry, and the automatic devm cleanup later essentially
becomes a no-op.

Switching to hwrng_{register,unregister} is more explicit, but it would
require a bool hwrng_registered field in atmel_i2c_client_priv to keep
track of RNG registration success/failure.

Which approach do you prefer? Perhaps the smaller devm change for
backporting, and then switching to hwrng_{register,unregister} in a
separate cleanup patch?

