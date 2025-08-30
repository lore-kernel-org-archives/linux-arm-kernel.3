Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 609C7CA0FFE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 07:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/XKolNdOG4rWtnm/Z1Xm//IS1jzblLqTcVqQ5IMS/rM=; b=Hyyq3O7plIBcZtKpgh//9xyHTr
	6LtytGQGiJIf8IcKkCQ7kALeoUW7Vjs9dyWJfOrLaFgWWdmL4ELv+DabkMH531Qs/HKRfv4ngVb36
	z0DFegXmAoNBny+TmC7W1+S0XjJ1W9+2LbCgZsou5gDbbezHQV0HxX4xrhM0ScmSaHsWnZTlT5GU8
	t8eJkHyDQjcANvTZ6Mcto+CXI9R+9B5NvjMG1bVTjWV/1Vt1xqW4GbXFlaihQcUukITRfUbKTJwfe
	oLAXIQvT9rMf2tl6YhMXc9JlccBzwsVPuWvRNSf5xJcAiJO/mDYz6OaQobi68CU0N+Qag77FJKdrP
	006EoacA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usGAg-00000007YJs-0Zsh;
	Sat, 30 Aug 2025 07:38:46 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usG6h-00000007Y1I-168e
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 07:34:40 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4b1099192b0so53082261cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 00:34:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1756539278; x=1757144078; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/XKolNdOG4rWtnm/Z1Xm//IS1jzblLqTcVqQ5IMS/rM=;
        b=C6zs1IfcKu1LNpuLh2VNR+mUQmvk/l3pM6x3bNJSqdtq04gEBT1bYRXlLJyFU7xXY0
         YBCQxEUcU0eomc2+/qdK8Jr8rRFZ+ZxDvsKaoz5ZKLihPow/a/dh4K2KX1RbbGBTDP9W
         W4qPcyUCDpn42qu69dmd08VmveqyQqn+8Jh8ntjO4ZpYG44uduzYUS52BHDSLm6ADZ4G
         GXpBvYfRXG2ONacyRMiznnM/WYIPT0mqaBLR+nKv+r9a0P7YCCAlI1d0JRxBc1YYoBRW
         iMFOfKr8bP2OnzSwG94Lo0Ob2XncmXKw348oL3CmACMb7t4z/7wqgHdjI1opBGGIArFf
         p/5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756539278; x=1757144078;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/XKolNdOG4rWtnm/Z1Xm//IS1jzblLqTcVqQ5IMS/rM=;
        b=ekxlas+JkLo4N90RYNRwDm4dflU2Tmv3jK2f6D4yNJzego+r4SoW05zI6LvubPdzkH
         3oJjYaF32zCBwHzP4rnb0jK4vt2We91oa7xnXbcUDNyvBp5t5E8NOw1AxG5j8lsuJRvU
         qY6EB6iKSfxYh2hvG0P+Ic/Kf44fBbmBbocfihIy+IAtRsDNd2OUihxCEy2r4jwhpbgq
         +Dv8PZd6CBc7NW/D0MT1wK1L9/mHdXd/5mWiBhreBsUvurBBZrGfNE1AfzF0IuOWCB+Y
         zpnTUFjXUf3Sc2tjt5n1dUuUUEpb+u7Hah3LGtWPoAeTUyaxtTI4omkOFyCarJ2ufP3D
         7/4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXXJM1gxg8rB7wUD2G9PozM9d5YXcEDAlmh/GSfV5biVEtkduHDi4PXAX1ZhdIXHM7w26TWRqf3MZcgpnPPt1jA@lists.infradead.org
X-Gm-Message-State: AOJu0YxtRuqmjpzkM0jG0y+7vqrhljilLsw7zvVzHieAZZI1i1Wx44bD
	v+AdBAJS3xONFpVSwAmHmIGoL0Rxl9DFCOD6scpOf2kxkDt+KJZTO8hHlx4n/75bD98RZQYHsKf
	fJC1tKbFby5gxLHDYtbRo4F2AFCUuJl1DDZHsef7aCQ==
X-Gm-Gg: ASbGnctb3wSTDF7e1Aol/nqub67ke7jMt+zwweJ1JBRxYZuHEOMGTV/pj86MINGzROv
	PyQgF6xcApagDlcgsPUYs1iXNzcYkKkMi10m2YW6ProJnONvOcRKQFYMaLErMul00pBlrNUKcEI
	Matq+xdCRWECPA6o2mnig0vjd6EMIC5ypHi66+f2IzEAc5I1xl8Nn9S5c3Qkoh3Z59Z1CmPQ3KE
	KSHDw==
X-Google-Smtp-Source: AGHT+IF+RtT0nHcRaStCokPpIqIxLujpZpjFFgu9P7ssG1Dbp9cdTPQGJvkbcXDD3qNhvrdS/Kj2NXgLvHLELse+VQw=
X-Received: by 2002:a05:622a:4116:b0:4b2:ec43:3de4 with SMTP id
 d75a77b69052e-4b31dcb27f5mr15037901cf.75.1756539278311; Sat, 30 Aug 2025
 00:34:38 -0700 (PDT)
MIME-Version: 1.0
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com> <20250830-drm-limit-infoframes-v3-9-32fcbec4634e@oss.qualcomm.com>
In-Reply-To: <20250830-drm-limit-infoframes-v3-9-32fcbec4634e@oss.qualcomm.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sat, 30 Aug 2025 09:34:26 +0200
X-Gm-Features: Ac12FXz1p7iZOdEEQR_vXRtXiF18jyko9t937NCSmf3jeVcnUDmrfFo9HX_W5zM
Message-ID: <CAPj87rNMr-2ZeZ2Pqb5qG4Z-xtUyOVxbY635pw_PDEjVpd5-OQ@mail.gmail.com>
Subject: Re: [PATCH v3 09/11] drm/connector: verify that HDMI connectors
 support necessary InfoFrames
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Liu Ying <victor.liu@nxp.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250830_003439_299646_780AEBA7 
X-CRM114-Status: UNSURE (   7.94  )
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

On Sat, 30 Aug 2025 at 02:23, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> +       if (!(supported_infoframes & DRM_CONNECTOR_INFOFRAME_VENDOR))
> +               drm_info(dev, "HDMI conneector with no support for Vendor-Specific InfoFrame\n");

'conneector'

