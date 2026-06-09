Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A088CD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 16:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ltcN6lrCBn1i7VizWEDzmvqmfmSuDzvei1Fc92HuNdU=; b=uVX5ZXuJUh05YXLbOEAr5UUoqo
	r6vKyADbZgO+whnRYXaAo58UVnCE3/iCRAFDNYpJdC635E9bHoOfxZnit/iXGBCNE5EjasAcP9hJW
	B/d58vmMJQfuoPobN+MZz4NF7wylSDE8ZYgpZS5+MWLc8pLg2OLih0q62/Ohm1yx5k9z/NvTybdcI
	fTEuOvXr2qQ/LZoNxEmkoq0m0F5tOlCZVedB1AovkESPrXyRNQN9HS8qOF1cu3mWiV736TVJv9g0O
	JYHzij07JpuHzb9WqBKC7MU6os/KNmlDKPcWG9gYRhS+GbQHa7A0lOLjOmHfL1YI5/AB7a4YWijcf
	Od2FxCmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWzWr-000000064gM-2hXB;
	Tue, 09 Jun 2026 16:42:19 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWzWp-000000064ey-0RdO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 16:42:16 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-490ac357c55so62927135e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 09:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781023333; x=1781628133; darn=lists.infradead.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ltcN6lrCBn1i7VizWEDzmvqmfmSuDzvei1Fc92HuNdU=;
        b=M4MHjebfeUGjRfiJq/QqBpi0dJXLK/nztkrp3og78UyQfDRdJcYT6zL2spMbMHEQB7
         HLvVEFvog/Xv1IkBYHSsFMUrnA08OzXeQyKDt0kWhnDUr7hnIdWR4g249HNdNwvY2+hV
         o520YalmWEKmau7bRN09nXX/MpDpsYp+benHqBTQq/K/uE4ULEgUN+wbjAmMgxWSOk6I
         lQ/y0M1FwwNTncg499QoAbMvvyo6dxA/jevgsBhF90hlSlsZ3gYPD4dlBgR7wiHaELPA
         siqY5yEnHfACHCtciloVE/K11vJ7SIYa+X+tB9MskydgybEWvRkWsh4kwQzf7GoLnODx
         pttw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781023333; x=1781628133;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ltcN6lrCBn1i7VizWEDzmvqmfmSuDzvei1Fc92HuNdU=;
        b=JN+xizRCc8UV/KOY0GC5c5VCjU12PyFZOu6OL5stCkZMrHtQxuug1/lr+BxByiGrYG
         9phGDsMuPX24f3sbt0mYeVzbNvNybs78CBpcbSKXTzYlAp9sYjgAFfXZ0tykP01+K+JM
         ceNL7L8PEWKlBVzTIWUHdR4BBeezOA62KiXmnhWs7iV2zMYWZch/stW9tKPbDcGdZ6aA
         73pHHaT377dwRKpeVuq7Pybsn/7TJLZh6aG8LsMAvYXFzvEx53obwC61teEJFRVVRNJa
         eZQk6Gc/w7/+XghxRY6a85E1qH0nZLVzDkBr8lyQmOHlwrMDYYnx3nbKnxwskZa6bvTm
         JGgw==
X-Forwarded-Encrypted: i=1; AFNElJ+JiEqGe4oAyBsvBDxpznSifc9NcKZl07GE3dGT/KiCTXikgFq5THNLaXHDk4gfiXnD/bDm1AySXupM6zAZsFft@lists.infradead.org
X-Gm-Message-State: AOJu0Yya57Xr9TZ8X7ducP+EEbaIg0Jl9P3Z6YXq/rvBQBX8yWh/O3mE
	gQw2ANnB++t6FEv+MkQvtXFIDPNrM33pWdJ63iLjGdwccw/+Gc8i0ALH
X-Gm-Gg: Acq92OHQ9DBtM1iPvtCGaJTeP1b6MN+DnmvcEV8yo4YKJ9RrIb/tG9Dbq/Qphpx8nEo
	VxgQbj6Bcrr1wVxFX9bkASj1QE3xqmkxd9eUr8l03s+DJjPEbzh7JfBaEQa18aWz2B2LL31zhIp
	7HwuQB0YqV4rB7H3Yurro9R8tFypQxrhD1Y2MTbd3zNjNcTNjP/rjbmik8MSOa9KWV6rPUv6n4g
	zxf76f8F8ov1tAO+ZjyqOa2T6Bxv4PZS2IoWPS6MJcNQp6En0WUIozU4Rag2Wi71Ted+QIo7+jw
	6SRbF2b/W2IXXh0QJPSLCchMjK7fjkuWfgIrkBub4pSHHkmn84I6DxhfciY/C07cqRtOhukZvjT
	GpA+OHsUnEWi61B646FMn0i+shSdf22kPcVrd0+MmooAgoa7GY3c6Yn531RPypLhJWmiXZZuo0s
	pqst5ASgRq0tNIo60lLmcHyHLkGh2EbmiCnt6QQ8xC4Z725afMEQ==
X-Received: by 2002:a05:600c:529b:b0:490:5380:f2cb with SMTP id 5b1f17b1804b1-490c2528b6amr352314605e9.0.1781023332863;
        Tue, 09 Jun 2026 09:42:12 -0700 (PDT)
Received: from silicon.doe.home ([197.250.227.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46059346676sm2398593f8f.26.2026.06.09.09.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 09:42:12 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v3 0/5] ZTE zx297520v3 clock bindings and driver
Date: Tue, 09 Jun 2026 19:42:02 +0300
Message-ID: <QsCV4VffTSWWBp014o7Pkg@gmail.com>
In-Reply-To: <f92114a3658185b57bffe546c0f4079a9d39afce.camel@pengutronix.de>
References: <20260529-zx29clk-v3-0-c7fe54ea388f@gmail.com> <2062167.PYKUYFuaPT@strix>
 <f92114a3658185b57bffe546c0f4079a9d39afce.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartFLf7VarUTpi_4IXxXYdobw";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_094215_178967_B804D8A3 
X-CRM114-Status: GOOD (  26.80  )
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

--nextPartFLf7VarUTpi_4IXxXYdobw
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Subject: Re: [PATCH RFC v3 0/5] ZTE zx297520v3 clock bindings and driver
Date: Tue, 09 Jun 2026 19:42:02 +0300
Message-ID: <QsCV4VffTSWWBp014o7Pkg@gmail.com>
In-Reply-To: <f92114a3658185b57bffe546c0f4079a9d39afce.camel@pengutronix.de>
MIME-Version: 1.0

Hi Philipp,

I did some more reading and checked past clock driver submissions. This email 
is to check if I understood it right.

Am Donnerstag, 4. Juni 2026, 18:23:01 Ostafrikanische Zeit schrieb Philipp 
Zabel:
> > The register lock because all LSP and at least one TOP register contains
> > both clocks and resets.
> 
> That could be solved with regmap.

This will require me to change the clk component to use regmaps too. There's 
no regmap equivalent to clk-{div,gate,mux}.c, so I'll need my own. qcom and 
meson have similar drivers already, so I'd likely copy one of them. Is there a 
particular reason why there isn't a regmap equivalent of clk-{div,gate,mux}.c?

Another hypothetical solution is a custom regmap implementation that locks my 
clk driver's lock. I see that only in imx/clk-imx8ulp-sim-lpav.c.

However, the topclk region also has a stray register that controls if a 
watchdog timeout resets the board. So there's no good way past a syscon 
compatible and syscon generated regmap anyway.

Afaics syscon regmaps only support a single IO region, so I'd likely revert 
back to the topclk/matrixclk split with different bindings, bite the other 
bullet and list all 50 or so PLL outputs as clocks passed from top to matrix.

Which gives a device tree setup like this:

topcrm: something@13b000 {
	compatible = "zte,zx297520v3-topcrm", "syscon", "simple-mfd";
	reg = <0x0013b000 0x400>;
	#address-cells = <1>;
	#size-cells = <1>;
	ranges;

	topclk: clock-controller@0 {
		compatible = "zte,zx297520v3-topclk";
		reg = <0x0 0x400>;
		#clock-cells = <1>;
		#reset-cells = <1>;
		clocks = <&osc26m>, <&osc32k>;
		clock-names = "osc26m", "osc32k";
	};

	reboot {
		compatible = "syscon-reboot";
		offset = <0x0>;
		mask = <0x1>;
	};
};

watchdog_t18: watchdog@148000 {
	compatible = "zte,zx297520-wdt";
	reg = <0x00148000 0x20>;
	clocks = <&topclk ZX297520V3_WDT_T18_WCLK>, <&topclk 
ZX297520V3_WDT_T18_PCLK>;
	clock-names = "wclk", "pclk";
	resets = <&topclk ZX297520V3_WDT_T18_RESET>;
	zte,wdt-reset-sysctrl = <&topcrm 0x2c 0x3 0x3>;
};

(I did not attempt to build this, might have typos)

And the reset controller will be an aux-bus child of the clock controller. I 
could make the reset controller its own device with its own bindings, but that 
would misrepresent the hardware.

Did I understand this correctly?

For some reason in my dev tree the reset sysctrl works even though my clock 
driver does not use the syscon compatible nor manually create a regmap.

> > Shared register definition: in the case of the LSP clocks breaking up the
> > composite definition would sacrifice readability.
> 
> That is a matter of perspective.
> 
> I had a harder time validating that the resets[] array is properly
> initialized from the two different composite arrays because of the
> unordered reset_ids, and some remaining resets[] being filled via code.

I do have a sanity check loop for that.

> It would be much simpler if you split the reset definitions out into a
> single, separate, const array, indexed by reset id. In fact,
> I would suggest this even if you don't intend to move the reset code.

I had to collect the clocks and resets from all over ZTE's kernel and U-Boot 
sources plus manual testing, so maybe I am a bit too attached to seeing all 
controls for a given device in one place. If the reset controls move to a 
different file, the composite structure becomes less useful, so I'll probably 
split it up and just list single div, gates and regs.

--nextPartFLf7VarUTpi_4IXxXYdobw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmooQlobFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoiKesQAJRepE5jSEE8unaib32O
EpI63wWhBCKBNi9UCv8iIeAt61Av/y7m/U19SEHHCCyv2IdoH8hhqoPLjcJjt+/v
UsWNcEujOPf+JbRRRtSP2UyoirW5rsoYHEMOTuMfJSBvk2/SIrTApo7AwDhV59rb
nJ/MZI9DtTBOGF3CV+vuc9qPWtO8hntdu+jlLeg7TmUSkqtJJZEjknUKZdBZGpDQ
NSd2dY7wHnf7RhLEP73OBXwm9ebely5izLtAyNiDltkDAOAjJXZibKzRbZ/bPgdz
XkiQ854wIcynNBQPEaDwsHu4tAzpQSBd6qrZzAzrGn/Nw7XCBvTT3rD2xGhJUEU6
KUJmfCYzS+5dpY1tfSvsstPruM936JzgH6EBCpY0pQjvrs+QdW1lEMrT1NE890rC
shggbu9bGsS714qLLk54JffkJlpwTAPlObtNqOdyQH22cAvZvKfZ5cZY+rJzdoAs
2+d6glovGoZ1aJDGU8WhE9nnlKVgTYObenacdL+fedcfBKo0AwRc8Bu5EYnvn4DP
v+IKyecGKLWSiudu0Jh8oH3uguoKGpFHlZtXcd0jpLn6h7VvS3wqU3LeBpKRu6Em
Q04ptHCtkq5eJZBqHFBuBWbfT0XfkAF3sVmZqMxq7/SrzT1e3xJ3apVLcdo9u9Fe
b8l88Dq5BUMzyvr1kCAAFtGj
=8F5V
-----END PGP SIGNATURE-----

--nextPartFLf7VarUTpi_4IXxXYdobw--




