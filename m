Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E98F483DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 18:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CbJ7gAHcsIpRWXsOtrEC4Jk9tzqhUEvXGZtyQscLHkQ=; b=wjc8JAU5h7r27XYP5pEOFenA4k
	S+TYMTj07wlpYSw2a6PZS4Ip2PeiTUTSMXinfKiPA07J1ZWc3GOO3h//rMX7hfGe2YFJpR7g5KtHa
	U2RpHYbnmEx9mh91+WLmi5CxjMMb7reEA6mMwjNzPK1crPpMpFH4MABYT9pXnIXOdcG2R6adPriHq
	TK8hlNSg8k0A3ITsf4iG0vl4IRDe6kkFBj5m0EZiR9SpcIeeWaBl2KpM6K1Ysj8zm8aDG0yfn2k/N
	VwOBZkPUixuZ/5iCjPQhkxG8VRbJ4yUD7Tb/bAw4l4GZ+kpSHltsqaqYhqgA2hTgCP9WdNgyKId5k
	uEYmAKLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4jj9-0000000HJEf-1isW;
	Mon, 23 Mar 2026 18:10:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4jj8-0000000HJEV-3c3C
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 18:10:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 177FB600AC;
	Mon, 23 Mar 2026 18:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B84BC4CEF7;
	Mon, 23 Mar 2026 18:10:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774289409;
	bh=uklW9RFr6BYjn6wm/JQpUmhU5aMurNfLbOV16eYldHA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m2e8B3c5Aznp84RxbaTuWUcfASpJ7HuYQYEFpVz6zqnkEzkmS+nRH0bUf3G2IdoxA
	 QK96J8OM0RHAGM7XCO/06Z+JQ7astlcSz6iwDPMw26jA5dulMDml1bmqr0ib9cW4ic
	 b78xq3yyBbqpuOyVzWz2HI8RkVvJgnm4E0qbhb7FKfujOeaDtdge9GMP0gopdy4WUc
	 +QXFaIW79WZvFoKtetnEYU8FMD+yS4tKRLhnMzvS7b2zFVOyvIVw4dyjSSCwQFINWT
	 L/ojs9wgmTq/tMLFA42i3mgS94wuMPmDeqXulT0+ulJZgPz3aVel9cNQozDIXvfzZY
	 f9St0ZvuVp9zg==
Date: Mon, 23 Mar 2026 13:10:08 -0500
From: Rob Herring <robh@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Eduard Bostina <egbostina@gmail.com>, daniel.baluta@nxp.com,
	simona.toaca@nxp.com, d-gole@ti.com, m-chawdhry@ti.com,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Mark Brown <broonie@kernel.org>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: watchdog: Convert TS-4800 to DT schema
Message-ID: <20260323181008.GA864363-robh@kernel.org>
References: <20260323084616.10469-1-egbostina@gmail.com>
 <20260323084616.10469-2-egbostina@gmail.com>
 <acFxdiHYjlSOESf_@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acFxdiHYjlSOESf_@lizhi-Precision-Tower-5810>
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

On Mon, Mar 23, 2026 at 12:59:34PM -0400, Frank Li wrote:
> On Mon, Mar 23, 2026 at 10:46:12AM +0200, Eduard Bostina wrote:
> > Convert the Technologic Systems TS-4800 watchdog timer bindings
> > to DT schema.
> >
> > Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> > ---
> > Note:
> > * This patch is part of the GSoC2026 application process for device tree bindings conversions
> > * https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings
> >
> >  .../watchdog/technologic,ts4800-wdt.yaml      | 46 +++++++++++++++++++
> >  .../bindings/watchdog/ts4800-wdt.txt          | 25 ----------
> >  2 files changed, 46 insertions(+), 25 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/watchdog/technologic,ts4800-wdt.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/watchdog/ts4800-wdt.txt
> >
> > diff --git a/Documentation/devicetree/bindings/watchdog/technologic,ts4800-wdt.yaml b/Documentation/devicetree/bindings/watchdog/technologic,ts4800-wdt.yaml
> > new file mode 100644
> > index 000000000..cb2066b4b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/watchdog/technologic,ts4800-wdt.yaml
> > @@ -0,0 +1,46 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/watchdog/technologic,ts4800-wdt.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Technologic Systems TS-4800 Watchdog
> > +
> > +maintainers:
> > +  - Eduard Bostina <egbostina@gmail.com>
> > +
> > +allOf:
> > +  - $ref: watchdog.yaml#
> 
> Move allOf after required incase add if-else branch later.
> 
> > +
> > +properties:
> > +  compatible:
> > +    const: technologic,ts4800-wdt
> > +
> > +  syscon:
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    items:
> > +      - items:
> > +          - description: Phandle to the FPGA's syscon
> > +          - description: Offset to the watchdog register
> > +    description: Phandle / integers array that points to the syscon node which
> > +      describes the FPGA's syscon registers.
> > +
> > +required:
> > +  - compatible
> > +  - syscon
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    syscon: syscon@b0010000 {
> > +      compatible = "syscon", "simple-mfd";
> > +      reg = <0xb0010000 0x3d>;
> > +      reg-io-width = <2>;
> > +
> 
> Needn't this part. just keep below watchdog node should be enough.

Well, the next thing to fix is going to be that this node needs a 
specific compatible. It doesn't look like there's any other child nodes, 
so probably want just one schema that defines both nodes.

Rob

