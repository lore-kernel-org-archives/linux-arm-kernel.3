Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BD1CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 09:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gRRwy50K4JnGdt30eWE2lTF1ai/8iZTtgfay12HVjsQ=; b=ehCfMx6ojcRonblGv3w4tjfRsZ
	z6m47VCz2y/3AcifDJwwM+fmBMt68S5TVuK8iO0cv31+cRRc22lnRDDaf2cUzj5Fme3h51yZr4wB/
	gMVjFuc8SpAIETNCRveJUdvLMXe5s35EC00lb59Nycejem1qy+zSsp1a1CrvVReoXVSgvTgySoPCz
	ohg8IFd7+oRzcpV0vWdJcVbxvpRRycT8cPNVqkVc3fEDyEKzQEMsXhmr63zY6RQ5qdKMtTajWEXPr
	i2MT10TeeBKGrHTwuOUflRo2PSxlpEkwB0ppF3FBBLGWLumeGVS/Tf0fbW/pIbM+kNyFusbQk8Ypm
	wHSroOvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waVcX-00000002ELN-2OGu;
	Fri, 19 Jun 2026 09:34:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waVcW-00000002ELE-1O4n;
	Fri, 19 Jun 2026 09:34:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B942643A57;
	Fri, 19 Jun 2026 09:34:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8F91F000E9;
	Fri, 19 Jun 2026 09:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781861679;
	bh=gRRwy50K4JnGdt30eWE2lTF1ai/8iZTtgfay12HVjsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Xy+0x16KZlwG5haPppjzskvBUiSoLb5G9gkeIbPo6nFvNOReDSO7RgJHtDvinTwQI
	 2QZ1c3ZoA6RtJzRy8Xp/nJSX1Zz8vdigEGLBnD3wq+2er7mojMW1KpckFtkeK3JRy4
	 XJt6hXfhR1TwV0fn/hMECuAcPGBlnDwPy/DZa6+fDGPqfEiKcPsp3YV+k12UxyQvtB
	 39lrenqCbPtUrYMJsmgVM2awBAoCvevmfa2A7LRUMS8IADDyVx2FPOgqbsoTxAgc/C
	 4qZJVOuAedeFXR2SMv1ud6AjUhF7QuntFk3tGk1dgfac2/5rRxCTcAme8qyV/RdrRm
	 dLg3W+yI4MMKA==
Date: Fri, 19 Jun 2026 10:34:35 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Wayen Yan <win847@gmail.com>, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net 1/2] net: airoha: Fix off-by-one in
 airoha_tc_remove_htb_queue()
Message-ID: <20260619093435.GU827683@horms.kernel.org>
References: <20260618-airoha-qos-fixes-v1-0-37192652157f@kernel.org>
 <20260618-airoha-qos-fixes-v1-1-37192652157f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260618-airoha-qos-fixes-v1-1-37192652157f@kernel.org>
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

On Thu, Jun 18, 2026 at 08:00:29AM +0200, Lorenzo Bianconi wrote:
> airoha_tc_htb_alloc_leaf_queue() computes the HTB QoS channel index
> as opt->classid % AIROHA_NUM_QOS_CHANNELS and stores it in qos_sq_bmap.
> However, airoha_tc_remove_htb_queue() clears the HTB configuration
> using queue + 1 as the channel index, causing an off-by-one error.
> Use queue directly as the QoS channel index to match the allocation
> logic.
> 
> Fixes: ef1ca9271313b ("net: airoha: Add sched HTB offload support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


