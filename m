Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC654C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 11:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=afaSq1n/9Zx2C/a6yp1UZpzU8FTiNXOckROl9W+xe1U=; b=LVO8ThYBTdXHlRbOrF3KI3YDgP
	86AhDDFNmwK9Khk1DcQH40prpLOgBoptinY4r8hooCulVq+bKcfuS2osMkpiAh6roaLv+H0Fx/BDJ
	i9pc83hhLH5FltqiFS6NMUHvwcnDjek2g38moawMgUcypkMvCTSl8VbS6gi+48eDOidwITxU2JdRE
	ZiGGFgEFESEehDxM4RquLE8Dmk9/trXmtYC7cBa2wFz0cgE3rZTwMT9COvBNUqIH58PsQkg4G6Vmj
	0NwYHMlV/c2+8I0JWwhlibUaEAa5341jc/aTXDQiLR1k4uBQDJsHaA1c5apWvybiNGc/N4GLrWzof
	3w2W7w4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkMEp-000000083HG-0WBB;
	Tue, 18 Feb 2025 11:58:07 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkLsV-00000007yym-3Tno;
	Tue, 18 Feb 2025 11:35:04 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-471fe5e0a80so7361101cf.1;
        Tue, 18 Feb 2025 03:35:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739878502; x=1740483302; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=afaSq1n/9Zx2C/a6yp1UZpzU8FTiNXOckROl9W+xe1U=;
        b=AC5Xl92Om0lN7q9LYSCul+vHUi4kflQdYszcvZvPHcEkJE++TCy5FywB9Agz5PYzsE
         VCnRqUk19bQrCezxOyxtQpgst+8yTE+Vu+p89QXI2vfNt5cZwdEfzR1scd7N+4g8Io01
         Y3WTykzCQd0/FkYog/eGzuwjxw7ZotzEwpHBCxM+EaUAnnpS6QXcELK/ATRRYzehTLm7
         uNk00TaIvBZxI0GA717gJfpG727W0MHBQj4ubhMP49EflL2wONnF0Uw6GQzO8I8UoLrF
         ZfY864Fn4pCxxPmI/WnpxQZOcRMyxTGtrARNf+Th/IIPr5Hc7iNK3uQSM9sLcvNszjrn
         cFZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739878502; x=1740483302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=afaSq1n/9Zx2C/a6yp1UZpzU8FTiNXOckROl9W+xe1U=;
        b=tKk9E/E3yv2qFmpZdiG8jeUzXyUaknV9GJuBOf1G1V6HRVZmoZMuys6OF0/rwpOiJF
         Y9mncw4vb8iVMNDi/TdpRejZLIeLDBT76uVJ2RkZm0NOMRrjrqsu3ux/DkbVxXNtFYKh
         cxov2G6sVR9FaRNChVka48HzMSdF92SxJmbvl2jctnj9nFu7PNmF7ar4XZQo32IgiBwi
         IZrWKBNOe+VC/Xao/fXzCnYCY3nI/JqgILGgteb12LTNyy0RyTKhbuw7++UjjzPRLTwy
         Jv7GiyyrLiHgwHj4XBRu55LaIju+AJRP49A+0i7oNRKlUEXTjL5oRKKlf2ssnsffoX/2
         Cv0Q==
X-Forwarded-Encrypted: i=1; AJvYcCVK1tjS4I5OnctKyjJNhHF4XYtUfRjf9J3YR1M+kj0JwrDGCPmyJwu74bPF5qFGa73ZSREg6AhUtwpQyUY=@lists.infradead.org, AJvYcCW4+opeLOr9s5RLAORl8wAcbTl/GvXFB4hkiK8pl8gBhZc51Wax8n8mOtJKzL5C3Kzio/2h/OhuXUGVKgLJuZyb@lists.infradead.org
X-Gm-Message-State: AOJu0YxbVGMbK+bWXnSVsXIwQVm0f0kMPAoOI2yoTAQzf7N7sZXTSxHb
	eBzfUt6xPBWILZOUde34oJd5QNDm+vrRFJdIgaxJYI7gu+mPw7a+
X-Gm-Gg: ASbGnctvwSBdzwSnbDQ4X8b0e9zYvkTaSowlHO8oecV/5dvAlyj7yHUBiAe54Ja7hNW
	wgBj7z+E0tsgj3AUwzmHLzbVHlyIwZOTrDB71f3rCqU/2zEqzrLa7dIiOBRkwXUBiSyRNkAkuKr
	8bUUHdSlTjCO+U1LyvdDe+HapR2LjmqTYNnpq5VaWTgXzKtTXVv8jxBaZ10hZ2ovD8p7Tn9i8wp
	zwDO0vQOxjV7FhuyBZ4+64C0DQnNf/0vxhfiLS2PCIEam8DaBFR0W0zuw8pcHESbzE=
X-Google-Smtp-Source: AGHT+IFe6C/gSNnzxL8kV6UCXZr3P6tf9lX30/uxdZgxSpgJktrmUiTn4Zw2m+FrVeltIJ8PDsdvvQ==
X-Received: by 2002:a05:622a:1803:b0:471:9cba:ad2c with SMTP id d75a77b69052e-471dbcc2e05mr196823821cf.11.1739878502351;
        Tue, 18 Feb 2025 03:35:02 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-471f2b0476dsm19857671cf.28.2025.02.18.03.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 03:35:01 -0800 (PST)
Date: Tue, 18 Feb 2025 19:34:47 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Richard Cochran <richardcochran@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, 
	Hariprasad Kelam <hkelam@marvell.com>, =?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
	Drew Fustini <dfustini@tenstorrent.com>, Furong Xu <0x1207@gmail.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, 
	Serge Semin <fancer.lancer@gmail.com>, Lothar Rubusch <l.rubusch@gmail.com>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH net-next v5 3/3] net: stmmac: Add glue layer for Sophgo
 SG2044 SoC
Message-ID: <thc5oknaqaw54wghyxpx6nr4kbykxvpgkgvpqsnsp2osjlxgwv@dekgtkxoywrm>
References: <20250216123953.1252523-4-inochiama@gmail.com>
 <Z7IIht2Q-iXEFw7x@shell.armlinux.org.uk>
 <5e481b95-3cf8-4f71-a76b-939d96e1c4f3@lunn.ch>
 <js3z3ra7fyg4qwxbly24xqpnvsv76jyikbhk7aturqigewllbx@gvus6ub46vow>
 <24eecc48-9061-4575-9e3b-6ef35226407a@lunn.ch>
 <Z7NDakd7zpQ_345D@shell.armlinux.org.uk>
 <rsysy3p5ium5umzz34rtinppcu2b36klgjdtq5j4lm3mylbqbz@z44yeje5wgat>
 <Z7PEeGmNvlYD33rZ@shell.armlinux.org.uk>
 <6obom7jyciq2kqw5iuqlugbzbsebgd7ymnq2crlm565ybbz7de@n7o3tcqn5idi>
 <Z7Rjjo5nZ0gnCbzq@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z7Rjjo5nZ0gnCbzq@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_033503_871724_1B27819F 
X-CRM114-Status: GOOD (  46.05  )
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

On Tue, Feb 18, 2025 at 10:40:14AM +0000, Russell King (Oracle) wrote:
> On Tue, Feb 18, 2025 at 09:01:59AM +0800, Inochi Amaoto wrote:
> > On Mon, Feb 17, 2025 at 11:21:28PM +0000, Russell King (Oracle) wrote:
> > > On Tue, Feb 18, 2025 at 06:50:24AM +0800, Inochi Amaoto wrote:
> > > > On Mon, Feb 17, 2025 at 02:10:50PM +0000, Russell King (Oracle) wrote:
> > > > > On Mon, Feb 17, 2025 at 02:25:33PM +0100, Andrew Lunn wrote:
> > > > > > > I am not sure all whether devices has this clock, but it appears in
> > > > > > > the databook. So I think it is possible to move this in the core so
> > > > > > > any platform with these clock can reuse it.
> > > > > > 
> > > > > > Great
> > > > > > 
> > > > > > The next problem will be, has everybody called it the same thing in
> > > > > > DT. Since there has been a lot of cut/paste, maybe they have, by
> > > > > > accident.
> > > > > 
> > > > > Tegra186: "tx"
> > > > > imx: "tx"
> > > > > intel: "tx_clk"
> > > > > rk: "clk_mac_speed"
> > > > > s32: "tx"
> > > > > starfive: "tx"
> > > > > sti: "sti-ethclk"
> > > > > 
> > > > 
> > > > The dwc-qos-eth also use clock name "tx", but set the clock with
> > > > extra calibration logic.
> > > 
> > > Yep, that's what I meant by "Tegra186" above.
> > > 
> > > > > so 50% have settled on "tx" and the rest are doing their own thing, and
> > > > > that horse has already bolted.
> > > > > 
> > > > 
> > > > The "rx" clock in s32 also uses the same logic. I think the core also
> > > > needs to take it, as this rx clock is also mentioned in the databook.
> > > 
> > > The "rx" clock on s32 seems to only be set to 125MHz, and the driver
> > > seems to be limited to RGMII.
> > > 
> > > This seems weird as the receive clock is supposed to be supplied by the
> > > PHY, and is recovered from the media (and thus will be 2.5, 25 or
> > > 125MHz as determined by the PHY.) So, I'm not sure that the s32 "rx"
> > > clock is really the clk_rx_i clock supplied to the DWMAC core.
> > > 
> > > Certainly on stm32mp151, it states that ETH_RX_CLK in RGMII mode will
> > > be 2.5, 25 or 125MHz provided by the PHY, and the clock tree indicates
> > > that ETH_RX_CLK in RGMII mode will be routed directly to the clk_rx_i
> > > input on the DWMAC(4) core.
> > > 
> > 
> > RGMII is not the problem. The databook says the RGMII clock (rx/tx)
> > follows this set rate logic. 
> 
> Sorry, I find this ambiguous. "This" doesn't tell me whether you are
> referring to either what s32 does (setting the "rx" clock to 125MHz
> only) or what RGMII spec says about RX_CLK (which is that it comes from
> the PHY and is 2.5/25/125MHz) which stm32mp151 agrees with and feeds
> the PHY's RX_CLK to the clk_rx_i inputs on the DWMAC in RGMII, GMII
> and MII modes.
> 

What I said follows the second, the clock is set at 2.5/25/125MHz
with speed at 10/100/1000Mbps. The only thing I can refer to is the
ip databook.

> clk_rx_i comes through a bunch of muxes on stm32mp151. When the clock
> tree is configured for RMII mode, the rate on clk_rx_i depends on the
> MAC speed (10/100Mbps).
> 

OK, I have no problem and find some descriptions related to this in
the databook.

> This suggests as far as the core is concerned, the clock supplied as
> clk_rx_i isn't a fixed rate clock but depends on the speed just like
> the transmit clock.
> 

This is what I want to say. clk_rx_i is not fixed but the
s32 uses it as a fixed one (This is the thing I felt weird).

In fact, Non-fixed clk_rx_i is why I suggested adding the rx
clock to the core at first. Since the drive may not use rx
clock as the databook says, it is good to leave it alone.

At last, it seems like that I need to improve my statement.
I am sorry for it.

> > For other things, I agree with you. A fixed "rx" clock does reach the
> > limit of what I know. And the databook told nothing about it. As we
> > can not determine the rx clock of s32 and it may be set for the phy,
> > it will be better to not move it into the core.
> 
> I'm intending to leave s32's rx clock alone for this reason as it does
> not match what I expect. Maybe on s32 there is a bunch of dividers
> which are selected by the mac_speed_o signals from the core to divide
> the 125MHz clock down to 25 or 2.5MHz for 100 and 10Mbps respectively.
> As I don't know, it's safer that I leave it alone as that means the
> "rx" clock used there is not clk_rx_i.
> 

Thanks for your explanation. This is OK for me.

Regards,
Inochi

