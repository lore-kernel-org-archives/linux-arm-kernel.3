Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6115CCCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 04:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T0FUz4z1xFNwCgvQPUMrt9kZD59yR5IRPj9qAd263rQ=; b=ZxMU3WHYPdcVulj1cQQob2ZiQj
	yt0WL35n9LM7LZT3IbTdzp6vov9ehR2WnL57cRCZsC5dliGZbEDindGlNOsS570UFjKGak/nVXl1Z
	ZEorIM91jKWt02o/WDvz1Cho4mgXum05ob76qbgPTQXG21p8aLfcmiVN/WRGS6QL1LlIvUmENVp22
	5OKIITF3oemuiMw2ty/nocMplHqLACv2gHg4YC1VtabcWpT7h1qtVkAshWh7OulBH6aR5J4gEe8da
	ga+dMYTnrou8Uek07r51WDOs31luOD0utDxNoCgQgRzLXt9KxN0wntE+G8fUrpACLxtaJ3sC/iJh1
	zzYiGYoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8WLt-0000000F5Ij-34fA;
	Tue, 14 Oct 2025 04:09:33 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8WLr-0000000F5IM-1Tqe
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 04:09:32 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-b57bf560703so3125782a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 21:09:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760414970; x=1761019770; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T0FUz4z1xFNwCgvQPUMrt9kZD59yR5IRPj9qAd263rQ=;
        b=AN27T1sSrAUKB3jDE/kK1GI80yDzEmDFLYDi8UmfeYhqcZ0VhxnS26cA7295MKDRWV
         9EGYh2FFcqV9if4FR7IoR2s+1vNglLQ+igU3DFh84nUq2W4tfeuRoRivcYfhDgwjlpCO
         8aHC2gOccP20cb66Utr5oRwlJbur/6FSwnN3UyIaDk/RjYZxUy7v4FDzhEQd/rM7+GEd
         lpVrNFWL+J8e/syL2CFl2X1jvaSjKyqt8douEtOJP8yznwIK9BCDSbPbqiE/SXuzBYQG
         IhNm32utTCLA1wqlKZUUd8GEix5ee6obbKQS3rx+ZJfdhUFt6gekf+j3DmXT20jMDrRv
         WUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760414970; x=1761019770;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T0FUz4z1xFNwCgvQPUMrt9kZD59yR5IRPj9qAd263rQ=;
        b=as+G2ZTpv9RrSKOKpIuwMVDC/l5gkt4NRH+zeVYRI/vvOQ5CE0xIIbkIa/x+c2jwCs
         peE3uqcQchWJkkp+Oytb+LIZLeKXb+L4sVLFYrnzzTmH7Nkria9Co/YjaC8UbwwXMsLH
         844lA+TY3P8G7+vbfF/4tqGFb0elEkpvgjMpdn46qJkB9crAz+6ewY2LiKUtNPtOpsUV
         3kZ6vxgpEdGUCphL/TKTCcBVVtoCl4OHWR5OcIbFSSJyjmuk3HSGDAtQRaOhHh+aiv+y
         eXq6BKethpzNApy5kk2aHDhAfnm5AWkzyH+mLcm5BlVCTFPGkD3C0SritetadZ+AjNnP
         oJUg==
X-Forwarded-Encrypted: i=1; AJvYcCWfv47xQZKAkx6w5Q2tVBIWzUwWBXBVVBXdPigydwP5p/DRs8/1JQHWmlHf7S6/tLu9k7LiJvBAPIJUqU7sa2MW@lists.infradead.org
X-Gm-Message-State: AOJu0YwhA/nojtWnt68Jbn+EDqjBjRb9GQRNJcrqLWFKhCpmlJmiTd7H
	c3lOWy3ApF5ip3kK1hEBmK6p9LBtYALlgE3r0DEJUCVUTbcpo2s13P3Q
X-Gm-Gg: ASbGnctXh94LWgwB7ruphSabORM2AcphFr2uhvouLvu47vw8jjDh8LB3KIG0azroafJ
	Bbg18GFmOwjmOS4GxQ9PUFb8VbX8FDstZVMbsrTzipt3lmfqwSC8+6ghxrRK1XGxyszNCiCTOi5
	5aLtgWxcvJZUMpsMU88vYpc+VYZdhtOlWz/FEAhQU0JS9+KdYFcO9vzuZxj3nYwZiZHrktD0e6w
	EJOJOkKGTnTLiXMIKdjQr9YMyWVJwdhpmiGaZ8uOlNRiLpnc5MAaCGqO3XYP6x/ExSBKRTxv4Wk
	dK3k+3MZ9UP8wgSonAnMKf2uEDzz89jyBNyidkTVPy3CE/xWJ85B6999cccrp4wrq1CU7KvCEcC
	ou6rmGhyLE7Z9KfyN74cwgTo7r8dYclX74wVou/7IzC1SgexpNflGtWkQZ0eoCtPlF1eT9OxoB7
	APTke1neu8TmKVX6f64xw=
X-Google-Smtp-Source: AGHT+IEr20kAH+dfqBTsSZfMO0yg/OwD4bgTloNhcSIQWl/DGKL1nIf9DZfEY5q5FY5iCmPtfo18vw==
X-Received: by 2002:a17:902:e806:b0:261:6d61:f28d with SMTP id d9443c01a7336-290273ffe94mr274157815ad.50.1760414970372;
        Mon, 13 Oct 2025 21:09:30 -0700 (PDT)
Received: from fedora (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de5dbfsm149146305ad.20.2025.10.13.21.09.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 21:09:29 -0700 (PDT)
Date: Mon, 13 Oct 2025 21:09:27 -0700
From: Tao Ren <rentao.bupt@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>, Tao Ren <taoren@meta.com>
Subject: Re: [PATCH v4 11/13] ARM: dts: aspeed: facebook-fuji: Include
 facebook-fuji-data64.dts
Message-ID: <aO3M90Ycp2DWyFuk@fedora>
References: <20250728055618.61616-1-rentao.bupt@gmail.com>
 <20250728055618.61616-12-rentao.bupt@gmail.com>
 <79ddc7b9-ef26-4959-9a16-aa4e006eb145@roeck-us.net>
 <aO2kLyxGlGt12sKD@fedora>
 <e3dc7aee-c8af-4276-84e5-0f0c7926be05@roeck-us.net>
 <054cf209-61af-4d21-9a3b-d0f6dd24ee3b@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <054cf209-61af-4d21-9a3b-d0f6dd24ee3b@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_210931_422339_A4CF7811 
X-CRM114-Status: GOOD (  33.77  )
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

Hi Guenter,

On Mon, Oct 13, 2025 at 08:44:17PM -0700, Guenter Roeck wrote:
> On 10/13/25 20:20, Guenter Roeck wrote:
> > On 10/13/25 18:15, Tao Ren wrote:
> > > Hi Guenter,
> > > 
> > > On Mon, Oct 13, 2025 at 05:20:57PM -0700, Guenter Roeck wrote:
> > > > Hi,
> > > > 
> > > > On Sun, Jul 27, 2025 at 10:56:13PM -0700, rentao.bupt@gmail.com wrote:
> > > > > From: Tao Ren <rentao.bupt@gmail.com>
> > > > > 
> > > > > Include "facebook-fuji-data64.dts" in facebook-fuji dts to avoid
> > > > > duplicated code.
> > > > > 
> > > > > Fuji-data64 and Fuji are identical except the BMC flash layout.
> > > > > 
> > > > > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> > > > 
> > > > With this patch in the mainline kernel, the Ethernet interface I use for
> > > > testing does not come online when loading fuji-bmc in qemu.
> > > > 
> > > > Reverting this patch fixes the problem.
> > > > 
> > > > Looking into this patch,
> > > > 
> > > > > -
> > > > > -#include <dt-bindings/leds/common.h>
> > > > > -#include "ast2600-facebook-netbmc-common.dtsi"
> > > > > +#include "aspeed-bmc-facebook-fuji-data64.dts"
> > > > ...
> > > > > -&mac3 {
> > > > > -    status = "okay";
> > > > > -    phy-mode = "rgmii";
> > > > > -    phy-handle = <&ethphy3>;
> > > > > -    pinctrl-names = "default";
> > > > > -    pinctrl-0 = <&pinctrl_rgmii4_default>;
> > > > > -};
> > > > 
> > > > I don't see this in aspeed-bmc-facebook-fuji-data64.dts, meaning that
> > > > interface is now disabled. Adding it back in fixes the problem.
> > > > Also, MAC3 is explicitly enabled for fuji-bmc in qemu.
> > > > 
> > > > Was the interface disabled on purpose ?
> > > > 
> > > > Thanks,
> > > > Guenter
> > > 
> > > The mac3 interface was removed in the latest patch (v4) per Andrew Lunn's
> > > feedback, because the rgmii setting is incorrect.
> > > 
> > > I was planning to add mac3 back as soon as rgmii support is properly
> > > handled in aspeed mac driver, but kindly let me know if you have other
> > > suggestions.
> > > 
> > 
> > All I can say is that it worked just fine with the qemu emulation,
> > and that it is broken now. Since it was broken on purpose I guess I'll
> > have to find a workaround or stop testing network interfaces with
> > that emulation entirely.
> > 
> 
> Ah, I see that mac3 was the only enabled Ethernet interface on that system,
> so you effectively disabled networking on it.
> 
> I don't claim to understand the logic (how can anyone continue to use this bmc
> without network interface ?) but I guess it is what it is. I'll stop testing it.
> 
> Guenter

Sorry for the inconvenience.. I have to take a local patch to enable
mac3 in my environment, because as you said, it's not useful without
network interface.

Meanwhile, I will need to work with ASPEED to enable rgmii delay support
in the ASPEED MAC driver so I can add mac3 back to the dts. If you are
looking for a similar platform for testing, you could consider elbert.


Thanks,

Tao

