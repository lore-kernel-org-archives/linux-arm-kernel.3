Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F6B6E65266
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Feb 2026 13:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LQFUULeH+fy8L9eOXKB3k7qBdbSqID9Bg3DoUQYdSfE=; b=0qaTRWMI8b2DySYtYkUyC5Kib0
	hOiVaB+7CLDY3HeXGOK5MdM3XVq6H4lF4eWoIj3w2O4/ztrBafP2htao7LcQmvBpDb7UQzWbFkqSx
	Cd9ugXkqp9CKeHqXalA6dll2lzKMW7tov55s4xqdRlCVdpRhVxmjDo6vGsIX4OSTfZpnbiRrnHYAf
	1gF/7QB9uY2EzNVs/rQbV4eF8pYusg0n8/+9czCLSgxPdAsY1mnHtvOG+oJyF7Dlsh8K7tt+tmrX8
	0t1ephP0ibsJz0cU2/BKCteCG5Er7DwaXw60Jq2xyixvVeDG27vGXeHNplM3PZLWO6x1JzPM2sYNL
	kgIrDXpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmXbi-00000003tCg-1dkG;
	Sun, 01 Feb 2026 13:35:18 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmXI1-00000003eQc-3ACa
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Feb 2026 13:14:59 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2a0c09bb78cso29419495ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Feb 2026 05:14:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769951696; x=1770556496; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LQFUULeH+fy8L9eOXKB3k7qBdbSqID9Bg3DoUQYdSfE=;
        b=ZdwK6/Y9JkNUC4Ia8J7xln0kpgdpRu3w0hWA+tosFlkG+SD1LJi5GrBqTXLZ9abobG
         MkAH0CvucxvtzNjQqcP6RAKcGr1KwTXOihB5FL+MoBqp+Nl3wI/Gjmo/DHTD3aY43fYZ
         8Y87v0MVkbQFKdSlQ5ognxIp9AL2f04ZqRy0uVi1SmAfuIXPzxCjSysV9w5WSO5AyIb+
         NLWfS/dmhkHqSnmrwf/RYUBUdJw8pbLN5MG79t/NqmVMTYseQKXu6HYpEob7gr1/pvg4
         NOKXvsKnyNxjGz7PKMEqV2eV1GbPO8V0wqLAvLXavTlJUVueKtQX2+CFl0yuUkBp2jpu
         U3NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769951696; x=1770556496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LQFUULeH+fy8L9eOXKB3k7qBdbSqID9Bg3DoUQYdSfE=;
        b=JuRECSKj7l8FNJQIiHN3tF5v3vBXXqacbtQ1qcnq2m0SUh6X9u0IPoX0LcRN5rvOqV
         uukRHmPWg+t3u74iMQWktn+5Kt0RyP8ea48HI0Pkrlylrn9DYvnzyxfTZgnFz6NsbFJN
         cbEEkKwZk2EJNXeiNytt3Cq3jYiZw0pfOAgCE+4elvmsOziWXD8X/jwVFA+K87LbJ+5U
         dhU9CIQqH9Uf0oAHZ9H9irPwMxqfiWcqKuE/H60fw1PObPCnekH1yP6ZIQQF1/hGh3GH
         Wf0/or25C/n0ayAsnevHXUu/LOumaplaU1jvfa7vZGk2+wPvndBouSJrjmgMbDq6flV2
         /YYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHKZQ3fyKym28XbqGXk9UhiWrNYFdgZMxcZck4Xq0WyaZTazkWcVlHktFMFWzq6jOperTByhYovVUsR9Avbt73@lists.infradead.org
X-Gm-Message-State: AOJu0YwwYtnJaUBEx5hhoEeeM8p38xzKTYxbgoJ2tYbyBzldVE1RYAzb
	3V0SKgrbDOwzTxwqxq83mvMKsV1Jm6+SrD1GMA2m9+rsnJciRqEYdTnV
X-Gm-Gg: AZuq6aKcV1p88Jjayo8bXmFq/2qJjD+dc0Frt+Qn11hzaI3ZyMzEdWUhBwWU35rTau1
	zVboVyv6AxEcrQSWuVyy3rSL4Qy5bgr6T1Kmy8A96hTsq3FzPAyMg+8M52XW6BNsfh3UVf+c9x2
	WzRZmPDe4NkimOV52CgNQpFD/DUlI7yjzN5ReuMKqBHxfkRvssn782hSkdu0SREhv7XxQSyfR3O
	ZfIREAjzP+HEwWCEMtHDIdzdMlYHvjNrMGxld0t7OidWl2EYFu9rsAYnOTl8G5SQO7CwvPuT7XI
	OaIFmbQ5jsmFrFn+4XcyVafUJoLT8VbGrmp4qVQgcFZPAk8GNUHPn9s2CPeCbKr30gO+jsN+eLj
	f//8f41cLU8bfKLLmskRlV9qh/7bI0P5jExr8+E4ERe+9dVTJWNUGUSgc9Hq+HLwKj0CXR5isPh
	SlVD3H2b+wvZVLraMTS+g=
X-Received: by 2002:a17:903:380b:b0:29f:1b1f:784 with SMTP id d9443c01a7336-2a8bd3ebfeemr131616705ad.4.1769951696423;
        Sun, 01 Feb 2026 05:14:56 -0800 (PST)
Received: from arch.localdomain ([2409:8a28:a52:d2b1::1004])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82379b1d024sm13343816b3a.12.2026.02.01.05.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 05:14:56 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: dsimic@manjaro.org
Cc: alchark@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	jerrysteve1101@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add OneThing Edge Cube series
Date: Sun,  1 Feb 2026 21:14:51 +0800
Message-ID: <20260201131451.65452-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <d2005c66-536c-8c0c-658a-fb6ed7b5f3c6@manjaro.org>
References: <d2005c66-536c-8c0c-658a-fb6ed7b5f3c6@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260201_051457_805897_316361AF 
X-CRM114-Status: GOOD (  27.64  )
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

> Hello Jun,
> 
> Please, see a quick remark below, for now.
> 
> On Saturday, January 31, 2026 16:31 CET, Jun Yan <jerrysteve1101@gmail.com> wrote:
> > The OneThing Edge Cube (OEC) series features the RK3566 SoC, 8GB
> > eMMC storage, and supports one SATA interface, one Gigabit Ethernet
> > port, and one USB 3.0 port.
> > 
> > Other than the difference in RAM capacity, the OEC and OEC-turbo are
> > identical in all other specifications.
> > 
> >   Specification:
> >     - Rockchip RK3566
> >     - LPDDR4X 2GB (OEC) / 4GB (OEC-turbo)
> >     - eMMC 8GB
> >     - Gigabit Ethernet port x 1
> >     - USB 3.0 port x 1
> >     - USB-C 2.0 port x 1
> >     - 12V DC Power supply
> >     - SATA 3.0 connector x 1
> > 
> > Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
> > ---
> >  arch/arm64/boot/dts/rockchip/Makefile         |   2 +
> >  .../rockchip/rk3566-onething-oec-turbo.dts    |  10 +
> >  .../boot/dts/rockchip/rk3566-onething-oec.dts |  10 +
> >  .../dts/rockchip/rk3566-onething-oec.dtsi     | 309 ++++++++++++++++++
> >  4 files changed, 331 insertions(+)
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-onething-oec-turbo.dts
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-onething-oec.dts
> >  create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-onething-oec.dtsi
> > 
> > diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> > index 4d384f153c13..ec57719e4573 100644
> > --- a/arch/arm64/boot/dts/rockchip/Makefile
> > +++ b/arch/arm64/boot/dts/rockchip/Makefile
> > @@ -104,6 +104,8 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-anbernic-rg353v.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-anbernic-rg353vs.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-anbernic-rg503.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-odroid-m1s.dtb
> > +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-onething-oec.dtb
> > +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-onething-oec-turbo.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-orangepi-3b-v1.1.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-orangepi-3b-v2.1.dtb
> >  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-pinenote-v1.1.dtb
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3566-onething-oec-turbo.dts b/arch/arm64/boot/dts/rockchip/rk3566-onething-oec-turbo.dts
> > new file mode 100644
> > index 000000000000..16d0cd0cf577
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3566-onething-oec-turbo.dts
> > @@ -0,0 +1,10 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +
> > +/dts-v1/;
> > +
> > +#include "rk3566-onething-oec.dtsi"
> > +
> > +/ {
> > +	model = "OneThing OEC-turbo";
> > +	compatible = "onething,oec-turbo", "rockchip,rk3566";
> > +};
> > diff --git a/arch/arm64/boot/dts/rockchip/rk3566-onething-oec.dts b/arch/arm64/boot/dts/rockchip/rk3566-onething-oec.dts
> > new file mode 100644
> > index 000000000000..81da771ad63d
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/rockchip/rk3566-onething-oec.dts
> > @@ -0,0 +1,10 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > +
> > +/dts-v1/;
> > +
> > +#include "rk3566-onething-oec.dtsi"
> > +
> > +/ {
> > +	model = "OneThing OEC";
> > +	compatible = "onething,oec", "rockchip,rk3566";
> > +};
> 
> The only difference between the two OneThing OEC board variants is, as
> far as I can tell, the amount of LPDDR4X DRAM they have, so I don't think
> it's justified to have two separate board dts files that descend from the
> common dtsi ancestor.
> 
> Having different amounts of DRAM on the same board design is present on
> virtually all boards from other manufacturers, and some kind of special
> DT treatment is needed only in some special cases, such as when different
> types of DRAM are used for different capacities.
> 
> The different naming of the two board variants could be solved by having
> something like this is the single board dts file:
> 
>   model = "OneThing OEC/OEC-turbo";

I agree with your suggestion and will implement it in the V3 patch set. 
Thanks for your valuable feedback!

> Having two separate board dts files only makes it harder down the road,
> such as having to build and provide two separate U-Boot builds, with no
> real benefits.  Every user can run free(1) to check the amount of available
> DRAM on their board, which also tells them the board variant.


