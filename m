Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9C2C71135
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 03:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81KukWWzDbXEBXgXmADFWO8JGS384eKhRE9XVfMvAVE=; b=IbXHGGSFQs1rEvNBBoJ1cIoDyZ
	qS+PxAmNtMUFn2WmSlfhwHO8N3sapuIeQcz56m3h3GWzBLKkS/9I5oSOqAe82w2CECDpr5ABW3dzz
	QXhkf7V+dglGLBL505buDtQblp+rIHB5qeWIhBpI7ND9HKHmjoRdPRMA1QcbdkJekXjZJvJcgb8uR
	N5AA+Kt5s62+gDwuT3o5zEZPFyLmqu//XUDGPajEFU5QmPDE9LAJDSF7rMR7Q/diwLT2Y2IiFR1rA
	DwLynOCmIwT8tm/tmMjMne1Kqumsp1c+nprTyD0pa8HJCYexx4ZNWXejU7zqiP/58D07hDHRZwmIe
	nc99iLwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPYD2-0000000C28O-22AD;
	Thu, 12 Jun 2025 03:02:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPVQh-0000000BkYl-1UDq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 00:04:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A7B825C488F;
	Thu, 12 Jun 2025 00:02:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B320C4CEE3;
	Thu, 12 Jun 2025 00:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749686666;
	bh=chdl8KTqcIxWtQmwJA4bH1QKh2idYqYeJmh8PFK8vxc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=B5/2KZ4LKzIbYCV/9zcadAirye+IEmF41mZUQfHhcVxh4rA/Fxp9ERRj/mDlZF1LP
	 m3KVDlqWNr0HSKC+ngAL1ritfNN8ewZQVv72tAAxuHt5XKk4gj+iQcQMHkUri79mMB
	 kp8J0tjHjn/mb/KA+KyTKyLYUvGFQIbWc/DH58QSnG7lpZUA1sc7md+0cV1iykUo6f
	 YGN8fU/RLy16ULNnAd5ctjCEAjdQbJgyAjW9Y9PN3B5a8zxQFO1ARQZK++27dxQDW9
	 AD6LdhqCgKioNt8K9OjEbumpEwU+iu7kQ1xTpUEVdXIso31Vb2Vm5rJTY2vl/Xb2vH
	 lBi6UGDpUwHCQ==
Date: Wed, 11 Jun 2025 17:04:24 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Himanshu Mittal <h-mittal1@ti.com>
Cc: <pabeni@redhat.com>, <edumazet@google.com>, <davem@davemloft.net>,
 <andrew+netdev@lunn.ch>, <linux-kernel@vger.kernel.org>,
 <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <srk@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Roger Quadros
 <rogerq@kernel.org>, <danishanwar@ti.com>, <m-malladi@ti.com>,
 <pratheesh@ti.com>, <prajith@ti.com>
Subject: Re: [PATCH net-next] net: ti: icssg-prueth: Add prp offload support
 to ICSSG driver
Message-ID: <20250611170424.08e47f1a@kernel.org>
In-Reply-To: <20250610061638.62822-1-h-mittal1@ti.com>
References: <20250610061638.62822-1-h-mittal1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_170427_436264_41F6DEB3 
X-CRM114-Status: GOOD (  15.08  )
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

On Tue, 10 Jun 2025 11:46:38 +0530 Himanshu Mittal wrote:
> Add support for ICSSG PRP mode which supports offloading of:
>  - Packet duplication and PRP trailer insertion
>  - Packet duplicate discard and PRP trailer removal
> 
> Signed-off-by: Himanshu Mittal <h-mittal1@ti.com>
> ---
>  drivers/net/ethernet/ti/icssg/icssg_prueth.c | 23 +++++++++++++++++++-
>  drivers/net/ethernet/ti/icssg/icssg_prueth.h |  3 +++
>  2 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/ethernet/ti/icssg/icssg_prueth.c b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> index 86fc1278127c..65883c7851c5 100644
> --- a/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> +++ b/drivers/net/ethernet/ti/icssg/icssg_prueth.c
> @@ -138,6 +138,19 @@ static struct icssg_firmwares icssg_hsr_firmwares[] = {
>  	}
>  };
>  
> +static struct icssg_firmwares icssg_prp_firmwares[] = {
> +	{
> +		.pru = "ti-pruss/am65x-sr2-pru0-pruprp-fw.elf",
> +		.rtu = "ti-pruss/am65x-sr2-rtu0-pruprp-fw.elf",
> +		.txpru = "ti-pruss/am65x-sr2-txpru0-pruprp-fw.elf",
> +	},
> +	{
> +		.pru = "ti-pruss/am65x-sr2-pru1-pruprp-fw.elf",
> +		.rtu = "ti-pruss/am65x-sr2-rtu1-pruprp-fw.elf",
> +		.txpru = "ti-pruss/am65x-sr2-txpru1-pruprp-fw.elf",
> +	}
> +};

AFAIU your coworker is removing the static names, please wait until 
the dust is settled on that:

https://lore.kernel.org/all/20250610052501.3444441-1-danishanwar@ti.com/
-- 
pw-bot: cr

