Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D10C5DF80
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 08:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WBhVPa7Em4e5H/GpqI2kk5BMFpsOBV262URRmPCJ4oc=; b=WGswctZoEsuamLOqymXVdMo018
	U4VW8KKxDBCEtQGrj9IMolQDuXFGKEy/l+Nk9QIzv3e8lsnWFcCP9N3c2JlJdCkmlkBqwNUO0uREr
	iAYTKiPWHOV7LypiiCcL7bk7jwZND2EZak3fuHU/0JpBx/iPkPBYouDbHoZqOGbcggcb+AiHTDXhA
	8oWV7fOHKet28ywsvaJDjfeeZh5L6WCqhtJAxE7c5F3qyv2JiyGmYHnuGtGvNmlaOc+1GLwQZm9LJ
	y8InfjIrXr4Ip5LexsJjvqkmv8fs0L3DLA/Mxcl1V+uvjIIxebiKnJrZNQdyC1C4LVp+F7NWBHy4K
	xXTkAPUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwFFA-00000007Wsx-3Gnm;
	Tue, 18 Aug 2026 08:32:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwFFA-00000007Wso-0uSS;
	Tue, 18 Aug 2026 08:32:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DB87840494;
	Tue, 18 Aug 2026 08:32:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF9131F000E9;
	Tue, 18 Aug 2026 08:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787041943;
	bh=WBhVPa7Em4e5H/GpqI2kk5BMFpsOBV262URRmPCJ4oc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y2Lt/Um3F8jMLR1Nyj93w2lOgX3xKsNywnI+r11g89E7ut0cRr+BowtxC7rxE9fke
	 K+AS99si2ruEgdih+ML6ID51Ir71OrOoPbSYJqmKoVvMvhcp3wO9FjnA58VIz358e7
	 PT3CurqU4gbCHEW7Hf8LbTj5ujlmW6LWJ/whgqUMvTIaZzhKu/PoYP0siy97DMDKel
	 Wxybod8OGM0M/srMVy80b3l6SHC8fjIN9KwdZgHjOphcxBxfbgIJJxcxAHDzcQEu1g
	 YEp0D7GPTnIR1GrBq5trsyr/EBiQLLK9w77tuIs6psbvmE5o9ZNUIxlkA8VQCSz7my
	 D3K5TteMabNYA==
Received: from johan by xi.lan with local (Exim 4.99.4)
	(envelope-from <johan@kernel.org>)
	id 1wwFF7-00000000nSF-2mWv;
	Tue, 18 Aug 2026 10:32:21 +0200
Date: Tue, 18 Aug 2026 10:32:21 +0200
From: Johan Hovold <johan@kernel.org>
To: Guangshuo Li <lgs201920130244@gmail.com>
Cc: Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>, linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] Bluetooth: btmtksdio: fix usage_count leak when
 autosuspend_delay is negative
Message-ID: <aoQYld5vlDa4hChP@hovoldconsulting.com>
References: <20260807151447.2530075-1-lgs201920130244@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260807151447.2530075-1-lgs201920130244@gmail.com>
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

On Fri, Aug 07, 2026 at 11:14:47PM +0800, Guangshuo Li wrote:
> btmtksdio_setup() calls pm_runtime_use_autosuspend() when runtime PM
> is supported, but btmtksdio_remove() does not call the matching
> pm_runtime_dont_use_autosuspend() when removing the device.
> 
> If the autosuspend delay is set to a negative value while autosuspend
> is enabled, the runtime PM core increments usage_count to prevent
> runtime suspend. Without calling pm_runtime_dont_use_autosuspend()
> during driver teardown, this reference is not dropped and usage_count
> remains unbalanced.

I noticed the bluetooth ones have already been picked up, but for the
record:

As I've explained elsewhere, this is just misleading. There is no usage
count leak here as the count is balanced whenever the user re-enables
autosuspend through sysfs (by writing a non-negative timeout).

Drivers should clean up after themselves and disable autosuspend, but
this is more of a clean up than a fix and should not be backported.

You've sent upwards of 60 of these in the matter of a just a few days,
some which have even been picked up. Please send follow-ups (replies or
v2s) as soon as possible to prevent further of these from getting
merged.

> Add the missing pm_runtime_dont_use_autosuspend() call in the remove
> path before restoring the runtime PM usage reference.
> 
> This issue was found by manual code inspection.
> 
> Fixes: 7f3c563c575e ("Bluetooth: btmtksdio: Add runtime PM support to SDIO based Bluetooth")
> Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
> ---
>  drivers/bluetooth/btmtksdio.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/bluetooth/btmtksdio.c b/drivers/bluetooth/btmtksdio.c
> index c6f80c419e90..4e1012e90979 100644
> --- a/drivers/bluetooth/btmtksdio.c
> +++ b/drivers/bluetooth/btmtksdio.c
> @@ -1480,6 +1480,9 @@ static void btmtksdio_remove(struct sdio_func *func)
>  	if (test_bit(BTMTKSDIO_FUNC_ENABLED, &bdev->tx_state))
>  		btmtksdio_close(hdev);
>  
> +	if (bdev->data->pm_runtime_supported)
> +		pm_runtime_dont_use_autosuspend(bdev->dev);
> +
>  	/* Be consistent the state in btmtksdio_probe */
>  	pm_runtime_get_noresume(bdev->dev);

Johan

