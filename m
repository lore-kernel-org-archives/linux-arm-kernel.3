Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58598CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 04:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6IWAevNcHXjFvzpaRr8LOfdvjd37W/dKCFMhW8BIdjo=; b=nPMwYE8G0kgQu30G67Q3TWD2rb
	9r0qYF7r+Vx1psFZ5SGCEltlL7vmJSzRKEIwrZtT5ezEE5T6l7LZb2M54Jv8ncxvi4LHXG3ijYuF/
	flYEdU8jrmUQaCrDdnQv/9EPsV5BoXDTs8utqO8fir060VznIhKychgxCWeqwki/nm/WB4bVAWq+p
	8535fjYWU4WgUoou47wirSwN9NGF25T0TcUxDyLg22saSbVHV/VknkkfQlMAhtbCbZWpbJup3SurE
	2uOR4L2XTHbA1v8yAZdKMaapqtzMzie3a4oif4O9FcF2OTBK8IfI1RGW2DqV9O7d2s/VH6VO1NUmw
	gVizhDdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Wuu-0000000F8Hr-0qfU;
	Tue, 14 Oct 2025 04:45:44 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8Wus-0000000F8H7-0Ega
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 04:45:43 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-3306d3ab2e4so4859701a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Oct 2025 21:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760417141; x=1761021941; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6IWAevNcHXjFvzpaRr8LOfdvjd37W/dKCFMhW8BIdjo=;
        b=KqmQp72Sts9AZYGpxEXt+qBYVJJzPluUwVuAJbD5iOphysc0W5Tsch5xQJQROyrJgm
         olmUX+4PELsQYwcCO9CvWdzc67QFxAH4kvMcrTHUu8JHht7enc0WAgnBnu5Il40+B6Qj
         rH5kjgs9/mec/XG1Tgdi8Mmz4DSMpobApAOElPPLi/Og3DcW+Dte5GbKgAWHYz+qMkcS
         EwDTKrKpinazw14wmPx2X6LnQTcOZBQbNMuGBCAp8pIaZQsHZbDjXY9rL4gbS8sYtuxT
         fLSlSoCTIUmEXMnEu4C8imiieHCmGFps/XpI2+iQlwcOElm+tqXNPpLF90iMreHj/5Px
         0SEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760417141; x=1761021941;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6IWAevNcHXjFvzpaRr8LOfdvjd37W/dKCFMhW8BIdjo=;
        b=w1DlTZC/5FRQ+Y+Tq+ATDai/zjzyJ2egigWFnFYHne7gB7BcTtf1aRC8Ax/8CteJKk
         51bihElebONCxXFUi3ZIKPr0mabmwJjT9whVo2NZWN1dqrO3kTvPGLCmPsvsyG0F7qxq
         KasKk/U33+VLWZvjwISWRMdTdxQ4uxEeH2aLnc0gsY3kUDBHHlXGurK037Kz2e/d+7Ky
         IiEwaKFe8PO9ZsXJVfJ6itWlE/Acf5gffZP8BATwQQR/K/32YgYfgMv6A0SXACb+aRkL
         0D+0Xj6+EvkPimZn13RbcQT1oZx3oXDMxy3kGdb0VS06r9NQXlJs3QGc5Ij8lFyjdr+G
         k9Hw==
X-Forwarded-Encrypted: i=1; AJvYcCXxZJ5rKbdTViLdjw3H4x2Q1J36uqea+catSQtqyO9r9LbCCBjcqS+MAQNp3dmJAaOsvPxhXQ30jl/OZYHO6Ufe@lists.infradead.org
X-Gm-Message-State: AOJu0Yy37lp0lYkl4zEwa1Wg5nXl0KJ2aSustIHJnJGb2hFIrO8+KbZl
	qIfABwNx/Z8IOr7vG2Xqv1vgtTQtckkY/fcKdsKuYi61YZK/PPC3dDPd
X-Gm-Gg: ASbGnctPlz4l+W4F+U86p26Rc295bXfha51s01alVHqLxILBFoR+BMu3rj2M8ZaNpdf
	k1r9rHZSudiSg5v+uC7rZbhJv0rtn+/yprzVvdIzfoCR9Tro/3YIVTFjwxVnUpciOa8fOYB9Zf6
	cP2FOti52MHOJNlUg1YWNj+sMGD5jC7O6BfQ0Fs82rRzpVM15oFTEZ4gWE/v6YWeZtQPS2Nzw2c
	Ct/sCNcXy0+mbj/ugolrl7EavKqaiLqyPh5NfTIAC+2rT003qIdvm3+6VhOtcpV/zbJt0duHFb3
	/VrIH+HKU5JfKUH2raS4HdwEbcmNhGbzHXi5KU2VF99bWJ4gF4vrIVODR5HeUSdTO7oKmSjRabn
	gxHej9ls7HoT//aiClK20nwGiQdTzWJwx0HffbTy6m0T5V2i09yurFMUl/4WRt++5w2Tiwate6g
	==
X-Google-Smtp-Source: AGHT+IFpInrQ3BK2IUoEdZQ4XEmHh6tIaVzcz4A5h+n6G2cV7PgK4L9/NeRbvXUR10GkJ9cgViH1AA==
X-Received: by 2002:a17:90b:1b41:b0:32e:6019:5d19 with SMTP id 98e67ed59e1d1-33b513bdffdmr29320243a91.34.1760417141038;
        Mon, 13 Oct 2025 21:45:41 -0700 (PDT)
Received: from fedora (c-76-133-73-115.hsd1.ca.comcast.net. [76.133.73.115])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626d15e2sm14122596a91.21.2025.10.13.21.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 21:45:40 -0700 (PDT)
Date: Mon, 13 Oct 2025 21:45:38 -0700
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
Message-ID: <aO3VcnvDgtYLLjoI@fedora>
References: <20250728055618.61616-1-rentao.bupt@gmail.com>
 <20250728055618.61616-12-rentao.bupt@gmail.com>
 <79ddc7b9-ef26-4959-9a16-aa4e006eb145@roeck-us.net>
 <aO2kLyxGlGt12sKD@fedora>
 <e3dc7aee-c8af-4276-84e5-0f0c7926be05@roeck-us.net>
 <054cf209-61af-4d21-9a3b-d0f6dd24ee3b@roeck-us.net>
 <aO3M90Ycp2DWyFuk@fedora>
 <04dbdd20-69c1-48fe-9bc7-7e9ffaedbe9a@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <04dbdd20-69c1-48fe-9bc7-7e9ffaedbe9a@roeck-us.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_214542_107433_5C3CE033 
X-CRM114-Status: GOOD (  38.31  )
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

On Mon, Oct 13, 2025 at 09:35:43PM -0700, Guenter Roeck wrote:
> On 10/13/25 21:09, Tao Ren wrote:
> > Hi Guenter,
> > 
> > On Mon, Oct 13, 2025 at 08:44:17PM -0700, Guenter Roeck wrote:
> > > On 10/13/25 20:20, Guenter Roeck wrote:
> > > > On 10/13/25 18:15, Tao Ren wrote:
> > > > > Hi Guenter,
> > > > > 
> > > > > On Mon, Oct 13, 2025 at 05:20:57PM -0700, Guenter Roeck wrote:
> > > > > > Hi,
> > > > > > 
> > > > > > On Sun, Jul 27, 2025 at 10:56:13PM -0700, rentao.bupt@gmail.com wrote:
> > > > > > > From: Tao Ren <rentao.bupt@gmail.com>
> > > > > > > 
> > > > > > > Include "facebook-fuji-data64.dts" in facebook-fuji dts to avoid
> > > > > > > duplicated code.
> > > > > > > 
> > > > > > > Fuji-data64 and Fuji are identical except the BMC flash layout.
> > > > > > > 
> > > > > > > Signed-off-by: Tao Ren <rentao.bupt@gmail.com>
> > > > > > 
> > > > > > With this patch in the mainline kernel, the Ethernet interface I use for
> > > > > > testing does not come online when loading fuji-bmc in qemu.
> > > > > > 
> > > > > > Reverting this patch fixes the problem.
> > > > > > 
> > > > > > Looking into this patch,
> > > > > > 
> > > > > > > -
> > > > > > > -#include <dt-bindings/leds/common.h>
> > > > > > > -#include "ast2600-facebook-netbmc-common.dtsi"
> > > > > > > +#include "aspeed-bmc-facebook-fuji-data64.dts"
> > > > > > ...
> > > > > > > -&mac3 {
> > > > > > > -    status = "okay";
> > > > > > > -    phy-mode = "rgmii";
> > > > > > > -    phy-handle = <&ethphy3>;
> > > > > > > -    pinctrl-names = "default";
> > > > > > > -    pinctrl-0 = <&pinctrl_rgmii4_default>;
> > > > > > > -};
> > > > > > 
> > > > > > I don't see this in aspeed-bmc-facebook-fuji-data64.dts, meaning that
> > > > > > interface is now disabled. Adding it back in fixes the problem.
> > > > > > Also, MAC3 is explicitly enabled for fuji-bmc in qemu.
> > > > > > 
> > > > > > Was the interface disabled on purpose ?
> > > > > > 
> > > > > > Thanks,
> > > > > > Guenter
> > > > > 
> > > > > The mac3 interface was removed in the latest patch (v4) per Andrew Lunn's
> > > > > feedback, because the rgmii setting is incorrect.
> > > > > 
> > > > > I was planning to add mac3 back as soon as rgmii support is properly
> > > > > handled in aspeed mac driver, but kindly let me know if you have other
> > > > > suggestions.
> > > > > 
> > > > 
> > > > All I can say is that it worked just fine with the qemu emulation,
> > > > and that it is broken now. Since it was broken on purpose I guess I'll
> > > > have to find a workaround or stop testing network interfaces with
> > > > that emulation entirely.
> > > > 
> > > 
> > > Ah, I see that mac3 was the only enabled Ethernet interface on that system,
> > > so you effectively disabled networking on it.
> > > 
> > > I don't claim to understand the logic (how can anyone continue to use this bmc
> > > without network interface ?) but I guess it is what it is. I'll stop testing it.
> > > 
> > > Guenter
> > 
> > Sorry for the inconvenience.. I have to take a local patch to enable
> > mac3 in my environment, because as you said, it's not useful without
> > network interface.
> > 
> > Meanwhile, I will need to work with ASPEED to enable rgmii delay support
> > in the ASPEED MAC driver so I can add mac3 back to the dts. If you are
> > looking for a similar platform for testing, you could consider elbert.
> > 
> 
> AFAICS aspeed-bmc-facebook-elbert.dtb does not work with the fuji-bmc machine.
> The console interface or wiring seems to be different.

Oh you are right (the console settings are different).

 
> As I said, I'll stop testing the network interface on fuji-bmc. That reduces
> test coverage, but there is nothing I can do about that. I already made the
> necessary changes in my testbed, so from my perspective the issue is closed.

Got it. I will drop you a message when I add mac3 back (if you feel it's
helpful).


Thanks,

Tao

