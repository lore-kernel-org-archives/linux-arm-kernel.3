Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B1BCF34B7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 14:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U4rPsaXkkkPPqP8F89aStRjGcZr5tE7ulQ3b9FN2Uak=; b=CCmoVIeXKeBmpm
	8Z5kmuwWDIdgkFFUEjAhcksErDK+9Od4JZQR711zz2HLSmvBEEo/J/UzZjD+i4sZDBow2duHEEgOL
	YpEch4/KcUKsjLeDmEdB5xQINDDem/d5FDEDHbaYKONSBzxC+M/hLb7nD/Uw20YAMqb0buc2TKt5B
	79bHW4mhlZuVgHY7LLbwIwtZ7EOQ9R4Fzi3bKVVWKj/Hg9We+wa3uFqCKszddN/6jYTnBfTTc0dDs
	i7CItmwj9zOy7oh5KWcFV8b86UPPwptQHL8CeDQhB5SVEGjOEgNK9qyFSRsACa7oQcQphIikBUhQz
	0jfLiekolyGIuJvfrRGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjPI-00000003OhF-2CBp;
	Wed, 19 Nov 2025 14:43:40 +0000
Received: from mail-lf1-f53.google.com ([209.85.167.53])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLjPF-00000003OgE-1km6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 14:43:38 +0000
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5969c5af23bso469134e87.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 06:43:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763563415; x=1764168215;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U4rPsaXkkkPPqP8F89aStRjGcZr5tE7ulQ3b9FN2Uak=;
        b=WcOWJ7Sg24iY6cr8JjEwZO2Tdm3vW6IHtAKXIgJZ3lzqgN0JhyGWVK3NeF65UfCr0i
         hF1WbMbVr2+FhlN9ObrRIRUNDeLd3AbFAk62DS4+yLGgfOJ5gwKio8NImgnQlR3hLDBI
         obQSPbU/1qE8zIXhFnfEQE9hLrmZ9qtr1MZ18S5mGOLE/oSo8UwoUh7aP0NGZ2bHF+uc
         NyTM13xH2CFxDlN9UUYA6wOHCr/VsPBJ8Ct64yUT3vd8h5mY2A4Phc/uef54AehGsDJe
         /30uCw5qjZRdpUIZ9HAmPpOf9ebbnGX99ns9ZeAi/bEfZ0IsP3SbN7ckmEao5r3PNLwN
         SSBg==
X-Forwarded-Encrypted: i=1; AJvYcCU3iwpxj91xQFMdOHhthHelM6oUQoYhDpSnSWh3cJxALF4lFLhMhfsojh2oQhq3+9TOGy+DOhsTxL32h1YumUZ7@lists.infradead.org
X-Gm-Message-State: AOJu0YzTB2XauOGMjbNJ0JRh3CIC4wbcMhSED29RT3/4Gy4Uhe6ujgcH
	6+TlLa0P5wWF7ryBU73P7umjlsabdQiCcJYwE1OoXRXDdcyaaoGhjTJbiYYJT0Di
X-Gm-Gg: ASbGnctcbk3KwcEjJW7qzytg7B7OX0nfl2pjEArYWFH/xW9uANBLyrdj4/XTW5bW5pl
	lG0H9aoGpz4HI0/39+Zxkzv0I7tBK3S/5guXRM6v+Wl+uKfFIex6OTuZJOGnGiZIEi2VwkfKY7z
	d1BhiTroNjIoM46xzakuZstfn5sOOScaakbIWsmwhnHF8yPflg1MkFkj3HtdNJwTFqZp6jV7wYp
	+gqi2H8lQb/hAcG1cV8AJNwtxFr/o7gFC/nX639IjXWDxKi2lALI2mfTkzyap6yei3qf32+xsbm
	8nCBJyQwVFexWFHlryW5JNAWWEXHdR/8LeFHENfQES9V19a4r+sIGIQ3O04yt7ZABzHi7dwSg9h
	ecSfNleT5cK1grVqzmd5Xig4mlS8gYCKkflt6cGwaSBY8QhLdz9eBySOt84BZbth63PJxUcVdE0
	x6SrCZhMIOphcMHDCD3VvQhpa1X15budDinVsYzns/vJ0=
X-Google-Smtp-Source: AGHT+IHbsJWQHsAVP5b5Q+auorJzpkLyjP2x1rMXr4k5lObQKM/B3mifvljHxtka0y2Gzlw4Kw65ZQ==
X-Received: by 2002:a05:6512:3b9f:b0:594:4b7f:f946 with SMTP id 2adb3069b0e04-595841f981emr8362482e87.33.1763563414856;
        Wed, 19 Nov 2025 06:43:34 -0800 (PST)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-595803b30cfsm4760488e87.32.2025.11.19.06.43.33
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Nov 2025 06:43:34 -0800 (PST)
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-37a5bc6b491so53346851fa.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Nov 2025 06:43:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWDQC02d0IZHhSpmlKIdRogpEz0nOAPGrdbcBH+PFIpjHBiJgXZ5hjBMGhK0KSx8JMXwH127i2+FsMaln0d4I61@lists.infradead.org
X-Received: by 2002:a2e:9ace:0:b0:372:904d:add4 with SMTP id
 38308e7fff4ca-37babd35f8amr45635351fa.28.1763563413779; Wed, 19 Nov 2025
 06:43:33 -0800 (PST)
MIME-Version: 1.0
References: <aR2V0Kib7j0L4FNN@shell.armlinux.org.uk> <E1vLf2U-0000000FMN2-0SLg@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vLf2U-0000000FMN2-0SLg@rmk-PC.armlinux.org.uk>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 19 Nov 2025 22:43:18 +0800
X-Gmail-Original-Message-ID: <CAGb2v65syu47YAy8-24LDXt1MC2K7r+weOyCWn5fZzRgSFhnDA@mail.gmail.com>
X-Gm-Features: AWmQ_bnEwqpydG-ZRtqWc8I4l30DitJuwNrACYzTdhyRCjLGsAnpeFb-cKD8BLA
Message-ID: <CAGb2v65syu47YAy8-24LDXt1MC2K7r+weOyCWn5fZzRgSFhnDA@mail.gmail.com>
Subject: Re: [PATCH net-next 1/3] net: stmmac: pass struct device to
 init()/exit() methods
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Drew Fustini <fustini@kernel.org>, 
	Eric Dumazet <edumazet@google.com>, Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Jakub Kicinski <kuba@kernel.org>, Jan Petrous <jan.petrous@oss.nxp.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Keguang Zhang <keguang.zhang@gmail.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, s32@nxp.com, 
	Samuel Holland <samuel@sholland.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_064337_467759_FED19736 
X-CRM114-Status: GOOD (  13.47  )
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

On Wed, Nov 19, 2025 at 6:04=E2=80=AFPM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> As struct plat_stmmacenet_data is not platform_device specific, pass
> a struct device into the init() and exit() methods to allow them to
> become independent of the underlying device.
>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../ethernet/stmicro/stmmac/dwmac-anarion.c   |  4 +--
>  .../ethernet/stmicro/stmmac/dwmac-eic7700.c   |  4 +--
>  .../ethernet/stmicro/stmmac/dwmac-loongson1.c | 12 ++++----
>  .../stmicro/stmmac/dwmac-renesas-gbeth.c      |  4 +--
>  .../net/ethernet/stmicro/stmmac/dwmac-s32.c   | 14 +++++-----
>  .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |  2 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-sti.c   |  4 +--


>  .../net/ethernet/stmicro/stmmac/dwmac-sun8i.c | 10 +++----
>  .../net/ethernet/stmicro/stmmac/dwmac-sunxi.c |  4 +--

For sun8i / sunxi,

Acked-by: Chen-Yu Tsai <wens@kernel.org>

>  .../net/ethernet/stmicro/stmmac/dwmac-thead.c |  2 +-
>  .../ethernet/stmicro/stmmac/stmmac_platform.c | 28 ++++++++++---------
>  include/linux/stmmac.h                        |  4 +--
>  12 files changed, 47 insertions(+), 45 deletions(-)

