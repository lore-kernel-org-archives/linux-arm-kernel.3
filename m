Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E973DD42B85
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 14:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fU6W7rKC1LDOoPqE+zgv8rY63qL2TykSBZFtxfoHqJQ=; b=YlElcMCoXOa4iOCK9M5SCAhJR6
	yUaQXZ3jrQFI4eNmoRqiVw93s1NUe8cS+beO2yy1lTN1zD9y9VFrQ6LgSfx1xHwsxwAmr88XCtE/i
	yoSNgN1Tr5SJh/ORQCiYTe+oV+60RU96twBlyFnJCakb80QAYOCsP+IEn2GcxT3IYJEnmsufa/a3Y
	VTuvV4Gecpk9eKMzhEx4jUDrnckqjaUjvETtiyfyZx2IW7KIPg4NfN4+B9GSdyW0rTiBdtPNne3zY
	gs9AtKNO9K+LrYCEfVrpoqFJ3VqAv/S+7TM+leSeIG6fFW1SVBAUs3GiGEAx4SohVgIeMeZCc5xcB
	IJwOpk6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAsCX-00000003orb-0Lbt;
	Tue, 12 Nov 2024 14:49:05 +0000
Received: from mail-pg1-f174.google.com ([209.85.215.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAs07-00000003m8k-2iLW;
	Tue, 12 Nov 2024 14:36:17 +0000
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7ea9739647bso3913962a12.0;
        Tue, 12 Nov 2024 06:36:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731422174; x=1732026974;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fU6W7rKC1LDOoPqE+zgv8rY63qL2TykSBZFtxfoHqJQ=;
        b=J5s1EHNViyCMqOOKOYnQdPk+QysfDslJHO3LTkeTyxjUvIiFTUST/MkXSQJG4nlzQ1
         AEAWmbLXHHgvm8XsaIZhHHV3Hkso/eu6MBhBGnGJJp6scnN38fPaxrqE4JlZH/j4leCG
         gq0jj/q8zxXT2fzTRCDwClXRcpNkieIxArCjUfZPiGxkOg4hdX9QnGNOQXJhTLXYCT0H
         NnQdIUeLLgiNMHwr4ZQ0W0wnjahdUnWRe6aKDi5Y5zTLCDWJYpaWrNLk751m6iAj0GdE
         EC5iJ0DLzhR2i7cFrh7OkDWa7ND+aJtSx1CTQJjq/J0bbLISRs0J9+18fwyIxS3wcMCB
         j9bA==
X-Forwarded-Encrypted: i=1; AJvYcCUWl68Cjl5RtIAs7Ousd8A0Efz6A1mGxqx8g/AUavmZN4AzRenCfgq9sWx3ixnoneQ8rHRoWHcPMPIhl9R25dg=@lists.infradead.org, AJvYcCWRDhwZeBwpRt/ucv3l+KzxUTU7NUc+zqC/TJE9w4qIEWmeoHzYlF8ffWs06OA0/XJDJyOXYa5sdni5NZn2qR6Z@lists.infradead.org
X-Gm-Message-State: AOJu0YyENg/fFtC2j78U6wY7s82gvzPTW09w/Tx4bXrZ3HvziyGWTUAZ
	ZUHC5MnZkzCS+hLGB4N3X11WLs1W9gk4fKCRncxn0fTwIrJm5d4SXvfPQQaVHuFS6Q==
X-Google-Smtp-Source: AGHT+IG+OnucLUzxz6hWyjtVw0C6nrZ3246+4i5FInmi5rYqzQxiHJS2iZ3yROg3N99KFfYRCmMZ3A==
X-Received: by 2002:a17:90a:d405:b0:2e2:d3a0:4716 with SMTP id 98e67ed59e1d1-2e9b173c50fmr25084773a91.18.1731422174252;
        Tue, 12 Nov 2024 06:36:14 -0800 (PST)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com. [209.85.216.46])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e99a5f935dsm14057783a91.35.2024.11.12.06.36.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Nov 2024 06:36:13 -0800 (PST)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e2ad9825a7so4353547a91.0;
        Tue, 12 Nov 2024 06:36:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUs474IMk89yew3r9L0VDv8sJUYrZuWHul9EkYqm4bB0vBFanuRSgLvLv+cuMHzKIWvUfOEHhIV5w35tZusN30=@lists.infradead.org, AJvYcCUvPI/01YvuyKqAbvvqk8pAK777SOQeWbZl5lk/J7KPxT11EA9PZK4DE9cftztNqMB3vNo5VK3gU7MGNhHIyzAm@lists.infradead.org
X-Received: by 2002:a17:90b:3c0e:b0:2e2:dcea:2b8c with SMTP id
 98e67ed59e1d1-2e9b16eeb4emr22784902a91.6.1731422173348; Tue, 12 Nov 2024
 06:36:13 -0800 (PST)
MIME-Version: 1.0
References: <20241111181807.13211-1-tszucs@linux.com> <20241111181807.13211-2-tszucs@linux.com>
 <c89c2f16-ffb0-4b61-a962-9705f9f1e0e2@kwiboo.se>
In-Reply-To: <c89c2f16-ffb0-4b61-a962-9705f9f1e0e2@kwiboo.se>
From: =?UTF-8?B?VGFtw6FzIFN6xbFjcw==?= <tszucs@linux.com>
Date: Tue, 12 Nov 2024 15:36:02 +0100
X-Gmail-Original-Message-ID: <CA+GksrJzkxffSQbuseGFL0=2PDxV+TRevX0-NOkc6FNYLmNgYA@mail.gmail.com>
Message-ID: <CA+GksrJzkxffSQbuseGFL0=2PDxV+TRevX0-NOkc6FNYLmNgYA@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: Add supported UHS-I rates to
 sdmmc0 on rock-3b
To: Jonas Karlman <jonas@kwiboo.se>
Cc: =?UTF-8?B?VGFtw6FzIFN6xbFjcw==?= <tszucs@linux.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, FUKAUMI Naoki <naoki@radxa.com>, Dragan Simic <dsimic@manjaro.org>, 
	Chukun Pan <amadeus@jmu.edu.cn>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_063615_710009_C1724892 
X-CRM114-Status: GOOD (  27.24  )
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

Hi Jonas,

Thank you for pointing this out! I haven't noticed this before. I've
done some testing and I believe I am able to reproduce the issue you
described, although I cannot confirm the reason.
The only occasion I encounter any problems is when a UHS SD card or
SDIO device is connected to sdmmc0 during bootup. Sometimes the device
is recognized as HS only. Obviously no tuning value reported. Also,
sdmmc2 cuts out completely. I'm booting from eMMC and when the SD card
is removed in this state I lose my rootfs. Certainly, this needs more
attention but it seems to be unrelated to the changes here.

I need more time to check but are you sure this SD card during bootup
issue is gone with UHS-I disabled?

Also, in every other case, when you connect any device to sdmmc0 after
bootup, performance and stability is perfect.
Interestingly I also don't experience this behavior with an eMMC
device and / or an SDIO device connected to sdmmc2 during bootup. Only
sdmmc0 is problematic and only during bootup.

Any more thoughts on this are very welcome.

Kind regards,
Tamas



Tam=C3=A1s Sz=C5=B1cs
tszucs@linux.com

On Mon, Nov 11, 2024 at 8:00=E2=80=AFPM Jonas Karlman <jonas@kwiboo.se> wro=
te:
>
> Hi Tam=C3=A1s,
>
> On 2024-11-11 19:17, Tam=C3=A1s Sz=C5=B1cs wrote:
> > Add all supported UHS-I rates to sdmmc0 and allow 200 MHz maximum clock=
 to
> > benefit modern SD cards.
> >
> > Signed-off-by: Tam=C3=A1s Sz=C5=B1cs <tszucs@linux.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm=
64/boot/dts/rockchip/rk3568-rock-3b.dts
> > index 3d0c1ccfaa79..242af5337cdf 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> > +++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> > @@ -670,8 +670,14 @@ &sdmmc0 {
> >       bus-width =3D <4>;
> >       cap-sd-highspeed;
> >       disable-wp;
> > +     max-frequency =3D <200000000>;
> >       pinctrl-names =3D "default";
> >       pinctrl-0 =3D <&sdmmc0_bus4 &sdmmc0_clk &sdmmc0_cmd &sdmmc0_det>;
> > +     sd-uhs-sdr12;
> > +     sd-uhs-sdr25;
> > +     sd-uhs-sdr50;
> > +     sd-uhs-sdr104;
> > +     sd-uhs-ddr50;
>
> There is an issue with io-domain driver not always being probed before
> mmc driver, this typically result in io-domain being configured wrong,
> and mmc tuning happen before io-domain is correctly configured.
>
> You can usually observe this by looking at the tuning value during boot
> and comparing it to the tuning value after removing and re-insering a
> sd-card.
>
> Because of this uhs modes was left out from initial DT submission, some
> cards will work others wont, sd-uhs-sdr50 is known to be working with
> most cards even with the probe order issue.
>
> Also I thought that lower speeds where implied?
>
> Regards,
> Jonas
>
> >       vmmc-supply =3D <&vcc3v3_sd>;
> >       vqmmc-supply =3D <&vccio_sd>;
> >       status =3D "okay";
>

