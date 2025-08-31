Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBAE6CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 31 Aug 2025 13:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jwybc7U/Gu47otp5cNNeYZoMPwQff+yr/8w72U7737w=; b=WidKJuMaebfD9uXWy7/8OP3R7X
	eG6dHbG7gVZlsiQX3dFJ664sM08wkI4/kRItjQcc+EmnSn59jXhpx4LLudpDpEX8kXTWrSqhRhM/i
	7xwB7oeN0EUYtMtd2uNHzWno4CanYjdLBjkbSsJSv3nSDh7TJdSdgs1kg9QZJml3m/yw6IoJm9M1W
	EDiMaO62iciJXrNFuzAe0/vIADb7d/ve6Q5BWLv/IdgWz9YCib3KnedeO+g35F5NXmmZ+F8SUiH1x
	P3gXkafhJPCeMHVeUmeo/e85GbSFN0vp2pUGbjUWiymb2hnsGx015bdmIa5k7O6cIkFgh70QJxjA7
	TnVQJu4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usiQw-0000000AFGW-3AdD;
	Sun, 31 Aug 2025 13:49:26 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usiOF-0000000AF98-0UqC
	for linux-arm-kernel@lists.infradead.org;
	Sun, 31 Aug 2025 13:46:40 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7f7edf7621dso305904985a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 31 Aug 2025 06:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1756647996; x=1757252796; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jwybc7U/Gu47otp5cNNeYZoMPwQff+yr/8w72U7737w=;
        b=WYhk/xR+cecIdAMO3eum1H7gEUABxOloxBP/FN33ntSQe9mAzbu9qUI2G0n8w0mKsX
         /HWYqujJvloyZtjugDN6GCCJ3DACN/tn9K6asTI6lOJs0vYVXnZNYxw5DVxMwu+cCVu1
         L15KBd61Cxp96zrHBDMVjn+q6Gsn1xcVj8Aj27Y/SUXC2XUyeKa9M1jBjrK/dIqXuKoK
         dZ++NLGXvxf42Vfsw37FGS1vxy6y9SE54widMKIM+9LUS0tysBA6ytrwJH9mkWh/7fxi
         ROOxYSF9YYKX4lTV1IFuSMETvsneXy2l+BSa9NgPCHStqE+obHaCf2e+xO14u/7dFXeo
         22BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756647996; x=1757252796;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jwybc7U/Gu47otp5cNNeYZoMPwQff+yr/8w72U7737w=;
        b=V6TdEyVNX/Yb9hevOHbhDjDEFvrFStDpIkQcqvdcUEhVFV/PYyOL4S9ITgrYSQF1d0
         B7v0z4TfrHe+XTYfVg6yhT3td084SSrSYuoTT2yZNmFuhDj5i7EYFtbhHSTWKXgaR0EG
         CUgxX/FwH5isf8eZQ1TBvbC8/CJgrB5DtlfJUVOBWc9xTxA/MAZ9Ux8J23mzpFotjmS+
         TTYeeH/daC38/JnSwV8TXqiQHSGJ+iyiVIsEmM6nfe7SDJR571dnH2HKepYUifMu6Q32
         IQ7iHhcwRp/DGMZBbERdNE8cWj4QnOBNLdBZg9ooiswqXDRPOUt0bIqXMBTjkc7FQTZ4
         JqCg==
X-Forwarded-Encrypted: i=1; AJvYcCXo0OxtsS6UaDW6X9nrTNyvGyBPfuE3onVccHKTPDobqnDlbcPJ2Z9d6fOJohjdA5214HnqzLYX3m7koBEiSJ08@lists.infradead.org
X-Gm-Message-State: AOJu0YzeIN7kHCWfH5w+ysxuokLfy3aqW0X6Ml7mSqIQHeIeSg+5G67g
	d8Xy4uj20aEQR2GAG4vnH5YcbqP9XFrkz0QOIUXjXUJUM4WmD36ZXiuUt3aAsli2Hex+fZ2euf3
	JMcvhoTZOBYAB/7t/QLhMFH0RkFdbpC9owK2PynqAmQ==
X-Gm-Gg: ASbGncupjvue25UuXRB3eaGk1HZehr7tjKD5pRcWFtBksWZxI5b6FuhA7KJrElewgwW
	dZCojQQ4iyNK9eVu328ozK6sQyId0056jCCzmslj+YX0g9gc41LdV7JJXK94o8HMxkvB0kLK0q6
	Th9J0N7NRjqNYSxwgMDUn1TkVxcXukGr3ujMdUHxnoNcg4FgkmZSe7ML6N/YcPOETVTdYKB6BSO
	elC8Q==
X-Google-Smtp-Source: AGHT+IF0dh6mtaD+ci0SXGWWOl3LWwfmYnKKOgfGlK7FZ7iXiuG8d9Mqq2iCDHrHKRWGSRl6Gppx/kRr2i15hBvQ/kA=
X-Received: by 2002:a05:620a:c43:b0:7f7:c2a3:eaa5 with SMTP id
 af79cd13be357-7ff2b9817c6mr503403385a.68.1756647996439; Sun, 31 Aug 2025
 06:46:36 -0700 (PDT)
MIME-Version: 1.0
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
 <CAPj87rNDtfEYV88Ue0bFXJwQop-zy++Ty7uQ9XfrQ2TbAijeRg@mail.gmail.com> <57ekub6uba7iee34sviadareqxv234zbmkr7avqofxes4mqnru@vgkppexnj6cb>
In-Reply-To: <57ekub6uba7iee34sviadareqxv234zbmkr7avqofxes4mqnru@vgkppexnj6cb>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sun, 31 Aug 2025 15:46:25 +0200
X-Gm-Features: Ac12FXyJd7t7ZABF85TqQwXSEhwFfQP0deD84tmrq8IHkkpEGuVOeuzNQcUs-Sw
Message-ID: <CAPj87rOSb90S_TeA8Cu5kd-M8bbfiE0fvPzgr9Gr4e9_rfZeFQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250831_064639_268646_CBC4CC91 
X-CRM114-Status: GOOD (  24.60  )
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

Hi Dmitry,

On Sun, 31 Aug 2025 at 00:29, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> On Sat, Aug 30, 2025 at 09:30:01AM +0200, Daniel Stone wrote:
> > I know that dw-hdmi-qp can support _any_ infoframe, by manually
> > packing it into the two GHDMI banks. So the supported set there is
> > 'all of the currently well-known ones, plus any two others, but only
> > two and not more'. I wonder if that has any effect on the interface
> > you were thinking about for userspace?
>
> I was mostly concerned with the existing debugfs interface (as it is
> also used e.g. for edid-decode, etc).
>
> It seems "everything + 2 spare" is more or less common (ADV7511, MSM
> HDMI also have those. I don't have at hand the proper datasheet for
> LT9611 (non-UXC one), but I think its InfoFrames are also more or less
> generic).  Maybe we should change debugfs integration to register the
> file when the frame is being enabled and removing it when it gets unset.

Oh right, that's really interesting.

> Then in the long run we can add 'slots' and allocate some of the frames
> to the slots. E.g. ADV7511 would get 'software AVI', 'software SPD',
> 'auto AUDIO' + 2 generic slots (and MPEG InfoFrame which can probably be
> salvaged as another generic one)). MSM HDMI would get 'software AVI',
> 'software AUDIO' + 2 generic slots (+MPEG + obsucre HDMI which I don't
> want to use). Then the framework might be able to prioritize whether to
> use generic slots for important data (as DRM HDR, HDMI) or less important
> (SPD).

Yeah, that sounds good! I wonder if we want to surface that from the
debugfs interface: maybe just files named 0..$numslots with the
content of the infoframes, one named 'slots' with the integer index,
which infoframe type it's currently carrying, and which types it's
capable of carrying. Then to preserve the current interface, symlinks
from the infoframe type name to the slot index.

Cheers,
Daniel

