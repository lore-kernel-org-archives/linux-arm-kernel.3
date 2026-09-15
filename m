Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3296C88E7B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 14:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c6nXn9QszvDuxbC4bOSKyL0/hzlZ75yA+JSfjiylQcQ=; b=V4IaudN75DaFsykpIXP8pn/fqn
	64fUNEqGDzjF7BliqsALTAzN9/wh08KSM71xbD8cQ6AxvPax8k8JzoigW8ADL238q/Zhoez0GWQLc
	kIqGEIO9k3svnaa/OtrGuv4qSICYyOWzdwl86x6mDrY1TUIt9GDJ/mu3gpxB/qfXk8ngcMNaxpBZx
	OJ4cZG6ZYQfN9YtyZBLG+2hEFc9xgoO4x8FAfGpW2RbEejSnzlz0+yng7DpzEonG04GqH49hJwfDb
	bVeqoWK6Eo5DSkZ1gjijLIw6SroOsg/Nu7icAibMp5pfPzPUT3aOa1z936Sk8bLiAIK0x+1N/0GVG
	TjynyA1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TxS-00000006tnH-3scF;
	Tue, 15 Sep 2026 14:16:26 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6TxF-00000006tjX-3bWN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 14:16:18 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-486e1a044c5so259931f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Sep 2026 07:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789481768; x=1790086568; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c6nXn9QszvDuxbC4bOSKyL0/hzlZ75yA+JSfjiylQcQ=;
        b=fXaXQdMrWPkEAuGDxlBFcAKrwrdzzt7JppX4KfpJbvXqbykBA4EFa5uUQQ/7CnqEbT
         L4Y3IwQYjs4KAK9segIyj1s4DIbrCv76LPF7FaXesyT9odZwqHsvo0ZHogU3iM+CnaLz
         JjUnygxxEC3imAV4J/n6eBDxwGKLH48lfjL8evKSKUj2vkXGz/GOtMwNCIZ8wT1uZrUY
         rwsGZMF7UeVeh7OmfHZs+xku2+IKfuAJpTUlUk4ThLLUAFmfNNhQZRvNEN60bZ7PrXSd
         4HC0OSggZjKODACRqywxeR8LnCNE40zzgMrakTJzkH6aeU4C8iEbNZvnrSwjFflYZ1j4
         BnbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789481768; x=1790086568;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c6nXn9QszvDuxbC4bOSKyL0/hzlZ75yA+JSfjiylQcQ=;
        b=1heEAsHVqfkqCVK0aNMhooT/O1US/bTdrSzAp0Qo8M5XIatnlzJxP5Us5n/gTPf+Fb
         IhoRl/VbXZIVmVYvOEd2X3bwEdCyO/q2h58M8foesObSJiqsjx5pLq7qfJB0TDSBFr6y
         /OvNDoTVyU/F3uX4kRz3aVVNlpiiRchSfzdvZpg8o0KlOYk7/JljQDARbjAvod5Xmwdj
         Ey2tedqyqRdEGrZOJXGUeN8w4uPbLgfhCttkPCU1GiTn3QZB7tqaTb4FeL5TZMZkuNJ9
         kJk41Lrx9KqMZqMetGKBwrMe0JaiW4hsXoMyf/5L0juN5DimvsEKCjZkPlNf6EfuHXGP
         D7lA==
X-Forwarded-Encrypted: i=1; AKwUvBz5aHrLLtAIqKp9OSCX5FxKwq3nqL02RLNY4PH71CPu4fJIWJdRKv+xl5KR+sm6dqPJLDIxbL14tAAlBPt33WsE@lists.infradead.org
X-Gm-Message-State: AFuF++klwt1rtOpy0uBPb7sngR8ijhvwz5bkH4qwEE11myVIRbN3TlrL
	amJmYY5Qr+Kcmja4kzWPgr/RVlcczpk+/glnpymIxD78CNzAzEIpwO6H
X-Gm-Gg: AYBFou2db14PZQo6CEIypGm3OGnT05FVQu3cwKhwZcYaWpMDtJYWJd2JfoJB8hj++BJ
	CclxqET4qhA19/93Oa9PlBjeKEEseT3yjjN5KUMfSGteYdD0VxwVeBNRp9JlYuQeCKmikWT4nf7
	cH7MSvqqoKX9k9VpEc17timqd6qSywZIHCjgHK3siGtOOAkoJjxDz7Viqc7MXa/Z9BDYLFWT+Ui
	rZEkc2XDZH4lBJgrk3/r8fyi60atZe7yYJdibxXy9+5COISWrS3Mu3hK+lxF/II4tEJrgONgVMa
	dgrfykr4cGNlH5K7FWdtOts5Sol7wqBy2xYPGVPfVkMaM00nIausJ4UXSxOOe4yRotFJOsLD/bA
	tJP3E5lEd26YQFPB+m5jmJXMftVQZurVxcHH3xPIzUOr+s5HXIbjyvjtMxjhX0XEd3rSZVkdmnz
	GMvL4aB79SIEWO11OPmA2gH8O8kDI6+Yiik3zusflVFJt81D8LgUwrcSJxv2A6QrGeRL6E+RDTt
	UfkhDrvNE0qAf75sxZcPseA
X-Received: by 2002:a05:6000:188b:b0:487:73c:3f9 with SMTP id ffacd0b85a97d-4870a99c862mr1258242f8f.22.1789481767808;
        Tue, 15 Sep 2026 07:16:07 -0700 (PDT)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb357288sm35209776f8f.29.2026.09.15.07.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 07:16:07 -0700 (PDT)
Date: Tue, 15 Sep 2026 16:16:05 +0200
From: Dave Penkler <dpenkler@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Frank Li <Frank.Li@nxp.com>, Mark Brown <broonie@kernel.org>,
	Shengjiu Wang <shengjiu.wang@nxp.com>,
	bui duc phuc <phucduc.bui@gmail.com>,
	Tianchu Chen <flynnnchen@tencent.com>, linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Olivier Moysan <olivier.moysan@foss.st.com>,
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: Re: [PATCH v1 6/7] gpib: fmh_gpib: Replace
 dma_request_slave_channel() by dma_request_chan()
Message-ID: <aqlTJcVHi5CXTyjy@egonzo>
References: <20260915100931.3593242-1-andriy.shevchenko@linux.intel.com>
 <20260915100931.3593242-7-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915100931.3593242-7-andriy.shevchenko@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_071616_994157_83A1F15B 
X-CRM114-Status: GOOD (  19.33  )
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

On Tue, Sep 15, 2026 at 12:04:27PM +0200, Andy Shevchenko wrote:
> Replace dma_request_slave_channel() by dma_request_chan() as suggested
> since the former is deprecated.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/gpib/fmh_gpib/fmh_gpib.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpib/fmh_gpib/fmh_gpib.c b/drivers/gpib/fmh_gpib/fmh_gpib.c
> index 5e10e9353fed..3fdcc673ec8b 100644
> --- a/drivers/gpib/fmh_gpib/fmh_gpib.c
> +++ b/drivers/gpib/fmh_gpib/fmh_gpib.c
> @@ -1458,10 +1458,11 @@ static int fmh_gpib_attach_impl(struct gpib_board *board, const struct gpib_boar
>  	e_priv->irq = irq;
>  
>  	if (acquire_dma) {
> -		e_priv->dma_channel = dma_request_slave_channel(board->dev, "rxtx");
> -		if (!e_priv->dma_channel) {
> +		e_priv->dma_channel = dma_request_chan(board->dev, "rxtx");
> +		retval = PTR_ERR_OR_ZERO(e_priv->dma_channel);
> +		if (retval) {
>  			dev_err(board->dev, "failed to acquire dma channel \"rxtx\".\n");
> -			return -EIO;
> +			return retval;
>  		}
>  	}

Reviewed-by: Dave Penkler <dpenkler@gmail.com>

