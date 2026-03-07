Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BCD4FC9EF2
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Mar 2026 10:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kxAFLIo2duFLvyleCapVzvrjVC+/uI+OGdjb9IusDqg=; b=Af61TQva3Z/Cy/WLtgG9z3YpBl
	fNta4dpIU0AfcsfkebZ1Q5a8UOXJjALKRhWnfx300p1qhvr0pRvM1S9uKyK7zx/WDbfmqn/al6JCN
	udDP7LQx+B8XiOrO5J1zM6BvG0poCYspb522sEkipaZAps0Exnt8B5NRmoDEY/GljDwNsNPaf4f7N
	rEXCXN5KJxR0kBM+ZsNvDbNFZlnkVx8nhYb8lPsIn2+qqLUCLjPoSMuZgJKiogTtcWCDeebmxXMBr
	sOC2qfICh/JonVxdGBkMevw71rRLpXZfcDj2Km9NwUro2OiV/Ek6qVTPZ+KcnSGgQNddOeX3pLP/I
	M7rzpYEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyozQ-000000056Pt-212B;
	Sat, 07 Mar 2026 10:34:32 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyozN-000000056PA-3diH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Mar 2026 10:34:31 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4852f8ac7e9so4670155e9.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Mar 2026 02:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772879668; x=1773484468; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kxAFLIo2duFLvyleCapVzvrjVC+/uI+OGdjb9IusDqg=;
        b=URghxLCb3Tuz9Gxrknk08Z9i3SsEttr83y9WvsTXSrMi4Dajbs5GmSZ4wJohzv98QB
         leUyojN/klnrK0X+QVoCRCim9IWj+TMBEXZQ+rWrUPypjrGFknHXJgGK4tXjU8KixYQg
         Rug44ziIvzCdbjYbZNROgPOBqY2Ks1URI1z05TklvlukXlL5fP12ZP2bYExgGi8JHqtW
         3vCcxBb1iZJK+0fnWXkj+68B3xWGNqRmqfx4EI5Crbp2/W2vFFaaik8osCbe3lQ2DOSS
         aPmDTiINBe6T8SIQ0Nbw4JuB4xhKhCoobreJAaFW8zG2yrLGeZ2fKD7yoF4QsxC5xUE/
         kxFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772879668; x=1773484468;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kxAFLIo2duFLvyleCapVzvrjVC+/uI+OGdjb9IusDqg=;
        b=WZcDjsf1rHJgPWhnRW01CONY7axmxVvzbQmGFGh7+h8jvYCsJGd3cyCIy/BZfvztDR
         AzIZUax8BVBAosRwqyRBHA49PjDaWeMxCM6RCD1bWtQe60qLooQLeH8vPJ1BSrZnVFfe
         sbJelBCnZR/nYP6F58GGzEreqxBNZdRGJjyQgB+VgtuZYTbVWxJy4XWqRfMGBgwqmGoy
         8arvmoy/BmBbTBjZlexKlOvV3+QqrYVQcz+8sh6unHR67Lb1uLvzhW1V5UCc7/ESgbEV
         hO6oKkWdHCbPBUau4HKo9QIHDwj00Dg8RRY+1Dd41vfexiiAy9OA/exELmPUSeRruLj/
         lhFw==
X-Forwarded-Encrypted: i=1; AJvYcCXlvUL/DGf9g51e7H5PG38nxUIe0F5/L0v1v9Zbei35zB/GA4Z51ZQSIqNKMMj16pW7qBRzLh79JcNOKSP5N+fr@lists.infradead.org
X-Gm-Message-State: AOJu0YxShp4HhRtrciZ8g+ukkSK4qn45DpVRrAwSqWZAQYX4qhZc43ij
	f2aUup0uY/NpND9w8Yg4LcDlde3/3YeGOlzAug7gPbtBH6n7YawZQ3az
X-Gm-Gg: ATEYQzxvamvEyC4aI0txO1j8HqiNro2Kz+R9qpyziqrBQFYJz0MGzJdTWQCmBblMdkH
	zYRd8d8SnIaKgcc8u9C6Enx/SYABU5y2R7tVxxRC7cTbhx4O4FGO0ekrKEnI8pVMjCZh7Sc0+zB
	zs3s92XIjCRwYvfsL61/SgJlEvY6dHBSAAxBscFwvlAgGScTrickA6w6PQ/0Mfm5JE/mW1Iz6aK
	CBC3r2+AbIwxWgsJqSIrvKJASuzSJ9JD4ud4ZL7p/5CCmn1ZhdJsRCZFLJl+fXfO1cyuiBwkpuY
	TDbaUqtxG2M8AnU24XzCw548BFtqnlBMuLaCUXiAi6XngOEdRKvajdK5lzf+o6kyL4iLddKrP/y
	Zlr3W7zTb7eB0VZLexKSk0DAflsMo7WdpOu5C2fS876KOg7IRmfm73th6ROHcAD1Y6JTcu8ghR9
	cSfu9k5e6Ul/CZdIW+tMQYfJbNNZgMRwR/oxyT2MS200XL/jrB3BulDA==
X-Received: by 2002:a05:600c:46c3:b0:483:47ae:7c00 with SMTP id 5b1f17b1804b1-4852695aeaemr87092055e9.20.1772879667658;
        Sat, 07 Mar 2026 02:34:27 -0800 (PST)
Received: from Ansuel-XPS. (93-34-88-122.ip49.fastwebnet.it. [93.34.88.122])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485245dbcffsm38878465e9.18.2026.03.07.02.34.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Mar 2026 02:34:26 -0800 (PST)
Message-ID: <69abff32.050a0220.5ba1d.41cf@mx.google.com>
X-Google-Original-Message-ID: <aav_L8PiXANOR4cV@Ansuel-XPS.>
Date: Sat, 7 Mar 2026 11:34:23 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v6 2/4] dt-bindings: phy: Add documentation for Airoha
 AN7581 USB PHY
References: <20260306190156.22297-1-ansuelsmth@gmail.com>
 <20260306190156.22297-3-ansuelsmth@gmail.com>
 <20260307-strange-dinosaur-of-joviality-e6bc72@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260307-strange-dinosaur-of-joviality-e6bc72@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260307_023429_927014_20CA3054 
X-CRM114-Status: GOOD (  20.69  )
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

On Sat, Mar 07, 2026 at 11:31:05AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Mar 06, 2026 at 08:01:51PM +0100, Christian Marangi wrote:
> > Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
> > for the USB controller.
> 
> 
> A nit, subject: drop second/last, redundant "documentation for". The
> "dt-bindings" prefix is already stating that these are docs.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetree/bindings/submitting-patches.rst#L18
> 
> > 
> > Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> > always supported. The USB 3.0 mode is optional and depends on the Serdes
> > mode currently configured on the system for the relevant USB port.
> > 
> > To correctly calibrate, the USB 2.0 port require correct value in
> > "airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
> > selecting one of the 4 monitor clock for calibration (internal clock not
> > exposed to the system) but each port have only one of the 4 actually
> > connected in HW hence the correct value needs to be specified in DT
> > based on board and the physical port. Normally it's monitor clock 1 for
> > USB1 and monitor clock 2 for USB2.
> 
> ...
> 
> This must contain the header you are also adding/referencing here.
>

Thanks ok will squash the 2.
 
> 
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 364f0bec8748..d75f59118a9a 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -779,6 +779,12 @@ S:	Maintained
> >  F:	Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
> >  F:	drivers/spi/spi-airoha-snfi.c
> >  
> > +AIROHA USB PHY DRIVER
> > +M:	Christian Marangi <ansuelsmth@gmail.com>
> > +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> > +S:	Maintained
> > +F:	Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
> 
> No maintainers for the header?
> 
> > +
> >  AIRSPY MEDIA DRIVER
> >  L:	linux-media@vger.kernel.org
> >  S:	Orphan
> > -- 
> > 2.51.0
> > 

-- 
	Ansuel

