Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CECBCA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 19:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:CC:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yuYVRHkjQSXxtY5PGvaVjEk/72C4cKvfw/d4QxxNOjg=; b=tAqsOCQxe7hp/yUfjXJI4Ow5+J
	drJARL/9Vr7Tb3mM/XZc8gwqbSpuRZ2RbvT8+zDLPkZhprYLoULMwvolVa5Kf46TesHbWcrHm/HdN
	d7GK4G9Mep0cKZ1xbl82ZTvijylzg3GzvgZHtDayzr0GcSNAAY0bStCsRlddOHV9YkTtjSyMYU01v
	89hzbi8H64E1QWzgJf9Huc4fM913Ie0bbjAXbiod717rYBKYLINuq3/MfRef3b1lT7suRxrZ03rZY
	PP2oRAkxrnWkpfUErtSpFZspmIvWQxoxQW9r8PJY7DB7VfI4n5/LxN/Le4rmCfj3e5LWNik6ZwWbw
	oMbWDkgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEWtN-00000002zmm-17KM;
	Wed, 07 Oct 2026 19:01:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEWtJ-00000002zmM-0JLB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 19:01:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1791399685; x=1822935685;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=r9/UkX5qkfP9xquwLYCEm1mWZnTtMuFJtqI0Xc95j7U=;
  b=nC0fnplivNQA8Zum5aN7iSflVwrxYxchrHOiXU9cfynBXpG3tN6gIaA2
   hiVztBJOO4OQlnl5PeWY5qA15apFcG1dK0oTzJ5BbdSAaBTMk5OCrWUHw
   gu1CrIkR+rJh7Wly0Fv69ApNfpt2ncVmGJrgH3bP2FkcCgHbXTtbchG1W
   hGJ53XTFnMawBf0VGX8QbNl8Vto7tQdyLOtLQ3PwmdaU2lfUXCKWj7N8u
   W4Ud6eewpiK9M11Ojfmb/Wg3aqqyuKHBFX7K+I71Bxg8YbF2nvPbMtw56
   xHVBoU2HGSi3mCvpqnhX2EPmUy7ab8wZIFTwjRtUnp1emYQN0NeaGGidL
   g==;
X-CSE-ConnectionGUID: UUpgY4nlTj+ccujAnzQp7g==
X-CSE-MsgGUID: GsXw/hrGS5+RY26hXJvliQ==
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="63773922"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 07 Oct 2026 12:01:24 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 7 Oct 2026 12:01:23 -0700
Received: from DEN-DL-M70577 (10.10.85.11) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 7 Oct 2026 12:01:21 -0700
Date: Wed, 7 Oct 2026 21:01:20 +0200
From: Daniel Machon <daniel.machon@microchip.com>
To: Sagi Maimon <maimon.sagi@gmail.com>
CC: <netdev@vger.kernel.org>, <kuba@kernel.org>, <pabeni@redhat.com>,
	<suraj.gupta2@amd.com>, <radhey.shyam.pandey@amd.com>,
	<michal.simek@amd.com>, <andrew+netdev@lunn.ch>, <davem@davemloft.net>,
	<edumazet@google.com>, <robert.hancock@calian.com>,
	<sean.anderson@linux.dev>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net v5] net: axienet: do not report TX completions as
 NAPI work
Message-ID: <20261007190120.ne5xjp5rhvsbezjv@DEN-DL-M70577>
References: <20261004065930.1004953-1-maimon.sagi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20261004065930.1004953-1-maimon.sagi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_120125_139735_82510420 
X-CRM114-Status: GOOD (  16.25  )
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

> axienet_tx_poll() reclaims every completed TX descriptor in one pass:
> it passes lp->tx_bd_num to axienet_free_tx_chain() as the descriptor
> limit, and @budget is only used as the napi_consume_skb() bulk-free
> hint.  It then returns the number of packets reclaimed, which is bounded
> by the ring size rather than by the budget, so the poll can report more
> work than it was given.  This was seen after TX completion interrupts
> had not been taken for a while and a full ring was reclaimed at once:
> 
>   eth0: NAPI poll function axienet_tx_poll+0x0/0x180 [xilinx_emac]
>         returned 96, exceeding its budget of 64.
> 
> netpoll is affected as well.  poll_one_napi() polls with a budget of 0
> to reclaim the TX path only, and warns once if any work is reported.
> 
> TX completions are not budgeted work: Documentation/networking/napi.rst
> lets a poll process any number of them.  Do as bcmgenet does since
> commit a58cdf56b6eb ("net: bcmgenet: complete Tx NAPI after one reclaim
> pass"): reclaim the ring, complete NAPI with no work done, re-enable the
> TX completion interrupt and return 0.  Re-enabling the interrupt raises
> it straight away if more completions are already pending, so none is
> left behind.  This also drops the extra poll that used to follow a full
> budget's worth of completions, which only found an empty ring.
> 
> netpoll polls with a budget of 0 and must not complete NAPI, so skip
> the completion then; napi_complete_done() refuses it in that case
> anyway.

Reviewed-by: Daniel Machon <daniel.machon@microchip.com>


