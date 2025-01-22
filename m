Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38F7BC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 10:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cVxMUkk0amVJCc0EMm757pTzTOt048b6a2IjjsuaC3w=; b=FHo3/i8DpDgEeeuBnY1A33oYcq
	Ywr1a0fPkYSp8m/7g2tyq+01xfTzkZgWCYh+55W6AGQhRl0n1EdbGyWKUglF87lCcieTRwQMDOkqo
	bSnce6GxVkMs6Jt9l4l12vpz3/S/RD3U5fz0KL3RQ4qm6qEQW+wQdelqd4WLraPbppHCBKAtU2jcx
	w6Agy6nxsMDoc/IXUxsjJJUu7w+OmMmCtbRntdCE45gff8A3hM3bBMA/G9Yzomazw+H8pXeLbCItV
	QXGMTDBI6FLcqScypiMst57Z72dZIWsO/KD9bzMxSR5tPNXpbbC6pAkBrc/youSNSg9MKNYqLYcyN
	GTdkP+sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taY6j-00000009xtR-2FaY;
	Wed, 22 Jan 2025 10:37:13 +0000
Received: from mail-vs1-f52.google.com ([209.85.217.52])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taXzJ-00000009wI6-0dK0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 10:29:34 +0000
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-4b24d969db1so1424310137.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 02:29:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737541771; x=1738146571;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cVxMUkk0amVJCc0EMm757pTzTOt048b6a2IjjsuaC3w=;
        b=bDyu67yTVPDJLeK3WKsvGYHitWSD+QPK1wqdCbIg1lZ8XylR8iyR6Ra4BFXcn2bB1e
         2Be8RfYvRt7dYe1h/g0yXMVGIg1r8EbAfrb17RMqn5DQj2rXRJRLr+uSr+7GNVOvFFOp
         ZJ0hpR8iCMVNmpqKez6Fc3zXQo1lU6pS8GNxGPqN22hpjMKv4TfrijKn8Tgx17dULNvW
         HDwO6IenXF+P9NsJksIHkpUTG/rxL7302XjXV6PIfMdPzZT36QY/Nl4uz36GqlI+toXF
         j9rpOgBDULo5Omf9OdXgAOKKy0prSFZpuP6S36hDijZXFwXU86yDSHusQ2kk5HiXn9sC
         2dgw==
X-Forwarded-Encrypted: i=1; AJvYcCXKOilaEDADskeOtvd+eyapY6SpGeONgcCrJCgxKj6gM/ALyYetNwK0Jxq4SDQveA8XqoRv20djoXsneoYUkyEU@lists.infradead.org
X-Gm-Message-State: AOJu0YzVylGnwjI0dW8AHiLijseJA/wZYtvjqg9OEie8GBCOoCI33md1
	8LDiZogVcPQAVY6JVIRMtK4T0Zor2W8niZQlXdy7+V26CBv7s4VR3AZiP66M
X-Gm-Gg: ASbGncuc0ZXsVaPhILXGQfdzmgV7/EjGkZYuUGSQogzIpoGHYf1R5noSrd3/oETJUTt
	1RBfMTzXn81N3IEHei4KYSbpK8+ayvrsP+xfF2Z1b/e4J+Acjpl+tAvGJxIGPY/l+f/tq4piL5n
	pJJCsebgk/G46wPk/USGyzqzsf7IPlUD48mvabLuD5CWqlvZ1excbpITMr/YscxPSQzZpYsa4gN
	WqeFBi7oeJX3BWXagVT+RbqG1haa72qddudpWs/0XKchpcyNaJ8y9CxUfrSaRPEjs+oaw/iAMfC
	EP9uHOq0wPychMz91AUD+k7gAS55bsos
X-Google-Smtp-Source: AGHT+IGD+kIlOkh5TblbfYDptDGUE7bal1b61YCPrfvZax34p8/Wm4F9VvP8L+sVFQkTjtOnJRzirw==
X-Received: by 2002:a05:6102:952:b0:4b4:6988:b140 with SMTP id ada2fe7eead31-4b690cb91e8mr16579633137.23.1737541771363;
        Wed, 22 Jan 2025 02:29:31 -0800 (PST)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b68a1edb96sm2657801137.5.2025.01.22.02.29.31
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 02:29:31 -0800 (PST)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-4affab62589so1902433137.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 02:29:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVZJzWYtmYhDGVvIc63aURBJZQR5egTEqVRCUadtTk5iVV4o6EBitlil/+t2ltguZRFcCP1g/1IWUiMmCSebDKD@lists.infradead.org
X-Received: by 2002:a05:6102:50a7:b0:4b2:af6e:5fef with SMTP id
 ada2fe7eead31-4b690babad2mr16700673137.9.1737541770986; Wed, 22 Jan 2025
 02:29:30 -0800 (PST)
MIME-Version: 1.0
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com> <20250103163805.1775705-5-claudiu.beznea.uj@bp.renesas.com>
In-Reply-To: <20250103163805.1775705-5-claudiu.beznea.uj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Jan 2025 11:29:19 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUDKFRsZWsZG9DY4PHdxQEDoPqzfeRx8MNTreOpxdLvpw@mail.gmail.com>
X-Gm-Features: AWEUYZnD9dEO21kjbX8q_1wcIS_Gmpp7OlV_wqcigMRQXtVoeDic2BsiIeJXlvQ
Message-ID: <CAMuHMdUDKFRsZWsZG9DY4PHdxQEDoPqzfeRx8MNTreOpxdLvpw@mail.gmail.com>
Subject: Re: [PATCH 4/6] thermal: renesas: rzg3s: Add thermal driver for the
 Renesas RZ/G3S SoC
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: rafael@kernel.org, daniel.lezcano@linaro.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	magnus.damm@gmail.com, mturquette@baylibre.com, sboyd@kernel.org, 
	p.zabel@pengutronix.de, ulf.hansson@linaro.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	"open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_022933_188351_894DE428 
X-CRM114-Status: GOOD (  23.28  )
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

Hi Claudiu,

CC iio

On Fri, Jan 3, 2025 at 5:38=E2=80=AFPM Claudiu <claudiu.beznea@tuxon.dev> w=
rote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>
> The Renesas RZ/G3S SoC features a Thermal Sensor Unit (TSU) that reports
> the junction temperature. The temperature is reported through a dedicated
> ADC channel. Add a driver for the Renesas RZ/G3S TSU.
>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Thanks for your patch!

> --- /dev/null
> +++ b/drivers/thermal/renesas/rzg3s_thermal.c

> +static int rzg3s_thermal_probe(struct platform_device *pdev)
> +{
> +       struct rzg3s_thermal_priv *priv;
> +       struct device *dev =3D &pdev->dev;
> +       int ret;
> +
> +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       priv->base =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(priv->base))
> +               return PTR_ERR(priv->base);
> +
> +       priv->channel =3D devm_iio_channel_get(dev, "tsu");

Given there's only a single IIO channel, you could pass NULL instead
of the name, and drop "io-channel-names" from the DT bindings.
I don't know what's the IIO policy w.r.t. unnamed channels, though.

> +       if (IS_ERR(priv->channel))
> +               return dev_err_probe(dev, PTR_ERR(priv->channel), "Failed=
 to get IIO channel!\n");
> +
> +       priv->rstc =3D devm_reset_control_get_exclusive_deasserted(dev, N=
ULL);
> +       if (IS_ERR(priv->rstc))
> +               return dev_err_probe(dev, PTR_ERR(priv->rstc), "Failed to=
 get reset!\n");
> +
> +       priv->dev =3D dev;
> +       priv->mode =3D THERMAL_DEVICE_DISABLED;
> +       platform_set_drvdata(pdev, priv);
> +
> +       pm_runtime_set_autosuspend_delay(dev, 300);
> +       pm_runtime_use_autosuspend(dev);
> +       pm_runtime_enable(dev);
> +
> +       ret =3D rzg3s_thermal_read_calib(priv);
> +       if (ret) {
> +               dev_err_probe(dev, ret, "Failed to read calibration data!=
\n");
> +               goto rpm_disable;
> +       }
> +
> +       priv->tz =3D thermal_of_zone_register(dev->of_node, 0, priv, &rzg=
3s_tz_of_ops);
> +       if (IS_ERR(priv->tz)) {
> +               dev_err_probe(dev, PTR_ERR(priv->tz), "Failed to register=
 thermal zone!\n");
> +               goto rpm_disable;
> +       }
> +
> +       ret =3D thermal_add_hwmon_sysfs(priv->tz);
> +       if (ret) {
> +               dev_err_probe(dev, ret, "Failed to add hwmon sysfs!\n");
> +               goto tz_unregister;
> +       }
> +
> +       return 0;
> +
> +tz_unregister:
> +       thermal_of_zone_unregister(priv->tz);
> +rpm_disable:
> +       pm_runtime_disable(dev);
> +       pm_runtime_dont_use_autosuspend(dev);
> +       return ret;
> +}

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

