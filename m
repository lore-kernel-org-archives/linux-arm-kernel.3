Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33491CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 21:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wBQkNjECV6xY2iyUaF8p4ty+DWlCLVOGQLFUXgO2Ou4=; b=gCobV4OrjwdDQECFyAbeoOk0Z7
	Q72imnbiqGVNMGJ4KD82OKoqTZLL0z2U91gOjOsicWKbJpsKhQCvS+ttlhP8dGfMEiPJToer9KOpJ
	BqJB1gQu/ou51PQBUToj/IjNy6sIC0DkZ/UgX7ljylxnbdEwinlhuK4mBFhp7xQbYWanzwBB4xSb4
	oOCCVHwdx3dFGK2PXUUkDFVZaqAzo/TP3KV4rVxY7KXDOcNONR2xeDbz7Q6uhbCOK30LAlmk/mEX+
	c8PTtDW6sjqz/tFhtBuElnTXQfZB8bqj0g/2nKGn1B9I6INnN/+e9nZw3Jk6LcGhYghgvRJY7uAsI
	oJv8HtpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waJwl-00000001ng3-1L1S;
	Thu, 18 Jun 2026 21:06:47 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waJwg-00000001nfU-1bvS;
	Thu, 18 Jun 2026 21:06:45 +0000
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ghCvZ32Jhz9tjF;
	Thu, 18 Jun 2026 23:06:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=adamthiede.com;
	s=MBO0001; t=1781816794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=wBQkNjECV6xY2iyUaF8p4ty+DWlCLVOGQLFUXgO2Ou4=;
	b=1o2eMq7CpiT82lLfa/EJ2bHxFGd9w1DrgDAhipxOxOToKoH5b6R6Exfos4jx3OiiFM7szl
	O3pXAeC2FF7dMTnguh/ngM8RXbAnRCu3X+fjoAP977qNzCafGtvBJvs8YcTt118kkTHnMB
	uUilaRaKfr5LQ/fIxRUh5mqtsig91nSnsvQa0rNx43GWR3HVa7vVmScKZYZ/3qljYRhSU9
	4tY78sF1ojmAjfASV+j0xcVW8E9vB/XcYWckCHHPON9vK4V+t40RvtxZskPNO2l4DdoI+7
	hNpS0611k6APoQGAALNp0qSH/OILLRjqJlanB1Wlr7d/i3lb64ZCDWC4VIbhhA==
Message-ID: <42607fa4-485d-4142-b31c-7bfac71118d2@adamthiede.com>
Date: Thu, 18 Jun 2026 16:06:28 -0500
MIME-Version: 1.0
Subject: Re: [PATCH] drm/mediatek: mtk_dsi: enable hs clock during pre-enable
To: Gary Bisson <bisson.gary@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
Content-Language: en-US
From: Adam Thiede <me@adamthiede.com>
Autocrypt: addr=me@adamthiede.com; keydata=
 xsBNBF+n+90BCAC2ZRLVcvdXDgfY7EppN05eNor3U7/eeiNCCEIWZkYLhikUEP1ReLGBkXpK
 Pc70hfnKAKkCoth3IwhDty9WXMNU+iLNei4ieb2luW+UqluR6xIUIA+txahMU9YcjVaQTKf/
 yZWO4yl6pfBPCxC2UdPZKBAdGoi5NnE0ABFNbhBETQhhBic533lZn33ByupfI3acECnQdjgQ
 llCUpDbw4I+S/N1iFiEHcbMXH7ZB00e3IYNorZ1E9v7p++5rDY1fQ9gXpieg1vFKwSq1NJWo
 9xx336YjaTUbX0EwrdKd9l8AktA3yRjckaK5TAcwSQaDtHvhpbl4ebvPhtwHh699MroXABEB
 AAHNH0FkYW0gVGhpZWRlIDxtZUBhZGFtdGhpZWRlLmNvbT7CwI4EEwEIADgCGwMFCwkIBwIG
 FQoJCAsCBBYCAwECHgECF4AWIQQtG9pGQ7sz3tf8M/kC7fV9o/vRzgUCZL1HxQAKCRAC7fV9
 o/vRzgyRB/wLqRCvvWhQCMgvzeKvru9wcXquhb77K8H/ByLbfiT8YBuP3lZFVh0IQhgO9Ylk
 fIoOJE4V+jjxyOnO2d9xjGbvAmmR6yT0gfLzSVWqrC4k+V9MWLv43nrNzxt41dvo5j824FAl
 X+zaiRZCdO8Jtxg5Elpiop2SKLi1utX1Z8i6YZh+ccJZlchUBAGUTk+D4UjK7vUcjLWT96ya
 CtdtTfXyw36CvGOPEWfc6++Kkl/5sgej1i7biPYzu/r0vssaQYTXKSrv6Cfa3Maa89ASiTtv
 q4qmhLnJeCrPxWlRAf6LEizeBEkOasYni2u8sp4wBezEq45Ozu45sfPkqLpPolG7zsBNBF+n
 +90BCADBRt+vrToRBEG580n77S99qSEkbKD+oJtCVyovnjMNkg0K9UG68LIeCX/ezngiV1M8
 JISvw5iFOuUFqGX/1hLl9wgt/YpuIrgWOp8XxkotavTCloLDvQmufJPO1L8bnnA+WgP2YgVZ
 5MJTj/t4DI+yQgysEjsH8aurHO2uuqgJE+xK+2dy6Cl/wskuGxObksSPmmFH5PH0Joziwrtl
 61ouLE2XwKbkMgIGEKkbFgbfwz3/QuLZGBni+OOtLzXeZ9wNTW/AHUPy6S9U4F+5z6/09fVT
 tTH0cvrgAGjbASlYx2VqGONXAsxCfjulq6ryJBFlPLp949c/JTTgOojukCSbABEBAAHCwHYE
 GAEIACACGwwWIQQtG9pGQ7sz3tf8M/kC7fV9o/vRzgUCZL1H0gAKCRAC7fV9o/vRzlamCACs
 vHw+0heTm+BfC3S8DUST6889gidIIwdqBep1ByzetCph7Bq8Y8BlT5YTX0u/bSKkxCzFgeTm
 vC341Q09ST2XjLAl1ZTdzGhH9gcgYyOw34pr5fPQRJLB392mPzD8YReRzciNbhWzj+DLgeVe
 ouyfGajd6jDjkf4FEq+trQLGZhpfsKn3JnDbzBUs945D50l/vz9q/QN3qZO+H4F6g8ZeMnqo
 FOEFN26xVtdEDr+0DNFsbgKmEzs675kdAY78ZZdbEetX/FSknxJ+FK1ZW3J7Yswwulj34AXP
 LB49Mk8Ot7fo6mdt0DkV11JS9LmKxKvpY+KTlrKG+i7pVCSZvVUx
In-Reply-To: <20260120-mtkdsi-v1-1-b0f4094f3ac3@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_140642_629492_1DDE73C2 
X-CRM114-Status: GOOD (  25.71  )
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

On 1/20/26 05:36, Gary Bisson wrote:
> Some bridges, such as the TI SN65DSI83, require the HS clock to be
> running in order to lock its PLL during its own pre-enable function.
> 
> Without this change, the bridge gives the following error:
> sn65dsi83 14-002c: failed to lock PLL, ret=-110
> sn65dsi83 14-002c: Unexpected link status 0x01
> sn65dsi83 14-002c: reset the pipe
> 
> Move the necessary functions from enable to pre-enable.
> 
> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
> ---
> Tested on Tungsten510 module with sn65dsi83 + tm070jdhg30 panel.
> 
> Left mtk_dsi_set_mode() as part of the enable function to mimic what is
> done in the Samsung DSIM driver which is known to be working the TI
> bridge.
> ---
>   drivers/gpu/drm/mediatek/mtk_dsi.c | 35 +++++++++++++++++------------------
>   1 file changed, 17 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 0e2bcd5f67b7..b560245d1be9 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -672,6 +672,21 @@ static s32 mtk_dsi_switch_to_cmd_mode(struct mtk_dsi *dsi, u8 irq_flag, u32 t)
>   	}
>   }
>   
> +static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
> +{
> +	if (!dsi->lanes_ready) {
> +		dsi->lanes_ready = true;
> +		mtk_dsi_rxtx_control(dsi);
> +		usleep_range(30, 100);
> +		mtk_dsi_reset_dphy(dsi);
> +		mtk_dsi_clk_ulp_mode_leave(dsi);
> +		mtk_dsi_lane0_ulp_mode_leave(dsi);
> +		mtk_dsi_clk_hs_mode(dsi, 0);
> +		usleep_range(1000, 3000);
> +		/* The reaction time after pulling up the mipi signal for dsi_rx */
> +	}
> +}
> +
>   static int mtk_dsi_poweron(struct mtk_dsi *dsi)
>   {
>   	struct device *dev = dsi->host.dev;
> @@ -724,6 +739,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
>   	mtk_dsi_set_vm_cmd(dsi);
>   	mtk_dsi_config_vdo_timing(dsi);
>   	mtk_dsi_set_interrupt_enable(dsi);
> +	mtk_dsi_lane_ready(dsi);
> +	mtk_dsi_clk_hs_mode(dsi, 1);
>   
>   	return 0;
>   err_disable_engine_clk:
> @@ -769,30 +786,12 @@ static void mtk_dsi_poweroff(struct mtk_dsi *dsi)
>   	dsi->lanes_ready = false;
>   }
>   
> -static void mtk_dsi_lane_ready(struct mtk_dsi *dsi)
> -{
> -	if (!dsi->lanes_ready) {
> -		dsi->lanes_ready = true;
> -		mtk_dsi_rxtx_control(dsi);
> -		usleep_range(30, 100);
> -		mtk_dsi_reset_dphy(dsi);
> -		mtk_dsi_clk_ulp_mode_leave(dsi);
> -		mtk_dsi_lane0_ulp_mode_leave(dsi);
> -		mtk_dsi_clk_hs_mode(dsi, 0);
> -		usleep_range(1000, 3000);
> -		/* The reaction time after pulling up the mipi signal for dsi_rx */
> -	}
> -}
> -
>   static void mtk_output_dsi_enable(struct mtk_dsi *dsi)
>   {
>   	if (dsi->enabled)
>   		return;
>   
> -	mtk_dsi_lane_ready(dsi);
>   	mtk_dsi_set_mode(dsi);
> -	mtk_dsi_clk_hs_mode(dsi, 1);
> -
>   	mtk_dsi_start(dsi);
>   
>   	dsi->enabled = true;
> 
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20260120-mtkdsi-29e4c84e7b38
> 
> Best regards,

Hello,
This commit was part of 7.1 and caused a problem for me.
I'm running postmarketOS (basically Alpine Linux) on a Lenovo C330 
chromebook with a Mediatek MT8173 processor.
The problem: when the display on my laptop powers off (via suspend or 
idle, like xset dpms off) the picture does not come back when the 
display powers back on (from resume). The display backlight comes on and 
brightness is adjustable but there is no picture. The only fix is to reboot.

Reverting this commit and applying it as a patch on top of 7.1 addresses 
the issue for me.

You can view the config I'm using here: 
https://gitlab.postmarketos.org/postmarketOS/pmaports/-/merge_requests/8819

Is there any sort of testing or other debugging info I can provide to 
help address this issue?

Thanks,
- Adam Thiede

