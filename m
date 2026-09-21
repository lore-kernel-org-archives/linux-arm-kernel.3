Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CFBC982EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 20:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QEqRIUud4Bp4XkJfTYRmT98hk05FTIWNPmdqE/L9jW8=; b=yq9vsrprDnvd2X9ZFn4SGQpIXS
	epjtnEH2F4W6Lg9KuRONMwBOBz+8ZfdF2LBSVZBntLu0NPZywLLY67d5CVo+iF43CwMl08wF4/ggN
	6tS+7ZDwROR5IWPLLVPfDE3dqnrDzeJp0Qvs5+bX2YyvTWv1wBqoBgUacoHbwhwVdqDdHYpmpv7Td
	WAw+BxPpzC/gWizhh5pQm1yS8sxSJLCTpMMXctqHg2CKmXyKZsgpqlkxBupUViH4wUbxbr7QOtJ8v
	03X5CuHfkxJsY+jXBYZujjFG//XKEjUJ11qBoqlPBCZiAM+4RqpMnVjrPiK7EgsS081rjfWUi/JZS
	89783YRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kGR-00000003JLZ-0qtG;
	Mon, 21 Sep 2026 20:05:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8kGP-00000003JLC-3ukq
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 20:05:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QEqRIUud4Bp4XkJfTYRmT98hk05FTIWNPmdqE/L9jW8=; b=OfpmWDqV8ssMp5Fs3jP4muMebU
	kT+eUTd3bJplCb2Vdc57svGBvhoRmflWgz8QyFe48eAxBXMev1vMlaNjcScx3gC2NMusAh1ICoQtJ
	98eGZRc5bI5rfVEAsvv+YcuyzB4+z1K0twUDw0MZIgWtjqaPFNz2FMTJ6ekavZ/JaJ0QDZSH8Leq2
	XAkTaoLI9+nHKQAj/jGrx6i5bDBkDRLqsz3VS2hNmHUu30hd2kjd2vjDQYcGH+tcH7LVyyVmbYs6N
	Y+meIAzSPtyA5y4QuIM4/diXxaeQWQD191re3Z1F43ElU+t+iPbQ/krQW2YA37/e+rL7TXJAVEm4c
	KQU2gTzg==;
Received: from mail-oi2-x11.google.com ([2607:f8b0:4864:32::11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8kGM-0000000Clhs-45ga
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 20:05:20 +0000
Received: by mail-oi2-x11.google.com with SMTP id 5614622812f47-4c3b639adbcso2645542b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 13:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790021115; x=1790625915; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QEqRIUud4Bp4XkJfTYRmT98hk05FTIWNPmdqE/L9jW8=;
        b=VzmQQ859Q76xRK+I/GRSuIpyxmaPff5fixXEQKbk1TWjoOaZ1lQ1mN1MdVOHsPZhyJ
         HlMpDBRI0mSXef8zmnyfKTwUamzth0rI8hfO1BU+7OWKYLwTkhB7SNU72Fx30iwJmXpk
         nqkTzBP6S9yZkRgU74xRA1bzgY6RrdbA3ODMW32W7v5vHpcHU2721mPJ6mrPzAa9lRlG
         mKpViX+UUJ4bVmNl8kSFOfemx+m4nhZldVV70nSzs6VXt2ITFwOtMDgVjLlcgDUSDz7J
         +QGX0DnGMid7EWTgZlfJcgWZ6w1kZmqWZPudYCAZ8iPBTWVAjI7t9lMkXaRDKvIjvV2r
         F7zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790021115; x=1790625915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QEqRIUud4Bp4XkJfTYRmT98hk05FTIWNPmdqE/L9jW8=;
        b=jjrmMoMxOv0kxPoEGoxEHv9nBBwN46sqDMKo1Bzt+1pZjWk3Qgk6zuEvXirSStIHFW
         mJ+CerlJaPI7oM7p95Lq+ai0RSnKgY9tFKGljuOUGk0qPtcuoPItxztl80rxCksA2UAK
         06cqK7xCu6KZ4IzCT8NRuNQQ04h9TbAC10G5pCGVdEb9p/9i3cPs0roe4fCIeJH3m570
         WfZibJFUBCZ6CBsSoZbyX3ZOvAlECUjEymjJGdFJ3q4qe5aGIXlKD0bYzFDpj8MUpHZj
         n9raHvTK4LkuKKOINd7Mq0GgO7Irw0p62wwl7qeD8GTk3I2sxb7SLkX7NgBe5Y7qtYtn
         LSlg==
X-Forwarded-Encrypted: i=1; AKwUvBxvHLjECNCCKcwTwMWtfQVY4arFxCGlUWPKquMSaCb6OSGvYwZPBgxvU40aYyv5jvtHpiKFdVkRR1wzAXo3l5An@lists.infradead.org
X-Gm-Message-State: AFuF++kxjOavjD5Erj0Ii48vvf3dfUofksFWrFp5uISwgQY4VG1U+/+0
	pbFscRdyRyUM4zJqvArA1XdQjoAUgloUwRdVO0/4UzKgbcr6RYsWIX/K
X-Gm-Gg: AYBFou2PZ79/bUZFWe8/oq4xPxyRBIkJ3JDbk0BzrW5czFkHA0HSs8RjHf/QmSUf4WJ
	yJdm0MKfqL7DX9ug20kJPHQzQLrvrI9Pq9VTeXF6wPJCtaNSHs/i0XGcnnEsNunFI98pYmZsTBu
	C5T+E89ANSjRp9BEgOx5/+BWBesu3VDO8kD/wueAXOUsxCDt4YKuGMqGGnqtV8lmyLaKGyuUQY2
	YF9uQEVZnpGj0bw4XJ4uhJKRFYVBe1EGX4+FbI4iiBDTogpxpR94w5l2KizqZvw+TkOQloCXNJd
	DVWNXqpbYkX0KWwUwwhkHVQCzouZE8Trlin1o6hXmi0Rg0BMevb+Pri2g5TOBsh/NYC+/DT0QjZ
	00urS4mZ9OubMB43weDo8/UxGKcABSibpxzrm0svrZO1DpOqHec6QhmmKLfgcxM2zw8DibEjcvx
	1Jpb6WY/u2dCBwaTpCX7/S9SncFfJxiP1b5FaEtE332MaeHYi1eWWkY89VEzY3GFbpR+ZZfh69L
	1PTrvma3qb6W0UDq4XgCpP4VCWjA4uG7pBsXv+YWJp6gg==
X-Received: by 2002:a05:6808:c167:b0:4c5:90f1:b9cb with SMTP id 5614622812f47-4ccf74b09a0mr10949649b6e.16.1790021114836;
        Mon, 21 Sep 2026 13:05:14 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4d423604f7fsm1137266b6e.7.2026.09.21.13.05.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 13:05:14 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: junhui.liu@pigmoral.tech
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/8] clk: sunxi-ng: a733: Add bus clock gates
Date: Mon, 21 Sep 2026 16:05:12 -0400
Message-ID: <20260921200512.3179109-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921-a733-clk-v4-7-9c184ebe9ac1@pigmoral.tech>
References: <20260921-a733-clk-v4-0-9c184ebe9ac1@pigmoral.tech> <20260921-a733-clk-v4-7-9c184ebe9ac1@pigmoral.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_210519_243935_071ABB65 
X-CRM114-Status: GOOD (  14.70  )
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

Hi Junhui,

I tested the exact v4 series on a Radxa Cubie A7S. I used v7.3-rc1,
applied the four-patch A523 single-divider prerequisite, this eight-patch
series, and Andre's current seven-patch A733 pinctrl series. The test DT is
a minimal Cubie A7S harness with the main and R CCUs, RTC, pinctrl, UART0,
and MMC0. The Image, DTB, and initramfs were loaded into RAM from U-Boot.

The exact posted stack starts all eight CPUs, probes the RTC and the A733
pinctrl driver, and binds UART0. Serial output then stops immediately after
the 8250 driver replaces the boot console:

  sun60i-a733-pinctrl 2000000.pinctrl: initialized sunXi PIO driver
  printk: console [ttyS0] disabled
  2500000.serial: ttyS0 MMIO32:0x0000000002500000 ... is a 16550A
  printk: console [ttyS0] enabled
  printk: legacy bootconsole [uart8250] disabled

It never reaches the initramfs `/bin/sh` readiness line. There is no panic or
oops in the captured output.

As a private comparator, I changed only `ahb_cpus_clk` at 0x5c0 bit 28 to
`CLK_IS_CRITICAL`. That advances the same build to:

  clk: Disabling unused clocks

but serial output stops there and PID 1 is still not reached. I also added
private begin/done tracing around each individual enabled clock in
`clk_disable_unused_subtree()`. Neither trace marker appears, so the second
loss occurs before the first individual unused-clock disable is attempted.

Each run used the same RAM-only payload and was followed by an
identity-checked 120-second power recovery. The board returned to its exact
vendor kernel and eMMC root after all three runs.

So I cannot add a Tested-by for v4 as posted. The `ahb-cpus` gate appears to
be one issue, but marking it critical is not sufficient on this board. Could
you please check the CPUS/AHB dependency and the path entered immediately
after `clk: Disabling unused clocks`? I can retest a focused change or v5 on
the Cubie A7S.

Assisted-by: Codex:gpt-5
I reviewed this report and take responsibility for its contents.

Regards,
Enzo

