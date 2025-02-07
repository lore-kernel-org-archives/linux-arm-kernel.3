Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 509FEC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 02:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XyDyLt0s4sxED3YeKSYF1hhjE6HeGLhhhc5RXgEX8Q4=; b=EN4OiF+B/5zAEqv5/93C9qBAaI
	3LZq04WWGH0H+sJTUUQa/2cqJx/dE9U5QrMl/b0ep2oK15yPSib7BvttaxcyeF/bN4TN6f3aV8LdD
	WIxjYTN1bWdIFzbBSS0NrxP0uq8fgK4+aip1BZ1ttsvicjzznkNhe72p+bpklCD/hltJdspeSR+4Z
	iP+gudKQXNTJokA9pgSYM7pTvlVM5ZRJav8EzFhExkNYW/Qhqq7SLICu69QudSm7Jn9ITdToDYRE0
	qP8YuXfABP/fB2dhVJR4oPSXcTqXoh1Pi3cnT1TjDHUfNpij5klZ4mcmyjPZ2HfsFWJfnScLA9g9j
	/FBb16Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgDyh-000000083gu-3s3E;
	Fri, 07 Feb 2025 02:20:23 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgDlo-000000081oh-45Mm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 02:07:06 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-54298ec925bso1896673e87.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Feb 2025 18:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738894023; x=1739498823; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XyDyLt0s4sxED3YeKSYF1hhjE6HeGLhhhc5RXgEX8Q4=;
        b=tKg3yQBgVYZzg01w1bLlsbiVLbMe0cwNIPZXIImR2U3FVbli/vuVEsab5rYsoWQGQJ
         SK4ETILUFd7dLwlayA4XC8hMYmOrefNxR/kF0nKKyEC2Unxx+ndVXjjOpKSUqkY+Ar+D
         AtGGT/ffMRKqX4Ghc1xY4/Mkh/ambLG5PAnJJeRFDBs/8iksT+ZUcfsTYbTz+PbZK8Mc
         /LxiMgiD/cRuYCnpXFZZtpaRpB99/ydwaH5mpxDJ3c+I5gGZFAkF/MJAetBa3ctf6hO8
         Wsj9ASWa576S9HJ6T3/3gTOy3/PmjUjXLuGOVdUHMC9bdCCAaCLp5RlwKy9hZMzVfRrC
         cBTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738894023; x=1739498823;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyDyLt0s4sxED3YeKSYF1hhjE6HeGLhhhc5RXgEX8Q4=;
        b=SE/JkjdSloHlmkeYy/Jd4NDxvByQ/XO1ZFo+4R7gmJQHOksh00CnfrquOFQQexH5ls
         Gvn89nkyNZGukbYZ1U6TShU06kGuiBZgHFYXZtdUsWEZMqFiPrgCzAYJ2jJz310qhIKV
         W+A2jrQAMoNZAIav8oF73qW2lyQVpaUphMM6O6Yt1+Bqv5FEwjlEYCKOsFUbgRjVuJU4
         NC9ifG4YXk9gYYfkR/9xxsCgNlUcA1voR9q8b9y+RwJ9aAhj0ECxExdQ4apullMWBu4V
         HaKlvZlJ1iiQ9on7Z7/rHrPfqH/0WKYtAAer1wtFztNtmX4P/euS5jw18+QTZ0p/j3Ou
         yL8g==
X-Forwarded-Encrypted: i=1; AJvYcCW+qfvv1a+ReDzFE+ODD1ECdFkbH7h6wRo74l4YfpqfP4PKa/u4ij4enwtXlv0/UWtq18Z/3krNRbja4CkyKZNy@lists.infradead.org
X-Gm-Message-State: AOJu0YxnGI3NbjxlniAqfcQLH/IuMrttR4LRPxWQlfzQQK9qXkOtW9Dk
	Ml7rt2ZQQDkp9HDlF4PfGJhKrfftGiqC2L/MSDe2xDnhPz3HuHDscvJFBX2C4EQ=
X-Gm-Gg: ASbGncui6YV47/QA99/1HmafJt63BUp7qPHD27crkCeJATfmzFOdc2jVXvSwS6erqKZ
	CxSeubjhT7iruwP14R3B++Xu/x46zSyB6FlNjyELZB5xfwnfLrmAGlqgEeXywocqqFyMg3oWLOy
	c5NWy+H5WxW+oo6sw/0Z5iiEmheK5DcOF7gyeGjaS8rM6S0l8bgFyTUdxmfg6KVgvGVHiuLgF+S
	R+VRrSWylw7GcnGbO5SfWUC44TWZRwMw/f15VkMcS8uPMyT1CLg0duTpy5+d9vsZdLiAVnGRpJT
	FMewQj0u3017F/bYKKPe3YB6lSSSKjZtvkko34MH2thBMwlZU3GZ76nzzhfyTKfd7m1uMaQ=
X-Google-Smtp-Source: AGHT+IFwAZ+OzzbukVZoC+RyK7oCA6hsn6G2MyRAFDLm/u//Zdyj+Li+eJOThMosTwozpZa/I5Wr7g==
X-Received: by 2002:a05:6512:2348:b0:542:28a9:dcb7 with SMTP id 2adb3069b0e04-54414ab6999mr282681e87.21.1738894022599;
        Thu, 06 Feb 2025 18:07:02 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5441053ec09sm291476e87.5.2025.02.06.18.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 18:07:01 -0800 (PST)
Date: Fri, 7 Feb 2025 04:06:58 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v6 01/26] drm/debugfs: fix printk format for bridge index
Message-ID: <mubhj23fer6btbssvo7yqrst5c45kgqetsnh3kcsrrgqnqkg2j@dx5plvv75e5e>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-1-9d6f2c9c3058@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-1-9d6f2c9c3058@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_180705_014420_5AFD3BDF 
X-CRM114-Status: GOOD (  14.26  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Paul Kocialkowski <contact@paulk.fr>, dri-devel@lists.freedesktop.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Simona Vetter <simona@ffwll.ch>, Robert Foss <rfoss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Daniel Thompson <danielt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Inki Dae <inki.dae@samsung.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Feb 06, 2025 at 07:14:16PM +0100, Luca Ceresoli wrote:
> idx is an unsigned int, use %u for printk-style strings.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 
> This patch was added in v6.
> ---
>  drivers/gpu/drm/drm_debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

