Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84243FD006A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Mar 2026 15:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7gnmnjPfDY1pE6IHow+vsFCAJHIEdaIPA2zfAhz8coE=; b=3ZqFa4tKt/feKC4u2d6gJC7MhS
	oiKYJsbM2XVmxp7xGtNdlf+fu943pZuGFfB4gsL5zdG6SbrStkOygTBCG38qeyEgPx958xl09Nb3/
	ee1XF8QncZoA5Gopu12FNVbtb70GUmRZso8pyHrh0V7hyEsnW5/3madVp6492DbPsiTJsxWhuPQIR
	TRrorPv8O7LsWpXqfi3ry3PPhUSbQrI8DUkMf2OPVObE2Ggw5xOakHuuEauANDWAc4us4SgzneHxP
	xcxI6k5LDbRiP1uQEgdJcEruuJtJFHnY4y/9Hk1P418tkQs+5CuOhaI2ruZGWsyqn5i0kkN/MQBJC
	vwyUGBvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwiRA-0000000BbNC-453x;
	Sun, 01 Mar 2026 15:10:28 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwiR8-0000000BbN3-34no
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Mar 2026 15:10:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BA1A860008;
	Sun,  1 Mar 2026 15:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93022C116C6;
	Sun,  1 Mar 2026 15:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772377825;
	bh=Kxz+c6xsoZc7JcZ4DqWUnLqDgizGrfu1X4ndZCweW94=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Knzhm1HdRIudIC5LMlGc3hobiNp/zms4Oa15Vb0t/rdZb9yNdSR0aTDdc6+4fHEzl
	 NgjxCleNqNTtikejihk1etUlKB3rlaIeSe+Pn6CqXuTPln8nJ3Z9ZvbpyEZy7ujYrb
	 q3c/RoXPZh+beS7rADNg4Oa5ip7laDc5WZtZlGgidDoYlHLO44Tn3VRdBMjxe+FhSv
	 syOtK6JQQjvJ/wfLNpWuKqNX4hbZujLjN9839MCctuQ+F7wdu8dzg2pP4KvUvctR4T
	 Up9LVz63s3d428cwBA7miqPEewhjek4/00bmNT456lBugJLsHU/rde05mxdMZv26PK
	 a3rh7tUi1dfPA==
From: Simon Horman <horms@kernel.org>
To: m-malladi@ti.com
Cc: Simon Horman <horms@kernel.org>,
	vladimir.oltean@nxp.com,
	haokexin@gmail.com,
	pabeni@redhat.com,
	rogerq@kernel.org,
	parvathi@couthit.com,
	edumazet@google.com,
	vigneshr@ti.com,
	basharath@couthit.com,
	andrew+netdev@lunn.ch,
	linux-arm-kernel@lists.infradead.org,
	danishanwar@ti.com,
	jacob.e.keller@intel.com,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	srk@ti.com,
	kuba@kernel.org,
	afd@ti.com,
	vadim.fedorenko@linux.dev,
	davem@davemloft.net
Subject: Re: [net-next,v4,2/2] net: ti: icssg-prueth: Add ethtool ops for Frame Preemption MAC Merge
Date: Sun,  1 Mar 2026 15:10:14 +0000
Message-ID: <20260301151014.460245-1-horms@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260224124803.3634808-3-m-malladi@ti.com>
References: <20260224124803.3634808-3-m-malladi@ti.com>
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

For local reproduction steps see https://netdev-ai.bots.linux.dev/ai-local.html
---
net: ti: icssg-prueth: Add ethtool ops for Frame Preemption MAC Merge

This commit adds driver support for viewing and changing the MAC Merge
sublayer parameters and dumping MAC Merge statistics via ethtool
operations.

> diff --git a/drivers/net/ethernet/ti/icssg/icssg_ethtool.c b/drivers/net/ethernet/ti/icssg/icssg_ethtool.c
> index b715af21d23a..2176536a0989 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_ethtool.c
> +++ b/drivers/net/ethernet/ti/icssg/icssg_ethtool.c

[ ... ]

> @@ -294,6 +293,100 @@ static int emac_set_per_queue_coalesce(struct net_device *ndev, u32 queue,
>  	return 0;
>  }
>
> +static int emac_get_mm(struct net_device *ndev, struct ethtool_mm_state *state)
> +{
> +	struct prueth_emac *emac = netdev_priv(ndev);
> +	struct prueth_qos_iet *iet = &emac->qos.iet;
> +
> +	if (emac->is_sr1)
> +		return -EOPNOTSUPP;
> +
> +	state->tx_enabled = iet->fpe_enabled;
> +	state->pmac_enabled = true;
> +	state->tx_min_frag_size = iet->tx_min_frag_size;
> +	/* 64Bytes is the minimum fragment size supported
> +	 * by the firmware. <64B leads to min frame errors
> +	 */
> +	state->rx_min_frag_size = 64;
> +	state->tx_active = iet->fpe_active;
> +	state->verify_enabled = iet->mac_verify_configure;
> +	state->verify_time = iet->verify_time_ms;
> +
> +	switch (iet->verify_status) {
> +	case ICSSG_IETFPE_STATE_DISABLED:
> +		state->verify_status = ETHTOOL_MM_VERIFY_STATUS_DISABLED;
> +		break;
> +	case ICSSG_IETFPE_STATE_SUCCEEDED:
> +		state->verify_status = ETHTOOL_MM_VERIFY_STATUS_SUCCEEDED;
> +		break;
> +	case ICSSG_IETFPE_STATE_FAILED:
> +		state->verify_status = ETHTOOL_MM_VERIFY_STATUS_FAILED;
> +		break;
> +	default:
> +		state->verify_status = ETHTOOL_MM_VERIFY_STATUS_UNKNOWN;
> +		break;
> +	}

Does this switch statement handle all valid verify_status values?

The switch only explicitly handles ICSSG_IETFPE_STATE_DISABLED,
ICSSG_IETFPE_STATE_SUCCEEDED, and ICSSG_IETFPE_STATE_FAILED, falling
through to ETHTOOL_MM_VERIFY_STATUS_UNKNOWN for any other states.

Looking at the icssg_ietfpe_verify_states enum, there are also
ICSSG_IETFPE_STATE_INITIAL and ICSSG_IETFPE_STATE_VERIFYING states. The
ethtool UAPI defines ETHTOOL_MM_VERIFY_STATUS_INITIAL and
ETHTOOL_MM_VERIFY_STATUS_VERIFYING which directly correspond to these
states.

When the MAC Verify process is actively running, userspace will see
'unknown' instead of the more accurate 'verifying' status. This means
information about the ongoing state machine transition is lost.

Should the switch include explicit cases for ICSSG_IETFPE_STATE_INITIAL
and ICSSG_IETFPE_STATE_VERIFYING to provide more accurate status
reporting to userspace?

> +
> +	/* 802.3-2018 clause 30.14.1.6, says that the aMACMergeVerifyTime
> +	 * variable has a range between 1 and 128 ms inclusive. Limit to that.
> +	 */
> +	state->max_verify_time = ETHTOOL_MM_MAX_VERIFY_TIME_MS;
> +
> +	return 0;
> +}

[ ... ]

