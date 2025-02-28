Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76139C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 02:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VW7mmz/huAuDCL7QknAzGhHG5Rjd/1P4ysQj6d6j3pw=; b=u0UQJgMPyyOIoKEhOk7kmXn42v
	vvw3J3YQ14bj6FXwPMsbRwFur7dJp1MRmnV7xyO2MGRZeWgyOv9OytmhvL2dZcpdF1qq79OsEeTty
	1jlBd5b30XIeLjXDofTlIw7CTa5VbuGjmmLIiuupPOVI9LYGTGac3tsdu/l+zXUOQFK6kQGjUdCYV
	PLm+Af1awD29CJt6mp6VrnwOiJ2cpkBvwuwBtuRdmJYxNi+yfOTkxUG2g8yW1+5pUAzk1Ka+Czyhv
	zaOwS1EE9ZKdkOKilevtkY96zu5dRiRtQ4i4cBRLY2PbZmIRCbiQvuqudU04bvrmlqUICorGEuLQD
	lT1BdU9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnqFg-00000009VPG-0pw2;
	Fri, 28 Feb 2025 02:37:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnqE8-00000009VIA-3MlQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 02:35:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 63AE1612E1;
	Fri, 28 Feb 2025 02:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5E87C4CEDD;
	Fri, 28 Feb 2025 02:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740710147;
	bh=mPYw4QtWI6b6bDDohPnfGl05s5iuP5VCTsCxQaqOyug=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=jmMjitD8MqAkQdJCrpH+yb2ZxSj8PoHtWyuVi+skqgrhC6ZsN3oeGtzNuCPWU8qav
	 zEl4D/HDfuzf+Sa98HT0ZvZzBapAJt2XI0Kqxep7tI59wF4hCrT7LlJjTDr5AaN4aw
	 E5ayk3NKMZfmjmREG+tHx+wqGFazG79fThpFTs4N1wdakDR+MUr/1G+A6GWdVDUbQV
	 AdRBoZxSdGnIA9/FMnmbWDQEQkfBy8Wj5zOKDrTIp1kngbmor7OnZkbVsCi9n21JCU
	 b5p8lEHBQ/yGgVTBkh08Zp9YGlNbDhOfVihj2w2yoNQaQ1b6Fleu1hj4yu5MEMAVJT
	 EyQEwxqBVUQmw==
Date: Thu, 27 Feb 2025 18:35:45 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre
 Torgue <alexandre.torgue@foss.st.com>, Huacai Chen <chenhuacai@kernel.org>,
 Yanteng Si <si.yanteng@linux.dev>, Yinggang Gu <guyinggang@loongson.cn>,
 Feiyang Chen <chenfeiyang@loongson.cn>, Philipp Stanner
 <pstanner@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Qing Zhang
 <zhangqing@loongson.cn>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>, Henry Chen
 <chenx97@aosc.io>
Subject: Re: [PATCH net-next v4 1/4] stmmac: loongson: Pass correct arg to
 PCI function
Message-ID: <20250227183545.0848dd61@kernel.org>
In-Reply-To: <20250226085208.97891-2-phasta@kernel.org>
References: <20250226085208.97891-1-phasta@kernel.org>
	<20250226085208.97891-2-phasta@kernel.org>
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

On Wed, 26 Feb 2025 09:52:05 +0100 Philipp Stanner wrote:
> pcim_iomap_regions() should receive the driver's name as its third
> parameter, not the PCI device's name.
> 
> Define the driver name with a macro and use it at the appropriate
> places, including pcim_iomap_regions().
> 
> Cc: stable@vger.kernel.org # v5.14+
> Fixes: 30bba69d7db4 ("stmmac: pci: Add dwmac support for Loongson")

Since you sent this as a fix (which.. yea.. I guess.. why not..)
I'll apply it to the fixes tree. But then the other patches have 
to wait and be reposted next Thu. The fixes are merged with net-next
every Thu, but since this series was tagged as net-next I missed
it in today's cross merge :(

