Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED7F8C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 02:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jgPwlQ3V1QRI9qtvIn4Xbfg5FdP8EYBmkF1+/Mphpgo=; b=qrsti+KEFuXfdUeICkY2s4YyI2
	aRJo2GP95TxxakEu/rsjfW4V3nrWjrjvDNMACMUz8A5PMukUvs1M5kk82Al34djoNNpKoz/Jte1Kf
	SFNnFbMVOv+HLgrR0PdXKoJWNuhJHLAF/dt/vUN79Ul8ttRL4T8szcFvBUFQ1VExiCd27vU+A3eyM
	nJnt/kS78VThS3L7zu705mIeRVvj5P0KsgWccpJLZeU9Y+dA0hURYVxD4dVWhUGAfG5gXY/VCB50Q
	N8M/j2Flouo1+cC+ZuI2xScLItJf8pe/EUBMG/3bQu6w/pcldofbDtAgyhUVRleY5Wwz0rCl8ZIT1
	IHTZDjSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGqBT-00000007pnH-0XFH;
	Mon, 19 May 2025 02:24:55 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGq9R-00000007phN-1oZG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 02:22:51 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5efe8d9ebdfso7051596a12.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 May 2025 19:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1747621368; x=1748226168; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jgPwlQ3V1QRI9qtvIn4Xbfg5FdP8EYBmkF1+/Mphpgo=;
        b=QNN2adTPY7GewoZjAgfaNpYjocAFSzPsPLvcmxsyzfKWmh9IJ9cnSjEmVlcqf/NVqM
         dkS/5HpQScmn3BNfL0RaNTchiTi3C6GP5lgWRcpScLtoO2fJSwaLXFmxxa3G7yjId5IZ
         P25Gj+yEOjNrICz4V6EX1Nf4Xc27EnnuUbWOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747621368; x=1748226168;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jgPwlQ3V1QRI9qtvIn4Xbfg5FdP8EYBmkF1+/Mphpgo=;
        b=kHOLey9SqWptbL7lBVvBH3AXRkCSLEUE2o2U2cQpuJkdFR/p9CHDKtT0Knu3z02+x5
         L4M5arAsjlVQzQk6jb5useqARPLv6zrE1Z6re5k/7wuSV6FfQuWYsoXR37e4Oazx6pfy
         dZtJt511KX1s88MSDhfolGr2JqkJmQpHMUpMmxrDXWtrUAmOEWj8wFtLAKV3K1qj6Gbt
         RiFeCtJuQ7jkANwSJ9yXRgA6vp1eVS8hYZdvjM7gxdCGUVQoTyelc1kEFPxrCXjxwCDF
         V51FkBuNLWZzqXuEx1qmmE/HENIFwDRQxpSuEQEVikxeaErmk2whg8HX1qxj5+cVNKFn
         69KA==
X-Gm-Message-State: AOJu0YzofuW8Rgcq6N+Gbh96oRA9GxdoKg0zdgVNjCcKBHX3DzxgvPok
	9dq7GIkISj5u3EgSHXq9x2w9P0a/Jux3qq1f4RudHaWe1mZxFEoZPtaBCe10dZNlz4XOmAPQbJq
	OtCya3kQ+789rFZtzHIZ2AW/MzRqsRxo=
X-Gm-Gg: ASbGncuHlygCFRHKwl/DbcjaHoETgULTZZcIHZ84bk2O460GwakqPQ/MWW2D4Nhd9uv
	Wt9ehpXICY55L/GATpCl8/+B8z/1Taa+5zSOXRRqo03JZxUig07lcBolmvIL1vSOmKivsWCP0vT
	BNf5dq+IUttNoPEbzcf/0imE+Y2mVZoX1u
X-Google-Smtp-Source: AGHT+IFicjBynjH9uDuPTPcovcervueKk/qrETxIQ3ouE/hg9HV8KOFgvLMlflL0TXT5GEYtsMoDtJp9g6T3VtKHpVI=
X-Received: by 2002:a17:906:ef07:b0:ace:bead:5ee6 with SMTP id
 a640c23a62f3a-ad536f9d461mr772538266b.37.1747621367635; Sun, 18 May 2025
 19:22:47 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8Xe=f_hNNWUGL670x4-OeKgDB+2P+mxp5BaTLW==T5jE_A@mail.gmail.com>
In-Reply-To: <CACPK8Xe=f_hNNWUGL670x4-OeKgDB+2P+mxp5BaTLW==T5jE_A@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 19 May 2025 11:52:35 +0930
X-Gm-Features: AX0GCFvn8zJVewrJp6DGAq-ZrU_lB-AVtzRjhX-cF_3Sh8nYyVdah7YPE2XjXqo
Message-ID: <CACPK8XeRqO1qouB9eioo2roGEXUm6c_V=s7ccA6qL7QQiqANag@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: nuvoton: soc changes for 6.14
To: SoC Team <soc@kernel.org>
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_192249_563959_A72EAF04 
X-CRM114-Status: GOOD (  15.60  )
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

On Mon, 19 May 2025 at 11:43, Joel Stanley <joel@jms.id.au> wrote:
>
> Hello Arnd,
>
> Here's the Nuvoton 32 bit arm pull request for 6.16. Andrew has prepared the
> patches and created the tag, so all credit goes to him.

The subject has the wrong version in it, as you've probably noticed.
The rest of the details should be correct.

>
> The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:
>
>   Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/joel/bmc
> tags/nuvoton-arm-6.16-devicetree
>
> for you to fetch changes up to 7efb8b92165fea427a03df87e14d519b8acf57f8:
>
>   ARM: dts: nuvoton: Add MMC Nodes (2025-04-08 11:29:38 +0930)
>
> ----------------------------------------------------------------
> Nuvoton ARM devicetree updates for v6.16
>
> - MMC, OHCI, UDC and EDAC blocks added to the NPCM7XX DTSI
> - Fixes for GPIO hog names in the NPCM730 and RunBMC Olympus platforms
>
> ----------------------------------------------------------------
> Krzysztof Kozlowski (1):
>       ARM: dts: nuvoton: Align GPIO hog name with bindings
>
> William A. Kennington III (4):
>       ARM: dts: nuvoton: Add EDAC node
>       ARM: dts: nuvoton: Add UDC nodes
>       ARM: dts: nuvoton: Add OHCI node
>       ARM: dts: nuvoton: Add MMC Nodes
>
>  .../boot/dts/nuvoton/nuvoton-common-npcm7xx.dtsi   | 108 +++++++++++++++++++
>  arch/arm/boot/dts/nuvoton/nuvoton-npcm730-gbs.dts  |  12 +--
>  .../dts/nuvoton/nuvoton-npcm750-runbmc-olympus.dts | 120 ++++++++++-----------
>  arch/arm/boot/dts/nuvoton/nuvoton-npcm750.dtsi     |  65 +++++++++++
>  4 files changed, 239 insertions(+), 66 deletions(-)

