Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D7A9EEF312
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 07:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KLWXJFRzKXYfvRWexgs1gCb/dTgnevi1M5AetCjur0g=; b=yrqLfYe6l+Br/ESVCWr8/ggwQt
	lAV3aH/nRT8i8NKG0vcsZ4c7iXcq3R5jgLsNlaeOol0UI6iyaN6PGUZZaLKjTWypRUJ3zE0I0XRE9
	YyZFrzzf6iMbMtDZ4+JW7tC4FyqtfymM190vRReOYzEo4YYk03ix4RJ7EN7HvoY5GeZhcThz+fV6c
	pJPkkVyoftZmmdfw2ZnBCj/cxZ543oy3ZmAo5xVXZCEOkLdKVEMjJsmegTsY9W9a2K3qElLq+ClnH
	htb+PlPIvKSgJmSTUhxIuxQi9mtgollLUFtK7ByIaOX0Um4BqRAkYmeZbj98Lk0awJBjMpV2DSglT
	Vb0ow/qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy3Tu-000000017ns-3cEp;
	Thu, 05 Mar 2026 07:50:50 +0000
Received: from mail-qk1-f178.google.com ([209.85.222.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy3Ts-000000017nW-0Nx5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 07:50:49 +0000
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-8cb40149037so804403485a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 23:50:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772697047; x=1773301847;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KLWXJFRzKXYfvRWexgs1gCb/dTgnevi1M5AetCjur0g=;
        b=BaWivdJPbQxbYm496XkdMdvNEibgsztRfuPcYQFs1ae8ca2Y/w4kROl+b1RF98GRU7
         oKxc4IiQR4rWUeLGFFGfcrAK3hxJrxV9AeV8FmaidTvmM6pQjE4clfFTQKbwCGcU5hpt
         bR665eSIW9q5y0hIqWgGj5AYpa2Yv8rRIuI3wnWfNsVN5Q5MjD+euaV0GJ7UmQRjnIk7
         KWMx+wbeF7BRIl9LR7NUvB40unh2UpTh31+smqa7BFrNp6TkIvY+P4PlrtlgfknfG3wO
         YNHitARRYrta0O0YpMt8KaOhdjRmu71drW5JXhlip/RSxtEe6bPNwIDEkcU/DGiGyA3N
         Jh1A==
X-Forwarded-Encrypted: i=1; AJvYcCUrP53rdVHkxBDGtlhdhSItybsIOMJPI+7HGuez/DwiU31PPUZVThgk9AGQk+Og2R9kdhcZI6fcGI9OQ/W5nYqL@lists.infradead.org
X-Gm-Message-State: AOJu0YxFsughz3E4Inqp1i11c/7t2nGkzubIsWu2nhIX3pM0XRFdProN
	pjEUDajielh0FG2qKG5MPm4nnE1eTPdCoihoB4A+6x06cAmekDhrYl958VenQbnr
X-Gm-Gg: ATEYQzxSWAl4zsFim0+0I4geRiqh1qYCFZl5xh6DxMZdNgA+xmRFDHqWrZnRN7DCHqi
	iDt4OrXpFPZjRRIui7gFCwy38ppHZr2vxxbLrA+34RUMubbOfL4UY9jxb4MgHWFFzSa/UFKMeXp
	6blqIXaoNduqUp8lf7/0qAabyog3Hsww5DaH80m8+xnMdvITd7pME/VXUfsX32n4IDZKoXarmY9
	YCAhF/ElpcKheH31Xdrv4Dg0Vg/43daTsr9U6ZsdN4P42rokf64nptBgI6sC1f93cntni8ZbYV0
	7VlLM3cuEdEFubHIf6PXR9O0oK07iM61smRKCiIA8EorRWxMz6eeWRuAOoDdBNlj9ZzDmkSHPSY
	2T1GTAgl+sxgC5i3/KbqYulfmer/oyhe4UWmKF8RmLx4H2Ew5SRrgCER7v0NvhN/zQ/YpbFZhaJ
	nuAUGz1zMVJbH0ub26fr6n9AymopHsoPvVWfOXyjH7NRKp6rI3Q/VsHI7+Mg/s
X-Received: by 2002:a05:620a:2a0f:b0:8c5:3574:90a7 with SMTP id af79cd13be357-8cd5afcc90bmr581463385a.80.1772697046463;
        Wed, 04 Mar 2026 23:50:46 -0800 (PST)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com. [209.85.219.47])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf71ac86sm1819254685a.40.2026.03.04.23.50.46
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Mar 2026 23:50:46 -0800 (PST)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-89a0d53f3d1so28775736d6.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 23:50:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXvMw9SsCvF7XapKGr4vyePEmJzlYd6PabQuaEoy4RtIwW8NhiBMsGJnBlGVqg/ps8P/2r5G3QoprL1Wr7vOn0h@lists.infradead.org
X-Received: by 2002:a05:6102:441c:b0:5f9:3a22:85a2 with SMTP id
 ada2fe7eead31-5ffaac72675mr2059267137.12.1772696734612; Wed, 04 Mar 2026
 23:45:34 -0800 (PST)
MIME-Version: 1.0
References: <20260304175735.2660419-1-vladimir.oltean@nxp.com> <20260304175735.2660419-6-vladimir.oltean@nxp.com>
In-Reply-To: <20260304175735.2660419-6-vladimir.oltean@nxp.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 08:45:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXA67BO8Umz8-4jRg1SLvtZUSEzK0p7WxSvomnBk+WiyA@mail.gmail.com>
X-Gm-Features: AaiRm52ziEM93YxO07h7pOV0rTYZnULijxTOwLRm9EW_k_lOxLulmwK4PITV2jw
Message-ID: <CAMuHMdXA67BO8Umz8-4jRg1SLvtZUSEzK0p7WxSvomnBk+WiyA@mail.gmail.com>
Subject: Re: [PATCH phy-next 05/22] phy: add <linux/pm_runtime.h> where missing
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
	UNGLinuxDriver@microchip.com, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Heiko Stuebner <heiko@sntech.de>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_235048_132530_EC98522C 
X-CRM114-Status: GOOD (  20.30  )
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
> It appears that the phy-mapphone-mdm6600, phy-qcom-snps-femto-v2,
> phy-rcar-gen3-pcie, r8a779f0-ether-serdes and phy-rockchip-typec drivers
> call runtime PM operations without including the proper header.
>
> This was provided by <linux/phy/phy.h> but no function exported by this
> header directly needs it. So we need to drop it from there, and fix up
> drivers that used to depend on that.
>
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

>  drivers/phy/renesas/phy-rcar-gen3-pcie.c       | 1 +
>  drivers/phy/renesas/r8a779f0-ether-serdes.c    | 1 +

For the Renesas parts:
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

