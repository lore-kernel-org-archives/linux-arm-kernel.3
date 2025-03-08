Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5617C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 16:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jz9BB591012Qa1FYcCC9cC4/JIUQd6UFu0pnJo6hJL8=; b=FT6aBnIatl9Sso7oztR1GQGFL1
	NJfEdLs2QY/EemexJ+edrcu7925OLa0r2vqzS4qKZGUnJoqBkgLDB8oDjrouaYmK1CVxXH7qmxdMK
	egSRz+Y6iH1kuNN2v/HIdevvnx1/9l46fAplnmGwlD5vM/YLsKW7r9gEQtb+RqO+H+QYzIL3O4dmR
	BUDTV/MzyV+k7zXarKaa+o5B4z/dxwTfVvsXLKGjn8TPDKhQi14ehmz/S9OSDry+BnyqNdYvGcQo1
	hRKmb1xkkW/qHU1nZlhieyaO5r1LmExGEA2O70AhdrLa57udn4xJavyF6wOVBayZou7hNH7rubLvc
	3Bc8HwzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqxBY-0000000GsO9-3Dfm;
	Sat, 08 Mar 2025 16:38:00 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqx8w-0000000Gs8L-1DQX
	for linux-arm-kernel@lists.infradead.org;
	Sat, 08 Mar 2025 16:35:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EA00DA45956;
	Sat,  8 Mar 2025 16:29:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B44C4CEE0;
	Sat,  8 Mar 2025 16:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741451717;
	bh=hHfV8kx8wrHR7+8E6WI3ssEv6MnebcU05CUBb1yiFgs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=X/aNA7Z3E5cln+jCB0zSs1H9LkqPep9eoxzzWKcZIU+8eV5SJC7Niy4qJcuheOy7M
	 9jXNklRhgO0354yo/C0Y7a9lNVMmswFZstnIFJkTrL4Q5IsPNPf7lX2oHj1TIk1U+7
	 Zn9MUQGVFMy4M9oEc8qByBN/K1guazaezxjZ73xjTCxKLUEDWOcydNFoRPX+WtRPjb
	 FMRb2z0PoepLTIe3zlLIcWgjAVQLXvmF1dLr8Gd2x9jcyfsZO3qx9SRix/detu8+k4
	 x0fa1g2TCb2uW0OhpL58j6TrY/YF4JNNEywgQLK5/8XFYN5XqNbBpzphLfSouQURjD
	 ymqt8ajSytsyQ==
Date: Sat, 8 Mar 2025 16:35:05 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Matti Vaittinen <mazziesaccount@gmail.com>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Lars-Peter Clausen
 <lars@metafoo.de>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Nuno Sa
 <nuno.sa@analog.com>, David Lechner <dlechner@baylibre.com>, Javier
 Carrasco <javier.carrasco.cruz@gmail.com>, Olivier Moysan
 <olivier.moysan@foss.st.com>, Guillaume Stols <gstols@baylibre.com>,
 Dumitru Ceclan <mitrutzceclan@gmail.com>, Trevor Gamblin
 <tgamblin@baylibre.com>, Matteo Martelli <matteomartelli3@gmail.com>,
 Alisa-Dariana Roman <alisadariana@gmail.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v5 05/10] iio: adc: sun20i-gpadc: Use adc-helpers
Message-ID: <20250308163505.200135cc@jic23-huawei>
In-Reply-To: <aabd8836dbe54ef54730d1cd112edb52a57cd353.1740993491.git.mazziesaccount@gmail.com>
References: <cover.1740993491.git.mazziesaccount@gmail.com>
	<aabd8836dbe54ef54730d1cd112edb52a57cd353.1740993491.git.mazziesaccount@gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.48; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_083518_397405_44C8BC38 
X-CRM114-Status: GOOD (  12.68  )
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

On Mon, 3 Mar 2025 13:33:02 +0200
Matti Vaittinen <mazziesaccount@gmail.com> wrote:

> The new devm_iio_adc_device_alloc_chaninfo() -helper is intended to help
> drivers avoid open-coding the for_each_node -loop for getting the
> channel IDs. The helper provides standard way to detect the ADC channel
> nodes (by the node name), and a standard way to convert the "reg"
> -propereties to channel identification numbers, used in the struct

same typo.

> iio_chan_spec. Furthermore, the helper can optionally check the found
> channel IDs are smaller than given maximum. This is useful for callers
> which later use the IDs for example for indexing a channel data array.
> 
> The original driver treated all found child nodes as channel nodes. The
> new helper requires channel nodes to be named channel[@N]. This should
> help avoid problems with devices which may contain also other but ADC
> child nodes. Quick grep from arch/* with the sun20i-gpadc's compatible
> string didn't reveal any in-tree .dts with channel nodes named
> otherwise. Also, same grep shows all the in-tree .dts seem to have
> channel IDs between 0..num of channels.
> 
> Use the new helper.
> 
> Signed-off-by: Matti Vaittinen <mazziesaccount@gmail.com>
> 
Otherwise LGTM

