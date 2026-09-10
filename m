Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A4FC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 12:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=csxrJaNJi4tIfZjrD+uNlOFumjNYljFKlQuyLO7kEBc=; b=29njlS9FMQShRF8aO3QoshBf+2
	K15OmNyIiOiq5JcNJfy+ih1ac3wCEyX0DQGP5xST9v70vnoR3t3mB3DdNH4Dwm9ChwF8vsXiTmmdL
	5H/vgLhVYPv0qDGZeNzs0f3QxICg50pheKD9EvpNKY/ZjUWVC3DKj4DCv+1fiTSRGn62ZsXO/mWAC
	grouHCW5/67SA+/a++avOi02KPRD3yBS3Yv02gkVu7oZI529Op8u/XrqFDF6PaKcpavZzUd/AfQuA
	6lU4fx99CeTUNsjt0Tf9IysZYuOI9iqjKVE3s4vt9tRrwejKn9UizY6akc1OI/NOr6LD+ER+XB4ZF
	Zc3oFy+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dW6-0000000EI7n-1pzf;
	Thu, 10 Sep 2026 12:04:34 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4dW4-0000000EI6o-1lKc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 12:04:33 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49cd82be878so4195885e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 05:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789041870; x=1789646670; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=csxrJaNJi4tIfZjrD+uNlOFumjNYljFKlQuyLO7kEBc=;
        b=fKolcgWsGyG7SwehjOYUTWci4wAnKzTiJAmpHebYLLL6ZdGxvRpkLwXZ39RZTbJeO1
         PHK4WtihTVIx1/vnieQ4Jzlk1Jh6VI7N9BkxoNlL6C/8NHglgw8EjUUWHWrIhzhCxke+
         6viLoMcaNDz1yKKfOatRzzZ2yifWDiPyV4U5WoH8iULAxefE5813WJNPcTcmuOflpLB3
         /8Y/9H2sPai2j4JEksSo/2BLf4xray5vtZ/P34s/HZECO8ylzyODzva/4wp6ZX1MTW0b
         Kmt/X9g9WEpzsiiNX4GXei/F9m8qWoKomgrRVYZGs3ba4A0FtOVdEksV1Yowz/+Fl5xW
         yQFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789041870; x=1789646670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=csxrJaNJi4tIfZjrD+uNlOFumjNYljFKlQuyLO7kEBc=;
        b=hgGFAzr2U+T1IL4XYDJefRSI8IL5as9do4VGd3ypjExIUIN/+S7UD8ctw4tOwEktfF
         0f1hm/fVr/RyBV0lwcPExU/MpNod6giUHstwpZikWTNWQOA6/CUfmCm7q710MSiwg0Es
         3WeG1ta7Fk65dAWY+ElvnEK/PUbwkTCp4zNhLCr7uIk1GjO1D0WyL/AasaC7XtaomfKH
         NVMGWRR/6g9ylrbLheLa/QqgPONolyLH5JIfLuyKSlzel3BP5FS50m/dVu7L9S7gDFHz
         F9jjzHJD4Nb/9SplxAlnLTOXfCZSvpBFLR/NXEMDhZLdEU4nsGaYVeJAgwWdNyugXV8N
         NCTA==
X-Forwarded-Encrypted: i=1; AKwUvByi0BTAntLb1GsNfz0/I9GjMHC3vcCb0Gh8AtQtVBijC46veGkyzly2cNOnS/B6nXyn9MRd4mMZzo/7PLKeL1Fs@lists.infradead.org
X-Gm-Message-State: AFuF++nr6w4fDOGYJomeuTysvstpTuxranhYMVRlJ/xB7RFhsYj1PE8l
	t6Dfg8a/OerLwdMzMvO1XsrqmjzFTHNT0aYAy4QVFZAX6hCHcniPrhtF
X-Gm-Gg: AYBFou2xxtHzWuq6f6tzNP/fO7R+kpfG9j7gztjt2h/bT7Tvr2DKHGuNkU9cwpyVVU0
	Uv/kUF2rXZWVmgQWAAFGzaYL0/vAEHOZuO/aAN67JZKXyhh8tn3tEznHMn3nB12uwT8kA4TIvJZ
	PMRUkqG9KpYuOYvnEJXSjQ5gAakCoIgfMLOrVLJJKv3mZdIwFNVZb6Z13rh5cUKqHNPv/de1qEo
	tRq8jKI7kx2LoQsKQjo3wahQFir9p1gYMPuWLBSvs/zjdQwpW9V+6JtntKCzsEjSh7JYrZw/qn1
	RdNK7qZ8g5Pg8HWtcs7n6CmRmWlkrJPtJEI3slbgvDIPzSl7z4yMHiH3cgCsvWuPRq85nXKords
	w7CkY6bfEAPVozh+BUcFsF/51T4yBraa++mkxpU3hcz3opz8D2CuhEV+xI1qFsrQ7eSQKQdbrYy
	cnzGM6tQpiRPJpA+Bsb/5TZLWaeg04N8lPUc9zPRsaszTckYoxxgi3X6aedGZAdxB1d0cDG5VJE
	S5MVSRhZXCxaypIdSjb90JWT7GC6f1J3mrF7wWpoa63QxWoVbPbBmjKMrUEd5c8Mc2i/e86SNDl
	rBid
X-Received: by 2002:a05:600c:c494:b0:499:d95a:41f with SMTP id 5b1f17b1804b1-49d010c3969mr308061045e9.0.1789041870300;
        Thu, 10 Sep 2026 05:04:30 -0700 (PDT)
Received: from OrangePi5-Plus.BB-HOME (20014C4E1B9146001C92980EE71198AB.dsl.pool.telekom.hu. [2001:4c4e:1b91:4600:1c92:980e:e711:98ab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48591eb3d3bsm34529530f8f.0.2026.09.10.05.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 05:04:29 -0700 (PDT)
From: Igor Paunovic <royalnet026@gmail.com>
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Maxime Ripard <mripard@kernel.org>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Igor Paunovic <royalnet026@gmail.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sandy Huang <hjc@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Sebastian Reichel <sebastian.reichel@collabora.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Ville Syrjala <ville.syrjala@linux.intel.com>,
	Imre Deak <imre.deak@intel.com>,
	Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Subject: Re: [PATCH v2 3/3] drm/rockchip: dw_dp: Attach "max bpc" connector property
Date: Thu, 10 Sep 2026 14:04:06 +0200
Message-ID: <20260910120409.63850-1-royalnet026@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <388fd1ef-a8c9-4419-8bf2-10af7063e734@rock-chips.com>
References: <388fd1ef-a8c9-4419-8bf2-10af7063e734@rock-chips.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_050432_472194_6C760092 
X-CRM114-Status: GOOD (  13.20  )
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

Hi Chaoyi,

On 9/10/26 10:16, Chaoyi Chen wrote:
> Maybe we should consider adding a new "DRM_BRIDGE_OP_DP" :)

Works for me - it keeps the HDMI-only wording of max_bpc and makes the
check explicit. So that Maxime and Cristian have something concrete to
object to, this is all I would give the flag:

 - DRM_BRIDGE_OP_DP: the bridge drives a DisplayPort connector and
   fills in max_bpc. Nothing else is read from it for now.
 - drm_bridge_connector_init() treats it like DRM_BRIDGE_OP_HDMI:
   at most one such bridge in the chain (-EBUSY), max_bpc must be set
   (-EINVAL), and the connector gets "max bpc" with range 6..max_bpc.
 - dw-dp sets the flag and max_bpc = 10.

The connector itself stays a plain drmm_connector_init() one - no DP
counterpart of drmm_connector_hdmi_init() - so bridges without the flag
see no change at all.

> Perhaps @Cristian and @Maxime have better ideas?

That is point 3, and I will wait for it before writing v3: whether the
create-state block gets duplicated into the non-HDMI path or factored
out of drmm_connector_hdmi_init(), and whether keeping the restore value
in struct drm_bridge_connector is acceptable once 71/74 lands.

Thanks,
Igor

