Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC96CDB47C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 10:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lAKwacoVI7uad9g+jIiH9ookXbWgdh+4rlS83ehVIsw=; b=R1M79mSliaGYy4sdfXUyZyCHeQ
	FyK+uHOmQuI7b40QoWvADVd6Csqunj9we+rrLH9YL3G1GP18UivORC9W6gnw/iCmO+9pj9kSfufT5
	zr1n+WnzPVulYVe4NwtSq1XTf8OHpTZBaDHHkKDJKcPsFqDfiPvQb5GoO6XRKEri15qMngB72aMNT
	644/jhA7jq9V20pdmaLY9AQ1tgPWVTc31oxNjUkJYgoNynr1WrJDOpaozS338NuvIIXumMfEIeffM
	u8rUvHcCMMjAjtnAP3TY/V0SB805jsge5SS61gR6D0dAmK+wOf01HdnwXOpANptBPizVX04yUBSmi
	ZG7LvceA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbyn0-000000067Sd-08N3;
	Tue, 23 Jun 2026 10:55:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbymy-000000067SL-0alp;
	Tue, 23 Jun 2026 10:55:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8745C405A9;
	Tue, 23 Jun 2026 10:55:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45DA01F000E9;
	Tue, 23 Jun 2026 10:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782212131;
	bh=lAKwacoVI7uad9g+jIiH9ookXbWgdh+4rlS83ehVIsw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Nd6H/AKBBiphRBm1G0fYBB/P+tJDY3EthHSrSuOOIqxHa6P2zbJvBNW94bt7wq4BM
	 rcllD8dhyskNiOvyEehpiUPLIwJ3tjjuuVyc+NmGA1tuO2mAYiL0zclDwVkartqoWh
	 JBUmRhr6KcBb2z1TaCUVlUkV4kaoAjkb+4ajB48qoXaU1vF/SGzxVybKk7d/xjSX9X
	 DbKFzsyU/r7eKd4RVUehBiutUMpt+UdwJ70k1ZZzm3JxfNyBXGe9cFNk6BLz+1/D8O
	 W/0IqzZAHxFalUAivpxEFo1eso1fU+u/AZ6PfMIUYMwr6PI3gHIfXWrRcC3NHBcGG7
	 dQmTtiXdafUwA==
From: Simon Horman <horms@kernel.org>
To: lorenzo@kernel.org
Cc: Simon Horman <horms@kernel.org>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	leto.liu@airoha.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	brown.huang@airoha.com
Subject: Re: [PATCH net v2] net: airoha: Add retry mechanism to airoha_qdma_set_trtcm_param()
Date: Tue, 23 Jun 2026 11:53:42 +0100
Message-ID: <20260623105341.1076863-3-horms@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260622-airoha_qdma_set_trtcm_param-retry-fix-v2-1-95a83ac99dbd@kernel.org>
References: <20260622-airoha_qdma_set_trtcm_param-retry-fix-v2-1-95a83ac99dbd@kernel.org>
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
Full review at: https://sashiko.dev

Simon says: I'd appreciate it if you could look over the first two issues
            flagged below in the context of this patch. While the third
	    and final issue looks like it is in possible separate follow-up
	    territory.

---
net: airoha: Add retry mechanism to airoha_qdma_set_trtcm_param()
    
This patch introduces a retry loop to airoha_qdma_set_trtcm_param() to mitigate
bus timeouts when configuring QDMA parameters. It attempts to verify that the
configuration is correctly applied to the hardware.

> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
> index 3370c3df7c107..bb5c0599a4eed 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -2673,14 +2673,30 @@ static int airoha_qdma_set_trtcm_param(struct airoha_qdma *qdma, int channel,
>  		     FIELD_PREP(TRTCM_METER_GROUP_MASK, group) |
>  		     FIELD_PREP(TRTCM_PARAM_INDEX_MASK, idx) |
>  		     FIELD_PREP(TRTCM_PARAM_RATE_TYPE_MASK, mode);
> +	int i;
>  
> -	airoha_qdma_wr(qdma, REG_TRTCM_DATA_LOW(addr), val);
> -	airoha_qdma_wr(qdma, REG_TRTCM_CFG_PARAM(addr), config);
> +	for (i = 0; i < 100; i++) {
> +		u32 data;
>  
> -	return read_poll_timeout(airoha_qdma_rr, val,
> -				 val & TRTCM_PARAM_RW_DONE_MASK,
> -				 USEC_PER_MSEC, 10 * USEC_PER_MSEC, true,
> -				 qdma, REG_TRTCM_CFG_PARAM(addr));
> +		airoha_qdma_wr(qdma, REG_TRTCM_DATA_LOW(addr), val);
> +		wmb();
> +		airoha_qdma_wr(qdma, REG_TRTCM_CFG_PARAM(addr), config);
> +
> +		if (read_poll_timeout(airoha_qdma_rr, data,
> +				      data & TRTCM_PARAM_RW_DONE_MASK,
> +				      USEC_PER_MSEC, 10 * USEC_PER_MSEC,
> +				      true, qdma, REG_TRTCM_CFG_PARAM(addr)))
> +			return -ETIMEDOUT;

[Severity: High]
If a bus timeout causes the write phase's read_poll_timeout() in
airoha_qdma_set_trtcm_param() to fail, this immediately returns -ETIMEDOUT,
aborting the 100-iteration retry loop.

Doesn't this defeat the mitigation?

> +
> +		if (airoha_qdma_get_trtcm_param(qdma, channel, addr, param,
> +						mode, &data, NULL))
> +			continue;

[Severity: High]
If airoha_qdma_get_trtcm_param() times out during the verification phase, it
indicates the hardware hasn't finished the read command (DONE bit is still 0).

The continue statement then immediately starts the next iteration, writing new
commands to DATA_LOW and CFG_PARAM.

Can writing to command registers while the hardware state machine is actively
busy violate hardware protocols and lead to unrecoverable lockups?

> +
> +		if (data == val)
> +			return 0;

[Severity: High]
This isn't a bug introduced by this patch, but if the bus drops the command
write to REG_TRTCM_CFG_PARAM, the hardware never executes the command and the
TRTCM_PARAM_RW_DONE_MASK bit remains set from the previous operation.

Consequently, read_poll_timeout() returns an immediate false success.

If both the set and get command writes are dropped by the bus, the get
operation will read back the newly written DATA_LOW register value.

Will the data == val check evaluate to true and falsely report success without
the hardware ever processing the configuration?

> +	}
> +
> +	return -EBUSY;
>  }
>  

[ ... ]

>  static int airoha_qdma_set_trtcm_config(struct airoha_qdma *qdma, int channel,
>  					u32 addr, enum trtcm_mode_type mode,
>  					bool enable, u32 enable_mask)
>  {
>  	u32 val;
>  
>  	if (airoha_qdma_get_trtcm_param(qdma, channel, addr, TRTCM_MISC_MODE,
>  					mode, &val, NULL))
>  		return -EINVAL;

[Severity: High]
Standalone calls to airoha_qdma_get_trtcm_param(), like this one in
airoha_qdma_set_trtcm_config(), lack a retry loop entirely.

Does this leave read-modify-write cycles fully vulnerable to the same bus
timeouts the patch attempts to mitigate?

[Severity: High]
This isn't a bug introduced by this patch, but the patch mitigates bus
timeouts in airoha_qdma_set_trtcm_param() while entirely missing
airoha_qdma_set_rl_param().

The latter performs the exact same write-and-poll sequence on identical QDMA
configuration registers:

drivers/net/ethernet/airoha/airoha_eth.c:airoha_qdma_set_rl_param() {
    ...
    return read_poll_timeout(..., val & RATE_LIMIT_PARAM_RW_DONE_MASK, ...);
}

If bus timeouts affect QDMA access broadly as stated in the commit message, are
the rate-limiting configuration paths randomly vulnerable to the same failures?

[Severity: High]
This isn't a bug introduced by this patch, but in airoha_tc_remove_htb_queue(),
hardware teardown incorrectly uses queue + 1 instead of queue:

drivers/net/ethernet/airoha/airoha_eth.c:airoha_tc_remove_htb_queue() {
    ...
    airoha_qdma_set_tx_rate_limit(netdev, queue + 1, 0, 0);
    ...
}

Does this leave the removed queue's hardware limits permanently active
(resource leak) and inadvertently disable the rate limits for queue + 1,
corrupting the QoS state of another active channel?

