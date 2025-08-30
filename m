Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A8ACA0FFF
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 30 Aug 2025 07:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u5ZG8/bv7fEyY7/sBaZXohrNcXIrZPRq+HcTim4TiEo=; b=zxvrVeis4FTt9srVACLuvyD4tk
	424kg4zGgOPs2AunmPgHP1zf2V5zoIghRX7rXhCVqCXSK6oj6zWaEjiBuX7l7JhfpujJPjV5Wby6e
	T1HcziPOhXcDLcaOAUF0eYC1Z3smp9zpSB43Omb4yv4rZcf6l/aJw3x2bx69174g/ByU0TF7pZkfR
	TJNt3zlhYtfDPa0jm8GLdOdnnVgzXm71/BNbhc2nVGnS4wKVdvIVB0qgzTaWUm+DxB8I9UbtyFCOP
	BwsnD9ISNpvlCXceyeBDjdvPUi+K/PA76hTToL0LcvTJXq6sOCCDBA6Lb9MwjyTi1NeaY6M9aDOUh
	RHv/8sqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usG5D-00000007Xph-0TJV;
	Sat, 30 Aug 2025 07:33:07 +0000
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usG2P-00000007XU4-3n9d
	for linux-arm-kernel@lists.infradead.org;
	Sat, 30 Aug 2025 07:30:15 +0000
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-4b30f73ca43so10486411cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 30 Aug 2025 00:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1756539012; x=1757143812; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=u5ZG8/bv7fEyY7/sBaZXohrNcXIrZPRq+HcTim4TiEo=;
        b=WYOkHE841+SPv/KecEk0DxrSIRjbo6HAFQpHD0PnOmiTc6wH21tqYsQBW9QWHZrzsz
         9/SsDEGLFl7/h++9WaO1iwFMxcBSAr3159hbQFO1raSn8jJT1ScnmHgEw0OC9+gSpiMy
         TiC6gzkB146/7htrEvLlzF/xN6DUVvVcpmMuh+qP+SysbWNqTfMz6VtAH5J5i9cJfRxI
         XIoaphtWUWlKlnu+k2dHy4bKUgOyrhLO7vKh9NT+dwAE1/AiVdNnkBwOMSCxb3UQiL+k
         Bw2EvrXas4g/vWaT+AtT6yXkUei3hm/z88pHPPd6rldH9qdBajrFYo+Btc17/jZj+j+x
         TK2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756539012; x=1757143812;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u5ZG8/bv7fEyY7/sBaZXohrNcXIrZPRq+HcTim4TiEo=;
        b=qxQFPs+KuwIVQupwqaAyN+tNE/cr9ijl75oYu5RIJFHdrWrZy15aDCEwlP3cy0wjgG
         BGpjJlfYQyO9ktUFBo9od5XfmTmfr3HCemYEhuwl02Vij/faUqkZwUZh66oOgVQHf75z
         6shwVowTj0ZZ+xuvSVY+mdGzK5r2z1H+QY5RBmzhqp+NQn+kx8e9Ggqc2v6K0bR4oWFP
         QC77e35x9ZId5iWtG7SUCBUXok1Sf+U5zmbK6b8QCkIXCUBZq2Sy5mO5DtOBj0sIRqrV
         wufeVn/Z0LFyBgygxnjJyYJfjhKXrn9FYJlUYNMWqK7aHZOCjyafdGCwBM4TYEMpCYHH
         a3dw==
X-Forwarded-Encrypted: i=1; AJvYcCXNSy0OD1VyDA/YtAgbq+8SIgqQjo2nwChnF0qKLv6J4+PvMP57pQftVWHHyJXShYq+G7fZfOI83y0Mu30QulMj@lists.infradead.org
X-Gm-Message-State: AOJu0YyrWpbkmpAXIHI0/q7kuvPMZvBIEBVfxym5oAKqYWAYndyJkbkp
	wNvKxwx0fjStVzG3/ND3jycuMjLJFR04pt4YstS7FMTOxEbphXdzgV2CapdEnZFwT4F7CAU5n99
	vUxnsOubH+XgYX2oH1VHnymRbv9f37P3IwP8z8yoDIg==
X-Gm-Gg: ASbGncuQCaRTfwVy4ksKoRZIZkSmSzynCCq1kaedpf5FD31qZpcftXdZUsOkG0C5q4P
	C9S4bisKh5im7Xk/oey00ln/h1xl1UUziqBkgyQ+zpisQItnkOAkZsoF+Pn391KqjftSX9THoXs
	mrhAwof3DrNT9v2hftKc15gbvSA0XDnTVmZFywgcOt2IX3qDZNN6JAa5FSzMRFeQF1vW0ebddv9
	xmY2cB8ezDt1w1T
X-Google-Smtp-Source: AGHT+IEoXuFZJwCV9cwGNvRYz37SGk7fTBsYXDUKkjm0VNio3cHCVlLucdjG7nkDJhE227CIqVsjn4jhHmK64RhHXes=
X-Received: by 2002:ac8:5a12:0:b0:4b2:d607:16cb with SMTP id
 d75a77b69052e-4b31d855a89mr14707801cf.22.1756539012519; Sat, 30 Aug 2025
 00:30:12 -0700 (PDT)
MIME-Version: 1.0
References: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
In-Reply-To: <20250830-drm-limit-infoframes-v3-0-32fcbec4634e@oss.qualcomm.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sat, 30 Aug 2025 09:30:01 +0200
X-Gm-Features: Ac12FXwherP7pCCw1eIolUuD4CaoGI8lRnTYIDVTJZ8XE8BvqysFq5xqSgK9g3A
Message-ID: <CAPj87rNDtfEYV88Ue0bFXJwQop-zy++Ty7uQ9XfrQ2TbAijeRg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250830_003014_554383_A83D3FDF 
X-CRM114-Status: GOOD (  16.62  )
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

On Sat, 30 Aug 2025 at 02:23, Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
> It's not uncommon for the particular device to support only a subset of
> HDMI InfoFrames. It's not a big problem for the kernel, since we adopted
> a model of ignoring the unsupported Infoframes, but it's a bigger
> problem for the userspace: we end up having files in debugfs which do
> mot match what is being sent on the wire.
>
> Sort that out, making sure that all interfaces are consistent.

Thanks for the series, it's a really good cleanup.

I know that dw-hdmi-qp can support _any_ infoframe, by manually
packing it into the two GHDMI banks. So the supported set there is
'all of the currently well-known ones, plus any two others, but only
two and not more'. I wonder if that has any effect on the interface
you were thinking about for userspace?

Cheers,
Daniel

