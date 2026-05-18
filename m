Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9FDECD4F48
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 08:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:References:MIME-Version:In-Reply-To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RYGQmbDGLNkZG+Jhza855l6mvvJwkdiEVhrgBGIANlY=; b=T+WcjHqGfeYH8t3GLXVdTE7jPe
	J4UnAAVhTgBOkCZIkyhPXYz5Su/oz3lJIya3sYP4jEdpNEUVjAjEsmp/BiRPiPQNJcJuPHCj1XcMM
	SvPUkkBUkNpI0DtF8EXeTWpI5XqiTISQZk61yP8vvnC0liadQ55GzVlgxQ/TJ3CC2WfPSbPGxokxN
	zl65xAev+U5uF0c8nGGdpiO4HIs+XTMp8JNKqkICnx9ehklFVInLTZj8wqAYMv7V5tf+lrqxdyUpq
	tdvQFdi/DFDhtjCRcXTS5tpX7MxPtOn/ECn9WdtmEdoC2rZTATPPe+4GxFDdpV2ClyIVUC1X1fh7S
	Ee08U/3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsvM-0000000EhN1-3HtY;
	Mon, 18 May 2026 08:02:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOsvK-0000000EhMG-0EVh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 08:02:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE401443B0
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 08:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1247C2BCC9
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 08:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779091320;
	bh=Szxe4uR+z2SalkTXFaMC0PsQG6FLID/9Q/TTJ8kZxXY=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=Sag4IRhnfU/eMwaPn8uattkG6U2DS6Tgzm4hVf7ERx1nwlXr3Us4zxHsC4e/sKldR
	 Rl7hQeymd+MxRhLe2qH50E5gEC8cSC9cGiVXbcpofm0I4h/XSRJtSrg5d//ozpsgkF
	 s/VkyAWMFXR9Y5n38AkK2RqGI1pG3UsG7EMJ5EI3Gt6hwUABV7cFN+Hu99lLOr19iW
	 noi1sQVcJ0m1PAgnFU2On082PhLCGpfNZ5my9xbkYNJhLFgiClqIKoTIYKveCmIEi4
	 omcl95CpOcaEM/k8H7CnFg9UN7iMiymsPZ7HOWa8x4Sq3T4DXxzUH9Q7vYS5hMakZY
	 Nn7TXInqQmEAw==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38be5e86918so27386151fa.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 01:02:00 -0700 (PDT)
X-Gm-Message-State: AOJu0YwRf5CB4VwMIpTFAhnYcB/OPMPMPD8poaY8nWOursBYic39mIam
	V93hVru6nTkxSLOhAMowM24C0o5fGwuXD7okodUjbRGgwEfaZGFmRFo5Zq4dgjwHtWonBIVwXa3
	VOg5BVzrYwiMrj7R6gTG6YzceCvT1gsewBmi1UDuJgg==
X-Received: by 2002:a05:651c:41d5:b0:38f:e2ad:e975 with SMTP id
 38308e7fff4ca-39561c0d38amr41642981fa.14.1779091319243; Mon, 18 May 2026
 01:01:59 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 May 2026 01:01:56 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 May 2026 01:01:56 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260515092520.9006-1-chaitanya.msabnis@gmail.com>
MIME-Version: 1.0
References: <20260515092520.9006-1-chaitanya.msabnis@gmail.com>
Date: Mon, 18 May 2026 01:01:56 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfLi2Ny-U5U3z-RMk5pVq-Vbe4A8THNyHv=NEMmnL4Vpg@mail.gmail.com>
X-Gm-Features: AVHnY4IaNhVu5lcH7cgyEg9L3kHOwb1wCT_RRLI-YStqpM1fc4cfeVrcxNXrqg4
Message-ID: <CAMRc=MfLi2Ny-U5U3z-RMk5pVq-Vbe4A8THNyHv=NEMmnL4Vpg@mail.gmail.com>
Subject: Re: [PATCH v3] i2c: davinci: fix division by zero on missing clock-frequency
To: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Sashiko <sashiko-bot@kernel.org>, brgl@kernel.org, 
	andi.shyti@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_010202_153855_C85C1B7B 
X-CRM114-Status: GOOD (  20.94  )
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

On Fri, 15 May 2026 11:25:20 +0200, Chaitanya Sabnis
<chaitanya.msabnis@gmail.com> said:
> When the 'clock-frequency' property is missing from the device tree,
> the driver falls back to DAVINCI_I2C_DEFAULT_BUS_FREQ. However, this
> macro was defined in kHz (100), whereas the device tree property is
> expected in Hz.
>
> The probe function divided the fallback value by 1000, causing
> integer truncation that resulted in dev->bus_freq = 0. This triggered
> a deterministic division-by-zero kernel panic when calculating clock
> dividers later in the probe sequence.
>
> Fix this by redefining DAVINCI_I2C_DEFAULT_BUS_FREQ in Hz (100000)
> to match the expected device tree property unit, allowing the existing
> division logic to work correctly for both cases.
>
> Fixes: b04ce6385979 ("i2c: davinci: kill platform data")
> Reported-by: Sashiko <sashiko-bot@kernel.org>
> Closes: https://lore.kernel.org/all/20260514044726.57297C2BCB7@smtp.kernel.org/
> Signed-off-by: Chaitanya Sabnis <chaitanya.msabnis@gmail.com>
> ---

Missing changelog.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

>  drivers/i2c/busses/i2c-davinci.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-davinci.c b/drivers/i2c/busses/i2c-davinci.c
> index a773ba082321..a264a480dc3c 100644
> --- a/drivers/i2c/busses/i2c-davinci.c
> +++ b/drivers/i2c/busses/i2c-davinci.c
> @@ -117,7 +117,7 @@
>  /* timeout for pm runtime autosuspend */
>  #define DAVINCI_I2C_PM_TIMEOUT	1000	/* ms */
>
> -#define DAVINCI_I2C_DEFAULT_BUS_FREQ	100
> +#define DAVINCI_I2C_DEFAULT_BUS_FREQ	100000
>
>  struct davinci_i2c_dev {
>  	struct device           *dev;
> @@ -761,9 +761,7 @@ static int davinci_i2c_probe(struct platform_device *pdev)
>  	r = device_property_read_u32(&pdev->dev, "clock-frequency", &prop);
>  	if (r)
>  		prop = DAVINCI_I2C_DEFAULT_BUS_FREQ;
> -
>  	dev->bus_freq = prop / 1000;
> -

These a ninja changes, at least mention them in the commit message.

Bart

>  	dev->has_pfunc = device_property_present(&pdev->dev, "ti,has-pfunc");
>
>  	dev->clk = devm_clk_get(&pdev->dev, NULL);
> --
> 2.43.0
>
>

