Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147E1CD484E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 May 2026 20:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vifrlnSm2hwvPtyavVza6RSqJuHvkSa7YEqnDg6i8hI=; b=elGjoMHv7yHx6s3/Cw84zvl00O
	rkZ+BeK/GOqQ+uEwFQNXu/2xHcsgXO8PTsTaV33fnvoLRnq9OL6fVQbKBw/igFVCF2zaNGgJElhlN
	oiz+4dmZzJphohkGf+u+iyMtnbihUSXTQ09evEUge/eq2+DPLhdvqq6Hk5DTul8a3SeHtBE615xcV
	Zv5E4cLT4UGbDZJdhNi3fkN8MJeXb88p0nacvs80o3x3dO5uk4RXflnz15mrdqQ6NgVMMjkE33JZI
	QPQHnm++NuTaH04RL7Wscf75EzD9Xvvls2bueJb8gZPBIDuXA8DnFKfIf0V/efyJ8Qt3t0rV2exZe
	wWjJi9Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMWsF-0000000EfM8-0ztk;
	Mon, 11 May 2026 20:05:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMWsC-0000000EfLQ-3Y5U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 May 2026 20:05:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 80B30444DF
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 20:05:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 603D8C32781
	for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 20:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778529904;
	bh=vifrlnSm2hwvPtyavVza6RSqJuHvkSa7YEqnDg6i8hI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Nt3Ua8chsChWviUtf3nByVpkkunRyWEk+lT4AotDC9Y05Z3PHcf4uvVkTAmdFJuDv
	 s0KcDVTcLlF6KKv723rdN5giJIJLedqFepwwUSt9yplhxFPiNWsVhOtEd0OUoygCsC
	 9A+yD2JsJ2gqpGysBftNJ27epa4O4oyINB0D6HGTZ/355ObItcJrciIx4zF8LAJRBd
	 H1PPFlmgr/uTHGxyIpf6cX+sDcQhcPLsYt6YhCoOQwAigAocoMdMXzoCO75pyc8V5u
	 Iz5LD9vcUWvh8HzOLBEuXOZIw23m8RPWXzpxADikZnwyd4o5qsM2hf3wIENp7X0URd
	 jMXZsTsI0YMpg==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5a858881ad2so5077391e87.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 May 2026 13:05:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8Jr3MbrX5S7awyemP4yu8Ses+xW3GW9Y3oM/kjxwjnjsPdNO2fvs7224paqvrje3cZLDbxa7yfVdOs5w8IkIRq@lists.infradead.org
X-Gm-Message-State: AOJu0YzeE09dXzPlE/wTkRpr6tannSghJnBh1XhhAKg0oX2sombPnTK0
	54hz4Aw0YLQ4Yg2XqdSTne1mffKme3k0VXNfgW2c7s62ljYjIWzKzo5eXpANCNy5R66df++Akh7
	1+HsUyTL/tONxIGwq9jofnhVTXVDjH94=
X-Received: by 2002:a05:6512:3b21:b0:5a8:6793:e701 with SMTP id
 2adb3069b0e04-5a887ce64c1mr7724276e87.33.1778529903006; Mon, 11 May 2026
 13:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260506-upstream_pinctrl-v9-0-0636e22343ad@aspeedtech.com> <20260506-upstream_pinctrl-v9-2-0636e22343ad@aspeedtech.com>
In-Reply-To: <20260506-upstream_pinctrl-v9-2-0636e22343ad@aspeedtech.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 11 May 2026 22:04:50 +0200
X-Gmail-Original-Message-ID: <CAD++jL=3p9BvDgaot3=emM4Zn5jU-ZAUKtB4UwT1HzDiyzKq4Q@mail.gmail.com>
X-Gm-Features: AVHnY4JtxK2F1JLguIEb3zBOcAZHVynLHNdMopJnlqbcSYRx0cEplr-yGb19hdA
Message-ID: <CAD++jL=3p9BvDgaot3=emM4Zn5jU-ZAUKtB4UwT1HzDiyzKq4Q@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] dt-bindings: mfd: aspeed,ast2x00-scu: Describe
 AST2700 SCU0
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Bartosz Golaszewski <brgl@kernel.org>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-gpio@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_130504_925348_422A7CF7 
X-CRM114-Status: GOOD (  12.21  )
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

On Wed, May 6, 2026 at 10:07=E2=80=AFAM Billy Tsai <billy_tsai@aspeedtech.c=
om> wrote:

> AST2700 consists of two interconnected SoC instances, each with its own
> System Control Unit (SCU). The SCU0 provides pin control, interrupt
> controllers, clocks, resets, and address-space mappings for the
> Secondary and Tertiary Service Processors (SSP and TSP).
>
> Describe the SSP/TSP address mappings using the standard
> memory-region and memory-region-names properties.
>
> Disallow legacy child nodes that are not present on AST2700, including
> p2a-control and smp-memram. The latter is unnecessary as software can
> access the scratch registers via the SCU syscon.
>
> Also allow the AST2700 SoC0 pin controller to be described as a child
> node of the SCU0, and add an example illustrating the SCU0 layout,
> including reserved-memory, interrupt controllers, and pinctrl.
>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>

This is an MFD patch in the middle of a pinctrl series, I think Lee
should apply this.
FWIW:
Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

