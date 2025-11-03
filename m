Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9CF4CCF9FE
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 09:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfWtj59fsmx4DfjU3lwJThj2eCOZ0UYFvm1+EVXmYT4=; b=3e32LIsoP25Ge12l9Bf+fWS9W3
	wEcqDZtd24MWEv6jaelvSWaXdMDtAvobdpbPcAk6tDQoJBYheHwr8TJw4hZJlA4XG5sc9EZSwGDLd
	v+ouvDiCIIW4ue4oK/j5HxMO2Nqxn0XAVHfgQl5GwTf7H1TJGVovITzHxDN8anKb+KxcIS9KudY0X
	jDp8ZWOgEB0um/BRIWXKZjrW3V0GcnJuyIMfwzaVOawwjRQZlZ62UF4MXsw7oOlpeBPLgdSzfiteQ
	MFyUbHju7qz8aOE+z3N/Cdm8XE3pF6t0Ei083HuPj7OC3Zl0EghL+hw05je/g1KUJau5qaDrI6AsN
	EdkrtI0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFqa6-00000009UWA-2rrI;
	Mon, 03 Nov 2025 09:10:30 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFqa4-00000009UVQ-0FoQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 09:10:29 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-b3e7cc84b82so843139966b.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 01:10:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762161026; x=1762765826; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pfWtj59fsmx4DfjU3lwJThj2eCOZ0UYFvm1+EVXmYT4=;
        b=Sl4Tjub97U6Ingxhvd4t/KYv7fpGgfKfDc5JEIsQ0mAHMV8YIi5sMFIq43Ts1Ls35o
         q8fG25KQ2VcHC8KWbl03yKgGct/bhBHcSffkE8T2ht1HiL9tXRHGD4TFR5/KDvq16j+Q
         ImsNsHUD+xcPvIuBMG5tw9oGqZjvaQ55g0e8b+6ZNIr/VI56SH+FRpA1w7sUi8pXJfKO
         ZnL+LmEOUBKx4/jHY7/Xl8SiqL1lkldhkoMAdGxB2aqNAZ2TpaZh6w7dZqmyi/eIed+Y
         pToiV/0C3ZJQvMAIM6unZZy9eV627VrQAOLXHdtju5WTd42mvLKSmdmyiRr05mk5XkwF
         q0mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762161026; x=1762765826;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pfWtj59fsmx4DfjU3lwJThj2eCOZ0UYFvm1+EVXmYT4=;
        b=ryc2YPmge1HDiT4qauuaCFycFw6rskKdffvWZDfOEn95WR1ivTstFPiTnBrt6ZiYbr
         kpHbY2uIljMDva02JigHPXZPFPaWgMyeCsYGx9Y+8VU3xnVuJkAfjnckKhL7NpYNlm5C
         TFsTokc0dMLJB4yirdc8qMG+36HO4wI9UpXmJAFiB2p5GJnsymSzlFmUhmRQ71Mc1Cgk
         aiqqlTgbvx46rKsZJk1XYxX0Nt0SZLVbuA13WjipaAh4iEXQZatVjJ7n6NLE7C5pFu5A
         6sptPM5a48mlBH6RXtkaAeupgxu8GVoyNx1DcznkmZ/plrcvOLcO2Rkjg6IF+7cBB+bt
         zo9A==
X-Forwarded-Encrypted: i=1; AJvYcCX6ZjT/EaNoir+0Na2Hi+p4h24li73EuSS8yvHF6Qkot/OnLpeOYVkG+JzlB8ivzUqHSCYUuFy6CZG8RQkVxrHE@lists.infradead.org
X-Gm-Message-State: AOJu0YwLQRlla4UrO0mOKALenjlIkG4jOXnsvbbcqJSU34JNaUtQ2vrC
	TA+VKrlQHGWzbh/HdW12s0i0hbibZeKhgp83C1BU3zTH63tsUKBitqUg4vACJbMoBXY=
X-Gm-Gg: ASbGncub88A2JFFf+LBzhUyMNpitwclKri9Ldi34ZY8+gfUwPTiK3egjcMLDpI1i9m6
	JEOc/lPNspaeEfCFu/b7Kc20PJrudHVyhmoX0PuMtRzCGLvny8Xeo+QDMyA+G8vdUeAZBLhTIUh
	+X7+3RSPAIUg+OV3YePi0qRRDFI+sQZ0expWtOdWlT614X0yQOQh3fFT0EsBa2C/XlLFyCwiO6g
	QDhvV3wD5ELG959KUyVNVYypAzGEZaS3fQL6N1TBfhc833HmG3z2C2QGlOdoHnfvOhkslnzsB28
	/3YpLJGCHoXMEhiQv/nAmeGPXpZnZoKplMQy7E7sS9RYY4qlssTkM8zsm/khUv4v87XDnGFQXfL
	nHoppLSb8xseROR9UVvM6Yq4b37e/TkX5OQFG97zi3jjsRNStv1hi5q239doB8KCdusfw2nMhF3
	IXxOsdjNnFqxgvX/KGad4RGCu2IIiF8n0sfYjL5RnWNRE=
X-Google-Smtp-Source: AGHT+IGnsENPgBpHIrOrP7lzzhKlmWSZH+KveVRwRSIOPyZ3ALlvWL3T816DU0ktI5WiCqEnwk2PDg==
X-Received: by 2002:a17:907:3d4c:b0:b3c:3c8e:189d with SMTP id a640c23a62f3a-b70704bc39cmr1464884366b.32.1762161026187;
        Mon, 03 Nov 2025 01:10:26 -0800 (PST)
Received: from localhost (host-79-19-212-20.retail.telecomitalia.it. [79.19.212.20])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70a9fb80e2sm504469566b.69.2025.11.03.01.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 01:10:25 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 3 Nov 2025 10:12:43 +0100
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Stanimir Varbanov <svarbanov@suse.de>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Andrea della Porta <andrea.porta@suse.com>,
	Andrew Lunn <andrew@lunn.ch>, Conor Dooley <conor+dt@kernel.org>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	"Ivan T. Ivanov" <iivanov@suse.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Phil Elwell <phil@raspberrypi.com>, Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: dts: broadcom: bcm2712: rpi-5: Add ethernet0 alias
Message-ID: <aQhyCzMWQif7-lY-@apocalypse>
References: <20251102002901.467-1-laurent.pinchart@ideasonboard.com>
 <39257a41-6719-4daa-a979-a9c2a629ec24@suse.de>
 <20251102110929.GL797@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251102110929.GL797@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_011028_130731_B7505156 
X-CRM114-Status: GOOD (  33.63  )
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

Hi Laurent,

On 13:09 Sun 02 Nov     , Laurent Pinchart wrote:
> On Sun, Nov 02, 2025 at 12:58:46PM +0200, Stanimir Varbanov wrote:
> > On 11/2/25 2:29 AM, Laurent Pinchart wrote:
> > > The RP1 ethernet controller DT node contains a local-mac-address
> > > property to pass the MAC address from the boot loader to the kernel. The
> > > boot loader does not fill the MAC address as the ethernet0 alias is
> > > missing. Add it.
> > > 
> > > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > > ---
> > >  arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts | 1 +
> > >  1 file changed, 1 insertion(+)
> > > 
> > > diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
> > > index 04738bf281eb..fa438ac8c9ef 100644
> > > --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
> > > +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
> > > @@ -10,6 +10,7 @@ / {
> > >  	model = "Raspberry Pi 5";
> > >  
> > >  	aliases {
> > > +		ethernet0 = &rp1_eth;
> > >  		serial10 = &uart10;
> > >  	};
> > >  
> > 
> > Unfortunately this does not compile:
> > 
> > make[1]: Entering directory '/rpi5/kobj'
> >   GEN     Makefile
> >   DTC     arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb
> >   DTC     arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb
> >   DTC     arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb
> > /linux/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts:12.10-15.4:
> > ERROR (path_references): /aliases: Reference to non-existent node or
> > label "rp1_eth"
> > 
> > ERROR: Input tree has errors, aborting (use -f to force output)
> > make[4]: *** [/linux/scripts/Makefile.dtbs:132:
> > arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb] Error 2
> > make[4]: *** Waiting for unfinished jobs....
> > make[3]: *** [/linux/scripts/Makefile.build:556:
> > arch/arm64/boot/dts/broadcom] Error 2
> 
> Ah indeed, I've only compiled bcm2712-rpi-5-b.dtb and forgot to test
> bcm2712-rpi-5-b-ovl-rp1.dtb. My bad.
> 
> > I've made following fix on top of your patch, but I'm not sure that it
> > is the correct one.
> > 
> > Andrea, could you comment please?
> > 
> > diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
> > b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
> > index bbad90d497fa..734b06ac5ba2 100644
> > --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
> > +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
> > @@ -9,8 +9,7 @@ / {
> >  	compatible = "raspberrypi,5-model-b", "brcm,bcm2712";
> >  	model = "Raspberry Pi 5";
> > 
> > -	aliases {
> > -		ethernet0 = &rp1_eth;
> > +	aliases: aliases {
> >  		serial10 = &uart10;
> >  	};
> 
> Adding a label to the aliases node is a bit of an uncommon approach.
> 
> > diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> > b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> > index 9f1976f0fd1a..26a99e72d441 100644
> > --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> > +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> > @@ -22,6 +22,10 @@ &pcie2 {
> >  	#include "rp1-nexus.dtsi"
> >  };
> > 
> > +&aliases {
> > +	ethernet0 = &rp1_eth;
> > +};
> 
> We could also just do
> 
> / {
> 	aliases {
> 		ethernet0 = &rp1_eth;
> 	};
> };
> 
> and drop tha aliases node. I'll send a v2.
> 
> There's a side question of how the boot loader should pass the MAC
> address to the kernel when using the RP1 overlay, but I think that can
> be addressed later.

Yes, there are several (and probably more constraining) details we need
to figure out before referencing rp1 nodes with the overlay approach, which
is something I'm currently thinking about. It will take some time, unfortunately.

Thanks,
Andrea

> 
> > +
> >  &rp1_adc {
> >  	vref-supply = <&rp1_vdd_3v3>;
> >  	status = "okay";
> 
> -- 
> Regards,
> 
> Laurent Pinchart

