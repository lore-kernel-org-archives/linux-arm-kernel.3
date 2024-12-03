Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4518FE6C5EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 02:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9JE5ip2L5ouGt0z5lwAg62YYu/vSbq3Mo3C/T0xH0CM=; b=uF++liI0dpAWgd1+cZyawO9MDT
	OHAeVdWuFa+lDPPELmf9YxgWdVda2W/q/Raqxr5LPyrjTrtRfox88INuCWlVqjDWsJvrpLFHjdWIH
	Z5nTQSuEstxK2Zi0CdXbKLB0CL77GlzGISEal9lWp5ll3xEh40rM4DdQ+vGkxFF/lfavo8bcE7PIX
	jgmi/imuP8KEczRV70VnIY9gU31zEOVZQaTufr7F3Sqiqg0ejlB5bxjWPQB6El0svRdDOX/0+jeti
	PiZwiUSlWgY7LNzmso1yP6rSa8wM9IFkQvD3T6TppZmv/HtAjj/4ysRpc0Nw3wd5iEEwy7dCkIIRV
	suuUozLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIIl9-000000081nY-1RAp;
	Tue, 03 Dec 2024 02:35:31 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIIk8-000000081ec-1WoI
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 02:34:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 41246A41378;
	Tue,  3 Dec 2024 02:32:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EAADC4CED1;
	Tue,  3 Dec 2024 02:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733193267;
	bh=9JE5ip2L5ouGt0z5lwAg62YYu/vSbq3Mo3C/T0xH0CM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KlkySCNMcwNPFqyfUgBGbehIGWTkdlEjXEdH5GQI09WE4a0bQfq0GD41itaMZGVjJ
	 UZ/ryNxkrEjDXr0vVRWjTAIhey4741FPATykr/HyrJqwf3F4oLvp7ZNiruwdqLrVCZ
	 BA3w6rZLNggrVwq6LNns8HWq9Xe1EGPG7B+iVDYRZvGqeGHedGd0U0vR5tmv3adHr8
	 AHY5UNqDLb177o7aDmwulNV4EXtcU6wNgbUGGsfzJtg5sT5GnnFCt/u0ZW7Va1dxC3
	 WUREEPyiWPxSmDHDMkuMbaNdtHlI1zThDQpVfJBUpRDC+SL25dOOHAFOEIxaNMmtGp
	 onoWaa1578JYA==
Date: Mon, 2 Dec 2024 18:34:25 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Furong Xu <0x1207@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, xfr@outlook.com, Suraj Jaiswal
 <quic_jsuraj@quicinc.com>, Thierry Reding <treding@nvidia.com>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Subject: Re: [PATCH net v1] net: stmmac: TSO: Fix unbalanced DMA map/unmap
 for non-paged SKB data
Message-ID: <20241202183425.4021d14c@kernel.org>
In-Reply-To: <20241203100331.00007580@gmail.com>
References: <20241021061023.2162701-1-0x1207@gmail.com>
	<d8112193-0386-4e14-b516-37c2d838171a@nvidia.com>
	<20241128144501.0000619b@gmail.com>
	<20241202163309.05603e96@kernel.org>
	<20241203100331.00007580@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_183428_469068_6E97856B 
X-CRM114-Status: UNSURE (   7.20  )
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

On Tue, 3 Dec 2024 10:03:31 +0800 Furong Xu wrote:
> I requested Jon to provide more info about "Tx DMA map failed" in previous
> reply, and he does not respond yet.

What does it mean to provide "more info" about a print statement from
the driver? Is there a Kconfig which he needs to set to get more info?
Perhaps you should provide a debug patch he can apply on his tree, that
will print info about (1) which buffer mapping failed (head or frags);
(2) what the physical address was of the buffer that couldn't be mapped.

