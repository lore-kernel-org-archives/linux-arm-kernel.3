Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A18AC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 17:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LZiAV52RXDf9JNv3eWNabRO2S8ojqaaHKEbseO6JITU=; b=O+FFr0qURoT1gYJ1UcTc469i3Q
	GK6keJYxglVnKjbtDqj9mEkyh/OHoUnqOQ28gOLpOs4mYASpQh04ZwN6K+HTrh17LBmxVbc6XyVQv
	t5NHoJnTQOnS+sqjal2KbI/9kcMGI44PJMDkXWkt0WPCEI0Pn96xHqmumTK5sr9kpTRa1/UO4eOVV
	Ubv7rqeasY3MCR/SH+IgZwOHcPXLXyAbqQaKitNGol1He8/oOU82eXKctCe2WjVuwByCmRb7D9tt+
	Sd1Q5x3k7dAwOwwQPUtGLQUSAF5cejKU7aEd7X+KpmKSKTFXs+ppuHsa9nCd3v4RlPgjQ53hW9Ohh
	LvGLzdyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Arb-00000000EX5-2qGK;
	Thu, 03 Sep 2026 17:04:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2ArZ-00000000EWq-3shf
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 17:04:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0AFB460A68;
	Thu,  3 Sep 2026 17:04:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E4D91F00A3D;
	Thu,  3 Sep 2026 17:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788455072;
	bh=LZiAV52RXDf9JNv3eWNabRO2S8ojqaaHKEbseO6JITU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RXr0mG4hKlQlbjXzwrpGilppMChl7pCmG/J93JekPdtUYOIRj5R2Pb8pUZTeuW3rY
	 lxrbx/y4mKtbcepTwZ5IHr49daDGy5O/3dA1kC3P9gvvY3WzqQSzWn+k+symlZZ6lm
	 O1xi+6geFbUiwTfvxCZMghnG2VB35+lGsuAe9d7GytFApj578Iul+eOT66Lla7uXcH
	 Npr2oYhbYfcxHfH8idYnoVZl3bsLn//kfMpDfZWjBeSDc0JadzjL5uWCPnzut1D5bh
	 Wx3xVWIHIrSXZStQTIb1Q6z2O6VSFZG5cjKQ+pXw0h8D8GcILtaUpnnLiDgorkJjMu
	 f31rbCNwcUDLw==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Frank Li <Frank.Li@kernel.org>, Eugen Hristev <ehristev@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260724225958.43925-1-rosenp@gmail.com>
References: <20260724225958.43925-1-rosenp@gmail.com>
Subject: Re: [PATCHv2] dmaengine: at_hdmac: fix sparse '__iomem' cast
 warning in memset helpers
Message-Id: <178845507006.1711546.1241811743699948076.b4-ty@kernel.org>
Date: Thu, 03 Sep 2026 22:34:30 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0
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


On Fri, 24 Jul 2026 15:59:58 -0700, Rosen Penev wrote:
> Both atc_prep_dma_memset() and atc_prep_dma_memset_sg() declare vaddr
> as 'void __iomem *' but assign the return of dma_pool_alloc(), which
> returns 'void *' (not iomem memory). This causes sparse to warn about
> a cast removing the __iomem address space at the dereference site.
> 
> The struct field memset_vaddr is also typed as 'int *', which is
> neither the type returned by dma_pool_alloc() nor the type used for
> the actual writes.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: at_hdmac: fix sparse '__iomem' cast warning in memset helpers
      commit: fdae0d0f096c92dd05d3722759fd614ea341e0dc

Best regards,
-- 
~Vinod



