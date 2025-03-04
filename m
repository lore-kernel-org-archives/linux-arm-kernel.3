Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA92C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 02:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P+ELAYi5yM4rvbkXCwEy5ZlFvguPJty+qtx9F21GNoQ=; b=OsMdjAcRsJ+UEcBn+MSrXz6sFK
	26R8oYIoaWnYsulhMeAetnWsmTCGVCLiL+f/sdMETPmX7vi3nGETvUgzXMiDP4YmmZId+EsDHeRNf
	2CPZ5/3XlUCfi6xP9MXgv6SwLOHC+4r7s628l8EvQvO5c1UO3cwurbVTAzmxOpDPSLnVRjHZ/+i/l
	ZZ259hX7kSTXyPrgBQx5ZDnTbHYLmV0b3lJRXpAYXDFWzXaKdtAOfMs6sv7/MWXvFVZZtGRx1I9BH
	1qOcPvbwdKKEWI+2z0UpCUmD4nLxjtHglmvbJfOmLCy1DPf5EBROhraK/qzyEgrbcjFYsZ7gF7oST
	pi/QnNtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpI0Y-00000002tqh-0nkX;
	Tue, 04 Mar 2025 02:27:46 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpHmr-00000002sK0-49to;
	Tue, 04 Mar 2025 02:13:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741054416;
	bh=XdjYGNkCJLFebhJtPJNMrBtam1cgnlzw7fX78PFRfVk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Vtk1JUvcwQXXuccAcQ2bDeCWgtnbd8VTwLWGoOdovN2NZRhzxK4BzeuIzBynEsUA/
	 70FS4aBc9QGY8fI44OrZOQeYlxzBiq425QJLuvB+tQMtwkvGWK+418pC4d9IR48FNP
	 wr71OMxLPj8yipt5Lw4aHRrZGwatH56QtT9qTbrt6AkGfBs7zOp0sSbz54jrjtS1w3
	 CujyTNsr/idHdxtJaR+lPQ55DLx/ocxXq/0Rv4sX2+WM3MXSpbh8QNVk7IovZwz+hb
	 8qxdEajGNJDePTKx/lc7LEHwm1bHbq5Cht1Xwb9P0CGlH+X4WXLnefcfPe5TKdejaF
	 2I5HM0wnpS5qg==
Received: from [192.168.1.90] (unknown [188.27.58.83])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8DFBF17E086B;
	Tue,  4 Mar 2025 03:13:35 +0100 (CET)
Message-ID: <94ef8866-eccb-497e-8279-a242bbe098d6@collabora.com>
Date: Tue, 4 Mar 2025 04:13:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/8] phy: rockchip: samsung-hdptx: Setup TMDS char rate
 via phy_configure_opts_hdmi
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>,
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20250223-phy-sam-hdptx-bpc-v3-0-66a5c8e68327@collabora.com>
 <20250223-phy-sam-hdptx-bpc-v3-5-66a5c8e68327@collabora.com>
 <CAA8EJppjRFWXXYSp=SKPKBV-ceO7gu3n37k-5eUeYG_x6rOmsg@mail.gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <CAA8EJppjRFWXXYSp=SKPKBV-ceO7gu3n37k-5eUeYG_x6rOmsg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_181338_201646_A0B74FA6 
X-CRM114-Status: GOOD (  22.24  )
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

On 2/24/25 1:38 AM, Dmitry Baryshkov wrote:
> On Sun, 23 Feb 2025 at 13:02, Cristian Ciocaltea
> <cristian.ciocaltea@collabora.com> wrote:
>>
>> The current workaround to setup the TMDS character rate relies on the
>> unconventional usage of phy_set_bus_width().
>>
>> Make use of the recently introduced HDMI PHY configuration API for this
>> purpose.  The workaround will be dropped as soon as the switch has been
>> completed on both ends.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 37 +++++++++++++++++------
>>  1 file changed, 27 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> index f9b5c96d6c789e435657e224032d35b5a6950945..dd91a7272e246b2133112effdb080a847fd15abe 100644
>> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> @@ -402,6 +402,9 @@ struct rk_hdptx_phy {
>>         int nr_clks;
>>         struct reset_control_bulk_data rsts[RST_MAX];
>>
>> +       /* PHY config opts */
>> +       unsigned long tmds_char_rate;
> 
> It's easier to embed struct phy_configure_opts_hdmi here, in the end
> you  add bpc here in one of the next patches.

Indeed, handled in [1], part of v4.
 
>> +
>>         /* clk provider */
>>         struct clk_hw hw;
>>         unsigned long rate;

[...]

>> @@ -1830,6 +1837,16 @@ static int rk_hdptx_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>>  {
>>         struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
>>
>> +       /*
>> +        * The TMDS char rate set via phy_configure(), if any, has
>> +        * precedence over the rate provided via clk_set_rate().
> 
> I think this is not so nice. It makes CCF desync from the actual rate
> programmed into the hardware. Maybe you can make the clock r/o?

Oh, you're right.  I should have added just a warning here, though I
haven't really noticed this in practice so far.

I ended up providing a new patch [2] to properly restrict altering 
the TMDS char rate.  As explained in the commit message, making the 
clock read-only is currently not feasible, but I'll revisit this as
soon as the switch to relying exclusively on the HDMI PHY config API 
for the rate setup gets completed on both ends.

Thanks for the review!

Regards,
Cristian
 
>> +        */
>> +       if (hdptx->tmds_char_rate && hdptx->tmds_char_rate != rate) {
>> +               dev_dbg(hdptx->dev, "Replaced clk_set_rate=%lu with tmds_char_rate=%lu\n",
>> +                       rate, hdptx->tmds_char_rate);
>> +               rate = hdptx->tmds_char_rate;
>> +       }
>> +
>>         return rk_hdptx_ropll_tmds_cmn_config(hdptx, rate / 100);
>>  }
>>
>>
>> --
>> 2.48.1

[1] https://lore.kernel.org/lkml/20250304-phy-sam-hdptx-bpc-v4-7-8657847c13f7@collabora.com/
[2] https://lore.kernel.org/lkml/20250304-phy-sam-hdptx-bpc-v4-9-8657847c13f7@collabora.com/

