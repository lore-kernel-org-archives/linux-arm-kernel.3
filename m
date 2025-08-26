Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EE0CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Aug 2025 23:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gC3kPF5Rpbrzs3Rbm5UONjqNL8Sz4DQ+JHhjuF9xANI=; b=LHsTIdP8mNkd9Pyw7gY2oY1wYM
	W2a0g9xiLTpxmKN3pFv4X6I/ZSXjhkepWih5kJ6zeNF8E57y12FGBrEcIhONYALZyV1IeJL+oy8VD
	wA/5EVSapl4UJTvPHkrHQaNGwYZrUIX2GsjjbzZwhh8an4D4PkSaUJonwoAuqa2JKSkIw8Io8pV9x
	jTkLqWiO1MijsBXLz+6hm/VAj288ALNipyaxaDsymi0EeKYF1IKlNaRyYs67JTlBqy1K0hTVR13c8
	vWVRrkx4EesaeuKMANRY0P4uqZKzjDfoH6f8xFj2AzWs1Zc5kMZpGba4mRR2wy07DQr3nJ+5YNbMe
	/bq6kQGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur3Ts-0000000DNiS-0PWT;
	Tue, 26 Aug 2025 23:53:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ur3R9-0000000DNSh-1h7f;
	Tue, 26 Aug 2025 23:50:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5C54A6022C;
	Tue, 26 Aug 2025 23:50:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D91F3C4CEF1;
	Tue, 26 Aug 2025 23:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756252245;
	bh=07Ku4luLp6tCckZKvoGpBvBDQ0Ywwcemo2l4BS/xWs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ku2eS2aLuk2BO85gltgp9fViBt3A7nXYGIzz3ko+3i02BU56tWHBUt7SqU2nURtEN
	 XBBLjuym5594eRddN8//2A0hIq9YGE3uJyHGblP1kjOj68phQ1DzZczKcjxA+BYH7m
	 beuxjpqZ1t3NkKzgfPTOjhOisGGViCwrEjzxf5/EchC01qkp/d/r0yRVVVq5e9D4ra
	 9iyKZSacjOMQZjnsjMUDUS7FZcVzPkmSyZlv8uUTxMLQ55Ro7lB9BFk8KSd1dsWumX
	 ZZ+S+nCkt7tGurJCOCifKfd1hsdFyeaBfVGIOUwIwszL5KLRmkt2m3Rz7ePoD+ElMf
	 wfPZvM216LTww==
Date: Tue, 26 Aug 2025 18:50:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-watchdog@vger.kernel.org,
	Mathew McBride <matt@traverse.com.au>,
	linux-arm-kernel@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Nikita Travkin <nikita@trvn.ru>,
	Guenter Roeck <groeck@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jean Delvare <jdelvare@suse.com>,
	Tim Harvey <tharvey@gateworks.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	linux-sound@vger.kernel.org,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	linux-hwmon@vger.kernel.org, Tzung-Bi Shih <tzungbi@kernel.org>,
	Pengyu Luo <mitltlatltl@gmail.com>, linux-gpio@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	Benson Leung <bleung@chromium.org>, Lee Jones <lee@kernel.org>,
	linux-pwm@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>
Subject: Re: [PATCH v3] dt-bindings: mfd: Move embedded controllers to own
 directory
Message-ID: <175625224288.764159.13881647192010727208.robh@kernel.org>
References: <20250825081201.9775-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250825081201.9775-2-krzysztof.kozlowski@linaro.org>
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


On Mon, 25 Aug 2025 10:12:02 +0200, Krzysztof Kozlowski wrote:
> Move several embedded controller bindings (like ChromeOS EC, Gateworks
> System Controller and Kontron sl28cpld Board Management) to new
> subdirectory "embedded-controller" matching their purpose.
> 
> An embedded controller (EC) is a discrete component that contains a
> microcontroller (i.e. a small CPU running a small firmware without
> operating system) mounted into a larger computer system running
> a fully fledged operating system that needs to utilize the embedded
> controller as part of its operation.
> 
> So far the EC bindings were split between "mfd" and "platform"
> directory.  MFD name comes from Linux, not hardware, and "platform" is a
> bit too generic.
> 
> Rename Gateworks GSC and Huawei Gaokun filenames to match compatible, as
> preferred for bindings.
> 
> Acked-by: Michael Walle <mwalle@kernel.org> # for sl28cpld
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> 
> Lee,
> Can you take it via MFD?
> There is a patch on the lists touching kontron,sl28cpld.
> 
> Changes in v3:
> 1. Move more files from "platform" directory.
> 2. Grow commit msg, based on feedback from Linus.
> 3. Add Rb (patch changed, though).
> 
> Changes in v2:
> 1. Correct remaining paths in other schemas ($ref and descriptions).
> 2. Add Ack.
> 
> Cc: Mathew McBride <matt@traverse.com.au>
> ---
>  .../{platform => embedded-controller}/acer,aspire1-ec.yaml  | 2 +-
>  .../{mfd => embedded-controller}/google,cros-ec.yaml        | 2 +-
>  .../gateworks-gsc.yaml => embedded-controller/gw,gsc.yaml}  | 2 +-
>  .../huawei,gaokun3-ec.yaml}                                 | 2 +-
>  .../{mfd => embedded-controller}/kontron,sl28cpld.yaml      | 2 +-
>  .../lenovo,yoga-c630-ec.yaml                                | 2 +-
>  .../microsoft,surface-sam.yaml                              | 2 +-
>  .../devicetree/bindings/gpio/kontron,sl28cpld-gpio.yaml     | 2 +-
>  .../devicetree/bindings/hwmon/kontron,sl28cpld-hwmon.yaml   | 2 +-
>  .../interrupt-controller/kontron,sl28cpld-intc.yaml         | 2 +-
>  .../devicetree/bindings/pwm/google,cros-ec-pwm.yaml         | 2 +-
>  .../devicetree/bindings/pwm/kontron,sl28cpld-pwm.yaml       | 2 +-
>  Documentation/devicetree/bindings/remoteproc/mtk,scp.yaml   | 4 ++--
>  .../devicetree/bindings/sound/google,cros-ec-codec.yaml     | 2 +-
>  .../devicetree/bindings/watchdog/kontron,sl28cpld-wdt.yaml  | 2 +-
>  MAINTAINERS                                                 | 6 +++---
>  16 files changed, 19 insertions(+), 19 deletions(-)
>  rename Documentation/devicetree/bindings/{platform => embedded-controller}/acer,aspire1-ec.yaml (94%)
>  rename Documentation/devicetree/bindings/{mfd => embedded-controller}/google,cros-ec.yaml (99%)
>  rename Documentation/devicetree/bindings/{mfd/gateworks-gsc.yaml => embedded-controller/gw,gsc.yaml} (98%)
>  rename Documentation/devicetree/bindings/{platform/huawei,gaokun-ec.yaml => embedded-controller/huawei,gaokun3-ec.yaml} (97%)
>  rename Documentation/devicetree/bindings/{mfd => embedded-controller}/kontron,sl28cpld.yaml (97%)
>  rename Documentation/devicetree/bindings/{platform => embedded-controller}/lenovo,yoga-c630-ec.yaml (95%)
>  rename Documentation/devicetree/bindings/{platform => embedded-controller}/microsoft,surface-sam.yaml (92%)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


