Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F7F1C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 09:29:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFGB/39PUQRNUuopd0MS0kGVSVfgQHVyMjplY4VKnOg=; b=Xat40JdcUbvybmMLEy/C/R52Kr
	5Z1uIgft1OXSwtUkrUT6L00yLW1V+XSbM78pJHjtkvmZnDuxJxVh0TOJDFp5HjjX6iCfvq6sK8P6d
	zeWDlKcwkQrtgXfJjZMlpSymYgXQmhCZv/RqY9qdc5+YP8d9B+TOxzv0DuDtpZ3mPtj6S97gbYpoR
	L0ewHv240bzTlZ2YLLIbDBnBNz9UFglCfll+w7/RuSWqq1MX38tm4NCBn5O/rklH7do7/JzIEedqV
	+FiyFf+RbS/ZMBBtuGUHipoKD0mc9+90Y16S3LIhv52XbD1MHTTc/Z8y+VBr7jUPiIunjqWl77ks8
	0rJ1+Xcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZnb5-0000000BLe5-3Uq3;
	Thu, 10 Jul 2025 09:29:44 +0000
Received: from fout-b7-smtp.messagingengine.com ([202.12.124.150])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZm1D-0000000B4NJ-2J4b
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 07:48:37 +0000
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id 89DD01D001AA;
	Thu, 10 Jul 2025 03:48:32 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 10 Jul 2025 03:48:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1752133712;
	 x=1752220112; bh=VFGB/39PUQRNUuopd0MS0kGVSVfgQHVyMjplY4VKnOg=; b=
	Vk43m7rpatUNVCIm/eUsqs4Ivfk2UAWEuI+3QdpF6tq/2p2Lh+ghW7sXZwf7ePRP
	lp1BH169XV5kIeDOARAgRA1RkWeVcUsv5pGboRcW25/sB+En4ZlTAFgBwWAqCEBZ
	N9xOxBE2ykDt0nVZlO/n22T/8p5uvUXSFGRb9RaHZfatZP18GgfRuciyDsrhcmbm
	T5izMMofJ6sb6QNuY6GAVceWyMpZNCLpIMpkhU9qE5hSwxNe2bS34pCqadzKGk3V
	B3aEQ378TjhU+DW3V7s5SRStGQvK8NOuqvkX5LHnL2qTCskFnh+RZWKx+s7ySJDf
	A4UYNGq8sf1naJ1hGcTAmA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1752133712; x=
	1752220112; bh=VFGB/39PUQRNUuopd0MS0kGVSVfgQHVyMjplY4VKnOg=; b=N
	Ql9a9qSupN5QGTE+AgKygTP9In0dw1wIlfecsFJ11CmzNeXW44dST/zm5C5AUR2b
	iSSmoJ0E6wL/POomU+JF0IfWJEsWhwtmfvVq1Pxt6gUz4jHWE49Zepy0+KHEfR88
	698DKrgkzF5BR+Y5zvGYmiaSORLqleZ/IzjJJqF3iJ2YA/QHfap8g84DpKZjMYPi
	JOnnhgsF8Kilim/YzjuZGNPt43Ds0VSBrXOBLPhDwJ3x7baR0v3jfUTZ9Qg99LKL
	DcAC30i6Ohxdg1j9FLowUyK3DEhVPGivjApMA+aYkfmgGmkd7fO1EXEqbAa2b5Pj
	/rp61DMIPZWEGWMnrRsjA==
X-ME-Sender: <xms:TnBvaFCPUNXTh3IvTOxOLzdDHNHZNRbcvlNXqh5rRJbrXGkNso61Bg>
    <xme:TnBvaDgBxfku5Iv_jnwEfXQWOxZj7ezk_uh2m_oMLc8idRJhArJNus_I6hZ3EKQqv
    G8LwwXBAqKoRUK_sRc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefleekkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeefjedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheptggrthgrlhhinhdrmhgrrhhinhgrshesrghrmhdrtghomhdprhgtph
    htthhopehjvghsphgvrhdrnhhilhhsshhonhesrgigihhsrdgtohhmpdhrtghpthhtohep
    lhhinhhugidqrghrmhdqkhgvrhhnvghlsegrgihishdrtghomhdprhgtphhtthhopehmth
    hurhhquhgvthhtvgessggrhihlihgsrhgvrdgtohhmpdhrtghpthhtohepghifkhdutddu
    feestghorghsihgrrdgtohhmpdhrtghpthhtohephhhgkhhimhdtheestghorghsihgrrd
    gtohhmpdhrtghpthhtohepkhgvnhhkihhmsegtohgrshhirgdrtghomhdprhgtphhtthho
    pehkshhkgeejvdehsegtohgrshhirgdrtghomhdprhgtphhtthhopehmihhnghihohhunh
    hgsghosegtohgrshhirgdrtghomh
X-ME-Proxy: <xmx:TnBvaGptIpdFPbsUo13BNf8hpBhqyqysy3fq_yWLHl13xPdF6tSqxA>
    <xmx:TnBvaGe9Vhef7xcrOIfQrP9rdJviWHKY6trwBHqDzDAQFB2ePiR0gA>
    <xmx:TnBvaM9YcmmE4mbvyo2Gkxwpd7nYsDvTmU_J2YlrV-Dqs2KmNiNmLw>
    <xmx:TnBvaHGUb8p777hi5CV08Iy0wnhXfH-l5giCPKNtmAy72YNH5WICTw>
    <xmx:UHBvaOxDqHidI8CwbxD1Qo4ftx7FkbIJU0nBSF2y3Yd3Sf3_svEj6zLU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 8E75D700065; Thu, 10 Jul 2025 03:48:30 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: T040df5ea49d69849
Date: Thu, 10 Jul 2025 09:48:10 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: ksk4725@coasia.com, "Jesper Nilsson" <jesper.nilsson@axis.com>,
 "Michael Turquette" <mturquette@baylibre.com>,
 "Stephen Boyd" <sboyd@kernel.org>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>,
 "Krzysztof Kozlowski" <krzk@kernel.org>,
 "Sylwester Nawrocki" <s.nawrocki@samsung.com>,
 "Chanwoo Choi" <cw00.choi@samsung.com>,
 "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Tomasz Figa" <tomasz.figa@gmail.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>, "Will Deacon" <will@kernel.org>,
 "Ravi Patel" <ravi.patel@samsung.com>, "SungMin Park" <smn1196@coasia.com>
Cc: kenkim <kenkim@coasia.com>, "Jongshin Park" <pjsin865@coasia.com>,
 "GunWoo Kim" <gwk1013@coasia.com>, "HaGyeong Kim" <hgkim05@coasia.com>,
 "GyoungBo Min" <mingyoungbo@coasia.com>,
 "Pankaj Dubey" <pankaj.dubey@samsung.com>,
 "Shradha Todi" <shradha.t@samsung.com>, "Inbaraj E" <inbaraj.e@samsung.com>,
 "Swathi K S" <swathi.ks@samsung.com>, Hrishikesh <hrishikesh.d@samsung.com>,
 "Dongjin Yang" <dj76.yang@samsung.com>,
 "Sang Min Kim" <hypmean.kim@samsung.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-arm-kernel@axis.com, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, soc@lists.linux.dev
Message-Id: <5494bedb-6907-43dc-8580-04ef1e47c8d0@app.fastmail.com>
In-Reply-To: <20250710002047.1573841-15-ksk4725@coasia.com>
References: <20250710002047.1573841-1-ksk4725@coasia.com>
 <20250710002047.1573841-15-ksk4725@coasia.com>
Subject: Re: [PATCH 14/16] arm64: dts: axis: Add initial device tree support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_004835_987817_FEC4CD85 
X-CRM114-Status: GOOD (  14.28  )
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

On Thu, Jul 10, 2025, at 02:20, ksk4725@coasia.com wrote:
> From: sungminpark <smn1196@coasia.com>
>
> Add initial device tree support for Axis ARTPEC-8 SoC and Grizzly board.
> This SoC contains four cores of cortex-a53 CPUs and other various
> peripheral IPs.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index fa1e04e87d1d..371005f3f41a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2320,6 +2320,20 @@ F:	drivers/crypto/axis
>  F:	drivers/mmc/host/usdhi6rol0.c
>  F:	drivers/pinctrl/pinctrl-artpec*
> 
> +ARM/ARTPEC ARM64 MACHINE SUPPORT
> +M:	Jesper Nilsson <jesper.nilsson@axis.com>
> +M:	Ravi Patel <ravi.patel@samsung.com>
> +M:	SeonGu Kang <ksk4725@coasia.com>
> +M:	SungMin Park <smn1196@coasia.com>
> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +L:	linux-samsung-soc@vger.kernel.org
> +L:	linux-arm-kernel@axis.com
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/clock/axis,artpec*-clock.yaml
> +F:	arch/arm64/boot/dts/axis/
> +F:	drivers/clk/samsung/clk-artpec*.c
> +F:	include/dt-bindings/clock/axis,artpec*-clk.h

I'm trying to understand the SoC family tree here. I see that
you have an entry for ARTPEC SoCs above it, which currently
covers artpec6 (Cortex-A9, apparently not Samsung based).

Is the reason for having two entries here that artpec6/7 and
artpec8/9 are two separate SoC families, or is this just because
they are using 32-bit and 64-bit cores, respectively?

> 
> +config ARCH_ARTPEC
> +	bool "Axis Communications ARTPEC SoC Family"
> +	help
> +	   This enables support for the ARMv8 based ARTPEC SoC Family.
> +
> +config ARCH_ARTPEC8
> +	bool "Axis ARTPEC-8 SoC Platform"
> +	depends on ARCH_ARTPEC
> +	depends on ARCH_EXYNOS
> +	select ARM_GIC
> +	help
> +	  This enables support for the Axis ARTPEC-8 SoC.
> +

I would prefer to be less fine-grained here, especially as
it seems that ARTPEC9 is again quite similar to ARTPEC8, as
far as I can guess from public information.

Could you fold both entries into a single ARCH_ARTPEC?

     Arnd

