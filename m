Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C3AD6552D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 17:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6rC4JORljy68YEdx8irUeLm2zmoqEL3AApISoooOchM=; b=2otzIIAlN3UTAHBa+xGu7D06Lw
	o8A2+oXTyTIjbFC4zuBf7vUOWO1kcBJiIo246okBUAnGXlwKGtX0DeoEXXJ6Gm9avj2KBEBqF3I0u
	HAAzcIu55iS/i7Gb/slCJeObU6VTaKdDaUU+MxykZzMntR9RPj51r2GsWJa8BhPF/CK59jTh46eQR
	P8mH6kuvxcscaAmD+8Wd0ydI68cpqvfx6NHsVI5UcsgfM0BqxK33910ZZOcsbArWJ0HOE23EoMD4J
	vp8SinT0hc7BnSq9orVsDFWmh2BjWNoXbEBMarLIDt8XCxLaHWPdtpsF4r65A7GPF1x4LiWybNYG3
	h3yxwzGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFyx0-0000000BF0K-3Efo;
	Tue, 26 Nov 2024 17:02:10 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFyw3-0000000BErz-02mk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 17:01:12 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-6ef0c64d75cso25004267b3.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 09:01:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732640469; x=1733245269; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6rC4JORljy68YEdx8irUeLm2zmoqEL3AApISoooOchM=;
        b=j2VT74tc1W6j/GEyJq8DTgXduo5/w4/vK51MBDiA7NF1X910/xF2p9xI+Kwo4IqjPR
         fKAQT9VHeEOl3UYy3JwmX77JjST472NEkL7PjSTkR9TzGcnoVwM2Tzk/o2WIZ5mFT7gE
         gnI59ypHpXBwXqx09SpBEHQVDqVmWfFZnnr9GHw2sIxrJzWoIYPbOQyvSCcsvNjP9bde
         f3R3V7rXBfH60jYS5unT22iRbUR30EreOnKKiGGjfrHiVcxXjJtGTpL/S7yHUpBvADVW
         CEp6HDHKTtDZ7sSS7n8ZuZRL+4CWV1ZZyyS4C07LWFmTQD4DKJGoWqCf4u0KtaiHPwIk
         +spQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732640469; x=1733245269;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6rC4JORljy68YEdx8irUeLm2zmoqEL3AApISoooOchM=;
        b=hC2+CAilrRuVxlwPUAafIVBdEgz+CNsr4tI3IfVkrTQidQSI+BMzUZhGMbShha9Or9
         eD1BQZCl5a6cyoEl9oIMOJqx/Y+5C3yOc+M8iy2jvdI4CbRYcl10zq8cRk07yEbrDg19
         E72OdOQZv0IMMSs7v6fQrWSUnmBLV13I93ksI3UatCJ+AabuAmYxQJoa8o1nypyiuplD
         Y4Mg7jyfv5sYnXJghBV8I60oL5XpYIhHXL5pRuVl2xmJC/ioNJWGPpQO9FdMk26/pbcW
         Zq+P3Qzn5BLsXQ3tiyEDyTNR7oHm5gsWRjt3bd167EEiIq7w6fKW5jCYImvrB126jGBq
         UIVQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3QiH5AL4XHoVAuoRzZXWN9Ib+qWqfIUKNddVqjDPh1O5rwCAtLVY2m//9MN7qXwIK+SB3Ns9WeObRjjoNUqLG@lists.infradead.org
X-Gm-Message-State: AOJu0YwJwpWrdAovomj5pWa69LpU21iesT+9nkEcYoNzGsjKrRjjRHl7
	8aAQBHGF7FkoRn0GpFZ/sdd+kGIWu4DIMaYITcztDYlGdP8SRzeGdLAPVauYMu2BMkezPexU3Hx
	rhfCo2yDdJ7dlhwkl7DxXeVf/fqA=
X-Gm-Gg: ASbGncvgrFTan2os8Jfj/PllOXjxvQoqQnfVEoRc1ZmYLfu4PluvXHSPz61ZvnfOaca
	MNpUx7USm0s4BVysVjMmYxxkhfUDtgFEL
X-Google-Smtp-Source: AGHT+IFd396UsokWwA15Q5p/KFcRLABdHgY43zyTynmP3tmYwQ6jofpQFOVNZv8hTAfYU9pttSvOZX2EXzH2X5cAsqw=
X-Received: by 2002:a05:6902:140b:b0:e35:dede:fe02 with SMTP id
 3f1490d57ef6-e38f8bf5ae0mr16167825276.44.1732640469435; Tue, 26 Nov 2024
 09:01:09 -0800 (PST)
MIME-Version: 1.0
References: <20241126-adpdrm-v2-0-c90485336c09@gmail.com> <20241126-adpdrm-v2-1-c90485336c09@gmail.com>
 <050d1398-cfc2-4921-b82a-95eecbcddba4@kernel.org>
In-Reply-To: <050d1398-cfc2-4921-b82a-95eecbcddba4@kernel.org>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Tue, 26 Nov 2024 18:00:58 +0100
Message-ID: <CAMT+MTSwCf=iwmD3t=E7T81K_d+o-5XpCxov9fk=_oUnwooA-A@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] dt-bindings: display: Add Apple pre-DCP display
 controller bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_090111_047320_81C86CF9 
X-CRM114-Status: GOOD (  14.45  )
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

On Tue, 26 Nov 2024 at 17:46, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > +allOf:
> > +  - $ref: dsi-controller.yaml#
...
> > +patternProperties:
> > +  "^panel@[0-3]$": true
>
> These look unusual. Is this a DSI controller? If so, then reference
> dsi-controller. See other bindings how this is done.

This is a DSI controller, as referenced above. Those properties are from
dsi-controller.yaml

> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - apple,j293-summit
> > +          - apple,j493-summit
> > +      - const: apple,summit
>
> Summit tells me nothing - no description, title repeats it, so I suggest
> using device specific compatible.

The j293/j493 are the device-specific compatibles, those are chassis names
for the specific laptops the panel is present in.


> No, these cannot be true without definition. Again, please open existing
> bindings and use them as example. You probably miss here some reference,
> but max-brightness for panel is a bit confusing. I asked already and did
> not get answer: isn't this backlight property? What is this device -
> backlight or panel? If panel, then what bus?

Per my response on previous version, it's both, kind of. This is a
self-emissive panel on
a mipi-dsi bus, which can change brightness in response to mipi dcs
backlight commands.

