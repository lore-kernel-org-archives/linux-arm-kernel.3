Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DF5103E190
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 14:33:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ZvCPsvWxw2YXvIRzu6Qkl+xZl0UJJHZvO4VYJ9+3K8=; b=zvFQ2BJReq/lQEIFCQktvS+lxm
	MQxzuHu65+n10KWS5lSRVEaudO3mOdtmaKOx1SE4eH2qLysTQaDLPfQ6buYBV+yY4HrfaHwXhWZTa
	85k96yKy/1zZUp5B8apYzcmhhc2Q8I7SSli43wiLbC4AKwGGDpZl6+NMiRP0Kfhu+HXtGzJZ9Y6Cb
	BVWegmcgTjH856h/gs75WugVPdzUMkPSwvXXYL+RPNwcxlySp2QwvgCHIfJgjQedm25T18MPrG+wf
	fGPQxgMAOpgZQQIZB+aALBORklKagjjV/BMYPyBr8H4SxoFWVzkBSobS35U0Buxxg5jijHTTtAJ91
	DLpyYBAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rxW-00000008bJk-1Keo;
	Wed, 18 Mar 2026 14:33:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rxU-00000008bJe-3igx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 14:33:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1268B60054;
	Wed, 18 Mar 2026 14:33:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8659C19421;
	Wed, 18 Mar 2026 14:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773844395;
	bh=zo3ppbbm5CmklykDDi884bR6RTstjwQ6rqH+FoHduP4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lM08xmySH7oe0eBpsBAOY5KZgan8agd14IQH9AEUXTTlIjc++KVnE27u4klJ7exp6
	 iSxgw0UgKZFjmuzvnq8pGmMnU7sYrV22yPxVZqvBP/3eOiQ06RkiiJZyTUVym12D/b
	 qwjnXVnEFP+UlccWeJHv6dkR0KHBEXOdBPF7bQkprBv4s90mV8byr4pK0FePE6/xct
	 ACvVieZuJk9YngFGZy29Ai+Rs6KXeQ24KjtsY9vxRSmhDTte1IrFeMyVgEZ6Ne8spX
	 DjMbphLvIZ5D8ccyW3UVFHq2BbcezXkg8bmVUrKe273ekwz08eS7h33zQwnKgq/Jej
	 ZMeh6QQOxhnFA==
From: Simon Horman <horms@kernel.org>
To: wei.fang@nxp.com
Cc: Simon Horman <horms@kernel.org>,
	conor+dt@kernel.org,
	claudiu.manoil@nxp.com,
	edumazet@google.com,
	frank.li@nxp.com,
	chleroy@kernel.org,
	imx@lists.linux.dev,
	f.fainelli@gmail.com,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux@armlinux.org.uk,
	linuxppc-dev@lists.ozlabs.org,
	xiaoning.wang@nxp.com,
	linux-kernel@vger.kernel.org,
	pabeni@redhat.com,
	vladimir.oltean@nxp.com,
	robh@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	krzk+dt@kernel.org,
	kuba@kernel.org
Subject: Re: [net-next,08/14] net: enetc: add multiple command BD rings support
Date: Wed, 18 Mar 2026 14:32:01 +0000
Message-ID: <20260318143201.1888252-1-horms@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260316094152.1558671-9-wei.fang@nxp.com>
References: <20260316094152.1558671-9-wei.fang@nxp.com>
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
net: enetc: add multiple command BD rings support

This commit adds support for multiple command BD rings in the NTMP
driver. When the NETC switch has multiple command BD rings and one is
busy, the driver can select an alternate ring to execute commands.

> diff --git a/drivers/net/ethernet/freescale/enetc/ntmp.c b/drivers/net/ethernet/freescale/enetc/ntmp.c
> index 9fc3422137fc..e23a32946762 100644
> --- a/drivers/net/ethernet/freescale/enetc/ntmp.c
> +++ b/drivers/net/ethernet/freescale/enetc/ntmp.c
> @@ -117,6 +117,25 @@ static void ntmp_clean_cbdr(struct netc_cbdr *cbdr)
>  	cbdr->next_to_clean = i;
>  }
>
> +static struct netc_cbdr *netc_select_cbdr(struct ntmp_user *user)
> +{
> +	int cpu, i;
> +
> +	for (i = 0; i < user->cbdr_num; i++) {
> +		if (spin_is_locked(&user->ring[i].ring_lock))
> +			continue;
> +
> +		return &user->ring[i];
> +	}
> +
> +	/* If all the command BDRs are busy now, we select
> +	 * one of them, but need to wait for a while to use.
> +	 */
> +	cpu = smp_processor_id();
> +
> +	return &user->ring[cpu % user->cbdr_num];
> +}
> +

Can this trigger a preemption warning? netc_select_cbdr() is called from
netc_xmit_ntmp_cmd() before spin_lock_bh() is acquired, and the callers
(ntmp_maft_add_entry, ntmp_fdbt_add_entry, etc.) run in process context
with preemption enabled.

Using smp_processor_id() in preemptible code triggers a
"BUG: using smp_processor_id() in preemptible code" warning under
CONFIG_DEBUG_PREEMPT.

Since the CPU value here is only used as a hint for ring selection and not
for correctness, would raw_smp_processor_id() be more appropriate?

>  static int netc_xmit_ntmp_cmd(struct ntmp_user *user, union netc_cbd *cbd)
>  {
>  	union netc_cbd *cur_cbd;
> @@ -125,10 +144,10 @@ static int netc_xmit_ntmp_cmd(struct ntmp_user *user, union netc_cbd *cbd)
>  	u16 status;
>  	u32 val;
>
> -	/* Currently only i.MX95 ENETC is supported, and it only has one
> -	 * command BD ring
> -	 */
> -	cbdr = &user->ring[0];
> +	if (user->cbdr_num == 1)
> +		cbdr = &user->ring[0];
> +	else
> +		cbdr = netc_select_cbdr(user);
>
>  	spin_lock_bh(&cbdr->ring_lock);

