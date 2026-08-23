Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC71CC5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Aug 2026 21:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NXEuJBGfzMeA2VoyieQfWVfmlZbv0eldSLa+1qSHcFI=; b=aTdIUKGpy6dOaQdF106cn3jJAW
	+L0La+HfMM00RMVlGBAfI/odGwQBXyI5rvZXxzdg38+nYcs/5pa5M/tlTegXjk63QvakQPcdYdTA3
	gsfcxBTdiD6izXeG+NuF1GLQ0zFrKIUQcMEbNnUzX1YN0QdEBA6/VwBx6nRWNSQfTUQ/G6BR7RjBB
	q+1rv65y0PDds8AzvCBIil79fm+VIVxv0YvGCW9xTShWdJOI+J9mLv9RGZuzD/0CyLyzPJ8nJy0nw
	+kgtqqmYg2JKtil3bFrrROEucjGYFYHjoS7TL+xANfx/nButSv5lRclfnZ1J2FdcjGnDhCLvv0iVN
	eYJDb1ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyFP2-0000000Fc2V-3IKo;
	Sun, 23 Aug 2026 21:06:52 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyFP0-0000000Fc1n-00VZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Aug 2026 21:06:51 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-69fdfd98eb8so521840a12.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 23 Aug 2026 14:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787519208; x=1788124008; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NXEuJBGfzMeA2VoyieQfWVfmlZbv0eldSLa+1qSHcFI=;
        b=cjGeOs/K4v8Nj4Ojuh8QuyP6ov2dPJzunx9qx4W5fq9SewCrB1TnIW4KKdK7L8pfzS
         +g+UVgMfptgLR1kEqAt8s3Kk8+0NpzFUHUzRc6Fk+k+ec4Tu2Xvpq1+K81y8PgXbqE0T
         MCUnYcaOQLSXWre9iLiOnm+dfI3CpaCtN//3EndBAGDTyMIDmBz7an/pKbJfAjd7os6p
         b9SC80rI0IT6swdqGCc5BoMUEoovsX1+fQ6S7acTi+VzUac0dfZG9gW8soukcCEBrhlK
         MZ23YFiCc9NNb7JxtjH12Z64GoY7CfhEAo9T2jpUd8g7xukbwmE2OdVgFzP0AefkJ9F5
         AwgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787519208; x=1788124008;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NXEuJBGfzMeA2VoyieQfWVfmlZbv0eldSLa+1qSHcFI=;
        b=Xc+pAvW0hDuNzh1ApNYlvn7C1aBowkXvpdZGwxCxJsP5vaoPY7rOcyS3OIGjlHf/x8
         53NIIua7ZOxb24lbG7y+ZGqLJ5trNg+xSOKVOtdK/VHCwdFQmoGpsFCYo9k5+DevgzLO
         bpv7jHlSXbkqgZ7E1MAohoZhGeyMG+8wDpmTTxnsN/GhlnZRyAuPW+R81SNWi7jU0v7/
         +G9FCbTXDLd6LLGq0f4gDNDVe8oQMsUc+shJSV93CuAxfvP0dHl3eXDcvwoImeIpu1g0
         yjuVttOrDr5/C982B9S2kj9IPP4XxXDDAranQ6AmgzqiS00zCiHX+EfbpIfB9xHT1I/i
         PXvg==
X-Forwarded-Encrypted: i=1; AHgh+Rp17ZK/KzMOJTT/chRmJPAV1vo3a8whwYkuygtmKrHVz3rd8xcO+2wkflIzGvRXU7/8sCpkTufCZU8L9sOzgPsG@lists.infradead.org
X-Gm-Message-State: AFuF++n8wACsfz76Li808kG7FKHKl8Gaeb5KGyquRPKcR7IZPaETj7PP
	ChnNMASbdziHgInLeMjSShuJ0E9bgAMWn9njbsH6h85kqeOZWAWIP4lv
X-Gm-Gg: AR+sD112AldQUJruRWZ3u9vMESPCdk4NOZ3qsh+wZmqXgJGAFVRuEWXdFC4mKb1Y9vo
	pKKMbQQmQlkA2WH4xOle4QDsoAGIC4IrVy0yUzpfyZqwoRc71c+yk7WYQGgZNJqJhSar7atT84m
	fzBXsqBVhypOZfPxsCq99AusdsIaW7Sb8+7qBe9f9O0cOGVOphea5G+x3g2cBwPlHUh95oiqKtX
	Ifq6SpEj3NcHrGITZLJ5FL+hIZdCNvvNJGFTbzP+L8NJAfWf1mL3UcFLhcPgOsgDAEf3ugyCb/q
	m29HH4ubbSlswzj+fSzC7GqY+Qrx9S35wU/nQnmVpFqPQLUxYiUk0327/VI6ESt+2WW6fAN5dSU
	Pzzlgn9nXaPEulqeYG5+7bWHpJxc7wK0hRy1uquAQvU3jkvwg1zJjsGY/7L7vqmgCXykMrwDj92
	fJ09adOQ4IzPMuEEZtitNVcWR2xsx0xp+QJYvWmK5z70Tb3KvCLCM61EPG24AXWjALqhRgJTqUo
	1rk3V4eH5iQofg6ATQydNyAHRI=
X-Received: by 2002:a05:6402:d0e:b0:6a3:fee5:adc8 with SMTP id 4fb4d7f45d1cf-6a42eeb84dcmr12976866a12.0.1787519207688;
        Sun, 23 Aug 2026 14:06:47 -0700 (PDT)
Received: from ?IPV6:2a02:a449:4071:0:32d0:42ff:fe10:6983? ([2a02:a449:4071:0:32d0:42ff:fe10:6983])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a59e1ccf69sm5175122a12.25.2026.08.23.14.06.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Aug 2026 14:06:46 -0700 (PDT)
Message-ID: <a239b296-ba90-45d1-b8b8-713ab29fda5c@gmail.com>
Date: Sun, 23 Aug 2026 23:06:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v1] drm: rockchip: add
 drm_plane_create_blend_mode_property
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, andy.yan@rock-chips.com
Cc: hjc@rock-chips.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <1ab6fb88-3b84-49b5-aa05-202a84edbd3d@gmail.com>
 <25031028.6Emhk5qWAg@diego>
Content-Language: en-US, ar-EG
From: Johan Jonker <jbx6244@gmail.com>
In-Reply-To: <25031028.6Emhk5qWAg@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260823_140650_063219_FD146C80 
X-CRM114-Status: GOOD (  21.66  )
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



On 8/23/26 21:19, Heiko Stübner wrote:
> Hi Johan,
> 
> Am Sonntag, 23. August 2026, 14:29:09 Mitteleuropäische Sommerzeit schrieb Johan Jonker:
>> A validate_blend_mode_for_alpha_formats() function was added that
>> fills the kernel log with warnings for Rockchip VOP version 1 SoCs.
>> Add a drm_plane_create_blend_mode_property() function as fix.
> 

> This is missing explanation on why PIXEL_NONE is the correct value.
> 
> VOP2 seems to support all 3 blend modes? So a sentece explaining
> the pixel_none value would be helpful.
> 
> 

Hi,

In the vop_plane_atomic_update() function there's a comment with win0 blend broken:

	/*
	 * Blending win0 with the background color doesn't seem to work
	 * correctly. We only get the background color, no matter the contents
	 * of the win0 framebuffer.  However, blending pre-multiplied color
	 * with the default opaque black default background color is a no-op,
	 * so we can just disable blending to get the correct result.
	 */

In the function vop2_plane_init() there are these blends: 

	unsigned int blend_caps = BIT(DRM_MODE_BLEND_PIXEL_NONE) |
				  BIT(DRM_MODE_BLEND_PREMULTI) |
				  BIT(DRM_MODE_BLEND_COVERAGE);

My question:
Could someone with more know-how tell us what VOP version 1 is capable of?
Is there anything that needs to be set like in other drivers?

For example:
		switch (pixel_blend_mode) {
		case DRM_MODE_BLEND_PREMULTI:
			break;
		case DRM_MODE_BLEND_COVERAGE:
			break;
		case DRM_MODE_BLEND_PIXEL_NONE:
		default:
			break;
		}

If someone comes up with another solution/patch that's also fine, as long the kernel warnings are gone.

Thanks!

Johan



> Heiko
> 
>> Signed-off-by: Johan Jonker <jbx6244@gmail.com>
>> ---
>>
>> https://lore.kernel.org/all/20260526181700.25310-3-leandro.ribeiro@collabora.com/
>> ---
>>  drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
>> index 0090d8ff0c79..0bc5b606f021 100644
>> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
>> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
>> @@ -1850,6 +1850,8 @@ static void vop_plane_add_properties(struct drm_plane *plane,
>>  	if (flags)
>>  		drm_plane_create_rotation_property(plane, DRM_MODE_ROTATE_0,
>>  						   DRM_MODE_ROTATE_0 | flags);
>> +	drm_plane_create_blend_mode_property(plane,
>> +					     BIT(DRM_MODE_BLEND_PIXEL_NONE));
>>  }
>>  
>>  static int vop_create_crtc(struct vop *vop)
>>
> 
> 
> 
> 


