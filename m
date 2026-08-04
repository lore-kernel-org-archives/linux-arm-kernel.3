Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694CDC55ABA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 22:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b5nbb2wT0veFcsSJ3ebk5cldgs5P7RafDN+qnPOZdx8=; b=Dq8J1YWwNCnfHf3+ke4CgmmJMd
	2NjjqHlteHDk8dgdKKP/Fwb4dW+Xn6aFUVA/TUQi0ZGSnOiNE0EpH4QkyPZaejBVce0dB565fonzF
	t3kdd2hEyNhfsn7qr7F1/xOM1a/V+7OZkfWuOh74Mp5o+g5ZDA53NaS88htBE0rEGgnYBkJYjwEKI
	lM77KFWS8RnEsvdSTco32Z7o5ZfCEofoB1BPgs/uLEMWhaYaaywwzaPohkQr8g9gLebRuYMJjjWFh
	+M8Pe7mW6mJmt2rNUQsNTcVJNvohgqC1m924hX4OoQQ9+utx0PZhZBZPZIQILGhydoybipK6vXy2o
	ZmFuD7qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrNR2-00000002rPW-01WF;
	Tue, 04 Aug 2026 22:16:32 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrNQy-00000002rP1-3K8c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 22:16:31 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CB2511A1415;
	Tue,  4 Aug 2026 22:16:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6A0626029E;
	Tue,  4 Aug 2026 22:16:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 129F111C33B27;
	Wed,  5 Aug 2026 00:16:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785881777; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=b5nbb2wT0veFcsSJ3ebk5cldgs5P7RafDN+qnPOZdx8=;
	b=hl60HZvxSebbdFP8LFwxLnRTC+FS0DsaEnKLu7FcpeH1H54P8NxeNlp77Fs5cZhpl5v414
	MAOgH54JjLL+Ytq8D3nKuQo8wFfkHXXPaa145xBueuh2lzzVU+flqfffZLd1x3gvh0PR0C
	2FiCZRaFYvnNStLI3qid5KdKKNbExmNts4yoSiaq10GH/RPpjxRgYL8vxrDV6/pxG6fnt3
	jigga/J7ZXX9ZaHAHyK1+Mg/OR9BeXALLyByBQLAPdzJ8/x8tU8wFUvIjJuGPNt7YBddUh
	GL7u13YiAMBBcuqBQROuM4XPFj2QwqkVhd5N2dgycDfEOc3E/wGAwjFVrBHegw==
Date: Wed, 5 Aug 2026 00:16:12 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Markus Probst <markus.probst@posteo.de>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Michael Langer <michael.brainbug.langer@googlemail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: rtc: Add pinctrl for S35390A
Message-ID: <20260804221612c7cc21ac@mail.local>
References: <20260801-rtc_s35390a_int1-v2-0-f10c99ad1d6c@posteo.de>
 <20260801-rtc_s35390a_int1-v2-1-f10c99ad1d6c@posteo.de>
 <20260803-mottled-pretty-sloth-bf7dbd@quoll>
 <7af047ae0fae27e8bef3d8decdc97a21ee9bf520.camel@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7af047ae0fae27e8bef3d8decdc97a21ee9bf520.camel@posteo.de>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_151628_993978_D6F8AF5A 
X-CRM114-Status: GOOD (  28.43  )
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

On 03/08/2026 23:33:05+0000, Markus Probst wrote:
> > Frequency needs -hz, but anyway if this is becoming a clock, then you
> > must have clocks property and this is simply not needed... unless this
> > is some periodical wakeup call, not a clock? Then simply -hz and
> > property must be more descriptive (frequency of what? pulse?).
> Yes, it would become a clock if configured. But in this case, the
> "clocks" property seems to be a clock consumer property. It would be
> providing the clock signal.
> 
> Anyway, it was added since it was only ~10 lines of code. Looking
> through documentation, using the clock subsystem might be a bit more
> driver work.
> Since I don't have a specific use for it, I will drop it in the next
> revision.

Usually, the clock is registered in the CCF so it is disabled
automatically when not used.

You can simply add #clock-cells in the bindings and leave out the
implementation in the driver.

> 
> Thanks
> - Markus Probst
> > 
> > 
> > > +            $ref: /schemas/types.yaml#/definitions/uint32
> > > +            description: Frequency in Hz to be used with mode S35390A_MODE_FREQ.
> > > +            minimum: 1
> > > +            maximum: 31
> > > +
> > > +        required:
> > > +          - sii,mode
> > > +
> > > +        if:
> > > +          properties:
> > > +            sii,mode:
> > > +              const: 4
> > > +        then:
> > > +          required:
> > > +            - sii,frequency
> > > +        else:
> > > +          properties:
> > > +            sii,frequency: false
> > > +
> > > +        additionalProperties: false
> > > +
> > > +    additionalProperties: false
> > > +
> > > +unevaluatedProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/rtc/s35390a.h>
> > > +
> > > +    i2c {
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        rtc: rtc@30 {
> > 
> > Drop unused label
> > 
> > > +            compatible = "sii,s35390a";
> > > +            reg = <0x30>;
> > > +            pinctrl-0 = <&rtc_pins_default>;
> > > +            pinctrl-names = "default";
> > > +
> > > +            wakeup-parent = <&int>;
> > > +
> > > +            rtc_pins_default: pins {
> > > +              int1-pins {
> > > +                pins = S35390A_PIN_INT1;
> > > +                sii,mode = <S35390A_MODE_WAKEUP>;
> > > +              };
> > > +              int2-pins {
> > > +                pins = S35390A_PIN_INT2;
> > > +                sii,mode = <S35390A_MODE_DISABLE>;
> > > +              };
> > > +            };
> > > +        };
> > > +    };
> > > diff --git a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> > > index f4d0eed98a08..7b3f682ef4d5 100644
> > > --- a/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> > > +++ b/Documentation/devicetree/bindings/rtc/trivial-rtc.yaml
> > > @@ -81,8 +81,6 @@ properties:
> > >        - ricoh,rv5c386
> > >        # I2C bus SERIAL INTERFACE REAL-TIME CLOCK IC
> > >        - ricoh,rv5c387a
> > > -      # 2-wire CMOS real-time clock
> > > -      - sii,s35390a
> > >        # ST SPEAr Real-time Clock
> > >        - st,spear600-rtc
> > >        # VIA/Wondermedia VT8500 Real-time Clock
> > > @@ -105,5 +103,4 @@ required:
> > >    - reg
> > >  
> > >  additionalProperties: false
> > > -
> > >  ...
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 716acfc3d7c1..c85be1eefdb1 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -22696,6 +22696,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/abelloni/linux.git
> > >  F:	Documentation/admin-guide/rtc.rst
> > >  F:	Documentation/devicetree/bindings/rtc/
> > >  F:	drivers/rtc/
> > > +F:	include/dt-bindings/rtc/
> > >  F:	include/linux/rtc.h
> > >  F:	include/linux/rtc/
> > >  F:	include/uapi/linux/rtc.h
> > > diff --git a/include/dt-bindings/rtc/s35390a.h b/include/dt-bindings/rtc/s35390a.h
> > > new file mode 100644
> > > index 000000000000..dcd0ca15f9e9
> > > --- /dev/null
> > > +++ b/include/dt-bindings/rtc/s35390a.h
> > > @@ -0,0 +1,23 @@
> > > +/* SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause) */
> > > +
> > > +#ifndef __DT_BINDINGS_RTC_S35390A_H
> > > +#define __DT_BINDINGS_RTC_S35390A_H
> > > +
> > > +#define S35390A_MODE_IGNORE		0x0
> > > +#define S35390A_MODE_DISABLE		0x1
> > > +#define S35390A_MODE_WAKEUP		0x2
> > > +#define S35390A_MODE_ALARM		0x3
> > > +#define S35390A_MODE_FREQ		0x4
> > > +#define S35390A_MODE_PMIN1		0x5
> > > +#define S35390A_MODE_PMIN2		0x6
> > > +#define S35390A_MODE_32768KHZ		0x7
> > > +
> > > +#define S35390A_MODE_INT1_MAX		0x7
> > > +#define S35390A_MODE_INT2_MAX		0x5
> > > +
> > > +#define S35390A_FREQ_MASK		0x1F
> > 
> >  don't get why this grew. None of these look like bindings.
> > 
> > 
> > > +
> > > +#define S35390A_PIN_INT1		"int1"
> > > +#define S35390A_PIN_INT2		"int2"
> > 
> > Drop entire header.
> > 
> > > +
> > > +#endif /* __DT_BINDINGS_RTC_S35390A_H */
> > > 
> > > -- 
> > > 2.54.0
> > > 
> 



-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

