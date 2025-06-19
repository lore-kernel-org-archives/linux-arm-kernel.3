Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D74CCC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KJkap0N2OMLX4SZzoJrJa5HCSWmYHsAVwalxNjL+MLQ=; b=HTuuO8kLpTWlMWJE5lvyc2scMq
	SU2IFxqLAeqYdakCgLlTwSyWeaDA2WKhw9tw8vkoCBzkYY7fOaxOJyo1ymdBGi+az+uAjI73CdjuU
	mBq9nwVqvtpeWLZ/EAXrbxr8tp4fZYrwx5NfwH4tlypUfNOaFpoxIZDAlwvmYCu+40pNo4KzBSlZR
	AOfIH25qnf2xRl01VCbpisTCv8R3lqZLlF4ViF/BgfMKnMnIj2b8hsN+0KHa8E/RLBXJs2rRfevr4
	SSKLk/PoYZ/6vMtNMsQexNt02nN3yehw83Kp8uFsZlyJteoYe1SUq5ieTQpWaNF0JWqgLmRE/fOnb
	pkp3oBGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHUS-0000000DW7h-0X93;
	Thu, 19 Jun 2025 15:47:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSEVH-0000000D4cd-3TNI;
	Thu, 19 Jun 2025 12:36:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 41871629E3;
	Thu, 19 Jun 2025 12:36:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 345D0C4CEEE;
	Thu, 19 Jun 2025 12:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750336587;
	bh=0aZ6hvd/IjVOBqGmz7MszhMOejk6IpZuPtDdl9PW9vs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CI7fEyodMGaW5jyKK8UY6kiGubgfymOHPJnBbUgexQqVw6f1vhwj+IWYYJCLvi1Mr
	 Edsd3Ntro02FIelndIezoK8WBnFGAHgSiGmGtUUp7/xwv8EsRz9kI+hCic8n8tEclK
	 M40tzSqGmjaBEDQKiJRC+bVFQwFrOvwKDMpHDGBlpqv9O/JU/0Fri55OQptM5Pm24c
	 n2lC5jnDCRGON/s+HlPLM2X7ws9YYSjaut69jLh/emaeHrnFeN0EDxMtJRoriHcCVl
	 m5Qprn+xiHtHiRVOYHZT9cVUhu5kYE8xJw0G5Tb//D4ud1ap7V2LCRo4pKoqH0Y1pX
	 ga2+nPkAM9W3Q==
Date: Thu, 19 Jun 2025 13:36:23 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net v4 2/2] net: airoha: Differentiate hwfd buffer size
 for QDMA0 and QDMA1
Message-ID: <20250619123623.GL1699@horms.kernel.org>
References: <20250619-airoha-hw-num-desc-v4-0-49600a9b319a@kernel.org>
 <20250619-airoha-hw-num-desc-v4-2-49600a9b319a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619-airoha-hw-num-desc-v4-2-49600a9b319a@kernel.org>
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

On Thu, Jun 19, 2025 at 09:07:25AM +0200, Lorenzo Bianconi wrote:
> EN7581 SoC allows configuring the size and the number of buffers in
> hwfd payload queue for both QDMA0 and QDMA1.
> In order to reduce the required DRAM used for hwfd buffers queues and
> decrease the memory footprint, differentiate hwfd buffer size for QDMA0
> and QDMA1 and reduce hwfd buffer size to 1KB for QDMA1 (WAN) while
> maintaining 2KB for QDMA0 (LAN).
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Hi Lorenzo,

Thanks for the updated commit message.

Reviewed-by: Simon Horman <horms@kernel.org>


