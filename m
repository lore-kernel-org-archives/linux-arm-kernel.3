Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B24ECA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 00:07:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MUvDYNeKYtEGt6nLpxNjasM9TEF3xIAo9jyaMtWUr+o=; b=gXgwesADD0UEXK7uvJANNp6yTF
	w0Qrp2Ms0Ub8XPrDZcNZa3rquu8zII+Z0FBu4jFHouWCyKwieKjafAQRiE2Ps0kpU/jy9q2XBdUsU
	7pEZMUcAkOsi7oGgZOS2tnYfziH8Gnj8tqOPPggKUYzLbfKzqKiZwVtvPlgCR7nnxD06ZeQMiEkHq
	kyc+likEGMAjZJkvVqRfnV4V2C9S+6ho5acLBYFUxugONvHaqwGPMCgY6emFOoMzyMURG8ggD5jWk
	TmMGbekP1eoiJGJu6UaxWfO9bSuNkty9FuKlHeldxN7Sfz3Fn2VgFQ2zefbb03mpAYzMUWzZw3rsh
	wirQn4Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBLNO-00000001wX4-2ks5;
	Tue, 29 Sep 2026 00:07:18 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBLNL-00000001wWZ-0p0m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 00:07:16 +0000
Received: by mail-pj2-x11.google.com with SMTP id d9443c01a7336-2db18fe433fso15797735ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 17:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1790640433; x=1791245233; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MUvDYNeKYtEGt6nLpxNjasM9TEF3xIAo9jyaMtWUr+o=;
        b=u29NOUPewWm6W3fQrfGneCk6NnAVeqeaPj/qBcELpECjDyFnTGC47BMISbWoJpsHrp
         6hedJjeu63o2aiPAAAjADh8fkaiWjjl0dhQu4fhfk6d5XvTB5PGCiHRDL5Gjhu22x6ai
         6MbYIloBanH3ELlElAtamzrHj+I2fZWwsmj5UANDl7E/LznnzBz8V4EeZh4EF9WqbD+K
         hDpyeuP6DBnivj8/RtBK/thNTriWQzcXQTYaiiwBJZqZ+y+lDgfINrtWjUc2x1Shqmu5
         b4kmtRIu/6mt6M4kIcc1ck06zbRCGSWAY9JU42Fqc2wHJX1vBAuMFH+PIbhKqkDweJ7L
         wfUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790640433; x=1791245233;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MUvDYNeKYtEGt6nLpxNjasM9TEF3xIAo9jyaMtWUr+o=;
        b=fV2e200jNZL5CCAWBRUkaZlBgXU1ilLaVYoLe/lUrnPoIuyVKFiGxFNOzM0KLfP1fU
         TdwOZqYZ4XK3/3kqymvlWRCUpTCxCyy/n21pvJph+rPuMQsvw5KTPdJGfnZ/hOyPT3iZ
         s5k9+6vRvwQZiIDhNZfefQwCD+FxVyuLqpYb1wgSTeWQAQuUktuJJ/4bkg/iN7zOiQKQ
         4nIjlzVmhoMVmMsDbPsfThVqINEvPrYYRfuw0vnzD1r+Kf1V0jSR8wcCfj2ivCBYthvA
         GiTpb0ui1nW0Hx3AswS7elZoiuz8SlxqLfg2e2o40HZPD8gLebpIwEgTyCvtYy0qsPCw
         RZcw==
X-Forwarded-Encrypted: i=1; AKwUvBwVEb+In8VCFHm8MFeWzP+dpLkhhAXhyLll2BefUB4D0NtaG9pactDAjM6Fpdk3q8JQVXLlzscPjADejmCyTmJB@lists.infradead.org
X-Gm-Message-State: AFq9FYKpFEpyzYOsUWOCpvlyA4Gzbhsg1rMLmCNgSZ1gdJyNpRUhQO9F
	T53HfEcAOjNVBeos69mOnjeYGf2fmzj1ePSwblhn8qwopi73h5O2fISjJdo+FwLmROw=
X-Gm-Gg: AYBFou0f+92cUlSosDBFSiChmbcmwXC5pVY4yenqtvsDaiSJX5ZGkk67tXK+Hl2KUIk
	lRXUfQt8r0D0AYQKMUjJvHoMwWq3ti7KNXGeFv97m3W0YWIqTfxytmtyaNUuTFV9A2/4FpItMeS
	Zl7xow6AEKrrAEbU8GyKzRzOJYOaGzf7dIUS37lg9mPfKic8t3DdeAIImNAWe8E7BXOiZTxe8on
	0NSRQ8nv16tki8peeGgAmLdEV6pAcz/NVUadK80KFHtL0Jr9JQMutgeW+kCBF2CeaBBUWbYT5zH
	8eoQl2iTU/M/So4N2d0E/Z7mtIutlcs91s84wtVdjZ9NSf4YYgfN+Q00N9YXOQwsHttQlYpVWvH
	Ill5qIyz0t47Dd/PCPRJ1eV62q18Fu9qrgrXrn8xmgLNbzjOUIkDf1g8jpxSCpU4I6Vqbh67d2J
	lAc9FVBQvhxe/sHzfm+wDivIyYgCGSJX5w9seq17CwD0p0YuuV4oVKK/3ZQ+lWRWdb5NPXphRsz
	ZlQuYSRetw=
X-Received: by 2002:a17:903:17c5:b0:2d8:d4d0:792c with SMTP id d9443c01a7336-2df7da6ccefmr117603485ad.16.1790640433612;
        Mon, 28 Sep 2026 17:07:13 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:8::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913e23ecsm48165595ad.18.2026.09.28.17.07.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 17:07:13 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:07:12 -0700
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
Subject: Re: [PATCH net-next v2 1/2] net: stmmac: Introduce a helper to check
 RSS support
Message-ID: <arsBMHaLVLylD4zV@devvm20253.cco0.facebook.com>
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
 <20260928145043.1228968-2-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260928145043.1228968-2-maxime.chevallier@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_170715_346435_786232F5 
X-CRM114-Status: GOOD (  15.78  )
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

On Mon, Sep 28, 2026 at 04:50:41PM +0200, Maxime Chevallier wrote:
> The RSS feature is only available in stmmac if the hardware reports it
> through the DMA caps and if the platform glue sets rss_en.
> 
> Introduce a helper that checks both.
> 
> For now, no platform sets rss_en, but there's interest in the topic so
> leave the door open instead of dropping the feature altogether.
> 
> No functional changes intended.
> 
> Suggested-by: Nicolai Buchwitz <nb@tipi-net.de>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 5 +++++
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 4 ++--
>  2 files changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Joe Damato <joe@dama.to>

