Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18B4C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 09:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t/yfIVf+HKhePoKbqHBdX1Ku3c8ibqgEPWH9hItiL8g=; b=MHjeOq/qTcBz0a9Dgwmx8L0MnW
	pwMtle0iF/suaJBqswwpFFImVznbrfnE4PQFUlai+kmMH3HkKabMaW2RAmbtt5/rGE/GX8c+mvLt1
	1l11GSRT5WX1jqtH8nwil8R5aE/AXbKpBZOokGLe+1wyG2DLeKhu5GNpefkEO8oLYYGuJr/uSzHu9
	u9yuHW/qWaHZmlU6IAma1uwLnH5m8QOk/MvsXK4w0HX4QQ/8eHNz6+pTZe+TDfZkXwYQjZPnmE1kq
	hOTLTJq2+rs4RntE0BJ0Gp6E4rrMuRDWLN58n7xrauW9ZAjs7Zw4uJ8heNCyrWqUAfYqWP5GEhP7n
	dxUBWo1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFG1-00000001k8P-2fnS;
	Mon, 14 Jul 2025 09:13:57 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFDZ-00000001jc1-1OUm;
	Mon, 14 Jul 2025 09:11:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752484282;
	bh=TcXuSKCzrCCwa2pmT8ZHf1Y2DIXZfwVMWsiDggJctoQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=B5bbabNSKmfNjM9++JQ90q4tsvfZkUqd0NHtfw2dUAe7hIS3PaXzD7HksVYxhHNab
	 wKmWXPRAWP00WwEUhjUURuoDXv7oP88Owx7G6axYcInakd5jvBrnwGh+5B5wZA4vej
	 FNTQKY3beSXG+GhSo/assdVNtSQFqiyBf7htZu5HnMZ+a2Z7wS8ybeJW6BFMohb2dA
	 gHU6GVhnlXLprKdYC8dD/uEoGkRf5Whwgh5nyLswGC1suMHvCJSzMMjnx79TXdKaIw
	 73Aiuly5kWcvTP7AT6Jt21nMD/o/UlNg/whhB+786BLG3fTUndHJbCWCU3b63x2Ttj
	 mUJscYPAujZRQ==
Received: from [192.168.1.90] (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 57A9F17E0FFA;
	Mon, 14 Jul 2025 11:11:22 +0200 (CEST)
Message-ID: <751975b2-c9dc-4f89-9537-475773b16883@collabora.com>
Date: Mon, 14 Jul 2025 12:11:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 8/9] phy: rockchip: phy-rockchip-samsung-hdptx: convert
 from round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <mripard@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20250710-phy-clk-round-rate-v1-0-0ff274055e42@redhat.com>
 <20250710-phy-clk-round-rate-v1-8-0ff274055e42@redhat.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20250710-phy-clk-round-rate-v1-8-0ff274055e42@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_021125_533606_40A9C5B4 
X-CRM114-Status: GOOD (  20.06  )
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

Hi Brian,

On 7/10/25 7:07 PM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> index 79db57ee90d1487b51f4ddadde870a275dd7b17b..f027d2caa4c2ebfc0fdec08bcebf3f415ff1a064 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> @@ -1869,8 +1869,8 @@ static unsigned long rk_hdptx_phy_clk_recalc_rate(struct clk_hw *hw,
>  	return hdptx->hw_rate;
>  }
>  
> -static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
> -					unsigned long *parent_rate)
> +static int rk_hdptx_phy_clk_determine_rate(struct clk_hw *hw,
> +					   struct clk_rate_request *req)
>  {
>  	struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
>  
> @@ -1879,14 +1879,17 @@ static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
>  	 * To be dropped as soon as the RK DW HDMI QP bridge driver
>  	 * switches to make use of phy_configure().
>  	 */
> -	if (!hdptx->restrict_rate_change && rate != hdptx->hdmi_cfg.tmds_char_rate) {
> +	if (!hdptx->restrict_rate_change && req->rate != hdptx->hdmi_cfg.tmds_char_rate) {
>  		struct phy_configure_opts_hdmi hdmi = {
> -			.tmds_char_rate = rate,
> +			.tmds_char_rate = req->rate,
>  		};
>  		int ret = rk_hdptx_phy_verify_hdmi_config(hdptx, &hdmi);
>  
> -		if (ret)
> -			return ret;
> +		if (ret) {
> +			req->rate = ret;

This is not quite right, since "ret" is expected to contain an error number,
typically -EINVAL.

> +
> +			return 0;

We shall continue returning the error code here.

Regards,
Cristian

> +		}
>  
>  		hdptx->hdmi_cfg = hdmi;
>  	}
> @@ -1896,7 +1899,9 @@ static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
>  	 * hence ensure rk_hdptx_phy_clk_set_rate() won't be invoked with
>  	 * a different rate argument.
>  	 */
> -	return hdptx->hdmi_cfg.tmds_char_rate;
> +	req->rate = hdptx->hdmi_cfg.tmds_char_rate;
> +
> +	return 0;
>  }
>  
>  static int rk_hdptx_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> @@ -1925,7 +1930,7 @@ static const struct clk_ops hdptx_phy_clk_ops = {
>  	.prepare = rk_hdptx_phy_clk_prepare,
>  	.unprepare = rk_hdptx_phy_clk_unprepare,
>  	.recalc_rate = rk_hdptx_phy_clk_recalc_rate,
> -	.round_rate = rk_hdptx_phy_clk_round_rate,
> +	.determine_rate = rk_hdptx_phy_clk_determine_rate,
>  	.set_rate = rk_hdptx_phy_clk_set_rate,
>  };
>  
> 

