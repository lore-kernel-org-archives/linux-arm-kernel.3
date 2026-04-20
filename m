Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 993A4F588EE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 16:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jj5sN2uTms9dvgIclsPIFzN9As6sQ9fjVMFAHrqzo4M=; b=wGrUu4MFw7CYL3SuOc1Vn9cZ9i
	oiojWnQj5nRG/StEdsR0lCVQ0UV5Dj50/h4xwCjSHI7hDn9tdNSvfrEXmOKAFTYcKoZjAtreVBMGW
	3ZKXJkIWWr/GC6HMmvfs4NEz06ymr014PUBMoD8jwrhkO6eiAS1NPnYFlH2VqPTjE+7rM3m43Fd+q
	bRrh+DdxvEJ+8kZG/oXRVYmjlVFNDScOycVyco8D/ZKfNCbEJYYvgBGSqstoCid+jLFenvIrNGC0P
	flqIMZnMdEow+4eYU06JeClU4tXGVN7Ei4aqnpWqbjnVFykR3WAxsAwVduuzW3Ul+pe5v6sbufHyW
	okbaTxwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEr6h-00000007OPv-2a0R;
	Mon, 20 Apr 2026 16:04:19 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEr6d-00000007OOp-1BCZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 16:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776701053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Jj5sN2uTms9dvgIclsPIFzN9As6sQ9fjVMFAHrqzo4M=;
	b=WlhqX5MikZC3CuGa2PEoTwgntFQ+pn274pIxHeX8G46H85tcQl2FxEeSBae9yMs+1HPNfl
	DhICptOmn8nfAUq8NS2uMEpCCPLc1f3h6hot54Z56PCqyRmiEq5Vf/3NuJRkoVU1+wXq1F
	bDPX9RhJon5tIZgx4qWSlB7F39uSljE=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-298-qRwK2d7pNu23kJ3y2Ju-lQ-1; Mon, 20 Apr 2026 12:04:08 -0400
X-MC-Unique: qRwK2d7pNu23kJ3y2Ju-lQ-1
X-Mimecast-MFC-AGG-ID: qRwK2d7pNu23kJ3y2Ju-lQ_1776701046
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-60fc71622f7so765395137.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 09:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776701046; x=1777305846;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jj5sN2uTms9dvgIclsPIFzN9As6sQ9fjVMFAHrqzo4M=;
        b=oQ7JYDZMoiv3iGBTH3LB31Lb7B85jx3+2PRCxlfb+BOti8IK2a5aEMtiP9eYovyOy6
         phEmqL25NZuwzidhNfjtfWgeOKkKx8jA5f6bt5KafNflXH1l+bSDHaL+jjO0C5WrQ5nC
         YMjVXV8vOvbzqTyBHhDdwi5Ye29j1ZnMUzzNLN1FAxC0X6LIFa45Kf8mv12MP4PJmKTM
         od07CdeXykgjxg08l5+w2IVMmft4nVnQzZWJN/auoHl5ioBjkX+/2zzfF6dd73O4IOfP
         AkqjKuvSncKOB85DC12mF3Fv8BAa9jr8uEZcG9GHgClN/GmN0Au2z8yXAMbA83jq/o5R
         5CGA==
X-Forwarded-Encrypted: i=1; AFNElJ+5SUyzkv4xaCYlUkmRk2Onp2eNLq/SbYrC+zD+pytIGNA3fSBEjYNtZC9N18LSm9BlTCc7SOMtfaCtQeRoJ/nC@lists.infradead.org
X-Gm-Message-State: AOJu0YzhKcNnPClXGwK9ImQO2XvH+jVerGE5vRh+vvfLMvYIaF4c46fZ
	J8s58242Fe6PJ82ZB7cRy9ZJGqFaSVQmTmkt/KisBUvL6JwNZN141lR5G1t4IO8LQOnpebojzMF
	EDLFBGc3wuBTT1nSk52OtXL0+8F2bjnKa763U5SE224Sc/rugde9zzBOqjoprMTHNjFXpg5NOp+
	Kd
X-Gm-Gg: AeBDiesOn9rJe3gao9WZUtc1moMtnkHrKKFFXobND8u5byjGln89u92Z//8Klo3JgKQ
	IDOEWrtN2LtpsFOpXchnwwpfZreeFu5eV6kcOyLNnYu3pyLe9XJrQxGPtoJHgk/nd0JcENGeCuQ
	34SypJekfZCJ1nWGwgQ/8PCNIWapWFvAs8YYLfLBRoTD7T782iZuqixiQHHFU9cYh8HuFdE4hLs
	IagZLoMadcARGbiyXqjgD1/Jk8U6HH3QRORz91aFaFAoFoE8DrZGpQrr27XeBmlTL5UtOPHZpWe
	osB0pxeTypB9mm7nnpCQrbW3KaZzIctphgUM5K722cpibNWqBwNi3jJu9/4rJ+96loQd77qhlo3
	TvbNqGXeEc6cxbuK+5KaPnFIMY3up/iKH6FATe7M4vQ==
X-Received: by 2002:a05:6102:1611:b0:605:7a45:c7c0 with SMTP id ada2fe7eead31-616f70f0572mr5907128137.13.1776701046015;
        Mon, 20 Apr 2026 09:04:06 -0700 (PDT)
X-Received: by 2002:a05:6102:1611:b0:605:7a45:c7c0 with SMTP id ada2fe7eead31-616f70f0572mr5907043137.13.1776701045394;
        Mon, 20 Apr 2026 09:04:05 -0700 (PDT)
Received: from rh-jkangas-kernel ([2601:1c2:4400:6bf0:7677:bcee:4ef0:e09d])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d69abee3sm817868185a.17.2026.04.20.09.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:04:04 -0700 (PDT)
Date: Mon, 20 Apr 2026 09:04:00 -0700
From: Jared Kangas <jkangas@redhat.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Chester Lin <chester62515@gmail.com>,
	Matthias Brugger <mbrugger@suse.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@oss.nxp.com>,
	NXP S32 Linux Team <s32@nxp.com>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linaro-s32@linaro.org, netdev@vger.kernel.org
Subject: Re: [PATCH v6 3/3] dts: s32g: Add GPR syscon region
Message-ID: <aeZOcCOgMy2g9wqp@rh-jkangas-kernel>
References: <cover.1769764941.git.dan.carpenter@linaro.org>
 <0e922537c02d1c47734142090f98eb78e921ed34.1769764941.git.dan.carpenter@linaro.org>
 <aeKn2dvOOO43zdev@jkangas-thinkpadp1gen3.rmtuswa.csb>
MIME-Version: 1.0
In-Reply-To: <aeKn2dvOOO43zdev@jkangas-thinkpadp1gen3.rmtuswa.csb>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tPQedfGo2xfS7jTDuE48jgP2eqoXjEBNFzhL9ClHsCE_1776701046
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_090415_390059_0610A57C 
X-CRM114-Status: GOOD (  23.69  )
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

Fixing Dan's address based on mailmap update, sorry for the noise.

On Fri, Apr 17, 2026 at 02:36:25PM -0700, Jared Kangas wrote:
> Hi Dan,
> 
> On Fri, Jan 30, 2026 at 04:19:52PM +0300, Dan Carpenter wrote:
> > Add the GPR syscon region for the s32 chipset.
> > 
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > ---
> >
> > [snip]
> >
> > diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> > index e314f3c7d61d..be03db737384 100644
> > --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> > +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> > @@ -383,6 +383,11 @@ usdhc0-200mhz-grp4 {
> >  			};
> >  		};
> >  
> > +		gpr: syscon@4007c000 {
> > +			compatible = "nxp,s32g3-gpr", "syscon";
> > +			reg = <0x4007c000 0x3000>;
> > +		};
> > +
> >  		ocotp: nvmem@400a4000 {
> >  			compatible = "nxp,s32g3-ocotp", "nxp,s32g2-ocotp";
> >  			reg = <0x400a4000 0x400>;
> > @@ -808,6 +813,7 @@ gmac0: ethernet@4033c000 {
> >  			compatible = "nxp,s32g2-dwmac";
> >  			reg = <0x4033c000 0x2000>, /* gmac IP */
> >  			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
> > +			nxp,phy-sel = <&gpr 0x4>;
> >  			interrupt-parent = <&gic>;
> >  			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> >  			interrupt-names = "macirq";
> 
> I gave this a test on an S32G-VNP-RDB3 and didn't see any issues on the
> dwmac-s32 side, but this appears to trigger a panic when reading the new
> debugfs regmap/*/registers file for the syscon node:
> 
>     # grep 4007c000 /proc/vmallocinfo
>     0xffff800083da8000-0xffff800083dac000   16384 ioremap_prot+0x74/0xe0 phys=0x000000004007c000 ioremap
>     # cat /sys/kernel/debug/regmap/dummy-syscon@0x000000004007c000/registers
>     Internal error: synchronous external abort: 0000000096000210 [#1]  SMP
>     [...]
>     CPU: 0 UID: 0 PID: 4344 Comm: cat Tainted: G   M        E  X   ------  ---  6.12.0+ #226 PREEMPT_RT
>     Tainted: [M]=MACHINE_CHECK, [E]=UNSIGNED_MODULE, [X]=AUX
>     [...]
>     pc : regmap_mmio_read32le+0x44/0xa0
>     lr : regmap_mmio_read32le+0x44/0xa0
>     [...]
>     x23: ffff00080c080000 x22: ffff000802ac4c00 x21: ffff800087b13c9c
>     x20: ffff800080a46494 x19: ffff800083da810c x18: 0000000000000004
>     [...]
>     x5 : ffff800080a46448 x4 : ffff800083da8000 x3 : ffff800080a46494
>     x2 : ffff800080a47230 x1 : ffff800083da810c x0 : 0000000000000020
>     Call trace:
>      regmap_mmio_read32le+0x44/0xa0 (P)
>      regmap_mmio_read+0x4c/0x80
>      [...]
>     Code: 52800400 8b214093 aa1303e1 97f4caf0 (b9400275)
>     ---[ end trace 0000000000000000 ]---
>     Kernel panic - not syncing: synchronous external abort: Fatal exception
> 
> Running this through decodecode gives:
> 
>     All code
>     ========
>        0:   52800400        mov     w0, #0x20                       // #32
>        4:   8b214093        add     x19, x4, w1, uxtw
>        8:   aa1303e1        mov     x1, x19
>        c:   97f4caf0        bl      0xffffffffffd32bcc
>       10:*  b9400275        ldr     w21, [x19]              <-- trapping instruction
> 
>     Code starting with the faulting instruction
>     ===========================================
>        0:   b9400275        ldr     w21, [x19]
> 
> x19's offset from the base address in /proc/vmallocinfo is 0x10c, which
> points to a bad read at physical address 0x4007c10c; I also confirmed
> that the preceding memory reads back without issues:
> 
>     # head -c 990 /sys/kernel/debug/regmap/dummy-syscon@0x000000004007c000/registers | tail -1
>     0104: 00000000
>     # head -c 1005 /sys/kernel/debug/regmap/dummy-syscon@0x000000004007c000/registers | tail -1
>     0108: 00000000
>     # head -c 1020 /sys/kernel/debug/regmap/dummy-syscon@0x000000004007c000/registers | tail -1
>     <panic>
> 
> Best,
> Jared
> 


