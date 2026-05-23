Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EE3DCD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 12:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZctR30iAkvAMcIVBQcObBnywvkvNoGfhA6wr2BzNYfg=; b=3yrPBzbRVOVrG2GNSLi6NgSD1e
	RehKawFQCCGCGHWWIZz6OYfoMYHKthZK5y0KpT7FCZU5wXeNkiVJid69w2315L+nFSsaCPIZu7YKG
	qLSWVKApRrAN35GIrQg+1IyGjqP1uO1Ao9wrIlZ7uit6TmD8Ywu4Sz2cOGGJ7g1lpYQYaVFMxBd6E
	XF8w4zUE/iTBuWELSSVfe+S6xwHOXjO5oWSQdF9l/0rriG+bRgI71q+E33adbuWbbwpG17W8k5vZo
	qSX14HWVtLC1+TYXDBUOlj0c1m4lIzwR00RbVj+lPr0YaCXdc2AHUa7dpt8p9rAv0mWWK+uSEnhkb
	ycf4diyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQlIM-0000000DDWX-29Cb;
	Sat, 23 May 2026 12:17:34 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQlIJ-0000000DDVq-1371
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 12:17:32 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-45ebafde87cso550788f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 05:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779538649; x=1780143449; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZctR30iAkvAMcIVBQcObBnywvkvNoGfhA6wr2BzNYfg=;
        b=CWKHy+1yiO2oZgBxwILedisI/idXYdCm8VZyrRpA1NUklo1+X1HBfkHZ/4gRmahrLR
         zu3BTkgelgMA2PfeJUurDzjugjlnOu+111swVbxgcKXMGNlD5Lw4qwfWpL8c1y9bUy3F
         Vbc649YGaGm6CUHuNo/ipehiOwHnXS6PKHP75410D9ZGYGgTiLip8vgzn4r1estr8/MG
         EBll2Dv6JEmCF948SHOoUtwDWYTokiloilgKtZK+7FMHUnr/TZc8yj9ZZHXtXMCqv66S
         davumz95YATgL/84+wZicrq/Uk09glzCfgF9zgcgPTxl6bwSk/UUoIAWGUR1Nt9QVIUx
         HhSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779538649; x=1780143449;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZctR30iAkvAMcIVBQcObBnywvkvNoGfhA6wr2BzNYfg=;
        b=sVDAFnUrMxEeur0nK2g8/hHo2fcGAGipkmmieQct1pv1lTBL6FNO6nGJ5uYp2EDeWH
         HzWOFwB7jnWlW09lcSOm5sqamCU3AqCEoRj5VfYh9qThrsqoLFeZ6latMXhtGRF2jukd
         t9QPhOw51H8l8xFkNJv1sp1Gje3PqKEc0PmMUnnLpDNxOaCg28FNH1cgL6BoKt35wA1K
         0eEwTYdRxlJoYavcMDECgUY/t/LlY2maYOPg1kIns0Uby6AGv2vaWoD/Nznv7kxCbJAy
         /PDsUjKNOQafav18x1DX+/d+4elt0Xj8w5ocywkdGJBN5R2HaBNb4wgnr5iALWU3N0Uy
         Ru/w==
X-Forwarded-Encrypted: i=1; AFNElJ/MfIaxmNi4AbT+DGEMD0Oz+NrcYJK4zKbZ8jjZod5bFJipUD2jeLtWTVzg7YLfgm7N/aq2PRcJFBBP79qxPrmI@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8IsT6JpKP3SQcQhCFf+4FbMZhkoNSB+DP0LT/thewsabeEwoE
	GIrmQTzwgEnuDgbJ23dfFOaYIaRzNB52Mp0XemGh0BQNcWR9soCd5NoU
X-Gm-Gg: Acq92OFpMpRPmJC2W7ZNoIGIovDv1GLw4HlxpWlbgEr87od+RXucja9axuUqUWNlOSa
	cPOcWEuYkHR2r3JmsHHnc5WELTRCKfoVEaVrr2BqHrsYChJCUWJotZ/gz0xBwphfdnL1MgClCxb
	d6GvsAymFVrz5FUOKoyK8Z0c4ApDl5rpUF3xNoiVGlO9eYsXAqYbVO1pOJ3z0/zEgxDuVA6zLJK
	yQY70LIjmYSZIB+G441UD6zF3Nodcso/5+Z9gwItkuKRM8TZiPAgBQiX8HIjnYe4UUgr8SMJmeD
	93qC8Pkkf4vpKmbVBK8efMhJOh6G8ilaZlgnOaf5XaKRCJ+J7qORj+5CU2J3V3L162SNhXctvaZ
	HjjwDN087PCPZbAwJ6EwDo9iMCIGCHTsYruGu/Z3B3yqK3ceDY6yX/5Vnf926xN2tP75eZE3ulN
	wkCxpkHi9nwjTDoKZEExJ15w+86xBC/+zchKw03DEfk9dFO80buBiQWZNSyA==
X-Received: by 2002:a05:6000:401e:b0:44a:247e:67b1 with SMTP id ffacd0b85a97d-45eb36920e5mr12402024f8f.5.1779538648925;
        Sat, 23 May 2026 05:17:28 -0700 (PDT)
Received: from INBSWN167928.ad.harman.com ([31.215.251.63])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d5c32esm11326497f8f.26.2026.05.23.05.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 05:17:28 -0700 (PDT)
From: Abid Ali <dev.taqnialabs@gmail.com>
To: devnull+dev.taqnialabs.gmail.com@kernel.org
Cc: alexandre.torgue@foss.st.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	dev.taqnialabs@gmail.com,
	edumazet@google.com,
	kuba@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	mcoquelin.stm32@gmail.com,
	netdev@vger.kernel.org,
	pabeni@redhat.com
Subject: Re: [PATCH v2] net: stmmac: fix RX DMA leak on TX alloc failure
Date: Sat, 23 May 2026 12:17:08 +0000
Message-ID: <20260523121708.564-1-dev.taqnialabs@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522-stmmac-rx-desc-cleanup-v2-1-76e78eb471e1@gmail.com>
References: <20260522-stmmac-rx-desc-cleanup-v2-1-76e78eb471e1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_051731_305165_44C8B160 
X-CRM114-Status: GOOD (  10.18  )
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

> 	ret = alloc_dma_tx_desc_resources(priv, dma_conf);
>+	if (ret)
>+		free_dma_rx_desc_resources(priv, dma_conf);
>
> 	return ret;
> }

The sashiko-gemini analysis [1] flagged two issues.

1) Double-free via XDP path:

stmmac_xdp_set_prog() ignores the return of stmmac_xdp_open(), so
if alloc_dma_tx_desc_resources() fails inside that path,
rx_q->buf_pool and rx_q->dma_rx are freed for Rx queues.

The interface stays UP, so a later stmmac_release() calls
free_dma_desc_resources() on the same freed pointers.

Without this patch, the same failure path leaks RX resources
instead. Either way the root cause seems to be stmmac_xdp_set_prog() not
handling errors from stmmac_xdp_open().

The reported issue seems to be valid, but I'm not sure why XDP doesn't handle
a possible error in reinit in the first place.

2) NULL deref on partial queue alloc:

If alloc_dma_rx_desc_resources() fails for queue N,
e.g. rx_q->page_pool = page_pool_create() fails, buf_pool is NULL.
The cleanup free_dma_rx_desc_resources() iterates through all
queues and will hit a NULL pointer deref in:

static void stmmac_free_rx_buffer(struct stmmac_priv *priv,
				  struct stmmac_rx_queue *rx_q,
				  int i)
{
	struct stmmac_rx_buffer *buf = &rx_q->buf_pool[i];

The same could happen without the patch, and similar risk exists for
rx_q->buf_pool, rx_q->dma_rx, and rx_q->dma_erx which are all freed
without guards in __free_dma_rx_desc_resources().

I can add the necessary NULL guards in __free_dma_rx_desc_resources()
for V3 if necessary.

[1] https://sashiko.dev/#/patchset/20260522-stmmac-rx-desc-cleanup-v2-1-76e78eb471e1@gmail.com

- Abid

