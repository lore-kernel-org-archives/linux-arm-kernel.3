Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04305CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Y0oCiGlxm1oUL4ENFDzbHLN3RbL4NXvE+8S8i9hNs8=; b=CfmlWvjJEx96m6IZ3pQX7s31CF
	FDgQ3RMaCLzN3g6/62V+FxzaqqP1cJEJA09+Q3X4baZYviyRDVyKL9WfI07wYVqR5HY7DPzU56FZU
	2DzqdhCHnXWGThW7f2TSpG5OEX0s+xsSLir9TDQh+fCefQ8smaLODiXIJo4ZhJN6v3tKmWg3BQ4zQ
	jVVvV5RPAZanPzr9Ot8PfCJbKK/lDPMpv+FvZ+SMxCXvhIsKw+zKDysxRNMh7hhMReiv6KLKz7lk5
	ORlQZrB0iA/gY1Hc5b4gzuC5PQ/DO/4FBbQ/ecrE9c+yEIorQHDiaIqRPWyptGhUO5uzYwo+GATFH
	+o336dvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUtC-000000035pK-3h76;
	Tue, 29 Sep 2026 10:16:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBUtB-000000035ol-12Nw
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 10:16:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+Y0oCiGlxm1oUL4ENFDzbHLN3RbL4NXvE+8S8i9hNs8=; b=aARfLyP4MquTB6xdv9oN/z2LVR
	Pqm8664XYXPuh0l/BsGK4ekL1i5/oTqAj0faGSVOOGZRJ32dUsWiFDiBRrNk01ejL6YXUqEw/LCup
	a88aDmFKuaIxT/9rdo23VNRH6EIUFyyoZqGMxbWo2TuUTjNO8x5AcElq6wJVGvYR5FaWn8ETzYIBd
	oK3lI2x4MKMMgy96GGKhgoqNKjZAWNbLaBN06SAeiFzK6oYe5PDKQOFUMyP3IlRbyYedCX2IRbP2Y
	OyM19/Gl8vRt2Pep8FOxtLT1ft70uOQ4v9bsagx+0luVNBGI1d7Bjkm+yfDJ5JLA5RC9tw9Flhcbd
	K3/wiJkg==;
Received: from mail-ed2-x10.google.com ([2a00:1450:4864:33::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBUt6-00000002T01-2WPX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 10:16:43 +0000
Received: by mail-ed2-x10.google.com with SMTP id 4fb4d7f45d1cf-6a60591ae54so6407809a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 03:16:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790676999; cv=none;
        d=google.com; s=arc-20260327;
        b=A3/krSyv7DsR9z0lzPJSLHNjC4UFiHnoHcSVdHJ1y4frRD09nKTBoK1kRErwbTjoO+
         ne2DAhUS9wEpI421K/6mJ89uT5c+5SCq8A1dwEHFlYRahENXzrfbKGE/SLXuc+NfxLLU
         X6LLCZIpw7Ko5UM+Z4brKuU7vuZSwF/bBPskSHPDinQ4LiE3V23vqsZMK950Dje4y0qk
         cdl4rNI4UwAbv/mRowAB46Wi76Gbj4wbJpB4rO46CYeMMqvJU5QASSET1kmFvh9iK1qq
         2D6wU3MqiIENNeLp2sggvqvl23uyR+pkyXmnfMuI7eDsKESPoXQXxgjRTx7ZLBU/K5RY
         Agog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+Y0oCiGlxm1oUL4ENFDzbHLN3RbL4NXvE+8S8i9hNs8=;
        fh=7jrOHkvGOgQXkYjAznyt+3ITobS/HuKpqt8a5uV6twk=;
        b=JhgrW00uFHU3kPztKT4C0PmMYoZuta/IGf63hD+SqLuo2Qt4je3OE1Tiegp/bVkNiz
         tjXYZfVsF/iF4XgYobH9kn+lr9jpz4gTMz97E/eea/y+95hdPcGdMTLKb42IEgXVWdzo
         Jmf24h0XVgfqzx4QdEcejMkbESwggreO/VGthxwp3YaONU+GpvlGX/q+21qe8+U5RJuq
         PkPD/LCbVb7sDGiFRLhbSwRGSCAPqogQjp2Ozx1gvd5Y6jOe+1SO5HU4aHvF431MT4PL
         fFYmP26k79WF60XzK4CnGBZKSjQkhWKyggqgtNdTOO5atyE3Y7a3HbsbfzTfMeNaN41d
         KUyA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790676999; x=1791281799; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Y0oCiGlxm1oUL4ENFDzbHLN3RbL4NXvE+8S8i9hNs8=;
        b=OVl5ftURec5Bb0IPTXPjLxfoOW392FMsxCCZom7UEFRscfOWQFLlZnYEU64YlwM6AY
         UNcjFCnJoIv7qoAkjJWARyUgTOVen8xbS5CAkAoOAEtA0Xp5JdulHo4V0IiRH48UTI2h
         GVIHGWtxdcy7tzZ96kjoBNGgTDwvstGFtI4cWrPJ/jDEO6RpwO+Ongr3BCFIN/lpoTXK
         tR20ffRwpzVrxp1+hMJjtATH+TF5+uVqJQ+38nWhSZAl28SoTwYkEiv33z8UXDUoRPQG
         QBJ+KSkz11XONg0ee3DpZEc8t1ipFHi/0beD8DRylz1Gg8MPi9OHXYw9Rj6APoNUr9oP
         rJfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790676999; x=1791281799;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+Y0oCiGlxm1oUL4ENFDzbHLN3RbL4NXvE+8S8i9hNs8=;
        b=wb6x8OipsFZbIdNIE6RhkwxUogPZEN4v8T/Iy2C/ryqQ0+9vTB3cEYE4g8HnsP/vt9
         Tn7Pi/7giWXQ+6qnfKQbmrvndAyq/LMIZre2rsInxfo0ougZ3uImIT0tXlhMc2M/xlNE
         pt/BuxMuCxm3hCQzIR+GXfKysHyM1jaHfr5uFaoRQFylbM2s+vd+9ulc5D//kHw+Z3Rc
         oKanN0CR8VSrn48eIGl/ZPGHvX8jsSS8+SBcr6MLTYamOs3wGFaVgXo9dG3TGDQ043ae
         D4rWqZ93o0AnI/g3fCfs9hasMmPzFUL++4rxGBU18K77O+kFgJ7hmkPMw532/sEtYo48
         JpSQ==
X-Forwarded-Encrypted: i=1; AKwUvByFdWKCrnquElYoS5jd5faSdLIcu4ZEsdCwplefvbME3o1Mb7i2tkpIxX89ywB7px395KhAyByBKeh2zclE4wTl@lists.infradead.org
X-Gm-Message-State: AFq9FYLMgpeRIlSeBSJj8JtUi3sqpCztBdyuqXJOsI1TB8vd+KEqLSCr
	kR6owWq4XDtOpN4zklNH+qnOfgDARw3QkW7KA51+Q8GkPU6/n+MIhqw8SLQadsbyw4r1y/fpEcI
	Rm3/qFhETykCEIb4m+X2q2M4eODI4y5if3OPXV+29+w==
X-Gm-Gg: AYBFou26hNoSeG23GwDBNcBwUlI4TCw63To8UISW9eglwOFFauhinHsZGLkriARWAh3
	trmvsvM0FdYssBc0P2oHL9QEbxrdW1EG60OpRjQxYrOO28F2sEYBtnPgZy8bckea0W33HoMJRDB
	zULWwQJE5ElFhzbAmM65gC+PG1m+IxDLfy8ZCTXF0gQ7wW1o0GhwmPgZP0sqSOzXRQ6hJibQLVQ
	XY6oh4/0KBSf0Yjwzv4MQQB355nubFuouqkGzozOUTnMt/UZy7ok+HGZzBqpnp3btS4TxaNzOTm
	OIqSfSzgm+swQ2BFYhlg5YMZSthJaYShF3jbdEAZDBLoUYJUJGc4mUDw5EluLJotNplQaA7COZQ
	+5L3+XXL6b3w/hbEFRPBVL+8=
X-Received: by 2002:a05:6402:c212:b0:6aa:e589:87de with SMTP id
 4fb4d7f45d1cf-6aae5898986mr6832193a12.20.1790676998743; Tue, 29 Sep 2026
 03:16:38 -0700 (PDT)
MIME-Version: 1.0
References: <20260918-contrib-pg-pixel10-initial-dts-v4-0-745eaca28b1a@linaro.org>
 <179067486422.102650.10176830320558486814.b4-ty@b4> <550a74bc-f0b9-4141-9fc8-db175bb0b1ae@kernel.org>
 <CADrjBPo_V1YScLQkgbSrWCaq30k7JoF0GQQ0u5ouBiEipbEg4Q@mail.gmail.com>
In-Reply-To: <CADrjBPo_V1YScLQkgbSrWCaq30k7JoF0GQQ0u5ouBiEipbEg4Q@mail.gmail.com>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 29 Sep 2026 11:16:27 +0100
X-Gm-Features: AclHuK9G694Ra3CWigev-SgKIG1dKrfnmFi4vSCyiq_Xo-NTi_Nls6PiXAbko7k
Message-ID: <CADrjBPrErWJR_01+Qhuw6mu0Kpe8-tvBMjci=rBO13RaSqnfZQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/4] Add Laguna/Tensor G5 SoC and Frankel, Blazer &
 Mustang boards
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, soc@lists.linux.dev, 
	Douglas Anderson <dianders@chromium.org>, Juan Yescas <jyescas@google.com>, 
	RD Babiera <rdbabiera@google.com>, Brian Norris <briannorris@google.com>, 
	William McVicker <willmcvicker@google.com>, kernel-team@android.com, 
	linux-serial@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
	Brian Norris <briannorris@chromium.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_111640_923781_5F465BAB 
X-CRM114-Status: GOOD (  19.95  )
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

Hi Krysztof,

On Tue, 29 Sept 2026 at 11:09, Peter Griffin <peter.griffin@linaro.org> wrote:
>
> Hi Krysztof,
>
> On Tue, 29 Sept 2026 at 10:56, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> >
> > On 29/09/2026 11:41, Krzysztof Kozlowski wrote:
> > >
> > > On Fri, 18 Sep 2026 19:05:01 +0000, Peter Griffin wrote:
> > >> This series adds initial basic support for Laguna (Tensor G5 SoC)
> > >> found in Frankel (Pixel 10), Blazer (Pixel 10 Pro) and Mustang (Pixel
> > >> 10 Pro XL) phones.
> > >>
> > >> Whilst Tensor G1 to G4 SoCs (found in Pixel 6 to Pixel 9 and Pixel
> > >> 10a) were offshoots from the Samsung Exynos family. Laguna is an
> > >> entirely in-house Google designed SoC.
> > >>
> > >> [...]
> > >
> > > Applied, thanks!
> > >
> > > [1/4] dt-bindings: arm: google: Add dt bindings for frankel/blazer/mustang
> > >       https://git.kernel.org/krzk/linux/c/ecf6405fa6c503c34eb4e7e905957d70d4018e93
> > > [2/4] arm64: dts: google: Add dts directory for Google-designed silicon
> > >       https://git.kernel.org/krzk/linux/c/cf3df78629f24b40cd0cb2da74e3ea4a944bed82
> > > [3/4] arm64: dts: google: Add initial dts for frankel/blazer/mustang
> > >       https://git.kernel.org/krzk/linux/c/54edd8698bb1fb40c339d0cb2f15baad6993dd48
> > > [4/4] arm64: defconfig: enable Tensor G5 SoC family
> > >       https://git.kernel.org/krzk/linux/c/63f674fe8a0a8d6e4bee3e72f7ae658f0e9a0686
> > >
> >
> > This introduces new warnings:
> >
> > /home/buildbot/kernel/build/arch/arm64/boot/dts/google/lga.dtsi:368.37-391.5:
> > Warning (avoid_unnecessary_addr_size):
> > /soc@0/interrupt-controller@5880000: unnecessary
> > #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
> > or "ranges" property
> >
> > https://krzk.eu/#/builders/28/builds/845
> >
> > Probably you wanted address-cells=0?

Yes, it should be:

#address-cells = <0>;

and no size-cells line

How would you like to handle it? Shall I send a v5, or would you
prefer to fix it up locally since you already applied it?

Peter.

