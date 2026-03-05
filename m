Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A7CEEEF319
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 08:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Ymdw+XC/6Jy9fN+NX35+E/o8bLZmtxZBZ4e3pQeTxE=; b=bqK1LpIgus5pyBIhPvw70YYlbA
	lkqrVcoGebnJpgVyT85HIk5fa6kdR0hW+0jAmfLkOMrZWBPQWOuwyLArqmRcY2O6PN/T4aj5aZXGi
	HT++4EXDgy2Vv9q8ap7nJ5p3xpez2bEUzmyo5otbH/CaRgVPb5kRjI4w46NG3fZq+rdk46Vl2t3Rl
	2CPntFrn9hjPwYBJ6ewJPih6mL2Sj/Wn1JGWIA23acuzAEaD6w9vr272pP9C/8cr++rTSbbqb5am5
	qz2Sy46KY82Q5gcd/PdhvHj1SAB/tK2L8E3+I5LxOSPJK1GfwAXAZ7QF0SXtsOjVNcNMYBVKIrrTl
	4Zifr7GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy45s-00000001CUd-0xA7;
	Thu, 05 Mar 2026 08:30:04 +0000
Received: from mail-vk1-f178.google.com ([209.85.221.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy45p-00000001CTP-42k0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 08:30:03 +0000
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5688c221fd3so3483494e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 00:30:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772699400; x=1773304200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Ymdw+XC/6Jy9fN+NX35+E/o8bLZmtxZBZ4e3pQeTxE=;
        b=DDPzHPUNgqvKen+++PDWKeVAsHt8LMPv6AY1zoMg+X66hfEiuhn5yCtu/Su6owIT1j
         xo4JFBDGFMB9x08+wDkWxHveqdzIIyniLtNChuT+44D2VZi4XiYjHU7NVRkdwOGyp40s
         YkcG+Ncf1dHnaW3erC1iC7MbBAdZ+8Moh3/kaPiGYF/Lsxe/dEahfVVXsgTTcjIpyKVu
         nzsvBndo+AvkTy9/ZkBE9ZlahjZeat4NpSKUr9QwXVDSlCfM3n2vUHoj6y7ld+5k+B5H
         Bt0HOgg/WTvYPzK9iRgK7/lm6FrZcan8EmOXLq4eceZXw9pG1IP2vuSIiSlTZRtjRxvC
         Ecqg==
X-Forwarded-Encrypted: i=1; AJvYcCWELmotgsFejrH/EkL4CDOToQZRxWW6xGOC4xZjvaNzrTr8fEr1addNJ8b0/HYUwvhZsBlv5jhaeNrXVHRmN3me@lists.infradead.org
X-Gm-Message-State: AOJu0YyF5TOhhUPfUNk6WMsE8NNACQYxEgI8FsIP/B7S6dtAQzKcYqjE
	o55kW6WIASBQIdA3ZCwrVuPCUQcp6V3r5mQD/VbTCGRszpooWccCkD1px2XqECU6
X-Gm-Gg: ATEYQzxwDXncwd8VIJIkLk9nn/tAEodYwFiXz7jFOdqiripQr4gJScdGOij3NnRHA0s
	1T54kU1L1DxPY5dAil44D06BHEJ8g8ZJUSNwN6ZOqZ6Nh1zSnQeiNaYhE/dORTrekj+kI+3XlEc
	eFcYXst9jhZ1RaxXHjgyxk8fnMyKQ1yYFtDsTA/IB3TuDvBfL9kP7jaZx428UJL0Ut9/aTb9dJq
	5wgYNPSJGB1J+YjR+V8ql4chzuJNMgYGn/sJKUWjnD9KJfILBDXb4ep16OS+B0qnBVJ5Spt4qX1
	gUixrTfr4A01tk2m6xMEvfUfWRzQr9B/uEG+tEBPHeSKgthvDLrD3hdgA54u3XSKAX3Jtf48Dhx
	rRuLP15ZY9Fl0+570+6d5vhkstXUyIflFJi5Gu/nrFNIfZW2NeBzRGgsNcBsb5htbUnAOV6UNIm
	h7FlgncFhsLvAonGirzCopt6RdawSW3o2DmDZpF0KB1gIGcxDYAZvnWP9ear3v
X-Received: by 2002:a05:6122:6586:b0:559:5dbe:fe29 with SMTP id 71dfb90a1353d-56ae74c943cmr2213119e0c.2.1772699400558;
        Thu, 05 Mar 2026 00:30:00 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com. [209.85.222.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56aea88c0b6sm4459146e0c.20.2026.03.05.00.29.59
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 00:29:59 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-94e2ad66abcso1249905241.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 00:29:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWSFOT5WcbYek8yiXHOXod2MLFRcj8f30fYYo08yjjsr4DCOcmmdowsF0t92lFQgR3bHkjUwNAQcdDEP0BNbKmH@lists.infradead.org
X-Received: by 2002:a05:6102:2ac9:b0:5f7:24dc:3ac3 with SMTP id
 ada2fe7eead31-5ffaaa86250mr1899404137.7.1772699399463; Thu, 05 Mar 2026
 00:29:59 -0800 (PST)
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-18-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-18-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 09:29:48 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXUBhpnFEnnTfyPdECWqNmKLweupX=FY2SedYA3bapG2g@mail.gmail.com>
X-Gm-Features: AaiRm53mHozL13yvxji6rv0MKzaGvWxuhr7SWHD2SjBJ0VWNhqppZZeXezGpDhg
Message-ID: <CAMuHMdXUBhpnFEnnTfyPdECWqNmKLweupX=FY2SedYA3bapG2g@mail.gmail.com>
Subject: Re: [PATCH phy-next 17/22] net: renesas: rswitch: include PHY
 provider header
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-can@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, 
	netdev@vger.kernel.org, spacemit@lists.linux.dev, 
	UNGLinuxDriver@microchip.com, 
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>, Michael Dege <michael.dege@renesas.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_003002_017886_3DC0B3A3 
X-CRM114-Status: GOOD (  33.81  )
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

On Wed, 4 Mar 2026 at 19:00, Vladimir Oltean <vladimir.oltean@nxp.com> wrote:
> As a PHY consumer driver, the Renesas rswitch dereferences internal
> fields of struct phy, something which shouldn't be done, as that is
> going to be made an opaque pointer.
>
> It is quite clearly visible that the driver is tightly coupled with the
> drivers/phy/renesas/r8a779f0-ether-serdes.c, which puts heavy pressure
> on the Generic PHY subsystem.
>
> This was discussed before here:
> https://lore.kernel.org/linux-phy/20260211194541.cdmibrpfn6ej6e74@skbuf/
>
> but to summarize, it is generally expected that when a Generic PHY
> function is called, it takes effect immediately. When this doesn't
> happen, the PHY provider driver must change its implementation rather
> than the consumer be made to work around it. PHY providers which rely on
> a hardcoded call sequence in the consumer are just lazy and wrong.
>
> The most obvious example is commit 5cb630925b49 ("net: renesas: rswitch:
> Add phy_power_{on,off}() calling"). Problem description:
> - Ethernet PHYs may change phydev->interface. When this happens, the
>   SerDes must learn of the new phydev->interface using phy_set_mode_ext().
> - drivers/phy/renesas/r8a779f0-ether-serdes.c implements phy_set_mode_ext(),
>   but this only caches the mode and submode into channel->phy_interface
>   and applies this to hardware during phy_power_on().
>
> The commit author decided to work around this at the consumer site, by
> power cycling the PHY for the configuration to take effect.
>
> This had a worse implication from an API perspective in subsequent
> commit 053f13f67be6 ("rswitch: Fix imbalance phy_power_off() calling").
> It was observed that phy_power_on() and phy_power_off() calls need to be
> balanced, and so, the consumer decided to start looking at the struct
> phy :: power_count (the technical reason why I'm making this change).
>
> This is also wrong from an API perspective because
> - a consumer should only care about its own vote on the PHY power state.
>   If this is a multi-port submode like QSGMII, a single phy_power_off()
>   call will not actually turn the PHY off (nor should it).
> - the power_count is written under the &phy->mutex, but read unlocked
>   here.
>
> The rswitch and r8a779f0-ether-serdes drivers both need to be completely
> rethought in terms of Generic PHY API call sequence. There is no quick
> fix to apply. Just include the PHY provider API along with the consumer
> one, to keep working as before when struct phy will be made an opaque
> pointer to normal PHY consumers. But this is a bad offender (and it's
> not even a provider) so add a FIXME.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

