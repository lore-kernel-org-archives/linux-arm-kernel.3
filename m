Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59BECC44515
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 17:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgJoRNuplp6eZlFzlFIl9nminZilm44pZn8iwP92+o4=; b=kbFsuYeouvjAL6t8m+Y/cM5rit
	kPkBAZvldye04Nn4oG3Qe4/NO+2IQxzL4yGeqf8X8qXxw45S0Jrj5DHtphh0hKcleU+UiBISHu26E
	ck2Z62VP3UGuGidw7MzIWZb5SGp6K1qhVHjthuwAO4BkkDgYzTPDxh6F9ll5jLttrC6T2iLVKBbxA
	Df75+ru+a3yf6v3ZKbqRYf0QMJhagHcUiVR87d1empbVGLNbCpNo0SJxqAr7SfOL9wSpSh+qi8+RJ
	nBE2X8i1No39EKJniBUrNqDbozVwSA0hQN6MB2MJ3zPx6t1b6j1dHwhz4n4pljcFNOMpcV8Irj1qm
	GAggDiXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlruT-00000007YXS-37v8;
	Mon, 20 Jul 2026 17:36:09 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlruP-00000007YVi-1kLw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 17:36:07 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2cea3004256so120123665ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 20 Jul 2026 10:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1784568964; x=1785173764; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bgJoRNuplp6eZlFzlFIl9nminZilm44pZn8iwP92+o4=;
        b=mL4GkwOWkPX+/AK3FeVptRS5MfaXL/qiOpplqh7HGWUXioGyzw4eiN5VHB7KJO9fHq
         6fd53gfJ/Ph/f/hWMBogsBicKPat9yq1OMR8FX15E4OaBddC47nxxrnMuL1fl1t5Uitd
         FrrES/MRQshH9GOBDwU6vhdvIFolbDD1a91FIqGn8DGo9MHXPykSaioSM2eNKFmj33cP
         mejvV9cHQ+WM/K+gLnoSu80efmJ2LBasaIAfFhVz6TKrmNxC/aJ5mGVJxn9pXxrRESgS
         JZUK63vZjz3Kna1kx4AXCGTXJFmv0R2QFeYgnRAYMe02MVQvb4e2ko7al7fgmO3t/bxo
         8+9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568964; x=1785173764;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bgJoRNuplp6eZlFzlFIl9nminZilm44pZn8iwP92+o4=;
        b=jZiN1Yfi6fgAbPBoACFV8ifT7udILXYgg/7kQbWzIpp1uHGPD/9TT2FfTBAUEGHnpa
         gS07sfesZ5OEJHGu7YySOhTygsz08CVquoNYDXG0lPmKYjsY2NgwAO3R/TNwItnAIl+e
         Iskj5Uk1tqRJMWGpfv9CoWQyXvKpWy8DJgpav8yzhYierzKx3heNfuk+YsbQHfUhnf67
         LwF7+3QCXbv6hQFOOOlgtwcQX5jiQBBh7pRlH+vX8eG3//P7sCDa7JmQQJy40EtDKE0X
         +v0ZByKSTfeBq4lSm/LaZ5lIMQPfYdgXxbWALShB26oT3JvHfz9Tj+MPInZSYppRaL+F
         +5xQ==
X-Forwarded-Encrypted: i=1; AHgh+RpNsMyoQqt1jCJzaBMe5zOVUoEVD7a+bIK6ml+MlqV2KiG8MWDQAVs0uFX0E8SQD/ZxIOqc59jiGt9l9WQEped4@lists.infradead.org
X-Gm-Message-State: AOJu0YygK9sPPyPLa/LrGDoPDLM8I+3oHg2yWsuX6R+bwRXL+XY3O+yr
	Xt+C+M3gKrwrdCyduzawQAlLYzCdUKpgPDPNG3JZsrU2n2A2RgJfc+ccCFmYIpObjC4=
X-Gm-Gg: AR+sD10Lqs0ypynzEjjOqBc99M5KH0SICBkQYNJIhv7UdfvSvG9kXRBYenR+/PvI3vh
	qwQ084wYYVBC/V9xjyvvX7jlxUHVpUcLbP9u8si+lS68etjKArlvnkH9Yc6oSjySoY7WZr5p0iL
	PaGCsAlSJ+HkcAaDb2mGyriTxjZHcWRaw0UKc+pHeefVXWlcUwAKWbYesgBHY1eY1syg7+baCBk
	SijxTo3Zx+Wokcc7wWFVYEb13mC+tNsEpweXo5oM3Y+1HKQHIn3h/svIywCAAWoJ+DD6BqdjHZu
	w5ehBBgawNM3P3O8g7pcKVU2YGX5y0LJqYRE2ZNsD7beBNVymqr6+lDtj1Heb3kKiYJh3vvu2xj
	MBrQhTPbQ/V0IX771hmr0qpHKXVkovsS9vxbOr9pYIQwkbqs+sq/xh644caY=
X-Received: by 2002:a17:903:986:b0:2ca:53e9:1277 with SMTP id d9443c01a7336-2cf348193e8mr159265115ad.1.1784568964287;
        Mon, 20 Jul 2026 10:36:04 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:53::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3476f70esm60110235ad.77.2026.07.20.10.36.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:36:03 -0700 (PDT)
Date: Mon, 20 Jul 2026 10:36:02 -0700
From: Joe Damato <joe@dama.to>
To: wei.fang@oss.nxp.com
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, linux@armlinux.org.uk,
	wei.fang@nxp.com, chleroy@kernel.org, maxime.chevallier@bootlin.com,
	imx@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RESEND v4 net-next 13/14] net: enetc: use
 alloc_etherdev_mqs() to create netdev for VF driver
Message-ID: <al5cgs6CqVKsy/gh@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>, wei.fang@oss.nxp.com,
	claudiu.manoil@nxp.com, vladimir.oltean@nxp.com,
	xiaoning.wang@nxp.com, andrew+netdev@lunn.ch, davem@davemloft.net,
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
	linux@armlinux.org.uk, wei.fang@nxp.com, chleroy@kernel.org,
	maxime.chevallier@bootlin.com, imx@lists.linux.dev,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
References: <20260720014317.1059359-1-wei.fang@oss.nxp.com>
 <20260720014317.1059359-14-wei.fang@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720014317.1059359-14-wei.fang@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_103605_591124_4E09E415 
X-CRM114-Status: GOOD (  25.34  )
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

On Mon, Jul 20, 2026 at 09:43:15AM +0800, wei.fang@oss.nxp.com wrote:
> From: Wei Fang <wei.fang@nxp.com>
> 
> The VF driver uses alloc_etherdev_mq() with ENETC_MAX_NUM_TXQS as the
> queue count, which forces the TX and RX queue counts to be equal and
> uses a compile-time constant rather than the actual hardware capability.
> 
> After enetc_get_si_caps() is called, si->num_tx_rings and
> si->num_rx_rings reflect the actual number of rings assigned to the VF
> by the PF. For the ENETC VF on LS1028A and the upcoming i.MX95/94, their
> SoCs have no more than 6 CPUs, and the number of TX/RX rings allocated
> to the VF is less than 8.
> 
> Therefore, switch to alloc_etherdev_mqs() so that the TX and RX queue
> counts are set independently, each capped at ENETC_MAX_NUM_TXQS, based
> on the actual number of rings assigned to the VF by the PF.
> 
> Note that if future SoCs have more than 6 CPUs and more than 6 RX rings
> allocated to VFs, the size of the int_vector array in struct
> enetc_ndev_priv will need to be modified. Similarly, if more than 8 TX
> rings are allocated to each int_vector, ENETC_MAX_NUM_TXQS will also
> need to be modified.
> 
> Signed-off-by: Wei Fang <wei.fang@nxp.com>
> ---
>  drivers/net/ethernet/freescale/enetc/enetc_vf.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/freescale/enetc/enetc_vf.c b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
> index 9cdb0a4d6baf..7dcb4a0246f5 100644
> --- a/drivers/net/ethernet/freescale/enetc/enetc_vf.c
> +++ b/drivers/net/ethernet/freescale/enetc/enetc_vf.c
> @@ -317,7 +317,14 @@ static int enetc_vf_probe(struct pci_dev *pdev,
>  
>  	enetc_get_si_caps(si);
>  
> -	ndev = alloc_etherdev_mq(sizeof(*priv), ENETC_MAX_NUM_TXQS);
> +	/* Currently, the supported SoCs have a max of 6 CPUs and the VFs
> +	 * have less than 6 RX/TX rings. So no issues for these supported
> +	 * SoCs, but for future SoCs which have more CPUs or more TX/RX
> +	 * rings, all the related logic needs to be improved.
> +	 */
> +	ndev = alloc_etherdev_mqs(sizeof(*priv),
> +				  min(si->num_tx_rings, ENETC_MAX_NUM_TXQS),
> +				  min(si->num_rx_rings, ENETC_MAX_NUM_TXQS));

Code looks right, but looks almost like a typo. I guess it would read nicer if
ENETC_MAX_NUM_RXQS existed?

That said:

Reviewed-by: Joe Damato <joe@dama.to>

