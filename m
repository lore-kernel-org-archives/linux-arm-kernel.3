Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A383ECD4F3E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 14:03:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1P5GUNQOH0XPCOyCgZr+gwsMYMYyLhVYsxtxGdPiZx4=; b=tHCFAb+5BILvgh
	peyA83Fia8+VzSM4bbpEFqttTvAEFQZuptEn7+q3rRAhtkadeFbdj7bBoqoWl5ee1nzHST66e9WCW
	S+yiZk78tuMOVVOvu2qNXVHXcB25yPCfaarunWg7oZRqZqx2rMubzmgTX7Vh9hfm7cbFtjIr/9flM
	KJNFqiABPdHGWmt3orBOid6k1uEcNRFWT7pRLZ9kmqJOKf22lPOBU/ZRRSLwlUODqDOnCksnpzeqz
	4zYmkemQv5Yxa/6o3aJ6sSZ+pzVrhQLK6zymTr8nhNozRvFl8xt0KrtbMtg0Qta+/LYV9sfR9uxSd
	YM0oFm298TelBzZzgMcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKdLz-0000000EirS-0Qgg;
	Sun, 16 Nov 2025 14:03:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKdLw-0000000Eiqr-3LIf
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 16 Nov 2025 14:03:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:Reply-To:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description;
	bh=1P5GUNQOH0XPCOyCgZr+gwsMYMYyLhVYsxtxGdPiZx4=; b=oezZ5SBgnk9HQ/Fvhbj7zywLUN
	ep3HnjHCva/mbGkiVJp5EgMXhTkWYD69Jwn1WIfkYC0Nnp6hWTn4+vfOdH/v+z93VFscYjQuATFB2
	0a+km0KPojtq035HLCYzmAo+LIUWLU+p7JmE14YAgUpgzl1W6szV5H0S6EU8WdfCmGmE6NjNDq6ep
	p5Rh8+NYWge9nIYx20GlVir8qiuZID0FYlf9sAWrfUKgRETacDG5q+WRtlClCakL2WxfsFfP1x4Ot
	ASx5K8CPTLJslm15catugjan+GXZdfAIlbx0X4I/atqPgqePev8vRTPh4FFowJB4Q1P4nVwktrLuk
	ilnY2g8g==;
Received: from mail-lj1-f182.google.com ([209.85.208.182])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKcUE-00000005NHy-2NlB
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 13:08:13 +0000
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-37a2dcc52aeso31893101fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Nov 2025 06:03:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763301813; x=1763906613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1P5GUNQOH0XPCOyCgZr+gwsMYMYyLhVYsxtxGdPiZx4=;
        b=vrxl346+0Dz6HyzOO3o94QGC8+sH0Fv3ctFGIJ35gJ9RXAS+SV0dyC4t0OasGlcSkl
         j3W8mXbjVy66c9gIwBUE19C8DJGSt30mGIfBK0x4iAe1ri5kRYeX19GL2PbVR/AfBaOm
         b8XYetnBqbuBIwB318ApIObEf+WjNfpvzJTFrZaE7X2xFc+QUnD7M8Dq9GNtxGptpU5B
         +sq4NVIfcsaYfan9lF5UbXsHV/jCm9GaqBmsoD/oP7yZeAdUPVQW4RdJNLAL9iGKxIVv
         8hfv4SG13vywuVMslmBruExjuZv0s5oxirHs6FrxIDVqASBV/IT3JxGcDQwPoqX7ykW6
         ymsA==
X-Forwarded-Encrypted: i=1; AJvYcCXXdThtRLBpC2yXkl3qwb2Z5flSjM5QsDuRdHChZD0STv8maUYsFeHipzblb1cna98dH3YoSCQtR9PCt0ikwGxG@lists.infradead.org
X-Gm-Message-State: AOJu0YynwIuXC3ja4h14ZtNTJzqKcQ7TC7qfHhmqIOpu7rg/Kam4nP8f
	TeoqS22dw8XL8+bpO0DfZYWooaPhOlrLhl4l4bXq1tPFLzcXt3Ec5Us4o7663Chk4jw=
X-Gm-Gg: ASbGncvK/+hiGCPpA+v7b7kfzipS2QnUrsFwRPzG5j48Xli1qZBe+cqdklVmD49rb6V
	vtI3EIUz4UzgCqvmKEOezuVlAgoUVdIjrwUOviMQ3buT9PTWHyylOeSkTSgjy+0//SQJOQe7BNc
	mCYQVZdhLPmEgu0arWtiCHahac2hYPJN4bmn+GlGaKhjJmNCIXW23cMSNVBkQlXEj8jwuwgHHGZ
	dMAvW56xi6O6PqBGDyVMsMF2LJEyrX8o8tbOvX+Hxtx4idOiNoTz1jaQukTWqMiMKD/SK+GHmEn
	ORBvgDkHxbxLxLvM/LEX3zU6YCi+GhN8g3p1YdRpowjblesBcmUN2vDqVhmVIJZwpwNrV7WkMhU
	1iCeJjhrCfWkh2nIwtUfFVYee6Tj65oqKni7dxbaFbj8LTUfAL8ODZ4kATFngUI5N5oOR2//qKV
	QRJaXdvearUxG8BzeVLV8hqnGnlXYkLp66B7glC2OAHcA=
X-Google-Smtp-Source: AGHT+IGDLyshCLML09T/iO2lkH2pLzm/sSxcJnl6vWqTKaPD6wLLlUQyZy12rApeUq8aOSATxIw8hw==
X-Received: by 2002:a05:6512:3ba3:b0:595:76d6:26ea with SMTP id 2adb3069b0e04-595841b3febmr3585068e87.23.1763301812241;
        Sun, 16 Nov 2025 06:03:32 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803ac898sm2423477e87.18.2025.11.16.06.03.32
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 06:03:32 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-37a34702a20so28300411fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 16 Nov 2025 06:03:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWHveC63dbWOpEXMEjd49zXIu31lJIhBwxkljP5bKqRTVBVJTDwC+XoX54TpnvXP3lLN5ke1qKT6b+YrtlxELkA@lists.infradead.org
X-Received: by 2002:a05:651c:440f:10b0:37b:9e27:89f with SMTP id
 38308e7fff4ca-37babd73323mr19895421fa.37.1763301811739; Sun, 16 Nov 2025
 06:03:31 -0800 (PST)
MIME-Version: 1.0
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl> <20251116134609.447043-1-kuba@szczodrzynski.pl>
In-Reply-To: <20251116134609.447043-1-kuba@szczodrzynski.pl>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 16 Nov 2025 22:03:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v67V01k8zj2r+Dd+JDEsH2LX2Jtx+CP=i8aQfX_JyFtLfg@mail.gmail.com>
X-Gm-Features: AWmQ_bnVpj5bkGX3ksszDMr19xhbiJNyazuPC_F2JRblaiVwkcXftIdoMcMBl8Q
Message-ID: <CAGb2v67V01k8zj2r+Dd+JDEsH2LX2Jtx+CP=i8aQfX_JyFtLfg@mail.gmail.com>
Subject: Re: [PATCH v3 0/6] drm/sun4i: Support LVDS on D1s/T113 combo D-PHY
To: =?UTF-8?Q?Kuba_Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
Cc: Maxime Ripard <mripard@kernel.org>, Samuel Holland <samuel@sholland.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, parthiban@linumiz.com, paulk@sys-base.io
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_130811_021001_DE29B60F 
X-CRM114-Status: GOOD (  20.56  )
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
Reply-To: wens@csie.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Sun, Nov 16, 2025 at 9:46=E2=80=AFPM Kuba Szczodrzy=C5=84ski
<kuba@szczodrzynski.pl> wrote:
>
> [replying to v1 to keep the same series on Patchwork]

That is not the right way to do it.

If you reply to an old series, the tooling does not pickup the new version
as a separate series.

ChenYu

> Some Allwinner chips (notably the D1s/T113 and the A100) have a "combo
> MIPI DSI D-PHY" which is required when using single-link LVDS0. The same
> PD0..PD9 pins are used for either DSI or LVDS.
>
> Other than having to use the combo D-PHY, LVDS output is configured in
> the same way as on older chips.
>
> This series enables the sun6i MIPI D-PHY to also work in LVDS mode. It
> is then configured by the LCD TCON, which allows connecting a
> single-link LVDS display panel.
>
> Changes in v2/v3:
> - Applied code formatting changes from review comments
> - Changed "dphy" to "combo-phy"
> - Made the LVDS setup/teardown functions abort early in case of error
>   (adding a proper return value would require changes in several levels
>    of caller functions; perhaps could be done in a separate patch)
> - Added the PHY properties to DT bindings
> - Renamed lvds0_pins to lcd_lvds0_pins
> - Rebased on top of drm/misc/kernel/for-linux-next
> - Hopefully corrected the incomplete patch list of v2, which happened
>   due to an SMTP error
>
> Kuba Szczodrzy=C5=84ski (6):
>   phy: allwinner: phy-sun6i-mipi-dphy: Support LVDS in combo D-PHY
>   drm/sun4i: Support LVDS using MIPI DSI combo D-PHY
>   drm/sun4i: Enable LVDS output on sun20i D1s/T113
>   dt-bindings: display: sun4i: Add D1s/T113 combo D-PHY bindings
>   riscv: dts: allwinner: d1s-t113: Add D-PHY to TCON LCD0
>   riscv: dts: allwinner: d1s-t113: Add LVDS0 pins
>
>  .../display/allwinner,sun4i-a10-tcon.yaml     |  6 ++
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 11 +++
>  drivers/gpu/drm/sun4i/sun4i_tcon.c            | 50 +++++++++++++
>  drivers/gpu/drm/sun4i/sun4i_tcon.h            |  6 ++
>  drivers/phy/allwinner/phy-sun6i-mipi-dphy.c   | 70 ++++++++++++++++++-
>  5 files changed, 141 insertions(+), 2 deletions(-)
>
> --
> 2.25.1
>

