Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DFD4D2CE17
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Dec 2025 04:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mz8gl+LQ+pQXR9Vk/AIbLOn/Re0FlMVXlpYXdJtawpw=; b=EbVjd0leiyUSsFWfhhi/TzA2a6
	bZbVMMcgYhVXYMNzcz+HvVyUvj6Ulk9BQe3noYmBLNvmt6mcllkx8kSxTXjPrsud8tp8AaJc+iXYk
	xgVG1kj0CvHKvTB2mKia7io76sBMjmRnnC49he7EtMExpmdlZXF/38pWZEtQN0BElKvkoOBRMN6fq
	KRodFpRCEgQi8Q/xGXug7O+ZoGGLU7g79nYLCh1mh9b2fyEa22dnWYPhJ+O8KUHXg2I9SAoAeQcwA
	m4H+w9T+w25KPXDgCbVgykw9JZ0HW8gZrp61ijJynHGctzWmd53XKzkPLtUMBvDuW/2ziTstQjM0N
	ATaOm9kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vS6o6-0000000BTM2-1hft;
	Sun, 07 Dec 2025 04:55:38 +0000
Received: from mailtransmit04.runbox.com ([2a0c:5a00:149::25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vS6o2-0000000BTL6-3lt4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 07 Dec 2025 04:55:36 +0000
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <daniel@gibson.sh>)
	id 1vS6nt-009NAJ-8R; Sun, 07 Dec 2025 05:55:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gibson.sh;
	 s=selector2; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=Mz8gl+LQ+pQXR9Vk/AIbLOn/Re0FlMVXlpYXdJtawpw=; b=SJYEXw6RUAfGmey+ZE0ON69ptG
	ApnwIKXCuuRKS5epUGcCa3lJ8QodjtAQqioS7UiZaBOgf6yeb2env2p8Q/ckG5aT2gRQfMGAJ4Iru
	0Ym7i9aP5iywvQblFr3kSZp0MT0w88J9RuLRP1Ode0LTR7ynbPT55gaKgpI4f1ixNkKuQ7n3tOQeS
	F8sCAJYRQL74hkt36DuINcIp7+ynG023ctqdbDEqC7oBQePeoWWD+oO6TZyEIU1fZY2DDKixHuRBW
	Ujqa4OTIQvzSUJlGWix5YSVxxWKEF24sMXWlonq7hMIFWqPWKIUOIp+vea5fgff4Yft5Ehwc6N2jH
	/EjrXyYw==;
Received: from [10.9.9.72] (helo=submission01.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <daniel@gibson.sh>)
	id 1vS6nr-0003yn-Id; Sun, 07 Dec 2025 05:55:23 +0100
Received: by submission01.runbox with esmtpsa  [Authenticated ID (1104311)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vS6nk-006ssX-8F; Sun, 07 Dec 2025 05:55:16 +0100
Message-ID: <bd0a00e3-9b8c-43e8-8772-e67b91f4c71e@gibson.sh>
Date: Sun, 7 Dec 2025 05:55:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/12] gpio: it87: use new line value setter callbacks
To: Bartosz Golaszewski <brgl@bgdev.pl>,
 Linus Walleij <linus.walleij@linaro.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Lixu Zhang <lixu.zhang@intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, Yinbo Zhu <zhuyinbo@loongson.cn>
Cc: linux-gpio@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250423-gpiochip-set-rv-gpio-part2-v1-0-b22245cde81a@linaro.org>
 <20250423-gpiochip-set-rv-gpio-part2-v1-5-b22245cde81a@linaro.org>
Content-Language: de-DE, en-US
From: Daniel Gibson <daniel@gibson.sh>
In-Reply-To: <20250423-gpiochip-set-rv-gpio-part2-v1-5-b22245cde81a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251206_205535_264261_4D0B1420 
X-CRM114-Status: UNSURE (   8.87  )
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

Hi,
I got one nitpick/question about this, see below

On 4/23/25 09:15, Bartosz Golaszewski wrote:
> @@ -249,7 +250,9 @@ static int it87_gpio_direction_out(struct gpio_chip *chip,
>  	/* set the output enable bit */
>  	superio_set_mask(mask, group + it87_gpio->output_base);
>  
> -	it87_gpio_set(chip, gpio_num, val);
> +	rc = it87_gpio_set(chip, gpio_num, val);
> +	if (rc)
> +		goto exit;
>  >  	superio_exit();

Are you sure that superio_exit() should be skipped (with goto exit) in
case it87_gpio_set() fails?
After all, superio_enter() above (not visible here) succeeded,
only the it87_gpio_set() call failed.

Of course this is kinda academic because currently it87_gpio_set()
always returns 0, but if it ever doesn't, this might become a bug?

Cheers,
Daniel

