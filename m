Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D6BDC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 01:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=loyJuf6zNk03z78etJFgemOo09eYVwdWkJ6KQXv4Jfk=; b=DU6bmD/9VQA9KxXjmY7HbBZIwo
	o6SUvl9v0ODbtUHMfjve6+98Bs2oL7na/zPW7hUVG7U6/V71+dYi3T4uRX/kquHSis4c/KRqGSgxx
	OaVIPwYnx/fOOS5aBV6Hgrm8mLjgXzUp/jLtJGx0XEUPcDsPV88WTC1IurxL3DPolE0t+WGQlU+fR
	fN85jHluzQilbpKcsIPNl/gFnRk7LDgpBwsjgtJ0McRzJfx+nSRa/gFt7AqmBrsJZKwDGM24Wa59+
	Sb+j6lQMMyakClh8nfWeKLGkibGYyzWB6TBOubpNGCgbgmh5iqDt0R2M5xm9DrCbEkPcSsaBjnry5
	EewwWorA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmk76-0000000FjzG-1cx7;
	Tue, 25 Feb 2025 01:52:00 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmk5a-0000000Fjs1-4Bc3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Feb 2025 01:50:28 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ab771575040so1053356166b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 17:50:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1740448225; x=1741053025; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=loyJuf6zNk03z78etJFgemOo09eYVwdWkJ6KQXv4Jfk=;
        b=I1wsADA6ezA2m1grJiNHmpU0uxaa2DqOZNvlkHt4K/+sX5sNKE5Ta3ieo/JgHrYUX+
         VMlbg5lILpo7BC70eLzXtxiNKNqdEWwv4pLFwO3P3NIAsPaBDu/6xmtyP6sUt+wKC5UB
         Pj4RKHS2Zm9/+KawB1pHicvw1PC0izKUrF6JU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740448225; x=1741053025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=loyJuf6zNk03z78etJFgemOo09eYVwdWkJ6KQXv4Jfk=;
        b=GmAjW8P0zMuiyvdRKpEFb8fG9h6lUpgqr8xJSvNEmeW1oQX6aJit817+TmFLZncoOS
         RSRDz8rc+FnUoA1OOmML/TzEPpzRuSAIKtt9FaB3G5sidq+GIqI3f5Cfx0f+In4aa2Cp
         y3NKEkLTgJGCW46XMKNu+kD+IBP6L1cCaTtFBq6ZokeRBHPLBXCRN8CONHGXBI/VeUUB
         pl22MaEcLwqM3tHcOnDR4EUH0UgEgtkeEdXhGJtwwAHOi77kgfXxpMLrl84m7fou3UnU
         BxoOSkgsrGr0I9OultSyCQw73iHcS6cwPKLA1H3MGv65al37pGqGREpkQHLK+VzK5y/m
         R0eQ==
X-Forwarded-Encrypted: i=1; AJvYcCXigg+GEr8v0R9C1XMpESyXH9AWmt/CGj0wYCKEsgk80Y8vhFLAmY4nefs934UejSBUphGjayiBNS/ixArMHk+c@lists.infradead.org
X-Gm-Message-State: AOJu0Yys4UPxL9JIf2+avRRhsafqMWMrEAmbpLjFQQBlV9msDunEQvft
	RPGt0UIiAUZHhNN/AFoS33ZC/O646mDKvT9xRgV+TaxzYdtDhIga3LgXnma6o5QqLbBvlOzG3a0
	Qz7va
X-Gm-Gg: ASbGncs9xvM2LbhomFkLlwwYW5FlBjX0D/VcEY8EHUlg0ZUwQOKyvJ2M0tH5bxz0z0O
	rQEuLu3/GB8psCKEDQBm16WzWwpGWuw0/dL0mdCqQLQj6ndGvAikCa9041vuxzDulEIWTm86kAj
	gAydzmzeATxs+hTvPdEiRDdO0iMNXlIMELtvZospqRMrXTNLwwjuIzVrwSgWE0zo7ToK5zUzdmg
	JH4qs6vHq41d8MM8zqbBBM11VnOeAuQZ6F/I8Dz7kpuJpiWkf0DNRsYUwRRKYbzGVkX2XLdnyu6
	M91YgiQqeB+YBq8zLYPtnYh6ARaHma9/3myQ00jHofCKDzyQta1Fs4EdKgB2nyU2EQ==
X-Google-Smtp-Source: AGHT+IF3B68BT0Bkuj/aCbRhSW3UpHd+hNQdlXfVUcAKZpgWphFVKtTY6a6qXbGrjJOpK4D0AiH1CA==
X-Received: by 2002:a17:906:3151:b0:ab6:504a:4c03 with SMTP id a640c23a62f3a-abc0b037859mr1152720766b.24.1740448225192;
        Mon, 24 Feb 2025 17:50:25 -0800 (PST)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com. [209.85.208.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed205db91sm53175366b.160.2025.02.24.17.50.24
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 17:50:24 -0800 (PST)
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5debbced002so9177274a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Feb 2025 17:50:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU9oFvtFomUh/lo6GeBxTcZ1koC0ctE7LM0MeccCh5Yf6mwolODzOvWz4w+j2mi11PyRnOhea5+7Ok8iod0laKu@lists.infradead.org
X-Received: by 2002:a05:6512:1253:b0:545:6a2:e59 with SMTP id
 2adb3069b0e04-54838cb627cmr5635189e87.18.1740447736562; Mon, 24 Feb 2025
 17:42:16 -0800 (PST)
MIME-Version: 1.0
References: <20250224081325.96724-1-damon.ding@rock-chips.com> <20250224081325.96724-11-damon.ding@rock-chips.com>
In-Reply-To: <20250224081325.96724-11-damon.ding@rock-chips.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Feb 2025 17:42:05 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WS_2JAKMyFFmrNtaN7-O4dh2hOXHc25FytDxXAjAr+5A@mail.gmail.com>
X-Gm-Features: AWEUYZkb9AduQv4S2t7Q6Lb4ouepbii0QdSB144heJ2UJlKArYXhKCxoqxEOhvg
Message-ID: <CAD=FV=WS_2JAKMyFFmrNtaN7-O4dh2hOXHc25FytDxXAjAr+5A@mail.gmail.com>
Subject: Re: [PATCH v7 10/15] drm/rockchip: analogix_dp: Add support to get
 panel from the DP AUX bus
To: Damon Ding <damon.ding@rock-chips.com>
Cc: heiko@sntech.de, andy.yan@rock-chips.com, hjc@rock-chips.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org, 
	Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, jernej.skrabec@gmail.com, 
	dmitry.baryshkov@linaro.org, sebastian.reichel@collabora.com, 
	cristian.ciocaltea@collabora.com, boris.brezillon@collabora.com, 
	l.stach@pengutronix.de, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_175027_039761_AEE17A87 
X-CRM114-Status: GOOD (  15.70  )
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

On Mon, Feb 24, 2025 at 12:14=E2=80=AFAM Damon Ding <damon.ding@rock-chips.=
com> wrote:
>
> @@ -392,11 +393,27 @@ static const struct component_ops rockchip_dp_compo=
nent_ops =3D {
>         .unbind =3D rockchip_dp_unbind,
>  };
>
> +static int rockchip_dp_link_panel(struct drm_dp_aux *aux)
> +{
> +       struct analogix_dp_plat_data *plat_data =3D analogix_dp_aux_to_pl=
at_data(aux);
> +       struct rockchip_dp_device *dp =3D pdata_encoder_to_dp(plat_data);
> +       int ret;
> +
> +       ret =3D drm_of_find_panel_or_bridge(dp->dev->of_node, 1, 0, &plat=
_data->panel, NULL);
> +       if (ret && ret !=3D -ENODEV)
> +               return ret;

Can you explain why you treat -ENODEV as a non-error case here? Maybe
this is for the non-eDP case (AKA the DP case) where there's no
further panels or bridges? Maybe a comment would be helpful to remind
us?


> +       ret =3D component_add(dp->dev, &rockchip_dp_component_ops);
> +       if (ret)
> +               return ret;
> +
> +       return ret;

nit: the above could just be:

return component_add(dp->dev, &rockchip_dp_component_ops);


> @@ -448,9 +460,16 @@ static int rockchip_dp_probe(struct platform_device =
*pdev)
>         if (IS_ERR(dp->adp))
>                 return PTR_ERR(dp->adp);
>
> -       ret =3D component_add(dev, &rockchip_dp_component_ops);
> -       if (ret)
> -               return ret;
> +       ret =3D devm_of_dp_aux_populate_bus(analogix_dp_get_aux(dp->adp),=
 rockchip_dp_link_panel);
> +       if (ret) {
> +               if (ret !=3D -ENODEV)
> +                       return dev_err_probe(dp->dev, ret,
> +                                            "failed to populate aux bus =
: %d\n", ret);

IIRC this -ENODEV case is for old legacy panels that aren't listed
under the aux bus in the device tree. Maybe a comment would be helpful
to remind us?

nit: don't need the %d in your error message. dev_err_probe() already
prints the error code.


> +               ret =3D rockchip_dp_link_panel(analogix_dp_get_aux(dp->ad=
p));
> +               if (ret)
> +                       return ret;
> +       }
>
>         return 0;

You can get rid of a few of your return cases by just returning "ret" here.


-Doug

