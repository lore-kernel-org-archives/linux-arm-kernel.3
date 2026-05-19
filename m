Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0E9CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 01:45:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o37hTeJdpPUB5NIJUvjYrF+TMdqvemrUasiCaTeIcmg=; b=2SOpbASMKOxOmr5Ws6iEvuuFPO
	2TCAjXErgMWUpXvH9RYR7bepg0QXHt1nUSADQQaSi+JFlRID36X0zqnJUPpD0SpfF3VFvOzyzO8US
	E4iJj6ZiEqhxk23HK1XFLHI9Xavp9cHAHfABEgDa6XvhMuHpbqbeyODRN/2Kz/vbtW5UN75tD981+
	u1L3K6pU+M06LGZ//7K3F21hcJNChqxSKkzTUUUl47MsisBp2+CT1iEQwcPQ+vrZB80V0Km4X2pFc
	2roh9U7iUNXs7DVTyGBlr6grSWFkAKJ4G917tTgyNqGVYorm/KYJU4ismSrPyh31LUWu+ZTRY6Mzn
	X5B0R9VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP9WC-0000000HNzA-1EGm;
	Tue, 19 May 2026 01:45:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP9W9-0000000HNyZ-3UVN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 01:45:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B9A1344527;
	Tue, 19 May 2026 01:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B597AC2BCB7;
	Tue, 19 May 2026 01:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779155108;
	bh=jWldts9FblFH1mYDzIugutl7ATve2iNQ1j1e6bLhQoM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qVcGExeea97pfo5vK6My+3vFGZ8z+8IjEdgt+PGRaznq5MiotUpDOsXOhUtPMFwmb
	 oZ8DNLP933KyTxRvRyjZL9uGx4FG9I+tB76CmurjqPLi0R6udkvrUJBCZHPO4auBx6
	 xJzOS1jsyeISCc8aecwaEf4yEwYqmKG9R4QvFORhIIX8HKv7khb3afuh2GWRJlQLtc
	 H+c9POwXWVKKL/bb+YZ/pbuDUXGZH3NT5zxJA7aw8kUaFet/Vd7lC8JQlB3tOKPU3E
	 ZKa1D68Pev6F4tT8Y4zBtfY18+i4CG+nm9dVfdInNaxiYq7YbapsnrUPBbO4zyfqa2
	 Z5485zhJZjr4A==
Date: Mon, 18 May 2026 18:45:06 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: MD Danish Anwar <danishanwar@ti.com>, Felix Maurer <fmaurer@redhat.com>,
 Luka Gejak <luka.gejak@linux.dev>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Roger Quadros <rogerq@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Meghana Malladi <m-malladi@ti.com>, Jacob Keller
 <jacob.e.keller@intel.com>, David Carlier <devnexen@gmail.com>, "Vadim
 Fedorenko" <vadim.fedorenko@linux.dev>, Kevin Hao <haokexin@gmail.com>,
 <netdev@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH net-next v2 2/2] net: ti: icssg: Add HSR and LRE PA
 statistics
Message-ID: <20260518184506.694c584e@kernel.org>
In-Reply-To: <20260514075605.850674-3-danishanwar@ti.com>
References: <20260514075605.850674-1-danishanwar@ti.com>
	<20260514075605.850674-3-danishanwar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_184509_895531_06DF4B95 
X-CRM114-Status: UNSURE (   9.67  )
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

On Thu, 14 May 2026 13:26:05 +0530 MD Danish Anwar wrote:
> Add new firmware PA statistics counters for HSR and LRE to the ethtool
> statistics exposed by the ICSSG driver.
> 
> New statistics added:
>  - FW_HSR_FWD_CHECK_FAIL_DROP: Packets dropped on the HSR forwarding path
>  - FW_HSR_HE_CHECK_FAIL_DROP: Packets dropped on the HSR host egress path
>  - FW_HSR_SKIP_HOST_DUP_DISCARD_FRAMES: Frames with duplicate discard
>    skipped
>  - FW_LRE_CNT_UNIQUE/DUPLICATE/MULTIPLE_RX: LRE duplicate detection
>    counters
>  - FW_LRE_CNT_RX/TX: LRE per-port frame counters
>  - FW_LRE_CNT_OWN_RX: Own HSR tagged frames received
>  - FW_LRE_CNT_ERRWRONGLAN: Frames with wrong LAN identifier (PRP)
> 
> Document the new HSR/LRE statistics in icssg_prueth.rst.

To an untrained eye these stats look like stuff that could 
be standardized across drivers. 

Luka, Felix, others on CC, do you think we should expose these
from HSR over netlink as "standard" offload stats different drivers 
can plug into or not worth it?

