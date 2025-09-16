Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C77CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 13:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7/8TL00Hlar3x8JkbaIO/sy+q7FGgNPnwJ9JADaoRL4=; b=S++HjKlsSU1O8/o2nKFLMuoF14
	5Tn8VyEyvqM6no18lhcf9TBbT0JqvaGdRZKsugt1NUgIq++AbKJbglN0RUIyqSPlB56Dm32aiBk/0
	/+NAWRXAxUc8yX3jOwFRf5DdNc4R8FyuswDqgL5ja2opNFD3sbnljISL+Whd2SwuXJn6x/4DPYBKa
	VwLyp0Mywg/ce70j1G5zJWeui6wggXg4299jaAItHxf0lK7PE/cJpFJY0bHzhpb4dhwxs8Qdwg0D1
	JXFLDfLDiQ4KSW2dISYnIZqRKxPAZmtJ/Wa9xkWFT0HitbY04CM3O8WAQ7T83llXdVJ1iCHFhqeML
	qTCGDFtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVN0-00000007rwW-1F4h;
	Tue, 16 Sep 2025 13:05:18 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyVMx-00000007rvf-2mjg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 13:05:17 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-56fbc36b94aso861739e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 16 Sep 2025 06:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758027913; x=1758632713; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7/8TL00Hlar3x8JkbaIO/sy+q7FGgNPnwJ9JADaoRL4=;
        b=oDPF49lxs8MNU+boT9G2C6HPowIu5W82T/98a7oM+h49BeTBQr2UgiVtFCjF/7LRG/
         oisXxWv3mmX5uIQxMhjKb9nIF5TR1lMjUgyZxDAvqST2a2ltwJcKQ50UJzwIEAyPBTMW
         f+7MHxSXbeBJZUrMr6q0i9jitnSwmyiMYUSSKvHEynC646WGJafYkVH/4z2dE3z9mMRW
         dKdD9BCTYtYvDpPRti1VLPoEgcH97FP0tZnd1ImcfwEm3XbPWUpa0wGDGJztF8rKDIJk
         092S/Hm/MG0cIuRAGsCPDkDA6tbPD8sJaEZZsGGMCg0A88oCBB62bzFckPY4rkYizNRV
         OK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758027913; x=1758632713;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7/8TL00Hlar3x8JkbaIO/sy+q7FGgNPnwJ9JADaoRL4=;
        b=cjhOrNhGfNsDDWxGnvYEndo5wv5MFMA9E+bq56nZJ4Y6m1hJZ2DFrNXyZ8jdhGgKmN
         FAuABT45olI9tXt/G9uH4KFW3dtmd/atjNPvCg6c16jY3WX28esvXPjOYV4Ajj8WugX3
         6RB4DYDqu/CpOETrRC9ZToXW2hLgK5MmCD2qBCyCdE7qfICZo+/Ko+iAsimt2cXPWAk3
         suiekuag77aOZc3bl/EpU0fHvNeqgM6wkYDrPuB72rv/8EaIvP66PFwnCFty4ZDr3/fc
         oXEMyY+/xqYsyrzgyZBxlQHuzgQWXyi2+KWFiNGrPBipV/7JKag/LsY0AYbwtXo9n0fl
         AH2g==
X-Forwarded-Encrypted: i=1; AJvYcCUrKg2pV1cP8XUhXpHnCKaAEJ0TjE9JHzKrytMfTf5DWqFuIFMaFveyzhCHsHFqIvgNbhnTqbR3iEMscfzgOVhk@lists.infradead.org
X-Gm-Message-State: AOJu0YzwzPLwhk9PWfhTVKYIs33MCz42XhbmhN/S6cVaAiEDF2ui4xVc
	7fw6Uq9t1IflJUszSXBu/d/3X4NZtFg2juguIHP0o6BXnC+sXjvyIacZO8JUBXlk7js=
X-Gm-Gg: ASbGnctZTgxrbXIJIJscKElpofj3DmO/pe6OPsUjMsJjc4wpa+1ayqFP8tte/b+p10X
	R+TVwZZumkSmQxKGuToJ3ZTL1goXeFNRlvGEUMoxiDlffl1KnOSeD3jlU3P13px8AD1k15yTV5u
	uyD9AqaLv2eoWlyTf/PYl37JNfYLCUdV52WaxTJ6WccK/WGJbJ5GveXVIWyoevhw20TRM818aql
	Y3A3Z4UrY5pk16btIM53rZHM7b0v2o/nwRB0RcquJlL2pcleiEuaVrO72I5g2hyk4f5ndwPo+0X
	cc2e3Npz9uI+KJkltzA2CII72BSLo9DoTVkPy+s26wdQIIEiwSYd7kQaOXuWs31l8lHxt2HLvs3
	vAlR8zFJ5i9rY87A9P5eANiAEBdVYT0ILBKBG3i9t6xyNzA9wAXHo/wBZK4fdx4AI1A==
X-Google-Smtp-Source: AGHT+IENshuIe1ZzBTlZI8ErHAIWfYofEIxwEqD/DxJUwphDcoj5NYeMYiaSJpT5gnIx28eNAX2rmA==
X-Received: by 2002:a2e:bea2:0:b0:336:e445:92c5 with SMTP id 38308e7fff4ca-3513dd54c2amr23580931fa.3.1758027912735;
        Tue, 16 Sep 2025 06:05:12 -0700 (PDT)
Received: from monster (c-85-229-7-191.bbcust.telenor.se. [85.229.7.191])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-34f1b2a931fsm33599691fa.47.2025.09.16.06.05.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Sep 2025 06:05:10 -0700 (PDT)
Date: Tue, 16 Sep 2025 15:05:07 +0200
From: Anders Roxell <anders.roxell@linaro.org>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Russell King <linux@armlinux.org.uk>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH net-next v3 3/3] net: stmmac: dwmac-renesas-gbeth: Add
 support for RZ/T2H SoC
Message-ID: <aMlgg_QpJOEDGcEA@monster>
References: <20250908105901.3198975-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250908105901.3198975-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250908105901.3198975-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_060515_738642_309F6C64 
X-CRM114-Status: GOOD (  18.05  )
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

On 2025-09-08 11:59, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Extend the Renesas GBETH stmmac glue driver to support the RZ/T2H SoC,
> where the GMAC is connected through a MIIC PCS. Introduce a new
> `has_pcs` flag in `struct renesas_gbeth_of_data` to indicate when PCS
> handling is required.
> 
> When enabled, the driver parses the `pcs-handle` phandle, creates a PCS
> instance with `miic_create()`, and wires it into phylink. Proper cleanup
> is done with `miic_destroy()`. New init/exit/select hooks are added to
> `plat_stmmacenet_data` for PCS integration.
> 
> Update Kconfig to select `PCS_RZN1_MIIC` when building the Renesas GBETH
> driver so the PCS support is always available.
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
> - Dropped passing STMMAC_FLAG_EN_TX_LPI_CLK_PHY_CAP flag in stmmac_flags
>   as it is always set for all the SoCs.
> - Updated Kconfig to include RZ/T2H and RZ/N2H.
> 
> v1->v2:
> - No changes.

The following warning is seen when doing a defconfig build (make
defconfig) for arm64 on the Linux next-20250915 tag.

First seen on next-20250915
Good: next-20250912
Bad: next-20250915

Regression Analysis:
- New regression? yes
- Reproducibility? yes

Build regression: WARNING: unmet direct dependencies detected for PCS_RZN1_MIIC

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

This is the build warning:
WARNING: unmet direct dependencies detected for PCS_RZN1_MIIC
  Depends on [n]: NETDEVICES [=y] && OF [=y] && (ARCH_RZN1 [=n] || COMPILE_TEST [=n])
  Selected by [m]:
  - DWMAC_RENESAS_GBETH [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_STMICRO [=y] && STMMAC_ETH [=m] && STMMAC_PLATFORM [=m] && OF [=y] && (ARCH_RENESAS [=y] || COMPILE_TEST [=n])

WARNING: unmet direct dependencies detected for PCS_RZN1_MIIC
  Depends on [n]: NETDEVICES [=y] && OF [=y] && (ARCH_RZN1 [=n] || COMPILE_TEST [=n])
  Selected by [m]:
  - DWMAC_RENESAS_GBETH [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_STMICRO [=y] && STMMAC_ETH [=m] && STMMAC_PLATFORM [=m] && OF [=y] && (ARCH_RENESAS [=y] || COMPILE_TEST [=n])
I: config: PASS in 0:00:01.592356


By reverting this patch the warning disapears.


## Source
* Kernel version: 6.17.0-rc6
* Git tree:
* https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: next-20250915
* Git commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
* Architectures: arm64
* Toolchains: gcc and clang
* Kconfigs: lkftconfigs

## Build
* Build log: https://storage.tuxsuite.com/public/linaro/lkft/builds/32l4UF8KltAzu6kUpW3hXaYRWjZ/build.log
* Test details: https://regressions.linaro.org/lkft/linux-next-master/next-20250915/log-parser-build-clang/general-unmet-dependencies-warning-unmet-direct-dependencies-detected-for-pcs_rzn_miic/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/32l4UF8KltAzu6kUpW3hXaYRWjZ/
* Kernel config: https://storage.tuxsuite.com/public/linaro/lkft/builds/32l4UF8KltAzu6kUpW3hXaYRWjZ/config


--
Linaro LKFT

