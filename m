Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0514D12D59
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Nov 2024 22:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tWhowCiinxkZBttCctlBPj85PTRboz8ciP7T5QcNJGg=; b=mGg551dxTgZDyseqOzr6CFJsWg
	aIe3srZ8kC8g2sDyCbvvD9anE6WYPv/BwlrBMwcMp3VdMgvNZM+d0aAO7RLHpLNhQv4erfcfQVhpY
	6B06RRi+y/Nyazbn/XY1n4vmc9cI9T1bbPeorknu2dt5ZkWsadDjv1YtiKhStrAyeQ9fMmOTWmBjY
	fj/GsnEUV56CmqtFvEvZqtJ1WsxXpq8OJ1uw8M950CcsPBG7ehjwqBQm7kSwM08fC236ijvRfO3hL
	yS2rbfP3Idccc1gbvslWl75W7G98uGKRyqaFfaby53X9f/DMgZrxqvsZuA0latYSoIKuEmaCgI/4M
	28HY/WvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAG4P-0000000FgvV-3dKF;
	Sun, 10 Nov 2024 22:06:09 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAG1m-0000000FgXs-2yJD
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 Nov 2024 22:03:28 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9A4CD1BF203;
	Sun, 10 Nov 2024 22:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731276202;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tWhowCiinxkZBttCctlBPj85PTRboz8ciP7T5QcNJGg=;
	b=Rns4DMup/Zg21qWpZWnrWdvk/k/iS1yuTfyx8O6WuFMftNitR70TSv0nRHj6tNs1fFFWhC
	/sGF/1oGoxN3wpuaLDfgF09JP2jVeGZdEsNzQe3rzGi1EMtUFKLfEHNRWhPREMmRLhllnB
	d/dZEML6MBGCgf5AIL6xnW6vsMuKZ98vunLD/YqDn2Xlve649nLQckxAR1TblmaC4ELHf9
	/d518Q8nYmR26zqqe+PGcjD0u75eiQl88Wve8BytkaQqEbtDUx4VwFqiHsYNjZTJegizlo
	LnyPdwLYtEhbgLSRNwiYqHu4x1tbc/0hx0l9KunlyhNHr5JwtfCCR4rdAlw/AA==
Date: Sun, 10 Nov 2024 23:03:20 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	magnus.damm@gmail.com, p.zabel@pengutronix.de,
	Claudiu <claudiu.beznea@tuxon.dev>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: Re: (subset) [PATCH v6 4/9] rtc: renesas-rtca3: Fix compilation
 error on RISC-V
Message-ID: <173127618341.3020900.11768591767157204558.b4-ty@bootlin.com>
References: <20241101095720.2247815-1-claudiu.beznea.uj@bp.renesas.com>
 <20241101095720.2247815-5-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241101095720.2247815-5-claudiu.beznea.uj@bp.renesas.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_140326_940902_C038515A 
X-CRM114-Status: UNSURE (   7.66  )
X-CRM114-Notice: Please train this message.
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

On Fri, 01 Nov 2024 11:57:15 +0200, Claudiu wrote:
> Fix the following compilation errors when building the RTCA3 for RISCV:
> 
> ../drivers/rtc/rtc-renesas-rtca3.c:270:23: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>   270 |         tm->tm_sec = bcd2bin(FIELD_GET(RTCA3_RSECCNT_SEC, sec));
>       |                              ^
> ../drivers/rtc/rtc-renesas-rtca3.c:369:23: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>   369 |         tm->tm_sec = bcd2bin(FIELD_GET(RTCA3_RSECAR_SEC, sec));
>       |                              ^
> ../drivers/rtc/rtc-renesas-rtca3.c:476:11: error: call to undeclared function 'FIELD_GET'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>   476 |         cycles = FIELD_GET(RTCA3_RADJ_ADJ, radj);
>       |                  ^
> ../drivers/rtc/rtc-renesas-rtca3.c:523:9: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>   523 |         radj = FIELD_PREP(RTCA3_RADJ_ADJ, abs(cycles));
>       |                ^
> ../drivers/rtc/rtc-renesas-rtca3.c:658:8: error: call to undeclared function 'FIELD_PREP'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
>   658 |         val = FIELD_PREP(RTCA3_RCR1_PES, RTCA3_RCR1_PES_1_64_SEC);
>       |               ^
> 
> [...]

Applied, thanks!

[4/9] rtc: renesas-rtca3: Fix compilation error on RISC-V
      https://git.kernel.org/abelloni/c/8f315a5c7376

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

