Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C9CAC02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 23:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xf6FEOPlsQCKDeS8/VmOQ+ZlZJhwCDMgN7NaCKS7CYU=; b=eGRTj6R4hu3XsaGJ9CivSNgGxb
	ZuXykKoinJ/mWf0wy+zALpCpnofhGwymQx2nBh28n5uDiWfI4FJnNUdqynIvd4aQAi7dq1akLxMS5
	hZKMCEEaz17X2a01oef6Y8aP+2YaJqLvLiIaAKxwTy5NSxGsR/abZtN2+xIyQEm7LSVSqtWVdEXjf
	dBFAceboe3+rJOBrE3eB3DYna8Twl5gpV+zcRvgvIhnefaZ1l5mj5Y1ro5R/hNPzb8dO1eFIEBdZK
	hhF4ApdiaVAZTJBakBk0M0UIRxeqnvmDtH+kD6owPJElVLLLTAirXRLXu/H4gC1rxrSbuS6vCSkKk
	TS2F+ExQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiMBc-00000009AU0-4AAm;
	Wed, 12 Feb 2025 23:30:33 +0000
Received: from mail-qt1-x82a.google.com ([2607:f8b0:4864:20::82a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiMAB-00000009AGG-2QhO;
	Wed, 12 Feb 2025 23:29:04 +0000
Received: by mail-qt1-x82a.google.com with SMTP id d75a77b69052e-471b5372730so2601891cf.1;
        Wed, 12 Feb 2025 15:29:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739402942; x=1740007742; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Xf6FEOPlsQCKDeS8/VmOQ+ZlZJhwCDMgN7NaCKS7CYU=;
        b=hvCvmQIh3lFfkDFEodMLOVDPIIpqPYOh12nKsqhBm1RcKnWRo+sUW2x3HPPU6xWwsB
         hvU26Ccnnldux9/1uANxyq5y9tMfUqErz82e5KBQoBYwGshGuYQnS2zYdov+gM4DoKEw
         6jAQwMG8jXkE3iZaILE62KDh2/PHGUfRJj2pGd6uDXKvAU9ST26cOSARkLt4+KdteFd2
         SCmgiIeay1BJFm1Ps7r74gohG1pfh9XdQ436vZ5S3UPptHR2o70VAnEJJcR4dkIXt0Ps
         +8Ik6MGN6Nsiu9VQZ+Cid0xWhn0W7cjFkwCoOHgT3tqaoRZm926iPc/vQNcQLs9W7JYz
         onoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739402942; x=1740007742;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xf6FEOPlsQCKDeS8/VmOQ+ZlZJhwCDMgN7NaCKS7CYU=;
        b=ncOQ/0lxFAplhmlCwtztSJwNyK8Pa4wNnbGxWD8VaC3Lf4IfAHA/gKErurkEBqCBr4
         /aaKgamlR2+YTW0LR/QqkQUKAds3zoa4q+Y0gNlToJ9AS25PDl12rcIEar+s8ztKy6Dk
         Sjj3prFRATbFgV9oTZvW45xm5yNnHeGgOElHISiL3ftsEMs2UygXPqCN0hIaaoOasW1b
         okMPbehiU/LDilwqXX1/6nBnoNzmJji4bYey6H7P9+Vt/4RkJohzyrbTwokTB2A0uzKC
         FXeosQT/N693dpmuzdduf8MV88YUDon8QpnDhG6pAehliimuBc3RrBbej83C7xg/xTgx
         WUfg==
X-Forwarded-Encrypted: i=1; AJvYcCUt1EwUCTMfXKVf3gyPeKf/0gHAzqgKNNhRBM7uZiMl7I/+LZlwAktUb8RhQTpqnQmAlNsh3+ruq3TmehSNTMiZ@lists.infradead.org, AJvYcCVu1Bip2St4A1Iu3/40HV1bAAIO12olQp6NGswKYT53bK7iXf3HkXYCrC9X1tOeWWlbif4+oWiZA85Q47c=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/lzyq6wpVikmx9gSjReAT4Wd1+661C+xdxJE7docVtWr94B1w
	6qyWoMynaMIKhCCaIAUml8TtBzV019qNfDCei++LOrbCIQWcU0jw
X-Gm-Gg: ASbGnctUNLKYjMlV2rMw51vNstikLJM+eplRMe+NjEsiD1ix/ExBGEk1DblJ2amzwfP
	tkEi7+EjAWYsTm9Ilb8B/ahidRIqHnTrCwgYS42tuNeoTWllCeTpJYPBvlw6NMttB58usSK38Io
	npmxVtpePhrb7Eb/Fsd2+10BEy8d/4k2XTSsTP5tLgkizcUXctuZHpzd4UD3TnbTkt9D0rPjaVj
	E6je0BsSKAjg0BEkcvp+v3/koMwgDPDPuIy2W7zPhb20rP1G0n2zK5wE2DyL6qMUUM=
X-Google-Smtp-Source: AGHT+IGYzAubSVFkMrhIoFfMHJkYJiaTIPTRSix5tqjfLli9V0CYVWf7rD0PEDyVMCJ7C/TQE8oE9A==
X-Received: by 2002:a05:622a:8f1b:b0:467:8630:584f with SMTP id d75a77b69052e-471bee131b3mr18469391cf.36.1739402942343;
        Wed, 12 Feb 2025 15:29:02 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-471c2a11e77sm605131cf.29.2025.02.12.15.29.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 15:29:01 -0800 (PST)
Date: Thu, 13 Feb 2025 07:28:54 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Inochi Amaoto <inochiama@gmail.com>, soc@lists.linux.dev
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@outlook.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Haylen Chu <heylenay@outlook.com>, linux-arm-kernel@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>
Subject: Re: [PATCH v3 1/7] riscv: dts: sophgo: cv18xx: Move RiscV-specific
 part into SoCs' .dtsi files
Message-ID: <e7veoogv7qlmjelxiu34a2yvbtb6umgqscwo44ti7k562n7ow5@7uadzl4oubzb>
References: <20250212224347.1767819-1-alexander.sverdlin@gmail.com>
 <20250212224347.1767819-2-alexander.sverdlin@gmail.com>
 <x4zncooa3lmyf2bikowjw7oabz66dhhbxl44cmujzzkwaslcl5@tj3l2u7e4akx>
 <de4d99bf89f78a0a6e0a81dc6062af5e85d762aa.camel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <de4d99bf89f78a0a6e0a81dc6062af5e85d762aa.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_152903_623684_8BB9412D 
X-CRM114-Status: GOOD (  38.16  )
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

On Thu, Feb 13, 2025 at 12:04:39AM +0100, Alexander Sverdlin wrote:
> Hi Inochi!
> 
> On Thu, 2025-02-13 at 06:54 +0800, Inochi Amaoto wrote:
> > On Wed, Feb 12, 2025 at 11:43:33PM +0100, Alexander Sverdlin wrote:
> > > Make the peripheral device tree re-usable on ARM64 platform by moving CPU
> > > core and interrupt controllers' parts into new cv18xx-cpu.dtsi and
> > > cv18xx-intc.dtsi.
> > > 
> > > Add SOC_PERIPHERAL_IRQ() macro which explicitly maps peripheral nubering
> > > into "plic" interrupt-controller numbering.
> > > 
> > > On RiscV side this patch has been dtc-compile-tested only. IRQ numbers
> > > substitution with SOC_PERIPHERAL_IRQ() has been scripted in vim.
> > > 
> > > Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> > > ---
> > > Changelog:
> > > v3:
> > > - &cpus node has been moved into cv18xx-cpu.dtsi, &plic and &clint nodes
> > > were moved into cv18xx-intc.dtsi to reduce code duplication;
> > > v2:
> > > - instead of carving out peripherals' part, carve out ARCH-specifics (CPU
> > > core, interrupt controllers) and spread them among 3 SoC .dtsi files which
> > > included cv18xx.dtsi;
> > > - define a label for the "soc" node and use it in the newly introduced DTs;
> > > 
> > >   arch/riscv/boot/dts/sophgo/cv1800b.dtsi     | 28 ++++---
> > >   arch/riscv/boot/dts/sophgo/cv1812h.dtsi     | 28 ++++---
> > >   arch/riscv/boot/dts/sophgo/cv181x.dtsi      |  2 +-
> > >   arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi  | 36 ++++++++
> > >   arch/riscv/boot/dts/sophgo/cv18xx-intc.dtsi | 23 ++++++
> > >   arch/riscv/boot/dts/sophgo/cv18xx.dtsi      | 91 ++++++---------------
> > >   arch/riscv/boot/dts/sophgo/sg2002.dtsi      | 34 ++++----
> > >   7 files changed, 137 insertions(+), 105 deletions(-)
> > >   create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi
> > >   create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-intc.dtsi
> > > 
> > > diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > > index aa1f5df100f0..9fb7dd2dab18 100644
> > > --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > > +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> > > @@ -3,8 +3,12 @@
> > >    * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> > >    */
> > >   
> > > +#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
> > > +
> > >   #include <dt-bindings/pinctrl/pinctrl-cv1800b.h>
> > > +#include "cv18xx-cpu.dtsi"
> > >   #include "cv18xx.dtsi"
> > > +#include "cv18xx-intc.dtsi"
> > >   
> > >   / {
> > >   	compatible = "sophgo,cv1800b";
> > > @@ -13,17 +17,23 @@ memory@80000000 {
> > >   		device_type = "memory";
> > >   		reg = <0x80000000 0x4000000>;
> > >   	};
> > > +};
> > > +
> > 
> > > +&soc {
> > > +	dma-noncoherent;
> > >   
> > > -	soc {
> > > -		pinctrl: pinctrl@3001000 {
> > > -			compatible = "sophgo,cv1800b-pinctrl";
> > > -			reg = <0x03001000 0x1000>,
> > > -			      <0x05027000 0x1000>;
> > > -			reg-names = "sys", "rtc";
> > > -		};
> > > +	pinctrl: pinctrl@3001000 {
> > > +		compatible = "sophgo,cv1800b-pinctrl";
> > > +		reg = <0x03001000 0x1000>,
> > > +		      <0x05027000 0x1000>;
> > > +		reg-names = "sys", "rtc";
> > >   	};
> > >   };
> > >   
> > 
> > The origianl /soc path can be used to override things, 
> > why change it to the reference archor? I see no change
> > for it.
> 
> https://lore.kernel.org/soc/d3ba0ea5-0491-42d5-a18e-64cf21df696c@kernel.org/
> The corresponding label is being introduced in cv18xx.dtsi.
> 

Yes I know, but I wonder why you change it here, the url you provide
told nothing about change existing structure.

The origianl struct:

/ {
	soc {
		...
	};
};

it can also be used to add things in /soc, renesa uses this in that
form is not the reason for this change. I prefer to keep original
structure so less change is introducted.

> > > +&clk {
> > > +	compatible = "sophgo,cv1800-clk";
> > > +};
> > > +
> > >   &plic {
> > >   	compatible = "sophgo,cv1800b-plic", "thead,c900-plic";
> > >   };
> > > @@ -31,7 +41,3 @@ &plic {
> > >   &clint {
> > >   	compatible = "sophgo,cv1800b-clint", "thead,c900-clint";
> > >   };
> > > -
> > > -&clk {
> > > -	compatible = "sophgo,cv1800-clk";
> > > -};
> > > diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> > > index 8a1b95c5116b..f23c4dd6687d 100644
> > > --- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> > > +++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> > > @@ -3,10 +3,14 @@
> > >    * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
> > >    */
> > >   
> > > +#define SOC_PERIPHERAL_IRQ(nr)	((nr) + 16)
> > > +
> > >   #include <dt-bindings/interrupt-controller/irq.h>
> > >   #include <dt-bindings/pinctrl/pinctrl-cv1812h.h>
> > > +#include "cv18xx-cpu.dtsi"
> > >   #include "cv18xx.dtsi"
> > >   #include "cv181x.dtsi"
> > > +#include "cv18xx-intc.dtsi"
> > >   
> > >   / {
> > >   	compatible = "sophgo,cv1812h";
> > > @@ -15,17 +19,23 @@ memory@80000000 {
> > >   		device_type = "memory";
> > >   		reg = <0x80000000 0x10000000>;
> > >   	};
> > > +};
> > > +
> > > +&soc {
> > 
> > > +	dma-noncoherent;
> > 
> > I think this can be moved into cv18xx-cpu.dtsi file, and let
> > all SoCs share it.
> 
> https://lore.kernel.org/soc/d3ba0ea5-0491-42d5-a18e-64cf21df696c@kernel.org/
> 
> If SOC_PERIPHERAL_IRQ() doesn't belong to -cpu.dtsi, then "dma-noncoherent;"
> probably neither...
> 

This is OK for me.

> > > -	soc {
> > > -		pinctrl: pinctrl@3001000 {
> > > -			compatible = "sophgo,cv1812h-pinctrl";
> > > -			reg = <0x03001000 0x1000>,
> > > -			      <0x05027000 0x1000>;
> > > -			reg-names = "sys", "rtc";
> > > -		};
> > > +	pinctrl: pinctrl@3001000 {
> > > +		compatible = "sophgo,cv1812h-pinctrl";
> > > +		reg = <0x03001000 0x1000>,
> > > +		      <0x05027000 0x1000>;
> > > +		reg-names = "sys", "rtc";
> > >   	};
> > >   };
> > >   
> > > +&clk {
> > > +	compatible = "sophgo,cv1810-clk";
> > > +};
> > > +
> > >   &plic {
> > >   	compatible = "sophgo,cv1812h-plic", "thead,c900-plic";
> > >   };
> > > @@ -33,7 +43,3 @@ &plic {
> > >   &clint {
> > >   	compatible = "sophgo,cv1812h-clint", "thead,c900-clint";
> > >   };
> > > -
> > > -&clk {
> > > -	compatible = "sophgo,cv1810-clk";
> > > -};
> > > 
> > > [...]
> > > 
> > 
> > > diff --git a/arch/riscv/boot/dts/sophgo/cv18xx-intc.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx-intc.dtsi
> > > new file mode 100644
> > > index 000000000000..90817993a326
> > > --- /dev/null
> > > +++ b/arch/riscv/boot/dts/sophgo/cv18xx-intc.dtsi
> > > @@ -0,0 +1,23 @@
> > > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > > +/*
> > > + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> > > + * Copyright (C) 2023 Inochi Amaoto <inochiama@outlook.com>
> > > + */
> > > +
> > > +&soc {
> > > +	interrupt-parent = <&plic>;
> > > +
> > > +	plic: interrupt-controller@70000000 {
> > > +		reg = <0x70000000 0x4000000>;
> > > +		interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
> > > +		interrupt-controller;
> > > +		#address-cells = <0>;
> > > +		#interrupt-cells = <2>;
> > > +		riscv,ndev = <101>;
> > > +	};
> > > +
> > > +	clint: timer@74000000 {
> > > +		reg = <0x74000000 0x10000>;
> > > +		interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
> > > +	};
> > > +};
> > 
> > 
> > I think this file can be merged in to cv18xx-cpu.dtsi.
> > clint and plic is more like a core specific device.
> 
> Yes, this can be done now, as long as SOC_PERIPHERAL_IRQ() remains
> outside of the -cpu-intc.dtsi...
> 
> -- 
> Alexander Sverdlin.
> 

