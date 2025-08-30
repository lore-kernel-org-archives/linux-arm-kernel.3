Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDD4CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 07:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7fzjqNbnl1FH7mVwqP6ExvQ8qLgU7/T3+Fqhp2L/qAI=; b=ERW14GmXGB7WMiYP8Q4OIQi9hK
	QOtung70WdahuVg8qYE8beFPo7CiQMX8v3PUZX6RYU1JGrxWYf52pV1UwVByXnOC+DBVq42dOy0DV
	QfKgo4eS6df+MasNgr5V5k+lYv3S4Fi+akBYcBjf/sbScBcbsg525w7YC0LMdd4yA4P1Jhlz1L891
	SPK0myWcnM0tyvZt712JEKVQJrNmUVrx6w0ZemhG86ZZC40mbS+Kri5NNKzHPRj+B27IOfNclasQk
	STL8OXNBxPR/cr/vMMMXejOSrDbdtL8RcDE84QewRRnuRDnDl/k/Fxn17wAEXQo9Q9ZwFhj+KSVv/
	KKTgKjXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usGDn-00000007YjY-3tCH;
	Sat, 30 Aug 2025 07:41:59 +0000
Received: from mail-qk1-x732.google.com ([2607:f8b0:4864:20::732])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usGB4-00000007YO0-1TNZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 07:39:11 +0000
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-7fac8fdea9fso223777385a.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 00:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1756539547; x=1757144347; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7fzjqNbnl1FH7mVwqP6ExvQ8qLgU7/T3+Fqhp2L/qAI=;
        b=RHmojvI+WRLNAjEMQaz/OgwUK7ulgS6CJIjoW+VTwb6i/ESNRwdnhqsn+eihGjihrV
         cGet7NXTxaCzLoA9bB+MbUuEOxkzd1qtE/ezgbpklyIB6ffmf1HWl0U2tvHwEAU+wvBc
         hCZWkt5M8ciVJ/1LYiI7PlhC6mLVsHDqvHTi1NI63SwfHBZ+Y2tzTV9rsF48UwEUmhkB
         GWqFFGVYa6h0CzSMm0Mxlm2ImgZ0oFM2x/lp1AkhfEDMtF77Lto5LevLbkpEnZgebBz0
         JjzuOBPjkGZqteItBgdEdNcO9dz46Ov2jMvxmDPKIz3irFAvwn6jTkR7lOMMeNHI9waq
         Go8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756539547; x=1757144347;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7fzjqNbnl1FH7mVwqP6ExvQ8qLgU7/T3+Fqhp2L/qAI=;
        b=hVzRvcBJoDyqLG27W9ojERvT9fC9+6H1ifFiRCrT9mkI0B9pVtvFfI9B0NNi75MaSn
         kS+DhuMdai/fSvdPSYqVqQCPu9ur1BLuX43bDZmkWHyxnvJV0jrcG8K33b9lLUPF/tIV
         wI8MEOFqWja3TcxV1mgzndZ72KTV9VrvaQRSXFrOfUtsVvnOCtK0t0g1LwxxcAD4cu4L
         UOZOxiKXnMnd1Yf3jm7+X5n1B09eUKZDGoziOstc86qJqtI6JUIWQxFzSoY+A/O/7b0e
         k7lv3RAGnY2rJ4TzrxYkm/43dz8ajhhJgCTpmuIeKUNjiJNbb8oCzSm0GkcFnxzm6Tuv
         ALuw==
X-Forwarded-Encrypted: i=1; AJvYcCWIg38y8+RCikqRRoEdUtBT+bsNcklfHMtKsvMvLXObSzoq8VBH+aKzlYPylJ5Pbe9ecqVQvNXIZZyBf1y3FdBL@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+yQrmXA14dTKedydJSkth7D3bxGZ382JZ0WmaBmnvnlgwjwdG
	eMzBIP6o0W7npJ4m12UViht7zK6PLqdDPcza2yRsKr1/wW2sNID2GOnUfFC804m2vmUXQIdz0nJ
	PvN6GvIoMrI3ad12L6bjxZMV/rBNsigooXClELN/TVA==
X-Gm-Gg: ASbGncsMeUgJO4tLiRCc+Ub4qi5z5IS0Uvva7pKio8nCKlipqYe6IAACyuKC+qNugRi
	glZ2I/QZMsEkdastcv5xkA7eQMjue1f5vpEZTYSm+eHnEpFZxktxMaxF4vXKknEGVzWKFv1L9Tt
	pAQ9APuiBTLJa7lmEm2jUwUuFrKEnXQrRpEURbJguILi/F5tbhFFQb7VFfWhieVZ3Xxfsp/lnTx
	3No37aeCKRpU1Hg
X-Google-Smtp-Source: AGHT+IGcdIb5Bh5zrCRPBVL3fLoDcfNzuR05JRese/yFeQ6WZnki9GRGlAQtC8Gf4B7czjKl7GD5FNu5efT2Tyeq4FE=
X-Received: by 2002:a05:620a:3194:b0:7e9:f820:2b72 with SMTP id
 af79cd13be357-7ff2c51b1dfmr138787485a.72.1756539547138; Sat, 30 Aug 2025
 00:39:07 -0700 (PDT)
MIME-Version: 1.0
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com> <CAPj87rNDtfEYV88Ue0bFXJwQop-zy++Ty7uQ9XfrQ2TbAijeRg@mail.gmail.com>
In-Reply-To: <CAPj87rNDtfEYV88Ue0bFXJwQop-zy++Ty7uQ9XfrQ2TbAijeRg@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sat, 30 Aug 2025 09:38:55 +0200
X-Gm-Features: Ac12FXzM9U8oA3u3fX5rkC_Acspb1Bpg3nyPrRsz__oJ7apEVkNTDxD29-I5hyE
Message-ID: <CAPj87rNz7PPqZ7P4JSKdnizFaEoaBMf2VFBYbpVn3VNt1giU0w@mail.gmail.com>
Subject: Re: [PATCH v3 00/11] drm/connector: hdmi: limit infoframes per driver capabilities
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
X-CRM114-CacheID: sfid-20250830_003910_391896_CAD4ECDD 
X-CRM114-Status: GOOD (  15.98  )
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

On Sat, 30 Aug 2025 at 09:30, Daniel Stone <daniel@fooishbar.org> wrote:
> On Sat, 30 Aug 2025 at 02:23, Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> > It's not uncommon for the particular device to support only a subset of
> > HDMI InfoFrames. It's not a big problem for the kernel, since we adopted
> > a model of ignoring the unsupported Infoframes, but it's a bigger
> > problem for the userspace: we end up having files in debugfs which do
> > mot match what is being sent on the wire.
> >
> > Sort that out, making sure that all interfaces are consistent.
>
> Thanks for the series, it's a really good cleanup.

FWIW, the rest of the series is:
Acked-by: Daniel Stone <daniels@collabora.com>

