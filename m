Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7334C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 00:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VFwmDv5rtIpq4doJVM3pQVXJ8CnZ6EnDY9JTLGFwHHs=; b=ML+9YyGuzUwtNfBRH24vNUQY1P
	5yeBjBhRTD95yupf0zwjnoLmFfTIk6jz/79yvp+l2Y3xD+q4nZKfGY8d/soqhHYUN5UZEsoAfctOg
	DngMrAMdhli/9cs/yMtuQ3pzzrfsBXR0XIpNH3giDtIH6OQUjz44ot1pdYve6UQ5Y1COjdhu8SWGo
	9RK9njecCzZX4iRoJ6rmYY1l35+9eOXBS/JYFyG/OhOFVlXBJDc8o5LNLs77wcKJwv0kXZvjgtA95
	8XCEdkIhUHBCLqWL5G4U61fMoea2gcUYr7WgM64cBPXvNGxA6MJapxW4OAhLNWlf6ebWsUSgdIKQ+
	siMygnVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkYKU-0000000AQ8x-05ij;
	Wed, 19 Feb 2025 00:52:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkYAS-0000000ANn3-1AG6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 00:42:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B19EC5C5E93;
	Wed, 19 Feb 2025 00:41:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9352BC4CEE6;
	Wed, 19 Feb 2025 00:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739925743;
	bh=BwGnr0m0xhmBvURW6iahNgzC2tdJQtDHH3iqzOTLvFI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Ilbw/hEDJPwc1Sh+JkMlQA5h+OID6m/Osf++dMsXsuSDlpKfnk/r28dj1vugS7fBp
	 dDtlMtOciF380qWvnfEDLW0fjc2wqFx86/wlSOUAkpNkoTH0hSa9/jS9rT1QnFYxFq
	 1nmIrnKUda3u8qXJCcixgyrDY3w5AtOBds1/1XS3EH6mjmIBo8WfszmAnJWKg/oA4b
	 77mB4vBkxGzHtPo5pUv7S/RCP7e65yokhXWy22pBk4lb5XNEsvCN+ecBn62Mvb1DjT
	 k6VYLbGR2vbsFvGQ8pvJCrG0e2gEIr2dAFItnO0j88+jtPhaujY/8l7yX821F+XO5l
	 8xOIQ5Y5OiTcA==
Date: Tue, 18 Feb 2025 18:42:22 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Joel Stanley <joel@jms.id.au>, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Eddie James <eajames@linux.ibm.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Guenter Roeck <linux@roeck-us.net>, linux-arm-kernel@lists.infradead.org, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, devicetree@vger.kernel.org
To: Heyi Guo <guoheyi@linux.alibaba.com>
In-Reply-To: <20250218031709.103823-1-guoheyi@linux.alibaba.com>
References: <20250218031709.103823-1-guoheyi@linux.alibaba.com>
Message-Id: <173992516523.2065435.15405371370616212583.robh@kernel.org>
Subject: Re: [PATCH 1/2] driver/aspeed-wdt: fix pretimeout for counting
 down logic
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_164224_437455_6A5770DA 
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


On Tue, 18 Feb 2025 11:16:58 +0800, Heyi Guo wrote:
> Aspeed watchdog uses counting down logic, so the value set to register
> should be the value of subtracting pretimeout from total timeout.
> 
> Fixes: 9ec0b7e06835 ("watchdog: aspeed: Enable pre-timeout interrupt")
> 
> Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>
> 
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Andrew Jeffery <andrew@codeconstruct.com.au>
> Cc: Eddie James <eajames@linux.ibm.com>
> ---
>  drivers/watchdog/aspeed_wdt.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/aspeed/' for 20250218031709.103823-1-guoheyi@linux.alibaba.com:

arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-opp-tacoma.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-quanta-s6q.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-bletchley.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge-4u.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge-4u.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge-4u.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge-4u.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb-a1.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-fuji.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-everest.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-sbp1.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-transformers.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-ast2600-evb.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-yosemite4.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-inventec-starscream.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-1s4u.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-catalina.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-blueridge.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-bonnell.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-rainier-4u.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtjefferson.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-asus-x4tf.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-elbert.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ufispace-ncplite.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-fuji.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ampere-mtmitchell.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-minerva.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-qcom-dc-scm-v1.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-ibm-system1.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: watchdog@1e785000: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: watchdog@1e785040: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: watchdog@1e785080: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-greatlakes.dtb: watchdog@1e7850c0: 'interrupts' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/watchdog/aspeed,ast2400-wdt.yaml#






