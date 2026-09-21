Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C937C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 00:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z0y0iKqkoDH4ID/1W9jrSb7Dm4EYVJh0udefr0qJ8Gw=; b=s7Aba4UbpS+5xFFIp+fnBzMA2r
	egGBdbGAm6lfsb2UfNOZeuXE3du9os398g3Cbqbper+I54R9tedlyjzIUB2tOPjQLV8lw55iduJqf
	/IkH4EnMCUWUT2sTQS6mB31SjCe6JxK5tJBW07JVY1xfI5Ou+8kYab35cyx1xe7l9894XHDmkHwKA
	MnhmLl5P5NWpxqDjLD0qxi1cAcrUfpE4eT1FEq7JYet4zPl9tXLMIlx1noCDkEbo4/RlKtltpLSR8
	pSu28H5w1mFeUbISdNPxHpnVVGsWlRqoXdwHHNU3ldOkL54UIJyb60AZu5sUkQPijCMTSqAnxHUzh
	DhrP5sVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8RhK-00000000ciE-15HZ;
	Mon, 21 Sep 2026 00:15:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8RhJ-00000000chz-0WAC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 00:15:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3BEDB600C8;
	Mon, 21 Sep 2026 00:15:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08B801F000FF;
	Mon, 21 Sep 2026 00:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789949751;
	bh=Z0y0iKqkoDH4ID/1W9jrSb7Dm4EYVJh0udefr0qJ8Gw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Ai59kb6jTqkDSKs9I7Yq/ALk7AeqSUU8wxsHmwTwIlrcdvJCP9go5g98kxVIe2Fvd
	 2MyIH8vy3lh5bqmXbO3zQWHzIrlmAHRKRHV9Yz0fj7fkypOzx1vVfL/aDCgbhC1xfr
	 wj0jlnSTeArcyEVWK7iYejsUyMqNsVDEYZXEm95u+3e/PeRDY/eODxLHxzqijAEr5h
	 D9a9QJf9zr1GtWdoUu/keNbgINRCt9iJNfwz2lzSnDo3QhYQ1EwCahQfD/rr9FfL9p
	 r6We5e99qjPBjp9nfqaHyy/uwl55XOiilvXwFodUbdFj1vWM6Yb0qO6JV1hTigkcZ1
	 7b3zxdufTDUBA==
Date: Mon, 21 Sep 2026 01:15:45 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Fabrice Gasnier <fabrice.gasnier@foss.st.com>, David Lechner
 <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy
 Shevchenko <andy@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, linux-iio@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Sashiko
 <sashiko-bot@kernel.org>, stable@vger.kernel.org
Subject: Re: [PATCH v3] iio: adc: stm32-adc: fix possible division by zero
 in processed channel
Message-ID: <20260921011545.138903c5@jic23-hlaptop>
In-Reply-To: <aquKpzrNNpX0gy1c@ashevche-desk.local>
References: <20260916-adc-fix-div0-v3-1-bedf027a6e7e@foss.st.com>
	<aquKpzrNNpX0gy1c@ashevche-desk.local>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 17 Sep 2026 09:37:27 +0300
Andy Shevchenko <andriy.shevchenko@intel.com> wrote:

> On Wed, Sep 16, 2026 at 07:15:04PM +0200, Fabrice Gasnier wrote:
> > In case the conversion has failed or returned zero, processing *val
> > can lead to a division by zero. Need to check for errors, or converted
> > value is zero, before processing the data. In case the converted value
> > is zero, e.g. the Vrefint channel, this should be considered as invalid
> > in all cases.  
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
> 

Applied to the fixes-togreg branch of iio.git.
Note this may well not go upstream until next merge window.

Thanks,

Jonathan


