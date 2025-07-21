Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0048BC83F27
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 05:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pTbqmd/pDrisqN9r4zUGvC27ftvuz5/Vq0UCrl06Tzw=; b=WW0Jzd92eTIrxd6sYS/L4ft9eq
	tDp3UuvoHvgPDAW6uZOikxDdI5Z93DMgC2tyJj/HtywGtl/yNF7AMrZVFxmmqKg0bz8QfjE6Cbtyw
	W4Hega5TeBdAIFng1njHbPLjvmPtXcbUesgChwO9PMaCCAUuTcHo1vBVhVpLjWVxlXJ1zRDkvzf9p
	TZsWjz7F8lISyfnMbitldXKXU9NRmGNsCqFwVSyLTy5f+ziCM7E4OLMZsb0EOGvyTgxUTyti6dZjW
	Z3yrkpLxsflv3FYTCRmJ5lk/MZ+rANwAdBbtdb07bXP359xW8QNFkh18Jk698jt4mocM4w6SZK1PG
	DkQZjriQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udjX8-0000000GJGP-1Ahc;
	Mon, 21 Jul 2025 05:57:54 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udjUi-0000000GIz7-1P5W
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 05:55:25 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-75ce8f8a3cdso299068b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Jul 2025 22:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753077323; x=1753682123; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pTbqmd/pDrisqN9r4zUGvC27ftvuz5/Vq0UCrl06Tzw=;
        b=MMEytYqXSaDaUiizM1ICbp+OqlMnbCnavAqKVSRj6p2hVFEmDvxTmdqViUe5nPOBdl
         9z/6+fMRf4yWyEaM1xoHkEfpWbFLjn0BMzsreYhp6xbErg/mPTdIObZ30YGoHcHguf07
         IdrGyzYQb+a3F6VKJNER1miNfYGUu0Ay0pKuY5x9pXhRjkCoU5J7zlEt1ENcxRYAHmaR
         h9yZ+pA5sRjFwEsq5AV6M151S6kqgvZX3qSqXaucrIMTzWZYqwCY6YBdVZeDLgROaD2V
         ADK7tIXwIlyWkfhhoxW+E6Au1ARkgy7cNjPXZVpY60pjQYmBeZzHpIx2xYvmF0LqFV+f
         wy5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753077323; x=1753682123;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pTbqmd/pDrisqN9r4zUGvC27ftvuz5/Vq0UCrl06Tzw=;
        b=Xz1k8T+3uvhBQi3rH0j1DshVws40Etu+OYRmxm2kWgZYMkQM6M0qxaez63YPOinAzU
         V9akJmvAxHX+XXXOeZBqfj2dznsCdcsv5xnon2EhFmbhZ4HA1Yo+P7z1aZ7lIzE+Yqnf
         4OqlFhH210QA2emsw/hV4D3nVUUsfMJjSRlrpIqaogymsv+vGmvYujvG023Quw9WmfOP
         lRhz91TFsBe9A0K1Be9+o3JSavHW+yrb7XHvt5gZFTpeNr+JlqxRmBM3OX7FOZwHQSd+
         UmiZLkGSuEYpkYzbvvQvajMhXakRsOKecrPjGVHSWzghiV2Y6WCalKt+2oy3zyGjtpIQ
         rMtg==
X-Forwarded-Encrypted: i=1; AJvYcCWlG/PdzpQ4aITnkb5l5Rzb/0CR4QAvEzoR47vX+H7VKYnzHfDLRsLRnXSbQcxfp9/fk5BdAF3sR0y8gYP3J3Il@lists.infradead.org
X-Gm-Message-State: AOJu0YwAMedk+uqVdXOhF9iKhmUQ0IIBqTVXKT32X9vImS4I8iUL9fYW
	4pfdG/AQBMLMFcdWWTdm/dTxROvI0OUhohtVWACOhHQ79a1OSW6wO+r2YYdbgVdL
X-Gm-Gg: ASbGncvBjl2lTBkJG2OY8mOTy/+20Iy7KpDr4jN+WMG/jEK7Ju9+V0+IWJ6S5AOdUNo
	DqY+QTsGTNHkwjcFL6Isoul27YYfzGEl8DCKmaXxPOSimO8K3GvQ/G5cKbTtvT3c2wbsPpx6ZMo
	9/6y4u7+CUv1oJJhkW7qlSkVBzD3hEGQtpDy2QpFJV3vujltZo0OVYD8odqp8u/GrCaAmCllVrQ
	cCDejZ2BtYbKfxM79Rsi72I+kecGYvbfR1+q5XSghZxu7JSwnYH/ivfiIfdQKGRLrHlhGxgCs4Z
	yFNymmh/doLLPSgqQcfFVUGU8+7GmNm6ohKnER8i4v6//K4y6qyOVIvX1V42kdd/989x5JvBh5F
	doHsOVCWe5eVe3pScV5Kyky9na7mWJGQOiAd46nHHSlRPYrCG/NtDQOmgd0CSIqm2bHvdwMp1Ld
	Y=
X-Google-Smtp-Source: AGHT+IFKnAKH9LL3fu6dCh2WrvJAAXiTbjHR2Kk8Tffqoygfy2DvBPBBXVdwIstByROSc1BOjkXlvQ==
X-Received: by 2002:a05:6a00:3c8e:b0:748:2e7b:3308 with SMTP id d2e1a72fcca58-756e8773a2amr27457074b3a.6.1753077323016;
        Sun, 20 Jul 2025 22:55:23 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c89cfac8sm4939060b3a.35.2025.07.20.22.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 22:55:22 -0700 (PDT)
Date: Sun, 20 Jul 2025 22:55:19 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>, Tao Ren <taoren@meta.com>
Subject: Re: [PATCH v2 5/9] ARM: dts: aspeed: wedge400: Extend data0
 partition to 64MB
Message-ID: <aH3WR4HL/nzXfDCU@localhost.localdomain>
References: <20250706042404.138128-1-rentao.bupt@gmail.com>
 <20250706042404.138128-6-rentao.bupt@gmail.com>
 <0b9b6c712bff18a25da218c507d18b9a8f18c7e8.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0b9b6c712bff18a25da218c507d18b9a8f18c7e8.camel@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_225524_375525_CD1E7262 
X-CRM114-Status: GOOD (  26.53  )
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

Hi Andrew,

On Mon, Jul 21, 2025 at 10:42:03AM +0930, Andrew Jeffery wrote:
> On Sat, 2025-07-05 at 21:23 -0700, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > Extend wedge400 BMC flash's data0 partition to 64MB for larger
> > persistent storage.
> > 
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> > ---
> > Changes in v2:
> >   - None (the patch is introduced in v2).
> > 
> >  arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
> > index 3e4d30f0884d..cf6c768cbad5 100644
> > --- a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
> > +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts
> > @@ -92,7 +92,7 @@ tpm@0 {
> >   * Both firmware flashes are 128MB on Wedge400 BMC.
> >   */
> >  &fmc_flash0 {
> > -#include "facebook-bmc-flash-layout-128.dtsi"
> > +#include "facebook-bmc-flash-layout-128-data64.dtsi"
> 
> My preference here is that we maintain two separate DTS for Wedge400:
> 
> - aspeed-bmc-facebook-wedge400.dts
> - aspeed-bmc-facebook-wedge400-data64.dts
> 
> We do so such that we implement aspeed-bmc-facebook-wedge400.dts like:
> 
>    > cat aspeed-bmc-facebook-wedge400.dts
>    #include "aspeed-bmc-facebook-wedge400-data64.dts"
>    
>    &fmc_flash0 {
>    /delete-node/partitions;
>    #include "facebook-bmc-flash-layout-128.dtsi"
>    };
> 
> aspeed-bmc-facebook-wedge400-data64.dts includes facebook-bmc-flash-
> layout-128-data64.dtsi as usual.
> 
> From there we can consider aspeed-bmc-facebook-wedge400.dts to be
> deprecated and can remove it in a future release. At least with this
> arrangement any revert of the (future) patch removing aspeed-bmc-
> facebook-wedge400.dts has no other impact. Further, both layouts will
> be supported in at least one release, making it possible to update the
> kernel without requiring a simultaneous update to the flash layout.
> 
> Andrew

Thank you for the detailed explanation. Let me send out v3 after testing
the changes.


Cheers,

Tao

