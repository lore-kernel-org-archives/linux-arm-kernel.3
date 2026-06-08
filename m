Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE96ECD8C9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Jun 2026 10:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o7rfjN8gvyO5A78qI/nvGvuW8Ai7Jn9ZQl2KKv15ni4=; b=a2+irywd9y2/C+DZ3ONEdAwdUU
	vWhBdpDjYFrS889JkXLx4OFw/FVAb76fsCD56Nq4P1bFaU8Xjz50GG0nJc1P2rH28Ngxp+b2Co6gh
	1AlBZ7HzEfp77fMnNRKI6p3NO7FLC42Ex/kbbDD5QB1Foykcyclw3eC74F8XJFUmFKAfDHba4agSm
	SpQU2P+M0mH8/+dc0oDO6h6oTn1sZyZ+8nBJNih3u0yGNa7U50HRgnYulpMtJXdm8DEhaUlTz6Y9N
	HFpdEsR/llX6cYryTY+/ipqYai+lQ2Mrbz4cjVFaEYug4rhp1lbHiU72Pcm9i54Ai7+kj6PjDSdGP
	vS9QMaYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXKp-00000003LVA-3jjM;
	Mon, 08 Jun 2026 10:35:59 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWXKn-00000003LUg-3m1Z
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Jun 2026 10:35:58 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2bf77d4a4e2so26559785ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Jun 2026 03:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780914957; x=1781519757; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o7rfjN8gvyO5A78qI/nvGvuW8Ai7Jn9ZQl2KKv15ni4=;
        b=UqV9V0USExnMqwhjC8e7yDRiasrlq3uAZF929TnJENYGmuOlktoVVs4xzcAsNjlbGr
         GRL7dB/KTmFE0zyiD0fly33eTud/HmPqmMu2f2pvyAJY7tEB9IjSaVWeXCPHDPBrmNIq
         S38z54f/+qfqJXJhnZ0JMp5C7TEQcsxWbZjJIc9CxYCCknu3A14oeDWO81CC1BRJzvH4
         G9jBdxf1fQFFN+GJN5UcCFSRny9pSb12t3i5pvPhY59y23YLE8IUR5gFEaAz4pptvcxR
         ze8/bZB2A/vPhIQ1anR0SRK3ievwmMq5LFPy22tcWBBHuokP1xnCbM1zJQTi4eoxZQ5q
         zoMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780914957; x=1781519757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o7rfjN8gvyO5A78qI/nvGvuW8Ai7Jn9ZQl2KKv15ni4=;
        b=g+kRyAFPy3SNu6Cu8BMn7eeu9TNJQG4N3ufMKUYBS4CvIv0aV9WEe++765pg9IF0Hb
         5aXpxEbzqRr8FXDiGgI/caAyqh9d70GR+SfwcP/ju0HHSNlfMqylc1Rhkq84/CgAe0sj
         Eepz+QtKVPhlAF45YTzx0des4T1M59t9ok7HRLWKuXgl+8U/7B93cBWZBaGGX7ckCQd1
         uTY1ZTGqrOEvFa2Zv2jxi3Binyb6JitHoMIJPXHF9/XhAKdx62I8WhqBGNR3N+yEPvMj
         ujcvv9thn/3nMFZW1DJJLFwXYqeY0akcZ6s6gffuIKbBxxHorsGmYL7URwyzE+f+3Mne
         4G0w==
X-Forwarded-Encrypted: i=1; AFNElJ9oBZh87rT1o5Ay1ciCSqQz5tXW302z6DacUw1y5dYnvclL01v3zNMGHcav1Pl0dYEuIss/rnCyrKEIwXtjgb19@lists.infradead.org
X-Gm-Message-State: AOJu0YxlBCq/12fpj5lWJkL99YtBqoSewYAni2q83yp+Q+C56hFIvNYk
	oMflymo2O/rfE4ScGPCw3lz/FBP+noqdbniKukDMGssXL1CShfd/Nj64
X-Gm-Gg: Acq92OEAJNfWTAnmXSmGtEjHcHroyXUHlLWXpOpBx+pPWReK2CyKtEt8gIyigzMTQ50
	BeaoCVOPZso96cZOgR2hzCeir1wW5ldao0mWEp5SPEE5WWPXOml864UZNukOO84nDjLsU/n1ttI
	1WleLD94Z+/VmI2ChKbeuu6WO2PFN6f5iT2SlsXOA1X7hFPBtNChnVoQnGwMApYgIAZJ621ihFF
	J2eY5kTRppBWSLwFFYqIZNvjH5oPnRS4blRlUqX/+Yx4io2NpvVVWl6k1fKjN+/RxkTQc5ZU+NI
	9msvC79J7U/ukTmT8bklRLPv9Ewm/XFTg3yTMP+ZgiNANUvPtXyEpPw2ecHZ3JzgeXcAoCjcfir
	JJC5LV6jRMtKQaGZ9mSkQH075y9h7SVrXN/c5e2P3kDZKHnaSf8E859eeyt9fK5eX0WMZ5S2WqF
	cB1Aypg6lfy8+Z2waP0Fb9UFILOHsCNIZPUKrK5qTF68AkyPco9/UBl2zGljvuiLZNBhvKloHVh
	GVCXRMJjFdH44A=
X-Received: by 2002:a17:903:8c3:b0:2bd:d6f1:3388 with SMTP id d9443c01a7336-2c1ec9271edmr112272305ad.28.1780914956983;
        Mon, 08 Jun 2026 03:35:56 -0700 (PDT)
Received: from [192.168.0.100] (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649ca4dsm176604255ad.76.2026.06.08.03.35.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 03:35:56 -0700 (PDT)
Message-ID: <af7ebadc-600b-4128-ba32-d45b5ba6b546@gmail.com>
Date: Mon, 8 Jun 2026 18:35:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/5] drm/verisilicon: introduce per-variant hardware
 ops table
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260608023237.305036-1-a0987203069@gmail.com>
 <20260608023237.305036-4-a0987203069@gmail.com>
 <399cd127b56b4a2fb3161865a681606e04e6b2c6.camel@iscas.ac.cn>
 <98eb7772-257f-4fa7-8e9b-51a635cb12dd@gmail.com>
 <340c213ca47dabb8bc3d260311e2fd4818bd8001.camel@iscas.ac.cn>
Content-Language: en-US
From: Joey Lu <a0987203069@gmail.com>
In-Reply-To: <340c213ca47dabb8bc3d260311e2fd4818bd8001.camel@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_033557_945397_B97737FC 
X-CRM114-Status: GOOD (  11.71  )
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


On 6/8/2026 6:06 PM, Icenowy Zheng wrote:
> 在 2026-06-08一的 17:45 +0800，Joey Lu写道：
>>>> diff --git a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
>>>> b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
>>>> index 1f2be41ae496..75bc36a078f7 100644
>>>> --- a/drivers/gpu/drm/verisilicon/vs_primary_plane.c
>>>> +++ b/drivers/gpu/drm/verisilicon/vs_primary_plane.c
>>>> @@ -53,12 +53,6 @@ static int
>>>> vs_primary_plane_atomic_check(struct
>>>> drm_plane *plane,
>>>>    	return 0;
>>>>    }
>>>>    
>>>> -static void vs_primary_plane_commit(struct vs_dc *dc, unsigned
>>>> int
>>>> output)
>>>> -{
>>>> -	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>>>> -			VSDC_FB_CONFIG_EX_COMMIT);
>>>> -}
>>>> -
>>>>    static void vs_primary_plane_atomic_enable(struct drm_plane
>>>> *plane,
>>>>    					   struct
>>>> drm_atomic_commit
>>>> *atomic_state)
>>>>    {
>>>> @@ -69,13 +63,8 @@ static void
>>>> vs_primary_plane_atomic_enable(struct
>>>> drm_plane *plane,
>>>>    	unsigned int output = vcrtc->id;
>>>>    	struct vs_dc *dc = vcrtc->dc;
>>>>    
>>>> -	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>>>> -			VSDC_FB_CONFIG_EX_FB_EN);
>>>> -	regmap_update_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>>>> -			   VSDC_FB_CONFIG_EX_DISPLAY_ID_MASK,
>>>> -			
>>>> VSDC_FB_CONFIG_EX_DISPLAY_ID(output));
>>>> -
>>>> -	vs_primary_plane_commit(dc, output);
>>>> +	if (dc->funcs->plane_enable_ex)
>>>> +		dc->funcs->plane_enable_ex(dc, output);
>>> Please note that all theae codes are for primary planes, maybe the
>>> helper should be named mentioning primary. Overlay planes will need
>>> a
>>> different codepath because they change different registers.
>>>
>>> Thanks,
>>> Icenowy
>> Understood. To avoid confusion, I will rename `plane_enable_ex`,
>> `plane_disable_ex`, and `plane_update_ex` to `primary_plane_enable`,
>> `primary_plane_disable`, and `primary_plane_update` in `vs_dc_funcs`,
>> `vs_dc8200.c`, and `vs_primary_plane.c`.
> Maybe keep the `_ex` here as some operations is still on the common
> codepath?
>
> Thanks,
> Icenowy
Got it. I’ll keep the `_ex` suffix in place. That way it’s consistent 
with the common codepath operations, and the inline comments already 
makes the intent clear.
>>>>    }
>>>>    
>>>>    static void vs_primary_plane_atomic_disable(struct drm_plane
>>>> *plane,
>>>> @@ -88,10 +77,8 @@ static void
>>>> vs_primary_plane_atomic_disable(struct
>>>> drm_plane *plane,
>>>>    	unsigned int output = vcrtc->id;
>>>>    	struct vs_dc *dc = vcrtc->dc;
>>>>    
>>>> -	regmap_set_bits(dc->regs, VSDC_FB_CONFIG_EX(output),
>>>> -			VSDC_FB_CONFIG_EX_FB_EN);
>>>> -
>>>> -	vs_primary_plane_commit(dc, output);
>>>> +	if (dc->funcs->plane_disable_ex)
>>>> +		dc->funcs->plane_disable_ex(dc, output);
>>>>    }
>>>>    
>>>>    static void vs_primary_plane_atomic_update(struct drm_plane
>>>> *plane,
>>>> @@ -133,18 +120,11 @@ static void
>>>> vs_primary_plane_atomic_update(struct drm_plane *plane,
>>>>    	regmap_write(dc->regs, VSDC_FB_STRIDE(output),
>>>>    		     fb->pitches[0]);
>>>>    
>>>> -	regmap_write(dc->regs, VSDC_FB_TOP_LEFT(output),
>>>> -		     VSDC_MAKE_PLANE_POS(state->crtc_x, state-
>>>>> crtc_y));
>>>> -	regmap_write(dc->regs, VSDC_FB_BOTTOM_RIGHT(output),
>>>> -		     VSDC_MAKE_PLANE_POS(state->crtc_x + state-
>>>>> crtc_w,
>>>> -					 state->crtc_y + state-
>>>>> crtc_h));
>>>>    	regmap_write(dc->regs, VSDC_FB_SIZE(output),
>>>>    		     VSDC_MAKE_PLANE_SIZE(state->crtc_w, state-
>>>>> crtc_h));
>>>>    
>>>> -	regmap_write(dc->regs, VSDC_FB_BLEND_CONFIG(output),
>>>> -		     VSDC_FB_BLEND_CONFIG_BLEND_DISABLE);
>>>> -
>>>> -	vs_primary_plane_commit(dc, output);
>>>> +	if (dc->funcs->plane_update_ex)
>>>> +		dc->funcs->plane_update_ex(dc, output, state);
>>>>    }
>>>>    
>>>>    static const struct drm_plane_helper_funcs
>>>> vs_primary_plane_helper_funcs = {

