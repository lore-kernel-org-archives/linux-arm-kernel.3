Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FEBE85380
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 15:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=25w+zSLkdeqiFQJqq5evtAWA8MCogyvTs7ZVkrQ5eu4=; b=j3nn/Dq2w/1IAd+UfUP3GsUZsI
	6ei0RVWYp7FSIa9ZfsicLHJ2RD2dV2dsTRetBMH45v0aTfm2znkYBfCW0YebrXO5BQS9MmqzvvKHl
	Nxxt6v2dmaS1Fo9EKmASI1bU8ikx4kjV2OYQL0jwoCjN0VeH/JKmMBfVv36p4qTky4ZaNQP6C0CcI
	ifP5uCcTIGDi1Q/0AvuAFGVmfoozDu85M+v900EAFLGIIE4PVwWPEeoQyauQtIvKgb+LssDz5LPpX
	St0LeptE/cxWm6XFqZhizgcievDnbbQS8SMq5nXQt2KglUEGjNu7fVb1wNpCT0K/CQw4A0N0Uav67
	W+EuDAEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8gw1-00000002FGk-27WW;
	Fri, 03 Apr 2026 15:59:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8gvz-00000002FG9-2FuU;
	Fri, 03 Apr 2026 15:59:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BE8824407C;
	Fri,  3 Apr 2026 15:59:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8E1EC4CEF7;
	Fri,  3 Apr 2026 15:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775231985;
	bh=COo09iCY2logus3uHqYWMR//alvUs6Kkf79Mc55dc4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tFn92LJEpKEvuwYyt5u85xBMTrit5kKNA+hVNRjjAk7Op4bibl3p4f3WW/TT+YdLC
	 7hg7Ridbk6/AF4fu9lWCmF8bWCWemozfxOFe2C66HEjF9txzh89W+mz5eZG7dDXGdA
	 wbcqrssVL6vlvMw+xp4+2etaM38NyFWISHEHc8ZVbuEokLgWgZkYGG335JMgQwniro
	 djDkVKdqcoCb0BZykNePdSc74W5aA5PbUHLBicYihiF+db8ZnWezpW8r8gBC0YmqT9
	 4CjMsiELg3yxPDyexJ5ifToKd7r0D8PKrIP+I12r7sVNKR4L4bGF6/LRgYNyfW2ZHX
	 TYuPw/1KtYidA==
Date: Fri, 3 Apr 2026 16:59:41 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: Fix memory leak in
 airoha_qdma_rx_process()
Message-ID: <20260403155941.GM113102@horms.kernel.org>
References: <20260402-airoha_qdma_rx_process-mem-leak-fix-v1-1-b5706f402d3c@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402-airoha_qdma_rx_process-mem-leak-fix-v1-1-b5706f402d3c@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_085947_603315_0B58A92D 
X-CRM114-Status: GOOD (  12.34  )
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

On Thu, Apr 02, 2026 at 02:57:10PM +0200, Lorenzo Bianconi wrote:
> If an error occurs on the subsequents buffers belonging to the
> non-linear part of the skb (e.g. due to an error in the payload length
> reported by the NIC or if we consumed all the available fragments for
> the skb), the page_pool fragment will not be linked to the skb so it will
> not return to the pool in the airoha_qdma_rx_process() error path. Fix the
> memory leak partially reverting commit 'd6d2b0e1538d ("net: airoha: Fix
> page recycling in airoha_qdma_rx_process()")' and always running
> page_pool_put_full_page routine in the airoha_qdma_rx_process() error
> path.
> 
> Fixes: d6d2b0e1538d ("net: airoha: Fix page recycling in airoha_qdma_rx_process()")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


