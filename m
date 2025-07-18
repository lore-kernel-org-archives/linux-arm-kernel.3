Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CD7CC83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 14:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pVluEK1U3eqmV+53r29it31vyFIJaW+7bF7qAcKhZos=; b=RG4bgXdMp25lvGbDyD2d29Ofhx
	AwSN2R6JHe0ucjHMU+Wb8igModjbifUieglB8eKiiAp/vwJrK5OyKmcvG38dBloEQH3g5ngcrNQXc
	3PGf5gqH4yxA2t/mW8XwNB4IXF12pAz52yiNzb1trJrtlZ2N+b8J7kvDkbeJFG6e9filfTJLJL/Jz
	T730q04DMZcQLfZwcPHpltSia2o1lTuqR/bX/OXLC75txC25I44in+ii0CpGpmY16EMylDjRC6YGu
	7vQ5fWwfHKTBQMr/NBthdeKTzUM0ZP+LUvXjqgxKrdezqolWOpSNQzg1KcoOsGSCDKE8CsTIGhHCT
	1UlGv+jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucmBD-0000000CpKZ-0rtK;
	Fri, 18 Jul 2025 14:35:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucm8V-0000000Copk-2FXb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Jul 2025 14:32:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D3364A5011D;
	Fri, 18 Jul 2025 14:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BD6AC4CEEB;
	Fri, 18 Jul 2025 14:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752849150;
	bh=f+6hv450kX1gmPLqzkXJtJ1MTj1vRlxtu4IdFzoYfxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LYGK+fuyhTPtFRjfbj5ql1987bq9LEM3SyDZQXgzbffZJ7+FdZeqST20ZIwTzHRF4
	 /arw/zy1oJjP0y08SPSD6/M7P8OCBSpt2Vn0b9EyX4pTCu/tPqdT4iaUkUz/Ctwgnp
	 s6zk/LP7+InrrMYBT2ZXffoG0OWqAcnWDCFueexQk2RjW1H1Z3Lw3f3uIhAuFe+Jxd
	 bnl21QVUf9WrwUVGDWoQkXBivQPmTSXWM1MTaY0dHlwpxJXLMyB15tzLw1cn7zua2l
	 HFy/VHaQePf00V70eQvQsBODkfVw7htMTHsZ0H8mQdJgjinyk/52Fh2QWDMCLuJszY
	 isczmDj5LqSYA==
Date: Fri, 18 Jul 2025 15:32:25 +0100
From: Simon Horman <horms@kernel.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Himanshu Mittal <h-mittal1@ti.com>, netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	LKML <linux-kernel@vger.kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	MD Danish Anwar <danishanwar@ti.com>,
	Meghana Malladi <m-malladi@ti.com>, Paolo Abeni <pabeni@redhat.com>,
	prajith@ti.com, Pratheesh Gangadhar <pratheesh@ti.com>,
	Sriramakrishnan <srk@ti.com>, Roger Quadros <rogerq@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH net v3] net: ti: icssg-prueth: Fix buffer allocation for
 ICSSG
Message-ID: <20250718143225.GE2459@horms.kernel.org>
References: <20250717094220.546388-1-h-mittal1@ti.com>
 <4c677fdb-e6d6-4961-b911-78aaa28130e6@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4c677fdb-e6d6-4961-b911-78aaa28130e6@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_073231_637669_05AB7B07 
X-CRM114-Status: GOOD (  14.79  )
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

On Thu, Jul 17, 2025 at 02:56:15PM +0200, Markus Elfring wrote:
> …
> > +++ b/drivers/net/ethernet/ti/icssg/icssg_config.c
> > @@ -288,8 +288,12 @@ static int prueth_fw_offload_buffer_setup(struct prueth_emac *emac)
> >  	int i;
> >  
> >  	addr = lower_32_bits(prueth->msmcram.pa);
> > -	if (slice)
> > -		addr += PRUETH_NUM_BUF_POOLS * PRUETH_EMAC_BUF_POOL_SIZE;
> > +	if (slice) {
> > +		if (prueth->pdata.banked_ms_ram)
> > +			addr += MSMC_RAM_BANK_SIZE;
> > +		else
> > +			addr += PRUETH_SW_TOTAL_BUF_SIZE_PER_SLICE;
> > +	}
> …
> 
> Would you like to use the following code variant?
> 
> 	if (slice)
> 		addr += ( prueth->pdata.banked_ms_ram
> 			? MSMC_RAM_BANK_SIZE
> 			: PRUETH_SW_TOTAL_BUF_SIZE_PER_SLICE);
> 
> 
> Can the usage of the conditional operator be extended another bit
> (also for the function “prueth_emac_buffer_setup” for example)?

1. (Subjective) The current code seems fine to me
2. (Objective) Your suggestion features unnecessary parentheses, and
   incorrect indentation and whitespace

