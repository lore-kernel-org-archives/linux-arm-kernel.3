Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3517DFED2F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 08:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+TTYYL33PXF0Us0XajwAhsXLfk5b1qJ5W6mzLcJBxCY=; b=Nz8Ku/9RgQmW/wZQEOoSsl0SvD
	TTq3XfDYJC6mfh7pzL9yvMoKJm9UsusJ1IbKEj3Zu+SL8UmlMn++SLa7CruGYids7JVfn3iEW3s9p
	4lBwAT9eb1kyYKGgI9ZxtonjGYyglsJs5FVio3HypnMatk05CoVT9BoUp/ub3G19Sq0uwFBM+cBLa
	xNm3O/vJfWJY1Gh2t8QkU7KlpZMnQdl3GMVPWqyAHJjFOFQ/bgE3h3SUeE2EMJ12Lt9o9SVFpN+xK
	1pQEZdnSM/fyY1/hGPlaClSs/EUCttoJi8ML+JptJpbLfcBcioy+kEJkwPqDuHZ4ENSZ+diEzYVB/
	/axmWyCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0bs8-0000000DgJ8-16EH;
	Thu, 12 Mar 2026 08:58:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0bs6-0000000DgIp-1ymp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 08:58:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5616743D27;
	Thu, 12 Mar 2026 08:58:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D80AC4CEF7;
	Thu, 12 Mar 2026 08:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773305901;
	bh=yd9dTnuEPaVCMdPoTWlSnyuXsB191Tq7bJHQNSnx/0k=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=ACnH9tBi2rKxLExhfeBp9HdgShllKrcZnB8IENWUFizmljaEq+PWE4Jv8CAZNJ+5K
	 kviGYk5HD9a2d7qEBqQPlHNS+YHzMA5SzCNj0tuq4MY+avtOjbfb7uXcHj5tDP8S5S
	 cAQvlBArN/1lkAesJDzlRo+GNdxCgwwA2UM7DRUoWQP4gZzntx5GyMUC1ttoGMSaJT
	 asLBBwopWOXdR0RjAJd22ft0jBJLXlNfrR1cOC3l4UaM6NkMrIhwMtyt1oLmFGCBfn
	 ejsNunhqW4/CuQpXC9USnzjJ4lrd7jo/Hu/vGTwfUY3/3ZOlZJgoDWmeFY38CD2Uzq
	 4CtDXRUBOGGhw==
From: Srinivas Kandagatla <srini@kernel.org>
To: linux-arm-kernel@lists.infradead.org, michal.simek@amd.com, 
 Harsh Jain <h.jain@amd.com>
Cc: Ivan Vera <ivanverasantos@gmail.com>, stable@vger.kernel.org, 
 Harish Ediga <harish.ediga@amd.com>
In-Reply-To: <20260119093547.3583707-1-h.jain@amd.com>
References: <20260119093547.3583707-1-h.jain@amd.com>
Subject: Re: [LINUX PATCH V2] nvmem: zynqmp_nvmem: Fix buffer size in DMA
 and memcpy
Message-Id: <177330589994.2413514.5926618043707689822.b4-ty@kernel.org>
Date: Thu, 12 Mar 2026 08:58:19 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_015822_556057_C6A0D296 
X-CRM114-Status: UNSURE (   6.39  )
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


On Mon, 19 Jan 2026 15:05:47 +0530, Harsh Jain wrote:
> Buffer size used in dma allocation and memcpy is wrong.
> It can lead to undersized DMA buffer access and possible
> memory corruption. use correct buffer size in dma_alloc_coherent
> and memcpy.
> 
> 

Applied, thanks!

[1/1] nvmem: zynqmp_nvmem: Fix buffer size in DMA and memcpy
      commit: 93a1b86f51c8c552db86216f065af42cadf5595d

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


