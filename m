Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E972F9D0CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 12:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AqmsG+Mvl/dOdfhm/0XVj1sTKwx12L2hYh9eYN2vBpI=; b=vBLyE8B6m+sWDadResqQWgj62I
	HRSBLKnavD13bQQ1nhuAro8VXSW2MP7GSLqZ+FHbLrDH0F5J0WtV/ZmUri1SmjeeA6/EAy6kijrLa
	kCaUSEyVgyx9I9lJU+DrPmcKR3z+T+Z/1tRxfwKahf8lJ5//DGey2eq4lDjLe9Q3X+JoCRxNFQjHB
	KD/lpIL93OEaBU43ZVohYajEBZbEcYiZp4pxDxCTJ7B9+Gg9Jps2DVdjYXpMeNXBTtMiqSz7SN3DA
	t5vGXNiK33CBou4i9N50BZKh+N9kijbOjQbY7vwxEmGgVnpsP9IERK+g2nmA8mEyIdhTjIPlOYoem
	qe93FUmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdAL-0000000HJec-32bK;
	Tue, 14 Apr 2026 12:46:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCdAI-0000000HJe9-2peP;
	Tue, 14 Apr 2026 12:46:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CDA3143B30;
	Tue, 14 Apr 2026 12:46:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B10DFC19425;
	Tue, 14 Apr 2026 12:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776170809;
	bh=0xrsRx8+fhBqILy3gChyEPRzzf8cZshNTlrUxsv7RZE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s+lll3apOXZ6lUCDqv5yjMnIzo9yurD/78YpGTKuGiu5ceEmxt38X8F6eUAOQb4lK
	 w4cTDQgA1U9R+Zsn6xepiteJzeFNVxVhUQrfs1GEnM2NYOBBJuHuTm1wPE/TMigTCc
	 ciSfADwOeRtZqqQ+4iTr2y9FjwfaComoC1tgU8qG8cfdNzhsO+D/OcMwogPbSQYyLz
	 o/FLEeGhEE6EQ93hNdu3eZHQjmWjh5hXMwpL3nP6PFgaHzPO2N6XLXQBC58GHG+v0c
	 e7ceZE86pS8SNSIwm3GGq+/5WrnHoo4qlX5KX8OGUgO7rp8l+eLEYtcUVa3LWLBsIP
	 4dmVU0sH6dU9w==
From: Simon Horman <horms@kernel.org>
To: lorenzo@kernel.org
Cc: 'Simon Horman' <horms@kernel.org>,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: Wait for NPU PPE configuration to complete in airoha_ppe_offload_setup()
Date: Tue, 14 Apr 2026 13:46:41 +0100
Message-ID: <20260414124641.754059-1-horms@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260412-airoha-wait-for-npu-config-offload-setup-v1-1-f4e0aa2a5d85@kernel.org>
References: <20260412-airoha-wait-for-npu-config-offload-setup-v1-1-f4e0aa2a5d85@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_054650_797936_C0118817 
X-CRM114-Status: GOOD (  15.57  )
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

From: 'Simon Horman' <horms@kernel.org>

This is an AI-generated review of your patch. The human sending this
email has considered the AI review valid, or at least plausible.
Full review at: https://sashiko.dev
---
    net: airoha: Wait for NPU PPE configuration to complete in airoha_ppe_offload_setup()

This commit adds a poll loop in airoha_ppe_offload_setup() to wait for the NPU
PPE configuration to complete before running airoha_ppe_hw_init().

> diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
> index c2c32b6833df9..52199f6b39f9b 100644
> --- a/drivers/net/ethernet/airoha/airoha_ppe.c
> +++ b/drivers/net/ethernet/airoha/airoha_ppe.c
[ ... ]
> @@ -1340,6 +1341,13 @@ static int airoha_ppe_offload_setup(struct airoha_eth *eth)
>  	if (err)
>  		goto error_npu_put;
>  
> +	/* Wait for NPU PPE configuration to complete */
> +	err = read_poll_timeout(airoha_fe_rr, val, val, USEC_PER_MSEC,
> +				100 * USEC_PER_MSEC, false, eth,
> +				REG_PPE_PPE_FLOW_CFG(0));

If the SoC has multiple PPE instances, is it sufficient to only wait for
REG_PPE_PPE_FLOW_CFG(0)?

Later in airoha_ppe_hw_init(), the code iterates up to eth->soc->num_ppe,
initializing all available instances:

drivers/net/ethernet/airoha/airoha_ppe.c:airoha_ppe_hw_init() {
    ...
	for (i = 0; i < eth->soc->num_ppe; i++) {
		...
		airoha_fe_wr(eth, REG_PPE_TB_BASE(i),
			     ppe->foe_dma + sram_tb_size);
    ...
}

If we only poll PPE 0, could the driver race with the NPU firmware's
initialization of subsequent PPEs?

Additionally, does this poll condition properly ensure the hardware is ready?
Since the break condition is simply `val`, it exits immediately if the register
contains any non-zero value.

If the register retains a non-zero value from a previous session (like across
driver reloads), or if an unclocked domain returns 0xFFFFFFFF, this poll might
succeed immediately and bypass the wait.

Could we clear the register before polling, or wait for a specific bit instead?

> +	if (err)
> +		goto error_npu_put;
> +
>  	ppe_num_stats_entries = airoha_ppe_get_total_num_stats_entries(ppe);

