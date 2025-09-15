Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F17ACAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 13:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V58NCYvXX7hCGMS2LJLAazQt4Q9lkaf6RK8gM694Bj8=; b=WVuyhbDlnxC4gSr9N/kWQsAkSD
	RpYgQjFHzT5NsAbM9wXXoAcDD+y08H+1enLShrqrPQgcZylCN6kK8QYksCFGTVnY3tB67eiSSaSGX
	OeCzhRR+OJW4PqvfFLIjN2ChkOK0okf2pRDSyZnRmJmQPBT/VXKClw1McD0KoAjHeohfYoUYy4V0n
	IcYTrX+mIKiPpZf/KJoGPPMKgANIjV0QwXOcolLKtSXqpo3Ora2vkh0X+ERhiuRkv0auh3SlwjqU0
	56eB6wlxHUWva96/AQG3jiS9ibNxsUIE3RgFUu5gQa3SrV4mpMp2odmPZOB7bsyPO+QNA66XrsI1x
	go8H4JyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9SW-00000004OYf-0wRw;
	Mon, 15 Sep 2025 13:41:32 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9ST-00000004OWe-194S;
	Mon, 15 Sep 2025 13:41:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1757943687;
	bh=yxThJFjgk/onijRWZOMaM2BSfI+4eRYM4Vqmsvjq89Y=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=YegZ2WtTwpGRE9vdewFKrn9fAnxENJApcYtpeJVlPUKl48EHfTejKzGcoy7IfKHSq
	 gSqdusiaSUTXqrKFZjqLYqggi3vjuHiFSLI7HzuGfU5MvG+wXVN/3rLs7rGAhBQPoF
	 EZw9Au7i5ZUsvh7S858i1ZUe6Vhj7EH8t6mlWNTVDhb0uL8zqwHu0bNWgCfGn0buX8
	 xqy4XeBN5e6SPq6+ox7nx1pZCqb2vYg622Gx56IfQWSgdMqY12GEvlCKegyiQ1xqrU
	 bs+UjakxTT/R1i76wEOet47SBBbtPicuhrxmwoFBXN7w29vPImDzBeHe/drIpnmo9Y
	 7lJKke7oypQTQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7FB0317E107A;
	Mon, 15 Sep 2025 15:41:26 +0200 (CEST)
Message-ID: <bf054186-17fb-4ea4-9d07-488b6792a437@collabora.com>
Date: Mon, 15 Sep 2025 15:41:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] tty: serial: 8250_mtk: enable baud clock
To: Daniel Golle <daniel@makrotopia.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>, Yu Jiaoliang <yujiaoliang@vivo.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Changqi Hu <changqi.hu@mediatek.com>, Sam Shih <sam.shih@mediatek.com>,
 Steven Liu <steven.liu@mediatek.com>, John Crispin <john@phrozen.org>,
 linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <2de07b0a6d51d5d3bf3e55cd03cf75adfc91ee7d.1757941345.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <2de07b0a6d51d5d3bf3e55cd03cf75adfc91ee7d.1757941345.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_064129_487090_2BFFDCB0 
X-CRM114-Status: GOOD (  18.19  )
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

Il 15/09/25 15:06, Daniel Golle ha scritto:
> Some MediaTek SoCs got a gated UART baud clock, which currently gets
> disabled as the clk subsystem believes it would be unused. This results in
> the uart freezing right after "clk: Disabling unused clocks" on those
> platforms.
> 
> To fix this request the baud clock to be prepared and enabled during probe.
> 
> Fixes: e32a83c70cf9 ("serial: 8250-mtk: modify mtk uart power and clock management")
> Suggested-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Thanks for caring about power management. However, this and the addition in PM ops
should be a single commit. It's even using the same Fixes tag...! :-)

I've read both of the commits in this series and the code LGTM.


tty: serial: 8250_mtk: Enable baud clock and manage in runtime PM

Please, squash the two commits, after which...

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Cheers,
Angelo

> ---
> v2: no changes
> 
>   drivers/tty/serial/8250/8250_mtk.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/tty/serial/8250/8250_mtk.c b/drivers/tty/serial/8250/8250_mtk.c
> index b44de2ed7413..9329ed1f759d 100644
> --- a/drivers/tty/serial/8250/8250_mtk.c
> +++ b/drivers/tty/serial/8250/8250_mtk.c
> @@ -475,13 +475,13 @@ static int mtk8250_probe_of(struct platform_device *pdev, struct uart_port *p,
>   	int dmacnt;
>   #endif
>   
> -	data->uart_clk = devm_clk_get(&pdev->dev, "baud");
> +	data->uart_clk = devm_clk_get_enabled(&pdev->dev, "baud");
>   	if (IS_ERR(data->uart_clk)) {
>   		/*
>   		 * For compatibility with older device trees try unnamed
>   		 * clk when no baud clk can be found.
>   		 */
> -		data->uart_clk = devm_clk_get(&pdev->dev, NULL);
> +		data->uart_clk = devm_clk_get_enabled(&pdev->dev, NULL);
>   		if (IS_ERR(data->uart_clk)) {
>   			dev_warn(&pdev->dev, "Can't get uart clock\n");
>   			return PTR_ERR(data->uart_clk);




