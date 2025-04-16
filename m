Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C4FAC369C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 16:37:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1vUVY5S1FEL0iOA3oN/M/DG3Mn68a6zNLJTu7WJYknc=; b=sjZt1TJnYYp4tlvXijcx+uTgS4
	PujzEUKdwUYRWZcV+lhNJ2rgZ924N2ZRDsPquLrJHwdKaj+W7heejlfD+IRHasWqamyk9yHRGPGBg
	/0YBu5NOhkgRb9UUHMO2Y4FWgHXeXcvtzTd+IepBSHjB89Ykz0qz0wDOm/OwbDF/MTpWDhPpqRwvh
	ea7YPcw1qHj/c7Lmk3/LhHC6ZUAmjgbgwO4A3JKmqittTqIvM8DhkbR8mmU/Wt3PYeXReZWh7jY8h
	uwSSlZbPPzZvpOUfQYcX+NmI9q3KPhjFZHJ1rhnTXEnpOecgqfQ6vTInl14ojRwZ3+7VMxc1vIF1s
	YBzzRaGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u55ky-0000000AHvX-1phM;
	Wed, 16 Apr 2025 16:37:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5564-0000000A9gS-3jos
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 15:54:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3EC2F6844B;
	Wed, 16 Apr 2025 15:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EF83C4CEE2;
	Wed, 16 Apr 2025 15:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744818883;
	bh=BK6yw88CCQMOuS+aZ2Cf0kz3xcaYu31IAHaHB7+z3cw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CYsB7iLFu7CRO3Le0pvmC1k268EFLWH7CYrVAhgxHXz/hQKlGrhkytRRyfxhrFRLa
	 kLWtrgRIFCVezFrhVYZi/slKn9mmAhE5BNzwbioipRzXvxBRe20qSGWRYEoBVVOn4C
	 EHs3j8eTEtQA7Y1GrcktDJQf0XFLzKInpzctB45OjBhPa2rSJmMnw1aUcZjTSYAK6s
	 CiSdKNvuxd/I+GZEiYg3us08A1t4SeJm1Z+KQq8BkAxgxhMAYAFQZ/tbuLHPWbWvlI
	 i4d9EwJSJCI4WiRJ34sJF0ZXuEn3EmuFUh8xOpPzpJWwrT7Oh77TTOUTXNZWnb8eyN
	 kDLHP3E9Of9dA==
Date: Wed, 16 Apr 2025 10:54:42 -0500
From: Rob Herring <robh@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org, netdev@vger.kernel.org,
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH 00/13] ARM: vt8500: DT bindings and dts updates
Message-ID: <20250416155442.GA3255418-robh@kernel.org>
References: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416-wmt-updates-v1-0-f9af689cdfc2@gmail.com>
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

On Wed, Apr 16, 2025 at 12:21:25PM +0400, Alexey Charkov wrote:
> Convert some more VT8500 related textual DT binding descriptions to
> YAML schema, do minor dts correctness fixes, and add a DT for the
> board I'm actually testing those on (VIA APC Rock).
> 
> While at that, also describe the PL310 L2 cache controller present on
> WM8850/WM8950.
> 
> Note that this series is based upon Krzysztof's linux-dt/for-next
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
> Alexey Charkov (13):
>       dt-bindings: i2c: i2c-wmt: Convert to YAML
>       dt-bindings: interrupt-controller: via,vt8500-intc: Convert to YAML
>       dt-bindings: mmc: vt8500-sdmmc: Convert to YAML
>       dt-bindings: net: via-rhine: Convert to YAML
>       dt-bindings: pwm: vt8500-pwm: Convert to YAML
>       dt-bindings: timer: via,vt8500-timer: Convert to YAML
>       dt-bindings: arm: vt8500: Add VIA APC Rock/Paper boards
>       ARM: dts: vt8500: Add node address and reg in CPU nodes
>       ARM: dts: vt8500: Move memory nodes to board dts and fix addr/size
>       ARM: dts: vt8500: Use generic compatibles for EHCI
>       ARM: dts: vt8500: Use generic node name for the SD/MMC controller
>       ARM: dts: vt8500: Add VIA APC Rock/Paper board
>       ARM: dts: vt8500: Add L2 cache controller on WM8850/WM8950
> 
>  Documentation/devicetree/bindings/arm/vt8500.yaml  | 19 ++++---
>  Documentation/devicetree/bindings/i2c/i2c-wmt.txt  | 24 ---------
>  .../devicetree/bindings/i2c/wm,wm8505-i2c.yaml     | 47 +++++++++++++++++
>  .../interrupt-controller/via,vt8500-intc.txt       | 16 ------
>  .../interrupt-controller/via,vt8500-intc.yaml      | 47 +++++++++++++++++
>  .../devicetree/bindings/mmc/vt8500-sdmmc.txt       | 23 --------
>  .../devicetree/bindings/mmc/wm,wm8505-sdhc.yaml    | 61 ++++++++++++++++++++++
>  .../devicetree/bindings/net/via,vt8500-rhine.yaml  | 41 +++++++++++++++
>  .../devicetree/bindings/net/via-rhine.txt          | 17 ------
>  .../devicetree/bindings/pwm/via,vt8500-pwm.yaml    | 43 +++++++++++++++
>  .../devicetree/bindings/pwm/vt8500-pwm.txt         | 18 -------
>  .../devicetree/bindings/timer/via,vt8500-timer.txt | 15 ------
>  .../bindings/timer/via,vt8500-timer.yaml           | 36 +++++++++++++
>  MAINTAINERS                                        |  7 ++-
>  arch/arm/boot/dts/vt8500/Makefile                  |  3 +-
>  arch/arm/boot/dts/vt8500/vt8500-bv07.dts           |  5 ++
>  arch/arm/boot/dts/vt8500/vt8500.dtsi               | 12 ++---
>  arch/arm/boot/dts/vt8500/wm8505-ref.dts            |  5 ++
>  arch/arm/boot/dts/vt8500/wm8505.dtsi               | 14 ++---
>  arch/arm/boot/dts/vt8500/wm8650-mid.dts            |  5 ++
>  arch/arm/boot/dts/vt8500/wm8650.dtsi               | 14 ++---
>  arch/arm/boot/dts/vt8500/wm8750-apc8750.dts        |  5 ++
>  arch/arm/boot/dts/vt8500/wm8750.dtsi               | 14 ++---
>  arch/arm/boot/dts/vt8500/wm8850-w70v2.dts          |  5 ++
>  arch/arm/boot/dts/vt8500/wm8850.dtsi               | 23 +++++---
>  arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts       | 21 ++++++++
>  arch/arm/boot/dts/vt8500/wm8950.dtsi               | 11 ++++
>  27 files changed, 386 insertions(+), 165 deletions(-)
> ---
> base-commit: 62db22c2af6ce306943df5de6f5198ea9bd3d47b

I could not apply this series for testing. What base is this? It is 
unknown to anything I have. Please use most recent rc1 unless you have 
a dependency then use recent linux-next or a branch in it.

Rob

