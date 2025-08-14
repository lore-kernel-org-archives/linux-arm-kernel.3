Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50BB2CA0EE6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 16:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mVOaUeFd6uP0v0Boaa4JgDo8T/NPIzZgMyrhZS9r0Cs=; b=vAoWkWgc5UChvljt3iEAa/86zd
	zLBuMq91SOcsgYoIql6UgVXBFaej9gaw3DI4SJb7leTLQ6izsTgUpqESlZ5UTxBT6Mf3FfTUeAL0/
	8jv32gcLvRNhoDXCXsFror3knZEcOVlNzhofeVaCG9PRDXEiL9Qhj4FCsgQPjdzRFYjGsWd0dK0pQ
	9KCRFRGUXNBZudx2AozpiNt4SuHai+IrI9yi/NnaiPbOOJMz8Ngw5wVok8jY2L6us+IAMctrX2imQ
	siZ2IcMz1StyKSOnkoerMvVRpc9HBp0192fJAP8IaXo/RtbKFo4BHMd9wNgjkqLK3IECla02/jbXB
	2+yMlsSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umbHL-000000008AO-3zf4;
	Thu, 14 Aug 2025 16:58:15 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umawa-0000000052z-31RU;
	Thu, 14 Aug 2025 16:36:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1755189406;
	bh=d+QXGdRD+AohxHQ66KXmOAFqY41YYQSeMyLGgADIGUw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kyVwDXgVko4JOin5YkL6hLrpr6jRMeA+k/1VgK+3YzB+LJc9nw+7qYXy86fTHYP9x
	 CGM8VKsljNOmQN8intxPr4xZMxuRZAFZXrFnxddZHvDI2pEJWvGUNqit4AYiYbi24s
	 GjEUdWxMw8bxxFVeFjnu5I6sMOZZswD1medpe9mbVwqXPJhpBXbaUKdLUJMekiTI5Z
	 GEnCWexFI/Ev5agsYlCHwK56ZEMaR7I5euO1GyX33FKxVHotVbnsZyA8NTdU1c5+OM
	 GD9BZcTIs5wpPt+NVQNNSermb+zmFPBCgbIHFO7e0T6RBfzE2K9Pb09wplSWjMCXhI
	 2wlsEyPR86v+w==
Received: from [192.168.1.90] (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 68C8B17E1273;
	Thu, 14 Aug 2025 18:36:45 +0200 (CEST)
Message-ID: <708d3814-f414-4174-95b3-d3450e9780ec@collabora.com>
Date: Thu, 14 Aug 2025 19:36:44 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 8/9] phy: rockchip: phy-rockchip-samsung-hdptx: convert
 from round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20250810-phy-clk-round-rate-v2-0-9162470bb9f2@redhat.com>
 <20250810-phy-clk-round-rate-v2-8-9162470bb9f2@redhat.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20250810-phy-clk-round-rate-v2-8-9162470bb9f2@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_093648_913406_F5526269 
X-CRM114-Status: GOOD (  18.09  )
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

On 8/11/25 1:45 AM, Brian Masney wrote:
> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> index 79db57ee90d1487b51f4ddadde870a275dd7b17b..0d4e578c8c6a08aad355aa8aa5a1cf75c7d354ed 100644
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
> @@ -1879,9 +1879,9 @@ static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
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
> @@ -1896,7 +1896,9 @@ static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
>  	 * hence ensure rk_hdptx_phy_clk_set_rate() won't be invoked with
>  	 * a different rate argument.
>  	 */
> -	return hdptx->hdmi_cfg.tmds_char_rate;
> +	req->rate = hdptx->hdmi_cfg.tmds_char_rate;
> +
> +	return 0;
>  }

This LGTM now, hence

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>


