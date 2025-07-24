Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8B5C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 07:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HuSxSBGWYzg8ppmBBZ57GZxUD2NpVmKocyw7538elEk=; b=FKd6Vnn0/su9QYP8bMuNvOiqTN
	fNsMHWL2raT7wwA81USDupx2pcmnbF4NAstJ9vvIMIuxf8jUfd/VUEN2yp+JIWxozqER+eQQY1uYd
	m7XWQ72TQZRyle2Lfd4p1I09+tYAwhW1U5ttYMxeAQC0GHROxyPgQJV/uwhAgVJrDOAV4xemxdaTO
	7VOiTHZTJqQ2co+fkTJSVEJ2Ubuzw+bwFfOYOKme7BC5A2lditHLAh1pBH3mPNF5ZBeKYQ9U64rmd
	Jjvc8GnoV3YDZO0FRuIVSBkTpolMaq6n/rkU6pfpPAuZEYQhonAs2j8eLbSJxih573Xhxm43Pt9jI
	m8NJEW6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueqoj-00000006lbF-3ETh;
	Thu, 24 Jul 2025 07:56:41 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueqOH-00000006hpL-01bN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 07:29:23 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B6345442A5;
	Thu, 24 Jul 2025 07:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753342156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=HuSxSBGWYzg8ppmBBZ57GZxUD2NpVmKocyw7538elEk=;
	b=HZk7I5dom0NaZoXNr7ZUaqCxtTPCZ9rz0oAw0TPqYZch3Bberm1JrviipRsaYO21Rp2/tj
	Lx/nw65YKNim+MQMGp0GMWNSo61TbL8Q/zQIvl/v3pRAqrA3q1fcOefiLZgiW691X8+G6B
	ughoeNwQHn9YeB86iUa70KScN23mmKSPuflIZfEearVnbhBqPaa96nIOgGlc0rOawf4kdb
	ZNonISBCN/9qZUZTNykQMimw7GdCPN0IGGLjtUspiZg36Uf5qS/izBTMEL3mTB2ExZBSP0
	gPcIp4yhDNdL1+6sbK6f9M9kAsxAxIPSEsH0P34HuZm3gfIyyztCTa3eIoPIOA==
Date: Thu, 24 Jul 2025 09:29:14 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Salah Triki <salah.triki@gmail.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Helge Deller <deller@gmx.de>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] fbdev: atmel_lcdfb: Fix potential NULL dereference
Message-ID: <2025072407291424126a1b@mail.local>
References: <aIGg7erPjz1qJQ1F@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aIGg7erPjz1qJQ1F@pc>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdektddthecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomheptehlvgigrghnughrvgcuuegvlhhlohhnihcuoegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeegieduueethefhkeegjeevfefhiedujeeuhffgleejgfejgeekueejuefgheeggfenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegvtdgrmegsieehmegsvdhftdemkegsleekmeejledtheemrggsvgelmeduhedvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemvgdtrgemsgeiheemsgdvfhdtmeeksgelkeemjeeltdehmegrsggvleemudehvddvpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpegrlhgvgigrnhgurhgvrdgsvghllhhonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeekpdhrtghpthhtohepshgrlhgrhhdrthhrihhkihesghhmrghilhdrtghomhdprhgtphhtthhopehnihgtohhlrghsrdhfvghrrhgvsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepu
 ggvlhhlvghrsehgmhigrdguvgdprhgtphhtthhopegtlhgruhguihhurdgsvgiinhgvrgesthhugihonhdruggvvhdprhgtphhtthhopehlihhnuhigqdhfsgguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_002921_833176_FC94AC49 
X-CRM114-Status: GOOD (  18.57  )
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

On 24/07/2025 03:56:45+0100, Salah Triki wrote:
> of_match_device() returns NULL in case of failure, so check its return
> value before casting and accessing to data field in order to prevent NULL
> dereference.
> 
> Signed-off-by: Salah Triki <salah.triki@gmail.com>
> ---
>  drivers/video/fbdev/atmel_lcdfb.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atmel_lcdfb.c
> index 9dfbc5310210..b1017ac9c73b 100644
> --- a/drivers/video/fbdev/atmel_lcdfb.c
> +++ b/drivers/video/fbdev/atmel_lcdfb.c
> @@ -922,6 +922,7 @@ static int atmel_lcdfb_of_init(struct atmel_lcdfb_info *sinfo)
>  	struct device *dev = &sinfo->pdev->dev;
>  	struct device_node *np =dev->of_node;
>  	struct device_node *display_np;
> +	const struct of_device_id *match;
>  	struct atmel_lcdfb_power_ctrl_gpio *og;
>  	bool is_gpio_power = false;
>  	struct fb_videomode fb_vm;
> @@ -930,8 +931,11 @@ static int atmel_lcdfb_of_init(struct atmel_lcdfb_info *sinfo)
>  	int ret;
>  	int i;
>  
> -	sinfo->config = (struct atmel_lcdfb_config*)
> -		of_match_device(atmel_lcdfb_dt_ids, dev)->data;
> +	match = of_match_device(atmel_lcdfb_dt_ids, dev);
> +	if (!match)
> +		return -ENODEV;

This is dead code, it will never happen because atmel_lcdfb_of_init is only
called from atmel_lcdfb_probe which will only be called when there is a match.

> +
> +	sinfo->config = (struct atmel_lcdfb_config *)match->data;
>  
>  	display_np = of_parse_phandle(np, "display", 0);
>  	if (!display_np) {
> -- 
> 2.43.0
> 

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

