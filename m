Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0027EC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 13:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ke63Q1jZKW+p3/sASf3FOpv1I1TQ1dc74iYMIQAWnOw=; b=EF0GnNqRgyEuYOyWHEVy/iJehB
	UbrfSYFkdBW2pvxDGVzWR7GKh82Q1LMEEkdCCvH2OBvDVsPrVuWqcIkQ9LLf/NBBT3EI43nKkJUhG
	TIIh56f14q6YRDJ417nloBwcPBGNdusTVcX4WSkZRnmZYZXuujbdxENcUZtvHf0+NFrESmyVP0wQ+
	ani+Sq7qhGg8XnExJ4vRwYK1B9di6fxcwMa819VGHICUWhQ3uotVENUtSEQm48PF2G1o8F3FjQyMs
	gFfTVkmAUn23AOmz4hkmUyOr5Cm8AYYM2qiolPkdBpcRCts1pV7ALnzhKTv7MM0RxLYlC02ozWy2J
	0WFkuYVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWdP-00000005y8V-0WUd;
	Tue, 18 Mar 2025 13:05:31 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuWMf-00000005vkG-0I7Z;
	Tue, 18 Mar 2025 12:48:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1742302091;
	bh=1brdAVEecCGu0q3JZDffnzT7ixMtvQ/GFCymcYGLKrY=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=jux5qC1PNeu/TbmQK+KES3ko+a5iDs1NIgc0uj5XFRcAUYKALK8FH/Ksr7nOFzguE
	 eW4VCpV57aKc4kEpvNk4uWOTzNdu164IAw+3y3+/j4QP++ImoOiWUd+R/1YkEh7RJk
	 ql65VX28rqB0M1vOVrjhjNV3mfUIefw2P/9fLEV5VdiuiJr27haDRJlHNARtknjEBv
	 FYS6z8qqwy7MQUE0gnSE7KSiQ8yLmIq/TTSj1eiIIBMV7DNNSJ0aAZqZp+wvKu6/UB
	 hXU35iJyJORsLixZcrAbqLlawwgYbVQ07Cq3lN7chVrS5byN9hgG8o4d5+0hoslCur
	 OSnLY9XarvzVQ==
Received: from [192.168.1.90] (unknown [84.232.140.93])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E490817E0385;
	Tue, 18 Mar 2025 13:48:10 +0100 (CET)
Message-ID: <5e9516bc-66ac-4583-b949-5714e89d73ee@collabora.com>
Date: Tue, 18 Mar 2025 14:48:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 08/12] phy: rockchip: samsung-hdptx: Setup TMDS char
 rate via phy_configure_opts_hdmi
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>,
 Maxime Ripard <mripard@kernel.org>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20250308-phy-sam-hdptx-bpc-v5-0-35087287f9d1@collabora.com>
 <20250308-phy-sam-hdptx-bpc-v5-8-35087287f9d1@collabora.com>
 <CAA8EJpoGu4Tq-wt09Jj+b+=eJ3dNXhPWVOg4DyCQxrJbFNFfYw@mail.gmail.com>
 <6caefe9f-1b15-41c1-94f2-9a2a92aeec67@collabora.com>
Content-Language: en-US
In-Reply-To: <6caefe9f-1b15-41c1-94f2-9a2a92aeec67@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_054813_285790_A39D6D55 
X-CRM114-Status: GOOD (  15.25  )
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

On 3/9/25 12:15 PM, Cristian Ciocaltea wrote:
> On 3/9/25 11:26 AM, Dmitry Baryshkov wrote:
>> On Sat, 8 Mar 2025 at 14:21, Cristian Ciocaltea
>> <cristian.ciocaltea@collabora.com> wrote:
>>>
>>> The current workaround to setup the TMDS character rate relies on the
>>> unconventional usage of phy_set_bus_width().
>>>
>>> Make use of the recently introduced HDMI PHY configuration API to
>>> properly handle the setup.  The workaround will be dropped as soon as
>>> the switch has been completed on both ends.
>>>
>>> Rename rk_hdptx_phy_verify_config() to rk_hdptx_phy_verify_dp_config()
>>> and introduce the rk_hdptx_phy_verify_hdmi_config() helper to check the
>>> HDMI parameters during phy_configure().
>>>
>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>> ---
>>>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 64 +++++++++++++++++------
>>>  1 file changed, 47 insertions(+), 17 deletions(-)
>>>
>>
>>> @@ -1469,8 +1474,27 @@ static int rk_hdptx_phy_power_off(struct phy *phy)
>>>         return rk_hdptx_phy_consumer_put(hdptx, false);
>>>  }
>>>
>>> -static int rk_hdptx_phy_verify_config(struct rk_hdptx_phy *hdptx,
>>> -                                     struct phy_configure_opts_dp *dp)
>>> +static int rk_hdptx_phy_verify_hdmi_config(struct rk_hdptx_phy *hdptx,
>>> +                                          struct phy_configure_opts_hdmi *hdmi)
>>> +{
>>> +       int i;
>>> +
>>> +       if (!hdmi->tmds_char_rate || hdmi->tmds_char_rate > HDMI20_MAX_RATE)
>>> +               return -EINVAL;
>>> +
>>> +       for (i = 0; i < ARRAY_SIZE(ropll_tmds_cfg); i++)
>>> +               if (hdmi->tmds_char_rate == ropll_tmds_cfg[i].rate)
>>> +                       break;
>>
>> return 0;
>>
>>> +
>>> +       if (i == ARRAY_SIZE(ropll_tmds_cfg) &&
>>
>> Then you can drop the first clause in the if
> 
> Sure, will do!

I actually ended up submitting v6 [1] without these changes, since the last
patch "phy: rockchip: samsung-hdptx: Add high color depth management" would
need to revert them, i.e. it extends the verification and cannot really do
"return 0;" early.

[1] https://lore.kernel.org/lkml/20250318-phy-sam-hdptx-bpc-v6-0-8cb1678e7663@collabora.com/

