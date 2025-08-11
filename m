Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61CBC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 06:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1wWIaC+COZnTTlE9HZpbQlqHUg8rhYPP0zCCbEf4L0c=; b=fclyZFkOznlAEpGjU+3xn5vtpt
	MtzuZ22k+Wskcr+lK+/2QSaAfexMXwdkH1xL8nz8qPuyycK7igeF5gR8pI+Op982TskV7z9XAI7Fb
	k243pbVUwHjgMSSHXD/OKSo2K02wkOXUj49N5XGr1tmRYLmMML1t6Z6alZrhpPX0l1ncNOgAnRtyB
	aRPiaEN30cXIEpQyybVVgGLXQWCQr5kERb0m+AW43Naq4nUbBiOHhq82wLw0fnygyRFc4PmkFnbGo
	17HvnoBbgMhj2lMeM+Rfjv5wsnsfVU3d7SXDJaZfyDLw41QEaX3cpVqIKfqlek9ZwJipQB2VmVSMH
	8la9LW8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulLp0-00000006aUF-32eJ;
	Mon, 11 Aug 2025 06:15:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulLmP-00000006aE9-06mh;
	Mon, 11 Aug 2025 06:13:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 34E92454B3;
	Mon, 11 Aug 2025 06:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2804DC4CEED;
	Mon, 11 Aug 2025 06:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754892788;
	bh=y5gFofC4QUclprRrC5gwH9xbLOd7/g1RieFQkQ65L3k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NVYRj0qQJieC5vk1H8c6l+sHRdpaXBz6F9qFd8owxaqMocLlH76po2dzWafdVTIK4
	 bmItLFMtpUAm4BpmlV9ukgK/56q2wbl9rkwpXCBYTAOMNGvJEybI7HOzkMBdHSBBao
	 ho2eOCtqHbltz/ZEbOcirTu5v/f082wNasFPtMhLiNcD2j9b7qPhdO2uywKdLLXIas
	 LFvnof4aoPhJlR1t71ULZkZNR501D/iLRq7I6XguMl/NPCeREZyM4UgjGXMcjIPd9w
	 SfQ1nnqFwqmcWn2cnbnXiRvCbqS91llVgBAF0s6U7hMjSIfx4MUUb0itrxNzDG38kq
	 eNbgyeW0rkB1A==
Message-ID: <9fbc63d4-a12b-420e-8c99-f2f5fca5a9eb@kernel.org>
Date: Mon, 11 Aug 2025 08:13:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 05/12] media: rkvdec: Add per variant configuration
To: Detlev Casanova <detlev.casanova@collabora.com>,
 linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
References: <20250808200340.156393-1-detlev.casanova@collabora.com>
 <20250808200340.156393-6-detlev.casanova@collabora.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250808200340.156393-6-detlev.casanova@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250810_231309_113979_6DDC9CE8 
X-CRM114-Status: GOOD (  15.76  )
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

On 08/08/2025 22:03, Detlev Casanova wrote:
> This is to prepare for adding different variants of the decoder and

Prepare for...

> support specific formats and ops.
> 
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---


...


>  static int rkvdec_init_ctrls(struct rkvdec_ctx *ctx)
>  {
> +	struct rkvdec_config *cfg = ctx->dev->config;
>  	unsigned int i, nctrls = 0;
>  	int ret;
>  
> -	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++)
> -		nctrls += rkvdec_coded_fmts[i].ctrls->num_ctrls;
> +	for (i = 0; i < cfg->coded_fmts_num; i++)
> +		nctrls += cfg->coded_fmts[i].ctrls->num_ctrls;
>  
>  	v4l2_ctrl_handler_init(&ctx->ctrl_hdl, nctrls);
>  
> -	for (i = 0; i < ARRAY_SIZE(rkvdec_coded_fmts); i++) {
> -		ret = rkvdec_add_ctrls(ctx, rkvdec_coded_fmts[i].ctrls);
> +	for (i = 0; i < cfg->coded_fmts_num; i++) {
> +		ret = rkvdec_add_ctrls(ctx, cfg->coded_fmts[i].ctrls);
>  		if (ret)
>  			goto err_free_handler;
>  	}
> @@ -1119,8 +1127,13 @@ static void rkvdec_watchdog_func(struct work_struct *work)
>  	}
>  }
>  
> +const struct rkvdec_config config_rkvdec = {

Why isn't this static?

> +	.coded_fmts = (struct rkvdec_coded_fmt_desc *)rkvdec_coded_fmts,
> +	.coded_fmts_num = ARRAY_SIZE(rkvdec_coded_fmts),
> +};
> +
>  static const struct of_device_id of_rkvdec_match[] = {
> -	{ .compatible = "rockchip,rk3399-vdec" },
> +	{ .compatible = "rockchip,rk3399-vdec", .data = &config_rkvdec },
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, of_rkvdec_match);
> @@ -1144,6 +1157,9 @@ static int rkvdec_probe(struct platform_device *pdev)
>  	mutex_init(&rkvdec->vdev_lock);
>  	INIT_DELAYED_WORK(&rkvdec->watchdog_work, rkvdec_watchdog_func);
>  
> +	rkvdec->config =
> +		(struct rkvdec_config *)of_device_get_match_data(rkvdec->dev);

If you need a cast, your code is wrong.


Best regards,
Krzysztof

