Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA61CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 16:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v+lassDmCrGUqK1j75W06mPpLprXWJRC5SDVpvwTaVY=; b=N2aa9fq9naXspvR1NJWLCU89ye
	uc2dTyBKJRD6tzpE2Hu9xiL11iy5zJw+9vpI+9AFTzhGjjO3n9X8PaT9AdNlpe9DoucC0aZNBJfYr
	7kyKLVO8G8Gff3yGOChIs4kfbhdcD0NesHHmAHTkGXpqo9Nx9IgyjJTTfFZgYWeqsQmHKW5vmgKWF
	M7izfKMmO1h5UAI21kw1lGmHCanhEWbfMhB6KuMbegx/+UYM4/jKDYR6UJiVS2tTI8f1imMnVlsMS
	G23o9OybwJlzZrIgzmiVTWLmqKS19F2qAC9EFZZLXyjfgXsPMoyS0wZsBwK08ao8eZD2jplS7ll8W
	lz7yhZ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1oUo-0000000AyLV-19pr;
	Thu, 25 Sep 2025 16:07:02 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1oUm-0000000AyJD-00zz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 16:07:01 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-3f42b54d1b9so1396847f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 25 Sep 2025 09:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758816418; x=1759421218; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v+lassDmCrGUqK1j75W06mPpLprXWJRC5SDVpvwTaVY=;
        b=Jo8u2IxHJxP/SFbH1nKYTeDSgYECDmv9AiansSjNyIrPsHbL1FlMT4UbbArip5Z3jC
         XCKg9YAEOu4uKKQW1Rs2mACsCcWrFcLRQlCsTrIieavr5AbzkMf/T+9CyllOn61EWbGA
         hmCeE9J6JKqQj43t3dc5I59DkTfGaqWsBFNGY/Bzz9AEV82dMddl4ANxSMj3q/JQISZe
         9aDj80j2QeCfquPlTkaPDCfsasH6XtQq32LeEXBmeK/CLDMfTnLY9HewpaIx9mtGJU4x
         lixMrQ2KXjIZEOW0dpBj7UMtn1iDRAufPl2nQ8q+HnydugITa+0zEj89eDas8yg2aq8d
         X06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758816418; x=1759421218;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v+lassDmCrGUqK1j75W06mPpLprXWJRC5SDVpvwTaVY=;
        b=Oa2K7RhZU1sNsFXn4dTRyy5RuJ9CD5rrx95gR/Ud9mmANc0ORTrZqJrWPlQygSx/vf
         wpa/qbBmUpT9KZuD9rUpLkVZ6oeLG5KbBfz6Xzr6IRX1UpaH/6EC5VRNN7jLl8tIlL3G
         0tmjWJbyOAX7+RX2EkMRE+Qo1d+rxHOwKfxxm/42+LR5QdzJI3iyJY5V5M6gUdPI7T2d
         YprKBqNeobtkHHI4ssRkSUvLH9dAkor3MhVC//iOKuKPao2I23tQSAeNrBtxleNTy/4/
         h9OvDWIIcLzpqLivsrRWujgO/42OFyiO/8zSm2q8cIhYXDXPOfQCrmlkdJQFr4aU9J8d
         TZ9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUqUdnrA7SMsUYchaK7HuUx6JqdFL3xa8SxEpsRWHC4q0n3jeU5A8iJ4r6GdQOgkjlAcqyvGKEpZQML6wF4PjH/@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv6FqKebHsHM5IMFMstWlHOfwJZVJOu7i9gR1kXLPYGNNWscoo
	XKxM+9AtlcTvgwerfibe0jNNq4SgmxjkKxIzgOBdgDaiujoa3zK1xDeO
X-Gm-Gg: ASbGncvIJh5x5Buq84QuE8YyLa5CT4l1gro5ar54oeO+f3RSzFqWHnVoFEo5SWcXiHd
	s/7Uzgbd7SWemxKoHS+ZlEXGBf8ZZAaRR5/nI+m4PYtFFfo6Yff4YPYaHFCmmzuFqPH+FaK8z2k
	2jWDUFzPNmYFfQYxrQk5pBTK4ExXiZAfVhLT09AMe2uGw7nUtWkn75gOvA8jwyPkLtwpUYSU0+A
	FDSIJXhKTC+tId2olrYDX8jCdxG912OEn5+p2V9bjy91ERcv/ulzF/eO2a5ekbresmtV5IbZ/Qk
	NniOk9lxcdzc/Fv+tUDRbxiZhSlB6JHS/BkC6dkCy6KI1B/PxBbDMqIh6lxyjMPjx4zcsWHE22x
	cozHIRpXpLQV5jl/xLMgEze8IVDN83sbUV9gEagbyogPKOapIQc1TjUnAJodgtg/ypO1eYT0jdm
	COjyej
X-Google-Smtp-Source: AGHT+IEHMIJU9u8ueZDndaal17u8mfKe0TgyHQU77XQdzJ/EbxOIGOMX4Q6Ld8eqXuhgbWlq5qhIfQ==
X-Received: by 2002:a05:6000:2486:b0:3d4:f5c2:d805 with SMTP id ffacd0b85a97d-40e4458c89bmr4101481f8f.16.1758816417869;
        Thu, 25 Sep 2025 09:06:57 -0700 (PDT)
Received: from Ansuel-XPS. (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e32c49541sm20807025e9.5.2025.09.25.09.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 09:06:56 -0700 (PDT)
Message-ID: <68d568a0.050a0220.19f5c.8cb6@mx.google.com>
X-Google-Original-Message-ID: <aNVonSpnm70dLOUL@Ansuel-XPS.>
Date: Thu, 25 Sep 2025 18:06:53 +0200
From: Christian Marangi <ansuelsmth@gmail.com>
To: Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: mediatek: Fix wrong
 compatible list for hifsys YAML
References: <20250923201244.952-1-ansuelsmth@gmail.com>
 <20250923201244.952-2-ansuelsmth@gmail.com>
 <20250924140347.GA1556090-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924140347.GA1556090-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_090700_056819_16083FE2 
X-CRM114-Status: GOOD (  22.93  )
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

On Wed, Sep 24, 2025 at 09:03:47AM -0500, Rob Herring wrote:
> On Tue, Sep 23, 2025 at 10:12:29PM +0200, Christian Marangi wrote:
> > While converting the hifsys to YAML schema, the "syscon" compatible was
> > dropped for the mt7623 and the mt2701 compatible.
> 
> Is "syscon" really needed? AFAICT, the clock and reset drivers don't 
> need it.
>

Ok I also searched downstream and can't find any patch that would make
use of syscon. Guess I will replace this patch with a patch that drop
the syscon from the dts.

> > 
> > Add back the compatible to mute DTBs warning on "make dtbs_check" and
> > reflect real state of the .dtsi.
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  .../devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml | 8 +++++---
> >  1 file changed, 5 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
> > index 9e7c725093aa..aa3345ea8283 100644
> > --- a/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
> > +++ b/Documentation/devicetree/bindings/clock/mediatek,mt2701-hifsys.yaml
> > @@ -16,13 +16,15 @@ maintainers:
> >  properties:
> >    compatible:
> >      oneOf:
> > -      - enum:
> > -          - mediatek,mt2701-hifsys
> > -          - mediatek,mt7622-hifsys
> > +      - items:
> > +          - const: mediatek,mt2701-hifsys
> > +          - const: syscon
> > +      - const: mediatek,mt7622-hifsys
> >        - items:
> >            - enum:
> >                - mediatek,mt7623-hifsys
> >            - const: mediatek,mt2701-hifsys
> > +          - const: syscon
> >  
> >    reg:
> >      maxItems: 1
> > -- 
> > 2.51.0
> > 

-- 
	Ansuel

