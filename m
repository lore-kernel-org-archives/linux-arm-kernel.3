Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD274C5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Jun 2025 08:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1hnPqqPgXqgGn3F1IvUi7+wd2hiCQoucfQZqDTQOo5o=; b=A/jm9C4R/X3gzleuysoMK1ZWsG
	2jGdaFC27emO5yVBBqHP4tEtgRI0lMEb7QMTPkN/q8SVowIIr6p739OQoaJMeVViBVxCWtKdTAtjk
	TvAvZ9qYbRFTrVCN3Q32j47vhjOdoQ/7PhUpvgz6ZXGlNKtZbpslqQrbnLXUY5zsJ6ze9YS7f63qU
	XDxB+LRBRjeoT3NJXxRNks5jHdjtIESfbBQjeE/yIzFvrueeOTyiCjVa/QaO6SLBj7HA5qhVP5Lk4
	l0v310wDqBFBhv9zwvYVmFNlxfbgQVTCio3Qp1fYhbRdgL3F1Uu0mQx8An4sAJBE8nRuUOwXuQlQv
	R2gfLfJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMN7Q-0000000AM7K-0uzZ;
	Tue, 03 Jun 2025 08:35:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMN13-0000000AKph-3vor;
	Tue, 03 Jun 2025 08:29:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5581C4505B;
	Tue,  3 Jun 2025 08:29:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 474B4C4CEED;
	Tue,  3 Jun 2025 08:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748939341;
	bh=a1/ue7BjPqlrTpKB1WNmGqITAW8iZLDxEbRgvPgsB4I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o7YiE7orxmHDTrenSRi1QIs5Kn5FsxEnovCPGCXOsH6I+0eVIOmzmUq8U7EiOrnR6
	 KO9LTU1OjkKvG20T2uwif1HEqQ4xMCM+EDiX7LA9dT68M6SwueR0J7roQpV0Ca2PFF
	 NIj+7SzwS1uJgi63niZnf1Vk9+exaozfZoDtnPjZ6NojMDQB4Da328Nbv9qACVf6rK
	 bGLmxBMR2QeK7DMYtp502pTK6hMqcvMagj8sa4SDqzWzluQP1sEOw16PfCP+nZKbSj
	 Uju4ieRXJ5CTwSDaHpx/dNMp7/c+2pGpqxxlxQP3BVN7uzqvJ0NoRKUsrRptOGw0tA
	 DaJToLXVFnFDQ==
Date: Tue, 3 Jun 2025 09:28:57 +0100
From: Simon Horman <horms@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Kubiak <michal.kubiak@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net v2 2/3] net: airoha: Fix IPv6 hw acceleration in
 bridge mode
Message-ID: <20250603082857.GB1484967@horms.kernel.org>
References: <20250602-airoha-flowtable-ipv6-fix-v2-0-3287f8b55214@kernel.org>
 <20250602-airoha-flowtable-ipv6-fix-v2-2-3287f8b55214@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602-airoha-flowtable-ipv6-fix-v2-2-3287f8b55214@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_012901_995415_24A8BD25 
X-CRM114-Status: UNSURE (   9.90  )
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

On Mon, Jun 02, 2025 at 12:55:38PM +0200, Lorenzo Bianconi wrote:
> ib2 and airoha_foe_mac_info_common have not the same offsets in
> airoha_foe_bridge and airoha_foe_ipv6 structures. Current codebase does
> not accelerate IPv6 traffic in bridge mode since ib2 and l2 info are not
> set properly copying airoha_foe_bridge struct into airoha_foe_ipv6 one
> in airoha_ppe_foe_commit_subflow_entry routine.
> Fix IPv6 hw acceleration in bridge mode resolving ib2 and
> airoha_foe_mac_info_common overwrite in
> airoha_ppe_foe_commit_subflow_entry() and configuring them with proper
> values.
> 
> Fixes: cd53f622611f ("net: airoha: Add L2 hw acceleration support")
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: Simon Horman <horms@kernel.org>


