Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33D2C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Mar 2025 13:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glTaSdR3o4X9GAxmeU45K8T6CfAsdsfpsmdPJF5vMoA=; b=OqZjR1RJqmt2Og2hNt0m7a4fcj
	vrn0dQIY7d8G/etwA7j553fkmUZU5npGosVhJuMKZ/zcke8VQIFjjrFgA/yQS7/1poGKt4s5whEM6
	9+icse6Cbhzm7SX3BPoUNEKU6Y4iwhyGUK9O+XpoGW0LuvkV2L6GwIa28infTghBUcgZz5PgWipMq
	dKtd2Ei0xekiKt0Q3UCYU7N4TYjeS/ggNf5bv1nNtVwqXWj+leyRV90ilB+gAKVzEJcQ6RWUKahCR
	vBkFGkmLF/euds++kE5DKE9PVwResfAUoDQ3vCaVLTUozAKADaYsT9evOTFJpyaTAc4lJu5ffDSNM
	WqjLaJnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFWL-0000000CAUj-0NgS;
	Thu, 20 Mar 2025 13:01:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvFPs-0000000C9W3-2MG6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Mar 2025 12:54:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C6CF943BC0;
	Thu, 20 Mar 2025 12:54:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B40DC4CEDD;
	Thu, 20 Mar 2025 12:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742475272;
	bh=UUeHYaWcZVHy8DD0p9+ABrB/AFWTnKzv0JWjred+ovQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=beL7dyff5kYW6aDIOicQPhtdSJasmuSwJdRjUIlh8MSkfspCTwN8zNUDz9AXwgnun
	 uM5wDfa4HeC8Gwn7yc/7xMtG6aISfUtFeX5hRvyGd+dCuGP0arFvrNJkO3F2YT4z/N
	 tEQr/EuhRNbkluXRAsZJpME3up9CI9BD1CZRkb3gARoD4SAbzgOglnL7YpWg9gpjRS
	 UkFhxfi0FdjjJiX5lhBs1bSwwl2+tqvFAQXcnl9Fd+QsFguJRdRviV0VlSZTLyhjae
	 s+tBlQnQX8PxRyeLwdUo9bcBNxuGNzD3JxSaqW6kaRpY81OM5pXpAY3FVvqDOgcYna
	 ctIymZBUPqong==
Date: Thu, 20 Mar 2025 12:54:26 +0000
From: Simon Horman <horms@kernel.org>
To: Meghana Malladi <m-malladi@ti.com>
Cc: pabeni@redhat.com, kuba@kernel.org, edumazet@google.com,
	davem@davemloft.net, andrew+netdev@lunn.ch, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, kory.maincent@bootlin.com,
	javier.carrasco.cruz@gmail.com, diogo.ivo@siemens.com,
	jacob.e.keller@intel.com, john.fastabend@gmail.com, hawk@kernel.org,
	daniel@iogearbox.net, ast@kernel.org, srk@ti.com,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Roger Quadros <rogerq@kernel.org>, danishanwar@ti.com
Subject: Re: [PATCH net-next 3/3] net: ti: icss-iep: Fix possible NULL
 pointer dereference for perout request
Message-ID: <20250320125426.GP280585@kernel.org>
References: <20250317101551.1005706-1-m-malladi@ti.com>
 <20250317101551.1005706-4-m-malladi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250317101551.1005706-4-m-malladi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250320_055432_633619_76879A1C 
X-CRM114-Status: UNSURE (   8.43  )
X-CRM114-Notice: Please train this message.
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

On Mon, Mar 17, 2025 at 03:45:50PM +0530, Meghana Malladi wrote:
> Whenever there is a perout request from the user application,
> kernel receives req structure containing the configuration info
> for that req. Add NULL pointer handling for perout request if
> that req struct points to NULL.
> 
> Fixes: e5b456a14215 ("net: ti: icss-iep: Add pwidth configuration for perout signal")
> Signed-off-by: Meghana Malladi <m-malladi@ti.com>

Reviewed-by: Simon Horman <horms@kernel.org>


