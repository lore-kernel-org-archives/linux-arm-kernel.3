Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15DEFC44529
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 19:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9NVguL04ODQeGIDISKLCCS2X/fruMYbxnAzyvlKxBA=; b=sOz9lsKMiioaNdlfD4HUV36vVm
	VDhu9SQ8OM1G8RTJx4ooz1D7ngaIcm7LDIeB6rcYV58yEMDNc8ThMSsApa4fxWl1G4fGrijTqMhpg
	1/l1qXJRN6YLWLda1dN++BBwXpsp6SHGbyLacYlFInLW/lnSgEf9uDrVGpZD2myyLCejuRqxZ0Pbo
	mrAoRcvRs77C4wbLLKKrclD9fxRyPv489Y82PEyaIdUL/mfL3OG52f31a8kZfwD0SL/Vlcd0ByrwW
	U37VVFAppUyyJJZehhIoCTulBqGaFHhjLNOE9fk7N17FyR+IIpFLljhHqZiYLnKCPI9AcgCCKZIHg
	sGrf+dIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wltZv-00000007kBU-1LTU;
	Mon, 20 Jul 2026 19:23:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wltZs-00000007k8x-0YgY;
	Mon, 20 Jul 2026 19:23:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784575377;
	bh=OsvP99ela6zAdfVIAq+eCL6sZcIj2qQNMD54cI/1i9s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jnWSq+Lo4AbMpRQhZKdE9RiEnUqKI7RkAeHfp+TqVXKMmhFuXWYunZK2eTEiRClZR
	 Vu6vYhpB7cxno6FTANC9D+otPZCYlwWvWMfiOd//Kd1Le/VTkK7VdnXBbI34f0uvGQ
	 +GRTOzhpVlLZvturG7s3N3pxjVlgJE+upcHgD4XLZYWPaaxz3UesDjJs8l7k1EHyS/
	 t0V++NdxCm6DJc7npUYUzEVcoiKaUaoWSX/fjQKn40LbctCDgc8uXxcdkOvILjAIJW
	 cGtYMGI+OnXFXE5cVtDfAkkllbog/2Pift17HprAaSgldYnJ2qqPFUUX1d3kecnZ/L
	 GkNpp6qWTNdYw==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 469CB17E0910;
	Mon, 20 Jul 2026 21:22:57 +0200 (CEST)
Message-ID: <d6df5627-b3d3-4508-be4a-d202b2a13afc@collabora.com>
Date: Mon, 20 Jul 2026 22:22:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/8] phy: rockchip: samsung-hdptx: Handle uncommitted
 PHY config changes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Algea Cao <algea.cao@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>,
 kernel@collabora.com, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Thomas_Niederpr=C3=BCm?=
 <dubito@online.de>, Simon Wright <simon@symple.nz>
References: <20260612-hdptx-clk-fixes-v4-0-ce5e1d456cda@collabora.com>
 <20260612-hdptx-clk-fixes-v4-4-ce5e1d456cda@collabora.com>
 <al4t4aN01iiUKff_@umbar.lan>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <al4t4aN01iiUKff_@umbar.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_122300_332606_E2B498FD 
X-CRM114-Status: GOOD (  21.19  )
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

On 7/20/26 5:17 PM, Dmitry Baryshkov wrote:
> On Fri, Jun 12, 2026 at 02:45:23AM +0300, Cristian Ciocaltea wrote:
>> Any changes to the PHY link rate and/or color depth done via the HDMI
>> PHY configuration API are not immediately programmed into the hardware,
>> but are delayed until the PHY usage count gets incremented from 0 to 1,
>> that is when it is powered on or when the PLL clock exposed through
>> the CCF API is prepared, whichever comes first.
> 
> Why do you need either-of here? Can it be just one path?

The thing is that PLL clock usage is dynamic, depending on the rate, but it can
also be disabled permanently. When it's in use, it triggers before power on,
hence the hardware must be programmed at that time.

>>
>> Since the clock might remain in prepared state after subsequent PHY
>> config changes, the programming can also be triggered via
>> clk_ops.set_rate().  However, from the clock consumer perspective (i.e.
>> VOP2 display controller), the (pixel) clock rate doesn't vary with bpc,
>> as that is handled internally by the PHY and reflected in the TDMS
>> character rate only.
>>
>> As a consequence, changing the bpc while preserving the modeline may
>> lead to out-of-sync issues between CCF and HDMI PHY config state,
>> because the .set_rate() callback is not invoked when clock rate remains
>> constant.  This may also happen when the PHY PLL has been pre-programmed
>> by an external entity, e.g. the bootloader, which is actually a
>> regression introduced by the recent FRL patches.
>>
>> Introduce a pll_config_dirty flag to keep track of uncommitted PHY
>> config changes and use it in clk_ops.determine_rate() to invalidate the
>> current clock rate (as known by CCF) and, consequently, ensure those
>> changes are programmed into hardware via clk_ops.set_rate().
>>
>> Moreover, proceed with a similar fix in phy_ops.power_on() callback, to
>> handle the scenario where the CCF API is not used due to operating in
>> FRL mode, while the clock is still in a prepared state and thus
>> preventing rk_hdptx_phy_consumer_get() to apply the updated PHY
>> configuration.
>>
>> Fixes: de5dba833118 ("phy: rockchip: samsung-hdptx: Add HDMI 2.1 FRL support")
>> Fixes: 9d0ec51d7c22 ("phy: rockchip: samsung-hdptx: Add high color depth management")
>> Tested-by: Thomas Niederprüm <dubito@online.de>
>> Tested-by: Simon Wright <simon@symple.nz>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 84 +++++++++++++----------
>>  1 file changed, 48 insertions(+), 36 deletions(-)
>>
>> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> index b210c1a88b25..25bd821cd039 100644
>> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> @@ -413,6 +413,7 @@ struct rk_hdptx_phy {
>>  
>>  	/* clk provider */
>>  	struct clk_hw hw;
>> +	bool pll_config_dirty;
> 
> Which lock protects it?

This is not protected by a driver-local lock, as the impacted calls are
orchestrated by the DRM core, which should guaranty the expected sequence of
operations:

1. encoder-check -> phy_configure -> no HW programming, pll_config_dirty=true
2. VOP2 crtc-enable -> set_rate -> HW commit, pll_config_dirty=false
3. bridge-enable -> phy_power_on, no HW programming (pll_config_dirty already
   false)

> 
>>  	bool restrict_rate_change;
>>  
>>  	atomic_t usage_count;
> 

