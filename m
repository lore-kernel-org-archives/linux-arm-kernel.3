Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C70FACD4F5E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 09:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0nHbVXywPYI+m+RM8iHAt2Jum4qcWT4EHlZtaJMwkXs=; b=OlUm572A0NcjpIAXZezupIQxaF
	WhQ27snSaY8ks2nKK01qNkl4tCp8cA+ClgLnQznQ+3BkZ8Wo2g/vFv10PPAGk4nt1yX5cJztuyRrL
	+62itsCNSst2xLy9WJCLLA3P7PEg13/dlkrPI3O/KXI1ikv5Mq5Wwq68+I6knZ+EfJaWZwKx3B7Au
	MnjTmGdtGVAYjBYlRGHGbjObysSL3D/NhPVG5aXA3OHs8BbiP2fzKx/4uKKD0NN7UcDQ3dy/MyCjF
	0Tw/Ic1/TeGd+M7Z1JIB6eCcyT+gSWZETxe12+tITpmAVXyirWx12uBjL//BuAdVDEBR4OL0hVgDY
	wZE1R1Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ0C0-00000007OQ3-3MZY;
	Thu, 21 May 2026 09:59:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ0Bx-00000007OOR-3mSi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 09:59:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779357588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0nHbVXywPYI+m+RM8iHAt2Jum4qcWT4EHlZtaJMwkXs=;
	b=dNFiQNvXncEIgCRsaJfAJaOKkbJZPCd9Y9j1yaL9qTT0fErtp1uBM+f+YPDfPynbobDevc
	lpFnEhbszqEYRgZ9qrwsbsIglrsue/aZXvsWoMYeHS6wd8R+MOSoUI4/aNjULIaRa8tNLL
	S0WrSmUVaZG+119ulrtvRVjwJ9do5vE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-221-LmhZEfwUNZG_3dslS6C3IA-1; Thu, 21 May 2026 05:59:44 -0400
X-MC-Unique: LmhZEfwUNZG_3dslS6C3IA-1
X-Mimecast-MFC-AGG-ID: LmhZEfwUNZG_3dslS6C3IA_1779357583
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-45e80183514so3845616f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 May 2026 02:59:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779357583; x=1779962383;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0nHbVXywPYI+m+RM8iHAt2Jum4qcWT4EHlZtaJMwkXs=;
        b=PKtfoLrnN+LfgpgmAVBoJGy9XD63RJhT3ZJgBxAW5KSsHKmgy+58CG+oZdvMseK74U
         EpTp5hToI39oh2FTrsQWqH9TzxAgcX2e8dOmYkXca/qPCU+TcF+17EgqK9ZMRl/ViT0/
         q9uJfrx1tFSHR+xHNRZPoIp1Qeyfy7rAiq2HfggZ9dCB7uLeDZSIgKrDXktDym2DpCQT
         SUUNnalOtZ6IP5oQGE+tHs2X8eVlsCi4wxc3BRA8rAz1LiWoj2MTG8yGXl39Qmd/U/f+
         Tii+By5gIZXxvXyRbzX1ptAqGDmkLETxgeq7VzxrRFC8lfsgmftQ61iUMUWotYkf+2Mw
         WkCA==
X-Forwarded-Encrypted: i=1; AFNElJ+L/Wq+L+L7isO1uekcD7+If/BXNzr/N832IGwh5uoSP7r7Ar7ZMkHMr5xWDbde9mJl9d0UBMRGou0xYI8wLuPl@lists.infradead.org
X-Gm-Message-State: AOJu0YwtKZKo52WMmHahNSGoTJ2Wf7sgTO+wB0G0B+O9OpeII7mq1VMR
	qGKHSWK5jL6/2ZBBWATeu48OmyNqfwBK94e/Zng2HntcclOfeF2CAn2+myUTvXWsXaoOuv2dcKW
	rIvATN69uRp70iniFAze4z5uGuRgQVnIa7V3w5SuJvTBy+r2R3YgHs3CgDy5UUuLEbwdClheQGr
	z+
X-Gm-Gg: Acq92OEzjiT5TmWfU4NBw3+xS6C/ci82w9UxsiezY2awNLfWj+Jt8l9nf+R5CmCML4P
	Rd5KInfh2jtej/kZP5h2dNQuNL1omxPEmwNFiL5iHv9+J+7Lpq5ZILU81e/bphYOJ4Hxl/9MjRo
	1BzjDf+POI5J/QtNJtSBRMqOFsqTcVkCugEo+96m4PNB7a1yJzHbOYvxpRqzWJIezek68rzuMH+
	14p5UVMK6elZpFIzKJ3+Eq++ABnh+WlXe4lspIHRyEUeTp47l409JQkxFpGSmMTZgk5KveEhsfp
	kvXvTrVpaBFM5x3lGLfhMLSdUTrEMAT6asSbeFdUya4/uG2aSIf4+0AM+cNyee6WaXNaGKvvcvD
	J6ICdUPAdFEJcW9kBEA/OgFmgxbuUdkNVRVk+5jMjkYqbip8MpB4xSv6FpPh9cWdYJXWR+9eVBJ
	bLlgTw
X-Received: by 2002:a5d:588a:0:b0:43d:68ad:3b7f with SMTP id ffacd0b85a97d-45ea3ae68b3mr3967836f8f.21.1779357582704;
        Thu, 21 May 2026 02:59:42 -0700 (PDT)
X-Received: by 2002:a5d:588a:0:b0:43d:68ad:3b7f with SMTP id ffacd0b85a97d-45ea3ae68b3mr3967757f8f.21.1779357582159;
        Thu, 21 May 2026 02:59:42 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eaa7d9e2bsm1634922f8f.10.2026.05.21.02.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 02:59:41 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, Alain Volmat
 <alain.volmat@foss.st.com>, Andrzej Hajda <andrzej.hajda@intel.com>, Andy
 Yan <andy.yan@rock-chips.com>, Brian Masney <bmasney@redhat.com>, Chen-Yu
 Tsai <wens@kernel.org>, Chris Morgan <macromorgan@hotmail.com>, Cristian
 Ciocaltea <cristian.ciocaltea@collabora.com>, Daniel Stone
 <daniels@collabora.com>, David Airlie <airlied@gmail.com>, Dmitry
 Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Jani Nikula
 <jani.nikula@intel.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jessica Zhang <jesszhan0024@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Liu Ying <victor.liu@nxp.com>, Luca
 Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Marijn Suijten
 <marijn.suijten@somainline.org>, Maxime Ripard <mripard@kernel.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Raphael Gallais-Pou
 <rgallaispou@gmail.com>, Rob Clark <robin.clark@oss.qualcomm.com>, Robert
 Foss <rfoss@kernel.org>, Samuel Holland <samuel@sholland.org>, Sean Paul
 <sean@poorly.run>, Shengjiu Wang <shengjiu.wang@nxp.com>, Simona Vetter
 <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v2 0/8] hdmi: Add common TMDS character rate constants
In-Reply-To: <20260520144424.1633354-1-javierm@redhat.com>
References: <20260520144424.1633354-1-javierm@redhat.com>
Date: Thu, 21 May 2026 11:59:40 +0200
Message-ID: <87o6i913sj.fsf@ocarina.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ns6oqW0LABx0kGtFWzYLTzTszSHSi0G7GwEoFfnRXbQ_1779357583
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_025950_015924_04B30381 
X-CRM114-Status: GOOD (  14.31  )
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

Javier Martinez Canillas <javierm@redhat.com> writes:

> Several DRM drivers define their own local macros or use magic numbers for
> the standard HDMI TMDS character rate limits. Maxime Ripard suggested that
> instead these common rate constants could be included to a shared header.
>
> This series introduces these constants to the <linux/hdmi.h> header and
> replaces the local defined constants or magic numbers in drivers.
>
> I split the changes as one patch per driver, so that these can be reviewed
> individually and merged at their own pace.
>
> This is a version 2 that addresses issues pointed out by Maxime Ripard and
> Dmitry Baryshkov.
>
> Changes in v2:
> - Change naming convention to HDMI_$SPEC_TMDS_CHAR_RATE_MAX_HZ (Maxime).
> - Define the constants in <linux/hdmi.h> (Dmitry).
>
> Javier Martinez Canillas (8):
>   video/hdmi: Add common TMDS character rate constants
>   drm/bridge: dw-hdmi: Use the common TMDS char rate constant
>   drm/bridge: dw-hdmi-qp: Use the common TMDS char rate constant
>   drm/bridge: inno-hdmi: Use the common TMDS char rate constant
>   drm/sti: hdmi: Use the common TMDS char rate constants
>   drm/sun4i: hdmi: Use the common TMDS char rate constant
>   drm/msm/hdmi: Use the common TMDS char rate constants in 8996 PHY
>   drm/msm/hdmi: Use the common TMDS char rate constants in 8998 PHY
>

Pushed to drm-misc (drm-misc-next). Thanks everyone for the feedback and review!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


