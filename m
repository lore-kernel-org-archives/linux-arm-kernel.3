Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C86C5DF87
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 10:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NZ9qFWwtyy0CyLFBazZArycje1mFKlJigB1GC39CAP0=; b=1NpE8mhesMt2d2AYnylnnfV2vr
	lu0stWdHr+Vig3oS8u/IbohmK0nyC6jzZqFRSrStmUPzhcmCFlm7JF71Z+RwQWyMv2Mgys2wtZ59c
	bS+Iz+sJ1vIHXvkDXhSlGoq04aNS8EG5+LLQ6/0al96fYoxWcxrGD/G5GD+DakkqdJxtGnLSgJoVn
	Dw/1Q09IZiI0dFZAZKxi6wiN4bohSB5ys/ph7xB2p2prH2oPHxhHDhgAqxfH1ouLo6YJGJ2TrenRX
	iVlg0SAUMCCwco/9ShSh3gW4kd/s5EnB6q1YEHuK9mr76o0N/MC5nIJq9Sod8z8Mrz04VpD9y2Ipi
	kYy8IYsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMJ5-0000000D4s1-1MAu;
	Fri, 21 Aug 2026 10:17:03 +0000
Received: from mail-vk1-f172.google.com ([209.85.221.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxMJ1-0000000D4qF-3DdM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 10:17:01 +0000
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5c5f23666d0so719984e0c.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 03:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787307418; x=1787912218;
        h=content-type:cc:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NZ9qFWwtyy0CyLFBazZArycje1mFKlJigB1GC39CAP0=;
        b=UXlRTBdTX/B680DxtbIosodHMvfdut38mZPyurv5yFutkHUpDztEn16rjasTtKtkFS
         aSYYBokHoVt63UXX6DZ0MOi2k6SLjMFdblbFBvTUO0KitogV1r1oxfKMw0bp/T2HoS8T
         j6gW9W188BvwOj1LFlGtUiHEuiXFvJww9ww0ts6y8zhY2gwACqgYOFOovp1jHCFGX+rN
         k9NAp0hojciOkhB2TDWiYM5EjWfWEeJ/UtSNwchlmqglBoWqVyZekgpqlGsot+R+HYus
         Q9fqy0DIwd0+fofmcoqWJnpn5aj7m/cly6huMG5HH5Yh5m2Nto0m3cp3qBfmnTGqhL5q
         U33A==
X-Forwarded-Encrypted: i=1; AHgh+RpJWaxfM0+JMe7nuISqGK8HHJ3n1VIYqphUW6n0tvZoBgEN23lDlO/8g4yn1IVQ7XWjZ0xQIMLnI/vsbbUDMio+@lists.infradead.org
X-Gm-Message-State: AFuF++nd59RHC4yKviUWpQkTRPw5y/mteSb/ioGOJVaeEwjEgC5NpA4/
	z+Lsl3W5YSPKBAMlG0Ahy/uGY8FHyUJmgVv2Y0xurAMMhysziDYjVaosyKypxifn
X-Gm-Gg: AR+sD12suz2ZbrDaJT3E4Ajct2/AY3x/EExJJHEsneGjrCXVcP8akKALo+QTcrsW2cq
	VL9mdn5YYJyzLJdWDbQN9wKOdPV7oHrFkSUA6b00hMRcmYE7ZcgwxiXFgp1JIG9c5QHk+QFlYZ4
	wacNSjYasehXl8EjEEBS1zraG//1a004ovVHp2ejG9oALgsiIPTjcaoabA7n7gSCVooSLDEWqJ1
	WEgjTjY3uMi+W17IMn1u8Y44gGYnPgUqVNL07IXkFnJ9HyIZApG3t+iaw/jq+J/PHiqjFBlK+tN
	0PLz/M5LUEAZz/i8DJMzIXB5/SdVyCncB1hEMX2yLC8H67NqPkdPiqY4mi2NsRgZGvkup/ki28c
	VMZ/8EhlgWL1+7ByDiSANrt3/yWMVRgqn7F1kF/YS9xQ0upLGur410QGNAzfLhriIvECYrBEShx
	K/7U5O/S3ZYuntb32V6tnNYczz1cJ+VONgZ2vAL/NXa16PQHIXprilUodM/Wa+/Wd+w0/L0cOtr
	GetmnZnve8cuIoWsuLfvdVmkA==
X-Received: by 2002:a05:6122:1792:b0:567:4e8a:fb13 with SMTP id 71dfb90a1353d-5c5ff772c86mr2071834e0c.8.1787307417855;
        Fri, 21 Aug 2026 03:16:57 -0700 (PDT)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com. [209.85.222.53])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c5e25e34c4sm8242966e0c.1.2026.08.21.03.16.56
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 03:16:57 -0700 (PDT)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-97622cc1f40so474648241.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 03:16:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoLB36FCN8cSBo/5l+6+pIcAij4V6ZRfEAKt5mRuL49swqbZ8KJUcMD5y0yFW4JMHommClxAjXwTeGca3bgUJuK@lists.infradead.org
X-Received: by 2002:a05:6102:512b:b0:778:5bbb:b2d2 with SMTP id
 ada2fe7eead31-77a64358362mt4198071137.11.1787307416387; Fri, 21 Aug 2026
 03:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1787165329.git.geert+renesas@glider.be>
In-Reply-To: <cover.1787165329.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Aug 2026 12:16:44 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXaxV9K8=yQ3KU-V2dV-eFqFqMR9WDyt2RVKADLS51Dcg@mail.gmail.com>
X-Gm-Features: AcwNN1XMP476J77X05DStUZ6YHTKoquM1cTbXZSuVIS6ygsja8ReRo486qzyWdY
Message-ID: <CAMuHMdXaxV9K8=yQ3KU-V2dV-eFqFqMR9WDyt2RVKADLS51Dcg@mail.gmail.com>
Subject: Re: [PATCH treewide 0/5] clk: Make sure clk_init_data is fully
 initialized (part 1)
Cc: Tero Kristo <kristo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>, Nuno Sa <nuno.sa@analog.com>, 
	Guenter Roeck <linux@roeck-us.net>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Antoniu Miclaus <antoniu.miclaus@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Sunny Luo <sunny.luo@amlogic.com>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
	Mark Brown <broonie@kernel.org>, Kees Cook <kees@kernel.org>, 
	Kevin Hilman <khilman@baylibre.com>, 
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>, linux-omap@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, 
	linux@analog.com, linux-iio@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-spi@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_031700_205012_8AFA9783 
X-CRM114-Status: GOOD (  27.97  )
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

On Wed, 19 Aug 2026 at 21:05, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> The clk_init_data structure contains three mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  When commit
> fc0c209c147f35ed ("clk: Allow parents to be specified without string
> names") added the last two methods, this was done in a
> backwards-compatible way, using a priority-based scheme:
>   - .name, .ops, .num_parents, and .flags must always be initialized,
>   - if .num_parents is non-zero, .parent_names must be initialized,
>       - if .parent_names is NULL, .parent_data must be initialized,
>           - if .parent_data is NULL, .parent_hws must be initialized
>             and valid.
>
> However, not initializing all members may cause subtle issues, which are
> only exposed when CONFIG_INIT_STACK_ALL_PATTERN or
> CONFIG_INIT_STACK_NONE is enabled.
>
> Hence this series makes sure all members are fully initialized, to fix
> such bugs, and to avoid future breakage when converting drivers to a
> different method for specifying the parents.
>
> This (small) series is part 1, and fixes all cases that I identified to
> be real bugs:
>   - The first patch fixes a crash I saw on BeagleBone Black,
>   - The other patches are only compile-tested.
> All patches in this series can be applied independently.
>
> Part 2 will be much larger (touching 185 files), and will fix the
> remaining cases that are currently harmless.

FTR, I split part two in 13 subparts, per subsystem:
  - "[PATCH 0/2] ARM/soc: Make sure clk_init_data is fully initialized"
    https://lore.kernel.org/cover.1787239869.git.geert+renesas@glider.be>
  - "[PATCH 0/3] ASoC: Make sure clk_init_data is fully initialized"
    https://lore.kernel.org/cover.1787239902.git.geert+renesas@glider.be>
  - "[PATCH 00/45] clk: Make sure clk_init_data is fully initialized (part two)"
    https://lore.kernel.org/cover.1787239813.git.geert+renesas@glider.be>
  - "[PATCH 0/2] drm: Make sure clk_init_data is fully initialized"
    https://lore.kernel.org/cover.1787239944.git.geert+renesas@glider.be>
  - "[PATCH] i2c: bcm2835: Make sure clk_init_data is fully initialized"
    https://lore.kernel.org/9f82f37e6d6c069cd44326bcd5e5a2a8069a13a9.1787239980.git.geert+renesas@glider.be>
  - "[PATCH 0/2] iio: Make sure clk_init_data is fully initialized"
    https://lore.kernel.org/cover.1787240005.git.geert+renesas@glider.be>
  - "[PATCH 0/3] media: Make sure clk_init_data is fully initialized"
    https://lore.kernel.org/cover.1787240035.git.geert+renesas@glider.be>
  - "[PATCH] MIPS: Alchemy: clock: Make sure clk_init_data is fully"
    https://lore.kernel.org/3610b51df642abb1fbb39f5bd93fddea43f8f164.1787240060.git.geert+renesas@glider.be>
  - "[PATCH 0/2] mmc: Make sure clk_init_data is fully initialized"
    https://lore.kernel.org/cover.1787240090.git.geert+renesas@glider.be>
  - "[PATCH net-next 0/3] net: Make sure clk_init_data is fully initialized"
    https://lore.kernel.org/cover.1787240118.git.geert+renesas@glider.be>
  - "[PATCH] peci: controller: aspeed: Make sure clk_init_data is fully"
    https://lore.kernel.org/48aa77c45e109f78ccd806bc3b7bf380c5bc5e71.1787240145.git.geert+renesas@glider.be>
  - "[PATCH 0/2] phy: Make sure clk_init_data is fully initialized"
    https://lore.kernel.org/cover.1787240165.git.geert+renesas@glider.be>
  - "[PATCH 0/5] rtc: Make sure clk_init_data is fully initialized"
    https://lore.kernel.org/cover.1787241693.git.geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

