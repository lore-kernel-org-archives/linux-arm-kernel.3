Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EBD1FCE09B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 14:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:
	Content-Transfer-Encoding:Content-Type:Mime-Version:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LF1zAuSNqXIs/9ctoJjEp+VMTDcoeXF/IvZ3mF+jESg=; b=wk2B66puiy0IAn
	i/WueEtzGsgUqrbIw3qDqjtWTHqWwdFJAiuXo5VCAcsXOc0yuBLgcJYSLeFLSU8Fz00sL39aOEKt+
	iuycoyMKuLC4MODyWk07BEy2VoVQVWE2BKxP4UA8SooIVM2nAyEe059canPlcinVyW6YgDaxAJcRl
	1I+1UWyl0+QQRJugnbUu49GSY0zQ5jeWFVq1JpTBqZ9ZbNnwYaT/A+4ZcnHzFavqS7uv3vncnOxi7
	94e7LsaR/GS/CQn2XnMD0t3ZXDlNymqHBdUkM2U8C4lFYgr7v14n5S3dV2zFE72iL7Hb90Q6fr//a
	Xh/0Z29fjd8TaspG58kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcfM-00000006MzE-0p15;
	Thu, 26 Feb 2026 14:48:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcfK-00000006MyU-2koY;
	Thu, 26 Feb 2026 14:48:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Subject:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=LF1zAuSNqXIs/9ctoJjEp+VMTDcoeXF/IvZ3mF+jESg=; b=SPExeKznZ7pxe6U6nIsfsSwzti
	b2TRZOQAbszKikg8EBoz9GikGJmeAoZ8k1GMoL4n+/Jv5C7GBJWlTFrq0LLTK1XPyUfySQY3rod6d
	4vp7tRsNz95x5R9UZpadqee+iIpvJIHJRp1VoB9XR+BmVEoix/Xa5NhwLacCGNjRhOtQPP4SVXOM0
	fRrMzlO2wqiqu+3wXUvWq6gwvg9DNmb57JfYvdM3odIWU8WjVN2u45S5KzC9tr0yJVCUZ2FqO7GKY
	Y+Bl118iXSPUO2Kofxu4aMMDCrGUE5UFBgeESJRtCDRNti0zLeRQZBjHkjFYOMO3MuWr237s7Udlt
	+vwfEKQQ==;
Received: from mail.hugovil.com ([162.243.120.170])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvcfH-00000002xnQ-0XPp;
	Thu, 26 Feb 2026 14:48:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=LF1zAuSNqXIs/9ctoJjEp+VMTDcoeXF/IvZ3mF+jESg=; b=G7U75ipV5fNWP5LU5UL5Flnmb3
	6zLQjZqQFHHR0I9QbeAm5xdxA0aAYpZwxMWMuWd+lTBYR9zz77wfUTqGUMroszRXqY0rBLM6XFJ6Y
	Wi8BEr51t14dNJwV7zWaxcCWrWAl0ro7lMrZprtKB84ogNWycVyJTVQBsfLF9NTyTzk8=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:47368 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vvcew-0004LS-Jk; Thu, 26 Feb 2026 09:48:11 -0500
Date: Thu, 26 Feb 2026 09:48:09 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: robin@protonic.nl, andy@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dmitry.torokhov@gmail.com, hvilleneuve@dimonoff.com,
 mkorpershoek@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, lee@kernel.org,
 alexander.sverdlin@gmail.com, marek.vasut@gmail.com, akurz@blala.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Message-Id: <20260226094809.ce24cde2622c7adb84fb4410@hugovil.com>
In-Reply-To: <CAMuHMdVdYX9p9DfDoyMv8qEm52kY51QULkEnuxRBH2OyWyYf6g@mail.gmail.com>
References: <20260225155409.612478-1-hugo@hugovil.com>
	<20260225155409.612478-4-hugo@hugovil.com>
	<CAMuHMdVdYX9p9DfDoyMv8qEm52kY51QULkEnuxRBH2OyWyYf6g@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
Subject: Re: [PATCH v3 3/4] dt-bindings: input: add GPIO charlieplex keypad
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_144831_736022_EA042BAB 
X-CRM114-Status: GOOD (  27.46  )
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

Hi Geert,

On Thu, 26 Feb 2026 10:32:30 +0100
Geert Uytterhoeven <geert@linux-m68k.org> wrote:

> Hi Hugo,
> 
> On Wed, 25 Feb 2026 at 16:54, Hugo Villeneuve <hugo@hugovil.com> wrote:
> > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> >
> > Add DT bindings for GPIO charlieplex keypad.
> >
> > Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> 
> Thanks for your patch!
> 
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/input/gpio-charlieplex-keypad.yaml
> > @@ -0,0 +1,106 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +
> > +$id: http://devicetree.org/schemas/input/gpio-charlieplex-keypad.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: GPIO charlieplex keypad
> > +
> > +maintainers:
> > +  - Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > +
> > +description: |
> > +  The charlieplex keypad supports N^2)-N different key combinations (where N is
> > +  the number of lines). Key presses and releases are detected by configuring
> > +  only one line as output at a time, and reading other line states. This process
> > +  is repeated for each line. Diodes are required to ensure current flows in only
> > +  one direction between any pair of pins.
> > +  This mechanism doesn't allow to detect simultaneous key presses.
> 
> Indeed, e.g. pressing S1 and S2 simultaneously will show a ghost
> S5 keypress.
> 
> > +
> > +  Wiring example for 3 lines keyboard with 6 switches and 3 diodes:
> > +
> > +  L0  --+---------------------+----------------------+
> > +        |                     |                      |
> > +  L1  -------+-----------+---------------------+     |
> > +        |    |           |    |                |     |
> > +  L2  -------------+----------------+-----+    |     |
> > +        |    |     |     |    |     |     |    |     |
> > +        |    |     |     |    |     |     |    |     |
> > +        |  S1 \  S2 \    |  S3 \  S4 \    |  S5 \  S6 \
> > +        |    |     |     |    |     |     |    |     |
> > +        |    +--+--+     |    +--+--+     |    +--+--+
> > +        |       |        |       |        |       |
> > +        |    D1 v        |    D2 v        |    D3 v
> > +        |       - (k)    |       - (k)    |       - (k)
> > +        |       |        |       |        |       |
> > +        +-------+        +-------+        +-------+
> 
> Don't you need pull-down resistors on L[0-2], and/or a way to specify
> in DT to enable internal poll-down on GPIO controllers that support it?
> Some controllers may support internal pull-up only, but I guess that
> can be handled using GPIO_ACTIVE_LOW?

Yes, I did not put any resistors in the diagram in order to keep it
simple and clear.

You need pull-down resistors either on the board, or specified in the
DT like we do for our board (we use the PCAL6416 with pull-up/down
support):

  line-gpios = <&gpio20 0 (GPIO_ACTIVE_HIGH | GPIO_PULL_DOWN)
                 ...

I will add this to the example, and add a few lines explaining this in
the description.


> > +
> > +  L: GPIO line
> > +  S: switch
> > +  D: diode (k indicates cathode)
> > +
> > +allOf:
> > +  - $ref: input.yaml#
> > +  - $ref: /schemas/input/matrix-keymap.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: gpio-charlieplex-keypad
> > +
> > +  autorepeat: true
> > +
> > +  debounce-delay-ms:
> > +    default: 5
> > +
> > +  line-gpios:
> > +    description:
> > +      List of GPIOs used as lines. The gpio specifier for this property
> > +      depends on the gpio controller to which these lines are connected.
> > +
> > +  linux,keymap: true
> > +
> > +  poll-interval: true
> > +
> > +  settling-time-us: true
> > +
> > +  wakeup-source: true
> > +
> > +required:
> > +  - compatible
> > +  - line-gpios
> > +  - linux,keymap
> > +  - poll-interval
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/gpio/gpio.h>
> > +    #include <dt-bindings/input/input.h>
> > +
> > +    charlieplex-keypad {
> 
> "keyboard", as per Devicetree Specification Generic Names
> Recommendation.

Ok.

Thank you,
Hugo.

> 
> > +        compatible = "gpio-charlieplex-keypad";
> > +        debounce-delay-ms = <20>;
> > +        poll-interval = <5>;
> > +        settling-time-us = <2>;
> > +
> > +        line-gpios = <&gpio2 25 GPIO_ACTIVE_HIGH
> > +                      &gpio2 26 GPIO_ACTIVE_HIGH
> > +                      &gpio2 27 GPIO_ACTIVE_HIGH>;
> > +
> > +        /* MATRIX_KEY(output, input, key-code) */
> > +        linux,keymap = <
> > +            /*
> > +             * According to wiring diagram above, if L1 is configured as
> > +             * output and HIGH, and we detect a HIGH level on input L0,
> > +             * then it means S1 is pressed: MATRIX_KEY(L1, L0, KEY...)
> > +             */
> > +            MATRIX_KEY(1, 0, KEY_F1) /* S1 */
> > +            MATRIX_KEY(2, 0, KEY_F2) /* S2 */
> > +            MATRIX_KEY(0, 1, KEY_F3) /* S3 */
> > +            MATRIX_KEY(2, 1, KEY_F4) /* S4 */
> > +            MATRIX_KEY(1, 2, KEY_F5) /* S5 */
> > +            MATRIX_KEY(0, 2, KEY_F6) /* S6 */
> > +        >;
> > +    };
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 


-- 
Hugo Villeneuve

