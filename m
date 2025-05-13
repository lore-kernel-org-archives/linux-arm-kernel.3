Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A280C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 07:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hzDVo4FQ6ah48v90Cg2f4xDKatHzBs1SUP5exMwf8H0=; b=Dn0ws13rbxoUdmQjD+XjVfme13
	NxtdRDCwcKKeIb8alwz8/EF4rv0UqKzkIhVJGeFN8CjmBAWpLx6T0ZsEAyhx1LnuI8FVw2DMLzfPU
	1Vm+zyqD+iynvZZboY0+8SIZD6/ZI9yf0OU57FND0L3LiPgrEXI3H1uSFytXAt691mAqVGbARftHb
	kA2U4gIwGOs7XWJjwwUdcOD76liqg22LFGlkzvXtjhdEeWsX0eIWUdtfck14hSYHIQCkvxkl2Vp5Q
	S54gsDJyfsB1kNMwr2WOQW/LwMJ6e10CTS4ekXy3qyuPtSA1FOd4dxkG7n9lbBUAWjMlupxEuLUYN
	wlsVmgFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEju6-0000000BbE7-05sR;
	Tue, 13 May 2025 07:18:18 +0000
Received: from mail-vk1-f176.google.com ([209.85.221.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEjs6-0000000Bb53-1LUc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 07:16:15 +0000
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-52413efd0d3so1969653e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 00:16:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747120572; x=1747725372;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hzDVo4FQ6ah48v90Cg2f4xDKatHzBs1SUP5exMwf8H0=;
        b=Z5KipAYKlJrhGrmWpBEkJdqDrKgH/7mfZPRV4L9sDiN8GBsG1gflUturVvY6Bn8VOn
         /wvFQ3w2+KzBGaSW1gclbtIq47sirv/hraCPI87/hH8+OX6cs3qpmzMtVEwNlBTxU8qZ
         CA49mbey16tQZzoFWcB1qhU4VYsAr3WyCF9Kf2ru0/0FQXqoiGwNMte883OEuJT29I/d
         aMAx5zNAPEw496rvXkp8ahPW4IonaUzchSacBRovhp1wjaC5EtJjteFY7xA44IOWTazg
         TdONLnlD1ey2FzTa6Addqo7UtN0dw+QXrS73/4I+I/BZD4lLSnNsemZuArlYsL4ZapKP
         FKzA==
X-Forwarded-Encrypted: i=1; AJvYcCVeHG+xoesjL9u7Db3yG6JNSa22gPU9U8Y+tkW2h831eeMgoJs/61K+WsbAN+RJhTpZCzagPCW43z4X2Z3rA/X8@lists.infradead.org
X-Gm-Message-State: AOJu0YxGgDyKdICMIrp7VabT7/pMuywrfRm3QKSxXVjpmktOD2Y2wDy9
	936wkrt7i73gQ83Uh+LQxTMuaEGET3l/94MZk5WvO18MAhWdpGr1afx8QVDF
X-Gm-Gg: ASbGnct2zpmW4qlA5g6RIy0rUUDNIBHo3ypVbVINEyFnCtKZxC+RT5UrBTXCO4U6Vp5
	BUaKBt88+JLM2vE35YVm0ZQreDocINFl5grbFFMYackIqptejRIY9FLWSY2apiQ7yHB/JgMVPoq
	wG+er+GbQ957ZsJNkpA42fUt8cMbVWYrJU3zWXDqrp26el1SK3AYeOJE8x8H086twsqcp347CVA
	CLwAHE8avg0FhyOD8pI5T2pHNYsQMruu4ULqvTrkmSsYGiknkQ8zdFHsO1K/juJ74bvMPcpe9UR
	qA1P1ecqyUaqrX7T1tXsmt30tbs7S0vnCyGljLQVI9Y4aKQ39bROWoITIT0IX3NMFh2jTDYZGys
	q49GyNgUFDuE0KVszrfBcKn1N
X-Google-Smtp-Source: AGHT+IEpce9tMeGEaXWwJKIrzvjP3vB8qTPAtUKHRARuqYpPjFXaS7OIljlLtgGf4eUH4dFG6h6cOA==
X-Received: by 2002:a05:6122:17aa:b0:52c:3a36:a82d with SMTP id 71dfb90a1353d-52c53b96f0emr10324308e0c.5.1747120572208;
        Tue, 13 May 2025 00:16:12 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-52c538a71a8sm6985261e0c.47.2025.05.13.00.16.11
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 00:16:11 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-8783a6b9d6eso1387928241.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 May 2025 00:16:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUcuFJLo/s/41nkGf7nTtbVXSEYhZYK2Cmf+e0KAMsF5NU0es3lZ3oRCOdLCPoLdGRkRgodV2DwyY0CADoX9fAG@lists.infradead.org
X-Received: by 2002:a05:6102:15a0:b0:4dd:bb2c:491a with SMTP id
 ada2fe7eead31-4deed3f138fmr12982135137.25.1747120571798; Tue, 13 May 2025
 00:16:11 -0700 (PDT)
MIME-Version: 1.0
References: <fbad3581f297d5b95a3b2813bbae7dba25a523fd.1747039399.git.geert+renesas@glider.be>
 <87tt5pe7e2.wl-kuninori.morimoto.gx@renesas.com>
In-Reply-To: <87tt5pe7e2.wl-kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 13 May 2025 09:16:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWwm=t96Bw+d7xVpuDX_Oa1wU1zA673RRGvcBa08AWiqQ@mail.gmail.com>
X-Gm-Features: AX0GCFsefrB6ygaM3MFjCWcwsnMA4Lwk2o225dXj78YXf5bP8dqT7Njk6kmGVW0
Message-ID: <CAMuHMdWwm=t96Bw+d7xVpuDX_Oa1wU1zA673RRGvcBa08AWiqQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: sparrow-hawk: Disable dtc
 spi_bus_bridge check
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Mark Brown <broonie@kernel.org>, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Rob Herring <robh@kernel.org>, Magnus <magnus.damm@gmail.com>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Linux-ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_001614_363096_97EEA142 
X-CRM114-Status: GOOD (  26.78  )
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

Hi Morimoto-san,

On Tue, 13 May 2025 at 01:28, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> > make dtbs:
> >
> >     arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1269.24-1283.5: Warning (spi_bus_bridge): /soc/spi@e6ea0000: incorrect #address-cells for SPI bus
> >       also defined at arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts:471.9-486.3
> >     arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1269.24-1283.5: Warning (spi_bus_bridge): /soc/spi@e6ea0000: incorrect #size-cells for SPI bus
> >       also defined at arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts:471.9-486.3
> >     arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: Warning (spi_bus_reg): Failed prerequisite 'spi_bus_bridge'
> >
> > The Sparrow Hawk uses the MSIOF module in I2S mode instead of SPI mode,
> > triggering a conflict between the SPI bus bindings and dtc:
> >   - Serial engines that can be SPI controllers must use "spi" as their
> >     node names,
> >   - Dtc assumes nodes named "spi" are always SPI controllers.
> >
> > Fix this by disabling this specific warning for this board.
> >
> > Fixes: ca764d5321a2cee7 ("arm64: dts: renesas: sparrow-hawk: Add MSIOF Sound support")
> > Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> > Closes: https://lore.kernel.org/20250506192033.77338015@canb.auug.org.au
> > Suggested-by: Rob Herring <robh@kernel.org>
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> (snip)
> > +DTC_FLAGS_r8a779g3-sparrow-hawk += -Wno-spi_bus_bridge
>
> Thank you for the patch.
>
> But I still get the same warning. I'm using latest linux-next/master
> + this patch. And run this. Am I missing something ?
>
>         > make dtbs_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml

Works for me:

$ git checkout next-20250512
$ rm -f arch/arm64/boot/dts/renesas/r8a779g3-*dtb; ARCH=arm64
CROSS_COMPILE=aarch64-linux-gnu- make -j 12 defconfig dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml
[...]
arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1269.24-1283.5: Warning
(spi_bus_bridge): /soc/spi@e6ea0000: incorrect #address-cells for SPI
bus
  also defined at
arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts:471.9-486.3
arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1269.24-1283.5: Warning
(spi_bus_bridge): /soc/spi@e6ea0000: incorrect #size-cells for SPI bus
  also defined at
arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts:471.9-486.3
arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: Warning
(spi_bus_reg): Failed prerequisite 'spi_bus_bridge'
[...]
$ git am 20250512_geert_renesas_arm64_dts_renesas_sparrow_hawk_disable_dtc_spi_bus_bridge_check.mbx
$ rm -f arch/arm64/boot/dts/renesas/r8a779g3-*dtb; ARCH=arm64
CROSS_COMPILE=aarch64-linux-gnu- make -j 12 defconfig dtbs_check
DT_SCHEMA_FILES=Documentation/devicetree/bindings/spi/renesas,sh-msiof.yaml
[... no warning]

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

