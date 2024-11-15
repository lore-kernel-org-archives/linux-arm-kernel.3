Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E03AAD68BD9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 Nov 2024 21:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AWh9klfXd1JRktVjoXXZusztn87adE5QwDCEB4e55QU=; b=tLZoEt3/KWLHIAOTfwcbr1xmbf
	F8eOEF9Mzd0ul9519MfPzS1bcM5XMo6CcCpbLYRdK8306+aaq2BqVw50NibzvnzAOMs0BBtHs9WEG
	XlVharrdCg8Kbu+GUNwjDvlsjcDEuXEEItqnThrmOjIkxbkA60fIdbS/jPyAJL9IHwMx3szme9/xW
	5yjVHqRWVR3mI/zPVfjCAPhID3ybHAHVwsNUYpu0o2uFHb1U0eo8Q1Lv6tLI5D04mND25tqMogi2E
	5BLlzZ5Jk6lfcmwJT+Z9O3f4AFyfpkKAbfOjv3vkViSev//67xpjMubqpkbf1T3KvAT3YLA6vXiDK
	H77CIsVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC4H2-00000004IcD-3Gy6;
	Fri, 15 Nov 2024 21:54:40 +0000
Received: from bout3.ijzerbout.nl ([2a01:7c8:fff8:2b8:5054:ff:fe86:f72d])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tC4G7-00000004IRC-3gs9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 Nov 2024 21:53:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ijzerbout.nl; s=key;
	t=1731707622; bh=Zc3jub9AseieKkXFd7dNqYp5WdAhShCU0Si0Xo4Io/E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WkU4eDBmIOVQQ7JlaQGv5TuWpytYOEt01AQ522wbU2g1HNC1PxoSKKWKPfNj6xsFx
	 Hihsg3sqXeKt3ef+YWZKeByQ+MdOkSQj68STs81TtUbHjdbvoiyFgS5ISw9DXlht5x
	 5E8TvYZw2sNpAhBKFralW4ULkSC/5WdA/DIgCnDlHXh7WGRnuPVQ9cKHC4fn1CMuvL
	 TOEz7eLs8LfQ+uEUNJUCAIsvwnaCXBhE89PM/dxtZGPwOMpuHg8N6PxZ9Av8ZPhMUU
	 FzHUKKiub1GK0NXYeTTepcJA9zwCY2mHPxeEdA2AhOLLOIuhqNzcNEspOvNraMxC4C
	 DVxFfegrZ8N9D7tJMXOm2K40gfj7P0m7D7lG0+VA3d7p/4qZu0ci6civcb/0YBEEPu
	 NlG43J+bhRLwQkyzxl8wvCQk4OwuvfTwfanU4l4wAp6UrpCF1tAG2R+Fd3IwcjrfC8
	 6w41uRfK2GP9NVKjRjV87csn5eS17meS16K8Oz/9ZHWeVH68Fr7dOkbY4uk+/A9CVy
	 rlFIbzfZ+ZXAsPIgs70nsuE0chRN5w6woRbCdrFyEIZvvygyJN9dwSaAzLsacyrV2i
	 cb3aviIfH4VWqJdp5D3s/tX9Ne/rKfl3FjlPfzqOyam6sYYPlWMu2ajEhszzwseMqG
	 Bi/76fk38NyqpgxujFw+w0d4=
Received: from [IPV6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a] (racer.ijzerbout.nl [IPv6:2a10:3781:99:1:1ac0:4dff:fea7:ec3a])
	by bout3.ijzerbout.nl (Postfix) with ESMTPSA id BA5D218E010;
	Fri, 15 Nov 2024 22:53:42 +0100 (CET)
Message-ID: <1d3623ee-1f16-487c-98cb-ca2647e7239d@ijzerbout.nl>
Date: Fri, 15 Nov 2024 22:53:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] spi: imx: support word delay
To: Jonas Rebmann <jre@pengutronix.de>, Mark Brown <broonie@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: kernel@pengutronix.de, linux-spi@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241113-imx-spi-word-delay-v2-0-2b65b737bf29@pengutronix.de>
 <20241113-imx-spi-word-delay-v2-2-2b65b737bf29@pengutronix.de>
Content-Language: en-US
From: Kees Bakker <kees@ijzerbout.nl>
In-Reply-To: <20241113-imx-spi-word-delay-v2-2-2b65b737bf29@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241115_135344_052633_29C425AF 
X-CRM114-Status: GOOD (  15.20  )
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

Op 13-11-2024 om 13:18 schreef Jonas Rebmann:
> Implement support for the word delay feature of i.MX51 (and onwards) via
> the ECSPI interface.
>
> Convert the requested delay to SPI cycles and account for an extra
> inter-word delay inserted by the controller in addition to the requested
> number of cycles, which was observed when testing this patch.
>
> Disable dynamic burst when word delay is set. As the configurable delay
> period in the controller is inserted after bursts, the burst length must
> equal the word length.
>
> Account for word delay in the transfer time estimation for
> polling_limit_us.
>
> Signed-off-by: Jonas Rebmann <jre@pengutronix.de>
> ---
>   drivers/spi/spi-imx.c | 95 +++++++++++++++++++++++++++++++++++++++++++++------
>   1 file changed, 85 insertions(+), 10 deletions(-)
>
> [...]
> +static unsigned int spi_imx_transfer_estimate_time_us(struct spi_transfer *transfer)
> +{
> +	u64 result;
> +
> +	result = DIV_U64_ROUND_CLOSEST((u64)USEC_PER_SEC * transfer->len * BITS_PER_BYTE,
> +				       transfer->effective_speed_hz);
> +	if (transfer->word_delay.value) {
> +		unsigned int word_delay_us;
> +		unsigned int words;
> +
> +		words = DIV_ROUND_UP(transfer->len * BITS_PER_BYTE, transfer->bits_per_word);
> +		word_delay_us = DIV_ROUND_CLOSEST(spi_delay_to_ns(&transfer->word_delay, transfer),
> +						  NSEC_PER_USEC);
> +		result += words * word_delay_us;
If the multiplication can overflow 32 bits to need to force a 64 bits 
multiply.
     result += (u64)words * word_delay_us;

But I'm wondering if `result` needs to be u64.
> +	}
> +
> +	return min(result, U32_MAX);
Do you really expect this much? You're clipping to U32_MAX.
U32_MAX microsecs is already more than an hour.
> +}
> [...]

