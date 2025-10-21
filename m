Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA4ECCD1A5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 07:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WRfbIqhxMV94BhYJFlNG1uPvGd2zSAw0MCwaC23KmcI=; b=B5N7yvrFSsmjOP
	ZlsXqEgRI+XPEERxLgt6m3vRwawwwDqLKqkz4irwVCOJSniZJkS+GJmutjKWcMnCKHylWSmn9hlkF
	bmIlu3Ph+76vePFOME4XJCVbQWHL2/Vqp2r8UUlZxlCBGWFhVPxX4WBzsAB0qtCRw4feLACMb+vJM
	Un8+8unBJh49VUrQWZkyIGGJJAuLG7WYpAMBda24DByg4g5AVlIaAlYSL+rtvABkmwVAq7lqfVDiG
	P2srMek/VG/MoFYydaYqp8x0khM+APbB4qp8kzJan1MVS6XCFj6JjMQfDtJCTYcxaFBUN/LzChCIM
	2XfzphdFgzliAwomR5LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB727-0000000G7XF-0j1J;
	Tue, 21 Oct 2025 07:43:51 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB722-0000000G7OP-3XzQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 07:43:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0D36F45D59
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 07:43:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E10A6C116C6
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 07:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761032625;
	bh=L3OSHu/zykUUrMf0jhQiVo+5X5Tp4yjmsTRArUNbg40=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=D3WmNV5OqWaI36RDmwCXD2zHkNsqyRVCkAn+v3D9hIPGqFKrFzO6zLhOlJXqH0tul
	 z2283fXiVPnJ7hDSqqg2M+HjvVhmN56pYo48edn5tkLY5Vicm/mg/XjRNHgS0WVnSN
	 7XEcS/bevwfx8IyxgFijllQXrY6eoIRkx+yCvGhVrHL/CCcXmWMCiJBkM1w81VqTYa
	 OKEa7Alhk4YQI+8xGmJm2DQ7zD13K8lLbv4/CvcRVwYp/StS+FjZ2U/jxWJ2dU+H+h
	 x/SRcfVdH1RQ+8bXR8NLU1FvCv5EYUTBr3q8S9eAR2OwLHCDiqP79GOaaB/3gXiPz/
	 NIhnH7cZbDlIA==
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-363f137bbf8so46893301fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 00:43:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUlRw0zXT/42ZOaF7Lvi6GRadezDn6cAoXIUa3OwAnIH+Dwb4hfabKreCUfmI7mc6SssyfTB0VYXOlAhjkQtNyA@lists.infradead.org
X-Gm-Message-State: AOJu0Yz68M03Ly0TEPgVm4Ism9A8H1bSyboc7YEl3uE5uo5qL3dseUMA
	IVW3UsyZDBtwOmQOticUcIW3C+70Groy2WaRtFpAATG6FiIjK1up1yBeMLjWgOibwPxoUEw59Iw
	N6swmD1eVOe1wkx4Zf72W/1ey8UfYtdY=
X-Google-Smtp-Source: AGHT+IGdlueTEgM73EYjdJJ7MYdcpYR/rotWSKlN7mFY5uUlnnqxOjkAfgQUxRhc1E7On08N06u+r1J6has1Jnhp3yI=
X-Received: by 2002:a2e:9fcb:0:b0:375:ebfa:2986 with SMTP id
 38308e7fff4ca-37797a728f1mr44182921fa.34.1761032624223; Tue, 21 Oct 2025
 00:43:44 -0700 (PDT)
MIME-Version: 1.0
References: <E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1vB6ld-0000000BIPy-2Qi4@rmk-PC.armlinux.org.uk>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 21 Oct 2025 15:43:29 +0800
X-Gmail-Original-Message-ID: <CAGb2v67U1KUeEvQ8yhSHP5NY1-9hGuwuTwgKMWGJB2LZn5pwqw@mail.gmail.com>
X-Gm-Features: AS18NWBVywV_yRWAV-n1YGVmZIEA5XvU8OAR8wbCjrwgr8Xivfn8oNIG-rClQ6c
Message-ID: <CAGb2v67U1KUeEvQ8yhSHP5NY1-9hGuwuTwgKMWGJB2LZn5pwqw@mail.gmail.com>
Subject: Re: [PATCH net-next v2] net: stmmac: replace has_xxxx with core_type
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Jan Petrous <jan.petrous@oss.nxp.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	linux-tegra@vger.kernel.org, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Richard Cochran <richardcochran@gmail.com>, s32@nxp.com, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Vinod Koul <vkoul@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_004346_971729_0E22606F 
X-CRM114-Status: GOOD (  14.53  )
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
Reply-To: wens@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Oct 21, 2025 at 3:27=E2=80=AFPM Russell King (Oracle)
<rmk+kernel@armlinux.org.uk> wrote:
>
> Replace the has_gmac, has_gmac4 and has_xgmac ints, of which only one
> can be set when matching a core to its driver backend, with an
> enumerated type carrying the DWMAC core type.
>
> Tested-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
> v2:
> - fix conflict with removal with STMMAC_FLAG_HAS_INTEGRATED_PCS removal
> - wrap 88 char line in stmmac_xmit()
> - add Maxime's tested-by
>
> I haven't added Maxime's r-b because the patch has changed subtly, but
> not in a way that invalidates testing. Given the minor changes and it's
> possibilities for further conflicts, can we get this in sooner please?
> Thanks.
>
>  drivers/net/ethernet/stmicro/stmmac/common.h  |  5 ++
>  .../stmicro/stmmac/dwmac-dwc-qos-eth.c        |  2 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-intel.c |  5 +-
>  .../ethernet/stmicro/stmmac/dwmac-ipq806x.c   |  2 +-
>  .../ethernet/stmicro/stmmac/dwmac-loongson.c  |  2 +-
>  .../ethernet/stmicro/stmmac/dwmac-lpc18xx.c   |  2 +-
>  .../stmicro/stmmac/dwmac-qcom-ethqos.c        |  2 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-rk.c    |  4 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-s32.c   |  2 +-
>  .../ethernet/stmicro/stmmac/dwmac-socfpga.c   |  2 +-
>  .../net/ethernet/stmicro/stmmac/dwmac-sunxi.c |  2 +-

For sunxi,

Acked-by: Chen-Yu Tsai <wens@kernel.org>

