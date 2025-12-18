Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AAA3D6D220
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 13:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3LSAT77K70NGSM9Qz0SJWa7kxo2rFXyPcHQVzVB1tZg=; b=mUgxhxX4R92IfJtBIhuYlMMPKs
	wc+mnQdDnI1ZpgdldcJOUfoNqJroCapzObOVPH1E8IP4s4qsLp/ta7Bj7sydGxHT9gl8Z24ONkHA/
	VXPnD4IqsCsboDLXkFbPQusJ+IFYzEZtVor86BfXRavAzKRV1RAHMOyut3X7+RZk9OwH5VzE/5xsm
	jC9KTLXAG31o+PlwFmzLnU8EQBXZv+YuWlZmulXaKO8kSBXJ9Rc2ZHRBvqe5Fp9+fGDR8m+Hs1MUh
	uAsUvEAa7Yi18S8X7wFI0HYCdQkXg3JqdL0WpoB9QGYFs7Na0giOZ5DzGWuKTC6C1YAGQ/+Oxlvmo
	WCnVo0EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWEFF-00000008YPb-1QgC;
	Thu, 18 Dec 2025 13:40:41 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWEFB-00000008YNv-29CG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 13:40:40 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-b7697e8b01aso109485166b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 05:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1766065235; x=1766670035; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3LSAT77K70NGSM9Qz0SJWa7kxo2rFXyPcHQVzVB1tZg=;
        b=OzmPBbDdQBFlzRKmb3DdivSiYhGcEBxhlN+EblRz8sD3WpTD9EXCUKQw6BktuCCrUy
         Eq0EB7W+jIVLdfb9obS1UnyE0sX30T3TpxtSvE9JhzEzvZBOtBoNkzLEMUJ/V6tml1Cc
         EpG2ddS0v1Z5VTQtcvIQGfOCTkRCNzQbyF7BqhWimNHSVu9nKof5Ka4M1i+rYNJHckmx
         acEQI+nPIOA/rQkUYl85/ae7ZqWQ5M+MwCFUPCPq8A74Q+H/PpAYKujaHYpr7yfESJJx
         KLTEQFQyNkPE0gvCcOz4Urz8vdY1rYX+grHTjIppsy8isW+0WAzhgz99kKsMKrbr2ZHy
         k1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766065235; x=1766670035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3LSAT77K70NGSM9Qz0SJWa7kxo2rFXyPcHQVzVB1tZg=;
        b=d03VJN9dMJgqHJwY1XJr0ouMLxo6MnJxp57r/bijyTdEe3bVKk2z7PY02zTKqG7By7
         piwq4iNsfyGJxE7rbOgbz9TEn2CiYPESL5ojoOlPB5LV9DLJi7eGM2lJ58HHhLpejVMh
         VnQLuhcSwHqohJykvmYGVr6be5zz6rs2MRSiDwkfEzc0qV+6lHaqkpbO0AsXXoFFd6XJ
         m4LKG3XxULk6wMBjGTOk0zlmB6ZivGLdz7m+LQ8jUyBZ2mPxooMMMtNdwkS9/3ZT1y8T
         2jol7qs666GwqMGLqF1lTshgAKyNx4HctJvMqr8bCFBm0mDan6OSe1vk3vb6X2J45tIH
         YUAQ==
X-Forwarded-Encrypted: i=1; AJvYcCW24y41TCzb6eoRdO8b5XQ3ynxPQ+0Pva8zomN9Cl2bUvx63k51RMmJpJxxqUeY2MMcMB5nUT6SQsfxz1edw2Qv@lists.infradead.org
X-Gm-Message-State: AOJu0YyMRNJpE64uQljZOP49sIsL3ByDZSrdzhBqCN318N2BINgLqYom
	MZTWiz9D86LErQYHYmgAvpGkJPGMA2pTB29wrEe4256l8+qAyR+BoWd11axUtQNZtVU=
X-Gm-Gg: AY/fxX7YgBu5Fg/2NZDl54q0ACn/syf/PJp+Mrul1wOaUsa9IhEvSHxdW47nyUP4Oak
	1wICjvRAYxNaMsM6pC49hNuDkgSDutptbPmT5Jtu1VAxIjqtiMYYpP/Bq4EFOA463OGVl/1yC9y
	qi2VoAqTOjSW8q38N7ffSinws4tVQ6eL3yhWrpNoZBKk5Xk6xFBYc4kZtZEBpS3ExELHu2UXgry
	OqdgL14fooNFbYEeBot2a6N3qrG7NT1rQxlYFwxsB87OOlPEsKITan7aheWpxSoS9wn4I/rFKP8
	Si86F1meARkG4CioO7lB8IBFuW7XadOkmKt4PggEFLG39w/Ww0fRx1ujh5E471n+V8XpmPhyO3N
	9M+Pk+JvqAIG07uPw7QIGCnE1QTssv4LbL9PhGD3YsE2PD/LZIVUEk6XwL4EvLsRkrz9yzRZ4xX
	F2N6gBYR5Ohk7AhLP9BlA8z4Xo3xmzlhx54YulUnfeO5vNl6EZ9YZYlA==
X-Google-Smtp-Source: AGHT+IHubB2aqzYVB60sOrvL9H+YVC9aXHA+OCCZ5f3rKFv1VGMlaYPyOqYSATywdoLRGkGi9cjK8g==
X-Received: by 2002:a17:907:3c90:b0:b70:af3d:e97b with SMTP id a640c23a62f3a-b7d23a425a9mr2129392766b.17.1766065235495;
        Thu, 18 Dec 2025 05:40:35 -0800 (PST)
Received: from localhost (host-79-37-15-246.retail.telecomitalia.it. [79.37.15.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b802351a335sm236652066b.66.2025.12.18.05.40.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 05:40:35 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Thu, 18 Dec 2025 14:43:08 +0100
To: Andrea della Porta <andrea.porta@suse.com>
Cc: "Rob Herring (Arm)" <robh@kernel.org>,
	Phil Elwell <phil@raspberrypi.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH] arm64: broadcom: bcm2712: Rework rp1 overlay handling
Message-ID: <aUQE7NbplmY_Qtp6@apocalypse>
References: <20251117211503.728354-2-robh@kernel.org>
 <aTgrHEoxl7J8_BuU@apocalypse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aTgrHEoxl7J8_BuU@apocalypse>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_054037_579712_824DAA12 
X-CRM114-Status: GOOD (  27.88  )
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

Hi Rob,

On 14:58 Tue 09 Dec     , Andrea della Porta wrote:
> Hi Rob,
> sorry for the delay...
> 
> On 15:15 Mon 17 Nov     , Rob Herring (Arm) wrote:
> > It's a requirement that DT overlays be applied at build time in order to
> > validate them as overlays are not validated on their own.
> > 
> > Simply adding a build time target is possible, but it's also not desirable
> > to have targets which include the overlay contents and apply the same
> > overlay.
> > 
> > Rework the targets such that there are 2 overlays: the existing RP1 overlay
> > and the board specific configuration of the RP1 (bcm2712-rpi-5-b.dtso).
> > 
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
> > The missing applying of rp1.dtbo will soon be a warning[1].
> > 
> > The comment in bcm2712-rpi-5-b.dts(o) needs updating or removing. The RP1
> > driver or userspace handling of the overlay probably needs updating to
> > handle the 2 overlays. IIRC, I think we can apply overlays to overlays
> > which may be useful here. If not, adding that to the tools should be
> > possible.
> > 
> > [1] https://lore.kernel.org/all/20251114222759.4181152-1-robh@kernel.org/
> > ---
> >  arch/arm64/boot/dts/broadcom/Makefile                 | 10 ++++++++--
> >  ...m2712-d-rpi-5-b.dts => bcm2712-d-rpi-5-b-base.dts} |  2 +-
> >  .../{bcm2712-rpi-5-b.dts => bcm2712-rpi-5-b.dtso}     | 11 +++++------
> >  3 files changed, 14 insertions(+), 9 deletions(-)
> >  rename arch/arm64/boot/dts/broadcom/{bcm2712-d-rpi-5-b.dts => bcm2712-d-rpi-5-b-base.dts} (95%)
> >  rename arch/arm64/boot/dts/broadcom/{bcm2712-rpi-5-b.dts => bcm2712-rpi-5-b.dtso} (92%)
> > 
> > diff --git a/arch/arm64/boot/dts/broadcom/Makefile b/arch/arm64/boot/dts/broadcom/Makefile
> > index 83d45afc6588..4957edec9d9f 100644
> > --- a/arch/arm64/boot/dts/broadcom/Makefile
> > +++ b/arch/arm64/boot/dts/broadcom/Makefile
> > @@ -6,9 +6,9 @@ DTC_FLAGS := -@
> >  dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
> >  			      bcm2711-rpi-4-b.dtb \
> >  			      bcm2711-rpi-cm4-io.dtb \
> > -			      bcm2712-rpi-5-b.dtb \
> > +			      bcm2712-rpi-5-b.dtbo \
> >  			      bcm2712-rpi-5-b-ovl-rp1.dtb \
> > -			      bcm2712-d-rpi-5-b.dtb \
> > +			      bcm2712-d-rpi-5-b-base.dtb \
> >  			      bcm2837-rpi-2-b.dtb \
> >  			      bcm2837-rpi-3-a-plus.dtb \
> >  			      bcm2837-rpi-3-b.dtb \
> > @@ -17,6 +17,12 @@ dtb-$(CONFIG_ARCH_BCM2835) += bcm2711-rpi-400.dtb \
> >  			      bcm2837-rpi-zero-2-w.dtb \
> >  			      rp1.dtbo
> >  
> > +bcm2712-rpi-5-b-dtbs := bcm2712-rpi-5-b-ovl-rp1.dtb rp1.dtbo bcm2712-rpi-5-b.dtbo
> > +dtb-$(CONFIG_ARCH_BCM2835) += bcm2712-rpi-5-b.dtb
> > +
> > +bcm2712-d-rpi-5-b-dtbs := bcm2712-d-rpi-5-b-base.dtb rp1.dtbo bcm2712-rpi-5-b.dtbo
> > +dtb-$(CONFIG_ARCH_BCM2835) += bcm2712-d-rpi-5-b.dtb
> > +
> >  subdir-y	+= bcmbca
> >  subdir-y	+= northstar2
> >  subdir-y	+= stingray
> > diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b-base.dts
> > similarity index 95%
> > rename from arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
> > rename to arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b-base.dts
> > index 7de24d60bcd1..48a0ae118839 100644
> > --- a/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dts
> > +++ b/arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b-base.dts
> > @@ -1,7 +1,7 @@
> >  // SPDX-License-Identifier: (GPL-2.0 OR MIT)
> >  /dts-v1/;
> >  
> > -#include "bcm2712-rpi-5-b.dts"
> > +#include "bcm2712-rpi-5-b-ovl-rp1.dts"
> >  
> >  &gio_aon {
> >  	brcm,gpio-bank-widths = <15 6>;
> > diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtso
> > similarity index 92%
> > rename from arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> > rename to arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtso
> > index b8f256545022..89d099c00035 100644
> > --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> > +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtso
> > @@ -15,19 +15,18 @@
> >   */
> >  
> >  /dts-v1/;
> > +/plugin/;
> >  
> > -#include "bcm2712-rpi-5-b-ovl-rp1.dts"
> > -
> > -&pcie2 {
> > -	#include "rp1-nexus.dtsi"
> > -};
> > +#include <dt-bindings/gpio/gpio.h>
> 
> Sounds reasonable to me, please let me have a full round of tests to check for
> any issue with the driver and I'll come back with feedback.

Just a heads up, since you've posted this new revision [1] and that I'm currently
reworking RP1 overlay (in order to drop it), I assume that this patch is no longer
relevant and I'll avoid testing it.

Thanks,
Andrea

[1] - https://lore.kernel.org/all/aUQA5IKqqsrElzKP@apocalypse/

> 
> >  
> >  &rp1_eth {
> >  	status = "okay";
> >  	phy-mode = "rgmii-id";
> >  	phy-handle = <&phy1>;
> > +        #address-cells = <1>;
> > +        #size-cells = <0>;
> 
> I think this should go in a separate patch.
> 
> >  
> > -	mdio {
> > +	mdio@1 {
> 
> Ditto.
> 
> Many thanks,
> Andrea
> 
> >  		reg = <0x1>;
> >  		reset-gpios = <&rp1_gpio 32 GPIO_ACTIVE_LOW>;
> >  		reset-delay-us = <5000>;
> > -- 
> > 2.51.0
> > 

