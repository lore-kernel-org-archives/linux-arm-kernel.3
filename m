Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B36CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 13:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kHtf673Ra0gSqzgxWX4CYOP0Cr4ZHMxoc34qQIAHQDI=; b=ONWiQ80J82qlk1jBTKVaPsZOiY
	BtGCEtaiXM1rTPBTQ3IESAnyW0iFfJlOg/Mb2Evtnk2WyqYVI+o6xA0JvhU3nwHHDXN55eZWveOwT
	pssMMpwWwzOltCRGp6TwESrs8C0ZEve8PaAP420fACsoczeF7NB4x+C3VWcc+w20JTeRt40FHv4zR
	Ab+LwF8cYfsqURBRzONNvZ6ThUaY+NiN+2JEJMG5Wl0XdFugxWds66kRNIRIMMil64ciLdxBBDfxB
	yNuQFWEvM9XPue1x9cGaL9PvSkwPUSWNM7A1G/ueULMNt4LVndA0kx2IXB5wmD5sUX/q4roFXmlfj
	1oD+4FWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPh2C-00000004gfE-3njb;
	Wed, 20 May 2026 13:32:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPh2A-00000004gec-3KJo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 13:32:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 52FE840E0C;
	Wed, 20 May 2026 13:32:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8B41F000E9;
	Wed, 20 May 2026 13:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779283945;
	bh=kHtf673Ra0gSqzgxWX4CYOP0Cr4ZHMxoc34qQIAHQDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZAGNvIn/yCffLxHOfmhpMJozvEkabTF1B+G9fpbbzPnInK6JfidMtWz74dCmY3Qup
	 sO+iko6ZkMWrwO8Hlgc3/8ErXToNMXaYBZO8c4aFKdurBak+rAcuJMjXXqpTNDVMC8
	 EtlT+B/N1lP6xvvGbj96ggrYktvFg7Cpqt548Fl4U+wsWPQtytnubbhUqPosGKDj7K
	 weTRdRvdFJ45zeSv3+9X1hm9YjtnZi65WIALDrNwLoEPnSi/ztOg5MfejZnYBqjEnW
	 kT5z+uHYAE6xpGbQC0+jvsV0Vns8ipvkEwq+9eQ2dmVsYcP7VTrjlv1WCpoWi24+eH
	 dj7h8VXz9lCMg==
Date: Wed, 20 May 2026 14:32:20 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "lihuisong (C)" <lihuisong@huawei.com>
Cc: Adam Young <admiyo@os.amperecomputing.com>,
	Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>, linux-hwmon@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v02] mailbox: pcc: report errors for PCC clients
Message-ID: <20260520-optimal-nightingale-of-champagne-0bbdfe@sudeepholla>
References: <20260518193006.27425-1-admiyo@os.amperecomputing.com>
 <881ec4ba-44ce-498d-b0c4-8c1d51b13cc3@huawei.com>
 <20260519-outgoing-rough-fox-04daab@sudeepholla>
 <d719462f-3430-47c1-9b9d-1068b3c4e429@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d719462f-3430-47c1-9b9d-1068b3c4e429@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_063226_877922_173E5887 
X-CRM114-Status: GOOD (  30.56  )
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

On Wed, May 20, 2026 at 07:53:45PM +0800, lihuisong (C) wrote:
> 
> On 5/20/2026 12:25 AM, Sudeep Holla wrote:
> > On Tue, May 19, 2026 at 09:54:47PM +0800, lihuisong (C) wrote:

[...]

> > > @Sudeep, I have always had doubts about the addition of this line of code in
> > > the
> > >   commit 9c753f7c953c (mailbox: pcc: Mark Tx as complete in PCC IRQ handler).
> > > The patch seems to avoid the timeouts in the mailbox core according to its
> > > commit log.
> > > Regardless of whether the command succeeds or fails, each mbox client
> > > driver, like cppc_acpi/acpi_pcc，kunpeng_hccs and so on, is responsible to
> > > call mbox_chan_txdone() to tell mailbox core.
> > Few controller drivers do have mbox_chan_txdone(), so Tx complete is detected
> Which controller driver?

git grep mbox_chan_txdone drivers/mailbox/

> > by PCC, so not sure why you think this is not the right place to do. The irq
> Because many mbox client drivers call mbox_chan_txdone() after running
> rx_callback() in mbox_chan_received_data().

OK, but why can't the controller hide that for the clients ? What am I missing?

> These drivers doesn't set chan->cl->tx_block to true.
> It seems that the client driver having tx_block need to set
> chan->tx_complete in tx_tick().
> Do you add this code for them?

I don't quite follow you.

> > is to indicate the completion. I am confused as why you think otherwise.
> > It is defined in include/linux/mailbox_controller.h for the same reason.
> > 
> > The client drivers can you mbox_client_txdone() if they wish to as defined
> > in include/linux/mailbox_client.h
> mbox_client_txdone() is used in the case that txdone_method is
> MBOX_TXDONE_BY_ACK.

Yes and agreed.

> And mbox clinte driver using IRQ method need to use mbox_chan_txdone().

Client doesn't handle IRQ its always controller driver and client must have
no business to do that IMO.

> It seems that all the current client drivers are used in this way.
> These interface internal would verify chan->txdone_method.
> 

Yes, sounds wrong to me.

drivers/acpi/acpi_pcc.c
drivers/acpi/cppc_acpi.c
drivers/hwmon/xgene-hwmon.c
drivers/i2c/busses/i2c-xgene-slimpro.c
drivers/soc/hisilicon/kunpeng_hccs.c

It is very clear from the code in mailbox.c, mbox_client_txdone() is for
the client drivers and mbox_chan_txdone() is for the controller. We need
to fix the above list but I need to check if there is anything I am missing
to understand first. Please let me know.

> In addition, I find that you also modify the txdone_irq/poll in the commit
> 3349f800609e (mailbox: pcc: Set txdone_irq/txdone_poll based on PCCT flags).
> The txdone_method will change from MBOX_TXDONE_BY_ACK to MBOX_TXDONE_BY_POLL
> on the platform using poll mode.
> This may lead to the original mbox client driver printing exceptions in
> mbox_client_txdone.
> I haven't observed it based on the latest code yet, it's just code analysis.

Right, I do remember seeing something and wonder if I moved to
mbox_chan_txdone() in drivers/acpi/acpi_pcc.c for that reason. But if the
expectations I have mentioned are correct, then we need to fix the framework
to avoid throwing that warnings.

-- 
Regards,
Sudeep

