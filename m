Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C608AD7832F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 15:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8dOKuyRTSlCCu/YwZtF4lgLzt+TPDnBWe85FZCxwj0w=; b=dj90TzSQ55giSMxXVqJCthBApv
	pb0ECtEb5gckbGto5cyQ16vMH+bg9ek8njDEXxYfsRP9aZR4O9ZYLZ+38fgzl3HeX+wp/zxJVqZmI
	Vkui2zR8wNa+L66BGBKBjevdi9/9nlNFamUKiYC/L5y6dJdrK36DL328PyVn7XC4o6iMIWD1aPmlI
	L4WbMLDwccr30HWmGi9kdSPnpNOtuIkfwrp1/mnXyAyjLdIwGM0LjFmfjPQhv3JNT3UyTm4TrLzwh
	SCC5e0ArlJPsQvmOy/akh0WYUhwX+QlxWcPZumGXY86SLQC2czXxwkH5NpM2L6sPJhdy0Nsa5iWTK
	xgWHiuGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8gQ-00000006iyQ-3nbT;
	Mon, 02 Dec 2024 15:49:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI8dH-00000006i7d-2FFH;
	Mon, 02 Dec 2024 15:46:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DC04B5C4427;
	Mon,  2 Dec 2024 15:45:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D32DC4CED1;
	Mon,  2 Dec 2024 15:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733154402;
	bh=nq9CApm2lwU3fpXbg/FXX6NMDF+2uS9tBRO+bf3mRTs=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Nno5o5ginogysZYOoinMPACfcmzLi+NvkvWdGsltRWpC9rd1iSKUzbuKi+dexEVC6
	 VBtR9WlggSfrnvBoqJqs0HkfdK/167+6KxETARnP6EwNHRD5jVdxn6m4avfERluDb/
	 5ss+bMZ4iGWtGQLEFZOa0nDNjhIxHi04yO8djXxrhWaRqpQhQhA8pJ/JeB/71CnHT9
	 kIqWc4NVCgwZBbPXFy041BMzFegKtLFI70GfYZJZCjncRo2oi8cdWiCwxHRpyXWc3S
	 npTdtucykpJxCkuIpL0b+1MP4REnLr1rGA+BZP8TpUGuEANUx/62bgjJYSDFun9x1z
	 ReYvBWoS/hrYw==
Date: Mon, 02 Dec 2024 09:46:40 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>, devicetree@vger.kernel.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, Doug Berger <opendmb@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-rpi-kernel@lists.infradead.org, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 dri-devel@lists.freedesktop.org, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Simona Vetter <simona@ffwll.ch>, Ray Jui <rjui@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Linus Walleij <linus.walleij@linaro.org>, 
 Scott Branden <sbranden@broadcom.com>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 linux-kernel@vger.kernel.org
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
In-Reply-To: <20241202-dt-bcm2712-fixes-v1-1-fac67cc2f98a@raspberrypi.com>
References: <20241202-dt-bcm2712-fixes-v1-0-fac67cc2f98a@raspberrypi.com>
 <20241202-dt-bcm2712-fixes-v1-1-fac67cc2f98a@raspberrypi.com>
Message-Id: <173315440083.2722567.15501799626521434805.robh@kernel.org>
Subject: Re: [PATCH 1/7] dtbindings: display: bcm2711-hdmi: Correct
 bindings for 2712
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_074643_657782_5A90CF82 
X-CRM114-Status: GOOD (  11.52  )
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


On Mon, 02 Dec 2024 14:31:54 +0000, Dave Stevenson wrote:
> The previous patch just adding the compatible missed out that the
> number of interrupts changed
> 
> Fixes: 62948c62abca ("dt-bindings: display: Add BCM2712 HDMI bindings")
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> ---
>  .../bindings/display/brcm,bcm2711-hdmi.yaml        | 44 +++++++++++++++-------
>  1 file changed, 30 insertions(+), 14 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml:59:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml:67:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml:76:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml:84:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241202-dt-bcm2712-fixes-v1-1-fac67cc2f98a@raspberrypi.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


