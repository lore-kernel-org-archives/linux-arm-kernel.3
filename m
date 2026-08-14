Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80299C5CFC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 10:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vv9ElWHr/YmaE7l5LFfutWEHAKuNlZRFB/RqWtFexJs=; b=tU1GDRxfh2whf6h8iEbKyewwmk
	Pub7fXVIaHBc/JHF3MFGFLRVd1ABDKIBtns/SYd8DjYTvDXxzzG7jhC5u2+noQD8i5OOd7cW81/Db
	Sx6wgTfqHUURGS+6hPQkjO8TRmiNdhPzi5e8o3NR1doBFtZRYOTI9ry0BOKNnPe/cgnFCcZB85I4V
	H3oiDyr7JDgq1878KWHjCRzSVfCXaJX9011JxNwXUVJoivm4ZIrghp48+QLab4pLJ24maqfV/+oTI
	xPkduRHkzlDkSicSgKm77WUBXOWH2abYqOTyo7AOXa1EmG3ye5vNpaIL4BiGN9Rbd5A/XfxY6gWf1
	NqZ9De1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wup4h-00000002VWk-26oH;
	Fri, 14 Aug 2026 10:23:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wup4f-00000002VWG-421J;
	Fri, 14 Aug 2026 10:23:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A6C060120;
	Fri, 14 Aug 2026 10:23:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA2BF1F00A3A;
	Fri, 14 Aug 2026 10:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786703020;
	bh=Vv9ElWHr/YmaE7l5LFfutWEHAKuNlZRFB/RqWtFexJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fQS9sxXypKq0JbDvJieP+FbkJqcDMbLuY8RsXx1mNzQGqNdxU6HOCNzWJMbgQSi0W
	 jH+RwDIhcRpL/W09Jf8JNNSiEJ8YwwG6KsRK0E0T4PdRYb5GyEWvPjjX4wPAKT0Jol
	 4BTIjLoWV0HZMm19RoS7Thm9aN5N7Dr/8BvWwdPgaP7xcnm2WJOHmWAyuYHKgou5N5
	 j5svN3n5M3nzvT7OeIpPyZ0Tpk5DdrVbUNvYhsevyPRm3Oa+2oH0ecvn0KcIAiPL9o
	 V5JmVUbydgfMzRubR++NPyRHih5KMTaiEsiplyp0faSvsO9i+GGaPcJFSjSRm6hG3m
	 Om/r+7onHCMaw==
Date: Fri, 14 Aug 2026 12:23:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vladislav Leonov <vlad@zlab.su>
Cc: linux-rockchip@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Simon Glass <sjg@chromium.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, 
	Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org
Subject: Re: [PATCH 18/25] spi: rockchip: Add support for RV1106
Message-ID: <20260814-jovial-black-swift-bf0dce@quoll>
References: <20260810121121.210040-1-vlad@zlab.su>
 <20260810121121.210040-19-vlad@zlab.su>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810121121.210040-19-vlad@zlab.su>
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

On Mon, Aug 10, 2026 at 03:11:09PM +0300, Vladislav Leonov wrote:
> Add the "rockchip,rv1106-spi" compatible to the match table. No driver
> changes are needed beyond that, since the controller behaves like the
> other Rockchip variants already handled by the driver.
> 
> Signed-off-by: Vladislav Leonov <vlad@zlab.su>
> ---
> 
>  drivers/spi/spi-rockchip.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/spi/spi-rockchip.c b/drivers/spi/spi-rockchip.c
> index 231fbcf0e7aa..447e6ff47c53 100644
> --- a/drivers/spi/spi-rockchip.c
> +++ b/drivers/spi/spi-rockchip.c
> @@ -1021,6 +1021,7 @@ static const struct of_device_id rockchip_spi_dt_match[] = {
>  	{ .compatible = "rockchip,rk3328-spi", },
>  	{ .compatible = "rockchip,rk3368-spi", },
>  	{ .compatible = "rockchip,rk3399-spi", },
> +	{ .compatible = "rockchip,rv1106-spi", },

Why do you need this? It's fully compatible, no?

Best regards,
Krzysztof


