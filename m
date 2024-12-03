Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1918FE6C619
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 08:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCNH1RGsoC1GQ3g+KrrwC75tgSy6QuRSOXD8Hk9P+jc=; b=bCNCYRs22m6ltwSkN0H0cc89Dv
	3KKN000Aubd9cAo/gSeU/ypb2tLsXJ2IgDLOhPqcf5jKNL31BiYlUboTB5zacIHnfAEDUlJRtTeM9
	Rqw/JXd2HamAKRswoBGEtlD03SjQWleviaZayTUEwOFMDSSiaK+1WZ2Ltirn7wYF29Q9DHGs5nfTq
	ONThYNkxV4PMAPZ3NXF5bJ+7FbmY7P/vYnLRET/8AlLwMLZDuzUZNwEAZuVLHZxlpyqKyXJ+wUcAD
	7vKhbC+eL1YcHhg3E47HvhcGWeoyROxnRVQ8uUe1uSR11YjK7kIFaiFbdKIlPJmBgan9HVq3EYYH7
	83DT6eLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOKc-00000008hr5-2XLu;
	Tue, 03 Dec 2024 08:32:30 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOJc-00000008hjz-2Fk2;
	Tue, 03 Dec 2024 08:31:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 718ABA40DA1;
	Tue,  3 Dec 2024 08:29:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45D21C4CECF;
	Tue,  3 Dec 2024 08:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733214687;
	bh=x3znFn98rErh2FCBpaz9WvVdlFADMKizJofigQdXDp4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=t42RLmlHAIcnhWWs3lUH+Bz88axkSdXYA8oFKDhpTWmLJHGdOlM3M1LManNS0sdvT
	 YyxMTDDBXmLm3kC1Yw5PE7dyA6cSk5+RZIQxCcK4nWi0SbYwcTeZyzfi1GRftNKStm
	 HcI8vkNtiQ8vl60KrSkfL5kKNxd7VGn93wDeV5NnnmFqXPBBLN7lmBfTRJzkQlJCvV
	 jCxUI33Qq3dZ/VJqyzHbe0sbLXuZyuimDzJ3kzaPYEBZfv9XwwfRg/hs0gNjqfCFGV
	 n2opd19xlVIJFgdwMd7/IXO1V80184HNi1YJSli5Yk7HGx59K4q8kagHj+mWlZjxvP
	 KCjGBGozwZpKw==
Date: Tue, 3 Dec 2024 09:31:20 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Nathan Chancellor
 <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Bill
 Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Hans de
 Goede <hdegoede@redhat.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong
 <yunfei.dong@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/3] media: cx231xx: Convert enum into a define
Message-ID: <20241203093114.0ca49c01@foz.lan>
In-Reply-To: <20241202-fix-llvm9-v1-1-2a50f5acfd0b@chromium.org>
References: <20241202-fix-llvm9-v1-0-2a50f5acfd0b@chromium.org>
	<20241202-fix-llvm9-v1-1-2a50f5acfd0b@chromium.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_003128_702489_B28633CE 
X-CRM114-Status: GOOD (  18.44  )
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

Em Mon, 02 Dec 2024 15:47:15 +0000
Ricardo Ribalda <ribalda@chromium.org> escreveu:

> The code is running arithmentics with the enum, which when not done with
> care makes the compiler a bit nervous.
> 
> Because those enums are only used as defines (no argument or variable
> from that enumeration type), convert it into a define and move on.
> 
> It is required to build with llvm 9 without these warnings:
> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:673:17: warning: bitwise operation between different enumeration types ('enum TS_PORT' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:680:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:687:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:702:17: warning: bitwise operation between different enumeration types ('enum TS_PORT' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:709:21: warning: bitwise operation between different enumeration types ('enum TS_PORT' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:718:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum POWE_TYPE') [-Wenum-enum-conversion]
> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:727:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum TS_PORT') [-Wenum-enum-conversion]
> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:737:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum TS_PORT') [-Wenum-enum-conversion]
> drivers/media/usb/cx231xx/cx231xx-pcb-cfg.c:749:21: warning: bitwise operation between different enumeration types ('enum AVDEC_STATUS' and 'enum TS_PORT') [-Wenum-enum-conversion]
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h | 18 +++++++-----------
>  1 file changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h b/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h
> index 5bc44f194d0a..62ffa16bb82c 100644
> --- a/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h
> +++ b/drivers/media/usb/cx231xx/cx231xx-pcb-cfg.h
> @@ -57,19 +57,17 @@ enum USB_SPEED{
>  };
>  
>  #define TS_MASK         0x6
> -enum TS_PORT{
> -	NO_TS_PORT = 0x0,	/* 2'b00: Neither port used. PCB not a Hybrid,
> +#define NO_TS_PORT	0x0	/* 2'b00: Neither port used. PCB not a Hybrid,
>  				   only offers Analog TV or Video */
> -	TS1_PORT = 0x4,		/* 2'b10: TS1 Input (Hybrid mode :
> +#define TS1_PORT	0x4	/* 2'b10: TS1 Input (Hybrid mode :
>  				Digital or External Analog/Compressed source) */
> -	TS1_TS2_PORT = 0x6,	/* 2'b11: TS1 & TS2 Inputs
> +#define TS1_TS2_PORT	0x6	/* 2'b11: TS1 & TS2 Inputs
>  				(Dual inputs from Digital and/or
>  				External Analog/Compressed sources) */
> -	TS1_EXT_CLOCK = 0x6,	/* 2'b11: TS1 & TS2 as selector
> +#define TS1_EXT_CLOCK	0x6	/* 2'b11: TS1 & TS2 as selector
>  						to external clock */
> -	TS1VIP_TS2_PORT = 0x2	/* 2'b01: TS1 used as 656/VIP Output,
> +#define TS1VIP_TS2_PORT 0x2	/* 2'b01: TS1 used as 656/VIP Output,
>  				   TS2 Input (from Compressor) */
> -};
>  
>  #define EAVP_MASK       0x8
>  enum EAV_PRESENT{
> @@ -89,10 +87,8 @@ enum AT_MODE{
>  };
>  
>  #define PWR_SEL_MASK    0x40
> -enum POWE_TYPE{
> -	SELF_POWER = 0x0,	/* 0: self power */
> -	BUS_POWER = 0x40	/* 1: bus power */
> -};
> +#define SELF_POWER	0x0	/* 0: self power */
> +#define BUS_POWER	0x40	/* 1: bus power */
>  
>  enum USB_POWE_TYPE{
>  	USB_SELF_POWER = 0,
> 

IMO keeping them into enums are a lot better than defines.

Perhaps the right thing would be to join both enums here.


Thanks,
Mauro

