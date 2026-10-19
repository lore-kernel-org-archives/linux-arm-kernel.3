Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C52BCCF2E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 14:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6PLBPDXxkh3JA0G8W5MUw7ro8kFkYJAvC/ayKENpzFo=; b=VjYcABRFKOQZ48zMbCZbLahED/
	zYY7WHLTCnaflEcHKPWzI5IyH1myOe8MYJX9pnys2IdmjQD3Bm8LJCkvhQgvdNdhFC+S5P9Jxg3VV
	OYRZZD0RA2W9L9GyBrk8pQ+ImBNLEBLzXRjhkNbg6IMGn5YPwA7Er2AP+F7bWsRWdtbeZslL8xTIl
	L6Q3hkU9n+5dd6oNjTkMrQ9Dl4hL0NAyr18AlhS0KdYJFnc3fHRAf1uU8VyakNTh14mEb8FpEr9Tl
	9dqzJwTXHfDoTl1fpc0pcDS0wbb2jYcQ0cMXzfmKwH/scJx8kJwS4eoo4VFj4i5rHrjFnwMzOwgZy
	WB1lYBkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIoBT-00000007iso-1Dtn;
	Mon, 19 Oct 2026 14:17:51 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIoBQ-00000007irl-1SXf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 14:17:49 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4j7d150VHmz8tVt;
	Mon, 19 Oct 2026 16:17:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=timmermann.space;
	s=MBO0001; t=1792419465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6PLBPDXxkh3JA0G8W5MUw7ro8kFkYJAvC/ayKENpzFo=;
	b=d9qmCoZwS9DveT8hVG6HQp79Uzj2L3tD254UNI9UmriRArjVLik7wgmIg6MHc6dX74SNz+
	0BvIm3XNz4IVArbXEFWNyhzfbWeeDMwOqXwKx1pCr6YiP8/R2O+vc8VAJSjf4FT1QusDwi
	XhyWBuFbiYfzawiua/wdgeLNQxlfiWbeTdeuSxS+G0TtB8bV9Eu4dzrPhbHVDAp5JAzDRz
	S7dFgTFOJeAioa5fzCauvIp4VuYNSXVf43dk9JUrn96vOXathyLqcJjhgc92cjXD/87RCO
	wdkDQS6Nl7/7EBTzPmpDYHCUkbOhkdXUME9mRtOvUJmD97CD/gjqmbJ+P3f5+w==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of linux@timmermann.space designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=linux@timmermann.space
Date: Mon, 19 Oct 2026 16:17:41 +0200
From: Lukas Timmermann <linux@timmermann.space>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
	Lukas Timmermann <foss@timmermann.space>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: input: touchscreen: samsung,s6sy761:
 Add S6SY791 and reset GPIO
Message-ID: <atYlyqHToGjAr22T@archstation>
References: <20261011-lat3st-google-raven-touch-upstream-v1-0-2a9f55159b9e@timmermann.space>
 <20261011-lat3st-google-raven-touch-upstream-v1-1-2a9f55159b9e@timmermann.space>
 <0a486a08-8d6c-4ca5-8a54-e7499630095c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0a486a08-8d6c-4ca5-8a54-e7499630095c@kernel.org>
X-Rspamd-Queue-Id: 4j7d150VHmz8tVt
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_071748_530853_7D58F932 
X-CRM114-Status: GOOD (  19.79  )
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

On Mon, Oct 12, 2026 at 01:30:48PM +0200, Krzysztof Kozlowski wrote:
> On 11/10/2026 14:44, Lukas Timmermann wrote:
> > S6SY791 is the SPI-based counterpart of S6SY761. The register map and
> > commands are identical for the subset the kernel currently implements.
> > Therefore add S6SY791 as a related touch controller.
> > 
> > Optionally, the reset line can be controlled on some boards,
> > such as the Google Pixel 6 Pro (raven).
> > 
> > Also reference spi-peripheral-props for the SPI bus properties.
> > 
> > Signed-off-by: Lukas Timmermann <foss@timmermann.space>
> > ---
> >  .../input/touchscreen/samsung,s6sy761.yaml         | 37 +++++++++++++++++++++-
> >  1 file changed, 36 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/input/touchscreen/samsung,s6sy761.yaml b/Documentation/devicetree/bindings/input/touchscreen/samsung,s6sy761.yaml
> > index 1ffd17af3c53..d24f35038934 100644
> > --- a/Documentation/devicetree/bindings/input/touchscreen/samsung,s6sy761.yaml
> > +++ b/Documentation/devicetree/bindings/input/touchscreen/samsung,s6sy761.yaml
> > @@ -8,13 +8,17 @@ title: Samsung S6SY761 touchscreen controller
> >  
> >  maintainers:
> >    - Andi Shyti <andi.shyti@kernel.org>
> > +  - Lukas Timmermann <foss@timmermann.space>
> >  
> >  allOf:
> >    - $ref: touchscreen.yaml#
> > +  - $ref: /schemas/spi/spi-peripheral-props.yaml#

Should I also hide this behind an if-else? 

> >  
> >  properties:
> >    compatible:
> > -    const: samsung,s6sy761
> > +    enum:
> > +      - samsung,s6sy761
> > +      - samsung,s6sy791
> >  
> >    reg:
> >      maxItems: 1
> > @@ -22,9 +26,19 @@ properties:
> >    interrupts:
> >      maxItems: 1
> >  
> > +  reset-gpios:
> > +    maxItems: 1
> > +    description: GPIO connected to the reset pin of the controller
> > +
> >    avdd-supply: true
> >    vdd-supply: true
> >  
> > +  spi-max-frequency: true
> 
> Drop
> 

Noted.

> > +
> > +  spi-cpha: true
> > +
> > +  spi-cpol: true
> 
> These two should be probably required for the new device.
> 

Thanks.

Best regards,
Lukas

