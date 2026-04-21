Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184A7F94CA6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 18:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oxuG4Lk/UVPUser8qOBjoYPYmzO59UJLNbni2Hd9r6k=; b=UaGf/WQK/f7tJCj800750tWj+M
	amfJtU2zl5GGbi9iZp1QkNnhuSlwRe98z8YlnOD/6cYsVRtfsVygpDmIZwxSYcSrsSIfZt6EgAez6
	QWo+yhnUoozu9uHEWZ0OfXKJZ/Vak5J/bou2MZe6u/jHxp7x83Eh17/Zr4wKbhNAJ22K0ZsMGRYF2
	2SoFRMU3jFi270o7fYY/oopu6rYr7jj/RDrvzGmsh0lvgE8UkIzC2ziiVSBiKHtbXw/hkyl43iCXS
	MFO8esj5h/9qdjbUlp1hbCZnrqXRHRSCs7bzgaTaGTONMga6dXJQKSaU312w6/B0XcQnYWoGhvtSd
	I8KGuMrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFpX-000000092dr-2v9Q;
	Tue, 21 Apr 2026 18:28:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFFpV-000000092dW-23TF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 18:28:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 223E340E21;
	Tue, 21 Apr 2026 18:28:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81DCFC2BCB0;
	Tue, 21 Apr 2026 18:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776796092;
	bh=n3dFxMKJkQu67xhbz49OLagibL5gtHF+dkwuBR5uteg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S5kgsuKxgTalvztk266gbjNGjYD49ThIX5hAUweIJvRZYCD11hJ5ZbEZWzXep5IJ1
	 zRLQIzB1nldVn1oHvvdITsCT+ZxgcJHn9ADXOPj/yJFxl/fO1mSyBpsgLwiGyANe+m
	 5KdDqVqaGsAtWFQG74e2iQSfBOypmjAMbPejHna96UNRsknNjM1LwbHnDmNGCwkYkR
	 5cncruZ5QTysqMSeBMySB1g2wsMOwpM9vgBdGFuUunJ+ZASNc6e8AKxeCUouhjXGKZ
	 kfys1uJQ3vwVupbj5rBZxRDHNPFBWAFd14VVJg03/B/VlNUaYZZIONasPcaqLonxBO
	 tc0XWwMLmoKPA==
Date: Tue, 21 Apr 2026 21:28:07 +0300
From: Jarkko Sakkinen <jarkko@kernel.org>
To: Peng Fan <peng.fan@nxp.com>
Cc: Stefan Wahren <wahrenst@gmx.net>, Peter Huewe <peterhuewe@gmx.de>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>,
	"kernel@pengutronix.de" <kernel@pengutronix.de>,
	Frank Li <frank.li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>
Subject: Re: tpm: spi: do not call blocking ops when !TASK_RUNNING; during
 shutdown
Message-ID: <aefBt9T89WDFTTtF@kernel.org>
References: <e7974d35-0d50-4742-8747-822f28915e00@gmx.net>
 <PAXPR04MB84598325136E394E0A7D94D6882C2@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <PAXPR04MB84598325136E394E0A7D94D6882C2@PAXPR04MB8459.eurprd04.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_112813_593740_2CF5E58C 
X-CRM114-Status: GOOD (  13.05  )
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

On Tue, Apr 21, 2026 at 09:04:43AM +0000, Peng Fan wrote:
> > Subject: tpm: spi: do not call blocking ops when !TASK_RUNNING;
> > during shutdown
> > 
> > Hi,
> > we use a custom i.MX93 board, which based on Phytec Phycore i.MX93
> > with a TPM connected via SPI. If I enable
> > CONFIG_DEBUG_ATOMIC_SLEEP=y in our kernel config with mainline
> > kernel 6.18.23 and reboot our board, I will get the following warning:
> > ffff0000000d8000
> 
> The issue seems at drivers/char/tpm/tpm_tis_core.c
>   94                 rc = wait_event_interruptible_timeout(*queue,                                       
>   95                         wait_for_tpm_stat_cond(chip, sts_mask, check_cancel,                        
>   96                                                &canceled),                                          
>   97                         timeout);
> 
> wait_event_interruptible_timeout set task to !TASK_RUNNING,
> but wait_for_tpm_stat_cond still calls into mutex_lock.
> 
> Regards
> Peng
> 
> > [   43.422135] Call trace:
> > [   43.424570]  __might_sleep+0x74/0x7c (P)
> > [   43.428487]  mutex_lock+0x24/0x80
> > [   43.431797]  spi_bus_lock+0x20/0x50
> > [   43.435281]  tpm_tis_spi_transfer_full+0x70/0x2c4
> > [   43.439979]  tpm_tis_spi_read_bytes+0x3c/0x48
> > [   43.444321]  tpm_tis_status+0x58/0xf8
> > [   43.447978]  wait_for_tpm_stat_cond+0x30/0x90
> > [   43.452329]  wait_for_tpm_stat+0x1cc/0x2e0
> > [   43.456419]  tpm_tis_send_data+0xdc/0x334
> > [   43.460423]  tpm_tis_send_main+0x74/0x160
> > [   43.464427]  tpm_tis_send+0xd4/0x13c
> > [   43.467998]  tpm_transmit+0xc4/0x3c4
> > [   43.471569]  tpm_transmit_cmd+0x38/0xd4
> > [   43.475399]  tpm2_shutdown+0x6c/0xa4
> > [   43.478970]  tpm_class_shutdown+0x60/0x88
> > [   43.482974]  device_shutdown+0x130/0x25c
> > [   43.486891]  kernel_restart+0x44/0xa4
> > [   43.490549]  __do_sys_reboot+0x114/0x254
> > [   43.494466]  __arm64_sys_reboot+0x24/0x30
> > [   43.498470]  invoke_syscall+0x48/0x10c
> > [   43.502214]  el0_svc_common.constprop.0+0x40/0xe0
> > [   43.506911]  do_el0_svc+0x1c/0x28
> > [   43.510222]  el0_svc+0x34/0xec
> > [   43.513273]  el0t_64_sync_handler+0xa0/0xe4
> > [   43.517441]  el0t_64_sync+0x198/0x19c
> > 
> > Best regards

On travel this week but thanks for the report. Investigating next weeek

In the meantime, patches are welcome (whcih I will review next week).

Br, Jarkko

