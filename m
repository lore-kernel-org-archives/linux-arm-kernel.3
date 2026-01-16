Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0601CC982CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 15:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=helqByT45xgygaR3omsf6cACAEULnpjlMgPw8Kgw2w8=; b=xgJcBNEOjAKy7O7QDGC+1aQp3n
	77HRS7sKkwQZQzjqLxO9wFnpkUMo1XNiGbql+NDw7Vt9ubfk0gGya1tDG82B+at7kDi9Oij0R1iJG
	ClfK9CpcKbD8D9PZzPSkxcWrQSHMI7pov2mjNFty4MpfK4amozXiE5KU4In5J9uGxFnTGF/4JwDA7
	BHkCWDh4wbdeaWvbpKqG2nYAl2/Ym8gzdBBYwg7cCQafNI6/XT6E4273XG3vhxjGrXeMTOvom2Mt5
	TVITDW/4U9AVmr/GHN8fGYWqC+Kh14r5CBLp0ZnNU9i3zAqMJZp5WkYbOvGCqCfnEf3lScaL6C82y
	4WOgNLzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglc4-0000000ELdX-1k9Q;
	Fri, 16 Jan 2026 15:19:48 +0000
Received: from mail-m49205.qiye.163.com ([45.254.49.205])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vglc0-0000000ELbx-3b8K;
	Fri, 16 Jan 2026 15:19:46 +0000
Received: from [172.16.12.14] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 30f051665;
	Fri, 16 Jan 2026 23:19:41 +0800 (GMT+08:00)
Message-ID: <f8658bd7-7381-4770-935a-6a98ea3f652f@rock-chips.com>
Date: Fri, 16 Jan 2026 23:19:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: shawn.lin@rock-chips.com, Aishwarya TCV <Aishwarya.TCV@arm.com>,
 linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH] spi: rockchip: Use plain request_irq()
To: Mark Brown <broonie@kernel.org>
References: <20260116-spi-rockchip-threaded-irq-v1-1-c45c3a5a38b1@kernel.org>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20260116-spi-rockchip-threaded-irq-v1-1-c45c3a5a38b1@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9bc7640d8b09cckunm99e7e01e73ca7b
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh5IHlYfHk5CTh9IGUtIT0JWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSEpKQk
	xVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=fPjN5OZCavPa5KsaxCi1vx8vv+g3J2/G9w0fEZyu6dOd99f9I9VcpNlDee8dg8PNLWkH+DJavKruVTCaPEmINwS4T0F3XXi6wmPgMpwrb/vp0IIov8vB9i8df13d8CY7n8eaVGojSgFKtfwPp7v9vZbUcNdQv+LdgStyvuIiYkc=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=helqByT45xgygaR3omsf6cACAEULnpjlMgPw8Kgw2w8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_071945_426644_81E2D57D 
X-CRM114-Status: GOOD (  19.82  )
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

在 2026/01/16 星期五 21:23, Mark Brown 写道:
> The Rockchip driver has since interrupt support was added used
> request_threaded_irq() but not actually supplied a threaded handler,
> handling everything in the primary handler.  This is equivalent to just
> using a plain request_irq(), and since aef30c8d569c (genirq: Warn about
> using IRQF_ONESHOT without a threaded handler) the current behaviour has
> triggered a WARN_ON().  Convert to use request_irq().
> 

Is it preferred to use threaded version if latency is not a critical
concern ? I guess the original intention was to use

ret = devm_request_threaded_irq(&pdev->dev, ret, NULL, rockchip_spi_isr,
IRQF_ONESHOT, dev_name(&pdev->dev), ctlr); ?


> Reported-by: Aishwarya TCV <Aishwarya.TCV@arm.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> ---
>   drivers/spi/spi-rockchip.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/spi/spi-rockchip.c b/drivers/spi/spi-rockchip.c
> index 1a6381de6f33..62e1bc08c940 100644
> --- a/drivers/spi/spi-rockchip.c
> +++ b/drivers/spi/spi-rockchip.c
> @@ -805,8 +805,8 @@ static int rockchip_spi_probe(struct platform_device *pdev)
>   	if (ret < 0)
>   		goto err_put_ctlr;
>   
> -	ret = devm_request_threaded_irq(&pdev->dev, ret, rockchip_spi_isr, NULL,
> -					IRQF_ONESHOT, dev_name(&pdev->dev), ctlr);
> +	ret = devm_request_irq(&pdev->dev, ret, rockchip_spi_isr, 0,
> +			       dev_name(&pdev->dev), ctlr);
>   	if (ret)
>   		goto err_put_ctlr;
>   
> 
> ---
> base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
> change-id: 20260115-spi-rockchip-threaded-irq-b1641d0d3919
> 
> Best regards,
> --
> Mark Brown <broonie@kernel.org>
> 
> 
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
> 


