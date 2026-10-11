Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D53CCA9EBD
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 Oct 2026 11:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oddb4XjeaRXSTqKxpqcRkSnzU2tXqgDwvjZy6Qt5fLo=; b=u55Y6Td/lDD/nc6H8KGdNS42eV
	CV1j2cZzD5iWRw4in8v8uOaP/RBSSqsGn/JVAsVufNm+isOMO5QnhGmZ8nAldNKOcNqKdscH19lNc
	vc9083ztZ5voWUK4VX7MEGO3UJot+Frqd42tRWVgpm6oPxO1lq03/38cxZA9GUEUSo6e1FKMOb4JT
	7v3zTLpSigmMo9tdJ+d/IczSnAqQmcpYKobimr/N4WWDAfrqx60K1nizQkitVO9IdF+R+bcCwYxpA
	LxyPq0aVSz7aHxL2gknjzHprMMV5NHMr1YcO4KZLC0ATtbF2j5VuZIxdVx8igAIIIDoP8QQjU+s19
	lHLeB6GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFrSE-00000008w1F-0bQr;
	Sun, 11 Oct 2026 11:10:59 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFrSB-00000008w0s-2BUp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 Oct 2026 11:10:56 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48afe75f055so980509f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 11 Oct 2026 04:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791717053; x=1792321853; darn=lists.infradead.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oddb4XjeaRXSTqKxpqcRkSnzU2tXqgDwvjZy6Qt5fLo=;
        b=rYnvBUEQY2G+auHBXHbXEMd4lpMxHtEpaGaJWyyCRCOmsvkeQ6d9HKnLycUI5iOt3u
         IRrhcQBUpSRsBgoB+R9sP4wKzbRA/e9FJVMYxzc9C7O1NoH0qazLY2z8U+JBPB6TDbiZ
         qb5yfr9POY+ASW3lOt80tmQkH8Nsh54lH1OKhbSGC5qWKVQqKEHPBRlIlCqYGrGp1IAP
         8gu6WfdF7gIg1uO4yPYlY80x9LGLa/2Aq264XQ3CmpEqV2QdegxSJfBU8TJP3giKU0/z
         j6VK91Gd3XcSVwQUlqSeXemoFpyEZkk4OlK8D3IxgPSJTdnPzCBiJf5WZggQfE1ZaSLh
         euIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791717053; x=1792321853;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Oddb4XjeaRXSTqKxpqcRkSnzU2tXqgDwvjZy6Qt5fLo=;
        b=Rqo+bfBW0/bge7vis8hUW6Taul/yFeIMV4GdRYQlBICDOrkGO2a1ekT87umhwgMYQM
         sMLZVo4Kbfe3FVfBt+EaHQiW1QxDWf40ZZfcXlM2MWXS4zuBmCtRh02bVhuwpyDqN8Sh
         f6VlfGqbW2PZrYJTgcx0XmDefX/Bg/rbsVXrPbjhEyLAUaZS8t0xHkdvq+AXRw5EF13f
         Gdd23f4ZVyclJVxH7hlh6ha0QWr9wwF4MMOAxKkLrzmnzvj/zc9wiBiWIkI+dt/RwRVP
         LeJRogCoNnqdHyi0farrW5IMAboJZbaaBGmuAatSeFHT7eF8aL+bbIWnFZnKSyb4ttIO
         KLuQ==
X-Gm-Message-State: AFq9FYJdgLlN5fTJNnPAmXlGfqj3fZ2/oXQo8YHVIpve/sHko0Q8+tTy
	AppSQBKu1ypIWyL4ar3lzONLcUrZkFqYLZwO78ZfzhmB70bs30TH5l9mBGsh3R/R
X-Gm-Gg: AYBFou2YE36pYoJTgs6ephY9zxLkjhSohIT7Xg4Rd5NsnBSOX4o640zjLvnN1Qi6CAr
	rRUEjI6S8e7smbI8Besbi/8R/sgTLSax5n32o1qbU8DazsNUkFvkSU6qSYH/xs6AZAwyyzAFvpK
	y1XqQrV8oxeF2z1SMqhAGlf7r28aPg+wzPXcQZVXiSTou3NfFBiIGlFYOq3bR2CgynvQr3fgOSo
	orX9a7yJhJSt2VlwzBib/39GofxYuE2Pt5vHAhP3ik3666+6gRXZ+JPkX84Zz466I1zeQjDXCZu
	YkeWidtrSadOCtYymppDYvMe+x8JDI8/tKwVb3URf6n04V0UUHt26z3NmZU3/J8VrXamDOme15Z
	aCy9ZtD9qs8muGDb+mOGYLNuWoIGl9h7J0utVFmMRC46x4VdOUv8YCbSRmMVmicHX9RV11LMAGY
	IJ/LqmQCOPTstsJruJ4uzv80MoHZfDPZBNS1NHTghJlGb2sopNOfzoZBzCbGSAXL3j+vDZtVXo7
	KbJTDa/4cz5aPPIMw1qxz0N/Pq6YU8dtREOtlEY5y4+BYgRagbXhIs8ig==
X-Received: by 2002:a05:6000:389:b0:486:e707:42eb with SMTP id ffacd0b85a97d-48dbacd93dcmr12379646f8f.33.1791717053269;
        Sun, 11 Oct 2026 04:10:53 -0700 (PDT)
Received: from silicon.doe.home (178.165.167.132.wireless.dyn.drei.com. [178.165.167.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db94e3519sm14833267f8f.16.2026.10.11.04.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 04:10:51 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, arnd@arndb.de,
 linux@armlinux.org.uk, robh@kernel.org, krzk@kernel.org,
 Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: Re: [PATCH 07/24] clk: zte: Add ZX279128S CRM clock and reset driver
Date: Sun, 11 Oct 2026 13:10:45 +0200
Message-ID: <43VZlEvRTNCe3DiA7z5UHQ@gmail.com>
In-Reply-To: <20261010130024.177503-8-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
 <20261010130024.177503-8-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartUy8Z56qoQNSy5dW6rm_Cdw";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_041055_623336_30FEAFBE 
X-CRM114-Status: GOOD (  45.91  )
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

--nextPartUy8Z56qoQNSy5dW6rm_Cdw
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Subject: Re: [PATCH 07/24] clk: zte: Add ZX279128S CRM clock and reset driver
Date: Sun, 11 Oct 2026 13:10:45 +0200
Message-ID: <43VZlEvRTNCe3DiA7z5UHQ@gmail.com>
In-Reply-To: <20261010130024.177503-8-ghahramani.navid@gmail.com>
MIME-Version: 1.0

Hi Navid,

The big item as I see it is to split the clock and reset components into their 
respective subsystems. Yes, there are plenty of old clock drivers that handle 
resets directly in drivers/clk, but new drivers are encouraged to split them.

To handle access to the hardware from two different drivers your options are 
MFD and the aux bus. For my zx29 clocks I chose MFD because of the syscon-
reset MFD child (and Philip Zabel's preference to have one mechanism for all 3 
CRMs). For both, you will have to convert the drivers to use regmaps instead 
of direct mmio. Please see zte/clk-regmap.c for the infrastructure I put in 
place already. If there are any additions needed we can change it to 
accommodate your needs.

> + * A PLL has two registers. The output is
> + * osc * (fbdiv + frac / 2^24) / pd1 / pd2.
> + */
> +#define PLL_FBDIV		GENMASK(17, 6)
> +#define PLL_PD1			GENMASK(5, 3)
> +#define PLL_PD2			GENMASK(2, 0)
> +#define PLL_FRAC		GENMASK(23, 0)	/* second register */
> +#define PLL_FRAC_BITS		24

This looks identical to the zx29 PLLs, so you should be able to reuse the code 
in pll-zx.c. This will give you PLL enable/disable support and limited rate 
setting for free.

My PLL code doesn't handle the fractional component because my hardware 
doesn't use it (although at least one PLL supports it). I can easily add read 
support for it if you are able to test that the calculations match the 
hardware behavior.

Is there no equivalent of REFDIV (bits 23:18) on your hardware? My HW has it, 
although I think the default PLL configs always set it to 1.

> +static DEFINE_SPINLOCK(zx_top_lock);

You shouldn't need that with regmaps - regmaps bring their own lock, which 
also helps synchronization with the clock driver in case clock and reset bits 
are in the same register.

> +	/*
> +	 * The formula above gives 200 MHz for the LSP PLL, but the vendor
> +	 * kernel has it at 1 GHz, with fixed taps for the bus (250 MHz) and
> +	 * the peripherals (100 MHz). Until that is measured, it is 
registered
> +	 * with the vendor's rate.
> +	 */
> +	lsp = clk_hw_register_fixed_factor_parent_hw(NULL, "pll_lsp", osc, 0,
> +						     40, 1);

Did you check if it is programmed with the same value on the vendor kernel?

> +	/* 49.152 MHz, and the 32.768 kHz derived from it */
> +	audio = zx_top_pll(np, "pll_audio", base + TOP_PLL_AUDIO);
> +	if (IS_ERR(audio))
> +		goto err;
> +	audio_32k = clk_hw_register_fixed_factor_parent_hw(NULL, "audio_32k",
> +							   audio, 0, 
1, 1500);
> +	if (IS_ERR(audio_32k))
> +		goto err;

Deriving 32k from a PLL seems odd, although not impossible. My board has a 
fixed 32k osc, and it is the parents of most of the timers. Did you try to turn 
off the PLL and see if the 32k clock stops / changes rate? Since your usb uses 
the 32k clock for something suspend related I suspect it is *not* fed by a 
PLL. PLLs need quite a bit of power, keeping a high frequency oscillator plus 
a PLL running to produce 32KHz seems wasteful to me.

Figuring out PLL parents is a bit tricky. I did most of this work from the 
early bootloader (which is run by a separate Cortex M0 core) and can be 
configured to run on the 26 MHz osc directly. Then I could disable the PLLs and 
see which devices still work.

My board also has 4 GPIO pins that can output a clock signal. By connecting 
both GPIO and the clock, and setting the PLL to a low rate (500-1000 KHz), I 
could poll the GPIO state and count low/high transitions to see which rate was 
produced.

> +	m200 = clk_hw_register_fixed_rate(NULL, "clk_200m", NULL, 0,
> +					  200000000);
> +	if (IS_ERR(m200))
> +		goto err;
> +	m20 = clk_hw_register_fixed_factor_parent_hw(NULL, "clk_20m", m200, 
0,
> +						     1, 10);
> +	if (IS_ERR(m20))
> +		goto err;

I suspect these are children of your 1 GHz PLL.

> +	en = base + TOP_CLK_EN;
> +	hws[ZX279128S_TOP_LSP0_100M] = zx_top_gate(en, "lsp0_100m", 
lsp_100m,
> +						   13, 0);
> +	hws[ZX279128S_TOP_LSP0_32K] = zx_top_gate(en, "lsp0_32k", audio_32k,
> +						  12, 0);
> +	hws[ZX279128S_TOP_LSP0_PCLK] = zx_top_gate(en, "lsp0_pclk", pclk, 
11, 0);

I suspect the board has a few more distribution nodes like this. Try to 
identify them: Even if they are all enabled by default, understanding them 
will give you answers about clock dependencies.

This TOP_CLK_EN declaration has gaps at bits 3 and 10. This may be legitimate, 
but please test if the bits are always 0 and add a comment.

> +	if (of_clk_add_hw_provider(np, of_clk_hw_onecell_get, data))
> +		goto err;
> +
> +	if (zx_top_reset_init(np, base))
> +		pr_err("%pOF: failed to register the resets\n", np);
> +	return;
> +
> +err:
> +	/* Without its timer and bus clocks the system won't boot anyway */
> +	pr_err("%pOF: failed to register the clocks\n", np);

I am missing quite a few clocks here: My board has ~15 or so proprietary 
timers and watchdogs, a DMA controller, i2c, i2s, multiple SPIs. The ZTE 
kernel may not control them directly and rely on the boot loader to enable 
them, or it may have outsourced control to them to a proprietary blob (e.g. 
whatever is driving your hardware packet processing).

> +struct zx_lsp_periph {
> +	const char *name;
> +	unsigned int reg;
> +	int wclk;			/* index of the work clock, or -1 */
> +	int pclk;			/* index of the register clock */
> +	const char *parents[2];		/* the mux inputs, or one 
parent */
> +	u8 div_width;			/* 0: no divider */
> +};

Based on your

>+#define LSP_WCLK_SEL_SHIFT     9
>+#define LSP_WCLK_DIV_SHIFT     11

I'd expect 4 possible parents at least for some peripherals.

> +struct zx_lsp_data {
> +	const struct zx_lsp_periph *periphs;
> +	unsigned int num_periphs;
> +	unsigned int num_clks;
> +	bool aclk;			/* the group has an AXI clock */
> +};

I suspect somewhere in these 32 bits you'll have one or two reset controls 
too. Look if there are set bits outside of the known pclk, wclk, mux and div 
bits. On my LSP controls it is bits 8 and 9. Bit 8 would be a good guess on 
yours, since the mux bits start at 9.

Personally I like the kind of combined description structure. Philip Zabel 
(Reset maintainer) was not too happy about it. My regmap clocks don't have 
infrastructure to handle such a combined registration, but one way or another 
we can add it. In the end I just gave up on it though and listed muxes, divs 
and gates separately.

> +	if (p->parents[1]) {
...
> +	} else if (p->div_width) {
...
> +	}

Are mux and div mutually exclusive? On my hardware they aren't - the timers 
and watchdogs on the LSP bus have both.

> +static const struct zx_lsp_periph zx_lsp0_periphs[] = {
> +	{ "uart0", 0x10, ZX279128S_LSP0_UART0_WCLK, 
ZX279128S_LSP0_UART0_PCLK,
> +	  { "wclk25m", "wclk100m" } },
> +	{ "uart1", 0x14, ZX279128S_LSP0_UART1_WCLK, 
ZX279128S_LSP0_UART1_PCLK,
> +	  { "wclk25m", "wclk100m" } },
> +	{ "spi", 0x18, ZX279128S_LSP0_SPI_WCLK, ZX279128S_LSP0_SPI_PCLK,
> +	  { "wclk100m" }, 6 },
> +	{ "gpio", 0x1c, -1, ZX279128S_LSP0_GPIO_PCLK },
> +};

I suspect offsets 0x4, 0x8 and 0xc have clocks that may not be mentioned in 
ZTE's code. You can see if it has non-zero bits on boot and if you can modify 
the registers.

On my LSP bus the devices are on 0x1000 aligned offsets (0x0 is the CRM itself, 
0x1000 the first timer with clock controls at 0x4, 0x2000 is a watchdog with 
clocks at 0x8, ...). Considering that your uart0 sits at 0x4000 and has clock 
controls at 0x10, it is likely the same.

Furthermore every device has an ID register at device offset 0 that helps to 
identify the devices. My clk-zx297520v3.c has IDs for my devices. Yours may or 
may not be the same.

--nextPartUy8Z56qoQNSy5dW6rm_Cdw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmrLbrUbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMywyAAoJED0TvMhUTxoi4VUQAIVIonilpwgJxduH/m+1
MD9TIMkoGsk4a8HmKSE//2hrIqDR0h87+YjZGdSjt6lf73pzwTrZZq99hwMFqG6e
pabbzUS128ODjUG9BHENEN56XEGwIjDHzlubPmnbylt2PBAEd69AIFHKyRq2ALhs
5KF+/zk+Eq9iAEP6Jpf4Dkq+EajnGchDFxi51QRXYbSXHjL/CiIhpyaOS+E/eNWR
AFB+QLnU3BAKw0KxG5es6Uw0apiyq4qlfhENHBR8VZTyhx3TslKZP1E8xWZYzYTS
kNvWhDzBQcvoEgjNkpq9wqW7oYXn3ZUlm5xfIvBwZpREXncaycMd/qdMaFhIy3Pj
ZXYa66U/GjobFYQOt6NydYee3bZJYvQHb77EL1ICcCBPDFIRyd6lGaTxNbfV3Cp0
/aLI1QF1iKl2VL0HKG+3olg7r1lWizxDhlZ8xuNhj4ke4SqNTsFQ4K/kXG8ChmpM
2CEo8oapQLUf0t+VgTPI5v0N78APVctELoHHDElE/PTG791Qy3Xju31OPqkMSGoQ
pmlpO4kgSZkIW0FOve+Mypn89WEJ96RUu7JxGB2L81qRW4R1gNNpmb1TsMxfzUR9
dlaWpLR4rNF+49ia5Ra53kDmVN/IKkZhRt+HGWN9nxD+mjPfjlyAwromD2IC8Ahr
IIMR/QGIUmcynQ1UqmBq2uzi
=b5Gl
-----END PGP SIGNATURE-----

--nextPartUy8Z56qoQNSy5dW6rm_Cdw--




