Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0664AFD45F1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 00:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M2Flp3qlVMRinKfacAMNqZWTjncnRYfexPb5LCr73SA=; b=jP85jxuJBcS0Vit7f95rKkEmwR
	74iNyWNQfTYN58uf3mMDfednCZ1kAgsz/z9ywOIc1R/nprdgJjuWBhWQNK7+L1nAL1heWfVpMJ3rE
	iyhOTIIR2ntyrsKv1wfv+z2T/kSr8VWvcqJ8ldkB4aw6pFj0DUJj1jMJBoFodCyL66rSrYHJX2gc9
	LZXnPNbdTjNwPu0NYcHBp1FCCcFPqyFPYS0IGhnt2scR6AuroTuJd5zTZdA7szljpin6PBmy3lgWb
	3olQ77t2qMfOYEqNzEq40g2hsG9JO0HZbPv0lmXoHnGdwGzRr6MvmYRLzcTtDZyphLeC+QuJL980a
	YsFGCcXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvOx8-000000057Ma-34Wb;
	Thu, 26 Feb 2026 00:10:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvOx6-000000057Lr-41g6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 00:10:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 52F0F60054;
	Thu, 26 Feb 2026 00:10:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24ADFC116D0;
	Thu, 26 Feb 2026 00:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772064600;
	bh=UNC6gF7liqity0PwGtJb8bCXoVlqBKy00R2qY08OGhA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NT91BEcnyoODiJGf4W44SGpTL2sPxRaUFcH6E3t55dq07XA9OcMzmPZtAR/a897uE
	 1aJEzTvlLKsyATQj7KY4/k9kE/v19HLUVAWDEseIhPycTsh2EyBR/tDKwOzgNsapbn
	 Jvmwd7jG4lTHDgZqJfennbAF9o0xKyYCVqkQtHp1fSnU2Uo31ew1apwwzLdPJbEfXf
	 b+yxWGIDYOcjit2mVTp5zQPte5QrJSyN2ffYjYKA1v4PMEKMxorguayI2JNU0NWmc3
	 JYdZLBAiMn0FQsjVrlZoWrz5ysoMKQnq+PrIS+yRsbbsP/3ar4yLGXHNmEZdNoIP3f
	 Usn+ucsJ3xNvA==
Date: Wed, 25 Feb 2026 16:09:58 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: <andrew+netdev@lunn.ch>, <davem@davemloft.net>, <edumazet@google.com>,
 <pabeni@redhat.com>, <danishanwar@ti.com>, <rogerq@kernel.org>,
 <horms@kernel.org>, <mwalle@kernel.org>, <nm@ti.com>, <v-singh1@ti.com>,
 <vadim.fedorenko@linux.dev>, <matthias.schiffer@ew.tq-group.com>,
 <vigneshr@ti.com>, <m-malladi@ti.com>, <jacob.e.keller@intel.com>,
 <stable@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srk@ti.com>
Subject: Re: [PATCH net 2/3] net: ethernet: ti: icssg_common: set
 irq_disabled after disabling TX IRQ
Message-ID: <20260225160958.64bbc4c5@kernel.org>
In-Reply-To: <be80263f-667c-4330-bc24-5078fe07b994@ti.com>
References: <20260220041431.372610-1-s-vadapalli@ti.com>
	<20260220041431.372610-3-s-vadapalli@ti.com>
	<20260223184840.06069afa@kernel.org>
	<57e05b57556e94ed666acd8b4c542efc28e7408b.camel@ti.com>
	<20260224154953.63b558c1@kernel.org>
	<be80263f-667c-4330-bc24-5078fe07b994@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Wed, 25 Feb 2026 17:01:31 +0530 Siddharth Vadapalli wrote:
> 	net_rx_action
> 		__napi_poll
> 			NAPI TX Handler
> 
> It does seem strange that the 'net_rx_action' leads to the NAPI TX Handler.

For historic reason rx_action runs all NAPI, it's fine.

> However, it is exactly this path that causes the warning, and it is due to
> this that we could end up in the following situation:
> 
>                  CPU0                             CPU1
>     -----------------------------      -----------------------------
> 1. TX HARD IRQ Handler entered         NAPI TX Handler is running
> 2. irq_disabled is set to true         Sees irq_disabled being true
> 3. Calls disable_irq_nosync()          Calls enable_irq()
> 4. Enters disable_irq_nosync()         [WARNING: Unbalanced enable for IRQ]

Right, but for Tx NAPI is only scheduled from the IRQ so this is not
possible. For Rx yes, AFAICT there are paths in the driver which
schedule the Rx NAPI (AF_XDP?). But Tx NAPI seemed to have only
been scheduled by IRQ. And if that's the case the NAPI can't run
until CPU0's IRQ handler calls napi_schedule().

