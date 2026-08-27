Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 614B1C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 06:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Doh3gHITvz6ndbGdETkwbhIShj6JNDjcl7yqaAUrQ9U=; b=cnt4F+mQeTaa7g8kMBZfqTtVpo
	iJiI/wAoxqWxxwNO7MurFVIk8at7gKoU+vzKtTLK3oJvWu0AVOwQDEso8AYSgOm6aZilYZ1zMW6BT
	zTHNoLKqyGYazQzKWqhGTWwvml9g3V1LYKXVi9rG+57EJlaN5BEFxPMqAz4KR2PPjriw3w97ciRRM
	yIGVBp2j9dVfRqFxPhon9pSXjJV0SjNeSCTEhWHHXpNv9e1K6+YAtZPeDU0Mv3mV1ua/v4wQIA8EJ
	1PvM+qdR9C39IcxNpb4S+ncQlIN/LhUdabipxA+n/DW5InqNdP+JxYkQegtdOs7NJY22cqsVQ6+oI
	C93b2ZcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzT9b-00000003Ry4-1lpG;
	Thu, 27 Aug 2026 05:59:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzT9Z-00000003Rxf-33YK;
	Thu, 27 Aug 2026 05:59:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A0B07600D3;
	Thu, 27 Aug 2026 05:59:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA8EF1F000E9;
	Thu, 27 Aug 2026 05:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787810396;
	bh=Doh3gHITvz6ndbGdETkwbhIShj6JNDjcl7yqaAUrQ9U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=PqNLkcA9AH48C+4/ucRjbApht4e6iuPu7uKD3mt39GkypaF7zBxAG616kNg57fsvw
	 xEzxdHDoPs/3TO9knc1jpvBqT84VzyBX209h+2jLrX4tB+/9iPQ6Kq9oRlQkFwGq5z
	 /2KL2MP0/NS3JDJDIMVwYfFnGClxIAed+tiG4dMcGW0plsgRspiRxnNdJJiT8r612v
	 jDWn6smGrpwlvEPGKgenSvN4HfArE3EEkLtTjoS35tvGNypd8Am8Ck0msNNbBAusoc
	 8zGeTFW6nrMF80XlN1Wi6W0YC32eer5GtXk41/PDp7TntCe4XwU9oOk6s6RgoCbVA4
	 QrmEQUgeyDfCw==
Message-ID: <d0c69e30-de4e-4e69-9556-3fd93d011045@kernel.org>
Date: Thu, 27 Aug 2026 08:59:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] media: microchip: Make sure clk_init_data is fully
 initialized
To: Geert Uytterhoeven <geert+renesas@glider.be>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Hans Verkuil <hverkuil@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
References: <cover.1787240035.git.geert+renesas@glider.be>
 <85c229d88f297fe32c3f2ea42d727b116bdeb998.1787240035.git.geert+renesas@glider.be>
Content-Language: en-US
From: Eugen Hristev <ehristev@kernel.org>
In-Reply-To: <85c229d88f297fe32c3f2ea42d727b116bdeb998.1787240035.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
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

On 8/21/26 13:04, Geert Uytterhoeven wrote:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
> 
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> Compile-tested only.
> ---
>  drivers/media/platform/microchip/microchip-isc-clk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

The only nitpick I have is that "media: microchip" holds multiple
drivers, while you are fixing this for the microchip ISC.

Regardless,
Reviewed-by: Eugen Hristev <ehristev@kernel.org>
> diff --git a/drivers/media/platform/microchip/microchip-isc-clk.c b/drivers/media/platform/microchip/microchip-isc-clk.c
> index 24358d804e75d75c..65d5fb8019b341b8 100644
> --- a/drivers/media/platform/microchip/microchip-isc-clk.c
> +++ b/drivers/media/platform/microchip/microchip-isc-clk.c
> @@ -231,7 +231,7 @@ static int isc_clk_register(struct isc_device *isc, unsigned int id)
>  	struct regmap *regmap = isc->regmap;
>  	struct device_node *np = isc->dev->of_node;
>  	struct isc_clk *isc_clk;
> -	struct clk_init_data init;
> +	struct clk_init_data init = {};
>  	const char *clk_name = np->name;
>  	const char *parent_names[3];
>  	int num_parents;


