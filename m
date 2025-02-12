Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCF3C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 17:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=beLRCGOxxX9cpZ21JwnULP9EhaY8G7Htxn7RQieYr0k=; b=CjeRgg3QgwjDQNq5odpmx454Hu
	a59G9+6JXTYfVw8eh7yBK9+tZoJPJjvi6VOY6q2pSMl3X6u4y5b4utUctWD7YfTaZXwkizKSEyIoC
	dcZQOvtMiZJ8lp8QYD37te9IOHJFCbmTR2+9SxcA112G+C8rWtkO2fxQOXquBc5XX9GoOZl0MgUSE
	3SvIhm11jnwkiz9U9ODHb0Khos0n+Jm6crm3JFX2l0xlmUUmqKjl8hSlqZ2mEiC/V12ovxe13qwyP
	D0OxLjeSfUmdY+I9PDCY/JweEz68pP+A42TEVZ8NARdfuSyLozAaO/CqZtNhT7eyiZY1cd4GiiA7/
	uv/bL1vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGnQ-00000008Mwf-0fF8;
	Wed, 12 Feb 2025 17:45:12 +0000
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiGWI-00000008Jpv-3TVu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 17:27:31 +0000
Received: by mail-ot1-x329.google.com with SMTP id 46e09a7af769-726f4410a2bso578366a34.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 09:27:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739381250; x=1739986050; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=beLRCGOxxX9cpZ21JwnULP9EhaY8G7Htxn7RQieYr0k=;
        b=XtVynCO1aSFNmCcN8dGdkQ3ku5UF3Bj5PcE+1qwNChbJtiT8zZ+OqxwZjbrD5fgE+b
         7t11iESi8wr27/WoqYqTCqgNvQgCZ6MDePOBki5r7hxMiPqxYPHhTBuhjB9xJWAnU1ld
         g+xBbWYgQcYpvldRPaArmNapT8XOeRXTzcFMLd9kFLbrwg7H1/WSlv8AkM7ymrj85Dyc
         z+sqwGdN1JnJpih5PpvMsrb6LsLutKm0CvuOWlelCtwl7Wwf9RjieCPpiMgk8jHARZ7l
         7Ylm7r+F/lvoN5DVCnmfHhh9585Kg4IGbrUkgqQpQ5nEI7W46u2J1eim1pz0Dnp7yfSp
         rU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739381250; x=1739986050;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=beLRCGOxxX9cpZ21JwnULP9EhaY8G7Htxn7RQieYr0k=;
        b=I1KVXSPYxoYuRsGjUf4iLQundX8v/BLT1jr7h1HqtzTXW4RJB5AFUJUdkKdcHyKs2Z
         htd9q9h4WH3hTsF1Plzs6zjj1u7TaDyUEzgaONz5cBskSxuynrZ/BFSBYwv6X5HIAGp9
         ipwcpGuCgTN4gWJ7/UQnSSKw6dExZ3PpkR+yErMJOiRJXOEJczM8BjiEi9lIPelDQQ35
         +nJEnJORl3aPNv3xJJ4EHnQDbS6W9odESCEwCTy9z4bSCc9C8XdoBffY0eTvlxiRZmK5
         z9AIbkIDOFmmfNHBovdoEp8Q6YJeTcdWxadvNdIxMHKnnOatSJsvyr/ua00iNEOPigHw
         Co7Q==
X-Forwarded-Encrypted: i=1; AJvYcCVWhM+zZJquPOPk8MVrQGlkS3T+Old5+lCSp1uax10u0cJ88awsL5C6dIPLG5xMB4pmW8A1ubiWfeuNIP+MxQfn@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6N/uuy4rzl84bXF03wNrDZT6PPr+g326NeG3YR3+IMUyHeWq6
	GMuj1liazmN+6SeR2jdefrqo9xbRODnH/d19uGsQhayY1xSWpaFw
X-Gm-Gg: ASbGncsOWDLPy5kMn1d2xcjnsSkMsR61TWWKCrjrE7JosfN3hSq/jy+WL86U74zSCLq
	yldzSxrQODG4iry2ZBVqxW8sQduY2VJIQzlluHuPnD1T8l5yBwn2Bto5Xv1E1CvNZTjRbCpT9Mf
	5K9ZNEdckFYr9ky6Bjz4Oyh9je4Y0n+Rpo5VdtkmsQb7Vu2K4IPpHXia052W5LMlZnlcntopXTB
	0bsgcq0QUTXtuWH5BYpfBVdx1mlMR6RcrS2LRWV9kPLZwvP8xXvjCSiGn6rIxSQftfGJM38TWzr
	D1jDupbIlN+D3zSTrJLmfw==
X-Google-Smtp-Source: AGHT+IHQ+r/B4g2h4U+MDj6Kx5Km7Y0OHx/D1NpwgCExrt743LdxVlv3VXUZQzCcXj0qf+dKJIpoeg==
X-Received: by 2002:a05:6830:4107:b0:726:eff2:9b57 with SMTP id 46e09a7af769-726f1ca8939mr2600982a34.13.1739381249618;
        Wed, 12 Feb 2025 09:27:29 -0800 (PST)
Received: from neuromancer. ([2600:1700:fb0:1bcf:511b:97aa:dc6:7ad4])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726af932f78sm4722036a34.18.2025.02.12.09.27.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 09:27:29 -0800 (PST)
Message-ID: <67acda01.9d0a0220.22ffaa.f02a@mx.google.com>
X-Google-Original-Message-ID: <Z6zZ_2u-MrZUZnKF@neuromancer.>
Date: Wed, 12 Feb 2025 11:27:27 -0600
From: Chris Morgan <macroalpha82@gmail.com>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v5 19/26] dt-bindings: allwinner: add H616 DE33 bus
 binding
References: <20240929091107.838023-1-ryan@testtoast.com>
 <20240929091107.838023-20-ryan@testtoast.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240929091107.838023-20-ryan@testtoast.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_092730_867757_17EF2F7D 
X-CRM114-Status: GOOD (  18.11  )
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

On Sun, Sep 29, 2024 at 10:04:51PM +1300, Ryan Walklin wrote:
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
> 
> Add a display engine bus binding for the DE33.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> 
> ---
> Changelog v1..v2:
> - Correct DE2 bus enum to reflect fallback devices accurately.
> 
> Changelog v2..v3:
> - Separate content into three patches for three separate subsystems
> ---
>  .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml     | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> index 9845a187bdf65..ea7ee89158c61 100644
> --- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> +++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> @@ -24,7 +24,9 @@ properties:
>      oneOf:
>        - const: allwinner,sun50i-a64-de2
>        - items:
> -          - const: allwinner,sun50i-h6-de3
> +          - enum:
> +              - allwinner,sun50i-h6-de3
> +              - allwinner,sun50i-h616-de33
>            - const: allwinner,sun50i-a64-de2
>  
>    reg:
> -- 
> 2.46.1
> 

Because the h616 uses additional reg values, we need to change
      reg:
         maxItems: 1

To
      reg:
        minItems: 1
        maxItems: 3

Thank you,
Chris

