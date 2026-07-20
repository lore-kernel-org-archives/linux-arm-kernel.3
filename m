Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 328F1C4452A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 14:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jjgcDbEk+UwGPrm8p3ddZGJiNEptTi23fs+y3mGJy60=; b=A9LU79ObDj68idGW3bt+SbXyEC
	zKr3L37ffcNmzHo0dwKPN8OIyNEbs9L+vhxbS/wUTBlloqInQTP1TVLhRHaeuY+p5WScjVnDA9dvZ
	Ri9yT9ft+5zMa3vsrttDMpS65i/82mgJgrmsOpDeD3Lisn932Ul3uLq2d0lKUZxyZsaZAilBLRNo8
	b2y+R1f9XxukNiCgtGt7bM1ZPIDJrSvpQjhuEBtV5Law7Ed7Kn7Pf5DQM4tuIy20+I8/AHWo35Jzx
	mJnXEKN2v3FTrRIyU5fAxIUkSTITnMnG/ElgI8aoEyongchwiZ1sYObmPeLX9oyOBj7WgfK3/Giwe
	Ll6fX4wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wloZg-00000006tjg-48eZ;
	Mon, 20 Jul 2026 14:02:28 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wloZe-00000006tiU-2W5a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 14:02:27 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2ca64c3ce5fso115097885ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 07:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1784556146; x=1785160946; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jjgcDbEk+UwGPrm8p3ddZGJiNEptTi23fs+y3mGJy60=;
        b=AURU+OagZ0HqwfEwmjXKbnPnG4IlbogWP9TGYXTmUU1aaqcSXRLBr1yc9ThS6dntDq
         NDxM9M0RFkUNjG2Gqmh3XOa+nOBa2yOEzeJc0ycu+fDGDf7rbZOKPDSdHDRnKs+iUOxc
         m6ZBfKXWk1Ay0DXGxP+I+/n7Q+aB9HOOI5Uc5gFFAiOTlF1GPHAoikAynS36iwZEj9im
         u5xYbCzLuchAaR0kr8cQ9NrDaFO7/0XWCx3KubgyuxEE62Mt3G/I2esc+IHg1K+SEhSC
         cDAQMrwMRtgvgpRg6ASnZ4kPhLkVlALJtHPu08tpSRvh6BzhMWA22k84mr6apm4Xgq1r
         cUUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784556146; x=1785160946;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jjgcDbEk+UwGPrm8p3ddZGJiNEptTi23fs+y3mGJy60=;
        b=mwKLOJYCXNd43r4OsZbFRQ7c33RyQw4Yzryi8k6kJRRLHDdXaksXQ3mDYmtfi6h8kh
         kFCUtFY7VALHsoeQuMYvXjd+FLUYkMh+i/RshE1OM31uj0spNXfMnjGCAU0qTrlMyw4D
         7n0xYrBL9w5jEO4udCPWqRuWw2qynPimSpEvkFqr2JlkSftHtBTGonlxT+qMghRMJE40
         u98pcjEMh3SbMaBGyfgVpNsrFWd8tberjn8BgoQ7C1dlqs3P/TcvcZIaiJwsWcQq4yCX
         ZtXAMqZVXoVl1eLEWvony+BXG99BDV9/xZjI66+iRRzreHhcDqLdcUxodG6n+O11yjBs
         uBQA==
X-Forwarded-Encrypted: i=1; AHgh+Rqj+BNax140tgUqg6/Vp2iAt1PsowMpIpLi8Iss4XlEYOZjZKbRBjQ2eUT/yXlA/sw+f7vW1UA6uT2I4wzPXBmy@lists.infradead.org
X-Gm-Message-State: AOJu0YzL3kV5xh+88fFRHnFxNlDgiWTPHqgELlOhRd/BojcpKkIDVxPE
	ZAiCQjm2KkCeU6yuDv+qwAu1LIE/5poI+KyKLAqYi0kA0G4qYDujeJD7MyXju7b3wUk=
X-Gm-Gg: AR+sD11kTmSttXGEB41509UlvJvTgFLu8fr7DwAu26YI16eAo06tpIEwZEjOnelLs2v
	tCOoc4f7d0Xs2KTxbZghL3L73bjdfA3vME3hBG1OYMvZZUVq8eGWyksw4Dp0L2uhPAAW3i9p1XD
	U9hHIPIrikOZ3zyUVL11mKZ0EQnZZvek1CTxrOud1dxWK00930NQC75AU4xuLpdTDW4tBtMInx3
	7xq1e1kk8PimP62Al/SO4fpZwEv/Ti4NnNODM5RDxTPu0UuAPAdF5IWbwXv6w9cw7mkMSCC/8gm
	eyICBc9jOxfg97OIoJma+Q6WAzs5ofNzJZfML+5JCZllf58KyP0AIsdzVFqqnyB7e6Sl+nNNK0G
	zMg9EBmSxpecxUqnaR3ooPVx61pcxCFbmusb5wxKFjTHI+ESIxCX378qM0/r6/2czQ6xQgg==
X-Received: by 2002:a17:902:f78c:b0:2cb:3f5b:6663 with SMTP id d9443c01a7336-2cf348bee75mr154491725ad.11.1784556145405;
        Mon, 20 Jul 2026 07:02:25 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:43::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346db113sm56870065ad.39.2026.07.20.07.02.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 07:02:22 -0700 (PDT)
Date: Mon, 20 Jul 2026 07:02:21 -0700
From: Joe Damato <joe@dama.to>
To: wei.fang@oss.nxp.com
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, linux@armlinux.org.uk,
	wei.fang@nxp.com, chleroy@kernel.org, maxime.chevallier@bootlin.com,
	imx@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RESEND v4 net-next 01/14] net: enetc: extract common
 helpers for MAC promiscuous mode setting
Message-ID: <al4qbRV8h1a5nZCd@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, wei.fang@oss.nxp.com,
	claudiu.manoil@nxp.com, vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	linux@armlinux.org.uk, wei.fang@nxp.com, chleroy@kernel.org,
	maxime.chevallier@bootlin.com, imx@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20260720014317.1059359-1-wei.fang@oss.nxp.com>
 <20260720014317.1059359-2-wei.fang@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720014317.1059359-2-wei.fang@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_070226_681114_A183CCE7 
X-CRM114-Status: GOOD (  23.64  )
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

On Mon, Jul 20, 2026 at 09:43:03AM +0800, wei.fang@oss.nxp.com wrote:
> From: Wei Fang <wei.fang@nxp.com>
> 
> The PSIPMMR (Port Station Interface Promiscuous MAC Mode Register) in
> ENETC v4 has the same bit layout as the PSIPMR register in ENETC v1: bit
> n controls unicast promiscuous mode for SI n, and bit (n + 16) controls
> multicast promiscuous mode for SI n. The only difference between the two
> hardware generations is the register address offset.
> 
> Since the register functionality is identical, the MAC promiscuous mode
> setting code can be shared between ENETC v1 and v4 drivers.
> 
> Rename ENETC_PSIPMR to ENETC_PSIPMMR in enetc_hw.h to match the actual
> register name used in the reference manual, and extract two new common
> helper functions, enetc_set_si_uc_promisc() and
> enetc_set_si_mc_promisc(), into enetc_pf_common.c. These helpers select
> the correct register offset based on the hardware revision via
> is_enetc_rev1().
> 
> Remove the v4-specific enetc4_pf_set_si_mac_promisc() function from
> enetc4_pf.c and the duplicate PSIPMMR_SI_MAC_UP/MP macro definitions
> from enetc4_hw.h, as they are now superseded by the shared code.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  .../net/ethernet/freescale/enetc/enetc4_hw.h  |  2 -
>  .../net/ethernet/freescale/enetc/enetc4_pf.c  | 21 +--------
>  .../ethernet/freescale/enetc/enetc_ethtool.c  |  2 +-
>  .../net/ethernet/freescale/enetc/enetc_hw.h   |  7 +--
>  .../net/ethernet/freescale/enetc/enetc_pf.c   | 11 ++---
>  .../freescale/enetc/enetc_pf_common.c         | 44 +++++++++++++++++++
>  .../freescale/enetc/enetc_pf_common.h         |  2 +
>  7 files changed, 56 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc4_hw.h b/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
> index f18437556a0e..6a8f2ed56017 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
> +++ b/drivers/net/ethernet/freescale/enetc/enetc4_hw.h
> @@ -69,8 +69,6 @@
>  
>  /* Port Station interface promiscuous MAC mode register */
>  #define ENETC4_PSIPMMR			0x200
> -#define  PSIPMMR_SI_MAC_UP(a)		BIT(a) /* a = SI index */
> -#define  PSIPMMR_SI_MAC_MP(a)		BIT((a) + 16)

[...]
  
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_hw.h b/drivers/net/ethernet/freescale/enetc/enetc_hw.h
> index bf99b65d7598..66bfda60da9c 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_hw.h
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_hw.h
> @@ -180,9 +180,10 @@ enum enetc_bdr_type {TX, RX};
>  #define ENETC_PMR_PSPEED_1000M	BIT(9)
>  #define ENETC_PMR_PSPEED_2500M	BIT(10)
>  #define ENETC_PSR		0x0004 /* RO */
> -#define ENETC_PSIPMR		0x0018
> -#define ENETC_PSIPMR_SET_UP(n)	BIT(n) /* n = SI index */
> -#define ENETC_PSIPMR_SET_MP(n)	BIT((n) + 16)
> +#define ENETC_PSIPMMR		0x0018
> +#define  PSIPMMR_SI_MAC_UP(n)	BIT(n) /* n = SI index */
> +#define  PSIPMMR_SI_MAC_MP(n)	BIT((n) + 16)

I probably would have fixed the leading spaces when copying/pasting the macro,
but that seems like a nit.

I read the rest of the code a few times and it looks right to me.

Reviewed-by: Joe Damato <joe@dama.to>

