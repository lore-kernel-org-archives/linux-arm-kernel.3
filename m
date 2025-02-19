Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC05C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Feb 2025 10:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BCav4SHfE7EQJCkWf7DvjjeXn6VgMu12EYuLJnvgv48=; b=YCjG7tUrUb11/MrJz7MS8zywEq
	l+wo/9YbT4/391lFf/Nk6LVG8QaZ+kyiLGSgCPu17jc22r2VnjrkCIc48lHTpjVsgOKce+L3pw9C3
	5oWSZKbAnETzIXs9jColO1OOYGk+E02AM/MogaplX/DC2P6vbmzkw+nvxnQZi+yjW5ea+qoLGNVNv
	uqUt3LBEvfEhA+vF5KsFuK1SPxx4QdVfjjeS/XJYC6OgiWq/xcSQPWM4Do5+om06sXTHt57qir1vS
	mSb+LQvKSV3RS/M5C95zwIZ8r0LC4SgaSGqCKupKcrJtbYrm6jXZXDo0Hin6ewiy1SCpHTOyLyPsU
	FHs8BVFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkh6P-0000000C5Ll-2LTL;
	Wed, 19 Feb 2025 10:14:49 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkgmx-0000000BzyK-2Zpo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Feb 2025 09:54:45 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e573136107bso5245346276.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Feb 2025 01:54:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739958882; x=1740563682; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BCav4SHfE7EQJCkWf7DvjjeXn6VgMu12EYuLJnvgv48=;
        b=PFd/0DjoJF66jVZUtdqHwn5OYbgdoiG+Yxq5mkDHH+U9hZYXkdgFJOoP0vkbS0Q2fQ
         e//c1Ww1JPt8sReIn4Kup1neUpVKCC5FH6xOgvWlODmWM4XpZ1mMaEyz9SyMRBgQZM3K
         RC3NKxU/rjYM6MjjF2lrug6FigSwqwwNItcKTIbVCjH0eseyJmRG+KshBQN2UapNWBW8
         Xy6pHn0sMkTwAWMUtS315qagUO1V18/3ONwDiOM+1Kwxor3Ic3E6uUNzW+6VIl4U5f3P
         vv6Btqb2zqZD0PnnGbbmAc+x8YfKgNUIChlqWCjYerBVu2GnuQinxGRxx8j1B3tpL5Yl
         WIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739958882; x=1740563682;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BCav4SHfE7EQJCkWf7DvjjeXn6VgMu12EYuLJnvgv48=;
        b=JSAJBKTVckZw1hiYosH/GSuPrLRxxmJLTCJLhpxbI+n0HcL/KZj9plWFPV/h24UV9i
         sXbbzpK3BoyMZNoAREIv8b9BTxM+nzuB4pEE5I20/EJdt+veeqZa8fZB1CVSzPhFO1Ov
         2nOrLGgOt0C6swubyBHO/ViA6G0VE8gOnJwxMbSbp2yn4fuS29E1K68XnUmaOSUTeJgt
         e4kV4gznDBwFCUDLXvY5qiTj0D3yuvxZLraaWLrOcKfuxGrCh276yZteZq+mMxxGNo/C
         lPYQhYi1GtUcL3f1Zpk9XwSFo4wEbeoL8XfTs8LiS9vBcXvcAVCmfXNVdEpKISi/Tyrq
         YEUg==
X-Forwarded-Encrypted: i=1; AJvYcCU2gj4KuHwNQxhy2S5Y15F7E71ZSkgKX/iPn0BZ7GJcYWjO5BxLmSoLgaa/uai+6BvIDSvh/+KjC8YeNrLr8uoE@lists.infradead.org
X-Gm-Message-State: AOJu0YybIUO5t3Kqom0tPoEnP++0Iw4dG5bCYi8RteWBIYmlLgGGrkTx
	O7rGB/cJExAgb5Lr2xo1PtSlOFYIgQkHESJhyCBFXVdYllU37kqPfD/kBwtQ6m/J6wb+tLPP6zC
	pZTT7YqSrUOVB0scfBZ0YV4v1RdA=
X-Gm-Gg: ASbGncuiW4j0J9RQipMkr/NjP+z+4ReftPUEqdRqK8WXSs5gfTsB+oIujoiqaGtZpzy
	OF+nRjhIgnNOlh1ijjDy/s9R5hqyx7X+gLmqOjxPo8gHJG7AI1kx30WBbjXltv0twx5JHquoFfA
	==
X-Google-Smtp-Source: AGHT+IFAsRovKqEPyfeA7p4gUvXbV4eJrMlwT7pqKN/+12P/FiSevR15M7Mr7rEzXhQloaQvHIzmg0pHyi/KhmeP6Fs=
X-Received: by 2002:a05:6902:108e:b0:e5d:d6b8:2317 with SMTP id
 3f1490d57ef6-e5e0a1400admr2490172276.44.1739958882412; Wed, 19 Feb 2025
 01:54:42 -0800 (PST)
MIME-Version: 1.0
References: <20250219-isp-v1-0-6d3e89b67c31@gmail.com> <20250219-isp-v1-3-6d3e89b67c31@gmail.com>
 <16f6d4a2-2102-48b9-a0ae-b8c6595975b8@kernel.org>
In-Reply-To: <16f6d4a2-2102-48b9-a0ae-b8c6595975b8@kernel.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Wed, 19 Feb 2025 10:54:31 +0100
X-Gm-Features: AWEUYZmesv9PAJrRnsNQHdoWoBNxlIk4Jp5agMR2Ng1Yo83bsxbQ8IUxBouljGI
Message-ID: <CAMT+MTR7dhtt3SOMg0K3UakJQftqnc2S-rV41HdHtA+o9aSPug@mail.gmail.com>
Subject: Re: [PATCH 3/5] media: dt-bindings: Add Apple ISP
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hector Martin <marcan@marcan.st>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-media@vger.kernel.org, imx@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_015443_655214_D6FCD53E 
X-CRM114-Status: GOOD (  15.14  )
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

On Wed, 19 Feb 2025 at 10:37, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > +
> > +  apple,platform-id:
> > +    description: Platform id for firmware
> > +    $ref: /schemas/types.yaml#/definitions/uint32
>
>
> No, use firmware-name.

Not sure how is firmware-name an appropriate field, fw-name is a string
that references a firmware file, while this field is an id that is sent to the
coprocessor firmware in order to identify the platform.

> > +  apple,temporal-filter:
> > +    description: Whether temporal filter should be enabled in firmware
> > +    $ref: /schemas/types.yaml#/definitions/uint32
>
> And why is this not enabled always? Why this is board specific?

Not every board has support for this feature.

> You miss here ports or port. ISP usually gets signal from some camera or
> other block.

For complex cameras - yes, but this is closer to a UVC camera connected
via a bespoke protocol. We do not need to deal with the sensor access,
all of it is managed by the coprocessor firmware.

> > +        properties:
> > +          apple,config-index:
> > +            description: Firmware config index
> > +            $ref: /schemas/types.yaml#/definitions/uint32
>
>
> No duplicated indices. You have reg for this, assuming this is index.

There are duplicated indices, see isp-imx248.dtsi in patch 5 for an example.

> All these do not look like hardware properties but rather configuration
> of sensor which should be done runtime by OS, not by DT.

Those are board-specific and not discoverable via the ISP protocol.

