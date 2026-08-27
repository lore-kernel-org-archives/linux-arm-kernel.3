Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49586C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 15:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ouhEt6qkggpee9x0dWDtPhZWnv6qBFuFRqXKMCeiM2U=; b=gMN55AUISZpThKl2sM/qRaKQBd
	ZgBWy8jSAb0QS1LLj4HNfTWCf2qwca41K9iL5Ix/ag/UjWkYflKZsOjwarlrs2ZI3WYOwa5nR9vq1
	xfPpbILpCkW2NkbM7/vwh1DaHQSv6ISzLxj2YfpIOS3ej7vtVQlAJ5BuYp78txJ70607E9fRd974Q
	zGJdmWn0ky6xvGtaf+yQB3tjr/TXa2CMyf92wxkP1KMp0S+EYBGmZZdd2zMIq3GH+ep7EN3L6cvk3
	SsIgrw8JdoLMSoeRTP+LkTtcSF8lBcTv6MvMbpvUQ3A+tpwLNtsyIF+2lXdN84VYKSRmW5JUrq1Ft
	kJIQ5rQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcB7-00000004GGD-0LrG;
	Thu, 27 Aug 2026 15:38:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzcB5-00000004GG2-1OP7;
	Thu, 27 Aug 2026 15:38:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E65BC4018D;
	Thu, 27 Aug 2026 15:38:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 748161F000E9;
	Thu, 27 Aug 2026 15:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787845086;
	bh=ouhEt6qkggpee9x0dWDtPhZWnv6qBFuFRqXKMCeiM2U=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=hpC7BNgnRS45nzp+wP1+avFOMOvxaTJOPsm+gWptYy588hUvAHpHRPKwxhIOUerHA
	 ja1MixpJqGL7sa2H97nMcFElB+iKFUgRhMhOXh1Adq6zjBZiisPfGBJrPJ9A7hRvQY
	 5iy6kJF82DSMc8YssCiUiFDNS7CiKs3KwRGGSoZfAIuh6JN2hAACyXFTpe+Bv+sypQ
	 T3S5TKlPveX7qCg9jYZfXyFjj4WoANE8IegI6xNha+ZVflHTjzeT0SpaKrRrUUP66S
	 cjqK0KRUfa6JdSRuFTrEKMTCX7DWrgw4ICZORc2itN3RMYeCYyEKV3Oh2XZyYfFeuv
	 IlUkCSLKgx2tA==
Date: Thu, 27 Aug 2026 08:38:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Pawlik <pawlik.dan@gmail.com>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, lorenzo@kernel.org, nbd@nbd.name,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, andrew+netdev@lunn.ch,
 yangshiji66@outlook.com
Subject: Re: [PATCH v10 1/2] net: airoha: npu: fix missing streaming DMA
 mask
Message-ID: <20260827083805.4417d1f1@kernel.org>
In-Reply-To: <20260820085941.380401-1-pawlik.dan@gmail.com>
References: <20260820085941.380401-1-pawlik.dan@gmail.com>
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

On Thu, 20 Aug 2026 10:59:40 +0200 Daniel Pawlik wrote:
> The driver calls dma_set_coherent_mask() but never dma_set_mask(),
> leaving the streaming DMA mask at the bus default. On the non-coherent
> EN7581 platform (Cortex-A53), this causes the NPU mailbox to hang
> after approximately 41 calls when using streaming DMA mappings.
> 
> Replace dma_set_coherent_mask() with dma_set_mask_and_coherent() to
> set both the streaming and coherent DMA masks, matching standard
> driver practice.

I'm going to take this in as it's uncontroversial and obviously correct.
Hopefully we hear something to understand the second one better before
merging.

