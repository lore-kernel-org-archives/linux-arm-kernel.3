Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CD7CAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 11:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RnNU9ozBiGF864UukpFzKKBhhCDLOiEXPaER1ri3ei0=; b=eITEIgqD52Ah7hV4LTI9ukGR2P
	EELXKhW4ZUIdHb+Y5gsJJIL0ZVoJ1eJA4pNtqc5s63pTiqYuw4F6xBXF/aaX4lkbjyqh8x4iGh9hl
	MXRhaMunobte1meo4N0wLNFESyoQSkGA9APj8lbovbLtZlhMJUpa5NrDbPjqK8fdMBQEO8GU0Wswo
	hComeY0AS4e+vFqSGC8M4oviG3r56OSPq1Sb+H7nvOBp8yUpkv+RKcyuFF2rynoLoORukOtPWxF5I
	Rj+gnt6jLLt39iVW8aHMMP4X/vAEX/8Z0BACZnrYNV8nnYY6XPSiWvo1xmr7bz/D1+LlHUqWMFNaY
	+yNNHwNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3v27-00000007Oc9-3y1x;
	Wed, 01 Oct 2025 11:30:07 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3v24-00000007Obk-3zTf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 11:30:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1759318203;
	bh=TSN7wdoIY+RSiBU4VS9HFoh1mDkmc2W2ztVCZNYeegY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qOewgJOBumdbTEqeUO+6E1ND+PzsymTS1jyCR9u4D4PNk0/7VIvuKWOte+j5h8V08
	 VQyDcA/1MO0Zzr2sVf+4ScAw2q7ENE3D/ESv/XBjIRh7ClnZ4S+7V8lRF7Pl5MmNfg
	 kCEyIRSavX5f+sNvLQXJt6HqoLRNzKORTKXYBNSS2kIEXX+gIUCUPc1U7cB+Hf/pEZ
	 +bR8w7RQPeFQjIUiS2GZnTzMwgX26J6uLKJOgNektxGbRBSN/EVxRliw+JsF0im0Qn
	 Ns3ZHNP/oMvKkQeOjKQ7WTTBxJUlFUkdArcWjGcqGU/lXzVkJgAbcuxK15J/iV2OgT
	 juAORtLROMc6g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9EC1C17E00AC;
	Wed,  1 Oct 2025 13:30:02 +0200 (CEST)
Message-ID: <7909d937-aa93-44bf-a4d3-12849a14fdf4@collabora.com>
Date: Wed, 1 Oct 2025 13:30:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 13/13] spi: airoha: buffer must be 0xff-ed
 before writing
To: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Ray Liu <ray.liu@airoha.com>,
 Mark Brown <broonie@kernel.org>, Andy Shevchenko <andy@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Andreas Gnau <andreas.gnau@iopsys.eu>
References: <20250930022658.1485767-1-mikhail.kshevetskiy@iopsys.eu>
 <20250930022658.1485767-14-mikhail.kshevetskiy@iopsys.eu>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250930022658.1485767-14-mikhail.kshevetskiy@iopsys.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_043005_155549_37CA773D 
X-CRM114-Status: GOOD (  15.39  )
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

Il 30/09/25 04:26, Mikhail Kshevetskiy ha scritto:
> During writing, the entire flash page (including OOB) will be updated
> with the values from the temporary buffer, so we need to fill the
> untouched areas of the buffer with 0xff value to prevent accidental
> data overwriting.
> 
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> ---
>   drivers/spi/spi-airoha-snfi.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/spi/spi-airoha-snfi.c b/drivers/spi/spi-airoha-snfi.c
> index 437ab6745b1a..57b1950e853f 100644
> --- a/drivers/spi/spi-airoha-snfi.c
> +++ b/drivers/spi/spi-airoha-snfi.c
> @@ -776,6 +776,7 @@ static ssize_t airoha_snand_dirmap_write(struct spi_mem_dirmap_desc *desc,
>   		return -EOPNOTSUPP;
>   	}
>   
> +	memset(txrx_buf, 0xff, bytes);

As you are refactoring this a bit, reading the function isn't straightforward
without applying the series locally.

It looks like you're filling the entire txrx_buf with 0xff.

While that will work for sure, for the sake of performance you should change this
to memset(0xff) only the portions of buffer that the next memcpy call will not
overwrite, avoiding to effectively write twice to that buffer.

Is there any reason why you didn't do just that?

...also because, your commit message really looks like saying what I'm proposing
to do here.

Cheers,
Angelo

>   	memcpy(txrx_buf + offs, buf, len);
>   
>   	err = airoha_snand_set_mode(as_ctrl, SPI_MODE_DMA);



