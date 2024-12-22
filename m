Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B723BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Dec 2024 08:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4KsutAYQoGxcBjg96b9PzdyECOm4X+pRU+TfDvaqhhE=; b=zOkFza82wKuuoTCvm0FDgu0NR8
	w2/T8YqrBy7hTgHP+90Jx4mTBDRqavqXzjKVfJsSOUtTL1SLHs0kNfCjFJfe9bdyFlcVZ/762FFQN
	DgkxYrl64JinSQsvKjuFl+iIQW8IbIvfyjmVrzbo2hKcXlPIQRrx4stn2ZxL0WOU8IHFQgqZde5jc
	jNCShUkj9JBSTImNZ1+kWPLDEg2Rgy78S7MFRa2R0eZml/cVZLvWQCC+2RjXimPu+XCEh4Cb4fhi5
	seRS1SrpAHPwxe7FpoVcO3MrNgsoZDyunhS6Gx5dVpxHoV2waz4gDxg4kFu1CxyqGs5dbM3wl4Ghu
	SQ42fc2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPHQj-000000081Yq-2IUV;
	Sun, 22 Dec 2024 08:35:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPHPY-000000081SZ-3kiD;
	Sun, 22 Dec 2024 08:34:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3F214A40568;
	Sun, 22 Dec 2024 08:32:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFE59C4CECD;
	Sun, 22 Dec 2024 08:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734856442;
	bh=yDbyvGBdhFbBbtYL7NrJkhEr0MAnlnSnZYd3unoDI28=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M7rl/SuXPGhlaYVxYM+DrLi8GTmYNY3vwGUg+9HhvSx9IM0OeHyxZsGtHTyCQDg1+
	 tuP0TfHKSs36Blj+KVVhGrRkMXosOhVS4THMA/9gwh2pWI7rv1oQKbQpWYjybyyE2T
	 dfCREPG4BscrsRk55zDGHn4AvOFMdIzE+W6Q8aCKwlm8EyIWFo2yE63g01xyc1Hbbg
	 lkaOJSLAFLksulbrhlZgprKvrCvcXi6zEZpFjczSrkmNBZ7jrX+mfULRSDHkaUZsfG
	 oTftkjd6nNbCt2ghgVP7OOrAiVkGFHQFm1KcqJxea+KsuwUFVTE1Ii9UQ/1QkD0h2I
	 B01KqEA/BAJtw==
Date: Sun, 22 Dec 2024 09:33:59 +0100
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
Subject: Re: [PATCH v5 1/3] dt-bindings: display: bcm2711-hdmi: Add interrupt
 details for BCM2712
Message-ID: <mnvl24bydpajn7dyumq7cqt6dl6iyrzk6e7rksojt3ig2f7qbc@uytpnoa4t76o>
References: <20241220-dt-bcm2712-fixes-v5-0-cbbf13d2e97a@raspberrypi.com>
 <20241220-dt-bcm2712-fixes-v5-1-cbbf13d2e97a@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241220-dt-bcm2712-fixes-v5-1-cbbf13d2e97a@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_003405_008283_C44F51FB 
X-CRM114-Status: GOOD (  13.79  )
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

On Fri, Dec 20, 2024 at 06:11:11PM +0000, Dave Stevenson wrote:
> Commit 62948c62abca ("dt-bindings: display: Add BCM2712 HDMI bindings")
> added the compatible strings for BCM2712, but missed out that the
> number of interrupts changed, and for BCM2712 the driver changes[1]
> required that the interrupts are named.

I dopn't get what "interrupts are named" means here and I kept asking
about it, so the explanation is supposed to be in commit msg. Do you
mean that driver requires it? If so, then "the driver requires
interrupt-names since commit foo ("bar")" (and use Linux commit style of
referencing commits).


>  
> Update the schema to correct the interrupt requirements for BCM2712.
> (Requirements for BCM2711 should be unchanged).
> 
> [1] Commit 0b1dbe82e051 ("drm/vc4: hdmi: Add support for BCM2712 HDMI
> controllers")

I cannot find in this commit requirement of interrupt names. There is no
call to anything requiring names. Maybe I miss some context, like other
function introduced that? Can you point me to specific line of that
patch?

Because if you refer to external_irq_controller than I fail to see how
2711 works without the names.

Best regards,
Krzysztof


