Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1494AC83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 07:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tkQtnaRsJ20jyaFaiLhsOSC7W2gr3SevbNDp7oONAsM=; b=V2vvWsA6ak/IQlxJOGLZAIACOH
	jVkZSB2QUFAdYuOlt3dLwkQPQDqG+5947aJR21/J8ryaoUYHXsd8biS2CUUA56lSEXQZ/vIcBQZpD
	STYE/+7mJoPy2T0bF3y/7oqJrmKXQlvfdq9J6sOnp+9beHW39fcDC3jmvXnKQjSVyJKSKYhcSMH0Q
	waC/PAPuE0l7YXQ4rxgFrRBAVAixZzkFs20g6ZWVYHSqMBPdkFjKnHDCvXkTVmGZ1oE3djODFiPj0
	/qKUaxuo/742dAn2+MlU1C/Yo3l37Vm3Vq8+dkraKN285gjz2Yo2/jEAXaQ0V8xG013iZhnvv7NYm
	gy4BqKwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYg2r-00000001eR6-3RJV;
	Mon, 07 Jul 2025 07:13:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYfyU-00000001dZM-151h;
	Mon, 07 Jul 2025 07:09:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 7A6FEA5333E;
	Mon,  7 Jul 2025 07:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 960E2C4CEE3;
	Mon,  7 Jul 2025 07:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751872153;
	bh=S1UTgehB4MPmn84p3V9HOqZpYRl7v/ht9OhQV+Nr504=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qG5pfSUOmBaq8lNU2TWtv0QM43A9NYz9tVpSmKYXdASiAJ84lcEl9cgy7RKtWtO4W
	 h9SAmhlRpN4bD1ZtRL8TIppC5Q+obq5kRppsoZMBXRsGMFRqlaXMv0QX2vC/m536CV
	 6qwvKiHsPr0bC5UfkpdtSlYYjWyqdjvSz1vQz7MI2unOWoxcesknabRbv+j8mSzCyq
	 Jykj3Gxi5uPaTy2QtbaEum0nebTWNBUyOI0+9loMzIL9a44DunwjnwKgAT/i8XBd8r
	 daSW0YTwu30bakF91aoBCKtaFDOHB/b4NEqmG36ZvfDPBr7t3SMSrtXolkmKWSR+u0
	 ed+kOs13WejjA==
Date: Mon, 7 Jul 2025 09:09:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, Simon Horman <horms@kernel.org>
Subject: Re: [PATCH net-next v2 2/7] net: airoha: npu: Add NPU wlan memory
 initialization commands
Message-ID: <20250707-agile-aardwolf-of-politeness-29fead@krzk-bin>
References: <20250705-airoha-en7581-wlan-offlaod-v2-0-3cf32785e381@kernel.org>
 <20250705-airoha-en7581-wlan-offlaod-v2-2-3cf32785e381@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250705-airoha-en7581-wlan-offlaod-v2-2-3cf32785e381@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_000914_374630_22AF337E 
X-CRM114-Status: GOOD (  10.10  )
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

On Sat, Jul 05, 2025 at 11:09:46PM +0200, Lorenzo Bianconi wrote:
> +
>  struct airoha_npu *airoha_npu_get(struct device *dev, dma_addr_t *stats_addr)
>  {
>  	struct platform_device *pdev;
> @@ -493,6 +573,7 @@ static int airoha_npu_probe(struct platform_device *pdev)
>  	npu->ops.ppe_deinit = airoha_npu_ppe_deinit;
>  	npu->ops.ppe_flush_sram_entries = airoha_npu_ppe_flush_sram_entries;
>  	npu->ops.ppe_foe_commit_entry = airoha_npu_foe_commit_entry;
> +	npu->ops.wlan_init_reserved_memory = airoha_npu_wlan_init_memory;

I cannot find in your code single place calling this (later you add a
wrapper... which is not called either).

All this looks like dead code...

Best regards,
Krzysztof


