Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FEDC02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 17:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=drwGg6Ggv7y2iA4MXzxrkwRrSRb14xgzjKtqkAwh0hM=; b=k1o5IB1U9vJNksimeiLnML6Zpm
	iZAUHc1lTvzZZoR6aM89DD/BYV2FF50zfYzsPy5ebQtfWdATCFATe40tYxUb0rgKC/0c53fBbo3SC
	RJI970hDL/d17Hm7WjJmoYCLkaSzsSCayJeRKnc845CDHwK0I3WVRxoeKcVmCj8szvTjtd6fgdj/T
	pntlx4PZz6S+qN5iURC/KHj4SN2qLJfegpqDhf4lmouRl+iNHDuTfvg6KEVOiyK9gPFtpgNngTPJR
	e3lX52aFa7RijBCLjnjv9gjf18hcQ6Qs1YOH+3QENWRCfd4awbuTeJ6FLhKewiVGgMIAee01MNeuM
	UXcpAhXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7N3-0000000CdO9-09y4;
	Wed, 15 Jan 2025 17:40:01 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tY7Ih-0000000CcUa-1IoY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 17:35:32 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2166651f752so159693985ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 15 Jan 2025 09:35:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1736962530; x=1737567330; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=drwGg6Ggv7y2iA4MXzxrkwRrSRb14xgzjKtqkAwh0hM=;
        b=gYoPcHN66Kh+nQZD/jgPIzs4YI+db+klAp/qZG2FUsdy2rNDiuI/TWIRrBRXs3D2Xw
         6qP7Rv/07lwl+AFgPCCN7+jriNl3KaHly1ZaLXtTvJORf5v9l0r81etXuTKgCF64+hVP
         /5+iWZebefIhDPfzc0akZQ3gPjAya+wbG4Slw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736962530; x=1737567330;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=drwGg6Ggv7y2iA4MXzxrkwRrSRb14xgzjKtqkAwh0hM=;
        b=XzI4hPOFRyJ/bWHS4VNypCAi1AknAVlrDIG/zdTSIiWe+zRxxarqMFH7tbYBEiRZWl
         0Z+ZtchIbTD9PCaSLhbhBuCEuG+gaGNWGIMV034i6gbLnupuEOeQSgE//0GwKo2qi9f/
         NJq17qV1RCpr+tyP61ZEGGxAD1hRAHd/OLKvPJ0/aS1HXRwnxxByr+E2F2dGl5G9Fgi/
         0BbJMEPcK8r81o+vUoTil/uIK55pn8j3IZABihiCn9yjXoHF8jLApP9Gudy8iE/yie3C
         bS7O0V3yEYePQYQpeBC4arREaz7++/ELr8odBGHW6/k1RQDDWGVp1nIesvuXGylcPx92
         v82Q==
X-Forwarded-Encrypted: i=1; AJvYcCXgC0o29sTGTfXkmMTX3vBG/edcaxBvvXk0u+6tWniZfmw1JGk+4T6ofShe+nOaYdXvSh69kz8PmSGNEI6BZKnX@lists.infradead.org
X-Gm-Message-State: AOJu0YxyKD2LvnkjRmG2U/tAZZTMTxW5qPigo5PH0SkgpAcUBYsRCMzX
	7iduuKYEcEhDJCg/GMbnv7QWIdULn1WvoG/m7nWRCwm9131jQ8eDv3s/kyaXwN4=
X-Gm-Gg: ASbGncuh6hSU6BdsDc0RQNUVQ/i60anZ6N9QhgYoBWFOT1wIQjVfIaxkwsbuh8HmZDP
	03aNLiA7T+S9rA+p6L7WGzuQ3ageUiht2Nn3uoRjCiitRfgyqMl+FivLbgWdJINevtM7igqUCZ3
	bJ55RuoyFf6Yre18H3y6EpnIIQV/wgim1uscEyAZI8B92SPjjZuaVOYkRuk0LhitE4gNjqzK+BF
	N969LI3s0ZPSpkz722R2FAN2fSASAdrYMcI5hgiY/FS4yw9/TheOhAgqE+YuvAPHyXPApta3m+R
	AmvceyA7wXZayRcI1hfgDMI=
X-Google-Smtp-Source: AGHT+IHh9H8PaJ6cgjJiGUCjtnIBHOrMsIR66gZMMMrlpxbHphZLN5joIg1CaCDzyN8qA1Kz6Fewvg==
X-Received: by 2002:a05:6a00:2406:b0:72d:8fa2:9999 with SMTP id d2e1a72fcca58-72d8fa29fbdmr3989071b3a.11.1736962530490;
        Wed, 15 Jan 2025 09:35:30 -0800 (PST)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4067ede1sm9361054b3a.124.2025.01.15.09.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 09:35:30 -0800 (PST)
Date: Wed, 15 Jan 2025 09:35:27 -0800
From: Joe Damato <jdamato@fastly.com>
To: Furong Xu <0x1207@gmail.com>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com
Subject: Re: [PATCH net-next v3 4/4] net: stmmac: Convert prefetch() to
 net_prefetch() for received frames
Message-ID: <Z4fx32HuqJk-0cQS@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Furong Xu <0x1207@gmail.com>, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com
References: <cover.1736910454.git.0x1207@gmail.com>
 <909631f38edfac07244ea62d94dc76953d52035e.1736910454.git.0x1207@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <909631f38edfac07244ea62d94dc76953d52035e.1736910454.git.0x1207@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_093531_367415_614A92CC 
X-CRM114-Status: GOOD (  12.48  )
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

On Wed, Jan 15, 2025 at 11:27:05AM +0800, Furong Xu wrote:
> The size of DMA descriptors is 32 bytes at most.
> net_prefetch() for received frames, and keep prefetch() for descriptors.
> 
> This patch brings ~4.8% driver performance improvement in a TCP RX
> throughput test with iPerf tool on a single isolated Cortex-A65 CPU
> core, 2.92 Gbits/sec increased to 3.06 Gbits/sec.
> 
> Suggested-by: Joe Damato <jdamato@fastly.com>
> Signed-off-by: Furong Xu <0x1207@gmail.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Joe Damato <jdamato@fastly.com>

