Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F43BC02182
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 02:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NKeEWaTJEZ1J2asH6x19pyuNluVDF1tOkAmKt3SbCG4=; b=k8ttU0DbbcmZsLGlL7rJcJi3+O
	veeLC3OsVFbEa5QAQe3Oq7mYGD+VYHsvaSzlZGEAUFcNP4OFqu303Z3rrgXMnU8pat6nrcebI3oEj
	qrdWOkMK0PHwd0ZbubQk06UJvwxjj6cxoU2wxWvldjQd/VL7vpmBuygptPPcl1kfGWimwPn7jSYPW
	Smi7LZV7dcp5y3IBN8EwlZQe79rcZXiU4nDapx3NvlzpToMWfwS94R+8vJ7J2dHvuGa820thJnDRw
	O5kdn5Q+8QrCEPQXPYInRs6K2fxH3ogBDtDNrQIRYoAE7W9t8/rIbe7mewH/s/J8I76af1NJQy33p
	O18YLk1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taQMa-00000009DCM-1qkO;
	Wed, 22 Jan 2025 02:21:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taQLI-00000009D9y-1zZY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 02:19:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737512382;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NKeEWaTJEZ1J2asH6x19pyuNluVDF1tOkAmKt3SbCG4=;
	b=bUIRYr1X/ka/VPFKIJb/7aj89vYQ2c4PlyLv3oifhbPBN6lHCPPhxQ0BgvWCjdmGia8e8k
	e31F7MmHTvEoH9Wpgx6PpAwsz6mZJhDnPOiB23qJLfrimMnGMDEIlI8gSURg+sYoxbiTM4
	P/WuM6UpOhU36Pcb3PG7JuB87lUo4t0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-67-EPDWOKCuMpaxtkbnpufeoA-1; Tue, 21 Jan 2025 21:19:40 -0500
X-MC-Unique: EPDWOKCuMpaxtkbnpufeoA-1
X-Mimecast-MFC-AGG-ID: EPDWOKCuMpaxtkbnpufeoA
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b6e241d34eso870069485a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 18:19:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737512380; x=1738117180;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NKeEWaTJEZ1J2asH6x19pyuNluVDF1tOkAmKt3SbCG4=;
        b=q/yZU/QC5VVIK+2oM/RoCVOdXuImlCZI11d6dxwF+bZnioPHvzEE8xjy4XWtGMBTLV
         z9IA5bffvM+mjkCRz02buPBCmpi7Aw9AwHkvZOhykqAU8OQLWSOu33m8d5n2OVkqSNbq
         gvs8G30X6i2IHBGpw+rWlbiG9IfWK4sKpQGIt+4sFxygJCOzEQQU6OSiw+tDe9WjwU2V
         e8dMhvuggoVF/OUbIAD1DL156JckUgqXrZ9Bc95SMh5OFq6avNOCxjiaZ2PygEqGVZaI
         Gtwqh3uFNJh8LEZRQe7ihyEI382Dg8IyWSCqUiagvD/ZknhA5TTaYjE5sGVUVJBn1Mfs
         soug==
X-Forwarded-Encrypted: i=1; AJvYcCVmwbHKQhPME45qMXgFmVi/EO0ns7azu5vVHANthfXK6xaIwCvBPZoFjS+LrMc4tpzoC9Qsj4mc80P1LHBqEi78@lists.infradead.org
X-Gm-Message-State: AOJu0YyVCyFZbPBUkuMF+GzKToVljFpzfY3slSIFr95mGkVWRftyAmwP
	VmWfyEEPPPYjB2PIkAFKRRDx4CWKhR+A2WU8a2BcKL3BptkAv7PK0KzaBp90pBp306+G3GErgKZ
	hAHIhQwXxhM4nwlyHNqI5zkd7dPXWxu7o7fF7dusVgVxmow/Rf3caXuMdmONVNCsI191KbUC0
X-Gm-Gg: ASbGncsRAMPFg9VXb14qD+D6QW9pbhRdVMgst2rhRNL9VkRkqAnyrw+VqpZOd+KKyiy
	IdFTmIyhZOvyTHm3/RDxaKoV4DMUAZYJGGSVLPAIMMjrA9z6pr3xgeeNs2VaeWKIfyAKhEvsjCE
	5eSN0EES3CcGzi1DlX6YLRHHuVXRhGurCPFddVaMm+HY2leV2fcshT8lsJ/R+bOKQ5C8co3nKU6
	VCIJ+r0JbUq2UmywCt+XeoXoFvi+sQHewNqdWKlF962vNLWj26dcnYG3YSbRRnlWTGXA+x4TjSt
	aw+8ntBY/vmQb/XwK/U6/nPO3XSW7C6Gs0fqCqy28mgtCLdb8vZ6m2vx0MwcNg==
X-Received: by 2002:a05:620a:4502:b0:7b1:5089:485b with SMTP id af79cd13be357-7be632102e9mr2979975985a.3.1737512380085;
        Tue, 21 Jan 2025 18:19:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE9onwWcyrIQrU+TRJMaLSNiHmIkK3L+iFdf8eGlCFxbDM16pBrTkhh5yoEhN1H2eh1gZpTzg==
X-Received: by 2002:a05:620a:4502:b0:7b1:5089:485b with SMTP id af79cd13be357-7be632102e9mr2979973085a.3.1737512379677;
        Tue, 21 Jan 2025 18:19:39 -0800 (PST)
Received: from thinkpad-p1.localdomain (pool-174-112-193-187.cpe.net.cable.rogers.com. [174.112.193.187])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be6148055bsm617909985a.43.2025.01.21.18.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 18:19:38 -0800 (PST)
Message-ID: <5806bbd198bc4361a41e06a02f93a157bd8eb7e8.camel@redhat.com>
Subject: Re: [RFC PATCH] firmware: arm_scmi: Support mailbox transports with
 no completion IRQ
From: Radu Rendec <rrendec@redhat.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sudeep
 Holla <sudeep.holla@arm.com>
Date: Tue, 21 Jan 2025 21:19:37 -0500
In-Reply-To: <Z497vnIasuJbVarg@pluto>
References: <20250120212418.889385-1-rrendec@redhat.com>
	 <Z497vnIasuJbVarg@pluto>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gtOx8AJF5NUfK806n9w8FjOTYPYRKQ2Y9FRGHHNupjY_1737512380
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_181944_600340_7D149BF1 
X-CRM114-Status: GOOD (  48.99  )
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

Hi Cristian,

On Tue, 2025-01-21 at 10:49 +0000, Cristian Marussi wrote:
> mmm...I dont think you can do this....it is a bit tricky to explain BUT
> the optional txdone_irq in the mailbox subsystem is NOT a completion
> interrupt as intended in the SCMI world, I'll try to explain why in the
> following.
>=20
> The SCMI mailbox transport is defined by a mailbox and an associated
> shared memory area: when an SCMI client like Linux wants to send a
> message to the server it places the message in the shmem, set the
> channel BUSY bit, and rings the doorbell to alert the other side; at=20
> this point the SCMI server wakes up grab the message from the shmem,
> process it as it sees fit, places the reply back into the same shmem=20
> area, clears the channnel BUSY bit, and CAN optionally ring back the
> client with the mailbox doorbell: this completion IRQ is OPTIONAL, and,
> if missing, the client will have instead to revert to polling the well
> defined channel BUSY bit in the shmem area to know when the reply from
> the server is ready.
> The end result is that the channel is kept busy until the server has
> replied, and cannot be reused until we are sure that the reply is availab=
le
> AND that the client execution path, waiting for it, has comsumed such
> expected reply message. (or times out)
> Alternatively, even if we have this completion IRQ we can decide, client
> side, to start a polling trabnsaction and dont use the completion
> IRQ...but this is another sroty.
>=20
> Now, in the mailbox subsystem the txdone_irq, when present is meant to
> represnt a txACK IRQ, sent automatically by the mailbox controller, when
> the transmission has completed and the issued command has been read by
> the server(usually when the server clears some specific reg): it does NOT
> assure the client that the server has processed the request and that a
> reply has been placed into the shmem area, so it is not what SCMI intend
> of a completion interrupt: it is just a mere indication that the
> transmission client->server has completed in the mailbox and that the
> mailbox channel(doorbell) is now free annd available for another
> transmission.
>=20
> Indeed, such TxACK, when received by the mailbox driver causes the next
> enqueued message to be sent (i.e. the doorbell to be ring), and, while
> it is certainly useful in some other context in which you could use such
> TxACK to deduce that the channel is free and available for another
> transmission, it is not enough in the SCMI world to guarantee that the
> SCMI reply has come back and has been processed by the client.
>=20
> From another point of view, you could say that the problem is that the
> mailbox/doorbell/TxACK is only one side of the story, the other part,
> the shared memory area used for the effective message transmission, is
> unknown to the mailbox controller and in control of the SCMI stack, so
> you cannot let the mailbox subsystem decide when to queue new messages
> on the same shared memory area used for cmds and replies.
>=20
> In fact, such TxACk interrupt has no practical usage in the SCMI stack
> and it is even counterproductive to have it, since it can cause the
> client to mistakenly attempt the next transmission before the previous
> one has completed, so overwriting the in-flight reply.
> (..and our busy-looping client side on the channel BUSY bit does not
> help here...)
>=20
> The following commit, though, needed mainly for different reasons, should
> have indeed solved also the issue with mailbox controllers having a TxACK=
,
> since it introduces a global channel lock that serializes and inhibits an=
y
> further transmissions, at the SCMI layer, even on systems that has a work=
ing
> and enabled TxACK IRQ.
>=20
> commit da1642bc97c4ef67f347edcd493bd0a52f88777b (tag: scmi-fixes-6.12)
> Author: Justin Chen <justin.chen@broadcom.com>
> Date:=C2=A0=C2=A0 Mon Oct 14 09:07:17 2024 -0700
>=20
> =C2=A0=C2=A0=C2=A0 firmware: arm_scmi: Queue in scmi layer for mailbox im=
plementation
>=20
> In general, anyway, it would be even better, if possible, not to enable
> at all such txACK IRQ at the mailbox level when such a controller is used
> for SCMI: as an example, in arm_mhuv3.c, NOT even defining the txACK in
> the DT when describimng the mailbox controller does the trick.
>=20
> Did you see any specific anomaly regarding the SCMI stack when using a
> mailbox controller which provides a txACK ?
>=20
> Sorry for the not so short mail :P ... but if I am missing something
> and you are seeing anomalies, please let us know.

No need to apologize, and many thanks for taking the time to explain
everything in such detail. Much appreciated! What you explained makes
perfect sense, and now I clearly understand why the changes I proposed
would not work.

I have quite the opposite problem. I'm using a mailbox controller that
does *not* provide a txACK interrupt (or any kind of interrupt for that
matter), and the problem is that SCMI transfers do not complete because
scmi_wait_for_reply() times out.

I tracked this down to xfer->hdr.poll_completion being false, and
therefore scmi_wait_for_reply() taking the second branch, where it
calls wait_for_completion_timeout(). Looking at do_xfer(),
xfer->hdr.poll_completion is set to true if is_polling_enabled()
returns true, and one of the conditions for this to happen is that the
no_completion_irq flag in struct scmi_chan_info is set to true. But it
defaults to false, and in my case there is nothing there to set it to
true. This is what led me to the RFC patch I sent.

Even if now that you explained it I understand why the txACK interrupt
is different from the SCMI message having been processed and replied, I
still fail to understand how it's all supposed to work for the mailbox
transport case where the completion IRQ (which you said was optional)
is indeed *not* implemented.

Since xfer->hdr.poll_completion defaults to false, I looked at what
could trigger the completion that scmi_wait_for_reply() waits on, in
the case of a mailbox transport. The way it's set up is quite
convoluted but if I'm reading the code correctly:
 * core->rx_callback (in mailbox.c) is set to scmi_rx_callback()
 * chan->cl->rx_callback is set to rx_callback() (in mailbox.c)
Therefore, the (reverse) call path leading to completion would be:
complete(&xfer->done)
scmi_handle_response()
scmi_rx_callback()
rx_callback()
mbox_chan_received_data()

If I understand correctly, mbox_chan_received_data() is supposed to be
called by the mailbox provider driver when the mailbox receives data
e.g. the SCMI server rings the bell to indicate completion. But doesn't
this mean that the completion notification (through mailbox doorbell)
is expected to be implemented by default?

Now I get that the mailbox layer has no knowledge of the client layer
(SCMI in this case) and that the txACK IRQ in the mailbox layer is not
meaningful or useful to the SCMI layer. But in my (uneducated) opinion,
there should still be a way to set the no_completion_irq flag in struct
scmi_chan_info to true for the mailbox transport, for the case when the
SCMI server does not implement the completion notification. Perhaps
through the device tree?

Now it's my turn to apologize for a long email :) Hopefully it makes
sense and it's clear now what problem I'm trying to solve. Thanks again
for all the input provided so far, and I'm looking forward to some more
answers.

--=20
Best regards,
Radu


