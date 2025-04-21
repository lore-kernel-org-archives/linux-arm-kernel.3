Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586A7C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 11:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U8sYZyG1Q82B9mZMiuVdwGXhXA53NdDNooh74k3l2ls=; b=uHRyXvVNgWjZm4McYF95r1ZW8X
	UrtfphJ67UKuevCP09sMWpWkHNujDAO2HDtWd7cEs5zZ92p9CE/DLxBOmO9ox3jm2FYrJnnVdPzih
	o4fU+ERIQ57m3C/tGAUC2GZ4zJP3KpQu9bkrVRJ4ckkKZoii73r7F72Yo3M3o3/u2PluT6Ss6cLwV
	b9ciBXJLMMYct4F9m5KnQYmke6mwejtDw7Zh5cs0G2nbti8zw6fxHQ3gdLGs5zbnXdpdQEDOXab1Y
	7mVQPvIT6i76xInpGaKtQp6mwEOydmRSkfTZhmsMcFF1wzyiFD2OFOiPIJbrHvblio1A/mCU750sK
	CwW2vcVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6pGP-00000004BvU-17aS;
	Mon, 21 Apr 2025 11:24:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6pA3-00000004BIq-3UcK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 11:18:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D52684A58A;
	Mon, 21 Apr 2025 11:18:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45781C4CEE4;
	Mon, 21 Apr 2025 11:17:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745234283;
	bh=USOlz+eqtQB3+FtKVUspdDKmHiwUiEaAqh+xoaci2Lo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=u+mQihMeljmxRToq4vLWJkTWNB90Va0fKqkBYzu8vYC/MxjJU+CG72R4LBbJjLo91
	 BoCMnbHxkzQ4LOxaYbDmIgJ3nuQN1MPCHL8NgOEvFlsGvdRUSoWFv0CfMKT3FZVeL0
	 IRECzDhQsSUeucp1L8AUQhNisZ3q6aICkBfUhTkIGIaHjWJFvNa/AAHnTMmqgJn/jO
	 psgr+Q6iCj5qDorPs38PyrAyftZMpqSug/e2BC/U96v26UwTTTbEqbWdyW//8Tp143
	 bSrG78Fde/w6848U8BZXQom1OxXevS9DAtMMEs8A0QXlLOfFyH8P74CUfbmzAfuOWF
	 TkMaau80HEy7Q==
Date: Mon, 21 Apr 2025 12:17:52 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
Cc: Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko
 <andy@kernel.org>, Eugen Hristev <eugen.hristev@linaro.org>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Andreas Klinger <ak@it-klinger.de>, Shawn Guo <shawnguo@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team
 <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 imx@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 00/10] iio: prefer aligned_s64 timestamp (round 1)
Message-ID: <20250421121752.5a7a178e@jic23-huawei>
In-Reply-To: <abe0db44-b27f-4cea-9edc-862e4096f80c@baylibre.com>
References: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
	<abe0db44-b27f-4cea-9edc-862e4096f80c@baylibre.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_041803_920724_B7CCB9C0 
X-CRM114-Status: GOOD (  25.76  )
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

On Fri, 18 Apr 2025 18:05:42 -0500
David Lechner <dlechner@baylibre.com> wrote:

> On 4/18/25 2:58 PM, David Lechner wrote:
> > While reviewing the recent conversion to iio_push_to_buffers_with_ts(),
> > I found it very time-consuming to check the correctness of the buffers
> > passed to that function when they used an array with extra room at the
> > end for a timestamp. And we still managed find a few that were wrongly
> > sized or not properly aligned despite several efforts in the past to
> > audit these for correctness already.
> > 
> > Even though these ones look to be correct, it will still be easier for
> > future readers of the code if we follow the pattern of using a struct
> > with the array and timestamp instead.
> > 
> > For example, it is much easier to see that:
> > 
> > struct {
> > 	__be32 data[3];
> > 	aligned_s64 timestamp;
> > } buffer;
> >   
> After sending [1], I realized that some (perhaps many) of these would actually
> be a better candidate for the proposed IIO_DECLARE_BUFFER_WITH_TS macro rather
> that converting to the struct style as above.
> 
> Case in point: if the driver using that struct allows reading only one channel,
> then the offset of the timestamp when doing iio_push_to_buffers_with_ts() would
> be 8 bytes, not 16, so the struct would not always be the correct layout.
> 
> As long as the driver doesn't access the timestamp member of the struct, it
> doesn't really matter, but this could be a bit misleading to anyone who might
> unknowing try to use it in the future.
Agreed.  

These timestamp inserting functions have always been a bit weird. I kind
of regret not just leaving it as a per driver thing to do, but that ship
long sailed.  I definitely want to keep the layout apparent in the drivers
though so this approach only applied to 1 of the ones in this series.

Jonathan

> 
> [1]: https://lore.kernel.org/linux-iio/20250418-iio-introduce-iio_declare_buffer_with_ts-v1-0-ee0c62a33a0f@baylibre.com/


