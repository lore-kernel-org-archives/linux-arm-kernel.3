Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A55C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 16:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I+KM3XycZb1fB0feVpZefYDBavv/Sx/AWXWw4Fmm13Q=; b=yO3UJwsmHLyd+bwiOmwWkYsf83
	IEGFSpjgmaE7QwKLPgeo/6Zl/SV2pq4qA3W70kH1B8AwXEZsJFWa5skXRzSBCoVxJZa4AqDvq/8hb
	fYbiYybOZNcfve2Ph9FNCUB2o/7nf+hYdPp6N/whKEYlqIk4PIJLzuuTX7wd1vLdh7FIKapv1Jq4o
	lJn3mU0F600M0pPTJ0k+POIxZ7sGJEtVayFPNk+ZNMIWHbAiDe4DibWIH3LGYiNzZMbAmnVbztFGN
	DHRL5x5Ko9XiQ9hToQIeDZkNNnV6wpCqL+4Oo6LSZauI72JDM3nPSFQ6n2NIqsuSjf5thSE5E+IFW
	blvAcnMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mRn-0000000BcRd-2J1V;
	Thu, 24 Sep 2026 16:37:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9mRm-0000000BcRQ-1WsU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 16:37:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 74B34601DE;
	Thu, 24 Sep 2026 16:37:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6DFE1F000FF;
	Thu, 24 Sep 2026 16:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790267841;
	bh=I+KM3XycZb1fB0feVpZefYDBavv/Sx/AWXWw4Fmm13Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=V/Vfz+ZXD/r3+1W5cwPliw16S93R0IiT68GX2q1xLne1B68fHVD0Pcl2oTLxrZLR8
	 Bed4jmBw44Eegw5lQss+P9vm8JGA+eeApWkkV32ywNdYWYPsWkrkQ6n00Yn4mKjuoN
	 upQvcMdOg9gHZSEd89ReIPwjl42zOfb7sustzjhXyUvU6ykxeVLHkr4M1kMtVASwAk
	 vWIuwp7E1G1s0sBn7AtiQNDvC5amVtNM0GDO8piYoPf/mML4hJJDskTPkLnU34MlHv
	 9gNDR+x5dpv3ZC+yW2unz+IVb3dUbLPV8czA40R4S4/0ezmtQk6ndMGj1R6vrnZPWA
	 spTGA09k1+2gA==
Date: Thu, 24 Sep 2026 09:37:20 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Linkui Xiao <xiaolinkui@126.com>
Cc: maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 lorenzo.bianconi@oss.qualcomm.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Linkui
 Xiao <xiaolinkui@kylinos.cn>, stable@vger.kernel.org
Subject: Re: [PATCH net v3] net: stmmac: request the MDIO reset GPIO only
 once
Message-ID: <20260924093720.1aaa697e@kernel.org>
In-Reply-To: <20260921015727.2643540-1-xiaolinkui@126.com>
References: <20260921015727.2643540-1-xiaolinkui@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Mon, 21 Sep 2026 09:57:27 +0800 Linkui Xiao wrote:
> +struct gpio_desc;
>  struct stmmac_pcs;
>  
>  struct stmmac_resources {
> @@ -287,6 +288,8 @@ struct stmmac_priv {
>  
>  	unsigned int pause_time;
>  	struct mii_bus *mii;
> +	struct gpio_desc *mdio_reset_gpio;
> +	u32 mdio_reset_delays[3];

Someone already marked it as changes requested but also no need to
forward declare structs unless first use is as function arguemnt. 

