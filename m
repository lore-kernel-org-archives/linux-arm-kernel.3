Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C1BC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Jul 2025 19:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDDM8l3h0Fw3qJuqS7zowlihC7cLJKPy3Un6rJmnlMs=; b=m6iCRtj5Kw8qls0Li14yOq6Uz6
	HCkiBWMDfU4YSxgzOHIObRfImbhO94ZXYibpUeLpCLhXsCtAfzV3b18/Oj++CqK+u4MGnvTNyNhoN
	KlVjdZf8nXfF81OkfMlhy1xsc1Q1NthPsKp0Z7ZoHlpnKEAnD0EtU/QpM4I/pZdxg1HvRSjsjb29f
	R8VQ7L23roRipI5QnjQ5qqvPkbUrTY7F4UQn0y/CgrRqeHjZh0hY6KrUBIdv9logpokltJ83kbBZJ
	teC03+LtRDvyHneEGPsFktMrnd+od9+sV+eFULcIgginVDmjJSDGgM5KiGoDrzTCevxO3hELq+6Br
	dddFxuOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7oj-00000008UYv-0ELK;
	Wed, 16 Jul 2025 19:29:25 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc7mG-00000008ULp-0eCh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Jul 2025 19:26:53 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-45618ddd62fso1879665e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 16 Jul 2025 12:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752694010; x=1753298810; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDDM8l3h0Fw3qJuqS7zowlihC7cLJKPy3Un6rJmnlMs=;
        b=SjM6Xjr+3lox1JYFqvmpMd9PMMzgRZSvogSQPsAj+BtpoqQt0MZyTwycWm3c83OiCt
         RrBIhzVROQQDXCttWwFvMjbWrAd3dybTJxYxFzY1lvl0gIEFr5jVewnHI106EWEhK9rK
         C/ujUYyq6thUqou8Dxv+nyqbW/q9Qpa18yzTTVX23cYs6tFB8D2Re5Xi8jdp4FTs77gw
         cZU2tNzokV1V8oNmTSYyo9QV0otPPRSzXZ157JO/7baAEPd02GLrt6Nxcp6Vli5L6EDu
         ts/oRInvwx+UXd0FTRjqP0BBhY6XgCp78M+8h6qbd+QCwWfgw8LzdpXZHGcZfSGBJPYO
         BMdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752694010; x=1753298810;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDDM8l3h0Fw3qJuqS7zowlihC7cLJKPy3Un6rJmnlMs=;
        b=T2yenXWh8CFpTHwI/qGUzynF/tEVkxr4Ha5gMZRs0gHGvGAHr60zt4NjDxFyWA/n+7
         sB/0dMvUCC2fZ97TZYpT8XbuLxGDWfWKUy+rGWQ1IcDrfAUsYPAsmG98WNCDXsItA08Y
         iSrUGMVE7YdFDZIlLze6NsQwW2pCIoKQAvvfWKv7JrSQhx3wQsFR/LZqldKt9RhIXZEC
         Glx77pHgpJmpWrZYK9uXe3OBC02BXaqLa6vSVOFXEkxbrd9J+cJU4OP9OVfZwVRSqgbZ
         DRmHzFbTr4+UMDXrNA/9BH0DKyb3efUaAIRTnxoBYJ069XL4yzC0YAj249DU/iSmmVHO
         ck1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXMeSincn5eTa6EwTjTsfojb61wVt5hrlCQgymgtAn13h2vUR6zzroxrRvAJypLXQ7TwxpxBbdqCjW0pUDwxhHt@lists.infradead.org
X-Gm-Message-State: AOJu0Yyssvz5eVVHONuzqeZzTz5iOQcUZhLVkojptzRKyY7zv0Hz7+pl
	YA86IzoPdH3No/xvhitRnw25Nab3FM+1t2VfpWBZlqKQh5E1rZoX85U/eAsu6OgrOIZFPSxNeOt
	pLP4j3xfI7f7PPSdKVSrSElCt8l5yj5I=
X-Gm-Gg: ASbGncuiz6euHtJij7zlvcfp04k6004ALO5wNtgvBzVFn3LIATQCm8NPip3nvwRiaEB
	4KOg2Kw5VP1H5myivqX+kzEmuxIF4EzCWsEbMJM7Uz9pgSsVMP9uvfcUWWuAMWcvT9EkCrbqC5D
	s9wF+7U9FhvKHZgLVTnT6Ws2K/0l0um1nsquFiCx5zkNrfCQJyT8EGJKbjPT0GYzwsPunPdo6V6
	TzWVrgU9Ev4n4h5STg=
X-Google-Smtp-Source: AGHT+IG4hycp+esWmsd2Z1+rpj9/YEraQLvhtZn7APofxtvpj7YLxfhmQfzBkZnpCvMDICpuYr9ivl1mVrd1KFZdmyg=
X-Received: by 2002:a05:600c:8b67:b0:456:19be:5cc with SMTP id
 5b1f17b1804b1-4562e38a883mr37986905e9.14.1752694009872; Wed, 16 Jul 2025
 12:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250705170326.106073-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20250705170326.106073-1-biju.das.jz@bp.renesas.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Wed, 16 Jul 2025 20:26:23 +0100
X-Gm-Features: Ac12FXzHx2y0J4y7k-9UUt0aRslx85AqxD4tqzLHcP623nHbyWD8RXhTbillqKI
Message-ID: <CA+V-a8tZKMfDjxmrkTJhN+=WoGBR0711yoZYgQWDKd361f9q_A@mail.gmail.com>
Subject: Re: [PATCH net-next] net: stmmac: dwmac-renesas-gbeth: Add PM
 suspend/resume callbacks
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das.au@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_122652_194243_40A3BA10 
X-CRM114-Status: GOOD (  19.69  )
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

On Sat, Jul 5, 2025 at 6:03=E2=80=AFPM Biju Das <biju.das.jz@bp.renesas.com=
> wrote:
>
> Add PM suspend/resume callbacks for RZ/G3E SMARC EVK.
>
> The PM deep entry is executed by pressing the SLEEP button and exit from
> entry is by pressing the power button.
>
> Logs:
> root@smarc-rzg3e:~# PM: suspend entry (deep)
> Filesystems sync: 0.115 seconds
> Freezing user space processes
> Freezing user space processes completed (elapsed 0.002 seconds)
> OOM killer disabled.
> Freezing remaining freezable tasks
> Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
> printk: Suspending console(s) (use no_console_suspend to debug)
> NOTICE:  BL2: v2.10.5(release):2.10.5/rz_soc_dev-162-g7148ba838
> NOTICE:  BL2: Built : 14:23:58, Jul  5 2025
> NOTICE:  BL2: SYS_LSI_MODE: 0x13e06
> NOTICE:  BL2: SYS_LSI_DEVID: 0x8679447
> NOTICE:  BL2: SYS_LSI_PRR: 0x0
> NOTICE:  BL2: Booting BL31
> renesas-gbeth 15c30000.ethernet end0: Link is Down
> Disabling non-boot CPUs ...
> psci: CPU3 killed (polled 0 ms)
> psci: CPU2 killed (polled 0 ms)
> psci: CPU1 killed (polled 0 ms)
> Enabling non-boot CPUs ...
> Detected VIPT I-cache on CPU1
> GICv3: CPU1: found redistributor 100 region 0:0x0000000014960000
> CPU1: Booted secondary processor 0x0000000100 [0x412fd050]
> CPU1 is up
> Detected VIPT I-cache on CPU2
> GICv3: CPU2: found redistributor 200 region 0:0x0000000014980000
> CPU2: Booted secondary processor 0x0000000200 [0x412fd050]
> CPU2 is up
> Detected VIPT I-cache on CPU3
> GICv3: CPU3: found redistributor 300 region 0:0x00000000149a0000
> CPU3: Booted secondary processor 0x0000000300 [0x412fd050]
> CPU3 is up
> dwmac4: Master AXI performs fixed burst length
> 15c30000.ethernet end0: No Safety Features support found
> 15c30000.ethernet end0: IEEE 1588-2008 Advanced Timestamp supported
> 15c30000.ethernet end0: configuring for phy/rgmii-id link mode
> dwmac4: Master AXI performs fixed burst length
> 15c40000.ethernet end1: No Safety Features support found
> 15c40000.ethernet end1: IEEE 1588-2008 Advanced Timestamp supported
> 15c40000.ethernet end1: configuring for phy/rgmii-id link mode
> OOM killer enabled.
> Restarting tasks: Starting
> Restarting tasks: Done
> random: crng reseeded on system resumption
> PM: suspend exit
>
> 15c30000.ethernet end0: Link is Up - 1Gbps/Full - flow control rx/tx
> root@smarc-rzg3e:~# ifconfig end0 192.168.10.7 up
> root@smarc-rzg3e:~# ping 192.168.10.1
> PING 192.168.10.1 (192.168.10.1) 56(84) bytes of data.
> 64 bytes from 192.168.10.1: icmp_seq=3D1 ttl=3D64 time=3D2.05 ms
> 64 bytes from 192.168.10.1: icmp_seq=3D2 ttl=3D64 time=3D0.928 ms
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> This patch is tested with out-of tree patch for save/restore
> ethernet OEN registers in the pinctrl block.
> ---
>  drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c | 1 +
>  1 file changed, 1 insertion(+)
>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Cheers,
Prabhakar

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c b/=
drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> index 9a774046455b..df4ca897a60c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-renesas-gbeth.c
> @@ -136,6 +136,7 @@ static struct platform_driver renesas_gbeth_driver =
=3D {
>         .probe  =3D renesas_gbeth_probe,
>         .driver =3D {
>                 .name           =3D "renesas-gbeth",
> +               .pm             =3D &stmmac_pltfr_pm_ops,
>                 .of_match_table =3D renesas_gbeth_match,
>         },
>  };
> --
> 2.43.0
>
>

