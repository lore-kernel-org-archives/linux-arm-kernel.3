Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D075ECA5FE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 23:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Cc:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xBCCK4YiYlil7mdtloinVQAo6Jd0Tmjjp4MJCr/7Cqo=; b=nYUng2ooTXsSHIgTBh+qp5rDFH
	21qIlvyDNuCM8qYp+jsGyld6XSCLrKGsnTwHxonl+93hrjOGJqIsDiBumIlBna1iurfX7ZnrpRKqp
	OVTNGw+fHWS6cIVK8bD/24GyPneMBbv6EkdBZGkCYPbXQ00bcZZZIGQpaJv0w69GdYVQ4fnnAc3kk
	/Ma85D3kd0l6AQOk8SjdS790xWRoPCF3Fyt2e2q7zHU5IUGZP1ujXfFuJ2AFP8aJHQaF+e3SYrg4+
	CgwjidI0VCxKjlufRs2eUEop1BB7c5f3K1ZHwBEY4aEA/d3E1Bsqx3Fg07RCVLKgPS4pgGpnbBV8W
	an4r1kwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhG1g-0000000GEyz-1bbS;
	Sat, 17 Jan 2026 23:48:16 +0000
Received: from mx3.molgen.mpg.de ([141.14.17.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhG1d-0000000GEwV-1QXj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 23:48:15 +0000
Received: from [10.0.57.151] (unknown [62.214.191.67])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 30E864C4430066;
	Sun, 18 Jan 2026 00:47:01 +0100 (CET)
Message-ID: <ccb6b5b3-84cd-4197-a770-7e626c1ddcf3@molgen.mpg.de>
Date: Sun, 18 Jan 2026 00:46:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] spi: spi-mem: Protect dirmap_create() with
 spi_mem_access_start/end
To: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
References: <20260117134216.595436-1-chin-ting_kuo@aspeedtech.com>
 <20260117134216.595436-2-chin-ting_kuo@aspeedtech.com>
Content-Language: en-US
Cc: clg@kaod.org, broonie@kernel.org, boris.brezillon@bootlin.com,
 joel@jms.id.au, andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
 openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 BMC-SW@aspeedtech.com
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <20260117134216.595436-2-chin-ting_kuo@aspeedtech.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260117_154813_544287_619C0140 
X-CRM114-Status: GOOD (  14.86  )
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

Dear Chin-Ting,


Thank you for your patch.

Am 17.01.26 um 14:42 schrieb Chin-Ting Kuo:
> spi_mem_dirmap_create() may reconfigure controller-wide settings,
> which can interfere with concurrent transfers to other devices
> sharing the same SPI controller but using different chip selects.
> 
> Wrap the ->dirmap_create() callback with spi_mem_access_start() and
> spi_mem_access_end() to serialize access and prevent cross-CS
> interference during dirmap creation.

Do you have a reproducer for this issue to test your patch? If yes, it’d 
be great, if you documented it.

> Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
> ---
>   drivers/spi/spi-mem.c | 11 ++++++++++-
>   1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spi/spi-mem.c b/drivers/spi/spi-mem.c
> index c8b2add2640e..85702a77b3c8 100644
> --- a/drivers/spi/spi-mem.c
> +++ b/drivers/spi/spi-mem.c
> @@ -708,9 +708,18 @@ spi_mem_dirmap_create(struct spi_mem *mem,
>   
>   	desc->mem = mem;
>   	desc->info = *info;
> -	if (ctlr->mem_ops && ctlr->mem_ops->dirmap_create)
> +	if (ctlr->mem_ops && ctlr->mem_ops->dirmap_create) {
> +		ret = spi_mem_access_start(mem);
> +		if (ret) {
> +			kfree(desc);
> +			return ERR_PTR(ret);
> +		}
> +
>   		ret = ctlr->mem_ops->dirmap_create(desc);
>   
> +		spi_mem_access_end(mem);
> +	}
> +
>   	if (ret) {
>   		desc->nodirmap = true;
>   		if (!spi_mem_supports_op(desc->mem, &desc->info.op_tmpl))

Reviewed-by: Paul Menzel <pmenzel@molgen.mpg.de>


Kind regards,

Paul

