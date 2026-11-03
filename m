Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE1D606D811
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 23:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cM+bhMDq;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=abwuEZ86
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ffOZbXiokqRRn62lI+LM5DVMQ4ebjZs01vfcvrIqkzk=; b=cM+bhMDqwBJnEi
	49RhkBIdmcDbrKLVOI/Ce8ANFW3IkLiOEWy2t/AYmszWeMBfkXgHrYngnJ9IitXGQDf6nmmaBrPz+
	EY9LWrTvYZ6uBsZu+JopgxeDceI7p4gBYKsyR44L6Uc6Fp0qi72uHW0z8VuivMTt6XBcRMzpWLNRA
	cljs31e673pvQzOIlVWmSL4SsNEm5AMLgE8gGIhKfuHtiRqJCJ1vZZEm0ZBYt4xLbZ/0dYgsxkPoc
	CHL/u9BeaJBYN5Cp5MWrpau1JwPp5BDZ6Mpnf3z7sMgz27qexiyN6GcRLkX18kFjrMIf6ZoXCjwcW
	zRKiQuaS6yKFRv8UFrkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOOCJ-00000003xy0-3yGu;
	Tue, 03 Nov 2026 23:45:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOOCI-00000003xxq-3uEj;
	Tue, 03 Nov 2026 23:45:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9AD0644464;
	Tue,  3 Nov 2026 23:45:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A3801F00A20;
	Tue,  3 Nov 2026 23:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793749546;
	bh=ffOZbXiokqRRn62lI+LM5DVMQ4ebjZs01vfcvrIqkzk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=abwuEZ86/Q5MY4byRpLDXJtZ+aRudH7OXv2RtUDFlnigSkC5jBHCuLP6oXQzt6zaY
	 1sRfDAb+rN1DZI+H80vjdVReYug2PBzH1YjXWZ2kAtDYYEP/Ro4V9zFd3nAADZFBvD
	 GQeeAICaaP0t/I50Pepxfh3is06k/q6R9p++Pv/9Ge+iGYZh76kwY0v5wMBXQlBuB6
	 1+fDQTOEkAjtU/iNo69D48xU7FUzBzoCivtxF3hdbyfFGlBkqQWxi3kGx947RSXxgX
	 xqTZTMKKsDWiDlbdZz+Bi58IxTTycdj7R7Kni0sHTdLqThlWJgKCu04bVcDP6yDfbI
	 J8JF23/suI7oA==
Date: Tue, 3 Nov 2026 23:45:40 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Cc: rva333@protonmail.com, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, "=?UTF-8?B?TsOtY29sYXM=?= F. R.
 A. Prado" <nfraprado@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>,
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 2/3] iio: adc: mt6359-auxadc: mask conversion ready bit
 in mt6358_read_imp
Message-ID: <20261103234540.46cc8c1b@jic23-hlaptop>
In-Reply-To: <20261103-6768-6358-fixes-v1-2-2a868a33152b@protonmail.com>
References: <20261103-6768-6358-fixes-v1-0-2a868a33152b@protonmail.com>
	<20261103-6768-6358-fixes-v1-2-2a868a33152b@protonmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 03 Nov 2026 18:32:08 +0200
Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org> wrote:

> From: Roman Vivchar <rva333@protonmail.com>
> 
> In mt6358_read_imp() the raw ADC value is returned directly without
> masking out ready bit, resulting in incorrect battery voltage reporting.

Can you add where the ready bit is.  That might help someone
looking at wrong values and wondering if this is what is causing them.

This one is pretty glaring as bugs go (given I think this means the
top bit is set?) so any reason it wasn't obvious to anyone testing
this device?

Jonathan


> 
> Apply the mask to strip the ready bit, matching the behavior in
> mt6359_auxadc_read_adc() function.
> 
> Fixes: 3587914bf61d ("iio: adc: Add support for MediaTek MT6357/8/9 Auxiliary ADC")
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>  drivers/iio/adc/mt6359-auxadc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iio/adc/mt6359-auxadc.c b/drivers/iio/adc/mt6359-auxadc.c
> index 951d236f972b..09432d0974cf 100644
> --- a/drivers/iio/adc/mt6359-auxadc.c
> +++ b/drivers/iio/adc/mt6359-auxadc.c
> @@ -502,7 +502,7 @@ static int mt6358_read_imp(struct mt6359_auxadc *adc_dev,
>  	mt6358_stop_imp_conv(adc_dev);
>  
>  	if (vbat)
> -		*vbat = val_v;
> +		*vbat = val_v & GENMASK(chan->scan_type.realbits - 1, 0);
>  	if (ibat)
>  		*ibat = 0;
>  
> 


