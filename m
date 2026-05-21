Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5A2CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 14:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=REP4STaURwNBwYLUxnT2eThrBHI2vGspRNmg6btJygo=; b=USsX6PftQVHIvHhu5QT6PEsula
	3dsnmFur6aAsalZsRFUS5+d1XF8g/8DK+3aIT67Pfs04dN8a+pWvd5YWlfWe3HGb8XQ9ciDwQ93hZ
	1I41l+gHqkmGTQolqiOMI+IyiuLM0QwZahxDp1zpF2hkZ8cPgw4z8UjQ0sCaIOjp7CvPBAXA4V0B+
	aFesyrw+aW+yM4lib026XZMubTvV7u9SzPaL25YK9plLI67uYDEWMLhYXl6tkwz36ESH0AH8Agx++
	Q9VWmxloiRPs2Fsl6eMBPVShwkW7esS6ohpBiVl8VLMKho9LiU9q99roPLGqVvultpbzfrAo8s5DQ
	tXxh4zfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ49H-000000080pt-4AV4;
	Thu, 21 May 2026 14:13:20 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ49A-000000080nj-0MPu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 14:13:13 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-83ec36a13e9so2957960b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 07:13:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779372791; cv=none;
        d=google.com; s=arc-20240605;
        b=izz6WVtT8tzzL6mMjDtT3hQUpLOB/nv0iKZdlcb25Du8b//BmDoHI5UvbEg8ZMjsE+
         CpqWaR0Bl9FNMW4SFru3WELLk2VQxAI9WwTMztfJfQLfgVJFzu39KSjSbvnQULluvXst
         8KNUEoe9iz1j0B/JaT3uDkh6h7sTB2hAYA89mLpnaYH4x8DFw6Se3Pia25v48BmgzrMY
         cyxWUZaLU82fSs9rzW3lHCP2RpUABuWa609u2Q/cL7bk11efry7JxeT0xCWtqHlUEx+a
         tTk+GiaEOBBhbss0xHpv6+6PWW01TXN72Q2oi/aXn1tvAiEFTMLmxVSf3hfo0P+JMiOQ
         lwIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=REP4STaURwNBwYLUxnT2eThrBHI2vGspRNmg6btJygo=;
        fh=ii8jh9km0HvSrSUApOlb2HVpmiezzS68aLjupVuYPTA=;
        b=Y7QJA5s5XWeBKKmkLEHuOlBvnxOJCiDLDncZlApMfizcr0WaoV/t0B44mbzDid3SdA
         VfCI93UGrvbULFfzJRJSfJHtCfnsLkXqdQciMwtLZ/amulQMIcc6NyehT2Ik5ZhB4rMA
         1S/ice04dPryPBqsVGPrNxxOnjDCM3u8AziN9l6DbbDo/oHqWf6kTQGPmWqc26JDE36s
         mnS/iOBpz7K56X/uGKjgXlZJYvV/grjH0orbaLjPLZA8FTjr6it14E4udb1wkTr02GOh
         EXWYAKgMPLDqio/TafFSLjJrbCSkRcxS6YjNgiJCK9bGKMaNn8kf+73lqy/EUV/x+cm8
         JdtA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1779372791; x=1779977591; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=REP4STaURwNBwYLUxnT2eThrBHI2vGspRNmg6btJygo=;
        b=GUutfOcRES/snWK/YVyKOW+mztLP7OrYvWicOOTeOdznQNrLmm1y3WpUZQxC3fDGaw
         9WDsDTfsTp/DrMgJxTjbOFrcM/fHxn0fTPAK6ItIeqD9qT8B2UJiHGcXIT/UIeYzn2vZ
         SX1Fkn8GMZ+BduUTbJZFYv/cZUf4GCoagBcllphyrQRS6l1Kw2BV12ZgjEnMmeyqVdYY
         eP3Uv2Ue4mLXUfxaA4RfwroJS3c/g70OJs5Zk5YE9Lu45fVOgBoYLmnl4luokH/zHoxO
         Y/GbB8AGaAyvuRbgy8eC0Cc+KU2jm8YCD+P30D5jI7xHTyxVHnab5tQULKABb60W2flr
         phuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779372791; x=1779977591;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=REP4STaURwNBwYLUxnT2eThrBHI2vGspRNmg6btJygo=;
        b=MfZEAg1trjlyL1hLar+s97erIzV5yzeZU9QKEK5mLqRhM7xq8Mv0z1vPlw9WLgeQ5O
         /UoTa06frHEREUlf6501jCzS9pjpgzyHgjJjDP/pooBUjuL5RTJUcIwtXgvc1z5scuNW
         JFVKhmpaMJsxSIo+a8rWD+L/lglCTT3KO15xavtWOMLOZPLS7AsmfybviN3ZvmhQR5fi
         /QWrW8GENshnhoYD1lUhm1vBJ+7HAwXL7XtV/d2csMWseHvj5nSnZVY36Sw3Ho7AzwyL
         YTbFxPW+MYV88mGrK9/489tiH2cSCgQhEbkJQoq71d1VKSbca3DFmrf68ey4dkwmtQo0
         QCrg==
X-Forwarded-Encrypted: i=1; AFNElJ8t/25UGvkAbPq92Ux2ErbYHfqSNz2IaPi/Twv24d5hQfWi3Vz+1IGocQL1RwwbTsmaGAj2hx/DPQjbjvcGvVWh@lists.infradead.org
X-Gm-Message-State: AOJu0YwDyqTOBF2ZzWSpWnFUov6StZc484L82oIG9MBmpTHx4VIj+bf4
	HJ/CwXTblMI0ChkMDTzscIjPmBUSrtp9FLGnc0GA2v8PwRxXdooAgeSh6UxtbB61EgntGWObGZh
	Wg5WBi8MGu7cgCtTg7fkp1MfjkI+T48RGJspDEV4zoQ==
X-Gm-Gg: Acq92OHVvHchCjw7Ew3z+ikxUlj3R1C8Ra58kaWe5OkIJc8yqFIumb/cv+Gt52JbYBq
	+CWRUxDnsduiwZfQ9KCmGijbIam59kMJEFn31Wb0PV7W58Y0yZfPMeXBK+M9pzxdPD2vte7ML3S
	7AITOaRHx15MlFkcm+EyOFbPOVo6lEsBrd6z2slnJxk9YuajoxIBpu5SfN0v1bGM+7CkdjK20cO
	i7Gi94/8K3gVMjaPGh3XHjVD2Rd2CsSzp+BNyDr/ew+Flp5gkDY5P9uaE3P7TP4VzV/DCvSOQpD
	WVMOhmQmlM3U4RSa1SdHUhp9wxRSJQvodPfWaQ8=
X-Received: by 2002:a05:6a00:170c:b0:83f:2568:d45f with SMTP id
 d2e1a72fcca58-8414ae0067emr3410992b3a.23.1779372790773; Thu, 21 May 2026
 07:13:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260423-color-format-v14-0-449a419ccbd4@collabora.com> <20260423-color-format-v14-3-449a419ccbd4@collabora.com>
In-Reply-To: <20260423-color-format-v14-3-449a419ccbd4@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Thu, 21 May 2026 15:12:59 +0100
X-Gm-Features: AVHnY4IhuE52xfR4O7ZsBvGU9UxEW_nGPaKeUuOJKbLW6yd-ftNZQIcte9EpFTU
Message-ID: <CAPj87rOgkSAhVzzHyuKEGPxVYeDhJKLGVNrBA2BkG00gvMJjYQ@mail.gmail.com>
Subject: Re: [PATCH v14 03/28] drm: Add new general DRM property "color format"
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <siqueira@igalia.com>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Sandy Huang <hjc@rock-chips.com>, 
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, kernel@collabora.com, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	wayland-devel@lists.freedesktop.org, Werner Sembach <wse@tuxedocomputers.com>, 
	Andri Yngvason <andri@yngvason.is>, Marius Vlad <marius.vlad@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_071312_281637_BF5C8B77 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
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

Hi,

On Thu, 23 Apr 2026 at 20:04, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
> +       } else if (property == connector->color_format_property) {
> +               if (val > INT_MAX || !drm_connector_color_format_valid(val)) {
> +                       drm_dbg_atomic(connector->dev,
> +                                      "[CONNECTOR:%d:%s] unknown color format %llu\n",
> +                                      connector->base.id, connector->name, val);
> +                       return -EINVAL;
> +               }

Shouldn't this already be ensured by drm_property_change_valid_get()?

Cheers,
Daniel

