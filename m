Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B96F99C6A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 21:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZfbRBXQJE7XBqTPyM/9pBB24pVjmhOJfH/25m2T2XAw=; b=qqNpYDCD2YGl0QsMiEUtr536Aa
	Vw6OLd/XNu2KXrBgo1r0QmlV4FAU+6ZAhiyox7OV9YRWSFW6ynJuvSa6CEkWhMpcS3PWCT7iabAuz
	dLQII+G9kHSfjs8EIrRyXitpp3f7f3XNhQLYSJOOHyJ6VJ5JQA6nTKT3WX7I9IovKYrpRXK4d+/H6
	8ga8YPDM6t4K+VndP4TN0YUxmuNNi9zKB2Xgccr00wrh0GXgdEsbH9NhTZT4sWABJ1Yd9D89QMJzr
	JlgZGFqgbhNCstZaXji7QJhNeRASyD87PZikjY+hQeFqy19yrEgic1t1g7+IefY7lthSmJx1yVP5X
	l87Ub/jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDqtE-00000004Uiz-3O7j;
	Fri, 17 Apr 2026 21:38:16 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDqtA-00000004Uic-2TlP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 21:38:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776461890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZfbRBXQJE7XBqTPyM/9pBB24pVjmhOJfH/25m2T2XAw=;
	b=g0R9R2fmYDGjrFd4dp3kjBbkjGrGZQAqymD3+GHO0fer1yK15IxLzefAa9XO89ObOgniwN
	xEM9ERAXDyX1FzOnQviGibRBb7X+L7roHPCJBQHSkydryJgke3ciHvzfYAkGaNcVThsmbo
	L6rkUABzAuTcMSKhSDuxMJzWWlOUxJE=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-3ORYxlQHMbWUOn1Hv3ANsg-1; Fri, 17 Apr 2026 17:36:30 -0400
X-MC-Unique: 3ORYxlQHMbWUOn1Hv3ANsg-1
X-Mimecast-MFC-AGG-ID: 3ORYxlQHMbWUOn1Hv3ANsg_1776461790
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d9a6a853bso30100291cf.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 14:36:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776461790; x=1777066590;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZfbRBXQJE7XBqTPyM/9pBB24pVjmhOJfH/25m2T2XAw=;
        b=EZkPjaX1SxMPEwmbm8d/T6jxHOOD+jd7+7WO5+Y7dwGDrLHgDrY9p8tl8ycfC419KV
         qXXmsx573koQASZwHhOW2Y8N14/a1YKyiZF18IyFzB2ZrBHQtWhZFg9WtjDw4Dz6rFvz
         N9Pymquu2DTgnXqxnJB4X8xvEed/ySGzH/xjl3h95AMLyE/LFFzDnKOHrU//q56qPepb
         evMRcwxeeyfqohrB/Q/AlEaxrW7NQE57cGyVGZVc60qvoIyBLcxBphPRo8RztdyANOHW
         j971WwxC5pbqJDynKLUxJk2oGb1HjC4Cfc/pel5Rjb5GcpfiNOzBaLrZngkuL19+/dUy
         wWRw==
X-Forwarded-Encrypted: i=1; AFNElJ9TU1OX2xp9Jva/RUk+lBtSkrBYEQqmcx/RbbDK3Q6G8y00Lk3G53d5Y05sR/nNNzFGr3HHVBxdV0hbH7YqqSjx@lists.infradead.org
X-Gm-Message-State: AOJu0Yzo2b5TIomhsvffvzOC8zD2JU/HVbU0DDsdfQvMYahUy7zXJho+
	s+K0O5GP7wxT19e6r3rU4+dBVTACPr4s7hEt6AJ0PTHpsQ4V5/e8Z3wPWUbWQYCilTRddqBFZh9
	5CQmrtvz7eBN3539ovCBySm21jZfNO4X52fdUEBsqoBfDF60Ue3DC5DJ2DBCwq/pGTE/eDtTZ5L
	pE
X-Gm-Gg: AeBDiesazqRLHKayiXjay5m93s5YLoV7v0zZXQ09kBQ6S9eFAw3TTmNs3uVay5p7t5u
	cv6DmTUR9Hmj/NeeG3fze4SzkqqHGyW6Jfo9vim4IQKDz6LiPSFJq/ZJcyz0yGjYzwhNT30eT+P
	upmPWpS2emjN/wZXftCSXynC0U7CBmgmGrTecIFmCk79Nsd6KZpxh00EtnPLq7R5CTzZiqXCHXq
	h7MEXB1k8G7OeJT0IcMzb7oQHs0ufIM5mJn2KvGq7ywikzXvnKSg4ZrwK9Uous2u0KVokk6suJd
	iHo8jRLp2OYbUduF9YQKtXxmjxYlq32BnWij5qZKdzILSKIrkFqApwPcZkXd5bpl/XkdcTCMrTe
	Bi11oX6Del7o3Mfpr8i7k18IKFgyyR8v+NcPpHX6NEhEB11MrJQSQmFf/HeHogg6O
X-Received: by 2002:a05:622a:1650:b0:50b:2eef:c8fb with SMTP id d75a77b69052e-50e36effb95mr67588511cf.56.1776461789560;
        Fri, 17 Apr 2026 14:36:29 -0700 (PDT)
X-Received: by 2002:a05:622a:1650:b0:50b:2eef:c8fb with SMTP id d75a77b69052e-50e36effb95mr67588171cf.56.1776461789124;
        Fri, 17 Apr 2026 14:36:29 -0700 (PDT)
Received: from jkangas-thinkpadp1gen3.rmtuswa.csb ([2601:1c2:4400:6bf0:7677:bcee:4ef0:e09d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50e393ff941sm20825251cf.19.2026.04.17.14.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 14:36:28 -0700 (PDT)
Date: Fri, 17 Apr 2026 14:36:25 -0700
From: Jared Kangas <jkangas@redhat.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
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
Message-ID: <aeKn2dvOOO43zdev@jkangas-thinkpadp1gen3.rmtuswa.csb>
References: <cover.1769764941.git.dan.carpenter@linaro.org>
 <0e922537c02d1c47734142090f98eb78e921ed34.1769764941.git.dan.carpenter@linaro.org>
MIME-Version: 1.0
In-Reply-To: <0e922537c02d1c47734142090f98eb78e921ed34.1769764941.git.dan.carpenter@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ngEWVGpqLCpMMZBeLFxpb4hVQoOs7ef81v_LWMaRprA_1776461790
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_143812_759213_8107177E 
X-CRM114-Status: GOOD (  17.76  )
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

Hi Dan,

On Fri, Jan 30, 2026 at 04:19:52PM +0300, Dan Carpenter wrote:
> Add the GPR syscon region for the s32 chipset.
> 
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>
> [snip]
>
> diff --git a/arch/arm64/boot/dts/freescale/s32g3.dtsi b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> index e314f3c7d61d..be03db737384 100644
> --- a/arch/arm64/boot/dts/freescale/s32g3.dtsi
> +++ b/arch/arm64/boot/dts/freescale/s32g3.dtsi
> @@ -383,6 +383,11 @@ usdhc0-200mhz-grp4 {
>  			};
>  		};
>  
> +		gpr: syscon@4007c000 {
> +			compatible = "nxp,s32g3-gpr", "syscon";
> +			reg = <0x4007c000 0x3000>;
> +		};
> +
>  		ocotp: nvmem@400a4000 {
>  			compatible = "nxp,s32g3-ocotp", "nxp,s32g2-ocotp";
>  			reg = <0x400a4000 0x400>;
> @@ -808,6 +813,7 @@ gmac0: ethernet@4033c000 {
>  			compatible = "nxp,s32g2-dwmac";
>  			reg = <0x4033c000 0x2000>, /* gmac IP */
>  			      <0x4007c004 0x4>;    /* GMAC_0_CTRL_STS */
> +			nxp,phy-sel = <&gpr 0x4>;
>  			interrupt-parent = <&gic>;
>  			interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "macirq";

I gave this a test on an S32G-VNP-RDB3 and didn't see any issues on the
dwmac-s32 side, but this appears to trigger a panic when reading the new
debugfs regmap/*/registers file for the syscon node:

    # grep 4007c000 /proc/vmallocinfo
    0xffff800083da8000-0xffff800083dac000   16384 ioremap_prot+0x74/0xe0 phys=0x000000004007c000 ioremap
    # cat /sys/kernel/debug/regmap/dummy-syscon@0x000000004007c000/registers
    Internal error: synchronous external abort: 0000000096000210 [#1]  SMP
    [...]
    CPU: 0 UID: 0 PID: 4344 Comm: cat Tainted: G   M        E  X   ------  ---  6.12.0+ #226 PREEMPT_RT
    Tainted: [M]=MACHINE_CHECK, [E]=UNSIGNED_MODULE, [X]=AUX
    [...]
    pc : regmap_mmio_read32le+0x44/0xa0
    lr : regmap_mmio_read32le+0x44/0xa0
    [...]
    x23: ffff00080c080000 x22: ffff000802ac4c00 x21: ffff800087b13c9c
    x20: ffff800080a46494 x19: ffff800083da810c x18: 0000000000000004
    [...]
    x5 : ffff800080a46448 x4 : ffff800083da8000 x3 : ffff800080a46494
    x2 : ffff800080a47230 x1 : ffff800083da810c x0 : 0000000000000020
    Call trace:
     regmap_mmio_read32le+0x44/0xa0 (P)
     regmap_mmio_read+0x4c/0x80
     [...]
    Code: 52800400 8b214093 aa1303e1 97f4caf0 (b9400275)
    ---[ end trace 0000000000000000 ]---
    Kernel panic - not syncing: synchronous external abort: Fatal exception

Running this through decodecode gives:

    All code
    ========
       0:   52800400        mov     w0, #0x20                       // #32
       4:   8b214093        add     x19, x4, w1, uxtw
       8:   aa1303e1        mov     x1, x19
       c:   97f4caf0        bl      0xffffffffffd32bcc
      10:*  b9400275        ldr     w21, [x19]              <-- trapping instruction

    Code starting with the faulting instruction
    ===========================================
       0:   b9400275        ldr     w21, [x19]

x19's offset from the base address in /proc/vmallocinfo is 0x10c, which
points to a bad read at physical address 0x4007c10c; I also confirmed
that the preceding memory reads back without issues:

    # head -c 990 /sys/kernel/debug/regmap/dummy-syscon@0x000000004007c000/registers | tail -1
    0104: 00000000
    # head -c 1005 /sys/kernel/debug/regmap/dummy-syscon@0x000000004007c000/registers | tail -1
    0108: 00000000
    # head -c 1020 /sys/kernel/debug/regmap/dummy-syscon@0x000000004007c000/registers | tail -1
    <panic>

Best,
Jared


