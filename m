Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39067E77180
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 09:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TeV09eK/blQRvaYPXFllLnVYDjrCfJ1DfVS6WkHoZc8=; b=rHEGSFadgGauX2a8L9Hwc3uC8D
	ncoSVzr50uJnr/xrZunO67o92yYwt85pdF430XMNhjV7/8WcUzKz2Z2P06nD0w0vSljXTqHaPsk8S
	GHeZ2+hkiX1YH9twkfMI24trs56j1vGactQL99G87DTXJepmR/w9GUKWgTUxM2Xw47bdlAtr4CnF6
	1iCAp0w3JJSuO4PWxfepIgtDNyARuwKEA4NlASaF0XJO3ASZtPUInrpUYLaWzStxHARS8BPdZyo71
	X9tXbDobY58vnbtCv+OANastITPfleIzaQEIv5yVHu8RvSC8TLEtbqb0Ez3exWovwbrydk+UK9Rfd
	MbTMO5Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1sq-00000003Esu-0Ndu;
	Fri, 13 Dec 2024 09:22:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1q7-00000003EAZ-31G8;
	Fri, 13 Dec 2024 09:20:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5A8865C68E5;
	Fri, 13 Dec 2024 09:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66B2CC4CED0;
	Fri, 13 Dec 2024 09:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734081602;
	bh=LZTssH/ZHKTvEutuJtTjkmecZUTVtynRxVs9i48YWr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vF+KM5OUjhNimxXTCodSJDmpIOrab7qO73ZSbulEhwBCbF8TMZrYRmOk6ulg3UuHK
	 luhGa9Er4B64KWPwj1HpaVm7nnx2vyJbQ/H1VZnS4g44lK9BOcgKTk0LK+ViAGUaDD
	 HDIPLfLWRHyMT1pIC78q2I2I2VJlTQJ5sn61oFK2pSOfpcmN2u/zV4Z2Le7rTb2C3P
	 2lMs6SI3ZcmZg6bjW298otZ/kzlh8PmgIPJv/wFrE9fc5zgSFwBUdXGwoWyLrqXhjk
	 7DAC5HWztrvL4udgF0nZpR1dJyLAboDD7K+zw0q2nj3KUmq5z1KbVDOKWL329g+GlC
	 it3rFPbfTRQ6Q==
Date: Fri, 13 Dec 2024 10:19:59 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Eric Anholt <eric@anholt.net>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
	Doug Berger <opendmb@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Thomas Gleixner <tglx@linutronix.de>, 
	Stefan Wahren <wahrenst@gmx.net>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 3/7] dt-bindings: gpio: brcmstb: permit
 gpio-line-names property
Message-ID: <atzraxqm7z7trpagw2kj4xraghb323zry5cztwadqsowfafkmm@gejykzp4hjoo>
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
 <20241212-dt-bcm2712-fixes-v3-3-44a7f3390331@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241212-dt-bcm2712-fixes-v3-3-44a7f3390331@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_012003_808285_99C1821E 
X-CRM114-Status: GOOD (  11.26  )
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

On Thu, Dec 12, 2024 at 06:36:30PM +0000, Dave Stevenson wrote:
> gpio-line-names is a generic property that can be supported by any
> GPIO controller, so permit it through the binding.
> 
> It is permitted to have a variable number of GPIOs per node based
> on brcm,gpio-bank-widths, so define an arbitrary maximum number of
> items based on current users.
> 
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  Documentation/devicetree/bindings/gpio/brcm,brcmstb-gpio.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


