Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC611C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 00:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aQeVRouMwSpPPpF14+Y+OGMJ3UYJSb/gL8NvABqSv2U=; b=fQcdlGMqpnshxc72wGjqinFS7y
	UvxCITKEe/OU7e4TOQpqCZT+2oUaMI5MJQNuy7BYFaLqEDc+A61tJmjUPsgZ93haX3mFB5jL5l8YQ
	F+JIr+H5vB2FqmOvjHQfSP2RAInJORD+6GOqBhkKkCpxyRf+LD1k7RtMlTRlAXc/sci3EEvmYempg
	hG+++nU7W2/HX5zDLRIGu23DcFLiqp+MRhjP6zNEjZjnKOiUBI42bDclzdcyjTdBsRifWHfekDdrq
	E7O/FVS8r/1xf6mlc/jQeqzXWkK+L3fHXQJm6GLUFXFSjuxWwyiwaFyiChUbzSacIjtk+GKNikDmI
	MdJApI0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFjLv-00000002ADe-3wcw;
	Fri, 16 May 2025 00:55:07 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFjJn-00000002A2n-0DzS;
	Fri, 16 May 2025 00:52:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 13751A4E42E;
	Fri, 16 May 2025 00:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6926EC4CEE7;
	Fri, 16 May 2025 00:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747356773;
	bh=W4XvKUUpI1NuoyrHwx51qsaD68pHRMjadUnfOiZwxE8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=CpNCw2K54cXl1rkR48zAeUVMW7/fudU4soX9CFb4lUusKu2f9ZpdLF+ezxUlVUShR
	 kApJXAwkj5Ft9u+K6tv2d3huqCJp0gQ+9EGddd4/TAahTkl7P+RHznu0yaMzmT6/4Q
	 qJEsGB/IZg0SMUKdofMuVQNNOH1E6Pa4QxOm4p9UQq5+/kr6AF2uehMX5rcHQ3dwYn
	 Xkj8ub/YvVOJkippnp0cUQk2GUY+SJn0CXjUwZ06cdnJJQzw5kxUhjzLoz22MAKMvx
	 rNQecW8QT0sAWW7KseycQY22QXS8mRidLknoCjaaBsvY69hst3KbAFqF2iPvv4zo9g
	 GEBrSj9ketR7g==
Date: Thu, 15 May 2025 17:52:51 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Jinjian Song <jinjian.song@fibocom.com>
Cc: chandrashekar.devegowda@intel.com, chiranjeevi.rapolu@linux.intel.com,
 haijun.liu@mediatek.com, m.chetan.kumar@linux.intel.com,
 ricardo.martinez@linux.intel.com, loic.poulain@linaro.org,
 ryazanov.s.a@gmail.com, johannes@sipsolutions.net, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 corbet@lwn.net, linux-mediatek@lists.infradead.org, helgaas@kernel.org,
 danielwinkler@google.com, andrew+netdev@lunn.ch, horms@kernel.org
Subject: Re: [net v1] net: wwan: t7xx: Fix napi rx poll issue
Message-ID: <20250515175251.58b5123f@kernel.org>
In-Reply-To: <20250515031743.246178-1-jinjian.song@fibocom.com>
References: <20250515031743.246178-1-jinjian.song@fibocom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_175255_171440_E2C9ECA9 
X-CRM114-Status: GOOD (  10.03  )
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

On Thu, 15 May 2025 11:17:42 +0800 Jinjian Song wrote:
> diff --git a/drivers/net/wwan/t7xx/t7xx_netdev.c b/drivers/net/wwan/t7xx/t7xx_netdev.c
> index 91fa082e9cab..2116ff81728b 100644
> --- a/drivers/net/wwan/t7xx/t7xx_netdev.c
> +++ b/drivers/net/wwan/t7xx/t7xx_netdev.c
> @@ -324,6 +324,7 @@ static void t7xx_ccmni_wwan_dellink(void *ctxt, struct net_device *dev, struct l
>  	if (WARN_ON(ctlb->ccmni_inst[if_id] != ccmni))
>  		return;
>  
> +	ctlb->ccmni_inst[if_id] = NULL;
>  	unregister_netdevice(dev);

I don't see any synchronization between this write and NAPI processing.
Is this safe? NAPI can be at any point of processing as we set the ptr
to NULL
-- 
pw-bot: cr

