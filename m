Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E26CE7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 09:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JwtUsynowUEKWe6t/qL2B1q4adNzZ1IR4NPP5PbdL8E=; b=KgBx1bo7pHVfOG+o9LwA+8hgCc
	/1YJgacPH8J5NJ6HddOvJpys8POdy/4L665Kug3PcXodID878BktuxL5HEY5icq+v9rG/EzI1r/bw
	cAwNHoUmiYVFUv0dIJXgBDwIMeccXXsaVfvMLLkgaEXjEaGzBDC+AYL3EUOeFxrQ+jjHnxYl5AIyI
	Y19NNJ2Ei4a4F6YafXCfOwsIgNKa8YP5Y5r9VaVX2Q+Ypqh+OyGP0bXzsyow5Hvde9WzetIzJ1VFP
	fgd+UoboAAkiwe0dmzkFeCSeoJQY9O9uoesTZ0P6VZYnF69AUij/GjPuQoUKVZFYto8FsNzwndrvE
	mUMZOMgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1pV-00000003Dyx-479F;
	Fri, 13 Dec 2024 09:19:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM1oQ-00000003Di6-1Va6;
	Fri, 13 Dec 2024 09:18:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6192B5C6B43;
	Fri, 13 Dec 2024 09:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 593E3C4CED1;
	Fri, 13 Dec 2024 09:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734081497;
	bh=50F8lzvkwofE8E594WChlhW/wIJ0vV/r+Oafv5taTGg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QpgPUgesM7i0LrrUQpMsCjr/1XK14ByrihO4BH0gOP/7vCC4Y25Ny+iMjKCzj6Bdx
	 AlU3JwBmCuXEiGMP2iL4TypqHTZYpVQYG+ND22uRoP4tdpnHk0Z+qj9TKn23Z2kA9G
	 RnoAV1OVu64R7XB5+BN9EiakahM2nZ4APApFStkV7wcEcJIC5a/UQyqGO/JTbZnZp0
	 4ycDvoSjfPEFS0ylU1LsxZx/gM4sDLIk/Nc7nNn9O8Vg6KrM4DAk1heHV94112Jkhf
	 UHeNUUZj7gtb6D44PRpQ2wpZPiG46Ku2fTwPfjfVxwFDh+BowJ6QqY+NiNNGVD5e1Z
	 Q5Tst+dLrlORQ==
Date: Fri, 13 Dec 2024 10:18:12 +0100
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
Subject: Re: [PATCH v3 1/7] dt-bindings: display: bcm2711-hdmi: Add interrupt
 details for BCM2712
Message-ID: <cjf4n2tg5qcqpik3j6ufesl4lf2fftyccrqmurb2xvib6iyt2d@fbhkwoiwfjuy>
References: <20241212-dt-bcm2712-fixes-v3-0-44a7f3390331@raspberrypi.com>
 <20241212-dt-bcm2712-fixes-v3-1-44a7f3390331@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241212-dt-bcm2712-fixes-v3-1-44a7f3390331@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_011818_484109_834E1A52 
X-CRM114-Status: GOOD (  16.90  )
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

On Thu, Dec 12, 2024 at 06:36:28PM +0000, Dave Stevenson wrote:
> Commit 62948c62abca ("dt-bindings: display: Add BCM2712 HDMI bindings")
> added the compatible strings for BCM2712, but missed out that the
> number of interrupts changed.
> 
> Update the schema to include the interrupt requirements.
> 
> Fixes: 62948c62abca ("dt-bindings: display: Add BCM2712 HDMI bindings")
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  .../bindings/display/brcm,bcm2711-hdmi.yaml        | 107 ++++++++++++++++++---
>  1 file changed, 93 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> index 6d11f5955b51..dd7dea60183b 100644
> --- a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> @@ -56,22 +56,38 @@ properties:
>        - const: cec
>  
>    interrupts:

> -    items:
> -      - description: CEC TX interrupt
> -      - description: CEC RX interrupt
> -      - description: CEC stuck at low interrupt
> -      - description: Wake-up interrupt
> -      - description: Hotplug connected interrupt
> -      - description: Hotplug removed interrupt
> +    oneOf:
> +      - items:
> +          - description: CEC TX interrupt
> +          - description: CEC RX interrupt
> +          - description: CEC stuck at low interrupt
> +          - description: Wake-up interrupt
> +          - description: Hotplug connected interrupt
> +          - description: Hotplug removed interrupt
> +
> +      - items:
> +          - description: CEC TX interrupt
> +          - description: CEC RX interrupt
> +          - description: CEC stuck at low interrupt
> +          - description: Hotplug connected interrupt
> +          - description: Hotplug removed interrupt

You have chosen unusual syntax. There are no bindings doing this way, so
I really do not get which file you used as template.

Expected here are minItems and maxItems. These are the widest
constraints. Otherwise you are repeating the same in allOf:if:then. And
then the allOf:if:then: defines the items.

You can do the opposite - define the items here then just choose
constraints in if:then:. Less popular if you have list without common
part (so no minItems here), but sure, if you insist... yet you chosen
some third way of duplicating it in both places.

Look:
https://elixir.bootlin.com/linux/v6.11-rc6/source/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml#L127
https://elixir.bootlin.com/linux/v6.11-rc6/source/Documentation/devicetree/bindings/ufs/samsung,exynos-ufs.yaml#L39
https://elixir.bootlin.com/linux/v5.19/source/Documentation/devicetree/bindings/example-schema.yaml#L91

There is nowhere syntax like here, with duplicating everything twice.

BTW, drop the full stop from your subjects in some other patches.
Subject never ends with full stop.


Best regards,
Krzysztof


