Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F3EC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 21:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aTECS3SKQyqLPvpHn3SdLnl7nJuW0BjxdhYYx7X/Yrs=; b=BaHSFh1bHnggPY6TK2jaP0PIv2
	2YmrA4VKMO9FNgUt6TOvpHdmNWw+a7eU3v2pwq87wBuMvTUEZxto8pWNUYqr2LHw62BvUy2u4ERfO
	yboCOSRZKEa79yxpWjdP4QdiU6/K+wPO4GKZI/Fb2YAR4HdUyUhid0EcJG64Rf1W2hO6nuMboLaap
	DbuVlbZg1V9lu26zES5y4X1jc+jXv01YlLkqFHPzXHgOlepA2Wbk8ic9rcbWHEckDTmdAu2jznW/C
	Y/kFB2az+/SWBjPo27R6D2yQOzzXGETeIroTLZw8X/sd+sY14nqWiilycZC+FEZyM3vbUZJXweSj4
	bAD8qvdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn2bZ-00000001Zvt-1LaU;
	Tue, 25 Feb 2025 21:36:41 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn22v-00000001SXs-2fUb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 21:00:55 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-6fd2587d059so743947b3.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 25 Feb 2025 13:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740517252; x=1741122052; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aTECS3SKQyqLPvpHn3SdLnl7nJuW0BjxdhYYx7X/Yrs=;
        b=R+S84m/jwbTa8QyxykZME//YlomhUauClLLvC6W39tmdzdqO7YOQ6FVfzX/C8EG/KV
         7laOwsJWW745ulscuin1Hl3geScxn6wTMGezccDDdwcrTnVCYTMzFJxDCT3n5FPU49i7
         1+5vR6PqXEWDgVNiXuEEQ+1FCidAqXJfS53Fzp9K7ht4SxqrGu83R64VtLZvndL/cxCn
         DlSs9zBPscMJIIpYFUL7HA9SqRPlftxehIFNpd/hcVc9r+MLr/+GYRp21ZIvobkO+2JE
         L/9RGaSjSsmn+MO+MZai7/aL622NJzVcwNaGDkeSYR0NkiMhRd9hCE4eLOnbqdRC/AuM
         ytaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740517252; x=1741122052;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aTECS3SKQyqLPvpHn3SdLnl7nJuW0BjxdhYYx7X/Yrs=;
        b=NRAtasZGe31/JIPsPiMAH2Yb7nfBtd0g4WwhaS7OkXyWgF4sbrtdnpcN2uQfP3weL5
         r59AuylSqAUEcRr8OR0Jl3ULSrM2YVL1PA7N7wT4eSD4ZEznQ0HpxeBL+OqcxZQiVbOs
         HGCAibKJisgeG+o87ylcdtW12s6xDxdv9FQyccumu7lQcQJ+Gy2QnA+dA9rY09kTHUfq
         kFXc8DsSRNLjESGrYG9UeI+09Dq5/qzrQb06h9D4nMp3tWbaiZJ5B1seEF5qgDcg32Ky
         1Zj7x6WsCz5XWiKnXjGTmYvy5rnm1W1KbbNBIVxJiwELBEyD83YZATIfHvfVYpwbe8At
         pWhA==
X-Forwarded-Encrypted: i=1; AJvYcCUv6Qv/jtAlK4PBz2df0GU3XYkLbJe6asBvJBuqcQ77Wo893Z+3wNzwZWY2AG6Scthq+ioguqTgdgUBnUgEqmPX@lists.infradead.org
X-Gm-Message-State: AOJu0YxOd2voMkKqlo9IVQ2gWk8wk+gBvPCeCWRXsEFNKOiqD6tvEwad
	ItmZyRwpYftx/JpKrFxsKQ2+F9kh1FRxO6AvL/FgpB9/ZXhWxdivX7QYsYtP6JYqaRrY5IshPJY
	FUHI/w4aLK3vABtPL5mlET2T+pI9ps9INYgkSWA==
X-Gm-Gg: ASbGnctYHXLMOtiDKF/StTJ+tIqUj4RguOfxz+EU8la3pvtxF0MGFfCR0v79nMICTkC
	KNeNXUd0k17J/ROgHXqj1onUFGPa6+5fGPFKcX//ohKgXZU19rC7guCcn0DiyhHIxtknZFLcbjU
	aAkp7tyNMslvgSJHHf93SGShQEgtOYCOTXtUkVOAg=
X-Google-Smtp-Source: AGHT+IHVNAF9M985zwQc8ti2DtEeKOd6IPqcLWmaevOapLPMkqXyG9p9oh+HENqNXQGjtwqlmhkaD1MmqhA217I8byY=
X-Received: by 2002:a05:690c:888:b0:6f7:50b7:8fe0 with SMTP id
 00721157ae682-6fd21dc678cmr11826067b3.1.1740517252440; Tue, 25 Feb 2025
 13:00:52 -0800 (PST)
MIME-Version: 1.0
References: <20250217-adpdrm-v7-0-ca2e44b3c7d8@gmail.com> <174047913824.2131221.6545389561298332217.b4-ty@linaro.org>
 <CAA8EJpqM8ZQ-ScEtEBXaUF2Nargtp_TBAyMYvbJ49PGbwPWjaQ@mail.gmail.com> <2d51cb9e-b8c5-4cf1-bd7a-751fb633275c@linaro.org>
In-Reply-To: <2d51cb9e-b8c5-4cf1-bd7a-751fb633275c@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Feb 2025 23:00:40 +0200
X-Gm-Features: AWEUYZnjLNgOW9D81B_b4Ug4M1LEmwU_chC0K6f10jOh7vvlfER0M0Paj99xQ-A
Message-ID: <CAA8EJpqu269ttsUcEsJpBOexRUS+pKSaMESLosC9iNCoUCtroQ@mail.gmail.com>
Subject: Re: (subset) [PATCH v7 0/5] Driver for pre-DCP apple display controller.
To: neil.armstrong@linaro.org
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
	Janne Grunau <j@jannau.net>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alyssa Ross <hi@alyssa.is>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Neal Gompa <neal@gompa.dev>, Nick Chan <towinchenmi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_130053_676411_985070BE 
X-CRM114-Status: GOOD (  15.92  )
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

On Tue, 25 Feb 2025 at 19:59, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>
> On 25/02/2025 12:37, Dmitry Baryshkov wrote:
> > On Tue, 25 Feb 2025 at 12:25, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> >>
> >> Hi,
> >>
> >> On Mon, 17 Feb 2025 12:39:30 +0100, Sasha Finkelstein wrote:
> >>> This patch series adds support for a secondary display controller
> >>> present on Apple M1/M2 chips and used to drive the display of the
> >>> "touchbar" touch panel present on those.
> >>>
> >>>
> >>
> >> Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)
> >>
> >> [3/5] drm: panel: Add a panel driver for the Summit display
> >>        https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/40115947b59f2ca361a47615304dff0a2b69a2b4
> >
> > Without the bindings?!
> >
>
> Bindings will be funneled with the rest of the ADP driver, the panel driver can be applied individually.

Okay.....



-- 
With best wishes
Dmitry

