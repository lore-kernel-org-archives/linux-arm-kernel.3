Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B16DCCD184
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 03:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c5ZF0nIWQuoX7NVIe6I5+JsT65xxxmpn6kzl5bwhRQw=; b=VqAA+39GBSbzDiFbATOrZ9KVKj
	V03Skvn6SCR0qyyt/v1Mb3D3DBLSwj5ELoxw3hrq6l4Kx8n8t49218hiNUtnCLcIyFPxC0gqJ0d+6
	AACF/bM4D7/CdKWjsdbMzmKZEomMxclRZVhReQkr7bxTQRufYA/zeUl+yYQp0SSEXicnbYCrFYkbu
	xTtTe21zjIWI70/uj75JezD0ZyeZz2i9nbih7K2N5io7tdNIPyPXNvoqI9iXj4KX/1U0pqMJsqT4H
	6Xen0+xMBeI7O9E6dw/Zs/o7f0hZO6ND7oms8KKfg6u4YSv7u96pThABBUc3AiSob2ArBieTLlLWy
	/S9wSypA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAgL9-0000000BlOZ-0Srz;
	Mon, 20 Oct 2025 03:13:43 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAgL5-0000000BlNY-47E9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 03:13:41 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-63c4b41b38cso4054596a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Oct 2025 20:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760930018; x=1761534818; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c5ZF0nIWQuoX7NVIe6I5+JsT65xxxmpn6kzl5bwhRQw=;
        b=iV0qntYbKCIISC+zdcmKZomCCBIFqWgBiTftLW1wu6u0HFqELqgMiyg8ZLrOjEgcn+
         ycpjlhYA+s9FduVNA2NYvJTExyG+uc9BjZl2D4opf0koNJVQ46PqtrFKZs1bJTDy3IHK
         cwVQyjwp+GN5bSr/RuDxdiqNM8jZjM4iBWs+SlqKPnOkAbDMACCoqM7pq82gnt78dgmL
         JC0VpgheaPXD2vS2WRjozaEc1k/ptFq5P9fsleoNPU7hUb2/r+bgCKbGhIbsBDOiJ0hz
         oj1bRJ1QsNWglDL7FCCs5soByk2IG7C4ZHArLpGhOhZyLwYlclOQtkMF0AADY2WMUve4
         7ziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760930018; x=1761534818;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c5ZF0nIWQuoX7NVIe6I5+JsT65xxxmpn6kzl5bwhRQw=;
        b=XgDDicIlpKqKGtdHvw1LJBLnKZ2EtDks2lBMOf+6bwbzOPjSg9XkT1CfpC6R26mQT8
         gF/gk4Csn4r/zrBXL8iR7F3k9aZnS+OYN4LUsH3UKZRLyrXy5TAat6K3KQ4lADE2E7z/
         3W43XPai4sesTw9yZNuFkR/caEU518g6tCG7RbQha/7x6uKiNk14oR25RoxLzDKOc/72
         3tBGQJ9vWm6MKbp5kOpeuA/tnMxlAziWwbyxL9Hm6C8ZcMo+wAWwc/XO0H+P+NAuYmjh
         nD9Op9kbbXaL4OEzDF59mirlE18wjkWhEsOlGD2UdNJD9zrtJJ2lomc/kyfSCjMyZX+v
         rqVQ==
X-Forwarded-Encrypted: i=1; AJvYcCUBAa1tygFofy3XjzSQ8ngCLEaAyBKnIIv3qwcILB501FNXAxreoiZXyih4RvlboyQ3k0O4btQcQOYe97HYSDTf@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs1J75eI39tq5orbs9FU4gCpaLdFWT3yW2Pi3DS3FTo0cU5ioM
	eZQ/m4L2dxmRhYbyRqoNMjNN+l73Pb0H3nAkpG7+WjDVMftwmUaq5YKQadtKtBC6ZWT3IUQn6O3
	0ROXTAAPTY+6iK5rBsV2pPZZY9WLZIc2WuziM
X-Gm-Gg: ASbGnctXTFR3Qnw1qFnkKrV2XPTt7AaQuBmtb2DG3z113D1wMJczzR1qTPkN8n3OWbL
	C/clTy3w1BdbXpIA8VES00j3TggpkEKGUUGgCd4MnNtKpMOhrnluuDM0Tkh9B3BOwuOPVMUu6Yv
	s54cIBAcmyhVvOyxrbJzzpjbqiVh0wIuaaij0EKmplq9isFgg9vvW6Pfx6wuh7Ubk68Oeco1INb
	ZA2v6y9eE+LP0GEkJy6VlaOeFYtYk3fgwn72uidExTn5AvjCrDvAlawOPg=
X-Google-Smtp-Source: AGHT+IFlIM9veSfUiCEqCs4cu1zurxwbaOmQwJt6C38o77/S8LVLD6y47Rn4sx8fit0dIc30Wd0JSNIXuLu1cF7zy6g=
X-Received: by 2002:a05:6402:278a:b0:63c:17f5:cc93 with SMTP id
 4fb4d7f45d1cf-63c1f630f4emr10867390a12.8.1760930017243; Sun, 19 Oct 2025
 20:13:37 -0700 (PDT)
MIME-Version: 1.0
References: <20251017073954.130710-1-cnsztl@gmail.com> <7f0b1747-87eb-0b0b-6fb0-304811a4be21@manjaro.org>
 <d9d14ce2-2e65-422e-95fb-eb30b128ad90@gmail.com> <41154cde-a447-0707-4387-cd3dca90b97d@manjaro.org>
 <CALWfF7K0=J3E-zr41wV-28+SCFkT_so55Aee8BvQsB4KJZy6YQ@mail.gmail.com>
 <47931e9e-09db-3909-4531-dae6869171d7@manjaro.org> <b22425c3-01e0-4d2e-bf78-5db884d4ec38@gmail.com>
 <de5e8643-49bb-4e0e-45fd-51b25ecf530d@manjaro.org> <CANAwSgTZa7PXBuyh9EdDOXCNuCTOHGsJz18pSjP6WUN8sOaqTQ@mail.gmail.com>
 <047fe2b8-0f94-0f0f-5964-b65844834706@manjaro.org>
In-Reply-To: <047fe2b8-0f94-0f0f-5964-b65844834706@manjaro.org>
From: Anand Moon <linux.amoon@gmail.com>
Date: Mon, 20 Oct 2025 08:43:18 +0530
X-Gm-Features: AS18NWCj3sZ27S7v2lVifIDB-bfHc9CGVpcmzR6xkep1HgXpZq9MDT3bZH4TJtE
Message-ID: <CANAwSgRuPhgnGy=2oY6u1jQtDRkQAdPqGv5NUNv8+WDeHq-56Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: rockchip: fix eMMC corruption on NanoPC-T6
 with A3A444 chips
To: Dragan Simic <dsimic@manjaro.org>
Cc: Hugh Cole-Baker <sigmaris@gmail.com>, Jimmy Hon <honyuenkwun@gmail.com>, 
	Tianling Shen <cnsztl@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, Grzegorz Sterniczuk <grzegorz@sternicz.uk>, Jonas Karlman <jonas@kwiboo.se>, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251019_201340_036189_6A64DF99 
X-CRM114-Status: GOOD (  20.65  )
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

Hi Dragan,

On Sun, 19 Oct 2025 at 23:40, Dragan Simic <dsimic@manjaro.org> wrote:
>
> Hello Anand,
>
> On Sunday, October 19, 2025 19:25 CEST, Anand Moon <linux.amoon@gmail.com> wrote:
> > Would you consider the following patch?
> >
> > As per the Rockchip RK3588S SoC Technical Reference Manual (TRM) Part 1,
> > chapter 21.6, Interface Description, the eMMC signals require careful handling
> > to ensure signal integrity.
> >
> > I2C2_SCL_M2 I/O EMMC_RSTN/I2C2_SCL_M2/UART5_RTSN_M1/GPIO2_A3_d
> > BUS_IOC_GPIO2A_IOMUX_SEL_L[15:12]=0x9
> > I2C2_SDA_M2 I/O EMMC_DATA_STROBE/I2C2_SDA_M2/UART5_CTSN_M1/GPIO2_A2_d
> > BUS_IOC_GPIO2A_IOMUX_SEL_L[11:8]=0x9
> >
> > $ git diff .
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi
> > b/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi
> > index 6584d73660f6..f60a1d8be0ef 100644
> > --- a/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi
> > +++ b/arch/arm64/boot/dts/rockchip/rk3588-base-pinctrl.dtsi
> > @@ -327,7 +327,7 @@ emmc {
> >                 emmc_rstnout: emmc-rstnout {
> >                         rockchip,pins =
> >                                 /* emmc_rstn */
> > -                               <2 RK_PA3 1 &pcfg_pull_none>;
> > +                               <2 RK_PA3 1 &pcfg_pull_down_drv_level_2>;
> >                 };
> >
> >                 /omit-if-no-ref/
> > @@ -369,7 +369,7 @@ emmc_cmd: emmc-cmd {
> >                 emmc_data_strobe: emmc-data-strobe {
> >                         rockchip,pins =
> >                                 /* emmc_data_strobe */
> > -                               <2 RK_PA2 1 &pcfg_pull_down>;
> > +                               <2 RK_PA2 1 &pcfg_pull_down_drv_level_2>;
> >                 };
> >         };
>
> Frankly, I'm not really sure how would such changes do something
> good regarding the eMMC signal integrity?  In general, signal
> integrity depends mostly on the routing of the PCB traces, which
> is purely hardware design.  Sure, termination of data lines also
> plays a significant role, but that surely isn't at play here.
>
It is necessary to enhance the signal quality from the controller to
the eMMC module

> Moreover, the eMMC RSTn line is already pulled high to VCCIO in
> the reference RK3588 design, so pulling it down in the SoC itself
> would be pretty much wrong thing to do.
>
It is specified in the TRM that this is only applicable during
initialization.as per my understanding.

Thanks
-Anand

