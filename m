Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB3E5CAC58D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 06:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bnNSETYlaaPKTpf5DnhPX7H/U4rfvB+0sEbvfZou6yw=; b=qrQZW41Q8/yls0zyeF/SWf60wj
	K8NJFFU1Ba80sNyf4Q3u63bKDzgnXtrEXFkR5ULgEryHCw9X3it+GNZn3eWCp7R6yW+06Kw8uGc4N
	kyj9v93ysoRIVuxLagHwYjxlsBMz++5CDHDwedlzOVC19XURf88/FqTanArfPMcDgPgzHXlmIdUkH
	syfad2dZTxj8iTeLBFOMoSVnDS/RrkR4+kdCipdnpYHtMYDprARk8nyvM/iiBYaBLKvZ8N/UejUBm
	dTzJfCS3wGZNl7vikL2iE4SKAqgLymmv+0gQ3Q3XiYkpynX1ztNzOTvuAgC4Rl8EZ5O6h2ZxB+Yp9
	fGWCrbqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsBo-00000004pFx-29Df;
	Tue, 09 Sep 2025 06:50:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uviRN-00000002BOx-3ysA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 20:26:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F303A601B9;
	Mon,  8 Sep 2025 20:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 572C8C4CEF1;
	Mon,  8 Sep 2025 20:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757363176;
	bh=RTlIU2xCbD8I8E2KxfqW+zB3CNk6WHDCJMHR2w9OKjo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bDD6UaPBhu/yHDtS7NvKJP1T0QKq12q7id9L1S4qMpVSJHprzwNlVf/oTUBzLu7/e
	 Flvr++ri/ZYAjLZK5z8vLY7AvogDPLKjzvs3M80SATKNVPqe2nsQT4fwpE9ISaNNuK
	 /FTukwJhPohg/487WxAaEx4gfSZf5tRuIg63DAd3Y4GXT6XPgoUYlcXt10uvJZSDxA
	 gvReQha+MHSqAwNMpJUqiM+CZzS9nhuTGwZ7humIGzTiwQFyjfWvlkUVkcg3zP6cVw
	 PhAyfiJBasbe73fzHe2sLb8umBxs45I+crDlGO2wZPgBq20F43EeaA2HjNz2cDu7Tt
	 ma9f2vCzJ/uKg==
Date: Mon, 8 Sep 2025 13:26:15 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Conley Lee <conleylee@foxmail.com>, vkoul@kernel.org
Cc: davem@davemloft.net, wens@csie.org, mripard@kernel.org,
 netdev@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: ethernet: sun4i-emac: free dma descriptor
Message-ID: <20250908132615.6a2507ed@kernel.org>
In-Reply-To: <tencent_D434891410B0717BB0BDCB1434969E6EB50A@qq.com>
References: <20250904072446.5563130d@kernel.org>
	<tencent_D434891410B0717BB0BDCB1434969E6EB50A@qq.com>
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

On Sun,  7 Sep 2025 19:29:30 +0800 Conley Lee wrote:
> In the current implementation of the sun4i-emac driver, when using DMA to
> receive data packets, the descriptor for the current DMA request is not
> released in the rx_done_callback.

I wish you elaborated more on the reuse flag not being set :\

> Fix this by properly releasing the descriptor.
> 
> Fixes: 47869e82c8b8 ("sun4i-emac.c: add dma support")
> Signed-off-by: Conley Lee <conleylee@foxmail.com>

Hi Vinod, could you TAL? Is this fix legit or there's something wrong
with how the DMA engine API is used on this platform?
https://lore.kernel.org/all/tencent_D434891410B0717BB0BDCB1434969E6EB50A@qq.com/

