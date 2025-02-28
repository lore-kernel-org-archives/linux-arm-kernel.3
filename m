Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0358EC282C1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 02:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zYQdPVJK9ENC+FmWjq1SRLNqpphJKsZVKqKTbvYauzA=; b=QVB3lLzX+kWCKZwZfMB/NnNDV6
	kjF6Prw63ffcoQPHmHTUNJM3xDtv16skH9wjCbdUGfOCMSgSX/gXac5Lp85toABCT8ScLhP+UIWoQ
	ksZMCMEqiAKaKDvawyHe++NDDITjHXx0wgI62PcWlUkMCuRhrfsMXAECQS78GT6mP87sh7vRnLhFK
	5fvopFZvKatdstwKDnBEUPyoq3AJV9ASZ0htHDIe7KI+bTv+Ou+/k/YJcmffth+zjMmyhE98NhT4W
	wse+ZHbWm2hl89mqnV5dvRMzlteh6tQ3dDCDDuWBTPwJ+FWfoNO6dRsGuJhD6aqJB5JTQXvaTZpUX
	G6eegTeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnqXu-00000009XDz-1vJG;
	Fri, 28 Feb 2025 02:56:14 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnqUN-00000009Wv0-1H92
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 02:52:36 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2212a930001so41989605ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 18:52:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740711154; x=1741315954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zYQdPVJK9ENC+FmWjq1SRLNqpphJKsZVKqKTbvYauzA=;
        b=jcGntdgzdClGnpArGTImps/zNLUeStnawVFOUc6u1Gc2ysHHi47EL4Vmt5x3AvxAJ4
         Ep0y2fhtvPGxNDR2cMUBPFy8Zq1xbeLzTNf87xF8kPU+chNaNu3cRQmQ8IcEPy1rtVJM
         suAG3aGQq71+P7FyOEABaosV0DbQZ4pqwfl1ug7ROH2NWNp9ty6HbWN80DyxARXuIMMV
         Kt8Zag3AExt3JHxPNdtgSBj+U1AssKEF3u8ulDD3iEhnmhssSRAgMQiaou2qUi62Y+XV
         WK2gMJgO6Mwl011vlGRLl2ithNbiINKDLVc+82VwzQMiPQTJEJ0oC1oPl6Yiy8uCe9pF
         f6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740711154; x=1741315954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zYQdPVJK9ENC+FmWjq1SRLNqpphJKsZVKqKTbvYauzA=;
        b=uTlGkkeTJve7+G870R5n1NisGwJCDlef0ys2hp2yEYEfp/vEbZL3NJ+K1KWt7wYbU5
         qzknGAC4HomyA4fLY3Ws69tHLBZke62RzxxYPc2EQcnYOB8NMR7B+yMpBp6N6KLwvuls
         1xabznoSeWvdkOEY2IlelOh9wJiG24OI/Qwtg+LfVeJVRWEFURRp7o8TGmelN6tOe+iz
         YSHZyaDBqUO3whwBPRbI/GK9Hx2j3Eow9FHkgapT/x6GbO5CdwUf8IMheM71XQ6TGtrB
         lyY4eNq4k5UF/Qm5Cl4coLlt0S2gi8U0RNZagzX0UQjoNLQleYMkY+VihuJlXSZcdKH6
         VeKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsjcMfgqMW50dVFMmpolt5m3cZwwNKeyDCazAqg7DPhFg/dREiKtlZorvMvJqMRDkJgdTdNLi9+4jsDbAJvExh@lists.infradead.org
X-Gm-Message-State: AOJu0Yyp6lEPKnfRijLWyCkQ0Fn2dNwkbslYLpq0fYfTGs6L5e1hOYdg
	S+dQZ0Mgj1PI50CjmYASJX3LxoK1loIxGoAGttYf/jdGU5Y5vber
X-Gm-Gg: ASbGnctYR+87G8929lTM86r0IWiiVstBRyc1TO3qCa8mgY8oM1ykxf0ooBcFJPxB3yT
	7arxUIIyCXJQOZ3MMhs6+hsaO2L3HyY+Wg9bWKMPfDRQyl35AAMr/YL+8IRFoXLjNhGllCCmZn5
	27dgD6R9CL0bCqGLJidVzoSUtopn8sJfqACkGzm/tlCNOW16MG9ZWo7YZq1i4CIyp8U8Z9pnfvG
	I1MPA0woYEHilHvBQUG/mgQ+fpK40j20MVNO+qiRZiMzhKge+cJqANcmXqo2XQ1+zu/YaFCVDfq
	QotEW8IAp2ymbPXFemRLt4E=
X-Google-Smtp-Source: AGHT+IHaqgolZnBHpg/hTDrE86Pp13wwGc6p6xtFrspmuVKyv7VoeiQOT/3UPkYXRlSlielhuf1AKw==
X-Received: by 2002:a17:902:e54e:b0:215:9642:4d7a with SMTP id d9443c01a7336-22368bd1f52mr28089615ad.0.1740711154400;
        Thu, 27 Feb 2025 18:52:34 -0800 (PST)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501d279csm23221655ad.44.2025.02.27.18.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 18:52:34 -0800 (PST)
Date: Fri, 28 Feb 2025 10:52:25 +0800
From: Furong Xu <0x1207@gmail.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Jon Hunter
 <jonathanh@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org, Paolo Abeni
 <pabeni@redhat.com>, Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH RFC net-next 5/5] net: stmmac: leave enabling RE and TE
 to stmmac_mac_link_up()
Message-ID: <20250228105225.000015f5@gmail.com>
In-Reply-To: <E1tnfRy-0057SX-Lj@rmk-PC.armlinux.org.uk>
References: <Z8B-DPGhuibIjiA7@shell.armlinux.org.uk>
	<E1tnfRy-0057SX-Lj@rmk-PC.armlinux.org.uk>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_185235_347992_15156292 
X-CRM114-Status: GOOD (  20.11  )
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

On Thu, 27 Feb 2025 15:05:22 +0000
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> We only need to enable the MAC receiver and transmiter only when the
> link has come up.
> 
> With commit "net: stmmac: move phylink_resume() after resume setup
> is complete" we move the race between stmmac_mac_link_up() and
> stmmac_hw_setup(), ensuring that stmmac_mac_link_up() happens
> afterwards. This patch is a pre-requisit of this change.
> 
> Remove the unnecessary call to stmmac_mac_set(, true) in
> stmmac_hw_setup().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index e47b702fb9f9..c80952349eb7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -3506,9 +3506,6 @@ static int stmmac_hw_setup(struct net_device *dev, bool ptp_register)
>  		priv->hw->rx_csum = 0;
>  	}
>  
> -	/* Enable the MAC Rx/Tx */
> -	stmmac_mac_set(priv, priv->ioaddr, true);
> -
>  	/* Set the HW DMA mode and the COE */
>  	stmmac_dma_operation_mode(priv);
>  

Tested-by: Furong Xu <0x1207@gmail.com>

