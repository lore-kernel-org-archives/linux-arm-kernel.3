Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B66D767F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 17:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y2c2+8hCBcHHsv3z7ugoMx+aG94aS+LJBUKz0Fv+Ygw=; b=fbg9QE4HBrlIqvdeM9jL92WcW7
	i/Wdu+WTR9npqIbtIabBSvxYdsW9yn53cMaAzJlIHxyQzkkNwPOBMAOF9Iq34gwWDD9PfsMdoXA/Q
	zx8dxSOyZVLqHAGKs14jayawIWmQUZFofWBsMm1/8kZMukkqho4+kZ9k0QNYK2jlONZypsP6TvyMk
	X0s20pO/PpR9gkvX05TyZgO5aUeWqvrw2X2F8QlQpR0bA5vRfMIlq/Uf1XnYCbeZNNjC1nWsFO21X
	r1FAOCAudngLZgrkpibEkwka5ruu7iOG2PGOn4Zz3K9WlNHNpIUyUbAMShDsp+z+iNCQnd7mf8tvb
	l7mnlGNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Z2U-00000004MKX-47jc;
	Thu, 31 Oct 2024 17:32:54 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6YzW-00000004Lar-1wjb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 17:29:51 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-43158124a54so1622895e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 10:29:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730395789; x=1731000589; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y2c2+8hCBcHHsv3z7ugoMx+aG94aS+LJBUKz0Fv+Ygw=;
        b=AarT2fkQyILtVYRQoCdQf9Jpf6EXzWdANctZQFZJsSiz//XE0NjxRNtDS/S/SELeRr
         59yy+fQv9D+hNXLZhXItD62OWRA5jGXJEUbJ8h0zWYB+lvrkSrHCkT2xQE4zdaKFHqf3
         g56t1ou3TtG8/NK969lOMo33jl5xRUdUeRB3dW+Df4/7D4q+/Ures+rlopOK9YxfaHZT
         4c8efxN0f1fwhSBfSWByWrFucZBiGiEhve0O2XTLK5b4xV87f/ykrXt6PtsJpvL4x1kq
         7X5P+QgC9TTKgB9umP0AhpEg/TgUbZc6zqraiLejD4B4MT/F22ASvK3nWHVJMbldLqqJ
         t1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730395789; x=1731000589;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y2c2+8hCBcHHsv3z7ugoMx+aG94aS+LJBUKz0Fv+Ygw=;
        b=roFkBmq/vJQBYTZvwv9UqqT5wnf//UGUO3vXkROEkcMms+i6acd59SDAmO1TOXVAbU
         NsVc5QWaZXxF8yR5PmALxeG9yuPWA8d9JTLVF7NMKiMHZCnfgvQIGrRb9HEyBj5u4xHw
         mmo0mp+0LFnbxX6eKth6jrs0LZTrTkGs/zBvtk4C6aw6UF/zJW97jOUje1Gsx1v8XXny
         XiGls9AHjyC7b7DI2NwJPud+RnmRYudzAW3uEoSyu2T61qQ4aav3Hj29GqQmRlknGx+H
         mIdUTeGaXD5DVQ7kSz0p+ZM9k7ExQi2ycn9j3q87FduC0KTa4VqKkxLwFzgFWJp4QuFk
         Fhfw==
X-Forwarded-Encrypted: i=1; AJvYcCVZcNtROV8eodVczZ3bKIUTLH5Fwvo7FKd9oY4QCzIHJxYIqRdEpgKCVE2nxr6gvoy5HVdd0O8XSTRDhxC5zZYO@lists.infradead.org
X-Gm-Message-State: AOJu0YwqwLmEx0KQRPeB/Ue2lAtv/xjZLpvzszYGwraQfMyNYng/hI5l
	yCdsGO9qKNgtk0DOwcJSfnOYuJexA/e87UEDPnIs2j4y8iEG30q7
X-Google-Smtp-Source: AGHT+IHakfGneSPWq42iuCut70oQ1E9rhNIoV1udWPYkJZcYcJIwtNnTlcAC2SE6lmct2XjYknh6Xg==
X-Received: by 2002:a05:600c:1c91:b0:42c:b9c8:2ba9 with SMTP id 5b1f17b1804b1-4319ad2b318mr76969105e9.6.1730395788864;
        Thu, 31 Oct 2024 10:29:48 -0700 (PDT)
Received: from skbuf ([188.25.134.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5ab305sm33621135e9.7.2024.10.31.10.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Oct 2024 10:29:47 -0700 (PDT)
Date: Thu, 31 Oct 2024 19:29:44 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andrew Lunn <andrew@lunn.ch>, Simon Horman <horms@kernel.org>,
	andrew+netdev@lunn.ch,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com
Subject: Re: [PATCH net-next v7 1/8] net: stmmac: Introduce separate files
 for FPE implementation
Message-ID: <20241031172944.ykgvlsysz5srxyr4@skbuf>
References: <cover.1730376866.git.0x1207@gmail.com>
 <9876134957283296792864da97eab60328f8d478.1730376866.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9876134957283296792864da97eab60328f8d478.1730376866.git.0x1207@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_102950_525544_59D8237E 
X-CRM114-Status: GOOD (  12.57  )
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

On Thu, Oct 31, 2024 at 08:37:55PM +0800, Furong Xu wrote:
> +void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
> +{
> +	struct stmmac_fpe_cfg *fpe_cfg = &priv->fpe_cfg;
> +	unsigned long flags;
> +
> +	timer_shutdown_sync(&fpe_cfg->verify_timer);
> +
> +	spin_lock_irqsave(&fpe_cfg->lock, flags);
> +
> +	if (is_up && fpe_cfg->pmac_enabled) {
> +		/* VERIFY process requires pmac enabled when NIC comes up */
> +		stmmac_fpe_configure(priv, priv->ioaddr, fpe_cfg,
> +				     priv->plat->tx_queues_to_use,
> +				     priv->plat->rx_queues_to_use,
> +				     false, true);
> +
> +		/* New link => maybe new partner => new verification process */
> +		stmmac_fpe_apply(priv);
> +	} else {
> +		/* No link => turn off EFPE */
> +		stmmac_fpe_configure(priv, priv->ioaddr, fpe_cfg,
> +				     priv->plat->tx_queues_to_use,
> +				     priv->plat->rx_queues_to_use,
> +				     false, false);
> +	}
> +
> +	spin_unlock_irqrestore(&fpe_cfg->lock, flags);
> +}
> +
> +void stmmac_fpe_apply(struct stmmac_priv *priv)

This is absolutely minor, but could you please sort the functions in
their natural calling order (callee first, caller second)? It's fine now
that stmmac_fpe_apply() has its function prototype exported, and that
works as a forward declaration because we also include stmmac_fpe.h.
But if somebody were to unexport stmmac_fpe_apply() in the future, they
would also have to move it too.

