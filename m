Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C03F7E77180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 11:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gty21mjzYgvbYsbhfcrs7XMj7b14Ja6LtCdRiQMw9IQ=; b=uC95U3vg5mr4hHmMl2BfNaCeaf
	UtW7J8wciCvwQdG323cCC/aMptUS9WBvPKBeut8rRbzf6Vq47cK1aYAVh4Cc3Orlc8fvdHcTxVSMD
	ew6NqIbkXMakjdxPsBTfyolVPRRFAI5J1/S9FaB5+gSSgwmK3P5WZoKgkudCRCpay5w8wfxSdfdt5
	oVM1GYuh6qHv9+vUaCPbSZhEwV/0Ip2vMByTCXY/pc/9WundiUC2AwT8B15KGx5YET3hsNELmSsGQ
	OTA4ibD78CY0ZmomwjaUsH9sQpsbwx+YT8i8bbgMTXTLtTc/dovoiBDKgt6DJ/1C/AgVMQiYCRmsI
	QlJdT0kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN9EN-00000009odb-0Rb3;
	Mon, 16 Dec 2024 11:25:43 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN9DG-00000009oVc-36ga
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 11:24:36 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-30229d5b22fso42259231fa.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 03:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734348273; x=1734953073; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gty21mjzYgvbYsbhfcrs7XMj7b14Ja6LtCdRiQMw9IQ=;
        b=m1kIlgQagRaFwnMRdoFbb/GiKEjznKRrzBf8Uc2fPUbfP7/2jxWQn5+fRZgkVjy9B7
         T6oeReS8HZgI0YSqk1Dum9Vl55XzlyFBoXBxMRA8emylZZ5nxA4LQ+CzKKXiQkbNWoEZ
         rSjIFGA/PyS6bAyfYk8TpckIhBQuCgvItwpE5u69WvFzkbCOswG5Rq2riWJ9NdNUpwEF
         GTQTTgPvGlXf6jWEcwemihUq9tR5m/zBOlO2+Hw6qWs1LABEzHbK0m/zfOe/w9Pu8BlW
         IgC8akqVuC3IvzfZX9vN6JBMMhl+bAHou3Qm6XzujyiZQgyX9wswRj6XOV4XX62yuntZ
         dJkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734348273; x=1734953073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gty21mjzYgvbYsbhfcrs7XMj7b14Ja6LtCdRiQMw9IQ=;
        b=f36sqWWalu6Bf6xzWYLBVQ/xlCggGBEHK3QFtvtS33XmOBnR6XAEfrqxJk7hspFai4
         9RYRPuFCdl860uWxKbA+0w2ROB0yX+hERU1nvETeNEw0FYRu+I9IGOtCn/0LtN7eRkEg
         Yry/PoD7oNZ57gbbS62/fnvJ61vbiefzOM7xWpPum+/+WyXmczJZ6/ZKZMAU9xpx8HS1
         jI5GFlwwEfPP4KEPaV2cDcwBXUbcru00Jq0GAfwYxCRLULYhqAPwcO9un76Lp/cvi45e
         NdGsIWtaKWgW9S3zqrlgoTM7urkbVW4dl4jkEWohunAeBd5z5MMkfxP2XW3IXfqlJRyb
         zr7w==
X-Forwarded-Encrypted: i=1; AJvYcCV4jFdA0GmI/FipE9s1+g65cwtfc5OxQE12EjgP43lgoomMiQxylYjiRIk9Js361Zb/eu7DFag1arYIBt664Ka/@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7bikb8Ey7cAOmrzjVxKoNIox5rTaDPNDnLSsZRU6zRPeBa6qK
	9qMWhD1vbq63hq0roFVez9lwt9ecjavOWIHMim0kwrC9Cuk4JO8i1FVAVL46EAU=
X-Gm-Gg: ASbGncsWTMqwW3LW7gW+pkeAlVgbIXg1+8OXXp0BSsOL1WwqlS5yDATtR2XHeOmxO4K
	x6QLb9/A5Iedf7uw55GiJPopQhb5Lc8sfQifIkUMvbKXbVVKaRoKotb0JH6lPCygru0jJOoZaP3
	j7TdBotnFUT8Ht8tpSODulPuJeTKgn0dOO8/S1gfHwck2t2cyLR4pyvc7Z50z607RP0ArhRigo/
	MYa0WizS4/xOQtjpGPcctlcNnkIbXM3hqQWAj7K6uk5jhHQXknSnWbYSRqTf/YAqJdVp3cipAR9
	sd6ywTuDqnRPDPD4DNPmuA6/D9a2NaP6B2Om
X-Google-Smtp-Source: AGHT+IHzioRjGIPfaVwEFSX3By+G0bPm5p1y4IolLwPf7YBpM4LUQ/QUZx/r1EiqpYtLRC9+8oUd8Q==
X-Received: by 2002:a05:6512:2212:b0:540:1a3f:e848 with SMTP id 2adb3069b0e04-5409054bce1mr3948864e87.15.1734348273018;
        Mon, 16 Dec 2024 03:24:33 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54120c1612asm817266e87.222.2024.12.16.03.24.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 03:24:31 -0800 (PST)
Date: Mon, 16 Dec 2024 13:24:29 +0200
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
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 00/10] drm/connector: add eld_mutex to protect
 connector->eld
Message-ID: <xchjpeykkqwlpniaspbzitaozuoltoq7aturtu7jq6z4lcxh77@y7t5ge2sa4er>
References: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_032434_799021_94987283 
X-CRM114-Status: GOOD (  16.64  )
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

On Fri, Dec 06, 2024 at 11:43:03AM +0200, Dmitry Baryshkov wrote:
> The connector->eld is accessed by the .get_eld() callback. This access
> can collide with the drm_edid_to_eld() updating the data at the same
> time. Add drm_connector.eld_mutex to protect the data from concurrenct
> access.
> 
> The individual drivers were just compile tested. I propose to merge the
> drm_connector and bridge drivers through drm-misc, allowing other
> maintainers either to ack merging through drm-misc or merging the
> drm-misc into their tree and then picking up correcponding patch.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v2:
> - Also take the mutex in clear_eld() (Jani)
> - Rebased on top of linux-next + drm-misc-next to solve build error
> - Link to v1: https://lore.kernel.org/r/20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org
> 
> ---
> Dmitry Baryshkov (10):
>       drm/connector: add mutex to protect ELD from concurrent access
>       drm/bridge: anx7625: use eld_mutex to protect access to connector->eld
>       drm/bridge: ite-it66121: use eld_mutex to protect access to connector->eld
>       drm/amd/display: use eld_mutex to protect access to connector->eld
>       drm/exynos: hdmi: use eld_mutex to protect access to connector->eld
>       drm/i915/audio: use eld_mutex to protect access to connector->eld
>       drm/msm/dp: use eld_mutex to protect access to connector->eld
>       drm/radeon: use eld_mutex to protect access to connector->eld
>       drm/sti: hdmi: use eld_mutex to protect access to connector->eld
>       drm/vc4: hdmi: use eld_mutex to protect access to connector->eld

Granted the lack of reviews from AMD maintainers and granted that the
rest of the series was reviewed and acked, is it suitable to leave those
two patches out and merge the rest through drm-misc-next?

-- 
With best wishes
Dmitry

