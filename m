Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20792E6F060
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 14:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kQWckLG9l5qxClEqevSWSdLNc74FRIdwG7wPBnwLtfo=; b=v55OTfd4tk7lQJzSDfJnvjc2HX
	Z2w+515RnTA/DyhmKpdgXr3oDguWX/XA/4jPbJLZXbybsMX3NYG/mu8dc/xRLCBS7IOqCBXiUl0ZI
	x4r3WwwFcwdOoJO5YmVupvrjF8dZJt4cAku45F2v0rA0OJ0Q3BL6j78Ebv0uGHJw5N3mU7gX0J32n
	toSI8IzBU9G0PhXQlmEP4CKIZbMejANlKE5LxkZdWV0u50lAYNQXMqQWFzlIDGa+SlN3iMP266/yC
	OIzA6eBe23Zdker/ARB26lUGnkip/HyRTfMmRIGgc3y+Yp9Mri9jg/2w/GR2Arwo6sWm7Oz4W24A8
	wXCodf8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6sYO-00000007JzO-40Nn;
	Fri, 01 Nov 2024 14:23:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s96-00000007FnW-2ebE
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 01 Nov 2024 13:57:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kQWckLG9l5qxClEqevSWSdLNc74FRIdwG7wPBnwLtfo=; b=D44c8kXPOKS5VALd4l7rOvBABJ
	piykZjPKOUexQ1bkMCm1bc1C3H6b//FNM8qNCRJHahnxYu/MdwoGc7ffEQIdyEqP/2g7PFbiRmusk
	7nSBohTrMoRc/EKvafTj61OXZ3cq08v0KsE3yBQfPObRa07SpRsz2t2EJs0QI0X+/v2srxZBCXkhj
	9DVzDQYcHfGmbmdmcWgs4QUvkSWNQKwi/CNQp/Bdb6aT5p/WvMBrvpGuYXicIuG71Pg7Gzm+7sVwd
	z6r79u/i+Y6x1wgKr1Elf/S5175mCxpZGx83x7GwvxPshA1BDFIsh9xfZT9O49EGZzIxXb/uUrDnd
	d7BFOQHw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6s93-0000000Aj0U-180P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 13:56:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A2BDD5C8845;
	Thu, 31 Oct 2024 07:45:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D52BC4CED3;
	Thu, 31 Oct 2024 07:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730360794;
	bh=5AqQVqv7cgLso2HdKLdGQKCHtmDv0AGSPgURJ2Jfg1w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HET2Wo/YxxVBW6EePmT6fedO9UFXcAxmiSSpwHlxZymOhlqDpCE1L2GjyDiDxbPzN
	 R73fq9sjS7xM5ReBmdnyUVZGxEe3xSOCMERv4kmXvD6Nr6XUMKr7LeWT4ZZSVgamvg
	 /ZvdCKsYljXR7htrFv7vpdA+lcDJTikN9Gsb2liYGF/m9/ypln7425q8GD2armUQD9
	 QrvwXahuLe12l2H92j9c8CXsxJUBlQS7JRia8wY3UmxQvQev7LV5Z0gXuJbkyls9M+
	 8ZbT6Wb1g6RQ6Eo1bWzrr0g0a8zPF2ULPWMrCkJWHUkcXUF0u7w2KpXxhc8M5ShJVn
	 W5FJMcMEmgx4w==
Date: Thu, 31 Oct 2024 08:46:30 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Claudiu <claudiu.beznea@tuxon.dev>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	alexandre.belloni@bootlin.com, magnus.damm@gmail.com, p.zabel@pengutronix.de, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: [PATCH v5 01/10] dt-bindings: clock: renesas,r9a08g045-vbattb:
 Document VBATTB
Message-ID: <bt7kgzreebwyeyfsii2q6fci34vfqst6hrxk6anp6tzthlmc5o@t2ifzexazta7>
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
 <20241030110120.332802-2-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241030110120.332802-2-claudiu.beznea.uj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_135657_760127_80233ADC 
X-CRM114-Status: GOOD (  21.77  )
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

On Wed, Oct 30, 2024 at 01:01:11PM +0200, Claudiu wrote:
> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> The VBATTB IP of the Renesas RZ/G3S SoC controls the clock for RTC,
> the tamper detector and a small general usage memory of 128B.
> 
> The VBATTB controller controls the clock for the RTC on the Renesas
> RZ/G3S. The HW block diagram for the clock logic is as follows:
> 
>            +----------+ XC   `\
> RTXIN  --->|          |----->| \       +----+  VBATTCLK
>            | 32K clock|      |  |----->|gate|----------->
>            | osc      | XBYP |  |      +----+
> RTXOUT --->|          |----->| /
>            +----------+      ,/
> 
> One could connect as input to this HW block either a crystal or
> an external clock device. This is board specific.
> 
> After discussions w/ Stephen Boyd the clock tree associated with this
> hardware block was exported in Linux as:
> 
> input-xtal
>   xbyp
>   xc
>      mux
>         vbattclk
> 
> where:
> - input-xtal is the input clock (connected to RTXIN, RTXOUT pins)
> - xc, xbyp are mux inputs
> - mux is the internal mux
> - vbattclk is the gate clock that feeds in the end the RTC
> 
> to allow selecting the input of the MUX though assigned-clock DT
> properties, using the already existing clock drivers and avoid adding
> other DT properties.
> 
> This allows select the input of the mux based on the type of the
> connected input clock:
> - if the 32768 crystal is connected as input for the VBATTB,
>   the input of the mux should be xc
> - if an external clock device is connected as input for the VBATTB the
>   input of the mux should be xbyp
> 
> Add bindings for the VBATTB controller.
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> ---
> 
> Changes in v5:
> - used spaces in the diagram from the patch description
> - added "This is board specific" in the board description to emphasize
>   the usage of the assigned-clocks in the example
> - added default for quartz-load-femtofarads
> - collected tags

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


