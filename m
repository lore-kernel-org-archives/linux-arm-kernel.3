Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE75C79F85
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 17:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQI50zAlpRNRl7CNe3z23eRiYtts28BaDCn5eRT3PKY=; b=qZWp8clKzTNf/guxHvoKMK+81W
	wzc7t7bBn5JY2rVO0ZQCC5nsCUy+q/519rGPGHfIrOrppDpD63AF1d+GJWzNjO8ocHiwdXxJVGR4N
	oL/ZysSo97WtR81cU9w+YZqBCct/FacUR4dhddScJCvR1hag1xijpNMM3gva57pLrjksTzIi/dcYq
	fE57hMv/YCrzM40/DxUPPKrcrY58lEmWhs/hmXl9u/yxJ3IVwufJ7hhhp36W8Qow2y9UllXl7pWqz
	7bjQ0ONBHXca3TQNoE0gDPoPifg7sxnD7oXLXklUjvJ9j8LhcIIX8w4pTIU0LlcaF3XMn8caCr697
	HWXAsWog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Gmv-00000005Eaw-2Vl7;
	Sun, 06 Sep 2026 17:36:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Gmu-00000005Ean-2HkC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 17:36:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D0A7541A18;
	Sun,  6 Sep 2026 17:36:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8B081F00A3A;
	Sun,  6 Sep 2026 17:36:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788716175;
	bh=tQI50zAlpRNRl7CNe3z23eRiYtts28BaDCn5eRT3PKY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=etnTAlcdyW49WLTIO6+24BzpYy3B3zpdaEfduraFJDISbmru+pkZoNgxaBX3szNPl
	 S9Vp2AwtgOLg/M1i4tRzMW/qqmy3VylqBPGnOooBoW/nRNzqbMhy1l/y2Vq8Dhlp5H
	 iGryy/5ndmOD/U0Vus86WbLBfnYU5FqSTdIR+HDT1DXckxHPTo9EDdYWNnY1amB0lW
	 ZOsRyt9IUNSMqlbRZiv5k9CiGKSMjTHCjkVc2zs5LvKeIW1s8zzLbzgv4HBvEztmwG
	 zu0ChVCeWiYop5pVJ37ntLKuHytj51Xl3+mJPEAoqw7QQf4DNmuoNEauAcO74rMLhb
	 EZn4YafavVTFw==
Date: Sun, 6 Sep 2026 18:36:10 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Felix Gu <ustc.gu@gmail.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Chen-Yu Tsai
 <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Quentin Schulz
 <quentin.schulz@free-electrons.com>, Maxime Ripard <mripard@kernel.org>,
 linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] iio: adc: sun4i-gpadc-iio: two fixes
Message-ID: <20260906183610.24d09404@jic23-huawei>
In-Reply-To: <20260906-gpadc-v1-0-92d3dc8ef355@gmail.com>
References: <20260906-gpadc-v1-0-92d3dc8ef355@gmail.com>
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

On Sun, 06 Sep 2026 23:58:33 +0800
Felix Gu <ustc.gu@gmail.com> wrote:

Some text here would be normal even if it doesn't add much!

Anyhow, both fall in the obviously correct category so
I've queued them up on the fixes-togreg branch of iio.git
and marked them for stable.

Thanks,

Jonathan

> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
> Felix Gu (2):
>       iio: adc: sun4i-gpadc-iio: drop underflowing pm_runtime_put() calls
>       iio: adc: sun4i-gpadc-iio: clean up on thermal zone registration failure
> 
>  drivers/iio/adc/sun4i-gpadc-iio.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> ---
> base-commit: 9d80aa4617b32f5054c5aa471d06b66704854935
> change-id: 20260906-gpadc-d41b964d8f17
> 
> Best regards,
> --  
> Felix Gu <ustc.gu@gmail.com>
> 


