Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459BAC3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 02:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=opUuODg6Tb9tSSBZq48EzT4DKVXF6IVRUKtiiI894NY=; b=TKfm+dNVQLMTrWNDS0seqA46OU
	CRuYhKXEyKuaDbgWFDM2phKQkOExBvSZW7YY9ybwBtnNoB0cI2xdiCTIfkG49gMZ+2kipvZZddZ9U
	vaT5zF7biwthKsW3dvzLKXYL799NHB6Vylu7QgO8f7GWE5Y0YhJQ0uG6dRcnCSqGZTkira6cfJEc5
	2rdEVkonS3mu2ZIJdmzjFCV60EzeZQdMDvBA38bb7GPn3c7Csz5konibuxyZQKg7+EgbX2yDs8H0b
	vWqh/eyJ5HYnOiFDnWWKc7rh61iRWN+QE18fiOru9UFazbNIBUOXpm2EtaT9bHiYDbz76Ueuv4QfF
	cN/3n1UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFO4K-0000000Gouf-3xCI;
	Thu, 15 May 2025 02:11:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFO2C-0000000Gobj-1FOT;
	Thu, 15 May 2025 02:09:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C6FBC5C4221;
	Thu, 15 May 2025 02:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B9F7C4CEE3;
	Thu, 15 May 2025 02:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747274958;
	bh=9JLt0pzyhfvU1pbbM+JOpnBKps/nmijZ8yFfJ1YHDWs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=cuoUFVv2xlfrKtpuWX9A+DndNJWuO5Hfhrzhf9UvU/kUdxx+zhDuSZXHNYyGwloQa
	 uEnz1djkPQnldoc1YbxIveuqyB9Qj53FgTTQX/MX3jL1ffuYX7JOROQPgcA/I2nWtC
	 KSIwuHpyRPV7BWbW9c+bdvwUKBjp3mzEwD45/OT6zMf4puv2D2wHShyqU/4vUPIAVZ
	 puKwkdryhfHaKu1mRH6/5LhUJ5jCDJoXbvzgepf7RfxcXNrbIeEJ0sB09IgLju3u/6
	 yNY8tL8Ovps/7NAqZOXSh718ckMfUaV1AxqeZJ2XldLBcq5Xw9DpvdRzZvz0s5L1w/
	 QLy/LuzJWovvQ==
Date: Wed, 14 May 2025 19:09:17 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: Fix page recycling in
 airoha_qdma_rx_process()
Message-ID: <20250514190917.4b0ff404@kernel.org>
In-Reply-To: <20250513-airoha-fix-rx-process-error-condition-v1-1-e5d70cd7c066@kernel.org>
References: <20250513-airoha-fix-rx-process-error-condition-v1-1-e5d70cd7c066@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_190920_387001_27B8F433 
X-CRM114-Status: UNSURE (   8.95  )
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

On Tue, 13 May 2025 18:34:44 +0200 Lorenzo Bianconi wrote:
> Do not recycle the page twice in airoha_qdma_rx_process routine in case
> of error. Just run dev_kfree_skb() if the skb has been allocated and marked
> for recycling. Run page_pool_put_full_page() directly if the skb has not
> been allocated yet.
> Moreover, rely on DMA address from queue entry element instead of reading
> it from the DMA descriptor for DMA syncing in airoha_qdma_rx_process().
> 
> Fixes: e12182ddb6e71 ("net: airoha: Enable Rx Scatter-Gather")

Missed your sign-off.
-- 
pw-bot: cr

