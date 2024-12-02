Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC26AD78321
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 15:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qujM4d7qCY1L5TaGGSMsXfZ1apvo+jAfsCE8VLdjQ4I=; b=Z652Q5gC0A26Gc6bzgc6C+P4PK
	fJ1mmeBcJmkILRie8hio9xndlrClPHHwTOfWeamk99UPPjvg/kaIo5UTZnEBi82OxWeIXp35/ebNy
	ecIZeUSjhBuQi2mJu6rYhJNP3ReI7ZQszzqnxXPb8jb4T+v/l/Sc5Ul+xW/udCf/5GJWgd/EV27B0
	RpsexRg7uL4BuRLYlzrwkdjWp2nPWHQ37k1FSiftdTZdOKKkvF5lUf36kDcb2Iwhmck8/mvf3kBP+
	tnDL55dIB/0UAj5PJWmWQrsV7ttQniYXkeUM7lUPH3N8MibD+4o9PxrUMMQ5uw0/NlhYf4clRTYtV
	d75lqkJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7yl-00000006ZMH-0ef7;
	Mon, 02 Dec 2024 15:04:51 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI7xl-00000006ZDa-20Rb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 15:03:50 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4349fd77b33so35397685e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Dec 2024 07:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733151827; x=1733756627; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qujM4d7qCY1L5TaGGSMsXfZ1apvo+jAfsCE8VLdjQ4I=;
        b=ej91WQfQOl0YxVqSpP1YUyHQBW5Xjt7kBBfoOESW26B6gtQrrjtnkkt8HzwHQuU2/S
         3gDgEajvRc9mhWwgZ3pzu+mbu1PnpaXCMzjHV5coG7wuoHuqncFA2jGcV+pWGtBgCp6P
         DMzA12/F/mfu9ZiSPS/37H5jBT8Phhr9cEVuVH0qYWU3uM62/Xtms6J4QKfTTryfKUyC
         XKR8gqpe+VmhWt2daO3ET3oFL7cR9h8ve7S03n0MPI9kdP5Dfq/sAo7dkNChw+bIf38U
         0HN79KHbZ3HUAzRiyBxsEhjj+uZRBzDSNONHLNztsB2jSiH5rMHfJb1U8Jq/MmFv6Xvl
         DqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733151827; x=1733756627;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qujM4d7qCY1L5TaGGSMsXfZ1apvo+jAfsCE8VLdjQ4I=;
        b=cbD9LQB2zru4BSS2UKviFKz5o6IxBuOHCkAa5Dq7wPFZuO+ud0m2OofnbyOIvliCv+
         WKfI/hWTt3EG/jxi08cWqyza6FK13LyZGFyypvrhYM9rSEB6EabBmo4ltzE7rfLRz9gj
         BtkvtNPWJnkREIvjpB1uYNco2UhSkcU53SYdcszVIA9cPaUBuzm5ea25z+6JL3JuZmny
         Oq31i/N60CvDcQ8c12ZWT37KZmlrUW2mdxPvJYiwWImQPZ5LsVAguzyWtJ5WkUHoktsH
         LhmkFG7Ix8p+ekw/R0vLvrtoAsC2PbDhcvU3qWDaY5lh5j6UU3Z1m1GLZtFJlJhp+BZ4
         FRbg==
X-Forwarded-Encrypted: i=1; AJvYcCXgyaUJ+R3Dat5GuMcQqiGIpw4C/5nZeVfoAUUWJUVC3KeQR90t2WWIDgW3HCB9jWHjmKUY5Y3GeoTaVzuMbhhZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3vl0xirLZyx/Ljkpeh8R3pOXDyORgl10UY8X9VpHtA7pRAW8y
	vVSOLNZXwZZ2XTOKvmg/SlT/R4bWoD9l8zHDQJIQYnyuOUYEUxVQ
X-Gm-Gg: ASbGncuG94Ov4gQbJ0keMFsGvKoatF9wIZANHwp2KDlzsp9nA/9Cr2Qr1BTWm1Yc2Xq
	orfx3M2wTXiRkbV+RJ81jVGsLs0YHIvIFEBOwPGR6wDCKHW6CrnHoUSdVyDEXth3cRNYNEsbtpf
	eWehP1Avejo2KlYKZDj4TRoGqjJjCNs039g8MA3qEyGVduM7fOrdiqcYTt+wkleh3WnNOS97iOC
	PbhkF71aSpItoyosYrFyAXIgo0gSY4ITvmhGPLYl17y2cHQnKWvqL89DW4wZe5Xzgmu1wxutHdU
	2Nt1FjQshCrF6hry9TQ=
X-Google-Smtp-Source: AGHT+IGDnqoQPM9S2ZXAYcJFrCBwMFmcYVdD5NrlXMVFXBAOrzgALnyLT6wqVMw+fFjssl311bGusQ==
X-Received: by 2002:a5d:64cc:0:b0:385:f092:e16 with SMTP id ffacd0b85a97d-385f0a153ccmr4698133f8f.55.1733151825042;
        Mon, 02 Dec 2024 07:03:45 -0800 (PST)
Received: from ?IPV6:2001:861:3385:e20:6384:4cf:52c5:3194? ([2001:861:3385:e20:6384:4cf:52c5:3194])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385ec6a3d8fsm5080310f8f.101.2024.12.02.07.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Dec 2024 07:03:44 -0800 (PST)
Message-ID: <0eb908f2-2304-4a91-9c91-e7f291da9dcd@gmail.com>
Date: Mon, 2 Dec 2024 16:03:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/10] drm/sti: hdmi: use eld_mutex to protect access to
 connector->eld
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar
 <alim.akhtar@samsung.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alain Volmat <alain.volmat@foss.st.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
References: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
 <20241201-drm-connector-eld-mutex-v1-9-ba56a6545c03@linaro.org>
Content-Language: en-US, fr
From: =?UTF-8?Q?Rapha=C3=ABl_Gallais-Pou?= <rgallaispou@gmail.com>
In-Reply-To: <20241201-drm-connector-eld-mutex-v1-9-ba56a6545c03@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_070349_515024_D9EB16D0 
X-CRM114-Status: GOOD (  16.12  )
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



Le 01/12/2024 à 00:55, Dmitry Baryshkov a écrit :
> Reading access to connector->eld can happen at the same time the
> drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
> order to protect connector->eld from concurrent access.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Hi Dmitry,

Acked-by: Raphael Gallais-Pou <rgallaispou@gmail.com>

Thanks,
Raphaël
> ---
>   drivers/gpu/drm/sti/sti_hdmi.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
> index 847470f747c0efad61c2ebdc3fb3746a7a13a863..3c8f3532c79723e7b1a720c855c90e40584cc6ca 100644
> --- a/drivers/gpu/drm/sti/sti_hdmi.c
> +++ b/drivers/gpu/drm/sti/sti_hdmi.c
> @@ -1225,7 +1225,9 @@ static int hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf, size
>   	struct drm_connector *connector = hdmi->drm_connector;
>   
>   	DRM_DEBUG_DRIVER("\n");
> +	mutex_lock(&connector->eld_mutex);
>   	memcpy(buf, connector->eld, min(sizeof(connector->eld), len));
> +	mutex_unlock(&connector->eld_mutex);
>   
>   	return 0;
>   }
> 


