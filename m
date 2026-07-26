Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E204C531CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 26 Jul 2026 11:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GUYubJZOlyk7ZUcTegsKcSoPhTLrbF/NRujnb44b+Dg=; b=uTd2sBmziG5qwWDmFqDkZ/sRp3
	dpQd07ZRiF6ye40xmVwJ5Da2Aj9v+eiJHPGLrAVFxCQxGSygclhuvAoyj6eyP66/j3YHA3EY2R93z
	/aysm9tayRvBWkoX+5IaWdiL3imLdDLDIztbwIk36Yxo3cfjaKEh2an7OrUH5Y/4tBh3kJx20xMWF
	hCxBeGoZjozTU8DlN7H7qVyBAQpxXhKG7PpxIq9hWoKAY9iejXxLidFWGPT7ftdd7gk/AennTSxMT
	aIP6zepy8a0RtXg6SnhuE/JsRjqjufQUqADiGt+LWOMY/LT4K9GrUc0y+8etgumVQtpEfMUh65Dww
	US7hwM6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnwah-000000015S9-1nZW;
	Sun, 26 Jul 2026 11:00:19 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnwae-000000015Rl-3FOw
	for linux-arm-kernel@lists.infradead.org;
	Sun, 26 Jul 2026 11:00:18 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4955158f26aso11721675e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 26 Jul 2026 04:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785063614; x=1785668414; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GUYubJZOlyk7ZUcTegsKcSoPhTLrbF/NRujnb44b+Dg=;
        b=bmiY6sQZg5UpQxTw9V6VkL0ViCoDcS9kMGdkCiJX1AUKg7h7rbBn4Zq1Qqib95jLC4
         ja5YSdHJksG83KSX4BOScJomuCVYtE1Q347Kt1c66n4LL2rLkHloZE1bjY/13tMybTkf
         L2fsn4fsGgP1/LKvsKEG0XmW4BN4Wllo6T5qyGtKXfIbsDvmOM4N9ZRsaHRC2Qj4hy5C
         hqYublXWZtMj66s/yGeYbMEYYhOD6omM6VLB4MpHFnElGVCoww2EM3vDrkm5o/59+e4F
         tcBS9DpA8kwcUiqCbwbP8V1byGENMtQtcgbBYG0YzgU8cUQBZoXiR0yIe5jK5J2eD9GS
         nIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785063614; x=1785668414;
        h=content-transfer-encoding:content-type:in-reply-to:from:references
         :cc:to:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GUYubJZOlyk7ZUcTegsKcSoPhTLrbF/NRujnb44b+Dg=;
        b=EctVrkVueKD7aspK9PNZ2/68lJLfZJ4QkK/8EEiC1E63gruU7cMpiDlFd/uNVDMntQ
         n5e6b40EgHkS0rzXr2ZLg83dX045b0qrUTD8QJMdt878E+R0EeGzg+XX5yLAKGC+SVs3
         k+MItMCo8ecRMlf8+w+dtyr77sen9sr1nBiNk4eyTi3zQqKhkq81dvOC99ugupTU0ZO9
         XNpMkA1cJsnQ6tGn/OsAYZ3HVh4hgH1+kQrMV2AUTrd1GRoqhMp8Old6QCBVBLmRs0gJ
         8Bu5TRB3FSP10XDLAtrcml2YATf5Cj47vkERSvgybE+n6wHumhkdJpMJXXvcLAKh8Zxs
         LLVA==
X-Forwarded-Encrypted: i=1; AHgh+RrEXjkbzW1vIitZaBg1FGn/4/RNi6A1qZh6minONJw+Qlcnm1skW5+rYaIgBZ5CrAtcJr5SAmwwD1FVGgZPFm4s@lists.infradead.org
X-Gm-Message-State: AOJu0YzNe/hgfsFJpnBYAoEYJDv/gjhU+JOYivbS2jJz+UTyYO3rBEFk
	IwHAgSJKGgXz/3D0ezYTPx9eu4mhrGDCKztgyonmJVGaicoO7AwzOAGH
X-Gm-Gg: AR+sD11ZEF6c6mf7SPDocCGOx3mTilV51g+NyqhZ9+BQo2OVKFBKlNkU/VbLAHhdi3X
	/XCbWqtbjwQEkrSOVjHP81o0eWmS9utXlR0g+hsUSnBeuIwhz3aiLcAJtViapygO1LMRRf/fYsJ
	8pHTNQfd7yPd56MzyTZj7dMxDsUdVTlcBN7uj8LGR8YD/cjonxoQ+uc6UiX8XJd/Ga7/TW8UxJl
	3ydncbb5+h0ajvbyNjQRaK38CI+z61+TM/DNFSmEw6guIEKh+kkmXwv6PZyRkGwa5QXp/6ousfu
	q0C+RetCwaFodIPNy1mK0UVnrjEe5ATcEphGNa9Zzqu0mgCgagBcNQjXlxk65+It/cQcPaHQC5N
	DMD52JwPyHWAEW4T6LrXKPKzTTcwGRuKmhQ6IouhaDAHS07t52Wq6sErD3gHkQxoMnuHHtxnTRW
	GqgZyYZoR/USktLCln4iPM
X-Received: by 2002:a05:600c:350c:b0:493:f639:9b2f with SMTP id 5b1f17b1804b1-496b5ddd7dfmr62118035e9.39.1785063613640;
        Sun, 26 Jul 2026 04:00:13 -0700 (PDT)
Received: from [192.168.1.110] ([223.122.38.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496b4ee0e91sm132606545e9.4.2026.07.26.04.00.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jul 2026 04:00:13 -0700 (PDT)
Message-ID: <2b553c1a-a2d3-44d8-8e98-976835e3d436@gmail.com>
Date: Sun, 26 Jul 2026 19:00:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] spmi: apple: use IRQ for RX FIFO if possible
Content-Language: en-MW
To: Sasha Finkelstein <k@chaosmail.tech>, Sven Peter <sven@kernel.org>,
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Alba Mendez <me@alba.sh>
References: <20260725-t603x-spmi-v1-0-e1a29fcd2d38@chaosmail.tech>
 <20260725-t603x-spmi-v1-6-e1a29fcd2d38@chaosmail.tech>
From: Nick Chan <towinchenmi@gmail.com>
In-Reply-To: <20260725-t603x-spmi-v1-6-e1a29fcd2d38@chaosmail.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260726_040016_833621_37F4C976 
X-CRM114-Status: GOOD (  17.61  )
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



Sasha Finkelstein 於 2026/7/25 晚上9:48 寫道:
> From: Alba Mendez <me@alba.sh>
> 
> The IRQ fires as soon as the reply is available, which is usually takes
> a few us instead of the 10ms sleep interval for polling
> 
> Signed-off-by: Alba Mendez <me@alba.sh>
> Signed-off-by: Sasha Finkelstein <k@chaosmail.tech>
> ---
>  drivers/spmi/spmi-apple-controller.c | 97 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 96 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/spmi/spmi-apple-controller.c b/drivers/spmi/spmi-apple-controller.c
> index d8509f027df6..d627187b3ac0 100644
> --- a/drivers/spmi/spmi-apple-controller.c
> +++ b/drivers/spmi/spmi-apple-controller.c

[...]

> @@ -195,6 +277,7 @@ static int apple_spmi_probe(struct platform_device *pdev)
>  
>  	spmi = spmi_controller_get_drvdata(ctrl);
>  	mutex_init(&spmi->fifo_lock);
> +	init_completion(&spmi->fifo_rx);
>  
>  	spmi->regs = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(spmi->regs))
> @@ -206,11 +289,23 @@ static int apple_spmi_probe(struct platform_device *pdev)
>  	ctrl->write_cmd = spmi_write_cmd;
>  	ctrl->cmd = spmi_cmd;
>  
> +	irq = platform_get_irq_optional(pdev, 0);
> +	if (irq < 0 && irq != -ENXIO)
> +		return irq;
> +	if (irq >= 0) {
> +		ret = apple_spmi_init_irq(pdev, spmi, irq);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	ret = devm_spmi_controller_add(&pdev->dev, ctrl);
>  	if (ret)
>  		return dev_err_probe(&pdev->dev, ret,
>  				     "spmi_controller_add failed\n");
>  
> +	dev_dbg(&pdev->dev, irq >= 0 ? "Initialized with IRQ" :
> +			"Initialized without IRQ, falling back to polling");
> +
This does not compile with clang:

drivers/spmi/spmi-apple-controller.c:453:22: error: initializer element is not a compile-time constant
  453 |         dev_dbg(&pdev->dev, irq >= 0 ? "Initialized with IRQ" :
      |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
  454 |                         "Initialized without IRQ, falling back to polling");
      |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


>  	return 0;
>  }
>  
> 

Best Regards,
Nick Chan


