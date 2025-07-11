Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91022C83F22
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 18:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=; b=E+8mJOIlN+8YgUogy7+voS356M
	FLysF8QwpDQtnlq5O/l75r4n7UK8W2LnPxLmybiDFGThVQsN8bzL4JFSjdxAsZi+/xl6x91SqjnoQ
	YGdJFcVPpYL2T935ThxrqeqDlJLhbdOwqrwHyLGIl8mQC5wwBamh0GEyA0NuSdggRRRzlWVSpEOZz
	aXFdBth506FbwqOpVP1InlxZFxAJr96R5FO1Gt76arpqCQhU5HZQyI10aLmR3MZldgRUAErmwPmdq
	FxmCWBOSjpr5QbjhPbwhXPbtyCz1+8Z0WFF8aZet80UT4lRQwJBLDCvjA1NxZL1ia7qJ+d/kyNL2S
	FtJ9PVug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaICl-0000000FT6i-1FKr;
	Fri, 11 Jul 2025 18:10:39 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaHnn-0000000FR3h-05sj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 17:44:53 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-32b7113ed6bso20235521fa.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 10:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1752255889; x=1752860689; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=;
        b=GT2nUCE0mmVyMcQQ7/7KYBL7PSilddV1i3wHsg1n5rhhmOViMJjseTvcVNmJpykQFE
         9l/uHkZSh3S46Nr3kSN3a7IPcQV8su5cTKSRdjAk7y3y86UgNhEaEU8bOmJxBE4NuX8k
         u7zcp0wt7yVphD3ohR61UDPqXe2uM8+djWveaUyIwm+UV/ki+V+xShDGcMRuRpbVR8y1
         UkUnHRpMIXfeDNIshTPZc/dB7L3Xcn3MjE80RBkplClO1pEoT2TcDyDOah5zSMjPmzUp
         tgXhA6yU6GdPZMPhq9lx/YmmFlH0zUmx1VbjudSEsJxe8l0eACYYKRdOEwdQNEFGjRJM
         iKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752255889; x=1752860689;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u+ZM5SO8L4rZ2xYIS3dtWrMrDyHsyXlquIkrSDaXE+w=;
        b=fslpxcjXTqYrkEDNyQngv4ngKtCbSXfqBGzFtIcq2i5DOHNkUs+aqR7RoEF9XB/2NH
         6OEUP42P0VONnYLrx75KBBvdQbyDY4DOIT04OXsDCY/11NxAMJEqJPNGQjwPYKwip8GH
         kvtHGGrbROnHc9/mc+LHcoKNeysjt1ztcGb8SwYHX5Zew3GXi0y5lIARx9nTiJreF/gr
         lmNn98URWe5MAbG3Ww3VJUhT90d008DvGAuSNaGIbWHmnM7UXQhgnSuRc1EXJCsllrN/
         o0B3mtEpceVgU+DGnem9+Ozz4RyYhIKjecg38LK1PdlWsJuQX7xVrA3f+bpaGSxXz7bE
         cDqA==
X-Forwarded-Encrypted: i=1; AJvYcCX3oggVFXQ4ZRUDd4gw93aLsqCPXfvFpCqq2J9Xp02I4cQ0EVUMrn3P4/Q7gNz++xg28Z/Tdb7XGxYtpEReaJiR@lists.infradead.org
X-Gm-Message-State: AOJu0YwE/jc+JozsbcIvsnUJrJPekNnAdUU82wH+0URKJ40XvdL4qENi
	Oc5jpUhAgXPC4HRiCzgxd4sxMBYkUk6L7QTZMt++1V2TNOWFKB52GR65uRLY6JIWh11GGVTgMFx
	AAyhzOtRZXE5nNxuIYlVlt+l6Xu3Xm89LBACWpd6vpw==
X-Gm-Gg: ASbGncs7B8Ds+rXWlRLUpun2d6k7O3GsiC8v/8OmNdWo2iG5M+fOgX3WFxOQQZysozm
	RMChcodJdSpzRZHcUjfLcmItw6HYBmpH3s5QsCUJO3duXGyQuyYX7pUn5qE6YoNQdt7SMNhOrdd
	z0ga0WZBTyZPIPUTvhC2f3n8gJ3JH8HXhKxNV9eWch5yu4eiSLjHzWK0ppewJ/JzuVS/7tZwf5d
	t3yfEI=
X-Google-Smtp-Source: AGHT+IH6ZOzBfHIgYUwgOc3NHyt2gji+Em8NzLEp8xFU4pLvltizLDn2SrTtw5BwtYgzrpRFDHd1anYmDStmm3/BYxA=
X-Received: by 2002:a2e:ae05:0:b0:32b:75f0:cfa4 with SMTP id
 38308e7fff4ca-3305343ffbdmr14799021fa.25.1752255889239; Fri, 11 Jul 2025
 10:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250710-drm-clk-round-rate-v1-0-601b9ea384c3@redhat.com> <20250710-drm-clk-round-rate-v1-5-601b9ea384c3@redhat.com>
In-Reply-To: <20250710-drm-clk-round-rate-v1-5-601b9ea384c3@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 11 Jul 2025 19:44:38 +0200
X-Gm-Features: Ac12FXxUNTUQvVOGg3MoOkpShRe7WywXW6kbpP4WvN3P-CcJwwv5gR7MoObTWCg
Message-ID: <CACRpkda3R+2hhzvd+snkTGrRb-gZ8OUvzAhFE5Cg6yXfZ+E4nQ@mail.gmail.com>
Subject: Re: [PATCH 5/9] drm/pl111: convert from round_rate() to determine_rate()
To: Brian Masney <bmasney@redhat.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
	Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, 
	Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Stephen Boyd <sboyd@kernel.org>, dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_104451_053994_69B5C5DF 
X-CRM114-Status: UNSURE (   9.11  )
X-CRM114-Notice: Please train this message.
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

On Thu, Jul 10, 2025 at 7:43=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:

> The round_rate() clk ops is deprecated, so migrate this driver from
> round_rate() to determine_rate() using the Coccinelle semantic patch
> on the cover letter of this series.
>
> Signed-off-by: Brian Masney <bmasney@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

