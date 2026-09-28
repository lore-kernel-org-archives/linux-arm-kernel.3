Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78A1CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 11:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i6Axo3HGXtx4M0ZdgmZ+9VJvjH8NJrRWcx2B+NzBV5s=; b=PmAGcE2li0gdTJXNYjqNWQ7qHM
	pY+U6q0g73li8aIEqfKIlzbHugN9XIEIRouP28z6xUw7xuwpmNJ8vSSW5dgTJy6u6g0YYTc4YETlG
	vISa1RdXUbMUCLmVvXAijPqeydudvTAGekHc+reXrOupU3Ra8YrtkBjO+pxzltjQ/3PDZIzlvQ7MB
	Wee98hrgqP+qULWZxvFEgcD6CODDJ6rMmwl64b/MD1wcbjCt9dx8lQV1h42g4RXyiq+/tbBLe7gT2
	0z/Vwd9M1RJm7sgoKGa19IXAxF1WLqPtGtLK4lEmfR+9ga1V6aJJuZ2xv0Mt+262lKsHg5/sS0Txq
	oRE3kg0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB9gY-00000000U3S-319N;
	Mon, 28 Sep 2026 11:38:18 +0000
Received: from mail-vs2-f37.google.com ([74.125.227.37])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB9gW-00000000U35-11Jm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 11:38:17 +0000
Received: by mail-vs2-f37.google.com with SMTP id ada2fe7eead31-7b47bba7c88so720000137.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 04:38:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790595494; x=1791200294;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=i6Axo3HGXtx4M0ZdgmZ+9VJvjH8NJrRWcx2B+NzBV5s=;
        b=WgcO3EaGVI/y0y1frVbBXH6VwZxEzcH+HSaK8OHanx5RszZFEFK1uh7Yu/2PTB72sW
         Bxk1tZBWTBadaVWQqAOgqvVRY6hmZfFnHniS9y/z4ZUoaV9Td8K9izgPtpdl6PSi6U32
         H0cD/mw6cucBVYUzCsHTFF9znTg3FRfx7KyOTqOGko87BH6gqikFmiJ5mntXF20eWXnu
         92Y3rjguoUTlmaId5V3VDO7sj7bwAR7nqrRPaJuskymjvNPhqpWfyVNBFUu5DHIO2BXH
         FAJTKw8thH2lIPA+1ZvCfV80yFFoOA9fRGQROuNinIk0j28DzJixyGzJRVDgp8e9XVWb
         NoTg==
X-Forwarded-Encrypted: i=1; AKwUvBwDetrsK7fPXyKPy8bqiAKAyfCNCVbe3HVI8632+Q5KBWtu2Z2B1etuBDwiENIGmTlI4OoMGMFp7mV4AKifl/iv@lists.infradead.org
X-Gm-Message-State: AFq9FYK7W1uyJemmqJNmT0bBphQinmhq8mWHVtiVqwSQB0Z3xwFp4YA4
	9Ru1kwR8/TlnAaDYZ5FVxejHmpCU21zvUXbx0ZTlVLYgUMGVENwP5o7XcjzZxE3a
X-Gm-Gg: AYBFou1lizTMffhCi51NWzOn01lP4f31n3viZGqEgyqMvqSbXUL861JGgP83wZ5NPxa
	JpJPwUr7F/lO2z3pqRRmNPITwboViLruUmsJpRDRRDMtnnh1slVYOe7hYkbt8TF+S5WbRZNNFf7
	ZarEN0vR5x7/EfGEUS1INeg1ZGRdNqJPy6kIhUguCKA1LktB8Jh1J62eUgdk8Vgwv450FeHF1Et
	ZaXpFKaqQ2BtVlpjWolzuoeJYfmtL23EiPOG27RsgPCafRtOF7K2Uyze7tAX34x42rGwXENtY7O
	NJE3cLCBReU2ybUSa6ZHWrWNHALv4k7T+mUIBe+RQZ29bND+Y4w1u1mFRXv0qPhfaIJ2FwTKmiF
	6QbDTryee4v9U1EyYNcYRPDV6j/BMwmFNFT44v5ShuMojbtZeVLxAtp1K7KHHPAl3Fh5hs9Vfua
	ddni9D+UEo1S5sdLbX04/bxNryKpTFaxrtH7SUMeGHMQapsrKPdrTRn5VcGzUFSJIulqJ8PRrD2
	U9qAsuyLc1v5eVyTKBgaV2Lgjx5yrL7v67/
X-Received: by 2002:a05:6102:3f46:b0:7a7:19aa:8a88 with SMTP id ada2fe7eead31-7af1f2fda6cmr4878969137.35.1790595494141;
        Mon, 28 Sep 2026 04:38:14 -0700 (PDT)
Received: from mail-vs2-f37.google.com (mail-vs2-f37.google.com. [74.125.227.37])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7b39b9ae253sm8901891137.8.2026.09.28.04.38.11
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 04:38:11 -0700 (PDT)
Received: by mail-vs2-f37.google.com with SMTP id ada2fe7eead31-7b42f1cbcf3so928388137.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 04:38:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxVtKLPcZ0Uy9a7FbfGrhthlsDpKSno5P1Em4qvblNGnykCRXClNWCq4Rlu02j2FTsSzA/SjJPjmWrKoap/xz8t@lists.infradead.org
X-Received: by 2002:a05:6102:4422:b0:79e:373e:8216 with SMTP id
 ada2fe7eead31-7af1973fc40mr5035987137.0.1790595491034; Mon, 28 Sep 2026
 04:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1790325809.git.geert+renesas@glider.be> <10e85f27b8ea4342f6f19a7c9e68fd641e58b54a.1790325809.git.geert+renesas@glider.be>
In-Reply-To: <10e85f27b8ea4342f6f19a7c9e68fd641e58b54a.1790325809.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 Sep 2026 13:38:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUJoy0pBHxfib-SmUf+2LCum3HAk1hftXyeV8CEwKWQ2A@mail.gmail.com>
X-Gm-Features: AclHuK_Ipn8bslrHX7mMK7Zs6CdI4c2l8ME7s7cvf6MpMmTS5OEzqaHYWA0OcRE
Message-ID: <CAMuHMdUJoy0pBHxfib-SmUf+2LCum3HAk1hftXyeV8CEwKWQ2A@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: renesas: r8a78000: Add MSIOF nodes
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Marek Vasut <marek.vasut+renesas@mailbox.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_043816_290976_60B39CAE 
X-CRM114-Status: GOOD (  23.50  )
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

On Fri, 25 Sept 2026 at 10:53, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> Add device nodes for the Clock-Synchronized Serial Interfaces with FIFO
> (MSIOF) on the Renesas R-Car X5H (R8A78000) SoC.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  arch/arm64/boot/dts/renesas/r8a78000.dtsi | 104 ++++++++++++++++++++++
>  1 file changed, 104 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a78000.dtsi b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> index 9a07753b221541ed..d75a9e43f772f871 100644
> --- a/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a78000.dtsi
> @@ -1000,6 +1000,110 @@ mdlc_aon: system-controller@c1338000 {
>                         bootph-all;
>                 };
>
> +               msiof0: spi@c1700000 {

[...[

>                 mdlc_cmnn: system-controller@ca410000 {

Hmm, something went wrong while rebasing.
Obviously I will fix the order while applying.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

