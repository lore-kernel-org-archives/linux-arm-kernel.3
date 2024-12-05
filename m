Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D02ABE7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 04:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hGG58PPNUdG6yFsy5c8QvSogOQV4k5XxMtrE/57gdpk=; b=Zq2XxpS+YjryTLCX5gE1Vtr2AO
	DJeBgUSvTqFBkccLj40fmTvj4oNfbH7eGyL+mRJLwn2vPSHwhGijyV6Wmg/h41MF6m1mlgLjWfOPj
	Ildxh2VyOSIsgXdPqpundFlJDhKrflZp1Mha9xJSnIMPTAeKKDtXA8yNu8p4lQgfubLzZ8hdZd+sh
	Ak4svcdkqYvXAtMD9Ow+lpgdsdJ588qQfylkzZT7zSftFt3GNRfGdwj54z7dEEih4fx8w9BMuy5ky
	eTE2bkXALyaszBHpWoNeR0z9HAHx7LoTJc/ATVWUF0lTbVPFa9QAe4DgL5f+Frw1OmuyC/7BJvU4V
	x/qKrcyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ3TL-0000000Ejbm-2GUw;
	Thu, 05 Dec 2024 04:28:15 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ3SJ-0000000EjUU-26tM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 04:27:13 +0000
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2ffc016f301so3679541fa.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 20:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733372829; x=1733977629; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hGG58PPNUdG6yFsy5c8QvSogOQV4k5XxMtrE/57gdpk=;
        b=UOX/DIoT0JRI6QgIPx6+gu0q0mAYK26LFaIFcPSBnYy0ikp/eozAsKRqpj4TzrJ3oL
         Utssz3L6Q2vf/6nVKEhqjtatNVHzullXaMqLRLumeKHjT4cOOd/rKUHy/cLaekC3VNpj
         FzpB2QYPBACnDTdzr9qe6daVARiwYpytqVuWLKlU4BVIimNkMPye6mR86vVODKuxT6Oc
         K5KpYN9LM5dxSnSqT301Us7HefiIndP/QJyHZle8Mytx69E4pvqWrAjeAy48jVhvjkxw
         k3vYkpLVCHji6jH0iEFzDk20oFItTef8JrfVJeYFcJuWtQNfgmCXsNGhVt2+KtMZqGG7
         E6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733372829; x=1733977629;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hGG58PPNUdG6yFsy5c8QvSogOQV4k5XxMtrE/57gdpk=;
        b=INkWImspdxZGPNnD4Z1Em3idmc0wpOp6nakYaPkFk8du/p+JplzEbo+xK2v7iGWtNY
         wV+oz6YPgI0Xi/n14tVNaKkqwtUquOt9Mj4Y4nZX74bm9l925ZFyFfjrUtvZy7LuK17T
         DHz8tv+1CJkPGh0Em1qC1JMKpapQm5gQ40/zJC+dn4meW/44lWKlFMtaIDhmeHusAVPV
         jYOTOdzx6DoqlRJ4TrzDYYRoer4cMmfyqay90UCM44MM7rlhP0OMe27r2Cj6NN8fGbFf
         vsWRUmpVOuusSbnI6syxHldisbBW3Y98rUVvFR6zcwi9l0wAwZ3YpqalqWnqOmn62ebZ
         dVLw==
X-Forwarded-Encrypted: i=1; AJvYcCV6tBikEYAEWSa5/QVhy4NFcfKK3uZhwySPoQJ29TgTY3LnSSFUNyXxPhtBMGnNlumBdBzukGNSpsS46jYZWMpK@lists.infradead.org
X-Gm-Message-State: AOJu0YxO2o0tPp91VdiXli3Ks/D/kFR1TC0pPl0tIC9frmRtNuYeyq8u
	HLD+yXlf4vVPdiW5rQztG9Vvxlm3r5WTyigeMjBBXpSu7e/cU1u4Ek3ejngkVTvsabPkL26xZC4
	DxeEIMPStV5N2j1159usBcf5BhUI=
X-Gm-Gg: ASbGncv1P+pdkurdjUj6eRNBijSZ6gaBRhLWORgfqxxjo1bmL3LLHM2P3pFI6s2m1PF
	PXTrtP2Tv4qQtCHQ16wqcO/0/WrAOunYPGSaID+VpCbw3VD4CFT0pde8GUfUXFA==
X-Google-Smtp-Source: AGHT+IGwq7mHQY6OyBNEWfVMfyb2cdRLN/ZLgtIRU53T6xPRl/DZ+46JSQtVSZqp9f+QMloMtKsfVEqih2zUDNpYWgY=
X-Received: by 2002:a05:651c:885:b0:300:259b:58b6 with SMTP id
 38308e7fff4ca-300259b5c69mr270441fa.5.1733372828750; Wed, 04 Dec 2024
 20:27:08 -0800 (PST)
MIME-Version: 1.0
References: <20241007150904.9840-1-advaitdhamorikar@gmail.com> <rr7pp6a77tmur62vu2xdpasokokta7g6kcgjcd4iydmzyqpd5e@z45genf4gsv3>
In-Reply-To: <rr7pp6a77tmur62vu2xdpasokokta7g6kcgjcd4iydmzyqpd5e@z45genf4gsv3>
From: Advait Dhamorikar <advaitdhamorikar@gmail.com>
Date: Thu, 5 Dec 2024 09:56:57 +0530
Message-ID: <CAJ7bep+Hc4Uw1WUBANtR7UGfVrDVyFe_0iPJ=ja=EczO6kk9Nw@mail.gmail.com>
Subject: Re: [PATCH v2] drm/atmel_hlcdc: Fix uninitialized variable
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_202711_564451_D44B037A 
X-CRM114-Status: GOOD (  13.29  )
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
Cc: Simona Vetter <simona@ffwll.ch>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>, Boris Brezillon <bbrezillon@kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Dan Carpenter <error27@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>, skhan@linuxfoundation.org, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org, anupnewsmail@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello,

Just a gentle ping, this patch was never applied.
Is there something more that needs to be done?

Thanks and regards,
Advait

On Mon, 14 Oct 2024 at 13:08, Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> On Mon, Oct 07, 2024 at 08:39:04PM +0530, Advait Dhamorikar wrote:
> > atmel_hlcdc_plane_update_buffers: may use an uninitialized
> > sr variable when the if condition remains unsatisfied.
> > The variable may contain an arbitrary value left from earlier computations.
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <error27@gmail.com>
> > Closes: https://lore.kernel.org/r/202409240320.MZPgi3Up-lkp@intel.com/
> > Signed-off-by: Advait Dhamorikar <advaitdhamorikar@gmail.com>
>
> Fixes: d498771b0b83 ("drm: atmel_hlcdc: Add support for XLCDC using IP specific driver ops")
>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> --
> With best wishes
> Dmitry

