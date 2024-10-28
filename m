Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0C6D13588
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 09:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VPBuezFB3CXtTW5/lJNTKguPGRqG+lEFtQVwqgqjd4Q=; b=L1x6qVE5OaJu+d62Z6Y9kqezSt
	1dTMn1YYOfbJ95MXspuBZ7m6gpvsUMQeS22paGz4fD+nFSk0dBhjpURF3OJmrb+gIX5Fl0OgiDp/q
	CZTb6sIoc4D7XMT5lIwdHaPtNzy82Cr8Glu08n0J9wf/SyYeVFE6vP7ck+nrW4zX1UwzquM0exs99
	aCu5Oa6mYv7G/Qq+GL7J+DK4aH6llOmBA6C0lLNMXFySmDUGAIex3UiD2Ps2x4rTwgUwZzSGDac1j
	ak8IHy6rxWKTl4piVtnDbUs9ngK21yE029u0vui5ZCfgTdwGTNhSbeMnHyerWkbRTWa/AqLNkYUzk
	DjKlD0dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5LxI-0000000ADb0-16vv;
	Mon, 28 Oct 2024 09:22:32 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Lvf-0000000ADIX-39YR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 09:20:53 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2fb58980711so35122701fa.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Oct 2024 02:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730107249; x=1730712049; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VPBuezFB3CXtTW5/lJNTKguPGRqG+lEFtQVwqgqjd4Q=;
        b=c/fVxmiQr61W1ni8lvxgmYBBRRFk+YNrD96McJvSk8ncUaPD7ZqEP4lmZCGHgx7dBU
         cm48M+1ojoqC8cL5tbiWRWPnPuI5tM170D2g/LOM4VVmC5yhdVydaPCE8o02DdPyBzHm
         fUk4SnMPMwFRERF1nw7NyY82/PAv8kjQoh4UtTq4LZY6YRECWk+NE0UAoBUVHDX41Fyt
         beMPGhEpId430PwkHiDRsb+ArinNF+HLG5Tud0yovXADPgaGXTuT+ORO0C83u3bTWD1P
         WgeCWhQA8h7JLm/pQLcU6xW6vKsZrmsWxVfBRWB2SnNbE44/4X0pVceQDVZ3jrFNUUTp
         aSOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730107249; x=1730712049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPBuezFB3CXtTW5/lJNTKguPGRqG+lEFtQVwqgqjd4Q=;
        b=R7FJ1/3u/gXHCX4j8YqA4qrXYGvuqxDigbB5FSmj2mNJenxRGoSjbRnzvdbPYjgQPb
         X+HDMEIE1Y2ytPTszCiD3Ai1HjrHl/sRhCT2wJz87XexWI1QaPwLDmNS88Njq/uumUNY
         o6mBAi9WL+A0NUkwnvKRZ6YjwBZJADJ8edgtTlhiBjmnUVwwMFy5/MNQM73HFYh6Q6D0
         hI7FGQz++RLK6qPy4l0Q+PWmFNvzUoTEGBl4wJlbX7hOeiB8VCL5ZysQzxT6QqP8QGoV
         o2DetNlc8kBIVEFydQDrpfgQ0evDg2C1HpHUla2e82wij43yRscdZySRXfzzk45lzhPr
         HYbg==
X-Forwarded-Encrypted: i=1; AJvYcCU1oluYVJy3DbJD1p0RPEYxvt3RRyVLBTKPQnSGoNDTXy6mm2VG8vbu2mxXOqEYlw4h2/vDFBy9pTVgTneGtJd0@lists.infradead.org
X-Gm-Message-State: AOJu0YyfVU0o/3NBzJfmHSV2FCDqgEOzmc4E/OQUtZMhWB3nbUMwjgJ4
	4iOK1PByNEANRYaBZPgi4WbwhXM6zYI2UAgMzzKBOR/ugOK93esUItLYFrWFd1g=
X-Google-Smtp-Source: AGHT+IHMzC2RrBK1gDyjb7BDtN9UQMSMyOUaimH3SDT8yHY0Jieo0+u5sTv3iUOAiXJhLKZA5AAPKQ==
X-Received: by 2002:a2e:bea0:0:b0:2fb:5014:c941 with SMTP id 38308e7fff4ca-2fcbdf71340mr25188781fa.14.1730107249435;
        Mon, 28 Oct 2024 02:20:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fcb4507c44sm11199391fa.19.2024.10.28.02.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 02:20:47 -0700 (PDT)
Date: Mon, 28 Oct 2024 11:20:45 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Liu Ying <victor.liu@nxp.com>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, andrzej.hajda@intel.com, neil.armstrong@linaro.org, 
	rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, 
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_jesszhan@quicinc.com, 
	mchehab@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	sakari.ailus@linux.intel.com, hverkuil@xs4all.nl, tomi.valkeinen@ideasonboard.com, 
	quic_bjorande@quicinc.com, geert+renesas@glider.be, arnd@arndb.de, nfraprado@collabora.com, 
	thierry.reding@gmail.com, prabhakar.mahadev-lad.rj@bp.renesas.com, sam@ravnborg.org, 
	marex@denx.de, biju.das.jz@bp.renesas.com
Subject: Re: [PATCH v4 10/13] drm/bridge: Add ITE IT6263 LVDS to HDMI
 converter
Message-ID: <tjtbvn5ewlzs6wqkp2ffquiiebakhv2eg3vt4mzooeb6nibx4u@qhwx4hxvj6ou>
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <20241028023740.19732-11-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028023740.19732-11-victor.liu@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_022051_815617_352C5909 
X-CRM114-Status: GOOD (  10.02  )
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

On Mon, Oct 28, 2024 at 10:37:37AM +0800, Liu Ying wrote:
> Add basic HDMI video output support. Currently, only RGB888 output
> pixel format is supported.  At the LVDS input side, the driver
> supports single LVDS link and dual LVDS links with "jeida-24" LVDS
> mapping.
> 
> Product link:
> https://www.ite.com.tw/en/product/cate1/IT6263
> 
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
> Acked-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

