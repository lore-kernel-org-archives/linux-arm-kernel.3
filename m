Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5066AF588F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 16:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5E+UKYZ+gXk3KKDw9hC2HFOEQBrHQpFIVrnj4wNYvlY=; b=A9+e2x9GfNJV/BNgYOArqs7nAv
	U3knDb4czrlQsyJLgEdqizYMDseUXwY04+BtUtMroBDZivi9TjSdSpNNgPapipFuFWLX4ukAWiUzq
	GwBXXIC0A/acco+DnoZoa//nsAtfUTRw9mzqF612qM5MsoGlO6uGxqQp+nNZuUl1B8+inYMc/VAgb
	fpWhfZgiwMC8ExB8yMNWLrG85H9ic3/fl6of7XV7jdaa1NV+AJ/CbqRtE8D1Owt2NtRJdH0QsnX7b
	Xn5sgEUy7mTPGvxE/vHc2sYdIT/3tD/Ixyv2wHWXxT5zgb5owgLX4aAHp7l9mv39UPA6Cyk3A4JNs
	y80KAbPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wErl5-00000007S26-2ZHG;
	Mon, 20 Apr 2026 16:46:03 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wErl3-00000007S1I-341V
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 16:46:02 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-43fe62837baso1990930f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Apr 2026 09:46:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776703559; x=1777308359; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5E+UKYZ+gXk3KKDw9hC2HFOEQBrHQpFIVrnj4wNYvlY=;
        b=ZVtI06+1KPGn+PFSoE1srvwRsOdtosIA8s6J9gdNeag6huOsHe2ViGbaILHONvbK9z
         RoT74o8qs0E2Z07HJnCksRnRcbx0eRKcMlud3kkOmdJjEh7cr6xw3rq6RuKeS1cC3+Fk
         FnZwXvtTzlVq7E6aTUSnRZbmRvI9GzNOSvvclNYogOaP1OTMPzF6yEcxB/0nBlisdkaV
         LV9q2MIk4qQdbKvTIAnbZUtN2nibK7SGEtNCYmfToblCs/5g+ExAANGWBugX/6uPnXGs
         NuOGSuF7KI6Gltr3Bn1m+VfZKYLoUCT3Jdaq6dbYX1pxGH+qid/QUObmJZdSnPlT1yqI
         EIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776703559; x=1777308359;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5E+UKYZ+gXk3KKDw9hC2HFOEQBrHQpFIVrnj4wNYvlY=;
        b=CU0YBUUS14NzTqAtmtNpBx9fohcMlbzuZTqZ4Glw1bZx1tRnkaOFYTSEjiQ0bVUYqU
         4zTaR9oQV+0vL51WfJXjpFwzgmyKP8bciYwQYR7QyxYYzo5oXwt7zZtOD5efaZ2Qp++s
         8QhaCXEBpRtbhYr8tZm8F9FXv1njyHPHQi0MUHdvb2+tEgNGOlK4SPSRGpFQqxWqbfFr
         QX/6UfqMR4WZekR7y8GBkIyLRLm7ii4citzrc9xbSjRKp4mrXQiKzRImwEZzGLO92rxH
         foIYbdo35DTENmoFovWNOxvOAgaJ5m1cwwNEJMDkIRuOq8f5AKlL7ECR4iX7+/9ENnwT
         3fiA==
X-Forwarded-Encrypted: i=1; AFNElJ/LQZ9pJ2O5+WxBccXF8ZRHpbkIZ/EykKD5bMYs3D5p9u0cnIOBBgmuJEct7TnmdTP2TScmA6F+ScYbX6zlSgnm@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1TbY4k/Q/4H6fxVlEFoU/eFD7gwme5PPiXB72tB9a0/MbBjGj
	jdle3pNgB4BhHHGyTNhnONqwROL/DM5yCnGmzS25cA+h+Enh+Uhonb50
X-Gm-Gg: AeBDieuajoQTYz0joH0N82bFPiNJ33SYfXwvhtj7y5q/DyalDzNCP2n5xulPCgf9pNd
	6eZ0gq3zlMg7cLYD46y7OOYOmt9F02J6G7FwJvKzHKw5uk8Cu7l13LDVHIxu/yxcP1ymF7IqXvW
	Gj6aXhQeod4xl1k1nPNOh4nCJUPLHKlmDB9orgu88c+L4+RGGZP3/tdxRxKz7mvd463IOMMVGu6
	wRsruRU1TdTtIzo4tDht39rI0pE7fmf+9ptyHtUioNG4wzP2YQSjAt5zrfpXBxYPBoD67/q00Vr
	3NrCEv74MywFriaOWNKSSTX1B9nYhxlxze0hi9+8uXGArVDLFKxMiGvGa9Ur41YRQ2GsBhHOSiK
	v+s9Z3qom1+ySGUdXavgPrj3VTdC92CHtIfybVndWrNdwhlier0gxgxXErC4dbLb9XY9SRqYa1R
	HWWo5QYQkzV5RjQjs1ssTbsiU+gm9pu3yyFdDYHA/q
X-Received: by 2002:a5d:588f:0:b0:43d:2be:e54 with SMTP id ffacd0b85a97d-43fe3dfd4aemr21673354f8f.39.1776703558306;
        Mon, 20 Apr 2026 09:45:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a79esm32560450f8f.17.2026.04.20.09.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 09:45:57 -0700 (PDT)
Date: Mon, 20 Apr 2026 19:45:54 +0300
From: Dan Carpenter <error27@gmail.com>
To: Jared Kangas <jkangas@redhat.com>
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
Message-ID: <aeZYQp9b5aoV7Ihv@stanley.mountain>
References: <cover.1769764941.git.dan.carpenter@linaro.org>
 <0e922537c02d1c47734142090f98eb78e921ed34.1769764941.git.dan.carpenter@linaro.org>
 <aeKn2dvOOO43zdev@jkangas-thinkpadp1gen3.rmtuswa.csb>
 <aeZOcCOgMy2g9wqp@rh-jkangas-kernel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aeZOcCOgMy2g9wqp@rh-jkangas-kernel>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_094601_800673_FCE248B0 
X-CRM114-Status: GOOD (  27.24  )
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

On Mon, Apr 20, 2026 at 09:04:00AM -0700, Jared Kangas wrote:
> Fixing Dan's address based on mailmap update, sorry for the noise.
> 
> On Fri, Apr 17, 2026 at 02:36:25PM -0700, Jared Kangas wrote:
> > Hi Dan,
> > 
> > On Fri, Jan 30, 2026 at 04:19:52PM +0300, Dan Carpenter wrote:
> > > Add the GPR syscon region for the s32 chipset.
> > > 
> > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > ---
> > >
> > > [snip]
> > >
> > > diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> > > index e314f3c7d61d..be03db737384 100644
> > > --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> > > +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> > > @@ -383,6 +383,11 @@ usdhc0-200mhz-grp4 {
> > >  			};
> > >  		};
> > >  
> > > +		gpr: syscon@4007c000 {
> > > +			compatible = "nxp,s32g3-gpr", "syscon";
> > > +			reg = <0x4007c000 0x3000>;
> > > +		};
> > > +
> > >  		ocotp: nvmem@400a4000 {
> > >  			compatible = "nxp,s32g3-ocotp", "nxp,s32g2-ocotp";
> > >  			reg = <0x400a4000 0x400>;
> > > @@ -808,6 +813,7 @@ gmac0: ethernet@4033c000 {
> > >  			compatible = "nxp,s32g2-dwmac";
> > >  			reg = <0x4033c000 0x2000>, /* gmac IP */
> > >  			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
> > > +			nxp,phy-sel = <&gpr 0x4>;
> > >  			interrupt-parent = <&gic>;
> > >  			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
> > >  			interrupt-names = "macirq";
> > 
> > I gave this a test on an S32G-VNP-RDB3 and didn't see any issues on the
> > dwmac-s32 side, but this appears to trigger a panic when reading the new
> > debugfs regmap/*/registers file for the syscon node:
> > 
> >     # grep 4007c000 /proc/vmallocinfo
> >     0xffff800083da8000-0xffff800083dac000   16384 ioremap_prot+0x74/0xe0 phys=0x000000004007c000 ioremap
> >     # cat /sys/kernel/debug/regmap/dummy-syscon@0x000000004007c000/registers
> >     Internal error: synchronous external abort: 0000000096000210 [#1]  SMP
> >     [...]
> >     CPU: 0 UID: 0 PID: 4344 Comm: cat Tainted: G   M        E  X   ------  ---  6.12.0+ #226 PREEMPT_RT
> >     Tainted: [M]=MACHINE_CHECK, [E]=UNSIGNED_MODULE, [X]=AUX
> >     [...]
> >     pc : regmap_mmio_read32le+0x44/0xa0
> >     lr : regmap_mmio_read32le+0x44/0xa0
> >     [...]
> >     x23: ffff00080c080000 x22: ffff000802ac4c00 x21: ffff800087b13c9c
> >     x20: ffff800080a46494 x19: ffff800083da810c x18: 0000000000000004
> >     [...]
> >     x5 : ffff800080a46448 x4 : ffff800083da8000 x3 : ffff800080a46494
> >     x2 : ffff800080a47230 x1 : ffff800083da810c x0 : 0000000000000020
> >     Call trace:
> >      regmap_mmio_read32le+0x44/0xa0 (P)
> >      regmap_mmio_read+0x4c/0x80
> >      [...]
> >     Code: 52800400 8b214093 aa1303e1 97f4caf0 (b9400275)
> >     ---[ end trace 0000000000000000 ]---
> >     Kernel panic - not syncing: synchronous external abort: Fatal exception
> > 
> > Running this through decodecode gives:
> > 
> >     All code
> >     ========
> >        0:   52800400        mov     w0, #0x20                       // #32
> >        4:   8b214093        add     x19, x4, w1, uxtw
> >        8:   aa1303e1        mov     x1, x19
> >        c:   97f4caf0        bl      0xffffffffffd32bcc
> >       10:*  b9400275        ldr     w21, [x19]              <-- trapping instruction
> > 
> >     Code starting with the faulting instruction
> >     ===========================================
> >        0:   b9400275        ldr     w21, [x19]
> > 
> > x19's offset from the base address in /proc/vmallocinfo is 0x10c, which
> > points to a bad read at physical address 0x4007c10c; I also confirmed
> > that the preceding memory reads back without issues:

Oh, ugh...  I didn't realize that this wasn't merged.  I don't have a
way to test this any more.  The simplest fix would be to do change the
0x3000 to 0x100.  The GPR63 register is at 0xFC.

		reg = <0x4007c000 0x100>;

That's probably the best fix as well.  The later register areas would
be their own syscons.

regards,
dan carpenter


