Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF98AE68162
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 10:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rYiolfxhjbDL4mprNCsnlEiA/NFq4nEVHGHMHRi6dEg=; b=X9tY/r86M+bR0f5pjkQAtgEXiy
	n6n+44raG2XiwPTwPdtbUvHtM3O2Hsj4TzFm2Xw4b3Zi8kBy5hpWZ/i+zrEmzDOK+PqXYD7trIDyB
	olGpEHUHDjuISFo7FGranp3Qnv7XAKRs4/yLhQiBks/LClIeznJocLy/IjYXCViVhPuxjfehGKqm6
	de3IIGyj3ZDqD6sM/9meWhVCWwCjWknaAI6Bfl3oa4MQSempeQRENCKCeL8dVdpLhFSTzQdXpWvA7
	n4KCMDrWankUkhtvJT+mSzNMuyi3GQh/3KFP3Uqm5Xdjz0dxcFdubhiYwN0mEq8r2FzQLBe8RSSXK
	RmdJz2qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsI6w-000000080Ic-1vin;
	Tue, 17 Feb 2026 10:15:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsI6u-000000080I2-2y0G;
	Tue, 17 Feb 2026 10:15:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B1E1560130;
	Tue, 17 Feb 2026 10:15:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4F29C4CEF7;
	Tue, 17 Feb 2026 10:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771323315;
	bh=OGD8WP2U6z3wfYpBqrc79dXSrFIB1z1mQYqmiQxCRSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uUrmsjtg2NzB9GBijzWHyd5UlPbNQXVOSfa+2N4CkDQU7U3WdT/IBcnIWdw6I/b6H
	 a6M/ZpSSMAPNAoky6xNnpqZI4vIBYOkXUYalVkrwPmKVWgqPNYLwDQUDothtEJ1ttD
	 N5KYng6ICleloi6Ab8+IsMRyD86RQo9s/waKhFrL4TqhkP2kkMreFGzGq26I9bmI01
	 JKzyJUU9m//hKptt+Xr/lWAHuNbhKdYEXqRBicWGyM57oJfUFeOQBf68lDsUp+jCag
	 oXCD1H0cg9oFQ+778sztMPTxZrU1U3OSSaCSsVllU9BE2ViXUDfq/GKLR2JNodiN0n
	 xdpE7pOmhJJSg==
Date: Tue, 17 Feb 2026 11:15:08 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Koichiro Den <den@valinux.co.jp>
Cc: jingoohan1@gmail.com, mani@kernel.org, lpieralisi@kernel.org,
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com,
	heiko@sntech.de, kishon@kernel.org, jdmason@kudzu.us,
	dave.jiang@intel.com, allenbh@gmail.com, shawn.lin@rock-chips.com,
	Frank.Li@nxp.com, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, ntb@lists.linux.dev
Subject: Re: [PATCH v8 8/9] PCI: endpoint: pci-epf-test: Reuse pre-exposed
 doorbell targets
Message-ID: <aZQ_rEkzWnDeJrMe@ryzen>
References: <20260217080601.3808847-1-den@valinux.co.jp>
 <20260217080601.3808847-9-den@valinux.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217080601.3808847-9-den@valinux.co.jp>
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

Hello Koichiro,

On Tue, Feb 17, 2026 at 05:06:00PM +0900, Koichiro Den wrote:
> pci-epf-test advertises the doorbell target to the RC as a BAR number
> and an offset, and the RC rings the doorbell with a single DWORD MMIO
> write.
> 
> Some doorbell backends may report that the doorbell target is already
> exposed via a platform-owned fixed BAR (db_msg[0].bar/offset). In that
> case, reuse the pre-exposed window and do not reprogram the BAR with
> pci_epc_set_bar().
> 
> Also honor db_msg[0].irq_flags when requesting the doorbell IRQ, and
> only restore the original BAR mapping on disable if pci-epf-test
> programmed it.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Koichiro Den <den@valinux.co.jp>
> ---

(snip)

> @@ -753,22 +771,33 @@ static void pci_epf_test_enable_doorbell(struct pci_epf_test *epf_test,
>  	reg->doorbell_data = cpu_to_le32(msg->data);
>  	reg->doorbell_bar = cpu_to_le32(bar);
>  
> -	msg = &epf->db_msg[0].msg;
> -	ret = pci_epf_align_inbound_addr(epf, bar, ((u64)msg->address_hi << 32) | msg->address_lo,
> -					 &epf_test->db_bar.phys_addr, &offset);
> +	if (db->bar == NO_BAR) {
> +		ret = pci_epf_align_inbound_addr(epf, bar,
> +						 ((u64)msg->address_hi << 32) |
> +						 msg->address_lo,
> +						 &epf_test->db_bar.phys_addr,
> +						 &offset);
>  
> -	if (ret)
> -		goto err_free_irq;
> +		if (ret)
> +			goto err_free_irq;
> +	}

I tried this series on Rock5b (RK3588), and was surprised to see the doorbell
test case still failing.


> +
> +	if (size_add(offset, sizeof(u32)) > epf->bar[bar].size)
> +		goto err_doorbell_cleanup;

It turns out that this check is the reason for it still failing.

You see, for a BAR that is marked as BAR_RESERVED, pci-epf-test will not
allocate backing memory, so epf->bar[bar].size will be 0.

If I removed this check, I could get the test case to pass.

As I suggested in my previous email, perhaps this check is better suited
in pci_epf_alloc_doorbell(). (As a DWORD alignment check inside
pci_epf_alloc_doorbell(). pci_epf_alloc_doorbell() could itself return
error if the doorbell is not DWORD aligned.)

That way, you could remove this check from pci_epf_test_enable_doorbell(),
and we don't need to care about epf->bar[bar].size.


Kind regards,
Niklas

