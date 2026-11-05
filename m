Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A62FA606D817
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 14:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YyHm5Xv7;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Rk5o+f1O
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rYHcTddsMGFJxoooXt9bGT/cprdRwsLwfNyq5sklZCs=; b=YyHm5Xv7BIDYFQUQUaNW1OVS+g
	zj7uAyo3GgZd9P/YyDs+JRD4j4IuZImPDvRHt/iZ8e3Qzhn9dxFTRKrahfCR2/o3zhYi+fPq+evXF
	yMOpVVIsuzQZFpbZJED6ynsKFpa+j735TefRKIldZkjUh+q2sLNMhQJbXHPgZciGSUfJAeVjf/6Co
	8/rQSa4nxiGfbs9raaqYjPUVAO4HaVJQ8oMFdVC4ILirXlDONsf97RM15qBIa3nAESv/35hc8R1oO
	nSd8vkiQFLVSRJdT+UzSkZcNW1UaqN00xtLZ9eaqBlWwsRjIhnO3k9xZ1eSdAukkVyvMrluHzn0gq
	IAZk/gwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyRQ-00000009GV1-2MIn;
	Thu, 05 Nov 2026 14:27:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOyRO-00000009GUl-2IX5;
	Thu, 05 Nov 2026 14:27:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CB6D8600AA;
	Thu,  5 Nov 2026 14:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 305201F000C1;
	Thu,  5 Nov 2026 14:27:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793888865;
	bh=rYHcTddsMGFJxoooXt9bGT/cprdRwsLwfNyq5sklZCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Rk5o+f1O6peQxQ9MqrF1F0MAgBXS1+MgHM1NL5rXIJ26rX2a7K/cTEaoepPELDyrj
	 eqj6eQtTFCOr6fANT/YDv7PBY8qUn+sqP87GUD6Xa73W4qRHUy4vbGr0Ltycf8T8jg
	 vEsW3D83z0t7XuVMbr/tGJ1QgCBxjDRSaCzNFZzs9CYyvmZBAk8BarpROmU+k1U1bs
	 4xxI3zTbSNdX1BNJMAq2u0FF8p8pDQDkDo0kHZnAcoZBUs8F0u4eirZmnzteFm0Rr2
	 lchBU6uFjD3odeJIkkNYZt3sUGSuaX479mgI4BRJt+YqJ1++38R9a9SHY4wIp8B2OP
	 XiMELJIEKt/zw==
Date: Thu, 5 Nov 2026 14:27:42 +0000
From: Simon Horman <horms@kernel.org>
To: Sandeep Haemoon <sandeeph@loljews.com>
Cc: netdev@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: ethernet: mtk_eth_soc: skip page_pool
 for
Message-ID: <20261105142742.GU865646@horms.kernel.org>
References: <patch-4f863a941889f0bceca1c082f2d79624@loljews.com>
 <patch-f1b04513b0fe3fb0a35ac744799fb0f3@loljews.com>
 <patch-fdfc120d5c46c3e5d484cbff30f63316@loljews.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <patch-fdfc120d5c46c3e5d484cbff30f63316@loljews.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 02, 2026 at 12:48:46AM +0200, Sandeep Haemoon wrote:
> page_pool allocates order-0 pages and the pool is created with
> MTK_PP_MAX_BUF_SIZE.  Rings that need larger buffers (9K jumbo or the
> HW-LRO rings) cannot use it.  Only create/use a page_pool when
> ring->frag_size fits in a page; the large-buffer path already uses
> mtk_max_buf_alloc().
> 
> This is required by the 9K support in the previous patch; the
> large-buffer path it relies on comes from the MediaTek downstream
> series.
> 
> Link: https://github.com/mediatek/mtk-openwrt-feeds
> Signed-off-by: Sandeep Haemoon <sandeeph@loljews.com>

It may not be particularly important, but I do wonder
if the order of the patches in this patch-set should
be reversed: as it is 9k support seems to be added by 1/2
and fixed in 2/2.

That notwithstanding:

Reviewed-by: Simon Horman <horms@kernel.org>


