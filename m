Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBEE6CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 17:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Hy8PEdE/fLtMOp8zZJDYe1K5v8P86jnmwdVl01gCF0=; b=nudkH7Bu1tE0/pFlqZTBiL480X
	OaEWpfw045311d2iF5FoV+n+vHwqn0Ih6CNG4pzvQFuXs+U8h3MWFJbe7wQgGTnAnobJa5jtvM8Se
	22P9qku72T+tOw6iE9aDJKGWSU2pDPkOToiWmDRkLlfW7z2zg80+76oja9OEVnoWYIWnP1WYAS96V
	51i+GbfcgzfVwoR0mG2OLDDJOPX/siQPSCLslmePPFqFNFSaZeMJUtsHtRVwjqj/SFk3yzVqeps8B
	F5jmVvBYLEkdhOuQqjWq3HvBduE0FIAAg3L8BEuO9SFJl68Ubj6PE80P+D0rxXb8VU9aklu3tlacr
	eHrYjfjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHQjW-00000000NR5-0Oqt;
	Fri, 07 Nov 2025 17:58:46 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHQjU-00000000NPM-04om
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 17:58:45 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-429c7f4f8a2so549355f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 07 Nov 2025 09:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762538322; x=1763143122; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4Hy8PEdE/fLtMOp8zZJDYe1K5v8P86jnmwdVl01gCF0=;
        b=Gj/ye5C4mMun8aJWVHX/sXm6v7whAj2lRr4UdAZKIJBA1aCJYqkoDGRHhUDKR9oaLK
         2bO5zeSSwfqnKRXLUhRFPguE8yIKzfCYXOh2tza61dAV9RXx755Vf0JqN2HZwqTm7gX3
         shx07YMRONhKbtFqvtoikv3269L621XKZ7mJXFCnH3MAAfCuC5HehLkoocSZ3neZ9BX2
         5utBRKVbFiFwfehA9+xdVh6quTf32irzJjOJjIjp+e7BhpskLDE5wz3ExZjlmcjO7hfE
         PXjglmL/S85mi02nPGc1AvVo3TgJ2Ks+Yt816wt80AofMN9C5k3fsI5f7PzRl+JUSjF2
         ZFGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762538322; x=1763143122;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Hy8PEdE/fLtMOp8zZJDYe1K5v8P86jnmwdVl01gCF0=;
        b=plY1mZEZma7PfK6Qrepjwe9DoEhuBcamMAno6gF16cEaaT66TBMLMNapF0DaMi7Uvz
         HBd9Ai4qIvX2dQOazmK+SIsaUCqZvFQ/a9VbycCFd7grQPrXVmy0fS795EKQIea28J8R
         IRsPwhx/iYTq0XsUXWv5fCpjZZoA+Q7zXQ1xtzmiPnPNUGmmq1VRZdY7CPj9nKXCjPhp
         890xAavbIXaocSrE44OMsSf66ZLVj12HJWtKdYYWJTtybbBaOumwHi65JhdPbCPp0O/v
         13KQbBc03wRC0OY4/VwfgHrR5ALj83rrxSt4IVvUiIfmJk0GNcyJw+xAUL2i6uztMQka
         9w8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWABVJqEZVNm7SzYRaRFLGWj7CqHc5UuYDclLJs0zgRo8HG3++MNdqg3D2jpdaI3HwzDCHwM55RNnPZpwLChXZV@lists.infradead.org
X-Gm-Message-State: AOJu0Yzw3rW541Ksn0SByxr1BVLFrnnSdvRRsgSXM95+A7ACPVR5U3J+
	s3q82wOVuqrrNyIvnJczFoLJmHZch0hAn4IEwIbh/RFjfHPO38nQ+1Sp
X-Gm-Gg: ASbGncv+7u7KT/oe67toLJObZsHJ+QSIIS1EYmn8viFE++q1FjhvsXDeCOQypJN2C/g
	H+biAzke+I1STbtYkCXrp3edZpp4eITzKxYiibdKovbBOlnwLPl/Kq8EBj8SAPGZxWL1P5CmcYA
	hOc9FTrckF66cevmy8YWRUXCWSd0Dh0tNu2RzWoUplTu3BND3X6qlR20NO1GjSoJQbJP2/SfkFl
	gBoe5oew2wgWFxgSF59MgxtMhun+IKlbDLI5Ma/NAdYe4ekO9JFqzKSaPFeCt2VdrumJwX8tmD0
	BAPWMJyAJJ8Bql5J0ReE5+aZv8SlCxxLlhm33EcXjHj5aVQaHCg9WTiotGiXxm64lSk0JjlhNtk
	9yq1vMbJLjT5GJK2IpHtf/PoQ/Vo5O54zzVqMLn3HhJqF6bBsQoIfe/8A3FBxB09rFfenvz/hoL
	rxQGfh0q0KkxAs69VMro7J+7cV9R8A
X-Google-Smtp-Source: AGHT+IHxrsG4B2duEE/+GCKG0QyJVFEsIc/yuwXnmYOAcLA/FUrE6rMl803DqisMTH4v+FhxV5j+Ag==
X-Received: by 2002:a05:6000:26c9:b0:429:ef72:c33a with SMTP id ffacd0b85a97d-42b26f4be9dmr2506029f8f.3.1762538322141;
        Fri, 07 Nov 2025 09:58:42 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477640fb801sm45371425e9.11.2025.11.07.09.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 09:58:41 -0800 (PST)
Message-ID: <690e3351.050a0220.15e225.cf82@mx.google.com>
X-Google-Original-Message-ID: <aQ4zTvBcOb-258Gg@Ansuel-XPS.>
Date: Fri, 7 Nov 2025 18:58:38 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Sean Wang <sean.wang@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 4/5] dt-bindings: pinctrl: airoha: Document AN7583 Pin
 Controller
References: <20251106235713.1794668-1-ansuelsmth@gmail.com>
 <20251106235713.1794668-5-ansuelsmth@gmail.com>
 <20251107-washstand-motivator-c5e5e5d30dae@spud>
 <690e311d.5d0a0220.2f18f8.2b28@mx.google.com>
 <20251107-jasmine-unarmored-e3f5d544a1b7@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251107-jasmine-unarmored-e3f5d544a1b7@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_095844_077419_DF8CD610 
X-CRM114-Status: GOOD (  20.45  )
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

On Fri, Nov 07, 2025 at 05:55:43PM +0000, Conor Dooley wrote:
> On Fri, Nov 07, 2025 at 06:49:13PM +0100, Christian Marangi wrote:
> > On Fri, Nov 07, 2025 at 05:24:21PM +0000, Conor Dooley wrote:
> > > On Fri, Nov 07, 2025 at 12:57:07AM +0100, Christian Marangi wrote:
> > > > Document Airoha AN7583 Pin Controller based on Airoha EN7581 with some
> > > > minor difference on some function group (PCM and LED gpio).
> > > > 
> > > > To not bloat the EN7581 schema with massive if condition, use a
> > > > dedicated YAML schema for Airoha AN7583.
> > > 
> > > You went to more effort than I would have here with that conditional!
> > >
> > 
> > Well it was suggested by Rob and it's honestly a copy paste of en7581
> > with the relevant thing changed.
> > 
> > > > +patternProperties:
> > > > +  '-pins$':
> > > > +    type: object
> > > > +
> > > > +    patternProperties:
> > > > +      '^mux(-|$)':
> > > > +        type: object
> > > 
> > > What's up with this regex? Why does it allow either - or $?
> > 
> > It's to permit either mux-* or unique node name with mux. Pattern is
> > also used by mt7622 or other schema. Other use mux- to require a name
> > after the mux.
> 
> Ah right, because you can have the config properties like drive
> strength in the mux node, so sometimes a -pins has one mux node (mux:) if
> all pins share settings and sometimes there could be multiple, which
> requires a suffix.
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> pw-bot: not-applicable

Mhhh why not-applicable ? :(

I rebased on top of linux-next, did you spot any conflict?

-- 
	Ansuel

