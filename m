Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5058CD98DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 23:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xu16QBgKPLOAs6tIPzhjEHQSe0fKVo2Y4Yk32qsOGwk=; b=KCM4FACN+yiibrcxZ7qOLMQu/2
	aoOk0KUAsjSx2ofNGRAYnNXBHGLRCwfLXERePkpWQRn85kRPVVNkX8yNS8iGurCz9X5Qr7/paHSQK
	3cTWDSKFckkM1sOJP9iFoExabNjK5/jLkTVDfSYEwpp7kGlA34NIGVX6WmNCqHieMsLl7CKjXl05e
	bULxBLqUvYspKqB3EFyxM6j6fA2GF3qZveJMeXVoRt65hLG6ZMxy/+KxXOrRRIKr5jKX1syUwtCgS
	7+O2bim85bETSiOzrr6LNYESW1deC5RMJ9p0Z/nWJ1cxQDGWj+dWdXUybefjy+l/NV/ZnE+Ko0d7d
	yKVoeF0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGtF-0000000Ewuo-2iJu;
	Mon, 15 Jun 2026 23:38:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZGtD-0000000Ewue-3Yqo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 23:38:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 406C74326E;
	Mon, 15 Jun 2026 23:38:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65DB81F000E9;
	Mon, 15 Jun 2026 23:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781566727;
	bh=Xu16QBgKPLOAs6tIPzhjEHQSe0fKVo2Y4Yk32qsOGwk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=V2dYIl0TZzMlxBl0H6oMbIesaC94xib3XFsWF0LzgMugdVTgX7yRSGzcl6/fvgvPS
	 TptwAomeLEF8/AtTuvGwGl5yG3tM76OUpkq32Fdt2AjgtHSXvR+uKb0MtFjdS/Uu1z
	 bIyxkdja+DpLU0BvsigVKHrjVc4SRxOy1JfEl4ms5KKIkQp9NMzmOe2ili9CdxvF+L
	 Qdqg6TF59AX8Y/2BoRTrP4Vep0RXBSoaSSv2VKoC/0unGupbDyUWN/MX8uUaJj1VQP
	 uLtbVqfMyRTZ4EBLXazOF8HXSQ9WWwQGmC5FI3MUArK5/WUnF5dUquuxvnr4B9+QYv
	 8unWO4UYAHjoA==
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
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH net-next 1/9] net: microchip: vcap: fix rule move for rules of coprime size
Date: Mon, 15 Jun 2026 16:38:45 -0700
Message-ID: <20260615233845.1042219-1-kuba@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260612-sparx5_l3_routing-v1-1-fc3c10160f49@microchip.com>
References: <20260612-sparx5_l3_routing-v1-1-fc3c10160f49@microchip.com>
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
Subject: net: microchip: vcap: fix rule move for rules of coprime size

This patch addresses a discrepancy in how software and hardware move rule
addresses on insert and delete for the LPM VCAP. It introduces a uniform
offset computation aligned to the least common multiple of all rule sizes
in a block. This ensures that hardware and software representations remain
synchronized and all rules land on correctly aligned addresses.

> diff --git a/drivers/net/ethernet/microchip/vcap/vcap_api.c b/drivers/net/ethernet/microchip/vcap/vcap_api.c
> index 0fdb5e363badc..6946fd7384581 100644
> --- a/drivers/net/ethernet/microchip/vcap/vcap_api.c
> +++ b/drivers/net/ethernet/microchip/vcap/vcap_api.c

[ ... ]

> @@ -2275,8 +2336,7 @@ int vcap_add_rule(struct vcap_rule *rule)
>  		       __func__, __LINE__, ret);
>  		goto out;
>  	}
> -	if (move.count > 0)
> -		vcap_move_rules(ri, &move);
> +	vcap_move_rules(ri, &move);
>  
>  	/* Set the counter to zero */
>  	ret = vcap_write_counter(ri, &ctr);

[Severity: High]
This is a pre-existing issue, but does vcap_add_rule() leak the newly
duplicated rule if operations like vcap_write_counter() or
vcap_write_rule() fail later on?

If a failure occurs, the code takes the goto out path:

vcap_add_rule() {
    ...
    ret = vcap_write_rule(ri);
    if (ret) {
        pr_err("%s:%d: rule write error: %d\n", __func__, __LINE__, ret);
        goto out;
    }
out:
    mutex_unlock(&ri->admin->lock);
    return ret;
}

This seems to exit without reverting the earlier list insertions and
hardware moves.

Could this leave the software and hardware states permanently inconsistent
and leak the newly duplicated rule?

[ ... ]

> @@ -2488,59 +2548,52 @@ int vcap_mod_rule(struct vcap_rule *rule)
>  }
>  EXPORT_SYMBOL_GPL(vcap_mod_rule);

[Severity: High]
This isn't a bug introduced by this patch, but does vcap_mod_rule() discard
the active software rule pointer and overwrite hardware with stale addresses?

Looking at vcap_mod_rule(), the function validates the rule using
vcap_get_locked_rule() but ignores the returned pointer:

vcap_mod_rule(struct vcap_rule *rule) {
    struct vcap_rule_internal *ri = to_intrule(rule);
    ...
    if (!vcap_get_locked_rule(ri->vctrl, ri->data.id))
        return -ENOENT;
    ...
    err = vcap_encode_rule(ri);
    if (err)
        goto out;

    err = vcap_write_rule(ri);
}

Because the function continues to use the caller provided copy ri, it
doesn't see updates to the real rule in the admin->rules list.

If the real rule's hardware address was previously shifted due to insertions
or deletions, could writing to the stale address in ri->addr corrupt other
rules in the hardware VCAP?

[ ... ]

One other pre-existing issue noticed while reviewing this subsystem:

[Severity: High]
This is a pre-existing issue, but is it safe to iterate over the admin->rules
list across different VCAP instances without acquiring admin->lock for
each instance?

In vcap_rule_exists():

static bool vcap_rule_exists(struct vcap_control *vctrl, u32 id) {
    ...
    list_for_each_entry(admin, &vctrl->list, list)
        list_for_each_entry(ri, &admin->rules, list)
            if (ri->data.id == id)
                return true;
    return false;
}

If another thread is concurrently inserting or deleting a rule on another
VCAP instance while holding that instance's lock, could this unprotected
concurrent access encounter a data race and dereference a poisoned pointer?
-- 
pw-bot: cr

