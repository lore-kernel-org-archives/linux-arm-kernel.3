Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D588E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 16:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gimIjr0V+IvVPSAkV2M5qKEwFz/7JaI3Yve9R66BZE0=; b=IJhq0fVq9WBgN/s8U/KM0ZcodH
	sj52ZMWG09n61cIMV4vUQJNfy/QIv05g3KlipIHjRB0w1kCrm33LxhpZuoOYITE5PG/eL4qSCeKvJ
	5V7RXBrwoqsBqGpycLJ/msaL7HWSMtgtOIfGtV2jXThpHb6z8iXbFwmX1fOuJot4Gj2RhxJ7XAx4Q
	OWR9Ns4p4t3b9/4YNIVJtMogs50zQ/cjxFfUzXefSfABsoMMhRQq6x+SuXf+t9EvKRsBVcJPagimi
	Yu7KWKNSr0x1IIBRq1o24+fj8Vh/7Omji8Z9xVClKlA2V79/IU3D8184CUvBdpwTNsFrk3BtK2fzW
	+ifeq/LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDgH-0000000AWS2-0jXj;
	Mon, 16 Dec 2024 16:10:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDeQ-0000000AWAs-0D9A
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 16 Dec 2024 16:08:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gimIjr0V+IvVPSAkV2M5qKEwFz/7JaI3Yve9R66BZE0=; b=fXkOqQD81Yux/d/Nn+HipOlXIV
	luk4bv28dpMhHN2mgyHsgLTk4cEdMNZ1OwSNB3Ku2pK6UhKhoySB7jQTFS23/6pG+Pqo6ACkPMYYl
	jYH9zHsbcnQQeN/UUCh+8Pn3+xFBb/tUvI+93LhIRvjhlZznrC1RSUlLtCcxWJz8rnndyMdHDSQrT
	kSqSVuSYtb/pLyrpzjT2tND0Vhx6Whqw2hMy6IjhA0bCRczJJaQRijYOw1zP8bMTuvf+tAIhAs8Lt
	DtLnMfdvQ12v84cgH7mkmPu56ORToqr9AzMOpHzcrCW1M60W2PNAU/rwokGPbjpHCbgpM/c3UTTnA
	SQCmd6ww==;
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNDeM-00000004tZZ-30Uy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 16:08:52 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-300392cc4caso51088081fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 08:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734365327; x=1734970127; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gimIjr0V+IvVPSAkV2M5qKEwFz/7JaI3Yve9R66BZE0=;
        b=YFNT5hWN8zvUwQBMG4oldTXqJq3K/yeJiIAoaTagRfYw6r6Tcxt0wWphovw91m5wWl
         EctjgyyAix+rrH/JbL4BRAkti6T9j+k1FpV7Us3nRR51dG91jl+LAxkpP+itkkjscBhG
         LtnQITqNcFhnmzxXv/MfBNqoaLdaVVb9P8LmdO4sWAmltTucX0C9gznjaR4SPFZvtZCU
         HBI/TxtvCaEE/PeveRYl63bzr2T4j+5Twf4VUUyYqnXWkFt20QYJtFHguQ3fdEYeybZX
         +b28mhGZpw/vjv9XnR5WpSOpbOHzaoNTI0l88JoM6sED2FczWrSZdONTEBsFPyVV/FF9
         /M9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734365327; x=1734970127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gimIjr0V+IvVPSAkV2M5qKEwFz/7JaI3Yve9R66BZE0=;
        b=ifjG+IPoB0Cmquq/qM998WNdfjN6BaecWPPk5iqsaN3CsZ4dZTzFqX8zcnFluNqoTM
         NaLx/ulF1I6JNXuyX8n18t/5r7QFQdP4sBsGqfOEa+N6BVLGViAs7SoIA2zlGp0HcwuP
         qQMkawYGll7jZWBUTvuANFLVKd2D90hmallTGAvXak6zqhNIgDU0R10hqpaZRf6y3EFI
         it/jQKfGvVf6i5RTR01lD74rwhjvUWIPIk/cNO3FIy8B3S4rqYCv4R2GKxvhMyVRdOIo
         urSKajhDn9dHGxFgpelZ2PKc0uQ4m2H52pm2rovtnP+JWRZCVAtxiTPx35tPtstcU6QH
         ubSw==
X-Forwarded-Encrypted: i=1; AJvYcCW7uDxD1oKf382qa4QIvKcGM5XSpIY5y4CdEextYeDtkGH1VzUE+E7AKDsl13QBFLXc1dSYFokYKq4o/raFGdwY@lists.infradead.org
X-Gm-Message-State: AOJu0YxcWHoH9xu3kc7TLfDwPcfTWXlrPLaiALEFdeETu0KlUy3zjS06
	rlV2xNBGBdGmUcosH8d0LBb0+kT1uLf4rzpPU45cXVmtj/Gupywc88gc3/psDMc=
X-Gm-Gg: ASbGncuvCMo1JUHMOpZtqU89zeyEw2e+nWyZv83HvwE3VSSKRc5/nlmqkY8ol6aT05i
	HXaL26CNTm56si4k7M8LYJg7r6OUnNyEgQGXUV1xSfRP77K2RGgVozt0fe/0ZoHgxjSQrOry1Pv
	IMhEgeGuDe7E1xuRm6rV0HwXgPVY0CZvYDOVACDqZ46U8UEAE5PFdG3/Y2d6LRqp5K8IMQV2ndb
	KBBLE2SpHW95inC9Os29G3mCGgoAWmQsTDBg1J/93/jGd5TvSfTc/OQuxvwbZBNLxyDX+KimOHo
	OYJ9dacZV7W823j0hyMLmb4k
X-Google-Smtp-Source: AGHT+IEyHnHgkF8cGHfAxniJoLZXJ011DOlAgQIhnT5vzkhPcJthnAGY9LbeypdGeJjm5mrh2qegoQ==
X-Received: by 2002:a2e:a591:0:b0:302:17e7:e17e with SMTP id 38308e7fff4ca-302543460f4mr50630091fa.0.1734365326654;
        Mon, 16 Dec 2024 08:08:46 -0800 (PST)
Received: from eriador.lan (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30344175ad0sm9665241fa.84.2024.12.16.08.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 08:08:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Harry Wentland <harry.wentland@amd.com>,
	Leo Li <sunpeng.li@amd.com>,
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Xinhui Pan <Xinhui.Pan@amd.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Phong LE <ple@baylibre.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Raphael Gallais-Pou <rgallaispou@gmail.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v2 00/10] drm/connector: add eld_mutex to protect connector->eld
Date: Mon, 16 Dec 2024 18:08:41 +0200
Message-ID: <173436531753.3257291.12458012077695445848.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
References: <20241206-drm-connector-eld-mutex-v2-0-c9bce1ee8bea@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_160850_926783_EE7D68C1 
X-CRM114-Status: GOOD (  12.39  )
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

On Fri, 06 Dec 2024 11:43:03 +0200, Dmitry Baryshkov wrote:
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
> [...]

Applied to drm-misc-next, thanks!

[01/10] drm/connector: add mutex to protect ELD from concurrent access
        commit: df7c8e3dde37a9d81c0613285b43600f3cc70f34
[02/10] drm/bridge: anx7625: use eld_mutex to protect access to connector->eld
        commit: e72bf423a60afd744d13e40ab2194044a3af5217
[03/10] drm/bridge: ite-it66121: use eld_mutex to protect access to connector->eld
        commit: 39ead6e02ea7d19b421e9d42299d4293fed3064e
[04/10] drm/amd/display: use eld_mutex to protect access to connector->eld
        commit: 819bee01eea06282d7bda17d46caf29cae4f6d84
[05/10] drm/exynos: hdmi: use eld_mutex to protect access to connector->eld
        commit: 5e8436d334ed7f6785416447c50b42077c6503e0
[06/10] drm/i915/audio: use eld_mutex to protect access to connector->eld
        commit: 5db44dd1528625c73a31542df2a68972327c9897
[07/10] drm/msm/dp: use eld_mutex to protect access to connector->eld
        commit: 9aad030dc64f6994dc5de7bb81ceca55dbc555c3
[08/10] drm/radeon: use eld_mutex to protect access to connector->eld
        commit: b54c14f82428c8a602392d4cae1958a71a578132
[09/10] drm/sti: hdmi: use eld_mutex to protect access to connector->eld
        commit: e99c0b517bcd53cf61f998a3c4291333401cb391
[10/10] drm/vc4: hdmi: use eld_mutex to protect access to connector->eld
        commit: 81a9a93b169a273ccc4a9a1ee56f17e9981d3f98

Best regards,
-- 
With best wishes
Dmitry


