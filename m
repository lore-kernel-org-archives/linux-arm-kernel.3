Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784D1FCE07D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 13:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5twdPm6qtk6BxBBh6eqwsmb5sfIcorWjwwVPoxGI8zc=; b=blxvkFkkrviWMEe2a2a1K5Gicb
	ccHmNuGeEZpuNiGpx2QQI/22sN650Ciw3RRslubZBctEdXKsHaX+EYFS4B8TKlDT05InHQaRufM/6
	mXR05YDBTtnbh366rS/MKwpncd519j1Ui+h6+qXHYBRtcQ+Jug6mz6kZdy/tvGepIFztZrGJCgrIX
	98dAo9GkvCcY6UnSQtsBBxeCBbP/X3P9nTMBGnuUJAcrZiZNXjTzcZRe4Te71Gyx7ndUFatihaGd2
	nLmb8eAGO8kb+1UQeg7Wa93EG1YUHHsV22AJnj5ZwqoUnD98qsJk1k1PTA4sBx2DK9rKKU6r5dDVf
	+h+rbMbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvbSJ-00000006E2k-0etP;
	Thu, 26 Feb 2026 13:31:03 +0000
Received: from mail-qt1-f180.google.com ([209.85.160.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvbSH-00000006E1l-0UdO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 13:31:02 +0000
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-506cb1b63d0so11069731cf.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 05:31:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772112660; x=1772717460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5twdPm6qtk6BxBBh6eqwsmb5sfIcorWjwwVPoxGI8zc=;
        b=JtIAd5v13xZ23RJjDxJXrbgznV2Ena75zFTrJ++qL+8OK3qbi4K8Kzw8UsAYhfqNVc
         6hJGsctlZeIa18/kkElvsARKzLLkrNT2mMj3nl2XuWyLAqN7/3r9ZE6wTpkHSrfaSVQM
         DovV8JdLZKLhFJCjCNmO3JmiJNmPVSFqIY39QHUYEfuVJSrUjQUT3119gnfSXfS1VmZO
         XL3YzW58xdmxmoPzfUtCr6MpmS2zvdcscfJQUncvk9TMshOdDqWpDhn3XOPN5skCoADn
         y7yMtczls4iy52MzEZYge5Vj4kJqusTw51RLEHo+qSMtfIdxbUuzaTI4rmpDoy2vyzNW
         /ccg==
X-Forwarded-Encrypted: i=1; AJvYcCVyHlSAoycGcavK7DKfmcyUnFV69FyfVoEE2VzfWiOh5ttzlxfhusumCXOVZpE8/Je8puyEtz9zmY1N4TNOG+Mu@lists.infradead.org
X-Gm-Message-State: AOJu0YzGkxVAwACA5gBPt9rX2RL+0MoHMxKiJFYr1r6vWbN9gBF1n5Fj
	VbDsNnaLOvHKPIYyeQ9vqJe+PgS6ArLgqJ1QQHmTMSaSi9I9R6HJxg4zh0XxA5lh
X-Gm-Gg: ATEYQzw33KBZC/iH01urccpmQB+yCx6Mlon36LBCi9R/afoMPSzjee3faQZtn6htyOM
	DTfbFwobwxrxrMOQH8xp051nGwgM8AkOw4/yHbGAZZBODdptBy9EQKpMT6IXuyh+m5uofB4T9xX
	QVBwZ2qpNHUixhbUEQhm8zoOa0cEC0HvwUMTyZ+0+6cYBgEaC6LE0sitCkBspOm56Oaa4YTMGME
	Ko5jUT1T2v7q6UacrvAMJNoaARHwjfdBdhcxkMSGyP4YZ5/yJJa7/YyTHzAPlW3dQvsybBYX52G
	kAXzvrv36APBBvEyKr3GIx/bhVUEoEXPT2jF5KiuU8t4gcqrMs0ZjTFiGwOAxyvxeLXrt8FGGTI
	640LkpJKsnXBF+KYFiBY4HFTosyAF1QQtKl9/0RrQNs9I+SxcJwvsoEZDUGJnpoZc+EiF7c04BL
	ZmhOTWcwTSCqJQ4EL+u/rkYWXHqeDYJsRBOTGzjPEgzu0LBw75uKhX2EfDR1Qsmta+
X-Received: by 2002:ac8:58d1:0:b0:4ed:ddd9:1402 with SMTP id d75a77b69052e-50741f3c0f1mr62558551cf.24.1772112659522;
        Thu, 26 Feb 2026 05:30:59 -0800 (PST)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com. [209.85.222.174])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-507449630absm20258131cf.5.2026.02.26.05.30.59
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Feb 2026 05:30:59 -0800 (PST)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-8cb5c9ba82bso123390485a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Feb 2026 05:30:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWlJCnWRnGczD7t2vMsvrq3g+dbEwm12Qu1f4z4ZzTTQQfl8KlNm2f5mY+zecPYLVFO1UZ+lt2+WOMmilAgNkoI@lists.infradead.org
X-Received: by 2002:a05:6102:ccf:b0:5fd:ed98:cf0f with SMTP id
 ada2fe7eead31-5ff14157fafmr2006779137.34.1772112160689; Thu, 26 Feb 2026
 05:22:40 -0800 (PST)
MIME-Version: 1.0
References: <20260111093940.975359-1-vladimir.oltean@nxp.com> <20260111093940.975359-6-vladimir.oltean@nxp.com>
In-Reply-To: <20260111093940.975359-6-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 26 Feb 2026 14:22:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUBaoYKNj52gn8DQeZFZ42Cvm6xT6fvo0-_twNv1k3Jhg@mail.gmail.com>
X-Gm-Features: AaiRm523jRWdOCfOPJhqksDewbEoHD_GTMJ0xjyZsvboq3n-XWtXIhj4iGm1B4M
Message-ID: <CAMuHMdUBaoYKNj52gn8DQeZFZ42Cvm6xT6fvo0-_twNv1k3Jhg@mail.gmail.com>
Subject: Re: [PATCH v3 net-next 05/10] phy: add phy_get_rx_polarity() and phy_get_tx_polarity()
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Daniel Golle <daniel@makrotopia.org>, Horatiu Vultur <horatiu.vultur@microchip.com>, 
	=?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Eric Woudstra <ericwouds@gmail.com>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Lee Jones <lee@kernel.org>, Patrice Chotard <patrice.chotard@foss.st.com>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	KUnit Development <kunit-dev@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_053101_161024_3B665EF4 
X-CRM114-Status: GOOD (  30.79  )
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

Hi Vladimir,

CC kunit

On Sun, 11 Jan 2026 at 10:44, Vladimir Oltean <vladimir.oltean@nxp.com> wro=
te:
> Add helpers in the generic PHY folder which can be used using 'select
> GENERIC_PHY_COMMON_PROPS' from Kconfig, without otherwise needing to
> enable GENERIC_PHY.
>
> These helpers need to deal with the slight messiness of the fact that
> the polarity properties are arrays per protocol, and with the fact that
> there is no default value mandated by the standard properties, all
> default values depend on driver and protocol (PHY_POL_NORMAL may be a
> good default for SGMII, whereas PHY_POL_AUTO may be a good default for
> PCIe).
>
> Push the supported mask of polarities to these helpers, to simplify
> drivers such that they don't need to validate what's in the device tree
> (or other firmware description).
>
> Add a KUnit test suite to make sure that the API produces the expected
> results. The fact that we use fwnode structures means we can validate
> with software nodes, and as opposed to the device_property API, we can
> bypass the need to have a device structure.
>
> Co-developed-by: Bj=C3=B8rn Mork <bjorn@mork.no>
> Signed-off-by: Bj=C3=B8rn Mork <bjorn@mork.no>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Thanks for your patch, which is now commit e7556b59ba651796
("phy: add phy_get_rx_polarity() and phy_get_tx_polarity()") in
v7.0-rc1.

> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -5,6 +5,28 @@
>
>  menu "PHY Subsystem"
>
> +config PHY_COMMON_PROPS
> +       bool
> +       help
> +         This parses properties common between generic PHYs and Ethernet=
 PHYs.
> +
> +         Select this from consumer drivers to gain access to helpers for
> +         parsing properties from the
> +         Documentation/devicetree/bindings/phy/phy-common-props.yaml sch=
ema.
> +
> +config PHY_COMMON_PROPS_TEST
> +       tristate "KUnit tests for PHY common props" if !KUNIT_ALL_TESTS
> +       select PHY_COMMON_PROPS

This select means that enabling KUNIT_ALL_TESTS also enables extra
functionality, which may not be desirable in a production system.
As PHY_COMMON_PROPS is bool, this extra functionality is even part of
the base kernel if KUNIT_ALL_TESTS=3Dm.  Unfortunately PHY_COMMON_PROPS is
invisible, so this cannot just be changed from "select" to "depends on".
But perhaps PHY_COMMON_PROPS can be made visible if KUNIT_ALL_TESTS,
so the select can be turned into a dependency?

> +       depends on KUNIT
> +       default KUNIT_ALL_TESTS
> +       help
> +         This builds KUnit tests for the PHY common property API.
> +
> +         For more information on KUnit and unit tests in general,
> +         please refer to the KUnit documentation in Documentation/dev-to=
ols/kunit/.
> +
> +         When in doubt, say N.
> +
>  config GENERIC_PHY
>         bool "PHY Core"
>         help

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

