Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2D3ED5C0E1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Nov 2024 14:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=upYsGgf23umhPBOmb5HT7kjqp65LPpB+QOD8j0l2rE4=; b=0ui/yPqOe3mRKtYzeetxg7055i
	8955ODm2tl24NrBKIUHnaVeLhksC5M6EjKp9scUHEXK6dra9Kc/+v6sVhVkYKD9KA4X0KnOMjc6Ek
	glcXBgM4wT8tDc0Yffpp8zmwNRDWY1gvSewQMmdVdI0Dr3iEutUyGjqazxwg/phc7OL3nMEo4rD0c
	1WEuKhNj13GJqjai1MF8j4+y5H4BwCwPQa9TKOzvdrHWE/QPGKqjJAlY6lZcAsa0wDJJuQ5KU8I0J
	s2dT8/5ay0wpr0hMvB29ec63OlQe4baKEO6iU/XRg0telE45i6prAmvDAfL7uhGhGiGm1te7f+ZyQ
	m4hIGutA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9QRp-0000000Aw8g-2dS4;
	Fri, 08 Nov 2024 14:58:53 +0000
Received: from mail.manjaro.org ([2a01:4f8:c0c:51f3::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PpD-0000000ApEf-3Rko;
	Fri, 08 Nov 2024 14:19:01 +0000
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1731075537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=upYsGgf23umhPBOmb5HT7kjqp65LPpB+QOD8j0l2rE4=;
	b=Cu67kjSVWeIMcCC+Jbh62CKfQeBvbLbaeVrOoJTC7E08ONzDAKwTyxCnm3RyphTtwkEVxz
	7Wau9/7UQPCWK+ySJoG4vlhqVFRzMAEh/VWwMiZF/1PwqTKqkv5r7Xaoa1MCJdJdGKU//+
	lmsJf12fwprFcVfdBv5pTh5FGelCl/UYDveT2OBScypZ2UfzdmrVq55B5XiAaCuPhnikrr
	sg5AUSk0Po+kPHUOE88sesoLjlepcOFGoK3+HEIAlYw9DzstYiqNJgSRhhFXYDTI7LI2eg
	s6zc6+jAtlJisK2L8fbwYDSy2yZy6bsw+7wCAGQAivffatli+E/rkGxXezjTDA==
Date: Fri, 08 Nov 2024 15:18:57 +0100
From: Dragan Simic <dsimic@manjaro.org>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: linux-rockchip@lists.infradead.org, dri-devel@lists.freedesktop.org,
 heiko@sntech.de, hjc@rock-chips.com, andy.yan@rock-chips.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Diederik de Haas <didi.debian@cknow.org>
Subject: Re: [PATCH 2/2] drm/rockchip: dsi: Don't log errors on deferred dphy
In-Reply-To: <yrm6r4urzf5hvnui53cvepw2loqvuhydalq6haw7qmpktor5y5@zjc34wlcoeg2>
References: <cover.1731073565.git.dsimic@manjaro.org>
 <559094275c3e41cae7c89e904341f89a1240a51a.1731073565.git.dsimic@manjaro.org>
 <yrm6r4urzf5hvnui53cvepw2loqvuhydalq6haw7qmpktor5y5@zjc34wlcoeg2>
Message-ID: <599471308374b786af4dc8a6b42fea76@manjaro.org>
X-Sender: dsimic@manjaro.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_061900_398431_99040399 
X-CRM114-Status: GOOD (  21.86  )
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

Hello Sebastian,

On 2024-11-08 15:08, Sebastian Reichel wrote:
> On Fri, Nov 08, 2024 at 02:53:58PM +0100, Dragan Simic wrote:
>> Deferred driver probing shouldn't result in errors or warnings being 
>> logged,
>> because their presence in the kernel log provides no value and may 
>> actually
>> cause false impression that some issues exist.  Thus, let's no longer 
>> produce
>> error messages when getting the dphy results in deferred probing.
>> 
>> This prevents misleading error messages like the following one, which 
>> was
>> observed on a Pine64 PineTab2, from appearing in the kernel log.  To 
>> make
>> matters worse, the following error message was observed appearing 
>> multiple
>> times in the kernel log of a single PineTab2 boot:
>> 
>>   dw-mipi-dsi-rockchip fe060000.dsi: [drm:dw_mipi_dsi_rockchip_probe \
>>   [rockchipdrm]] *ERROR* failed to get mipi dphy: -517
>> 
>> At the same time, make the adjusted logged message a bit more 
>> consistent with
>> the other logged messages by capitalizing its first word.
>> 
>> Reported-by: Diederik de Haas <didi.debian@cknow.org>
>> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
>> ---
> 
> From include/drm/drm_print.h:
> 
>  * DRM_DEV_ERROR() - Error output.
>  *
>  * NOTE: this is deprecated in favor of drm_err() or dev_err().
> 
> The recommended way to do this nowadays looks like this:
> 
> return dev_err_probe(dev, PTR_ERR(dsi->phy), "Failed to get mipi 
> dphy");
> 
> That will not print anything for -EPROBE_DEFER, but capture
> the reason and make it available through
> /sys/kernel/debug/devices_deferred if the device never probes.

Thanks for your quick response!  As already discussed with Heiko,
I'll move forward with implementing a complete file-level conversion.
At first, I thought that a partial bugfix would be beneficial, [1]
but now I agree that performing a complete file-level coversion is
the way to go. [2]

I've got to admit, I love seeing that DRM_DEV_ERROR() is deprecated,
because I've never been a big fan of the format of the messages
it produces.

[1] 
https://lore.kernel.org/dri-devel/3734f6a5424e3537d717c587a058fc85@manjaro.org/
[2] 
https://lore.kernel.org/dri-devel/047164cc6e88dcbc7701cb0e28d564db@manjaro.org/

>>  drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c 
>> b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>> index f451e70efbdd..ffa7f2bc640d 100644
>> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
>> @@ -1387,7 +1387,8 @@ static int dw_mipi_dsi_rockchip_probe(struct 
>> platform_device *pdev)
>>  	dsi->phy = devm_phy_optional_get(dev, "dphy");
>>  	if (IS_ERR(dsi->phy)) {
>>  		ret = PTR_ERR(dsi->phy);
>> -		DRM_DEV_ERROR(dev, "failed to get mipi dphy: %d\n", ret);
>> +		if (ret != -EPROBE_DEFER)
>> +			DRM_DEV_ERROR(dev, "Failed to get mipi dphy: %d\n", ret);
>>  		return ret;
>>  	}
>> 

