Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981E0CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 00:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hm0RErT6dOlbpaDX7ox14DSX4hQbirleVL8DwhzSyVg=; b=v0yWLorZDwlClHV5nc4AqEONwz
	wz7FfVafXKFkA/AaP99f30pEv7xE2RrSRcSgPljEJJ1BuQ3TQe1lTXxMb2jmSECqoIp0izvBh+tIj
	fO8fmdvk/VtilYpje6+k2lElEzBPrNeQ5Efml6kcRe5s/cFIjqZV0DEgl9KxNP2Os+I/IoeC/OnY4
	qNFiG3/JaLioouheHZqMCvY+qmhXHZVsBVqSCPULEpAasNBBb+OS8ubspz7UbP9TfKFuH/r/Oxbtk
	fYn432NgsTRl9RNakGwAAJ74UwRa04pq01VDSkF8kOOt6prfdhAjUmfaMjJodTtXLXpwDH4hLihaE
	rcjcEzzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBLNi-00000001wbk-3U7N;
	Tue, 29 Sep 2026 00:07:38 +0000
Received: from mail-pz2-x0c.google.com ([2607:f8b0:4864:3b::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBLNf-00000001was-2gnf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 00:07:36 +0000
Received: by mail-pz2-x0c.google.com with SMTP id 41be03b00d2f7-cc78d45f78fso2122204a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 17:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790640455; x=1791245255; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Hm0RErT6dOlbpaDX7ox14DSX4hQbirleVL8DwhzSyVg=;
        b=nwYGa7jHzJ0vEJFHDFG03wR9fxeoHz3Wx1zDUyUZv6tew/XXUId8k8mcwxW6DmfWQ1
         2ccdDmR/G7/DArgyM5oup8YzII2uh+dr8SQMMAjUP3mP9VFMB8a2rrfVlRgE7qVhp0d0
         /ROnE4GiZvZHQ+XMvDQZSv9aeOi5GQ2zq28ikuAOsWd8pbT8J9A/dsKA0MbgnQKofOe3
         OZ3ZWZV8u3N0Qa4+tAnfTf8NSiIFcYjIVxztaVK3leWxAQBgSjLZ4NsmxQy+IG0wAqwj
         MpnZyDQS2tQVgOvkZmauxGDBw6Hx7H5beVjVtGACnjzGpLnkO49RITQO+Zh4gDcl07Eb
         1bPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790640455; x=1791245255;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Hm0RErT6dOlbpaDX7ox14DSX4hQbirleVL8DwhzSyVg=;
        b=HEZL8hkj23zaEBkR4eyBh7a8FR9DsSojmTU8+u890jxNH/8w7T5s41QakDUpcwufHo
         WuNwoPIUqKILJWMjsBqitHVbnJcmDd/TR+NL9lA8bvPSftUhc0jfXV5aUbs+4hTptRLl
         m0GcSAUYGgz1dszJ5A8mSvS7kalsdU2cta6OU/uFqrqxfQ+vtvzFvElxIUyXYRiaPwKL
         LbNaXXkHOOvfLsGVf96BCNHOEuqLmwet1v76CGfWxTYq4ScgeEd5x1cJYFualZQNEh4q
         Q1qxF85A0Cqh5sbKZT3ExnLmjVWiA3CmpI02q8wqMIBHWGdbFfxxGlZa/gnOu2MU5nIU
         tucw==
X-Forwarded-Encrypted: i=1; AKwUvBytFPEjCGbgiGpasyI6NNX7r1PnZ4jRiBHlBRjAdbNEFYB4J0Z9KVyVFXVLeOhdKYSw8eat50tDnKPbh2Y+MIKy@lists.infradead.org
X-Gm-Message-State: AFq9FYJrhGSdAlXyO89MK8KY29seWN/xD2RzgYE6Oip7h5X2iBj9P1xt
	eYvxE3cn0m330mL0r6cvV2bIJqVOeNg16uL+7RZrOpTNYdKs9cnOxI/U/a4ZRwest/I=
X-Gm-Gg: AYBFou26VeJGik6lFjWT30TldoPQpqBtRyNFOncuw+4t79FK0x1tqO/wm/7veA96agh
	+xtb1rdq7yQH/PzPhuOup43YfMbCrzHeulA2TmHzU8YMnWY24+xGLzeBqPu11NsDmp1FLJWAPhr
	r7z47WfwpdEnrvQprOxNTn2i2UvbDiqPIGuXOTdtuzrydTkwEeMTwPRlHDuPbC6LAJO/V2uQprk
	aIZ/LKBj2qhP6q8bRNu2rISBeJ52yurFYJUibapvLF5+Gr6Rb13vTGuM5B6745AyqSZXmac/Qam
	vmgaieOaJEHYJjP0cmGujlIxZYZZRmC6IRHBWp3+CVxerccVjdby1rWODEnDdVu6Ke4MRhuNbbq
	x//aAAaoHQ7VDgmQDRCGdWaqfNkNHtr49vybtMeCCVytSLeARljrVMuXNNEP2fpVmN7d2m7T3Ho
	M5Urb8xBq5a8g2aATkdjgU/ClS1mITyHcv2MTgrMI2mgwjKbvY8Np/faziCpdyjXhqf7UQhYPmK
	VoZVDnrrYa+
X-Received: by 2002:a17:90b:3b49:b0:3a4:8d74:2ebe with SMTP id 98e67ed59e1d1-3a48d74451emr1727662a91.32.1790640454667;
        Mon, 28 Sep 2026 17:07:34 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4c::])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a497e942eesm2356131a91.4.2026.09.28.17.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 17:07:34 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:07:33 -0700
From: Joe Damato <joe@dama.to>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
	davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
	thomas.petazzoni@bootlin.com,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Peter Robinson <pbrobinson@gmail.com>
Subject: Re: [PATCH net-next v2 2/2] net: stmmac: Don't set or get RSS
 parameters when not supported
Message-ID: <arsBRcXKMFfNrIKK@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Nicolai Buchwitz <nb@tipi-net.de>,
	Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>,
	thomas.petazzoni@bootlin.com,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Peter Robinson <pbrobinson@gmail.com>
References: <20260928145043.1228968-1-maxime.chevallier@bootlin.com>
 <20260928145043.1228968-3-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928145043.1228968-3-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_170735_685604_3B31645D 
X-CRM114-Status: GOOD (  16.50  )
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

On Mon, Sep 28, 2026 at 04:50:42PM +0200, Maxime Chevallier wrote:
> The RSS kselftests fail on stmmac, and this is partly due to the driver
> reporting bogus data for the RSS ops :
> 
>  - ethtool -x reports an indirection table and a key while the hardware
>    doesn't have any of that
>  - ethtool -X fails with -EINVAL.
> 
> Let's return early in the rss ops if we know the hardware and platform
> don't support RSS.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_ethtool.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>

Reviewed-by: Joe Damato <joe@dama.to>

