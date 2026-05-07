Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88FEACD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 18:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cZAoLcKv/IcNdiZDfzcbMbcVDOeuM0B0mAKB2TAuBuA=; b=YF6Dn4DynVMaDYblAN8UKZ1Bpx
	szmD70JAJx4x+infweYvAwB4i67AQne14v4q4IJSyx8qOAmKFG2VjgVNEnkLRngDhcigVDW8GuXeV
	rxdr4A3OPSvMEADK9KzsbFdwj/KlHO3/K/PVkwLqS6WUzFXOP/11J3KvpwrGINSpJXNiE4rp79xh3
	I2/P+UV5ag5Z95Y/e3kQaXMgG/hv591e1XXCrZKeauzVH0L+CoDRiuIdGn2wVH5IyEY4v2HClE/6O
	+qmFQa6OODvCrPE6M07phGhrJYEbtY2vD3ooi+8dNA2nAnncGpcrSL1X2qVOp9sfMElw1yVPF0Dqh
	EDn7+0Mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL34j-00000004Xml-3wE6;
	Thu, 07 May 2026 18:03:53 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wL34h-00000004Xl5-0YUb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 18:03:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1778177028;
 bh=cZAoLcKv/IcNdiZDfzcbMbcVDOeuM0B0mAKB2TAuBuA=;
 b=AL3dcN13DDgdlvbx7f1NdvZtY8MN9fjtqNcQwM0IwYiPECDc5nUXODNTaN/Sjjr27m2bLcApN
 g8KiRjNnKFAG0yl/+z5WGC08AFj4CB0h/FRR3lTM1QHCeI248/lA+u8dv8mTeR5q/zDzuz7fg2o
 zLgkZjuPBS1TPbg/ArgOOmm7S4xdl6N++dprDqRrm6De6lqts/JQamo+ieO5u0LWAG7Pp6WavER
 J7uSd9dIzKtzKiJE3vN0IkiRzZgXDC05S1fZXlv7jjS6mOmArrDZsaDuc0fEFtHM8r5KT62jGt5
 29cGo/RCLg4B5eHgOlsx0Z8BNg9+thD3HVxqYsepT1bw==
X-Forward-Email-ID: 69fcd3fe717d2f6fd6afcf98
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.7.7
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <a9f86194-a96b-4f9b-b8a6-f074e0746dd5@kwiboo.se>
Date: Thu, 7 May 2026 20:03:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] phy: rockchip: inno-hdmi: Change TMDS rate handling to
 configure() ops
To: Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul
 <vkoul@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20260503172936.194003-1-jonas@kwiboo.se>
 <4d77bbef-6350-48e1-93a5-d256fc8bc8cd@linaro.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <4d77bbef-6350-48e1-93a5-d256fc8bc8cd@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_110351_511161_ED03898A 
X-CRM114-Status: GOOD (  22.56  )
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

Hi Neil,

On 5/6/2026 5:00 PM, Neil Armstrong wrote:
> On 5/3/26 19:29, Jonas Karlman wrote:
>> The commit 10ed34d6eaaf ("phy: Add HDMI configuration options")
>> introduced a way for HDMI PHYs to be configured through the generic
>> phy_configure() function.
>>
>> This driver currently derives the TMDS character rate from the pixel
>> clock and the PHY bus width setting. However, no in-tree consumer of
>> this PHY has ever called phy_set_bus_width() to change the TMDS rate.
>>
>> Change the TMDS character rate handling to depend on the configure() ops
>> before any PHY consumer needs to configure a TMDS character rate that is
>> different from the pixel clock rate.
>>
>> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
>> ---
>> A near future drm/rockchip: dw_hdmi: series plans to include a call to
>> phy_configure() to configure this HDMI PHYs TMDS character rate.
>> ---
>>   drivers/phy/rockchip/phy-rockchip-inno-hdmi.c | 30 ++++++++++---------
>>   1 file changed, 16 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
>> index 1483907413fa..7f0563d4d482 100644
>> --- a/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
>> +++ b/drivers/phy/rockchip/phy-rockchip-inno-hdmi.c
>> @@ -245,6 +245,7 @@ struct inno_hdmi_phy {
>>   	struct clk *phyclk;
>>   	unsigned long pixclock;
>>   	unsigned long tmdsclock;
>> +	struct phy_configure_opts_hdmi hdmi_cfg;
>>   };
>>   
>>   struct pre_pll_config {
>> @@ -554,19 +555,10 @@ static inline void inno_update_bits(struct inno_hdmi_phy *inno, u8 reg,
>>   static unsigned long inno_hdmi_phy_get_tmdsclk(struct inno_hdmi_phy *inno,
>>   					       unsigned long rate)
>>   {
>> -	int bus_width = phy_get_bus_width(inno->phy);
>> -
>> -	switch (bus_width) {
>> -	case 4:
>> -	case 5:
>> -	case 6:
>> -	case 10:
>> -	case 12:
>> -	case 16:
>> -		return (u64)rate * bus_width / 8;
>> -	default:
>> -		return rate;
>> -	}
>> +	if (inno->hdmi_cfg.tmds_char_rate)
>> +		return inno->hdmi_cfg.tmds_char_rate;
>> +
>> +	return rate;
> 
> Can't you keep both until dw-hdmi calls the configure op ?

I probably could, just not sure how much use it will be. I could split
the changes in two different patches for a v2 if that is preferred?

The only known user that calls phy_set_bus_width() for this PHY are my
out-of-tree HDMI 2.0 patches for Rockchip RK3228/RK3328, i.e. those
originating from LibreELEC (also carried by other distros), and also the
downstream vendor kernel use a different implementation.

I am currently re-working those HDMI 2.0 patches, current working tree
can be found at [1], where the patch "drm/rockchip: dw_hdmi: configure
PHY in atomic_mode_set" [2] adds a call to phy_configure(). That part
of the multi-series effort should reach mailing list any day now.

[1] https://github.com/Kwiboo/linux-rockchip/commits/next-20260430-rk-hdmi-v2/
[2] https://github.com/Kwiboo/linux-rockchip/commit/555dfa562f40d22a63577c746ab42b0ec1f3ebee

Regards,
Jonas

> 
>>   }
>>   
>>   static irqreturn_t inno_hdmi_phy_rk3328_hardirq(int irq, void *dev_id)
>> @@ -602,6 +594,16 @@ static irqreturn_t inno_hdmi_phy_rk3328_irq(int irq, void *dev_id)
>>   	return IRQ_HANDLED;
>>   }
>>   
>> +static int inno_hdmi_phy_configure(struct phy *phy,
>> +				   union phy_configure_opts *opts)
>> +{
>> +	struct inno_hdmi_phy *inno = phy_get_drvdata(phy);
>> +
>> +	inno->hdmi_cfg = opts->hdmi;
>> +
>> +	return 0;
>> +}
>> +
>>   static int inno_hdmi_phy_power_on(struct phy *phy)
>>   {
>>   	struct inno_hdmi_phy *inno = phy_get_drvdata(phy);
>> @@ -668,6 +670,7 @@ static int inno_hdmi_phy_power_off(struct phy *phy)
>>   
>>   static const struct phy_ops inno_hdmi_phy_ops = {
>>   	.owner = THIS_MODULE,
>> +	.configure = inno_hdmi_phy_configure,
>>   	.power_on = inno_hdmi_phy_power_on,
>>   	.power_off = inno_hdmi_phy_power_off,
>>   };
>> @@ -1392,7 +1395,6 @@ static int inno_hdmi_phy_probe(struct platform_device *pdev)
>>   	}
>>   
>>   	phy_set_drvdata(inno->phy, inno);
>> -	phy_set_bus_width(inno->phy, 8);
>>   
>>   	if (inno->plat_data->ops->init) {
>>   		ret = inno->plat_data->ops->init(inno);
> 


