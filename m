Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25B5EC369DC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 20:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=duqrSY39uZvRf9QP4FI5wn82Hvp3y0G6BGsbl6wCfsU=; b=eoNUl3J3DysU9rrk/1v8jXN9Uj
	veM1XIri9tmLiBRdGXGjZA19ZCdJ+cTFWga2ri0GDpOh3+TIFM3EdOIM69GjNVQTlM1M90Tk674gS
	+j+/5T1G9OUxN1Z8rD7OARXRClmgTWar9eotcOd1ZuImjLC/XXr3WHY+3X2wmQBCtBdOkAx0lI9AH
	FmLA1wCD/gVkSi/pohpdebQu5Bjxma8MkfrdPUFJgQ/2GcF23wa0H6xZQs6kedn9Qgit2G0EqDudF
	zgbLYL9yuLJYqNBv8EHG4sWH4QInEInMUO2Jr1/4JXs0FV/27UZdrtpVvMVNOru0WTa8YBBRuWCEl
	Xsa4qNRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9VXy-00000007WwY-35jk;
	Mon, 28 Apr 2025 20:57:50 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9VUQ-00000007W5C-4B4q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 20:54:12 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-22c33ac23edso48971945ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 13:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745873647; x=1746478447; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=duqrSY39uZvRf9QP4FI5wn82Hvp3y0G6BGsbl6wCfsU=;
        b=G0PJrpQu1erIt2Km8GxJXO8RRCYHawsMpXlMLr+u9RhTf2JSTmYdDsIm30V9A2Dkjq
         Gq2u9zmo9nkqy5S4MEWyggSGBFCltkUA7UuL3tNHsSUCZzz0zjZ21mtzev8wiJ/fNK6Z
         U9GarKhWlS1yNhF8VLNGev6mhejUT7bAJSrug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873647; x=1746478447;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=duqrSY39uZvRf9QP4FI5wn82Hvp3y0G6BGsbl6wCfsU=;
        b=q8E8dJaHNC2No50qrH/RuMamP6tRVMshVKHoaMYUy1npiQaCFX89FpXA6VVhHmt1kI
         wSzuZ9mRTCwGuhHBPCSyOE5poLvHF0ApgmVa3cKA0crxVmZxyMXB94xkxEI+/XTzzver
         500NAYf1BN67EdWEWUjZPCmPMPkE+LCjd3GjqU36eYbmk0FvvkYiTnTgVnNqzmoT+DCs
         hiI+ASi8euiHjoS6rueYlEgVpqeOHTlVzjhRAQ5eb4QJxKMBkG5APSq/x/reAJCwk2f/
         F+sv2qnP0O/Q4inJJ7jnPpH42q3mVBhBk7YOS/Bnq6W3LEWefV2Yv4BVcSqggvmr34s0
         sOzg==
X-Forwarded-Encrypted: i=1; AJvYcCVJFBpI/so+YeJfmJimw5b1TXOO76x9Ml1YFPTmd69i2BtDE+TSLtZKQHeAFUIldob+59XzQemsJ8IrwRci9Dgl@lists.infradead.org
X-Gm-Message-State: AOJu0YzKy/VKIuOdM8vmw2UIShmwLgrwDEqqvgujz1xZhT6bai8dFVbr
	4YT8CvdnxSOVQuygwmHlQkkUXSO2VirfAIGdLFWk/SCXfIB8f7mQtjF3g48aoNBU1TGOXclJiZY
	=
X-Gm-Gg: ASbGncs5yPlh9leJvI/F9pHiyIOlXRmaIadKZriFqPjg1xuEEjldwhw4+0UycefZJ51
	lzSjicaJTmBaBvRfZXcHXARuXZnv2zK28Lhcph2nki1HvxhMiFBcqfaQLgZX1B1AMt+KLoe36AM
	B+j9DERSDt8PRXjjIHq6H0KqhizTAM+efN5VQGWtbih2nq86GWfBKNL0E78JIgEsl3PxoovltJs
	u53Ka1L/EDqC4TymE8SDsS63rNRj4oZaESOgxPbN6HPAi9iHylZgIIlT4xQJSUtUZ/H0lH54nP7
	YvJYkcFaPr9y8JWSA4SYHR5ZUD5GA0lwoSIcN3ynVRFl8hGgCgz52TfPLVOTrBHRcV4EMBR9IKY
	GXwvU
X-Google-Smtp-Source: AGHT+IHQQQ4RaX6J/raOdLI/QgAedybHI+RHqBlfUsvoHoBx4JxCT6SMcrRR2Fzzeys76YST0lRMbg==
X-Received: by 2002:a17:902:fc50:b0:223:54aa:6d15 with SMTP id d9443c01a7336-22de5fd0c7dmr17293735ad.12.1745873647009;
        Mon, 28 Apr 2025 13:54:07 -0700 (PDT)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com. [209.85.216.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbad7dsm87854275ad.60.2025.04.28.13.54.04
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 13:54:05 -0700 (PDT)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3031354f134so4400385a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Apr 2025 13:54:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU2n7NHVCXaj8qbp/an6qMxlUBukF/0t15FYTnHEKNZGBiuze29bY0atSCKsxlY93+EXleGa9FrT+/T9FRKmlbX@lists.infradead.org
X-Received: by 2002:a17:90b:2d08:b0:2fe:b9be:216 with SMTP id
 98e67ed59e1d1-30a215a9e35mr1596359a91.31.1745873644318; Mon, 28 Apr 2025
 13:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <20250424-drm-bridge-convert-to-alloc-api-v2-0-8f91a404d86b@bootlin.com>
 <20250424-drm-bridge-convert-to-alloc-api-v2-13-8f91a404d86b@bootlin.com>
In-Reply-To: <20250424-drm-bridge-convert-to-alloc-api-v2-13-8f91a404d86b@bootlin.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Apr 2025 13:53:52 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WBxgJ9HZK=UyE8R17OiM0+ME2Lp5O7zoZRVOw2z6_sng@mail.gmail.com>
X-Gm-Features: ATxdqUGX6srhk44LYXds4__tJ7VKjYOOGbCee4VbhetmdBaO7SswZM-oniFpcj8
Message-ID: <CAD=FV=WBxgJ9HZK=UyE8R17OiM0+ME2Lp5O7zoZRVOw2z6_sng@mail.gmail.com>
Subject: Re: [PATCH v2 13/34] drm/bridge: ti-sn65dsi86: convert to
 devm_drm_bridge_alloc() API
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Anusha Srivatsa <asrivats@redhat.com>, 
	Paul Kocialkowski <paulk@sys-base.io>, Dmitry Baryshkov <lumag@kernel.org>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	Herve Codina <herve.codina@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_135411_026940_70EA1B10 
X-CRM114-Status: GOOD (  13.85  )
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

Hi,

On Thu, Apr 24, 2025 at 12:00=E2=80=AFPM Luca Ceresoli
<luca.ceresoli@bootlin.com> wrote:
>
> This is the new API for allocating DRM bridges.
>
> Reviewed-by: Herve Codina <herve.codina@bootlin.com>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I can confirm that I can still build/boot on a board with ti-sn65dsi86
after this patch. Thus, happy with:

Tested-by: Douglas Anderson <dianders@chromium.org>

Happy to have someone else land this through drm-misc-next or I can
land it there myself.

