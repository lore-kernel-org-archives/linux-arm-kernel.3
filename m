Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFC6E83EE8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 08:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AWgmNjGWwQV13D+38ejosrAo31ABQAS2uwlNqDmUuqU=; b=X2IkgJsG4JkeaMx5zN4xu9DiJO
	Lhv8o36lX0NyWQ3XeZlogzZOuepUL9dFzwybUoVXZs7h9Oaa/bjQewsljPowGFRyHsGT30jYjrChk
	2SPTa+Xp5wpbjjVfEJK9ftc2XhJW4SFiOprkZMRoSE/zUncKXhpEMiY1u3DO3rDEX10DCj15bU9U9
	DsWfS04ZS5/PK+dHZGgNWDed+gnzhfdzlcGnNDO4lkAlz9kjSKEnc255OpMNY5snOpp5AHjNlLB8z
	SSmfEegJiNzBFOraMI6Qjm1xQ6+lot9NmLvWZ2GSQ3fP/ZNqEzFy6C8WPtHDI8NYEgW/MQF8+NBTR
	fkj557Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnXqE-0000000853c-0qgv;
	Wed, 04 Feb 2026 08:02:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnXqD-0000000853W-0oqS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 08:02:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4B832600C3;
	Wed,  4 Feb 2026 08:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51BD3C4CEF7;
	Wed,  4 Feb 2026 08:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770192144;
	bh=nRrC8wphQ1dc/BfGnKr7IWUN3Ln6veciQrvR7VK7Ook=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A0kyECe9zWPpUVDyRYGYpTfDn14yi64ekYqYmxZee7Riz1wWcOOBoyPnRXZ/6ekBA
	 sNc4VzDWLWlT3A1k4Aw7mJiZMUwHw6oEFSFZTHE8ryyOt1dKipxppN9S9TzScTMZqi
	 yze/jCixMgyabO3dGH4wr/ZeYI61T2M+PEjxmVLQk1Bg0RECk6vblAGzsX18Yng2ob
	 5yOu8Okf4u/0a8LiJkoxtZC2lmEWnBz0drbjEYOmqH0BUU0+4bUkpHUhUarROd17Zz
	 KietqbYBSlFdrKRu4vE42l9J4uOkfT6geC68q+juJN2jBUWJZw2VD6NS6al3zQRYHC
	 7X8/lbcymdzJA==
Date: Wed, 4 Feb 2026 09:02:19 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Felix Gu <ustc.gu@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Maxime Ripard <mripard@kernel.org>, Wolfram Sang <wsa@kernel.org>, 
	Boris Brezillon <bbrezillon@kernel.org>, Arnd Bergmann <arnd@arndb.de>, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: sun6i-p2wi: Fix device node reference leak in
 p2wi_probe()
Message-ID: <aYL2OAdZTV78Vsy0@zenone.zhora.eu>
References: <20260201-p2wi-v1-1-e0ec9cda82b3@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260201-p2wi-v1-1-e0ec9cda82b3@gmail.com>
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

Hi Felix,

On Sun, Feb 01, 2026 at 02:29:00AM +0800, Felix Gu wrote:
> Use the __free(device_node) scoped variable to automatically release
> the device node reference, preventing a device node reference leak.
> 
> Fixes: 3e833490fae5 ("i2c: sunxi: add P2WI (Push/Pull 2 Wire Interface) controller support")
> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
> ---
>  drivers/i2c/busses/i2c-sun6i-p2wi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
> index fb5280b8cf7f..652b37b57159 100644
> --- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
> +++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
> @@ -184,7 +184,6 @@ static int p2wi_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct device_node *np = dev->of_node;
> -	struct device_node *childnp;
>  	unsigned long parent_clk_freq;
>  	u32 clk_freq = I2C_MAX_STANDARD_MODE_FREQ;
>  	struct p2wi *p2wi;
> @@ -223,7 +222,8 @@ static int p2wi_probe(struct platform_device *pdev)
>  	 * In this case the target_addr is set to -1 and won't be checked when
>  	 * launching a P2WI transfer.
>  	 */
> -	childnp = of_get_next_available_child(np, NULL);
> +	struct device_node *childnp __free(device_node) =
> +		of_get_next_available_child(np, NULL);

A few spontaneous questions here:

- Why are you moving the declaration of childnp in the middle of
  the function?

- Have you run checkpatch.pl before sending the patch?

- Is of_get_next_available_child() allocating the device_node?

- Have you tested the patch?

Thanks,
Andi

>  	if (childnp) {
>  		ret = of_property_read_u32(childnp, "reg", &target_addr);
>  		if (ret) {
> 
> ---
> base-commit: 33a647c659ffa5bdb94abc345c8c86768ff96215
> change-id: 20260201-p2wi-a199cdfe69e0
> 
> Best regards,
> -- 
> Felix Gu <ustc.gu@gmail.com>
> 

