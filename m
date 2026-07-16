Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E80DC4450A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 21:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UJZAhb9RgM9d8hUbh6RRahEnG4GOizBPWsF1dbPje+o=; b=XyATWx0DSucbxhGsvG/oHXngHh
	L02MZP0QwHs1/LX5241X0AaIj2mgPrfjaIJ1CfsViJF3xa8zC+F38HEWuOoyKN5aOGEJLqpYrdcpj
	Fo3Ha2Tp4nu46sOWXs9hm6PrpvqCxxvVsGVJEkMR+P5DTu5DkLgO/9uE5qST9uiA/aEkNSkj1B6I1
	MQiGDSO+tG4Jt6UBbXFzSsCJK+eK5t/kK9SZOi3PBnmw07RSVQZChUOMLED24EdQusThRZJ6fV6mj
	oXaIE9EUJfzl6lUMeffpXYWZtKwSRiMa0d2I0KraO8AZW+2dfvc+U8T0auG4JLl+jb6YXi2zoA63Q
	5JoDNf0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTWJ-00000000bI2-40D3;
	Thu, 16 Jul 2026 21:21:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTWJ-00000000bHr-1984;
	Thu, 16 Jul 2026 21:21:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A7F2E414EB;
	Thu, 16 Jul 2026 21:21:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55ED71F000E9;
	Thu, 16 Jul 2026 21:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784236886;
	bh=UJZAhb9RgM9d8hUbh6RRahEnG4GOizBPWsF1dbPje+o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=hyt+L1uFtJE3Fa5VCqMgfYR7jFyFoLhn3SrcqDtkRn9igyQ2sD21ZkrhrkFriECTO
	 NqSuyQXgdCqGxiOaJZFb+VxdVBPbiVjeFqKZnRmU77GUedjFglTjt9qZk5aZfHzKtX
	 qVwuREilGBI7uARoj93f34uXwLDl0VSrHi3WXQIz1HaEKc/D7QFcWCWsXNA9tNmhn5
	 NYWMl7pVGU8MojCKUse6uij6TAKkFXqnKc2LVVli/tc8neRK5VT1/933eg/ix/xZIR
	 N9BGQTbo+AnlSiCDx03qnUaiteUIO7hQfrQNdYQTADiFiZ9JCryxLwLoy7nwOlCoIQ
	 gA5/ko8zPNBvQ==
Message-ID: <0348730b-d16c-48f9-a21e-3ee0b1334c60@kernel.org>
Date: Thu, 16 Jul 2026 22:21:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] nvmem: rockchip-otp: skip zero-byte reads
To: Ruoyu Wang <ruoyuw560@gmail.com>, Srinivas Kandagatla <srini@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Jonas Karlman <jonas@kwiboo.se>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260618040859.407326-1-ruoyuw560@gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srini@kernel.org>
In-Reply-To: <20260618040859.407326-1-ruoyuw560@gmail.com>
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



On 6/18/26 5:08 AM, Ruoyu Wang wrote:
> nvmem_device_read() does not reject a zero-byte read before calling the
> provider reg_read callback. rockchip_otp_read() then enables clocks and
> dispatches to the SoC-specific callback.
> 

if the core does not do this check then the check belongs in the core
not in individual providers.

--srini
> Return 0 from rockchip_otp_read() before enabling clocks when bytes is
> zero. This avoids hardware access for empty reads and prevents zero
> counts from reaching the internal reg_read callbacks.
> 
> Fixes: 8ab099fafbbc ("nvmem: rockchip-otp: Add support for RK3588")
> Suggested-by: Jonas Karlman <jonas@kwiboo.se>
> Signed-off-by: Ruoyu Wang <ruoyuw560@gmail.com>
> ---
> v2:
> - Handle empty reads in rockchip_otp_read() instead of initializing ret in
>   rk3588_otp_read().
> 
>  drivers/nvmem/rockchip-otp.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/nvmem/rockchip-otp.c b/drivers/nvmem/rockchip-otp.c
> index 0ec78b5e19e7d..95685a9fcc77b 100644
> --- a/drivers/nvmem/rockchip-otp.c
> +++ b/drivers/nvmem/rockchip-otp.c
> @@ -272,6 +272,9 @@ static int rockchip_otp_read(void *context, unsigned int offset,
>  	if (!otp->data || !otp->data->reg_read)
>  		return -EINVAL;
>  
> +	if (!bytes)
> +		return 0;
> +
>  	ret = clk_bulk_prepare_enable(otp->data->num_clks, otp->clks);
>  	if (ret < 0) {
>  		dev_err(otp->dev, "failed to prepare/enable clks\n");


