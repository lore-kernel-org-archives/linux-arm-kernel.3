Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D137BCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 16 Aug 2025 13:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPyhB+H37GCJFLmsDEF8NeELi5nFnFIEuEaO7GJtO+g=; b=WbOF7MNlU8MrM5DO56beHIkwvu
	QA85m4V8mrRgNbqFWwjH304nmEP1g6+esQD9Agi3jyzWs9Mnmfy8rVStcjoq1BRwR6jzOxE1PWI+j
	0H1fMKxDioWWY0osTxTRHOyQ6GBmUBLa0mGnzuCNmthgV4rf7IibzpLB01U1wtd9b+rscNVzm1z2/
	5geWXobmvSb8/wbcIZWltMyBbfBE96ihu3eJqqoLc/80woYpgof11pQX7dC9cxE2L1E+2Y3UJZRLn
	wlcrlZHFERL6+5nji82ww0lWKepW6Xs/bt0brBQmdUhIOYd3kMf5ver2drtMvkTQCtUADQOw1tMnH
	ecC9ke+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unH0b-00000004gzU-3FuS;
	Sat, 16 Aug 2025 13:31:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unGxw-00000004guE-16Xy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 16 Aug 2025 13:29:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AB6285C2570;
	Sat, 16 Aug 2025 13:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32215C4CEEF;
	Sat, 16 Aug 2025 13:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755350939;
	bh=LhpgfZIG1p+iKd5jf1S6zPl8oL3nAGFq/mjJ8z+fS60=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=u0uNW2H97GYGYKNmLh/zJe+wyCd8Qrvbu7q+ZLdC1iXQjBQZqiKPV/tkWq/6RbjDb
	 Pqy6XZv6fJxR/GC/h+z9GR4T6baTpI6vjqpqB04V5aE2RxqSxrlct/K2YoD13QTc9+
	 irQ/tVt2BiUNHXNQAziQQeuELeNsySHyQlFM71t/B3dTEQidVgqjZICkvyQBX3aQr1
	 3RGedHXiWiwfSxBzqPrBSdOTMyRMTY6FZn+eBTjNmYyUxEihEn9N8r7jOtrqlpLlZd
	 kcjnsOcKHwNWGoYOcF/rjWXwlqfQp7UAu8CRMLZbFRl2wlvW8VrltyWzrOGHE8h7La
	 04GlgZBjALwwg==
Date: Sat, 16 Aug 2025 14:28:50 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Haibo Chen <haibo.chen@nxp.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 primoz.fiser@norik.com, linux-iio@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Keep imx93 ADC works even calibration failed.
Message-ID: <20250816142850.53948a13@jic23-huawei>
In-Reply-To: <20250812-adc-v2-0-0260833f13b8@nxp.com>
References: <20250812-adc-v2-0-0260833f13b8@nxp.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_062900_350902_5781362B 
X-CRM114-Status: GOOD (  15.77  )
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

On Tue, 12 Aug 2025 16:04:21 +0800
Haibo Chen <haibo.chen@nxp.com> wrote:

> imx93 ADC calibration has requirement for reference voltage:
>   ADC reference voltage Noise < 1.8V * 1/2^ENOB
> 
> Some boards can't meet such requirement, ADC calibration failed on these
> boards, and adc can't be used. This is not appropriate, board can't meet
> this requirement do not means ADC can't work, just means ADC can't work
> that accurate. Here add an optimization, keep adc works even calibration
> failed.
> 
> Changes in V2:
> - add patch 1 to keep one style of the hex values according to
>   Andy Shevchenko's suggestion.
> - keep {} when give the calibration failed warning log.
> 
> For the register 0x3A0, it is a new added register in latest imx93 RM,
> please refer to this link:
> https://www.nxp.com/products/processors-and-microcontrollers/arm-processors/i-mx-applications-processors/i-mx-9-processors/i-mx-93-applications-processor-family-arm-cortex-a55-ml-acceleration-power-efficient-mpu:i.MX93
> 
> Patch v1 also pass test on one customer board, refer to this topic:
> https://patchwork.kernel.org/project/linux-iio/patch/20250710073905.1105417-2-primoz.fiser@norik.com/
> 
> Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
Series applied to the togreg branch of iio.git.

I'll push that out as testing to get a bit of build coverage before
risking letting next see it.

Thanks,

Jonathan

> ---
> Haibo Chen (2):
>       iio: adc: imx93_adc: keep one style of the hex values
>       iio: adc: imx93_adc: load calibrated values even calibration failed
> 
>  drivers/iio/adc/imx93_adc.c | 22 +++++++++++++++++-----
>  1 file changed, 17 insertions(+), 5 deletions(-)
> ---
> base-commit: 2674d1eadaa2fd3a918dfcdb6d0bb49efe8a8bb9
> change-id: 20250812-adc-839e49d55da9
> 
> Best regards,


