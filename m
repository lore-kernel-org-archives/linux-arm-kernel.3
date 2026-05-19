Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1045BCD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UysSrWx2IaBnmq7p+RKc3cNjOUxboHqJt85KySMdL0U=; b=Xwiy0Sq1rKNRXWqHBzS241+XZW
	q1WTz/u/vzgXqftH5MAfy/ffIHVabbDfc3jdGKGOuHqtdHqGwlFjkTqVi95hW3fsuisEO4lqMkIe8
	Gelwzb0dSD0X11Co602MCucLgkc26MBq5Qi+cU72gIhrKKfTkOGYmF3nkcgbg4nPZr4LwCA2k76Qt
	ag9LQRgSQoi7OlX6h70XG2/6CdDDvc7fLUPp+bxAbcyk6PPUGNkEQ7zO4CGPVNVHukgfgXoIE2ETv
	IfwIM57CV+gyAbluju/cwu1eBMqWMRKVuo+z4BRlqnYuCmENjfIyfpgj1gWu6m1mUZYBC1fI+2jLm
	SvBUZ6gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMEA-00000001zW9-45oI;
	Tue, 19 May 2026 15:19:26 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPME1-00000001zIE-3JPE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:19:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1779203952;
 bh=UysSrWx2IaBnmq7p+RKc3cNjOUxboHqJt85KySMdL0U=;
 b=UP71aKD8jd1h2ABdkRMuqSjeKMKE2+D8oa02GQBNh9X5rGBdo6uOsYq3oy1ElrqvlenRAEAiz
 CGCqBXI3ieXzvP1GnaC9PaDosGMkQlhsHxWwRVzJtUy90/yD0KvBYtIHGTO0C6dkoSDQlGeLsB4
 KrOH8da4hUgG2jZ03AzC0AgcTE+LMsLh8v6bfN8wKQUjpXcrUpnXlXcVVhEzaDZxEcQ+GaFsIRB
 577zEv7HkHUtpucSsQ/fO6qinR669sPIf4BPebdwUxeboN9AvJIEvUV1ULOh6DGbFrFZ7DW803C
 64cEm//xCVfShj+y8nXpkhapzppzI2vzA41b/C+e6A/Q==
X-Forward-Email-ID: 6a0c7f56b6cbacb3a8d0c696
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.8.12
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <e90eddfc-2f57-418a-ae05-43a411d72b99@kwiboo.se>
Date: Tue, 19 May 2026 17:18:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 04/23] drm: bridge: dw_hdmi: Hold bridge ref until
 connector cleanup
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>, Liu Ying <victor.liu@nxp.com>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Chen-Yu Tsai <wens@kernel.org>, Christian Hewitt
 <christianshewitt@gmail.com>, Diederik de Haas <diederik@cknow-tech.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-sunxi@lists.linux.dev, imx@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20260518180206.2480119-1-jonas@kwiboo.se>
 <20260518180206.2480119-5-jonas@kwiboo.se>
 <177919241969.545972.18169905222569864569.b4-review@b4>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <177919241969.545972.18169905222569864569.b4-review@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_081923_799417_B474994A 
X-CRM114-Status: GOOD (  16.65  )
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

Hello Luca,

On 5/19/2026 2:06 PM, Luca Ceresoli wrote:
> On Mon, 18 May 2026 18:01:40 +0000, Jonas Karlman <jonas@kwiboo.se> wrote:
> 
> Hello Jonas,
> 
>>
>> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> index b7bfc0e9a6b2..9d795c550f8a 100644
>> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
>> @@ -2600,10 +2609,14 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
>>  
>>  	drm_connector_helper_add(connector, &dw_hdmi_connector_helper_funcs);
>>  
>> -	drm_connector_init_with_ddc(hdmi->bridge.dev, connector,
>> -				    &dw_hdmi_connector_funcs,
>> -				    DRM_MODE_CONNECTOR_HDMIA,
>> -				    hdmi->ddc);
>> +	ret = drm_connector_init_with_ddc(hdmi->bridge.dev, connector,
>> +					  &dw_hdmi_connector_funcs,
>> +					  DRM_MODE_CONNECTOR_HDMIA,
>> +					  hdmi->ddc);
>> +	if (ret)
>> +		return ret;
>> +
>> +	drm_bridge_get(&hdmi->bridge);
> 
> I'm not fully following the code paths, but both the report and the fix
> make sense to me. Only I'd move the drm_bridge_get() before
> drm_connector_init_with_ddc(), to avoid a short window where no reference
> is held and the bridge might be destroyed before drm_bridge_get() is
> called. I'm not sure this can happen, but it's better to write the code in
> a way that clearly makes it impossible.

dw_hdmi_connector_create() is only called from dw_hdmi_bridge_attach()
so the bridge should already have a ref for the lifetime of this call.

I explicitly chose the placement after drm_connector_init_with_ddc()
to ensure ref count is correctly balanced without having to add a
drm_bridge_put() call in any error path. I.e. connector destroy() is
only called when drm_connector_init_with_ddc() succeeds.

This code/call is also planned to be removed in a future series, so I do
not think moving drm_bridge_get() is necessary unless you think we need
to protect against possible bad behavior from DRM core?

Regards,
Jonas

> 
> Otherwise looks good.
> 
> Luca
> 


