Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DB2E677F5
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  2 Nov 2024 11:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UCDur7kMwBxLZ7iPM36W+L8Iemo6gZ+3RoWOEA3d2yQ=; b=kSsJIwVq8SkYrH
	6i1mptg3Xa87IrnlMS/pQw6y+wrark/g/q0CsbYkKO1Z8rZ2835/eRpvAs0rdz7fHu4hD4QUCo0jp
	Cjc6RZj0hn4g4e68F4LVwgq40nHe1pUm2XMMHJlR0bxxf8n0e+76Hm8TJuOD9nkjYJU/XBB6ehWBX
	vFbdcz70Y6tcvj8I3C7MTUDG46Px4ctA/Wr/DVxPZ/D2ZdIKsTVCWdNcQfyAuA+30fTO3cuW1PrMX
	L6yOAHylSRz4yBOFoY4iswaNbGEUB+/iB8L5L4PNO22N+y0DYR+I9A1Mk4QZf1pDzRcMkEk+l4w8q
	TAiURSnojaupnMu0QP2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7ChN-00000009dke-034P;
	Sat, 02 Nov 2024 11:53:45 +0000
Received: from mail-io1-f54.google.com ([209.85.166.54])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7Ccq-00000009cMC-3Vo6
	for linux-arm-kernel@lists.infradead.org;
	Sat, 02 Nov 2024 11:49:06 +0000
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-8323b555a6aso153134339f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 04:49:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730548138; x=1731152938;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UCDur7kMwBxLZ7iPM36W+L8Iemo6gZ+3RoWOEA3d2yQ=;
        b=RCEmcm3KKg54168fTVU1/94zOFceRmPkN5akZoCF9ZZaxFwtoh1yQCLvdaUDPxLh03
         E/0oUpa7A1d0QOiz0O27vJFDMXOJMWw4+r8gB6Uy80xSIe8U1/YwWuSu4fXMy0OBU5Rz
         98qJtn8oikwCOwLaPiIt4wn+KqVZ+CGVzyuem1srX8ofI+MUj3GX5qyxfqw6v0ofqbSb
         WQQfvdIIaKX3jOJcPa1gyVLE0x34tGRWGkZ95xNx9Gc5h3r+qsIBty9EMUdkx7Oc9/jv
         KrNBwR2AwCHLj0QWUsgQlm5yYFKDxv7a9Mqe4+TxbS/u6IJQ3yi2JaZuHD8S1cGbqT2Z
         JVwA==
X-Forwarded-Encrypted: i=1; AJvYcCW8+Q3H0Qo226EECgQocwgIzJh9JIocq5YHbPzzQFpKHlBMVvwydxgpgGFdBW71OnzPa28BNTwbJ199h3XzGpt9@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0eSKhMAOM7ZvWu2oKkxryxKOws6Lk/9aAteKe9FcFqYvjI2J+
	XImUf1nUX+WIA53FPJI8XIu4JZAbMurnZWeD/Tu5dRv94txStdcSiQHj15M4iH8=
X-Google-Smtp-Source: AGHT+IHNFxscxN6mvqTDT4jgYZ2kB9rfZtoa8jmyUass9N3HcZsuKlYq9dvJbMgNMntCMxmm0wbMnQ==
X-Received: by 2002:a05:6602:15cf:b0:837:7f69:eac2 with SMTP id ca18e2360f4ac-83b64f3a7eamr1229774739f.1.1730548137577;
        Sat, 02 Nov 2024 04:48:57 -0700 (PDT)
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com. [209.85.166.49])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-83b67c7c556sm124972039f.39.2024.11.02.04.48.55
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Nov 2024 04:48:56 -0700 (PDT)
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-8323b555a6aso153130839f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Nov 2024 04:48:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX1JV8k4tXjzwoFlkpVZebXDdq7SxFLT9wDYF+VuprS1yTLMTN6xHI+24wYWxfF4hcnhAGoQOpccHoaSuI3tJi4@lists.infradead.org
X-Received: by 2002:a05:6602:29ce:b0:82c:ed57:ebd9 with SMTP id
 ca18e2360f4ac-83b650372b4mr1250261339f.10.1730548135524; Sat, 02 Nov 2024
 04:48:55 -0700 (PDT)
MIME-Version: 1.0
References: <20241031070232.1793078-1-masterr3c0rd@epochal.quest> <20241031070232.1793078-11-masterr3c0rd@epochal.quest>
In-Reply-To: <20241031070232.1793078-11-masterr3c0rd@epochal.quest>
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 2 Nov 2024 19:48:41 +0800
X-Gmail-Original-Message-ID: <CAGb2v66TAttAezXE7TnT5N6XFW2482ipuqkcpwjeDud6v=xD3w@mail.gmail.com>
Message-ID: <CAGb2v66TAttAezXE7TnT5N6XFW2482ipuqkcpwjeDud6v=xD3w@mail.gmail.com>
Subject: Re: [PATCH v2 10/13] arm64: dts: allwinner: a100: perf1: Add eMMC and
 MMC node
To: Cody Eksal <masterr3c0rd@epochal.quest>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Nishanth Menon <nm@ti.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Viresh Kumar <vireshk@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Yangtao Li <tiny.windzz@gmail.com>, Parthiban <parthiban@linumiz.com>, 
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_044904_900877_59ECAF92 
X-CRM114-Status: GOOD (  17.08  )
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

On Thu, Oct 31, 2024 at 3:03=E2=80=AFPM Cody Eksal <masterr3c0rd@epochal.qu=
est> wrote:
>
> From: Yangtao Li <frank@allwinnertech.com>
>
> A100 perf1 hava MicroSD slot and on-board eMMC module, add support for th=
em.
>
> Signed-off-by: Yangtao Li <frank@allwinnertech.com>
> Signed-off-by: Cody Eksal <masterr3c0rd@epochal.quest>

So I skipped this one since Andre had some questions about the previous
mmc clock patch. And I believe this one won't work without it?

ChenYu

> ---
>  .../allwinner/sun50i-a100-allwinner-perf1.dts    | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dt=
s b/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
> index 2f8c7ee60283..d418fc272b3c 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a100-allwinner-perf1.dts
> @@ -39,6 +39,22 @@ &ehci1 {
>         status =3D "okay";
>  };
>
> +&mmc0 {
> +       vmmc-supply =3D <&reg_dcdc1>;
> +       cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
> +       bus-width =3D <4>;
> +       status =3D "okay";
> +};
> +
> +&mmc2 {
> +       vmmc-supply =3D <&reg_dcdc1>;
> +       vqmmc-supply =3D <&reg_aldo1>;
> +       cap-mmc-hw-reset;
> +       non-removable;
> +       bus-width =3D <8>;
> +       status =3D "okay";
> +};
> +
>  &ohci0 {
>         status =3D "okay";
>  };
> --
> 2.47.0
>

