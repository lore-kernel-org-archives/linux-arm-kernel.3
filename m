Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57501C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 03:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EY43HLtzrUzkXYHTHJfVcm+528T6DiMSEe7dNOvpyIw=; b=1jS0oR1PU7pO/lSGackX7IMG20
	0wrJ6nq4Ii1Nidn874aFnuiAYdNdR2hyfpGeuXuWnx/QE98os3ej+DBjZYioyCqOMsLrbf1dsds/j
	kPzMzKh/TgVgmWqc4F0cEo7oV+2l6Ocpn0KCGuLQyUqoNfczSmiZokNdfox4l0QI24dmOdlw/DrVv
	YFfDeNB24VvvlOsBdLkNJTYNkY39uv8fnL90EWTEBzCFltZqsPm+fc7PVrm5Cm4bcqabo0CEIOAHy
	ygdmQBy0ALGDUqmXfeToS3y5w3OBXbMXAUm/Rh+WEtwjRxQwQ5nzskXaqxAA8HWYDVATcnjvc0iyI
	9h0SlufA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnr53-00000009aGO-02MV;
	Fri, 28 Feb 2025 03:30:29 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnr3T-00000009aBL-3Sg6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 03:28:53 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-22128b7d587so32670335ad.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 19:28:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740713331; x=1741318131; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EY43HLtzrUzkXYHTHJfVcm+528T6DiMSEe7dNOvpyIw=;
        b=BNuHL/KYNNbjwa4atYpFOJ+3snwzA98/UMrW2KSZgmwIqVZx+O0hk3JZVFiyAkkm9n
         ObOx7yXMOEP+f8uCTeKmaiKrWxi9cb9zVsv0XxBckyKDhLEiPTZmio3ZggujVPJhc63n
         YSYtVwq4rywdqGnFS304GQRVvqfxNeecXf/q+K3reWQhpRI8zXyAIlcbfTNzN5JVsCrQ
         MgQjxR57yfhXyOYfDmYTnpzqbxoiwfxMoU6D0BcV6QlH9l02hbbnlIP2HZB59BeXEFlz
         Jy1hMGchAcOI38zzhG5QQWidBhhxKfQBZ8UmaE5wlgqM/poi9JBkYyeYH5N/rhhrwRT8
         +kxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740713331; x=1741318131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EY43HLtzrUzkXYHTHJfVcm+528T6DiMSEe7dNOvpyIw=;
        b=Om+vqdQbwZh+4k2fTrixey/BCC2PHxqG4Uv10fUmcDjUJEUBCEaSZPd4EX4lvuKL4w
         9gKis1tokW/k7Wy3OnOQ272vAo7mDbflA1QHmpZxyGHWNphqZ6LynlzRM3Q/aYWyddNk
         28h5m+01Zs6JD+Qno9hnMU3LH3dqtx/6ysPIclXtNbQ+ZtPuzyNyYY6YZ9ZZDzA9HjZ3
         FQcufDBy8xPFvAemr/5u2T8p56DT3t9cXFVtYhMHMOYezSf3JoL8A2Nnn/OFezmQ1cbG
         HGB3za7nvUzDJchM5abuPGwytELU3Nqq9U9xYPFiVhGxJ5UQguz79/RGq1wftjRPqMMJ
         J00w==
X-Forwarded-Encrypted: i=1; AJvYcCUECJHBUDi3+1/0ew8Wo3HKytVpTgSdCtEywNHpepOBFJMbZQO+PMBkl7S5UsPtae/ZIN2l0108nHkA8d1kFlCF@lists.infradead.org
X-Gm-Message-State: AOJu0YzCJLubbVl3ljsu/vYVz3nnTcTP2+se6HwgyzGnXjou5VS+I5DW
	PPjBwnB4+6kOv5Qs/pa7ugstC/m7uvh56HrhdC/eEnwoGTzkX6/rEYvQ6g==
X-Gm-Gg: ASbGncsqNAKPEQ7GuWDl+hqLgZCT+0ZkbaHxS5Vjt2bUwBmal/XXqhi1SuAtoAXUXMB
	V4dt3mot1MuYwF5zvfQsrUateqJiahhSAkpFZc6mbC5AJZsPY3d5jMHLvQnsMsDFKyE0GtpOc+G
	NdxscvXoMi+dGyP/tAq/0npkpszkrQenx3Fu2I4BEsgkP9Ar3NC2OqfH6TlEBTOGSQSQlR2tLSZ
	Q1nHb5y3xqnaOkOwaX7hZpcdtJDWI0qP+hsW2hzfHrrDJXXKqjS1Wm4c56MHiZQJH6RBXB4iZMu
	TnaIF3LyrbTxvjOfacn51hk=
X-Google-Smtp-Source: AGHT+IFhTzQtlbRb4GUfkQUHLHJc2YBAelAdku34kRQilo8jgysSfJHVUW03LTM8vyRl+NUxhY5UeQ==
X-Received: by 2002:a17:902:d48f:b0:211:e812:3948 with SMTP id d9443c01a7336-22368bc365fmr29598825ad.0.1740713330830;
        Thu, 27 Feb 2025 19:28:50 -0800 (PST)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504c5bf3sm23485515ad.110.2025.02.27.19.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Feb 2025 19:28:50 -0800 (PST)
Date: Fri, 28 Feb 2025 11:28:40 +0800
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
Subject: Re: [PATCH RFC net-next 2/5] net: stmmac: remove redundant racy
 tear-down in stmmac_dvr_remove()
Message-ID: <20250228112840.00003e24@gmail.com>
In-Reply-To: <E1tnfRj-0057SF-9t@rmk-PC.armlinux.org.uk>
References: <Z8B-DPGhuibIjiA7@shell.armlinux.org.uk>
	<E1tnfRj-0057SF-9t@rmk-PC.armlinux.org.uk>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_192851_868567_B1BC2633 
X-CRM114-Status: GOOD (  20.42  )
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

On Thu, 27 Feb 2025 15:05:07 +0000
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> While the network device is registered, it is published to userspace,
> and thus userspace can change its state. This means calling
> functions such as stmmac_stop_all_dma() and stmmac_mac_set() are
> racy.
> 
> Moreover, unregister_netdev() will unpublish the network device, and
> then if appropriate call the .ndo_stop() method, which is
> stmmac_release(). This will first call phylink_stop() which will
> synchronously take the link down, resulting in stmmac_mac_link_down()
> and stmmac_mac_set(, false) being called.
> 
> stmmac_release() will also call stmmac_stop_all_dma().
> 
> Consequently, neither of these two functions need to called prior
> to unregister_netdev() as that will safely call paths that will
> result in this work being done if necessary.
> 
> Remove these redundant racy calls.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 84d8b1c9f6d4..9462d05c40c8 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -7757,8 +7757,6 @@ void stmmac_dvr_remove(struct device *dev)
>  
>  	pm_runtime_get_sync(dev);
>  
> -	stmmac_stop_all_dma(priv);
> -	stmmac_mac_set(priv, priv->ioaddr, false);
>  	unregister_netdev(ndev);
>  
>  #ifdef CONFIG_DEBUG_FS

We always build stmmac driver as built-in.
Tried to build stmmac driver as a module, but some complicated dependencies were
reported in our down-stream kernel :(
I can not test this patch, so:

Reviewed-by: Furong Xu <0x1207@gmail.com>

