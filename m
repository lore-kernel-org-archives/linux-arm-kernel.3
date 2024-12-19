Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831E0E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 08:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=smZDhXrwM8jUW6fsQoy4i7hqWnSv9FJHXQKZ1vbJOY0=; b=JLqSxTFGQV3s5r634geKIE/ZxZ
	qEnHX5ekYEytkqD/FguTgxCvjl6lWMDzmP2mnknNC1eQVpH+ldYin6LnJI1PBIwqr9iAcJYHsFuRt
	CogyeEnyZ8qPZ2KNi1tKZ4rZUqPjxd5A20cbAO5dyBHCSVOo6UHVouU5k5Inyk967aqgMXC6dkR8X
	uPB1Vdg6f3DHDDfoOx2r4yeThcvOLkBQeqiEa3j8uccbgzwvyHTMIwfojL/tAlQ1fzjCetobFlHBa
	1MSin7tresVl3tUhnhiENayeQrhC615CiK3MJArBWnks6NvqPnMT/TGXBir0t5ItwRa65fkRClH5U
	56SJP/Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOC4a-00000001IpB-0134;
	Thu, 19 Dec 2024 08:39:56 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOC3T-00000001IaV-1lE7;
	Thu, 19 Dec 2024 08:38:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DBABAA41F59;
	Thu, 19 Dec 2024 08:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AA01C4CECE;
	Thu, 19 Dec 2024 08:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734597526;
	bh=z973hMVDazsCaCVq8CENGRtlOUvc9ByRfPeM4Ms7dU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PFfIWyK61aTMR54PQitKrC2N0LdJnnRc9g/5O97Q2QYgZuPDulZXoqcwcO0IlnNLh
	 TYDzDy2UD3Y68bObfHSnA3lC9/76U8eKKTgALWeU/Kbws9yxPKEy69eRz+JTbGclw+
	 FbTY+dDeSyqllmVgCWuS+GD/U/8j37bRPvROwG4ay/3R2uDoRpb2n+d5BAEpuP/TJj
	 Ie3pwJbpc0O7+DQsW2bmEpiu1cXDIMOq/ayX6Bhjqvz5NPFVO525izpn0AV+7EvELL
	 UcnH5t3nuA/LTsr207BNNHzb7NwK90S58hjjFHRUbETCt3qr2YoWdpGN1j3ghmJ92B
	 K6ztB/94y6/Og==
Date: Thu, 19 Dec 2024 09:38:42 +0100
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
Subject: Re: [PATCH v4 1/3] dt-bindings: display: bcm2711-hdmi: Add interrupt
 details for BCM2712
Message-ID: <7sgvdwyu2o7kli4eslg6o4mmzystoszrd6srw5pp6ikrmgq5ox@bvjz7j4d7v3l>
References: <20241218-dt-bcm2712-fixes-v4-0-54cc88b6c229@raspberrypi.com>
 <20241218-dt-bcm2712-fixes-v4-1-54cc88b6c229@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241218-dt-bcm2712-fixes-v4-1-54cc88b6c229@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_003847_592677_7E25FDD8 
X-CRM114-Status: GOOD (  16.99  )
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

On Wed, Dec 18, 2024 at 02:48:32PM +0000, Dave Stevenson wrote:
> Commit 62948c62abca ("dt-bindings: display: Add BCM2712 HDMI bindings")
> added the compatible strings for BCM2712, but missed out that the
> number of interrupts changed.
> 
> Update the schema to include the interrupt requirements.
> 
> Fixes: 62948c62abca ("dt-bindings: display: Add BCM2712 HDMI bindings")
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  .../bindings/display/brcm,bcm2711-hdmi.yaml        | 81 ++++++++++++++++++----
>  1 file changed, 67 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> index 6d11f5955b51..83c058728ef1 100644
> --- a/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml
> @@ -56,22 +56,12 @@ properties:
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
> +    minItems: 5
> +    maxItems: 6
>  
>    interrupt-names:
> -    items:
> -      - const: cec-tx
> -      - const: cec-rx
> -      - const: cec-low
> -      - const: wakeup
> -      - const: hpd-connected
> -      - const: hpd-removed
> +    minItems: 5
> +    maxItems: 6
>  
>    ddc:
>      $ref: /schemas/types.yaml#/definitions/phandle
> @@ -112,6 +102,66 @@ required:
>  
>  additionalProperties: false
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - brcm,bcm2711-hdmi0
> +              - brcm,bcm2711-hdmi1
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: CEC TX interrupt
> +            - description: CEC RX interrupt
> +            - description: CEC stuck at low interrupt
> +            - description: Wake-up interrupt
> +            - description: Hotplug connected interrupt
> +            - description: Hotplug removed interrupt
> +        interrupt-names:
> +          items:
> +            - const: cec-tx
> +            - const: cec-rx
> +            - const: cec-low
> +            - const: wakeup
> +            - const: hpd-connected
> +            - const: hpd-removed
> +
> +

Only one blank line

> +      required:
> +        - interrupts
> +        - interrupt-names

But anyway this is unusual. Why this was added? Nothing in commit msg
explains this.

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - brcm,bcm2712-hdmi0
> +              - brcm,bcm2712-hdmi1
> +    then:
> +      properties:
> +        interrupts:
> +          items:
> +            - description: CEC TX interrupt
> +            - description: CEC RX interrupt
> +            - description: CEC stuck at low interrupt
> +            - description: Hotplug connected interrupt
> +            - description: Hotplug removed interrupt
> +        interrupts-names:
> +          items:
> +            - const: cec-tx
> +            - const: cec-rx
> +            - const: cec-low
> +            - const: hpd-connected
> +            - const: hpd-removed
> +
> +      required:
> +        - interrupts
> +        - interrupt-names

Same question.

> +
>  examples:
>    - |
>      hdmi0: hdmi@7ef00700 {
> @@ -136,6 +186,9 @@ examples:
>                      "hd";
>          clocks = <&firmware_clocks 13>, <&firmware_clocks 14>, <&dvp 1>, <&clk_27MHz>;
>          clock-names = "hdmi", "bvb", "audio", "cec";
> +        interrupts = <0>, <1>, <2>, <3>, <4>, <5>;
> +        interrupt-names = "cec-tx", "cec-rx", "cec-low", "wakeup",
> +                "hpd-connected", "hpd-removed";

Fix alignment with opening " from earlier line (see DTS coding style).

Best regards,
Krzysztof


