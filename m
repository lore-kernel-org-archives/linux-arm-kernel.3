Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2411C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 08:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mcx4V/KI1/qaiZTAhUImpmEkGNOT85kRkpglUZn3OyA=; b=DiNDN4iJN85tYSMLkCyL2ZXqkB
	CgVWPyLouoU06W0shfR+d7BMZm8fWu/TsVD9IhWLHI45SKzWnMlpKSFAS6Ay6124KdGuegJNOfon0
	/DMCbJCIdvNSHlPZO0/Ra0UUya3+5yOUklBHZz/G8oXQ2VpKjnhyP1pWxG87JbE2dctzfA2fjfqBV
	2W9KpgJHCIB9xf3IuCC0d9r8blk4qNY4tBN1AxHsnLEiibeWuOAbw5RYtX0nwDpN/KJy62uVBpFHo
	NJ36why8+gpecrcS+/xzbMbZvHxJ3azOZUKdiZU+RSX3Ixu2E4UbCTbrI4zcZQPdT3yFNFk1bTy7V
	FoUXyuUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMN7P-0000000AM6s-1ieU;
	Tue, 03 Jun 2025 08:35:35 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMN0r-0000000AKmF-1GyS;
	Tue, 03 Jun 2025 08:28:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7DB425C4962;
	Tue,  3 Jun 2025 08:26:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D8F7C4CEF4;
	Tue,  3 Jun 2025 08:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748939328;
	bh=9tfANha6a9cLbuywVtathmjriGf6aKTnwRXDdHPWXds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RK+Q+eSsjSbQkRTbEQ15KxYVJMJxELkjQOKT1e0zexauBo4KdwGTn27KaIQq3vum0
	 vgCqbAHC8ZLuc7ghMTWiAmvbLfOpA1YGAJcFXiHxG+1ZqnKUmXG8ZC+flfUIbfxefA
	 DgKVh8oD6Hrh9WPg+AF/FoD6PcKk3MjIaDrNO6xp0WUZYzJY79iq1y6EIGDcO7qPx4
	 GK5D54DG4B3tpl9YHkiVYq6V6sgvsEi/8vk3iy2QAZRvpnivUbn4v3Fqtq8lp+tKpd
	 dOrVtYID9vBnq0I0y2E26IBfRK4sqg6aahfGwHARviDoypw7SRbltSSKS7WcG7PCQb
	 pq4RDg590E14w==
Date: Tue, 3 Jun 2025 09:28:44 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Kubiak <michal.kubiak@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net v2 1/3] net: airoha: Initialize PPE UPDMEM source-mac
 table
Message-ID: <20250603082844.GA1484967@horms.kernel.org>
References: <20250602-airoha-flowtable-ipv6-fix-v2-0-3287f8b55214@kernel.org>
 <20250602-airoha-flowtable-ipv6-fix-v2-1-3287f8b55214@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602-airoha-flowtable-ipv6-fix-v2-1-3287f8b55214@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_012849_386139_8DB90696 
X-CRM114-Status: GOOD (  11.00  )
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

On Mon, Jun 02, 2025 at 12:55:37PM +0200, Lorenzo Bianconi wrote:
> UPDMEM source-mac table is a key-value map used to store devices mac
> addresses according to the port identifier. UPDMEM source mac table is
> used during IPv6 traffic hw acceleration since PPE entries, for space
> constraints, do not contain the full source mac address but just the
> identifier in the UPDMEM source-mac table.
> Configure UPDMEM source-mac table with device mac addresses and set
> the source-mac ID field for PPE IPv6 entries in order to select the
> proper device mac address as source mac for L3 IPv6 hw accelerated traffic.
> 
> Fixes: 00a7678310fe ("net: airoha: Introduce flowtable offload support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


