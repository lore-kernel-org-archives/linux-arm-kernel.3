Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C838C5DF7E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 21:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s1Cuv5H4iR10JoyTLdDYm+EiZ/EyrO2G8ZMYUIgGCx0=; b=AItK17COnMxW+90Wr2dqDfD949
	i4hPXN1fQ3n0TbbFxmEBNXSUwPAiWAOv6cDdIUQo5pon13lOOr0iE8/TsjVLrp8bkevmFAZ9sznTj
	poZhJtd9tpl1nApTNh5CRU5Sbmf71vot6CxLHthf7tI+ZjppoKblPK7N8GJOfk/MPE4coeA2vIkky
	WodS7wsAogWHb2TFqud0Z2Nf7/4p3rA/XrUJk6maLqgoBCOMfGe7HW26xvMueXC0DMD4Gp9GkJI3U
	GCSnHBlhEgSuKpSSVwiCoJOMMCYaZJ1rT3Lac1Fco9leF4U1n83O31kUiAH+pV3BNOfHvOqv9UBmy
	9oqlwJbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww4ei-00000006oiZ-0F64;
	Mon, 17 Aug 2026 21:14:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww4ea-00000006ohC-20eg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 21:13:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3F8BD43BC1;
	Mon, 17 Aug 2026 21:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E1A81F00A3D;
	Mon, 17 Aug 2026 21:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787001236;
	bh=s1Cuv5H4iR10JoyTLdDYm+EiZ/EyrO2G8ZMYUIgGCx0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FUwI5qawZQayLbI4QekAAwyZr1wHNuVibDV0ET0rMmeHRhp6jvd6P1K4Q7H6imMQz
	 Q87YzU1o5EujXrh+xmQs+sMoxP379rbTa7fkNjXe7YR/X8naP4EoU0SA8lLcUfjQlj
	 zTliOM3bywJBdBiN+PIG3fgvWIiQM3XJOZkcD6dAsGUB1RVdKOrnvNMSayQr4/Ga2t
	 LOYpN9gk2VcTpqPrVH+i9mVi7lGLwpRFLtCKgRN36gVmLUmJA2xo3Iu0eO2ndf0Twf
	 h2siPx/pdpcwvE0GE4E4UAh93lIwcHF9LjnoNWJIV/CgZXGdprT310XAPVYN8jV3+T
	 WUhtNbQAcZUxQ==
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
Subject: Re: [PATCH net-next v2 4/9] net: microchip: vcap: expose helpers in vcap api and update debugfs
Date: Mon, 17 Aug 2026 14:13:55 -0700
Message-ID: <20260817211355.3633327-1-kuba@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260810-sparx5_l3_routing-v2-4-59e68cc8c8ca@microchip.com>
References: <20260810-sparx5_l3_routing-v2-4-59e68cc8c8ca@microchip.com>
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
net: microchip: vcap: expose helpers in vcap api and update debugfs

This adds two new client API helpers, vcap_val_add_rule() and
vcap_rule_mod_action_bit(), renames VCAP_CID_PREROUTING to
VCAP_CID_PREROUTING_L0 and adds VCAP_USER_L3. The debugfs dump learns
about the IP4_XIP and IP6_XIP key fields, and the action-field printer
mask expression is changed to a GENMASK() based form.

A couple of questions below.

> diff --git a/drivers/net/ethernet/microchip/vcap/vcap_api.c b/drivers/net/ethernet/microchip/vcap/vcap_api.c
> index 6e1ee15b82b7e..1ad2c44da8bd7 100644
> --- a/drivers/net/ethernet/microchip/vcap/vcap_api.c
> +++ b/drivers/net/ethernet/microchip/vcap/vcap_api.c
> @@ -2389,6 +2389,19 @@ int vcap_add_rule(struct vcap_rule *rule)
>  }
>  EXPORT_SYMBOL_GPL(vcap_add_rule);
>  
> +/* Validate and add rule to a VCAP instance */
> +int vcap_val_add_rule(struct vcap_rule *rule, u16 l3_proto)
> +{
> +	int err;
> +
> +	err = vcap_val_rule(rule, l3_proto);
> +	if (err)
> +		return err;
> +
> +	return vcap_add_rule(rule);
> +}
> +EXPORT_SYMBOL_GPL(vcap_val_add_rule);

[Severity: Medium]
This isn't a pattern introduced by this patch (every existing caller
already does vcap_val_rule() followed by vcap_add_rule() without holding
vctrl->lock across both), but now that it is packaged as an exported
helper, is the check-then-act window worth documenting or closing?

vcap_val_rule() ends with the capacity test and runs entirely without
vctrl->lock:

	/* Finally check if there is room for the rule in the VCAP */
	return vcap_rule_space(ri->admin, ri->size);

vcap_rule_space() reads the shared instance state unlocked:

	if (admin->last_used_addr - size < admin->first_valid_addr) {
		...
		return -ENOSPC;
	}

vcap_add_rule() then takes the mutex and the append branch of
vcap_insert_rule() consumes address space without re-testing against
admin->first_valid_addr:

	ri->addr = vcap_next_rule_addr(admin->last_used_addr, ri);
	admin->last_used_addr = ri->addr;

If two adds to the same VCAP instance interleave between validation and
insertion on a nearly full instance, can both pass the stale space check
and the second one push last_used_addr below first_valid_addr, so the
rule is encoded into addresses owned by another VCAP block instead of
returning -ENOSPC?

For the users present at this commit I could not construct such an
interleaving: the L3/LPM adders added later in the series all run from an
ordered workqueue under sparx5->router->lock, and the TC and matchall
paths are serialized by rtnl. The one case I could not rule out is a tc
filter installed directly into the LPM chain range concurrently with a FIB
work item, since sparx5_tc_flower_replace() resolves the target instance
purely from the user-supplied chain index:

	vrule = vcap_alloc_rule(vctrl, ndev, fco->common.chain_index, VCAP_USER_TC,
				fco->common.prio, 0);

Is such a tc configuration rejected somewhere? If not, would holding
vctrl->lock across validate plus insert, or re-checking vcap_rule_space()
in the append branch of vcap_insert_rule(), be preferable?

[ ... ]

> diff --git a/drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c b/drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c
> index e0c65c7ab23e1..36150822ce153 100644
> --- a/drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c
> +++ b/drivers/net/ethernet/microchip/vcap/vcap_api_debugfs.c
> @@ -133,7 +135,12 @@ vcap_debugfs_show_rule_actionfield(struct vcap_control *vctrl,
>  		out->prf(out->dst, "%d", value[0]);
>  		break;
>  	case VCAP_FIELD_U32:
> -		fmsk = (1 << actionfield[action].width) - 1;
> +		if (action == VCAP_AF_MAC_LSB || action == VCAP_AF_MAC_MSB) {
> +			hex = true;
> +			break;
> +		}
> +		fmsk = actionfield[action].width ?
> +		       GENMASK(actionfield[action].width - 1, 0) : 0;
>  		val = *(u32 *)value;
>  		out->prf(out->dst, "%u", val & fmsk);
>  		break;

[Severity: Low]
This isn't a bug introduced by this patch, but should the sibling
key-field printer get the same treatment? vcap_debugfs_show_rule_keyfield()
in the same file still evaluates the shift first and only repairs the
value afterwards:

	} else {
		u32 fmsk = (1 << keyfield[key].width) - 1;

		if (keyfield[key].width == 32)
			fmsk = ~0;
		out->prf(out->dst, "%u/%u", data->u32.value & fmsk,
			 data->u32.mask & fmsk);
	}

The printed value is correct because of the width == 32 fixup, but the
1 << 32 on a signed int has already been evaluated at that point, which
looks like the same undefined shift the commit message describes fixing
in the action-field printer.

This branch is reachable today: VCAP_KF_IP_PAYLOAD_5TUPLE is
VCAP_FIELD_U32 with width 32 in is0_normal_5tuple_ip4_keyfield for
sparx5 and lan969x, and in the lan966x is1 keyset, and VCAP_KF_RT_FRMID
is another W32 U32 key in lan966x is1. None of them are in the %pI4h or
hex special cases, so dumping a rule carrying one of those keys via the
VCAP debugfs rule dump would hit the shift with a width of 32. Would
converting this site to the same GENMASK() form make sense while the
area is being touched?

Reported by an automated review pipeline; both items are pre-existing and
neither is claimed by the commit message, so they may well be better as
separate cleanups.

