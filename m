Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A525CCA1012
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Sep 2025 19:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DjZrlYogjUx3hwr7dMBSTgYvIqf3ZIcTui64mgGPT80=; b=cvbxiR74e+oisOCUn+3LC5QAmO
	Kdn7CaE+kkBifaKjFKMixIr8G+dxZtKq2GgsURpLEL0mixVdeRizzQMuE3rvlCBMYIqherff6SNom
	ZoGMl7hKJn/ofOe8+oFX9NF/1UhUFXbvouFJFrFa3tCwC1C+v6b3L+Bm5ztPdWynj+njMu6EVP51s
	v2Nijx+F8wLx/fBXcdE/NJw20ydjqp9bnJXwWKOr4HQqJ6r+eIKg/FU+tgQF7e6KnIDIQ0+k7NoHj
	hmSdGF9kRZimezq53TB5AizNFZdWOS8x+WdHWQsZi9K2JsJ7rXt+qKihZntE8wwXuAFgY6zJ9+Mbw
	pmDsfIgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuFzP-0000000E19H-3Evd;
	Thu, 04 Sep 2025 19:51:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuAtM-0000000CC57-2KDP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 14:24:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C37CF60210;
	Thu,  4 Sep 2025 14:24:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27C5BC4CEF0;
	Thu,  4 Sep 2025 14:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756995887;
	bh=TMSFhLV/1wYkSJ97dKJw6ufL7BjjXw84F1bCscmJTtw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=DlqtHD48YgV+PrFaJtWEk60ZfwIQ08DvnfwAInRIuLG13x92gTVjBWU1ChjPa5ahM
	 AEfSxcERFIS0Bs97NAUWZWUTIwGlv2eYFuVR2yelqCz1QWzLpTkDg2D5icoi0KAGG9
	 yTckK9cFA9Y4cWB9YaTPF9yEtvFZyCc0XJjavWv8FghE6w7hVGkbhPRQRVHvoK9wp5
	 B5sB20in+GorY/jpsQzG7oZYykD4wAASJ5jCdivS3FYuEfoFT6LcTAt5g7SYN6ip4p
	 c22q959WzyTU7ib43O7cvcVLeTYiSJWxTtGJSpDjT0HTGuyHqnbDLn6Ggt40q7yFZo
	 gMd/Mh/odYsEA==
Date: Thu, 4 Sep 2025 07:24:46 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Conley Lee <conleylee@foxmail.com>
Cc: davem@davemloft.net, wens@csie.org, mripard@kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: ethernet: sun4i-emac: free dma descriptor
Message-ID: <20250904072446.5563130d@kernel.org>
In-Reply-To: <tencent_160BBED8A83CECDE110A344B51B6229B1209@qq.com>
References: <20250902155731.05a198d7@kernel.org>
	<tencent_160BBED8A83CECDE110A344B51B6229B1209@qq.com>
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

On Wed,  3 Sep 2025 15:49:39 +0800 Conley Lee wrote:
> In the current implementation of the sun4i-emac driver, when using DMA to
> receive data packets, the descriptor for the current DMA request is not
> released in the rx_done_callback.
> 
> Fix this by properly releasing the descriptor.

Reading the docs, it appears that the need to free the desc is tied to
setting descriptor reuse flag. Which this driver does not do. So I'm
unclear why this is needed, maybe the dma engine driver is doing
something strange?

Could you repost this, CC the dmaengine ML, Vinod and the appropriate
SoC maintainers?

