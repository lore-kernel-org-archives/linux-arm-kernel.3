Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B38E0C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 02:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z1rT13AxT6i7F5Ycxl5JT25b4uDj1fZ8K6rhKfIa2rM=; b=11mGByqqFGBwAq0EPKXu72xBrv
	XTwtKT7WxjD7MJ/7TqS+AAPGHEk6ZLeNA0+B3YzU+ZjjJzjMazt7McwyHO2OET34UO3EklbnH8xCT
	x+fw9NA1cBCcUNU63kXJ/9UJ9lI7LXMCvVjRHIr9WhuYIPB9AJQNnW04HQpDO5wo2/3phP61fjWEq
	DH8vMJNtfBbEJO/k5K45CwK58dvowx0MyK91N4L+j606jGUpa5zXIxDySbxEtHLUcO02SC7eV6m4h
	6J8xSYXcHYQSlceIJ6+6lbEmU6iooQv0EnLy07pomcQGTRMD03dKjHagA80dbza9VUWdY4AtYkoeY
	WzGe1X0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq0hZ-00000009pxd-1Bbe;
	Thu, 06 Mar 2025 02:11:09 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq0fx-00000009pfD-11LN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 02:09:30 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-223785beedfso1598685ad.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 18:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741226968; x=1741831768; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z1rT13AxT6i7F5Ycxl5JT25b4uDj1fZ8K6rhKfIa2rM=;
        b=l+yJKsqIYBaKZ3mM+3uXsH30/7AYTiXFYjOx7tqMExMDx/aRaFFrIWkJ6VdmQ0QcCl
         64F4E1vvJB5a++rZCI58OD2pkLIggFLI4aTn23mCUgkRoVTIcInU3Ma7lXFE5N0x8zOi
         a0PFqW3eGizavR+T2CXz2GPzBXfJXfHpUKomOerpCL0YtNAXxleeiJv5SfEYoerJTOes
         SygCQhAvFETJHwXgQ6tXtjM+9ZJdx7zrNlVEp0Id1QIZtrEQZUP8Ya0LZ4+lf5V5CO/s
         YvpmQEsdzop62/qTBC54ouBR0cMPYRuvd2iQtTZ88DNiWOCwgJSpDW9BxVcySFrxDAET
         YaJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741226968; x=1741831768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z1rT13AxT6i7F5Ycxl5JT25b4uDj1fZ8K6rhKfIa2rM=;
        b=mpXPwEs/MJQ5pkGKf9yAhd0+AH+xzHJXz+bYSwrC793ZNyZbkHVTUXg4fYbZzAfI5d
         1ppq4mKUPKqdt5d59tVo3qNzOjKhQuvwuh/Y/Tpvdxh6B00x1D6+mWGRf5NcolR/JOGr
         LNIRHXvvMmcw7XkMRJg8qTaDED3NH4isz6idFGYmNssEjYfBpDhRPfVLFrNZUF8HrD8N
         140Dc8ulm/3YB9oR+cGtTxaz1Rdm7eBzzC8+kYNPBDFKmiiLVmCnAR8bU04PnMBaxhPx
         lTmI0Rr+/00q+zLjYTIP9xGpkrlxCXO8pbZo+x6M1VLSa4XaakGHeWaesWq43oePND24
         pi8g==
X-Forwarded-Encrypted: i=1; AJvYcCWL5/RGjWTItqDS286JZFvfGSsdfv/iI65lHey/3k7LaZ+JOpcyv6I4NqLGPS819zrc90E4hMzDKm4I80Tjhkzx@lists.infradead.org
X-Gm-Message-State: AOJu0YwKaNIu7erl9zVnAy1BCRA8mB7pRcttGiljlFrKnJydi1lLvsqh
	2y/osscqRX8+eBW9kVK0kAYMC9YfccCcM1hUJB1a8x4TcxJ7chKM
X-Gm-Gg: ASbGnctmNDVAQ52SJQsKRXp8Qj5ghq0p6lysWKcoRwDKbUVEW4jOLiNl2YF78y5wBck
	8USRMjBEUVR7ThMQ+rtl5MskflhKs2OeKRPr6/7EdVhmoWM+SgSa4NNiiNFWDlE0acLo/n3drq3
	YlRE+iidjLRCGHa17ZWsVyK78+DyIK1bscSJOcovrbbKzQYpUaEy4K4mBx9JA16fjkT99BGYho8
	eJuPbUdlDKfHKVi9FUICgnbeDqzVv4eVUNrdrweX+EIOuWYwQ3sWHq1e3E0K7nQ5AG2B5osJbFo
	vkVDWuz06RtEq5JBfE2dgg6i9zIe+8LdCWXPEA==
X-Google-Smtp-Source: AGHT+IF9QeRgv+6Z/cPJtnzTG5KuBBCd8Qdr6JTrB73F+Bp0n4Wqinq/xvlObO2mPBHhOim0ujthOA==
X-Received: by 2002:a05:6a00:889:b0:736:55ec:ea8b with SMTP id d2e1a72fcca58-73682d00a42mr7712708b3a.24.1741226967842;
        Wed, 05 Mar 2025 18:09:27 -0800 (PST)
Received: from localhost ([144.24.43.60])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73698519026sm139246b3a.144.2025.03.05.18.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 18:09:27 -0800 (PST)
Date: Thu, 6 Mar 2025 10:09:13 +0800
From: Furong Xu <0x1207@gmail.com>
To: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
Cc: Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel
 <przemyslaw.kitszel@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Simon Horman <horms@kernel.org>, Russell
 King <linux@armlinux.org.uk>, Alexei Starovoitov <ast@kernel.org>, Daniel
 Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Russell King
 <rmk+kernel@armlinux.org.uk>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 Serge Semin <fancer.lancer@gmail.com>, Xiaolei Wang
 <xiaolei.wang@windriver.com>, Suraj Jaiswal <quic_jsuraj@quicinc.com>, Kory
 Maincent <kory.maincent@bootlin.com>, Gal Pressman <gal@nvidia.com>, Jesper
 Nilsson <jesper.nilsson@axis.com>, Choong Yong Liang
 <yong.liang.choong@linux.intel.com>, Chwee-Lin Choong
 <chwee.lin.choong@intel.com>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Vinicius Costa Gomes
 <vinicius.gomes@intel.com>, intel-wired-lan@lists.osuosl.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH iwl-next v8 01/11] net: stmmac: move frag_size handling
 out of spin_lock
Message-ID: <20250306100913.00005bb8@gmail.com>
In-Reply-To: <20250305130026.642219-2-faizal.abdul.rahim@linux.intel.com>
References: <20250305130026.642219-1-faizal.abdul.rahim@linux.intel.com>
	<20250305130026.642219-2-faizal.abdul.rahim@linux.intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_180929_367228_268550A4 
X-CRM114-Status: GOOD (  18.63  )
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

On Wed,  5 Mar 2025 08:00:16 -0500
Faizal Rahim <faizal.abdul.rahim@linux.intel.com> wrote:

> The upcoming patch will extract verification logic into a new module,
> MMSV (MAC Merge Software Verification). MMSV will handle most FPE fields,
> except frag_size. It introduces its own lock (mmsv->lock), replacing
> fpe_cfg->lock.
> 
> Since frag_size handling remains in the driver, the existing rtnl_lock()
> is sufficient. Move frag_size handling out of spin_lock_irq_save() to keep
> the upcoming patch a pure refactoring without behavior changes.
> 
> Signed-off-by: Faizal Rahim <faizal.abdul.rahim@linux.intel.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> index 918a32f8fda8..cfe5aea24549 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c
> @@ -1216,6 +1216,10 @@ static int stmmac_get_mm(struct net_device *ndev,
>  	if (!stmmac_fpe_supported(priv))
>  		return -EOPNOTSUPP;
>  
> +	state->rx_min_frag_size = ETH_ZLEN;
> +	frag_size = stmmac_fpe_get_add_frag_size(priv);
> +	state->tx_min_frag_size = ethtool_mm_frag_size_add_to_min(frag_size);
> +
>  	spin_lock_irqsave(&priv->fpe_cfg.lock, flags);
>  
>  	state->max_verify_time = STMMAC_FPE_MM_MAX_VERIFY_TIME_MS;
> @@ -1224,7 +1228,6 @@ static int stmmac_get_mm(struct net_device *ndev,
>  	state->verify_time = priv->fpe_cfg.verify_time;
>  	state->tx_enabled = priv->fpe_cfg.tx_enabled;
>  	state->verify_status = priv->fpe_cfg.status;
> -	state->rx_min_frag_size = ETH_ZLEN;
>  
>  	/* FPE active if common tx_enabled and
>  	 * (verification success or disabled(forced))
> @@ -1236,9 +1239,6 @@ static int stmmac_get_mm(struct net_device *ndev,
>  	else
>  		state->tx_active = false;
>  
> -	frag_size = stmmac_fpe_get_add_frag_size(priv);
> -	state->tx_min_frag_size = ethtool_mm_frag_size_add_to_min(frag_size);
> -
>  	spin_unlock_irqrestore(&priv->fpe_cfg.lock, flags);
>  
>  	return 0;
> @@ -1258,6 +1258,8 @@ static int stmmac_set_mm(struct net_device *ndev, struct ethtool_mm_cfg *cfg,
>  	if (err)
>  		return err;
>  
> +	stmmac_fpe_set_add_frag_size(priv, frag_size);
> +
>  	/* Wait for the verification that's currently in progress to finish */
>  	timer_shutdown_sync(&fpe_cfg->verify_timer);
>  
> @@ -1271,7 +1273,6 @@ static int stmmac_set_mm(struct net_device *ndev, struct ethtool_mm_cfg *cfg,
>  	if (!cfg->verify_enabled)
>  		fpe_cfg->status = ETHTOOL_MM_VERIFY_STATUS_DISABLED;
>  
> -	stmmac_fpe_set_add_frag_size(priv, frag_size);
>  	stmmac_fpe_apply(priv);
>  
>  	spin_unlock_irqrestore(&fpe_cfg->lock, flags);

Reviewed-by: Furong Xu <0x1207@gmail.com>


