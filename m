Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFB4310F995A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 16:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNqmvT7YdCXAJg4FUIwYA7EHq158uKGOYNj5DRKvtwE=; b=3t3M4kT4/dWBwwT5buJ6OhOXsi
	IWzk2fKVF7x3VyL1aciP8CDLlhjZpszb7ZaVZD8gNd2BnPXh48c3SddSNqpdeLFnA7FRRDIJcnBzq
	wbXwIM+gU41xWUEnb5rCiDAiYncYoEMCF46ttx5KX0DLvTTZ3/+swHr8mBP8V4dGODln5+AaPQfU9
	QLVZhrEYuCfNduIk9nTpG2ykL7vedMsa7/cZuEw6sa0O4r3e8N0HO3RWFCku+VlvzMAfgv+WJ75e8
	Z+Q3GRJaFHKJU3J/pjeqeuO26SUAIgzl+F4R7xTasa5TRNaaP7aAOcHq23tZXCBs1nbMnCG1DADi6
	59PL8uvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWFI-0000000998x-0cll;
	Wed, 08 Apr 2026 16:59:16 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWFF-0000000998H-3rkL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 16:59:15 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-35d99031e4eso62987a91.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 09:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775667552; x=1776272352; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iNqmvT7YdCXAJg4FUIwYA7EHq158uKGOYNj5DRKvtwE=;
        b=fVYqaTh3dCgOX94mL4lEe7rBid52FoIfNY7OO5d7qbBps9AZ/fjqkNYb5BvJW/lL68
         8BJgnrUMs4z3sNAxQgBLR16bZtjplUcnHwnk8eWKiNCOahJr3f4XgZYJiyaxKOq3M7XW
         ENCof/Jzi4jqTxck/b+Ffb5E2bft8QSHk6/60DxtLu1x4ayDn6H34OHE2djBENOcYZhv
         MXw6I+9e1kROcqgwY6hE2twO7uqaDsKDpETWCvQj5VHMVF+T0iFK9RIBL0JF6oagVqfu
         LxTniWLNupKfF/jEZ6Rdy4MDOTy/so3G9SwuiB4R2xAeXxs3WfrjATpjgZVqphWneL08
         o6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775667552; x=1776272352;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iNqmvT7YdCXAJg4FUIwYA7EHq158uKGOYNj5DRKvtwE=;
        b=pvCnSWTHGcSUrxdxdKur43SkIcSBoBoaVkpx60FRBpl5U3GE5dd2xeLjSiPzdtt7nn
         2w9jlLJC2EW4cg/qJU2WS8xscDFQsuz5PHcuA431MHzSXKPzS/bsT744AhszaoRt05Ne
         095Slc4UYhOHa9BBZYsfvTTX/ChRLQtUJPKQv1nQ5Qm1YkthWQxEKSxMTQlXlCJNGLsL
         2NWLockhPVjYvm1bcdG0IT34+dfkqQZk+T6WtfVslUHAACAh9eoOhk053HMBV7BeF5Cn
         BpJxg6Zo+KHWIt1yav5JoiYTB+qQqE2FAId3IetoiXNSLME59/P+BMRMkwCXqBbgdstd
         3kPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPyzYPa6Or1+9zb9ixjfXR0yLpyMN/26KUFQKklsr7u5VKnLTxbyAszc2vZHr7LZArAa4bu8q/dssPfJosLnHZ@lists.infradead.org
X-Gm-Message-State: AOJu0YxWfDbZxaLQW6Td41a7+w9JfglPrK+UM5AvKhvV1d3TwRcvtZvz
	uBZKPjH8iTkQGz15zbCR/zqf/TlH4Z1HOwBXdCVwDj2FX252hypGWIc3
X-Gm-Gg: AeBDietImlCUrO9Agxu2z05zL0DT7dIC9AzsOv5cNAJoraFw0u3Nqj0eOx+sGKddrCl
	ZR/HZQiLwBSOEtm6Xuzo0gHOYu5m/6KO0JG2UBEt0zsRiZXP04qMRlA8/21wrCryr0jHUqON+Vl
	7TdLSLCgM1cWZ5FI3aK7p3nUctVSwQlRrlibmCiHs7GfQtJ93WpzC3BLcd67DplT+1Fr6phP4tH
	7LW27ixmi/P7El4Det54RoOdX1uyiEtg02p+xzk5eaKQUudE0P0EDhvi3vkxjj7kbzrRu5vlQdN
	VPo6tfrxSSppH5O2C5VOCDOR2Ml01mEXCEt3H5T4N3ZNs2E4LycHpTePTggZH7btJKvMg0AzY0B
	0CZLjZBiUtHCrzhnltqRFNxIfyW9bFE6rYraG/mIeIsVB8gJVba9OQF4qquEa88j3Mzmow7wMub
	TECTAw9oZ+fSTrIO6yk9mVlMXt+qik+eMvFz8kp41P+XiRA0UInBly9FWD4EjCbz6u
X-Received: by 2002:a05:7301:6097:b0:2b7:38cf:c2fd with SMTP id 5a478bee46e88-2d40e9cdf98mr157907eec.26.1775667552362;
        Wed, 08 Apr 2026 09:59:12 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:f3cf:7538:b120:7924])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca760b0518sm22328464eec.0.2026.04.08.09.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 09:59:11 -0700 (PDT)
Date: Wed, 8 Apr 2026 09:59:08 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Heiko Stuebner <heiko@sntech.de>, kernel@collabora.com, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: input: adc-keys: allow
 linux,input-type property
Message-ID: <adaJOEZHHmvZM_cB@google.com>
References: <20251215-rock4d-audio-v2-0-82a61de39b4c@collabora.com>
 <20251215-rock4d-audio-v2-1-82a61de39b4c@collabora.com>
 <20251217-tough-ultra-junglefowl-f1a9ae@quoll>
 <6778765.lOV4Wx5bFT@workhorse>
 <20251217133440.GA724723-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251217133440.GA724723-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_095913_962301_A9398048 
X-CRM114-Status: GOOD (  31.23  )
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

On Wed, Dec 17, 2025 at 07:34:40AM -0600, Rob Herring wrote:
> On Wed, Dec 17, 2025 at 01:57:46PM +0100, Nicolas Frattaroli wrote:
> > On Wednesday, 17 December 2025 09:31:15 Central European Standard Time Krzysztof Kozlowski wrote:
> > > On Mon, Dec 15, 2025 at 01:29:29PM +0100, Nicolas Frattaroli wrote:
> > > > adc-keys, unlike gpio-keys, does not allow linux,input-type as a valid
> > > > property. This makes it impossible to model devices that have ADC inputs
> > > > that should generate switch events.
> > > 
> > > The solution is to use unevaluatedProps instead, which also allows
> > > dropping other properties.
> > > 
> > > Best regards,
> > > Krzysztof
> > > 
> > > 
> > 
> > Hi Krzysztof,
> > 
> > to understand the motivation behind this suggestion correctly:
> > are the "linux," vendor prefixed properties, especially with regards
> > to key codes, generally a bit of a thorn in the side of DT bindings
> > maintainers?
> 
> Not really. Most have existed for decades. New ones get extra scrutiny 
> and often end up dropping the linux prefix.
> 
> > I'd imagine so since they technically tie the DT to a specific OS
> > kernel (though of course, others are free to translate those key
> > codes). And the whole idea of configuring which code is emitted
> > from something is basically abusing DT for configuring software
> > rather than describing hardware.
> > 
> > I'm mainly interested because this is a thought that has been in
> > the back of my mind for a while now, and I'm curious if the DT
> > binding maintainers happen to have arrived at the same impassé,
> > where linux,input-type et al abuse the DT model for something we
> > would tell any other vendor not to abuse it for, but no better
> > solution exists right now to achieve the same thing.
> 
> Not sure what the BSDs do here. It's never come up that I remember. Best 
> I can tell is they just make it a userspace problem. So every possible 
> keyboard needs a keymap file. Though I'm not sure how that would work 
> with GPIO keys as you don't really have a scan code.

Is there an update for this binding or should I apply the current
version? I am OK with the driver changes...

Thanks.

-- 
Dmitry

