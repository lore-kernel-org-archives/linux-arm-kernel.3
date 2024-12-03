Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE305E64AAA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 13:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pj5SaA33rGzeah/pbmVRQIoqaIyNVExU4n/MvIb6OOM=; b=pRYvRj3cLYM0su2UhLGrq7ZCvh
	KcMZ1mTgsD4iRC5Wyw2IWGBbwqjj1XJIvtKDLOaHBzVAa14Efj/jg5cFNG9CjLwEh1CZNoXq4IXKj
	xr4KRd4BCNkLLl/7hsHbS1SfaAe4JPplMCHw2+SKrRB3QJup/BWaaZiFmLASb3C9x+UJH/qiffS38
	dOP18M0liAaEsTTITVRo2ieAd2AQ2EbXK6ct+Om8E8AmjJ7y6/HLQZKsgqqNDOAarB2vslv6M+h8W
	HqlFY5cpdqrHcyOZ4d6/aRw4+P34RV2mJV39cSvkoXyQ5pl6/0bvipRr/zhFVdydbFhKm9EGnxs0L
	oM7ztEPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tITQq-00000009hz4-2Wjx;
	Tue, 03 Dec 2024 13:59:16 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tITPo-00000009hk3-3SfX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 13:58:14 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-3000b64fbe9so7361131fa.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 05:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733234291; x=1733839091; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pj5SaA33rGzeah/pbmVRQIoqaIyNVExU4n/MvIb6OOM=;
        b=s818AmeS39MkwXYukcRAe14A7uI9OgdDnePsMtXLujAzNn0GFi8htR7xOZkW1jHszM
         QmppNn2LCuK/sQo2q16n3xqeM2qP1mKWdDIEZ49BsqB1FXAJhrT1bodAETIE1lvfzLNz
         TG6x6c+47EBlOcKh8/gVKcDQpOs4vtslpFcPuniK4lkYft0uz2IFBiVFyjmVZfKSTYSQ
         uAH8oGMGsQ3TYLx0qPNNy6ozBKC6rRHNCXMyc+zIpu8fonbezf2CMCwHfyNf3uBxxtVi
         abnJ6OmG+LifVwkmwnXLCFNvSkQ9cfRa1WalVsMBCc3I+eJ5z/mhX2qARhqMoMyTFOlj
         KzJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733234291; x=1733839091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pj5SaA33rGzeah/pbmVRQIoqaIyNVExU4n/MvIb6OOM=;
        b=ngt4Z49aX7l4TkX7iaByoWZ2Sv5gsCnToTzk1HMvdOkjX0CrdFPyD/zdFYHu44gJSB
         J+ikJWCFrUV0opIXJxFSVDef1aFXdu2rceWT5eNjVSpwDtrpulXKZ0xiX8uvSFBJhpJB
         DCtPJghI0mRrYaXXdrLHy5xhgW5tLRXs9us+mmil/iA90SZw9giDInpu7rxzG21PT0Zd
         wo2blOVG9SeBtF2tyNLoXbhpp+z/rerY0P9kRDnsKvr1Q2nnPY26jpMeTIiLRqSDDyhd
         /fKSPQxq6x43bWFon9cBaC2nomOYtMy34oht4bkcpVOzwBoD5K3YjOmRVhaLJgjQP2C4
         TNHA==
X-Forwarded-Encrypted: i=1; AJvYcCX8VxdidjW5JqS1KYmeiY5xQN+nbpZ5XodNVr0KTvJllHmLhtHcSQmUB5wNYAphcck5usZSTKrCHXraPqnENH4f@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5plmckhA1IEb/3Xn1Zn99lBroyPhjv+vCPL7O08iUReDgjmy2
	j31WeTCmI9njlDdrjble5lbaxG38u2aRY9zRctaoUn95FKgVgb6f4ap4xPZMHoU=
X-Gm-Gg: ASbGncuHMmMeTS/1S5dXrFUiIC+1ZhEF/kWp7oyiQCUFSAFWTlXPij3M+x/5X4xU1/W
	xV9dzfYYCK2KYBvv3bprSS16hy20tG4+35h3C5kih/n+Q1tYVBhRMgh/y7A596jKzGVc6SW7KR/
	WDEGnsVWxpQMCAHbaYel2HR8FbqHXlCbiXLBLeWo6Y28NbJvpJ0YhJAuY4nW+GQ3Bn18HFkFQmz
	TgzWP9yJ7xZaw6152hJK7Sbq1BIOzN/0J2o9XzH5nJO0dkLq1In4+BiXfAO8TYxRP4SV7ZWH2A9
	T92tvEZluGmeyHAK/ijqDJ8HCKMYYA==
X-Google-Smtp-Source: AGHT+IHfqup3wRu/YlQwHjftG9hZZW4Odf6KSlTWBL24IqkfpJKbOUgrh1DX0z2m6JH7KpitaUiUxw==
X-Received: by 2002:a05:6512:2810:b0:53d:cf78:f240 with SMTP id 2adb3069b0e04-53e12a2e9bcmr1842991e87.35.1733234290592;
        Tue, 03 Dec 2024 05:58:10 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df6496a43sm1829234e87.213.2024.12.03.05.58.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 05:58:09 -0800 (PST)
Date: Tue, 3 Dec 2024 15:58:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
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
	Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org
Subject: Re: [PATCH 07/10] drm/msm/dp: use eld_mutex to protect access to
 connector->eld
Message-ID: <n2zmw4wquxzht6gvlx6yjurpobgwlsryh75n5gw65j5vjclhgr@jqubqjispqsr>
References: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
 <20241201-drm-connector-eld-mutex-v1-7-ba56a6545c03@linaro.org>
 <ca906dc4-ac72-4a76-a670-36c011c853c9@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ca906dc4-ac72-4a76-a670-36c011c853c9@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_055812_871614_8881C8E9 
X-CRM114-Status: GOOD (  16.19  )
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

On Mon, Dec 02, 2024 at 07:27:45PM -0800, Abhinav Kumar wrote:
> 
> 
> On 11/30/2024 3:55 PM, Dmitry Baryshkov wrote:
> > Reading access to connector->eld can happen at the same time the
> > drm_edid_to_eld() updates the data. Take the newly added eld_mutex in
> > order to protect connector->eld from concurrent access.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_audio.c | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

Ack to merge through drm-misc?

-- 
With best wishes
Dmitry

