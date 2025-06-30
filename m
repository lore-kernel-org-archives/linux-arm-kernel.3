Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3779EC83000
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 04:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JbVuaR12V0J6Xt+/G9MNTrnfxERz+sAIcOpg6dKC95Y=; b=RfAg56TMjZSg6N
	/EAvTcdF3YRvwYDRA3ZrIcDA7D40q0avkzJ4DjGlLAcetKZwz1Oa4Ov/L46a+sOuoBFffeVGRQljF
	sn1WFiXry0wCv8hAuWnjRs/aD8SpuLYKJlK/hrnw5fV1VaMrqXn279MlhPRXgeUpGohPCM9uIAySD
	fTL1OSTkf5llw0BYstb2Ohv7bEtQZiiUr3EPtlmTfkzNI1OE7z2qQL+tQqnXXwMrt2+bW6gWeK3iW
	hZt0VMkvpt9Yld+npWGii16Mw59CJW9gxU4hpvLUrIVX6qLlXkj7TniYqvXm6RaXCS4fqxpsfRJEX
	x01JIkftBYqrxzQEra9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW6Ec-00000001D3s-3R3M;
	Mon, 30 Jun 2025 04:35:14 +0000
Received: from mail-lj1-f171.google.com ([209.85.208.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW6CI-00000001CpO-2xfA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Jun 2025 04:32:52 +0000
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32aabfd3813so16914391fa.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Jun 2025 21:32:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751257967; x=1751862767;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JbVuaR12V0J6Xt+/G9MNTrnfxERz+sAIcOpg6dKC95Y=;
        b=oEy6tVtgTfexu4n5PPBv8/BccNGmALBBaf+1YOFMCg7jmuSsxrBzOA4C7fzDD0zqAq
         7MhhihJFpnbl9sJuJwupDKa3iIVyG6H8RPnIG/+UiH7E0QPYTboNdjehH5VXd95pmpfg
         f/UNk1e1q8cxWwz6DVHTP035lLvyFqhGgBK0vk5HKxf9aBxFm3eVpC2lT6PRWTLQ9N9W
         wNOO+RK0idFOebSPZqo/9G369YmOzwizf91xJMFUuix+8ocs9MmmAzAofHPlOFuAEWX7
         RI5pXamdlV6Zi8KIGEDHb1f8O8gn7UUrrWSlgFQHsPfmINwz5cNcaOkwqQugp9EdlYKf
         0pRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyfM8bHePi9imJiv1VBvxzMlZ+eGStZ9nMddXCsgviCKlYTB4BI4A5gBGtT9mTJ3S3LWU2ylzoG8ehiH8OGkWv@lists.infradead.org
X-Gm-Message-State: AOJu0Yz10hEnAICqLsdI+KMJzTKsePQN6Cwz3flYDXqpK5MafFsGgkou
	us2235JV6L5d0d5C5pPHtgTcpOPfHFIlUF6OODmeG5mWe9Lw21irbFshfA7LVTY2
X-Gm-Gg: ASbGncth4LpEYWcbMNyIgFhUqvmI6fCWJZGWXKlPKHDxyW35R0VlX/800WkPB3Jhpnu
	gurRcfEGF8hcx76/rnUfArHKGlsVmonAWN8N5HDcP+gTbMWOid1EurCBVF+mixCKX/p/JOMeAbs
	/gcaarW331+0jX6G1eEO9V/hZWSmMAKaJFlBuIHWOoSMDZf4b2vqGZ1YJEyNAJwknRexU7j57E2
	GhJ3qKd7hR0w6PD+QWnCF07mJNyBTk6u6b6fJIpKEpJxGvELeICNWbIGzvr7aMynYHCVo69uiQm
	NT7J+mFAPTRt48p1XyJpj/ZXAv/glzhBQFkyP99o9ttVgP/iwpUn4L8p/CIWBvw49pzIBkWiNzq
	lfSEQVgPM/D82whCpTBI=
X-Google-Smtp-Source: AGHT+IGCrrztuIL9TzFEG2XhYTYsR+405hvY4OYB2VcI2zuyv/BSjKYbSGo5D6f9fFKNHtw6OtDXlw==
X-Received: by 2002:a05:651c:2221:b0:32b:a961:803a with SMTP id 38308e7fff4ca-32cdc437ef2mr35016861fa.3.1751257966701;
        Sun, 29 Jun 2025 21:32:46 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com. [209.85.208.171])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32cd2e317bdsm11892891fa.46.2025.06.29.21.32.45
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 21:32:45 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-32b3a3a8201so14738241fa.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 29 Jun 2025 21:32:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVgNd0gmNR8cxsnORrHiwNjwhdW/okB7NTbWVqoCUvMdyEJG7Nz6VGYXnVsmwEAiGINZMkGRx5MigM6NG1Njerh@lists.infradead.org
X-Received: by 2002:a05:651c:20c5:b0:30b:edfc:5d8a with SMTP id
 38308e7fff4ca-32cdc329543mr23944531fa.0.1751257965460; Sun, 29 Jun 2025
 21:32:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250411003827.782544-1-iuncuim@gmail.com> <20250411003827.782544-5-iuncuim@gmail.com>
In-Reply-To: <20250411003827.782544-5-iuncuim@gmail.com>
From: Chen-Yu Tsai <wens@csie.org>
Date: Mon, 30 Jun 2025 12:32:33 +0800
X-Gmail-Original-Message-ID: <CAGb2v659nQit-cOsr6q+ACO2MJ+c6RyfBWVg7iP_u1DO4fXBHQ@mail.gmail.com>
X-Gm-Features: Ac12FXycZ4eBZnw1-9h5Z5_HZw9HoRSOqmeNCAZOYMw7KeNLsUjQ12gZN6IqRgQ
Message-ID: <CAGb2v659nQit-cOsr6q+ACO2MJ+c6RyfBWVg7iP_u1DO4fXBHQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] arm64: dts: allwinner: A523: Add SID controller node
To: iuncuim <iuncuim@gmail.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Andre Przywara <andre.przywara@arm.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_213250_746472_F05A1945 
X-CRM114-Status: GOOD (  15.18  )
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

On Fri, Apr 11, 2025 at 8:40=E2=80=AFAM iuncuim <iuncuim@gmail.com> wrote:
>
> From: Mikhail Kalashnikov <iuncuim@gmail.com>
>
> The SID controller should be compatible with A64 and others SoC with 0x20=
0
> offset.
>
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>

But this also needs a matching update to the binding.

> ---
>  arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/=
boot/dts/allwinner/sun55i-a523.dtsi
> index ee485899b..d626612bb 100644
> --- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
> @@ -171,6 +171,13 @@ ccu: clock-controller@2001000 {
>                         #reset-cells =3D <1>;
>                 };
>
> +               sid: efuse@3006000 {
> +                       compatible =3D "allwinner,sun50i-a523-sid", "allw=
inner,sun50i-a64-sid";
> +                       reg =3D <0x03006000 0x1000>;
> +                       #address-cells =3D <1>;
> +                       #size-cells =3D <1>;
> +               };
> +
>                 mmc0: mmc@4020000 {
>                         compatible =3D "allwinner,sun55i-a523-mmc",
>                                      "allwinner,sun20i-d1-mmc";
> --
> 2.49.0
>

