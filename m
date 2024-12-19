Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2931CE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 08:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YxYTua3hiNM4cpWYdNE0p0Bp8jcaJn2f2CD+r98zPa8=; b=0JzdaTICWX4Nzq8uzYZSZOfhtr
	3e8Tr1/+rGZiblDkxED1Yd/YUeM0I0Zn4T/e9EXJ1qHgbVibVpCHeOIXI6LsKFhVRn569FrO7YSB4
	gjC9lYhSdI4SqwAsBG/CzF0e3wnc2/uiDxOnpZyRmG8vUq3dbm1l7i8ArSFoANGIPQLLqd1RMjAWb
	Mj6aKpDri2Hh2pRIx7xdrKffrUrbyvFbdWjRg/wBWOOT+tvFLCgUIbD1bWWnQzo321b/SZEBNX7JX
	OZBL2KYdhzlfulmwtR9S2wykLU1DoXEnKkXCT13frJ8WUtV+wgWIOVSPNwgc7oki8ywzCU7sQIn3F
	ESkDwzbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOC7i-00000001Jgk-09S0;
	Thu, 19 Dec 2024 08:43:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOC6b-00000001JUv-2oCb;
	Thu, 19 Dec 2024 08:42:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0D0A85C6717;
	Thu, 19 Dec 2024 08:41:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8EA9C4CED0;
	Thu, 19 Dec 2024 08:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734597720;
	bh=EkcnPB9WBd/TNqG00+8vwrlF/Hfm2d74IUOXRibreB4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bSVwBsXZOOPUXdDt31Z0SB68MwUpAMHI+qUtla7oQExLQYez0KZvnNrfUsrvp2ESs
	 w+n2m/laXsCukY5YwQO6A4kMcLHru0ZgYbCLUSUvgA7nj6tZXUZlFh1ZetxzoaFAQv
	 HgjS1uh1MT87iOL39Ky6GtLgF4cyJXgyMs5kca5QA6zflbbqeFyVpZQTRoiu4pkQ16
	 k/eTsTQxAL53LWip218huMV7Q3eP0OG1ujQPOSqSwpreuXrMjnLYLiuaQNPo39nFPG
	 uNG5GItgnfImkpkd1GeAQwhj/rewb8bULqqaTlNr7EMt4Rh6NvfzBdCCp3tTTYZBS2
	 Nh7l6IBxEymEA==
Date: Thu, 19 Dec 2024 09:41:57 +0100
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
Subject: Re: [PATCH v4 2/3] dt-bindings: display: Fix BCM2835 HVS bindings
 for BCM2712
Message-ID: <lzvcaspulvsulbulqinzftt3xtdyro64hi674u2bnkpvbrihri@e2o247mjom5s>
References: <20241218-dt-bcm2712-fixes-v4-0-54cc88b6c229@raspberrypi.com>
 <20241218-dt-bcm2712-fixes-v4-2-54cc88b6c229@raspberrypi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241218-dt-bcm2712-fixes-v4-2-54cc88b6c229@raspberrypi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_004202_122121_549E5912 
X-CRM114-Status: GOOD (  19.25  )
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

On Wed, Dec 18, 2024 at 02:48:33PM +0000, Dave Stevenson wrote:
> Commit 6cfcbe548a3a ("dt-bindings: display: Add BCM2712 HVS bindings")
> added the compatible string for BCM2712, but missed out that
> the number of interrupts and clocks changed too, and both need to be
> named.
> 
> Update to validate clock, interrupts, and their names for the variants.
> 
> Fixes: 6cfcbe548a3a ("dt-bindings: display: Add BCM2712 HVS bindings")
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  .../bindings/display/brcm,bcm2835-hvs.yaml         | 84 ++++++++++++++++++----
>  1 file changed, 70 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
> index f91c9dce2a44..fd25ee5ce301 100644
> --- a/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
> +++ b/Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
> @@ -20,11 +20,20 @@ properties:
>      maxItems: 1
>  
>    interrupts:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 3
> +
> +  interrupt-names:
> +    minItems: 1
> +    maxItems: 3
>  
>    clocks:
> -    maxItems: 1
> -    description: Core Clock
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 2
>  
>  required:
>    - compatible
> @@ -33,17 +42,64 @@ required:
>  
>  additionalProperties: false
>  
> -if:
> -  properties:
> -    compatible:
> -      contains:
> -        enum:
> -          - brcm,bcm2711-hvs
> -          - brcm,bcm2712-hvs
> -
> -then:
> -  required:
> -    - clocks
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: brcm,bcm2711-hvs
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Core Clock
> +        interrupts:
> +          maxItems: 1


clock-names and interrupt-names: false, unless driver needs them but all
this should be explained in the commit msg because it would be a change
to the binding.

> +
> +      required:
> +        - clocks
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: brcm,bcm2712-hvs
> +
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2
> +        clock-names:
> +          items:
> +            - const: core
> +            - const: disp
> +        interrupts:
> +          items:
> +            - description: Channel 0 End of frame
> +            - description: Channel 1 End of frame
> +            - description: Channel 2 End of frame
> +        interrupt-names:
> +          items:
> +            - const: ch0-eof
> +            - const: ch1-eof
> +            - const: ch2-eof
> +      required:
> +        - clocks
> +        - clock-names
> +        - interrupt-names

My previous comment still stands. Reply to people's feedback instead of
ignoring it.

Best regards,
Krzysztof


