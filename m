Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4C2DC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 11:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qWMK52sF0eRm8zfyBd6jBI4MU3618X+xXQ6ERCNq24k=; b=z2eszmHDLAU63yMSfa8OXB8K0J
	/PmW1hBdpJiXeXNGPDB5AVn+EDpU07foSuv+VfmKMA2ib/fXol/Mw8evjZ1hbIVI9baBAmazOJR3s
	++ovlBBzJowU57ZSW0SCOn0wk6xXMDDNTpDePrEnvEDXPSvBTGv532VxVjqSgoF7RdOw+dYtirfcC
	g4Mguac2FZoacICAyanOrGLG/+sJ7ceTw9GTugFIeF4HSrWcBWJKXyA95oXrulDBtN5br8B1mJZR+
	18LAgbQt8msHvjfYlLOy3NSPt4Ai/UbDlBnLGhnwtOyDyMi/dMihaj4L17ZLXLroYIZcNl4b/OgTL
	ytOBBjRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taC29-00000007hCF-1QR2;
	Tue, 21 Jan 2025 11:03:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taBpL-00000007eR1-16Pq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 10:49:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9FD32106F;
	Tue, 21 Jan 2025 02:50:12 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5EA923F66E;
	Tue, 21 Jan 2025 02:49:43 -0800 (PST)
Date: Tue, 21 Jan 2025 10:49:34 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Radu Rendec <rrendec@redhat.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>
Subject: Re: [RFC PATCH] firmware: arm_scmi: Support mailbox transports with
 no completion IRQ
Message-ID: <Z497vnIasuJbVarg@pluto>
References: <20250120212418.889385-1-rrendec@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250120212418.889385-1-rrendec@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_024947_396956_A44D71E5 
X-CRM114-Status: GOOD (  29.94  )
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

On Mon, Jan 20, 2025 at 04:24:18PM -0500, Radu Rendec wrote:
> With the introduction of no_completion_irq in struct scmi_chan_info in
> commit a690b7e6e774 ("firmware: arm_scmi: Add configurable polling mode
> for transports") it became possible to enable polling mode by default
> when the transport does not support completion interrupts.
> 

Hi Radu,

> Mailbox controllers on the other hand have a similar mechanism to
> indicate if completion interrupts are available, using the txdone_irq
> flag in struct mbox_controller. This is available since the introduction
> of the mailbox framework in commit 2b6d83e2b8b7 ("mailbox: Introduce
> framework for mailbox").
> 

mmm...I dont think you can do this....it is a bit tricky to explain BUT
the optional txdone_irq in the mailbox subsystem is NOT a completion
interrupt as intended in the SCMI world, I'll try to explain why in the
following.

The SCMI mailbox transport is defined by a mailbox and an associated
shared memory area: when an SCMI client like Linux wants to send a
message to the server it places the message in the shmem, set the
channel BUSY bit, and rings the doorbell to alert the other side; at 
this point the SCMI server wakes up grab the message from the shmem,
process it as it sees fit, places the reply back into the same shmem 
area, clears the channnel BUSY bit, and CAN optionally ring back the
client with the mailbox doorbell: this completion IRQ is OPTIONAL, and,
if missing, the client will have instead to revert to polling the well
defined channel BUSY bit in the shmem area to know when the reply from
the server is ready.
The end result is that the channel is kept busy until the server has
replied, and cannot be reused until we are sure that the reply is available
AND that the client execution path, waiting for it, has comsumed such
expected reply message. (or times out)
Alternatively, even if we have this completion IRQ we can decide, client
side, to start a polling trabnsaction and dont use the completion
IRQ...but this is another sroty.

Now, in the mailbox subsystem the txdone_irq, when present is meant to
represnt a txACK IRQ, sent automatically by the mailbox controller, when
the transmission has completed and the issued command has been read by
the server(usually when the server clears some specific reg): it does NOT
assure the client that the server has processed the request and that a
reply has been placed into the shmem area, so it is not what SCMI intend
of a completion interrupt: it is just a mere indication that the
transmission client->server has completed in the mailbox and that the
mailbox channel(doorbell) is now free annd available for another
transmission.

Indeed, such TxACK, when received by the mailbox driver causes the next
enqueued message to be sent (i.e. the doorbell to be ring), and, while
it is certainly useful in some other context in which you could use such
TxACK to deduce that the channel is free and available for another
transmission, it is not enough in the SCMI world to guarantee that the
SCMI reply has come back and has been processed by the client.

From another point of view, you could say that the problem is that the
mailbox/doorbell/TxACK is only one side of the story, the other part,
the shared memory area used for the effective message transmission, is
unknown to the mailbox controller and in control of the SCMI stack, so
you cannot let the mailbox subsystem decide when to queue new messages
on the same shared memory area used for cmds and replies.

In fact, such TxACk interrupt has no practical usage in the SCMI stack
and it is even counterproductive to have it, since it can cause the
client to mistakenly attempt the next transmission before the previous
one has completed, so overwriting the in-flight reply.
(..and our busy-looping client side on the channel BUSY bit does not
help here...)

The following commit, though, needed mainly for different reasons, should
have indeed solved also the issue with mailbox controllers having a TxACK,
since it introduces a global channel lock that serializes and inhibits any
further transmissions, at the SCMI layer, even on systems that has a working
and enabled TxACK IRQ.

commit da1642bc97c4ef67f347edcd493bd0a52f88777b (tag: scmi-fixes-6.12)
Author: Justin Chen <justin.chen@broadcom.com>
Date:   Mon Oct 14 09:07:17 2024 -0700

    firmware: arm_scmi: Queue in scmi layer for mailbox implementation

In general, anyway, it would be even better, if possible, not to enable
at all such txACK IRQ at the mailbox level when such a controller is used
for SCMI: as an example, in arm_mhuv3.c, NOT even defining the txACK in
the DT when describimng the mailbox controller does the trick.

Did you see any specific anomaly regarding the SCMI stack when using a
mailbox controller which provides a txACK ?

Sorry for the not so short mail :P ... but if I am missing something
and you are seeing anomalies, please let us know.

Thanks,
Cristian


