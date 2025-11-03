Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B53C3CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 09:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ASTU4QfoQvxGB28Ml8MetCWFpiVsnWABB1CbN/JVp7I=; b=4G3yiczw/xXop/VU3WL/U+Ca/4
	PGs+s1bLdrkA/F7Q8bgGIlVwWnwxE82GnqqUGCogG6hUNJbGP0GiY1H8uWTjBuzDRa6C12KrusVyi
	azIrZlg0FXkvPljq7GCwxWdKheBGRno731x6gac6DpM8h5KQfDImEK8DK0Wl/dcHD/YV0udRzm2MD
	nFZ0TMoR870odpGu39nILgozTlw7NgE3bHd/Jqqc6B9FoUwc1QBgt4iR5APOHWJXNMDHkN4aMAfz4
	KxdP6hpTzT2eFl0egaRw8YfirAmK/fBuWx4YRru9A55VjROVKQ7rl/28BpYGUTOUFseEk56BqWY2+
	JownFPxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFqXU-00000009UL9-2B1t;
	Mon, 03 Nov 2025 09:07:48 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFqXQ-00000009UKA-3vNU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 09:07:46 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-640c6577120so969885a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Nov 2025 01:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762160862; x=1762765662; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ASTU4QfoQvxGB28Ml8MetCWFpiVsnWABB1CbN/JVp7I=;
        b=H/0fYQJfszSuP0JuxLM9CzrzbypYPRd7RCFKMKh5yk9BxkBc0pVtV25aa10u3A3I9I
         87ZAZsdQ3d2mL6YSVUpswpLc2roiLNKtVInTN+slboAOhulQTNra7qwY1jGlbWrh3aNP
         +pMWOXjccQCyxK3emDoGx8Vox4jfb8OOxT4vH78d6UQVdSmkD2pFcSy4lOsOaWAvAtC/
         MBn1PEtL3hW2NDpEDpzkOi+yageieV9eZoPE8rtuorNKijImcq6t6dOs92QggTSW6apx
         MMpHiykMbA4RbYlr1DelnbiO1AYh++hwshGnf2SUCn1O1fCRLwDbsIp+MULBMukAgXbZ
         vkOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762160862; x=1762765662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ASTU4QfoQvxGB28Ml8MetCWFpiVsnWABB1CbN/JVp7I=;
        b=DfoSwywo92ZFAqzTUzqt205cgsmX75Li17t9gRPmey7Bw2VrFIdXXbWop/nw3zvXf2
         K7S6kxrWwesdUrKJak1eJ/8V7iU1jDfwSj8hZnx1gp9yj/hFJVQlZghfx/RkcTY8Dy9u
         rKw2FSHjyqCbN724+JcqkrneSpJW+wABIQiPO9GecAkUIRYCdxOI7XtPZulONQVNG9in
         B5yMvDDjOUdWjvuN1EAnbsjUqj/1eleQYs1YLxNkycnvIeAa/NOlpLB8uJ+l+Ga+Fy9G
         XQr5IRqpkCsVsyxSm6Tb0R/BEbTCO1GAAzYL46aW0+diHBFQYxYYIBhB21aECc02DdeO
         RGcw==
X-Forwarded-Encrypted: i=1; AJvYcCWhyqPqpYCHrlkWEw0mDzjmHLVGcmotwa5X2i89OYD69C31M78yC019idXVUPR6oiM8AebK6RB2TnGWO6QTpzFv@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4xLKwj5W+ridatdjAb5zmeJk7C/1IEoqRIDNIyuq0tH4tKeoX
	tfkArxAX5tgJfQt5C6FF6KFyJSJzjxV/eRIEqzeenus/wrzWTfm713Xnq+ZeitCTZmY=
X-Gm-Gg: ASbGncuTEd0LUnEB0zzFa3N7hiAHKQC1aGHvdwL+H4P69ZoqsWgZ9AypIvyhq8eSN7J
	gt+GbHIw6v5gprQMqgKoyq9zWb7b1QQvWSyMmBab8VbS5Y8zxEKPKnTPWbmcEx9pHyz0zpAl7HZ
	GfaKQzsmx17foIk8+zox/zgZw1asaIxGkDo0q9CvGjrNLAKcXDRZoEgD/t2uHWeWdaqIQq3YtNY
	Rx+gGMgOBa878m1Cjz7eIYROBUxc/KUiUVyzt3ojTmb/bQNLk5+GCt7RdtaM19Ygf+5xAqIzuyw
	M9MeoY3KY4njkBmHr/Mu9vm4/PjJwG8VTAj++3oRqwigTdRZXA7zDwuK1wQIMWdxdjzf0Yz5ftv
	nfIsPXPICXy8QYUVBLCcktK2jM+orQHajyJDA0PAKNvHCT5dhXU4sFTjEM4Ew9P0QRODlO3uUBm
	tASvhJKDU4QT4AuP9xv5MT2eiBEae4gVPqHS6Nqrv0WppDp0s8YTOxE1CbZoJmHo86
X-Google-Smtp-Source: AGHT+IE9Pw6MqfnP3z6RwudjjxKNxv8CP3gwaysdiTVMErG9vq3LF7u1N+0kg8WywMAtd60R2jW+wg==
X-Received: by 2002:a05:6402:2102:b0:640:3210:6e48 with SMTP id 4fb4d7f45d1cf-64076f6be91mr9652654a12.4.1762160862451;
        Mon, 03 Nov 2025 01:07:42 -0800 (PST)
Received: from localhost (host-79-19-212-20.retail.telecomitalia.it. [79.19.212.20])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640ad7f1816sm4793314a12.14.2025.11.03.01.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 01:07:42 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
X-Google-Original-From: Andrea della Porta <aporta@suse.de>
Date: Mon, 3 Nov 2025 10:09:59 +0100
To: Stanimir Varbanov <svarbanov@suse.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Message-ID: <aQhxZye4uxyTRG4w@apocalypse>
References: <20251102002901.467-1-laurent.pinchart@ideasonboard.com>
 <39257a41-6719-4daa-a979-a9c2a629ec24@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39257a41-6719-4daa-a979-a9c2a629ec24@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_010744_992955_A4895CB5 
X-CRM114-Status: GOOD (  27.00  )
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

Hi Stanimir,

On 12:58 Sun 02 Nov     , Stanimir Varbanov wrote:
> Hi Laurent,
> 
> Thank you for the patch!
> 
> On 11/2/25 2:29 AM, Laurent Pinchart wrote:
> > The RP1 ethernet controller DT node contains a local-mac-address
> > property to pass the MAC address from the boot loader to the kernel. The
> > boot loader does not fill the MAC address as the ethernet0 alias is
> > missing. Add it.
> > 
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >  arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
> > index 04738bf281eb..fa438ac8c9ef 100644
> > --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
> > +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
> > @@ -10,6 +10,7 @@ / {
> >  	model = "Raspberry Pi 5";
> >  
> >  	aliases {
> > +		ethernet0 = &rp1_eth;
> >  		serial10 = &uart10;
> >  	};
> >  
> 
> Unfortunately this does not compile:
> 
> make[1]: Entering directory '/rpi5/kobj'
>   GEN     Makefile
>   DTC     arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dtb
>   DTC     arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb
>   DTC     arch/arm64/boot/dts/broadcom/bcm2712-d-rpi-5-b.dtb
> /linux/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts:12.10-15.4:
> ERROR (path_references): /aliases: Reference to non-existent node or
> label "rp1_eth"
> 
> ERROR: Input tree has errors, aborting (use -f to force output)
> make[4]: *** [/linux/scripts/Makefile.dtbs:132:
> arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dtb] Error 2
> make[4]: *** Waiting for unfinished jobs....
> make[3]: *** [/linux/scripts/Makefile.build:556:
> arch/arm64/boot/dts/broadcom] Error 2
> 
> 
> I've made following fix on top of your patch, but I'm not sure that it
> is the correct one.
> 
> Andrea, could you comment please?

Correct, any reference to nodes declared in rp1-common.dtsi should go in
bcm2712-rpi-5-b.dts, everything else in bcm2712-rpi-5-b-ovl-rp1.dts.
Any aliases node under root node will be merged so just drop the label in
front.

Thanks,
Andrea

> 
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
> b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
> index bbad90d497fa..734b06ac5ba2 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b-ovl-rp1.dts
> @@ -9,8 +9,7 @@ / {
>  	compatible = "raspberrypi,5-model-b", "brcm,bcm2712";
>  	model = "Raspberry Pi 5";
> 
> -	aliases {
> -		ethernet0 = &rp1_eth;
> +	aliases: aliases {
>  		serial10 = &uart10;
>  	};
> 
> diff --git a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> index 9f1976f0fd1a..26a99e72d441 100644
> --- a/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> +++ b/arch/arm64/boot/dts/broadcom/bcm2712-rpi-5-b.dts
> @@ -22,6 +22,10 @@ &pcie2 {
>  	#include "rp1-nexus.dtsi"
>  };
> 
> +&aliases {
> +	ethernet0 = &rp1_eth;
> +};
> +
>  &rp1_adc {
>  	vref-supply = <&rp1_vdd_3v3>;
>  	status = "okay";
> 
> ~Stan
> 

