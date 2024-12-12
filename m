Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 167A6E77185
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 19:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J0o8+Q+sqdZlwq9NHVq3CpyZ2Eatj3+r/2+isOr6hRw=; b=czKk3vcFHVmBbC7h4p6YPCxU4e
	UZAZcbGVFQmeB1OlAhgc24CMp7di7d7L9eIRxNNs81lQZJV+FOr3OMiKXT8E8tBKO+SBGAPvAKxZD
	RPWud7J+68i3i8dGxzjB7rzFDxl2WAtBzUERm9aYXtmIg68Ab+cU/TDkQFdQriquRdyuUFj8RY3fX
	sTWjZWwWI3Ck3ZDOSoUOZ/uao3RD2u4uBIFhdJ+jTlvUQSIdszsvMcWjmYgCkZZjhOTliB1fbxgqQ
	zhCeq9jogT2mHlfCja+YyyR5TvkNQdzBlHEU0JYGlZd/Sr0hQbRLDTSRvUvyCmOpvchJuvWwzIrxy
	qS3jE5EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLofS-00000001aIF-3l7l;
	Thu, 12 Dec 2024 19:16:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnhf-00000001Maf-0h6x;
	Thu, 12 Dec 2024 18:14:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1E8255C69C8;
	Thu, 12 Dec 2024 18:13:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2B06C4CECE;
	Thu, 12 Dec 2024 18:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734027262;
	bh=Q3FhwQLAi7iHv2Gb7vKlZneQUQfSiQ7lD1L8nxume9I=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=cxqaiEU8GN7Zyexc5KF69Sd/zWlpRL4PDNrN0Ga6M4iUIwZ44iSCDz6qhOrYOZqqt
	 6VpUyRdeFS6YMOjtWJAyC4+q1i3kLEXQNdP91XMGL3FHZ6akxv0wIGSZ2Gko/53zj9
	 Hhz/HDBZyKX9BQQIjvMuOjZkt3E8QruwfD5HOFhqpOsP7rNMlTELzfaLmd5ClaBYwg
	 gnAsdZr/OdM5Fr5RglZiOGJk0YSEsbGWVjejw4dVTtIiZcpCFK3wibOPZaXLbvW9kW
	 4f/YPZsZeSJuxkSeZiYvoQ7gNQ49KCIFzPXiwsaLHmMtObsMvYIDaUsgpe0rSdm3Rq
	 A8cpB9Pf0m/OQ==
Date: Thu, 12 Dec 2024 12:14:20 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Stefan Wahren <wahrenst@gmx.net>, 
 Maxime Ripard <mripard@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Conor Dooley <conor+dt@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, 
 Ray Jui <rjui@broadcom.com>, David Airlie <airlied@gmail.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Scott Branden <sbranden@broadcom.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Florian Fainelli <f.fainelli@gmail.com>, Eric Anholt <eric@anholt.net>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Doug Berger <opendmb@gmail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>
To: Dave Stevenson <dave.stevenson@raspberrypi.com>
In-Reply-To: <20241212-dt-bcm2712-fixes-v2-1-35986e04d0f4@raspberrypi.com>
References: <20241212-dt-bcm2712-fixes-v2-0-35986e04d0f4@raspberrypi.com>
 <20241212-dt-bcm2712-fixes-v2-1-35986e04d0f4@raspberrypi.com>
Message-Id: <173402726027.2935600.12242526873775357219.robh@kernel.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: display: bcm2711-hdmi: Add
 interrupt details for BCM2712
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_101423_286667_DFD8B839 
X-CRM114-Status: GOOD (  12.10  )
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


On Thu, 12 Dec 2024 16:18:51 +0000, Dave Stevenson wrote:
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

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml:59:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml:67:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml:76:9: [warning] wrong indentation: expected 10 but found 8 (indentation)
./Documentation/devicetree/bindings/display/brcm,bcm2711-hdmi.yaml:84:9: [warning] wrong indentation: expected 10 but found 8 (indentation)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241212-dt-bcm2712-fixes-v2-1-35986e04d0f4@raspberrypi.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


