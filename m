Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DDDC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 21:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=duyEnTT1tyYrLL0cVnPtdMRzN9JTnsplDfBRh4/9WvU=; b=5BFbdRqt+4TmgQhnCpzDqkX5js
	+SNpP2BTy31zM/7kG9xWBSEW0HpsX0eFzs2moMnLC94MJ0yzEBrxEx5a96IZk6Aep4sEW7lLJEZdv
	mVY9H/QPIb93JYq2hDZ3WCueyTXFZhFXTD+icNhNFUJ6vmo0KUZ1UYtHGf9siyItKQpQwshf9X70D
	GiO4sgftsTAoZUjwMF1bEZ1xyRKvPQDbdcqt0Kc5JroDSfIrnmK0tFEqopdaL6WmCh67TwQV0sJMk
	SPNS3+zjttrxLCRNH0GNYsKX6BYG0mGh1E6t1w/YsVpbk1LBG5wzvt0vA3F9n0a57dePELF+BuM+Q
	ISSh4qtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFJE4-0000000GL3y-1m89;
	Wed, 14 May 2025 21:01:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFJ9I-0000000GKcd-2pFG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 20:56:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D18F9A49D13;
	Wed, 14 May 2025 20:56:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A225C4CEE3;
	Wed, 14 May 2025 20:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747256179;
	bh=LzcztWerU4pmt8hh0TJh4jLsvk6/oUYWuswSfEQJhA0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VKjA/3US6VvMiYWEFfxUTPcVRsgkq/fkEDd1FECDu3ML/8zXXjCtRGVqsgM8wCUH5
	 +ly2bPAmH0DwK6dNZL892QlHnLHhFjDitrtw52TwhPFYhT+LUEv5yuC7EW/yskCSy2
	 eNJNgCzxtKIuXEoYdQyC00fVdaiCxVlLuYEM1mvp5kXyJEcPNzlZJs92pnXqpwijHT
	 MqAKCgjWf+09vWbdG9ViS23iPDY5zWJnOCJwri1XSKRIhmd23wvZWVmMQ/vyJPgI9L
	 Sz6X2Oiqd7Iy9MO31pjPyE+UlaqzGmrWv5IASpHjm7eqrfGR6ceJ9sxNHOUTvroicT
	 TSbs3g75uA6lg==
Date: Wed, 14 May 2025 15:56:17 -0500
From: Rob Herring <robh@kernel.org>
To: Sven Peter <sven@svenpeter.dev>
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>, Lee Jones <lee@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 02/10] dt-bindings: power: reboot: Add Apple Mac SMC
 Reboot Controller
Message-ID: <20250514205617.GA3020430-robh@kernel.org>
References: <20250511-smc-6-15-v5-0-f5980bdb18bd@svenpeter.dev>
 <20250511-smc-6-15-v5-2-f5980bdb18bd@svenpeter.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250511-smc-6-15-v5-2-f5980bdb18bd@svenpeter.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_135620_783604_FD72A99F 
X-CRM114-Status: GOOD (  14.69  )
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

On Sun, May 11, 2025 at 08:18:37AM +0000, Sven Peter wrote:
> On Apple Silicon machines a clean shutdown or reboot requires
> talking to SMC and writing to NVMEM cells. Add a binding for
> this MFD sub-device.
> 
> Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
>  .../bindings/power/reset/apple,smc-reboot.yaml     | 52 ++++++++++++++++++++++
>  MAINTAINERS                                        |  1 +
>  2 files changed, 53 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml b/Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..e55e524914c2f57f7acf239fdefcbdc7a993b69f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/power/reset/apple,smc-reboot.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Apple SMC Reboot Controller
> +
> +description: |

Don't need '|' here.

> +  The Apple System Management Controller (SMC) provides reboot functionality
> +  on Apple Silicon SoCs. It uses NVMEM cells to store and track various
> +  system state information related to boot, shutdown, and panic events.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

