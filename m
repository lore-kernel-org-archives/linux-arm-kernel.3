Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E2CC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 22:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m0aMkvFlpD7qcpmPu98mFfzTGpFjwWgjgBJW3Blyf0I=; b=tsPI5sffpmPmMBH4TG4grzsZSh
	9UppdMkdHmSTa59RiftXnOx6WaoOBi8BoPFTy3bYKggnWbpGn1OF96pdYEzXZFGVgzGA8cNV2d+VS
	lm9MH1iwpY7UgVMOJdwdFZbR0Ay/4DM0+dwgJ1mytwSl2HfAJWJRpG4QBfaeUkXQjzZllDgDGDIYj
	AiYKnDSjUicwH7tKdroM2HHM18IZlb8vkafn1SQfAWFS+VPvyyG2mi0yhuJ0K4v6FejGcM0Zx5x6O
	MVDMxaC6NdASEdBDsVJlEer/JRWajxeZXCVMnXMTj2G4DnuCWuU/LjsYyNlN5cLzVuGUbAzJkUp/V
	cEdyQ6kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj2hX-00000007os6-0y3S;
	Sun, 12 Jul 2026 22:31:07 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj2hU-00000007orF-2Ium
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 22:31:05 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso2768398b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 15:31:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783895464; x=1784500264; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=m0aMkvFlpD7qcpmPu98mFfzTGpFjwWgjgBJW3Blyf0I=;
        b=oEt4GWRWKmmuzjTpaXg38lTrD0rMeZUvDqM4FABTcUCP/yJdDYFLM5kvSSeOW3SI2k
         tB/MO/Kq2iTe9CiaADK1z365Zstz6cbx55TRoK/kWfHU0ho/uj2STBz+K/eIMw2DMdzM
         P9eB9kb/YCc4L8GK+3w7tmG/MgLwRhpCopjD8uR7iMhyISnKoHD7LjKRwT2+Kct6X8wW
         VNWcI1E81tTma0Cacjp5C9RyiLBSSYfIv5MhpP5YbNGW98xVoAF54OHw8kbZTn7o2Mg6
         F6MRjNtdqZb7w16UZIQLUI6Wt7V7MdKAstEfFe1naJ2KFPacggad/CKod2fwP65v3ykf
         38Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783895464; x=1784500264;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m0aMkvFlpD7qcpmPu98mFfzTGpFjwWgjgBJW3Blyf0I=;
        b=d9EwrnmLlozzHA/aYEkYggp3c5xlronXBhvJgqml6koLVzs5Yvfyh9uCgjgDtTFMyN
         0QgiYBe7oFG1BuT1/mSLF3l/6iOrHtqwCRz9U8ygoktFuXTfUxGFj7bz+6r8XUoNoZwl
         1Y+hVLjgTQr88CGysCDQyfqOwEZ253EoLObweFtr/tI4Uas3Sp7SS8aBuMUDm/kB5sFz
         HI+DolNvSFlLie4L6Tcu6BV9KfaJ/N1sHKwZi35MBDwUwb/WlYmucbyv8Pj9PrPve7Q/
         KX71PM5R3pRPPR66iUEM+jDn+MnPhImObpClbAb7jSgl65mdavheGBDXGxtaXiUTyT5K
         /czQ==
X-Forwarded-Encrypted: i=1; AHgh+RpNIZqqGEUmZ2/WCoAQ4XOWsrCcfsTE1oaZ4AR6GApQx+q/AZZyehAVBF7K7ETXgI6aFgwBJ6017ngYGA5sHypw@lists.infradead.org
X-Gm-Message-State: AOJu0YysF3yUVmq9raWQx5uLvb7juV+kbTJGS4vraXWs2dyLbwgTX5X2
	ApV+SWGEnTcR3avaxmX46u8/J8iiCWvBKUq/tEqt8bnZ1uLbf1SmYY4o
X-Gm-Gg: AfdE7cnRv99TBzWKBINOnhrnKCjF9k4ZvAnon+0nO1N0wc8iReRrriWd3rSofoGI0cA
	42gaEKSVPa8/G3nl+bxrCKJAsV5UpB5fQ0nVkZ8HIZxEmGEok8xtoAQvk3Bt8FKvRnGS1RugJW7
	lyApigorn7Ex4HYfV+q82C12adUwzBbJYx3Xlb2EBz7+m46Nc4Zsoh061krGPxwfRYvgzpDG8nA
	GZKfE6OeTPDIuIKht9KGpAMnsiJvI3a5P5TzGS9XNNL63AdXoOLBP7mlXzLwcNzWFttIke6Zw/U
	40uA4LH/vFhDcjQQ9q+WxIaCNolnQxevcnmzL7qx2KRGi0tuo+Lv3scb8Oxgf72ps73Lckohmfd
	e3B/3+E6jneX2uENm4brp63Hv3uivhDT5OEdBjcmCzZEMjr8k+rWw+BP3qSIR9Luk
X-Received: by 2002:a05:6a00:3e24:b0:847:86b0:888c with SMTP id d2e1a72fcca58-8488971d94bmr6700212b3a.48.1783895463640;
        Sun, 12 Jul 2026 15:31:03 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a3b8d3310sm345744b3a.40.2026.07.12.15.31.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 15:31:03 -0700 (PDT)
Date: Mon, 13 Jul 2026 06:30:19 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@google.com>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Yixun Lan <dlan@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, E Shattow <e@freeshell.de>, Han Gao <gaohan@iscas.ac.cn>
Subject: Re: Failed to reinit phy of spacemit-dwmac when reset-gpio is present
Message-ID: <alQVRx2vCWnqCDEs@inochi.infowork>
References: <20260712045233.800748-1-inochiama@gmail.com>
 <bc78469c-3f45-4234-88b0-49f050d651db@bootlin.com>
 <8689bf7d-e00d-4097-bd3c-4d7d7844d1d2@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8689bf7d-e00d-4097-bd3c-4d7d7844d1d2@lunn.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_153104_586834_44C60F5F 
X-CRM114-Status: GOOD (  13.59  )
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

On Sun, Jul 12, 2026 at 03:49:43PM +0200, Andrew Lunn wrote:
> > > --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > > +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > > @@ -196,7 +196,8 @@ &eth0 {
> > > 
> > >  	mdio {
> > >  		phy0: phy@1 {
> > > -			compatible = "ethernet-phy-ieee802.3-c22";
> > > +			compatible = "ethernet-phy-id001c.c916",
> > > +				     "ethernet-phy-ieee802.3-c22";
> > 
> > Indeed that's merely a workaround :(
> 
> Despite is being a workaround, there has not been much progress on a
> generic framework for dealing with clocks, resets, regulators etc,
> before probing PHYs. So this is probably what you want to do.
> 
>        Andrew

OK, I think I should accept the fact and let this workaround
solve the problem.

Regards,
Inochi

