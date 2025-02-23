Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC233C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 05:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BfvuWvSB4FrYuL3Q9W8pUmNF8XrVHM6syd74IbIbqmI=; b=OQsEgnqVzCt5pKqpK6YfhfvQ8e
	hJOMxN1cHt0GcmcGMge4NbxmKG3GiWa+s8FnXn6YviE2vgWgNkv9m8m/amIzBKBGZEF4FZcWlTM2l
	s9pPC/FVIvlSPM+wOOaG3zDL1OU6r0Nc4tYvXaedk8UN77RtxcFinDugTAU4foOTzXTAoZCni69na
	9ZhTfdHURePmnUrEW4Oe8ThKZ1yhEUaW+M96lhZdShxlHDj76PIJS+ihKo9mgTVEgfnhtydjBnzZJ
	7cJ/u/waxcbbx7oYVKE8abX0FlY32GZzW2ix9L9HTbMsOK0y/p1GK6caw/yZoojC/MwqrkiEZsBST
	tCQkq0zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm4kC-0000000ARzJ-41RZ;
	Sun, 23 Feb 2025 05:41:36 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tm4ij-0000000ARrw-0KJL
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 05:40:06 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2fbfe16cc39so6908277a91.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 22 Feb 2025 21:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740289204; x=1740894004; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BfvuWvSB4FrYuL3Q9W8pUmNF8XrVHM6syd74IbIbqmI=;
        b=m/fzYhEvqMlQkpn4ypYQw8qQGYRWpTkY3Zs6DpRZkpyMd9GliurbFvKq8CuFLfVyCg
         mcNzQj3gTlAoo21TIcnFgDq83LjxRapifFsGL/g+/urdXCfo9CZ6b/GFtCp/+s0qu0aP
         CuS3Ul/bTKTLks8cOXpdG5U8kGxgtE92tx+4jr5NNPZrqDWy5Pdx29dH2OFthLSAqtQE
         EpNX8XyOIgp6fknBwER4MxxJRtArAgdbwiuBiJ57jrkW5tmRVGZien8OJRdrA63d1EjS
         ltUpNx6RkE6KLE6cxMdlIJlkCG82chYPI49LUgFWcH3UMuNh0f3QHOrCDn02RWbM3PjM
         4+nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740289204; x=1740894004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BfvuWvSB4FrYuL3Q9W8pUmNF8XrVHM6syd74IbIbqmI=;
        b=cdKoqW8GHlI8EXQBDM7KUlETVHamb029SjtBl/wxc7YX3c1K6MG4WmhXOfsIfOmIg+
         sA6yv0MaRxEdKPPIsENTsM7D7F8gwd10LVU12uiBYPeyUJXqIUduHriH0ZR2fQbCk8es
         jy2lIxeyUiRZbUjNulAknNFyq0Yo+9S1W78780Zx006LRn03x0ndbQ3Nv7KsLw5Sbcy0
         6+y768y7GDTF6haaRUdFIioogyqizrxrC4ZYeQbaAHnLWgplkFuegtsVuict/Rd6AH0S
         k0C6qHLbV4OgfaLhxsOlQasfyGL/H3J4eiGXTXl2WQdKKZbFyulsfUEd6O1UmkXeUDkN
         ssdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgE2SnM68+boB+G8v8RGCAuyXykq5AmAD6gJDfnqv01Z8aG39ZUvXySWk2pc39xMdF5gOxyRsbqZyRgI/XS1xA@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6spUCs79no5CF5EMf3d+t240mOSeFU68taWJWKy5yNobfH8HZ
	2Hk6OfCwsX/rnKttrKtckugP38O7XwQNkv0qPQwQI+lfY3pSYTpe
X-Gm-Gg: ASbGncs41RGiuu/vKRlYvu0s56+etrRt/3tIrGIoxae3DzWk7cREf3feSnTOYGFvvtx
	1bp79tISr1D9MaZfhnTgB3USaVGFkhZvo6JXzb0udWsyPLRGKFl1D2DGl3mNBj1SVMcvA7+V7kk
	DUtpT+BWMuTGQjKdxt/z+QselniTprh9gDm4SYsIWTIqe5V9uBrEW+CrHmX7c36hlPCO8qvHAS8
	GSMDJyo3NpR1bImjUnBTqyQaP+JDA2tsAl76YgCtSyom0Xd+ROMwvgAyyVAcgM3dzdXxdMixwF2
	uaayKucJE0RR/iQ1i9Pkqy8=
X-Google-Smtp-Source: AGHT+IEsyitKBEB+TjtOIJ7j0ghQQ1PUySgYsjd6ENH+ooYHWDcum4IoJa9MuHEv9g0sOVIJCIQYCA==
X-Received: by 2002:a05:6a20:8403:b0:1ee:efa5:6573 with SMTP id adf61e73a8af0-1eef52c9981mr17773167637.8.1740289203622;
        Sat, 22 Feb 2025 21:40:03 -0800 (PST)
Received: from localhost ([129.146.253.192])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73261ca7831sm15022814b3a.104.2025.02.22.21.39.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Feb 2025 21:40:03 -0800 (PST)
Date: Sun, 23 Feb 2025 13:39:47 +0800
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
 Nilsson <jesper.nilsson@axis.com>, Andrew Halaney <ahalaney@redhat.com>,
 Choong Yong Liang <yong.liang.choong@linux.intel.com>, Kunihiko Hayashi
 <hayashi.kunihiko@socionext.com>, Vinicius Costa Gomes
 <vinicius.gomes@intel.com>, intel-wired-lan@lists.osuosl.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH iwl-next v5 1/9] net: ethtool: mm: extract stmmac
 verification logic into common library
Message-ID: <20250223133947.00002f06@gmail.com>
In-Reply-To: <20250220025349.3007793-2-faizal.abdul.rahim@linux.intel.com>
References: <20250220025349.3007793-1-faizal.abdul.rahim@linux.intel.com>
	<20250220025349.3007793-2-faizal.abdul.rahim@linux.intel.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_214005_151991_01F8DB7E 
X-CRM114-Status: GOOD (  12.18  )
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

On Wed, 19 Feb 2025 21:53:41 -0500, Faizal Rahim <faizal.abdul.rahim@linux.intel.com> wrote:

> @@ -1258,23 +1236,8 @@ static int stmmac_set_mm(struct net_device *ndev, struct ethtool_mm_cfg *cfg,
>  	if (err)
>  		return err;
>  
> -	/* Wait for the verification that's currently in progress to finish */
> -	timer_shutdown_sync(&fpe_cfg->verify_timer);
> -
> -	spin_lock_irqsave(&fpe_cfg->lock, flags);
> -
> -	fpe_cfg->verify_enabled = cfg->verify_enabled;
> -	fpe_cfg->pmac_enabled = cfg->pmac_enabled;
> -	fpe_cfg->verify_time = cfg->verify_time;
> -	fpe_cfg->tx_enabled = cfg->tx_enabled;
> -
> -	if (!cfg->verify_enabled)
> -		fpe_cfg->status = ETHTOOL_MM_VERIFY_STATUS_DISABLED;
> -
> +	ethtool_mmsv_set_mm(&priv->fpe_cfg.mmsv, cfg);
>  	stmmac_fpe_set_add_frag_size(priv, frag_size);
> -	stmmac_fpe_apply(priv);

Well, I would prefer keeping stmmac_fpe_set_add_frag_size() before
ethtool_mmsv_set_mm(), but not after, the VERIFY process should be
triggered after all the parameters are set.

> -
> -	spin_unlock_irqrestore(&fpe_cfg->lock, flags);
>  
>  	return 0;
>  }


