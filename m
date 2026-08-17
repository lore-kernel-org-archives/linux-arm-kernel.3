Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE1FC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 21:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mm3hvT4aeyyCxbTRBeO5ywVBxWxJNoMgGy+q5pgZHTE=; b=urNFbPRxnV9uZdZHSTRTFCH3Yj
	DLRyEg7948QC/9x6gXh7JgwnnJxiXbWXvZxeNidAstxNBQpZ4vlwh6F6LxE4xLDZ1tgvOgstRZqwT
	e09PQJFQOmzBubOmzFqWZfm39+JtrpzrB2vApPN8aRM0ysef5b8rbtdrTahc399zz7MF62iwuw0YV
	Qg7s9ybY7IRUPp3vD+foEspRMCgGiiiz+j5UQ16HulE4mdCipv4+QsHy+tsCWoG3IN5BtAKtX/a0l
	I5Ang57Kbhvo4aqcXN/koRIDQRtLgd7RNGbX5SJBcx2mA5FTpM9I6EDaGvJEANW5WUP2L5MF9Qof1
	TvGPLVKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww4eZ-00000006ogt-3TQd;
	Mon, 17 Aug 2026 21:13:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww4eY-00000006ogf-1YCm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 21:13:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7C1CA601DE;
	Mon, 17 Aug 2026 21:13:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A84991F000E9;
	Mon, 17 Aug 2026 21:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787001233;
	bh=mm3hvT4aeyyCxbTRBeO5ywVBxWxJNoMgGy+q5pgZHTE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=olxO1rMmeg5p8l8iTU8CMNGQJmbsHAYG1h/8MUgHSJPV7Q7h67VFgyqMBLULrmOQe
	 SoWUzwhwUcpN+RwM/WwmX18Vol1zhao8FcfVpGNUFJtexRjovQXzwG68fSJm1JQGoa
	 3PxRWtdryDJJREXPP8ZOhNGRspz6qpai5IgoCT+y9e/9IwpgNLIUWfQT02bL5AYUln
	 cST5apKEmqFnfNQVXU9RFdUzSeRxMzzmAHfDNXrZq8hPYFkEmY8Cu+5FUEpRR1f0RR
	 N0pkhkOmsPLywQMKH6vYuK4JFReaHbp106dk2eShSiR2aQDnf5kCt/2r0H+iHhk2T0
	 ahNwmEY267PpQ==
From: Jakub Kicinski <kuba@kernel.org>
To: jensemil.schulzostergaard@microchip.com
Cc: Jakub Kicinski <kuba@kernel.org>,
	horatiu.vultur@microchip.com,
	UNGLinuxDriver@microchip.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	pabeni@redhat.com,
	daniel.machon@microchip.com,
	Steen.Hegelund@microchip.com,
	kees@kernel.org,
	gustavoars@kernel.org,
	robert.marko@sartura.hr,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/9] net: microchip: vcap: fix rule move for rules of coprime size
Date: Mon, 17 Aug 2026 14:13:33 -0700
Message-ID: <20260817211333.3633182-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260810-sparx5_l3_routing-v2-1-59e68cc8c8ca@microchip.com>
References: <20260810-sparx5_l3_routing-v2-1-59e68cc8c8ca@microchip.com>
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
---
net: microchip: vcap: fix rule move for rules of coprime size

This reworks the VCAP rule move logic so that insert and delete compute a
single uniform address offset, aligned to the LCM of the rule sizes in the
moved block, instead of per-rule "optimal" offsets. The goal is to keep the
software rule addresses in sync with what the hardware move command does,
which becomes necessary once rules of coprime sizes (2 and 3) appear with
the LPM VCAP.

One question about the delete algorithm description in the changelog.

> On delete:
>
> 1. Initialize HW memory at the deleted rule's addresses before
>    moving, since the moved block may not fully cover them due to
>    padding.
> 2. Reclaim any padding between rules in the block.

[Severity: Low]
Is step 2 accurate for the new implementation?  As far as I can tell the
padding that sits between rules inside the moved block is preserved, not
reclaimed, because a single offset is applied to every rule in the block:

drivers/net/ethernet/microchip/vcap/vcap_api.c:vcap_move_rules_sw() {
	list_for_each_entry_continue(pos, &admin->rules, list)
		pos->addr -= move->offset;
}

Since every rule in the block is shifted by the same move->offset, the gaps
between rules within the block are structurally invariant across the move.

What appears to be reclaimed is the deleted rule's own space plus the
padding adjacent to its position, and only down to block_lcm granularity.
In the delete path unaligned_offset is always negative (block_first->addr +
block_first->size <= ri->addr <= base_addr), so the truncating branch is
taken in vcap_move_from_block():

drivers/net/ethernet/microchip/vcap/vcap_api.c:vcap_move_from_block() {
	unaligned_offset = (block_first->addr + block_first->size) - base_addr;
	if (unaligned_offset > 0)
		move->offset =
			((unaligned_offset + (block_lcm - 1)) / block_lcm) *
			block_lcm;
	else
		move->offset = (unaligned_offset / block_lcm) * block_lcm;
}

Integer division truncating toward zero leaves up to block_lcm - 1 addresses
of the gap unreclaimed at the boundary.

Could the changelog wording be adjusted to describe what is actually
reclaimed, for example the deleted rule's addresses plus adjacent padding,
rounded down to the block LCM?

> diff --git a/drivers/net/ethernet/microchip/vcap/vcap_api.c b/drivers/net/ethernet/microchip/vcap/vcap_api.c
> index 788c0728d7636..75c2ca54fddd2 100644
> --- a/drivers/net/ethernet/microchip/vcap/vcap_api.c
> +++ b/drivers/net/ethernet/microchip/vcap/vcap_api.c

[ ... ]

> @@ -2106,12 +2108,63 @@ static u32 vcap_set_rule_id(struct vcap_rule_internal *ri)
>  	return ri->data.id;
>  }
>  
> +static void vcap_move_from_block(u32 base_addr,
> +				 struct vcap_rule_internal *block_first,
> +				 struct vcap_rule_internal *block_last,
> +				 int block_lcm, struct vcap_rule_move *move)
> +{
> +	int unaligned_offset;
> +
> +	if (!block_first || !block_last)
> +		return;
> +
> +	move->addr = block_last->addr;
> +	move->count = block_first->addr + block_first->size - block_last->addr;
> +	/* Integer division rounds toward zero. We want to round toward +inf
> +	 * for the positive case (insertion) to ensure enough room.
> +	 */
> +	unaligned_offset = (block_first->addr + block_first->size) - base_addr;
> +	if (unaligned_offset > 0)
> +		move->offset =
> +			((unaligned_offset + (block_lcm - 1)) / block_lcm) *
> +			block_lcm;
> +	else
> +		move->offset = (unaligned_offset / block_lcm) * block_lcm;
> +}
> +
> +static void vcap_move_rules_sw(struct vcap_admin *admin,
> +			       struct vcap_rule_internal *pos,
> +			       struct vcap_rule_move const *move)
> +{
> +	if (move->count == 0 || move->offset == 0)
> +		return;
> +
> +	list_for_each_entry_continue(pos, &admin->rules, list)
> +		pos->addr -= move->offset;
> +}

[ ... ]
-- 
pw-bot: cr

