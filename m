Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 204CFC8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 04:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cG3nGFKHy1r5C+lPIaBzR6QdGIwuCZhkFG9bY42b6Jw=; b=qy1tibfQ7/Ruth//wsoIF/AraA
	gJfGGjrfLY4z00tLlVXoq1xknaMrI3qH/3ubOyIJlBPEtmlnDP9zmIuP8emlMce982BEHE2HGK6oc
	ut3MwiWZgSHryibPWtKMqZPvWO3FnO3VlYHxxmPPr5c+lgkduhtIqOiUIEHAXCkNSVtms0sVR4Cy3
	zC0BReTNKSrSJzlt2/s166e0X+YUOpHToel9xv2oIECRSI/u6fkVfVoWKf4ESM+Ku0z3IQcRJqQNc
	ZvgNRDfGlfYQaCz09e5kZb7y+126mkKCsRBbqq+zIiGuyRwQe0pBHPDtre5HYY7fAifTieFhGgMSB
	Z8caNfUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXYLY-0000000DGZr-3xDu;
	Fri, 04 Jul 2025 04:48:24 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXYJ2-0000000DGLc-2Bh3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 04:45:49 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2350b1b9129so4969555ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Jul 2025 21:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751604348; x=1752209148; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cG3nGFKHy1r5C+lPIaBzR6QdGIwuCZhkFG9bY42b6Jw=;
        b=BExDPxuMGVW+MW6k+TdLPUrG+TyHCpATPyJ4yAE/83YW34sCXzUqi0D5tV0tNSEH8+
         wi887uMo0x+X/plopqkXPec/2iBKUQpjzVzaY8DiTfYhc0uzBA766IyGlIRwtmA6Nn4n
         i+KAhzdGl1E06r7MJcawR0Fs/+6Uy+PQnXH/eHis6qktkmDUhpItMeN6iwZSgGp7jaBq
         PJ+ATgDNZdUgc36Aq581ekyG3Zo9S2lQw5jMGxZPAdTgg9dktT3C3mxI4+d9GmS6a3Gz
         Lak+FbSG9L7d6wSI8Sryy/olxUTLYri5ESEwx5FoMXrsnOk/d7bnuvFz1iRaTYc0CKGf
         grFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751604348; x=1752209148;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cG3nGFKHy1r5C+lPIaBzR6QdGIwuCZhkFG9bY42b6Jw=;
        b=AEZLdR6CFw1uTOiLic7Se/F06ikvP/xaSleeYw9DEgaQ6Xwd3uLFrwPX4GahQFkS9x
         dl15zp7gpJjpliuQvh8mlcFLxNm55HbSrjk8CGR7/0F6NWg8PaOaJWllNWbHN7ZmfgHg
         bDNICaEpYCRaFOawbbGdUlBhm46dgzm8tTJ6ygspqRDij1QA4cdR2aaYAJblU/cdRT/X
         ++KoLhkpAX2J//W4UmdtgKby4ZZyxwYWR7L4fAOvje+8WFg3oiUUYHoc/MsvtCrcjSua
         3oq+gTW0pcmoVniUR2A46juDCsXvA8QPzjpPGgAIUXYS8arO5KCpPxlErrgG7yR4Vrdc
         TBxQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3TeQLLMpt2WJGVr+a+PNBU+ZrVi5aBmxWAWwCk128XK+m5apH3QTafbSgZgS5kNfw4qZmo0vkm2hPvHL9mxKR@lists.infradead.org
X-Gm-Message-State: AOJu0Yz2w4D4cLHyyu5a6CV2c/9fYDK99fKgbDzWj0h9RwVBNeJvXcIi
	ZR+Zu7SnQr9UOjMwJqw+bOJ/43hFu9JcGQvl0tC7HnZWR4hNcWoz7Cdi
X-Gm-Gg: ASbGncsaGQyfDwEWpN/j+bxeaTeuzje8s3tRRyP2VdVBWqzA8LZoXRBaF/98B9TF3+a
	WdheBVkZ3CYROzc/J/hhIMlUEytbIgwEWoESM8iqaB4y9a+/0oY0Q4LGJRUQDjCPSmqSMh7INat
	DM1ZY3cXUCIDFZ87kL+sY2Sh0FcnzNfX9as4bIkeFsjywYlJVPaU59rOixEhOkE7xWLqu2exCyX
	CF8DGY+iPhHIo8+av8ACa6r34tBPUwD1WVlobyU9ExjC7DTfppdGDwIwzORAyRvwGGyECzEBI/R
	tKLwBR5SUkQUqPeBiAxCnAgOomXhL4ZopzH+KKG/yNzpY1g3BvasecIjojluWJH+M4NzVLPG2S9
	GfbHpdvlbJFSCgBvKK1bzSV9jP4zBaKzyVGxOuDI=
X-Google-Smtp-Source: AGHT+IF0o3ITf8BCpP5P9I2hnMwefUgNCwsqn4QO6uhOxBG7wPoKctcKA38mvJ7HISgAzRZvMAgLmA==
X-Received: by 2002:a17:902:c404:b0:234:a139:1203 with SMTP id d9443c01a7336-23c85e7459amr19740725ad.32.1751604347591;
        Thu, 03 Jul 2025 21:45:47 -0700 (PDT)
Received: from localhost.localdomain (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c8455ba98sm9751345ad.135.2025.07.03.21.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 21:45:47 -0700 (PDT)
Date: Thu, 3 Jul 2025 21:45:44 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Andrew Jeffery <andrew@codeconstruct.com.au>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Tao Ren <taoren@meta.com>
Subject: Re: [PATCH 1/5] ARM: dts: aspeed: Expand data0 partition in
 facebook-bmc-flash-layout-128.dtsi
Message-ID: <aGdceHVCEaWxo5QG@localhost.localdomain>
References: <20250702050421.13729-1-rentao.bupt@gmail.com>
 <20250702050421.13729-2-rentao.bupt@gmail.com>
 <78f9fcbc58261064f248e95eb7740549e338bc78.camel@codeconstruct.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <78f9fcbc58261064f248e95eb7740549e338bc78.camel@codeconstruct.com.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_214548_569831_967DB6DF 
X-CRM114-Status: GOOD (  22.90  )
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

On Fri, Jul 04, 2025 at 09:36:29AM +0930, Andrew Jeffery wrote:
> On Tue, 2025-07-01 at 22:04 -0700, rentao.bupt@gmail.com wrote:
> > From: Tao Ren <rentao.bupt@gmail.com>
> > 
> > Expand data0 partition to 64MB in facebook-bmc-flash-layout-128.dtsi for
> > larger persistent storage.
> > 
> > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> > ---
> >  .../boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi b/arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi
> > index 7f3652dea550..efd92232cda2 100644
> > --- a/arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi
> > +++ b/arch/arm/boot/dts/aspeed/facebook-bmc-flash-layout-128.dtsi
> > @@ -32,19 +32,19 @@ image-meta@f0000 {
> >         };
> >  
> >         /*
> > -        * FIT image: 119 MB.
> > +        * FIT image: 63 MB.
> >          */
> >         fit@100000 {
> > -               reg = <0x100000 0x7700000>;
> > +               reg = <0x100000 0x3f00000>;
> >                 label = "fit";
> >         };
> >  
> >         /*
> > -        * "data0" partition (8MB) is used by Facebook BMC platforms as
> > +        * "data0" partition (64MB) is used by Facebook BMC platforms as
> >          * persistent data store.
> >          */
> > -       data0@7800000 {
> > -               reg = <0x7800000 0x800000>;
> > +       data0@4000000 {
> > +               reg = <0x4000000 0x4000000>;
> >                 label = "data0";
> >         };
> >  
> 
> Two existing systems use this dtsi:
> 
>    > git grep facebook-bmc-flash-layout-128.dtsi
>    arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-wedge400.dts:#include "facebook-bmc-flash-layout-128.dtsi"
>    arch/arm/boot/dts/aspeed/ast2600-facebook-netbmc-common.dtsi:#include "facebook-bmc-flash-layout-128.dtsi"
> 
> This change requires a full reflash of those devices, which is pretty
> disruptive.
> 
> It seems more appropriate to me to create a separate dtsi for the new
> flash layout to use in new systems.
> 
> Andrew

Hi Andrew,

I agree it's better to create a new layout, and I will take care of it
in v2. The migration is already done for all the network BMC platforms
except elbert/darwin, and having separate layouts will make my life
easier :)

Any suggestions about the file name of the new layout?


Thanks,

Tao

