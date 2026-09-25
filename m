Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A21C98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 16:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+zQp+1omJq6CVjx/eZB1Bfc+CtQiGvnhxcCaK3LH4U=; b=RRjMt0xP6xFoYr4li6gWqULjVj
	7bf4eRT1VUVOvYhDIP0HhOpF5dlQKPn7+696rtkV/RZapo8hX+dhfmX5/BFDMJbwjE1Y0uh5YQDe5
	CEbik8TYaVSAT8LIelul0eQXY1++jpkIGFzi+XT3OFsjDhYri05w/K6xsfXxw6h9hvfVdH216/Ucf
	vPUUkOg/ra6RLG+uzn+39/ud/rvRhd4l9UpDH4ccqQWaIfGFz5+zK1v7GNLO5ocQh0vNvhnLYAAz8
	ut0koUJLLHh7Cx7bXgYQt/cqaPLloLGcNHzPoi+dDLJc7jWo9ZDHAuZP05LdFvMZJ44ae4x4QaAK/
	KYQSjQOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8xR-0000000Dy2U-47zA;
	Fri, 25 Sep 2026 16:39:33 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA8xR-0000000Dy25-0bGq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 16:39:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DDB5741B46;
	Fri, 25 Sep 2026 16:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F6471F000FF;
	Fri, 25 Sep 2026 16:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790354372;
	bh=d+zQp+1omJq6CVjx/eZB1Bfc+CtQiGvnhxcCaK3LH4U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Tb3YSOMplqpOF3cxjCQg/bciM6BGVSONhj2VD61sVGA9NAOdhbB1hIci9rGi1KUfz
	 kNLSDtzMgnBMtca+AJlMw11c6H31IsQ0oRQLLWqglTF0RSnrYN0PdYpnnnhK7WhlcF
	 09xLNl5muH1W/Fmj/8lRsv6KW+02fb4/t7X7UPPjw99u8dCiOBumKdrPIyC843XW21
	 X4Xl6LDfabblPXcQvORce202TGMT4mTgpc5GcoVMKgrAeLf2RiED+ZXUYPVwOuq4KA
	 0B+9LE8zlgEnfWuEXH0NbAVWVR0f32jFVJnKwumRDcAVH9YkaWqxTjgaOHXZl0yu3h
	 zxbcbGxaNKiKg==
From: Simon Horman <horms@kernel.org>
To: parvathi@couthit.com
Cc: Simon Horman <horms@kernel.org>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	danishanwar@ti.com,
	rogerq@kernel.org,
	pmohan@couthit.com,
	afd@ti.com,
	vadim.fedorenko@linux.dev,
	haokexin@gmail.com,
	basharath@couthit.com,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	pratheesh@ti.com,
	j-rameshbabu@ti.com,
	vigneshr@ti.com,
	praneeth@ti.com,
	srk@ti.com,
	rogerq@ti.com,
	m-malladi@ti.com,
	krishna@couthit.com,
	mohan@couthit.com
Subject: Re: [PATCH net-next v4 1/3] net: ti: icssm-prueth: Add HSR and PRP HW offload mode support for AM57xx, AM437x and AM335x
Date: Fri, 25 Sep 2026 17:39:14 +0100
Message-ID: <20260925163914.721071-1-horms@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921134343.200426-2-parvathi@couthit.com>
References: <20260921134343.200426-2-parvathi@couthit.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
Full review at: https://sashiko.dev/#/patchset/20260921134343.200426-4-parvathi@couthit.com?part=1
---
net: ti: icssm-prueth: Add HSR and PRP HW offload mode support for AM57xx, AM437x and AM335x

This commit extends the ICSSM PRUETH driver to support HSR and PRP redundancy
protocols on compatible TI SoCs. It enables dynamically switching PRU ethernet
ports from dual-EMAC mode into HSR/PRP slave modes via firmware reconfiguration.

> diff --git a/drivers/net/ethernet/ti/icssm/icssm_prueth.c b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> --- a/drivers/net/ethernet/ti/icssm/icssm_prueth.c
> +++ b/drivers/net/ethernet/ti/icssm/icssm_prueth.c
[ ... ]
> +static int icssm_prueth_hsr_port_link(struct net_device *ndev,
> +				      struct net_device *hsr_ndev)
> +{
[ ... ]
> +free_hsr:
> +	prueth->eth_type = prev_mode;
> +
> +	spin_lock_irqsave(&prueth->addr_lock, flags);
> +
> +	prueth->hsr_dev = NULL;
> +	prueth->hsr_members &= ~all_slaves;

[Severity: High]
Can this rollback improperly destroy the state for the already-linked first
port alongside the failing second port?

If the second port fails to transition to HSR/PRP mode, the free_hsr error
path clears the hsr_members mask for all ports by applying ~all_slaves.

Because the first port was successfully enrolled into the HSR bridge in a
previous invocation, it remains an active slave in the networking stack's
view. By wiping its membership state here, the driver drastically
desynchronizes its internal state from the kernel.

Would it be safer to only clear the bit for the specific port that is
failing to link?

> +
> +	spin_unlock_irqrestore(&prueth->addr_lock, flags);
> +	return ret;
> +}

