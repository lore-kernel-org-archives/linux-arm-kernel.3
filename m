Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B47E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 21:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yF3vBmNZS9MU6AYhmkZOCnnb/mhvQHCH0jIPUUHFQrU=; b=aGUEjMexbqbmOzrdqMtfd3F+C1
	2C6JB05Aeqw7ohxwfY3RzTjUrSQtc4a5+bQPgHPrw8d/S+heWxyHVU1cw8u1YXghB8MmHt/saNWup
	a3m89ZTtL0pA9VWmJmJ+KzjMQsDbK8Ha2AC3GElI9t/vXSt4d4bUBFqGhpb1F0My7YoQ6osBaCQ/t
	X8f8DVOTy5y8QAK932woeC5OKwMByHMXL7vomzzyUcRatVPEjVPM29TEP8aMIHXTtgmqzvrJbVsY4
	aX6EBfy2gJAqpmcZjyIo5BTfoOOk9N00fPHifBO5eNRAOLJ09QIwHrqgXk1POd9yHQCYbT+Xsj/tt
	7kEYY85Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7fn-0000000CnTT-0bXE;
	Tue, 10 Dec 2024 21:21:39 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL7ei-0000000CnHC-1Uxy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 21:20:34 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-53ffaaeeb76so3337017e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 13:20:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733865630; x=1734470430; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yF3vBmNZS9MU6AYhmkZOCnnb/mhvQHCH0jIPUUHFQrU=;
        b=T7oA3CTWkcfbH4p2/IdaE7oNibBZ2AaKaeGSt/BFBCLETdvZqahA5OdpqCSbGTOBbb
         WWa2F9Od/e7V6LxTvoKDh4OWWfwruaJSe+bH6BZV++vE1uspxpAIOkf4sw9B14Jw7fTG
         OmwvA2auaR+I+nB30cA6y7BYTkyKh6SJiACr/BGJpHNwJ2ZHoHtHn+DxVbQxfgr3xG6D
         bcZTNh81pNKuwhneu/yq+kFBvRvLOIYEWKv5CtNJyYUt5ku28nstdD4ZpPGcbNLX3fDN
         QN9uIy3KFHh9fWG8/Rx5R5C/rpf64Wyb4YYmaO/nHoPcjwM5wfrpJ9Gez07SU+84YkZ/
         SzbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733865630; x=1734470430;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yF3vBmNZS9MU6AYhmkZOCnnb/mhvQHCH0jIPUUHFQrU=;
        b=e6g/G6hvN++FQpD0k1IcK5UGScTy+HSLNAmTGNDgunrc9K0iZNKQ76cXnj5lyIMLQ3
         L4wfg4VKcmBZHIOrywG2dDEUiSTY83R2AGgEi4W+cF179kuulIAtiyZM0beEAoJZ+VGE
         ltcdhAknSxkctxHN7KNrJpOwcIPOPlS5gFE4j9CG0bxrgJ0ZpR3W4ofbbr0Wh/IdTa3r
         bMRg0MWcZV71IuLsx/KaXE8LM12/WgDjPAKr+NYuSCuZ89k1Z9Ws+yVBzVpUCrjc/1/s
         jqRxwPVbDx7MHrN0fYnvY/5O0k4/VWhEVs/Gfr2zu4gw4hvp7ayK4/srz5gnKKsCLJuu
         8q2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXEIGKfyaFJTdNG/4nfU1q+DDTeGskVj+WAuUBj2wUfgxEeYQppTOkCM/4pygHbqLT1tWBbgCeHs46Inib3e3Nl@lists.infradead.org
X-Gm-Message-State: AOJu0YzbvtDE5AQho9C6vvsnWZa8AEHFUv9/gv3+0qytX5pTm2CzPxJh
	JbQBEDWzAIw329lACXWF6RMy6p6y43ClceV9yyMMLqW0V1PCX1fkZdhfmb5Mq2g=
X-Gm-Gg: ASbGncuwDqwRmv9khcLNgo1k8iTYbcMxpE+0oIF1HLJBLkBchcEh7JLnTvED03Dr96S
	xzndXr97Pt8xYy+2J6JgwJtC18CX4R61E+az5yo+MMz+tB8l4mtHS3aQuM96W+bdQdhhVbHGw19
	B0KnQrGIIv0S4XXoQvbRWMhqRZFud/1Cq8Rdn6USLO49uT/KitEQf6XUlBUJ+eojp+CTbIgTGOA
	SjGzhu1N4BM33uTVqcCo2Hh3Kui2rRXC1+dgEVF8nkDZe7XkFOpWq0AkbzZX/etEp+4TQhXtl/S
	fIi15fNyIwBHmwUrtZbqsQzXPTw4iJB7cw==
X-Google-Smtp-Source: AGHT+IHCODZIQ0z4mmWtV1wEX8j8zg9S/BNFluONyQd2XvnZpEGUwS4bPVxg3YoPJtWqjVmMgWar/A==
X-Received: by 2002:a05:6512:3990:b0:53e:368c:ac4f with SMTP id 2adb3069b0e04-5402a5d3d6cmr107076e87.9.1733865629981;
        Tue, 10 Dec 2024 13:20:29 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e34569209sm1395827e87.128.2024.12.10.13.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 13:20:28 -0800 (PST)
Date: Tue, 10 Dec 2024 23:20:26 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Xinhui Pan <Xinhui.Pan@amd.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Phong LE <ple@baylibre.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
	Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 04/10] drm/amd/display: use eld_mutex to protect
 access to connector->eld
Message-ID: <pgi7p3aemxm3db2k27vi5euh6q6ppayrw6y7tcfeq4g5z23hzr@xousag2qhobp>
References: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
 <20241206-drm-connector-eld-mutex-v2-4-c9bce1ee8bea@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206-drm-connector-eld-mutex-v2-4-c9bce1ee8bea@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_132032_442832_BEA33F60 
X-CRM114-Status: GOOD (  19.90  )
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

On Fri, Dec 06, 2024 at 11:43:07AM +0200, Dmitry Baryshkov wrote:
> Reading access to connector->eld can happen at the same time the
> drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
> order to protect connector->eld from concurrent access.
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
>  1 file changed, 2 insertions(+)

Harry, Leo, Rodrigo, Alex, Christian, Xinhui, any response to this one
and to the radeon patches? I'd like to be able to pick the series for
drm-misc and these two are not reviewed by you.

> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 19a58630e774029767bf2a27eb4ddf17e3c21129..04c68c320252b5ce9647f0606fb86fe57f347639 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -1037,8 +1037,10 @@ static int amdgpu_dm_audio_component_get_eld(struct device *kdev, int port,
>  			continue;
>  
>  		*enabled = true;
> +		mutex_lock(&connector->eld_mutex);
>  		ret = drm_eld_size(connector->eld);
>  		memcpy(buf, connector->eld, min(max_bytes, ret));
> +		mutex_unlock(&connector->eld_mutex);
>  
>  		break;
>  	}
> 
> -- 
> 2.39.5
> 

-- 
With best wishes
Dmitry

