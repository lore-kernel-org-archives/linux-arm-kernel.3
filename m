Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 439CEC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 21:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Date:Cc:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/LPip9INyx0hMxVMYz3aL9YtG8UsdvOgoYZvWEoMCXg=; b=Rg0CA1eRcbuQhXwzwaGnGD3DKx
	+NXS2VB89WdwhYHfpKGwO+7ZPe5xjIrB6Pw2pZ/oNC7kJHFsU2GHypAs5bwid7v5Y03WCRrHmK8Pl
	QeLM9neGeRaQjBvH+G3mbCznBEMJ2O+Ufm8ra084jGV+f0R8Yc/pyJ6znfT9BYxrgA9+7tinKiPf6
	0fFK5TLe5JGm5eeaxuQGd7O/t4eJSqE8g5/PXCv5t/xnt1l4XIEmbjRZfg8Dxq4mzLVFujFJ4OwFB
	OFxBweCgGtBVdhX13d0HhMW4rj34mIorLzO1Ja0aDpGbPIpbLQtBTocLx2N4zhhQ9mibID1R8veMD
	z5cGoPzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tai1D-0000000BDbw-1hh4;
	Wed, 22 Jan 2025 21:12:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tahzw-0000000BDXj-181i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 21:10:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737580251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/LPip9INyx0hMxVMYz3aL9YtG8UsdvOgoYZvWEoMCXg=;
	b=eftD0hsxmeMN10A03jHcMTfyz6K4ofjg+0PXlS7c/eQ0iYHB/sgiQ0f/0sZSIQ0/d3U5c9
	yCUJprC15+5a7F5Cl8RQ875fqTTsyEzWZhFjC6035UNhLSPWDD9A3hLc03nAPy//bMlroh
	kehyIBAakNzXQffH8nGrKhdmPEJrCyI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-447-SxDTxXaNO7e93P3Iz9I63A-1; Wed, 22 Jan 2025 16:10:49 -0500
X-MC-Unique: SxDTxXaNO7e93P3Iz9I63A-1
X-Mimecast-MFC-AGG-ID: SxDTxXaNO7e93P3Iz9I63A
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-467b19b5641so4122571cf.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Jan 2025 13:10:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737580249; x=1738185049;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/LPip9INyx0hMxVMYz3aL9YtG8UsdvOgoYZvWEoMCXg=;
        b=KqwRzKTl8MFSGr1zPywGdeYHk8+TEHxsNLTngD04IxLnPjWD+GYXpduLNv0RAZCkHd
         xnTCV8QfjmQ1b/q0WTzkSXuTohzRn5I1wLR+Ch44CggZC/DFVry2Y3MWUUrcnSDDIRs6
         X2eBlhB3oYR5AontGQO7MF7j/jQNo1ELb0lHeVh6xvtKok2fEe0xEsW1RXYtIaFsCYQd
         QMxDe3fug9BDU4LHUtx89wiGo0VhLu7qjAZKamYIV9nSPIdcpJ1maJLg62wuV0Xhg2OA
         ijzVDSiRFQgOXjZbhXTUU0iybs2BwHWmK1u+sRJBGi/WDob18Wys5qOm0apndVAcJXAD
         qsmA==
X-Forwarded-Encrypted: i=1; AJvYcCWdibhvD7IlcncgaDhZpFlYDz+agk2FOd0UfT56/ASfTg4CbBmnL8jc0Oq1w+UO9ZMAQCHv4VAwI4j8/FN2vtph@lists.infradead.org
X-Gm-Message-State: AOJu0YwhjnBnWsGQpJH8rUR9uAJh0wUZ7/TQpm4fPZnCFaIIU67ONzYx
	4a2ucwd5nKEvhiyvBnA5C/7gbBnftjVV+BL50KQDHTjdZ9YTZU5Is0/e8w7ldnCJJpxbN5xXXYa
	4ABrrR31czRVuXSvoa4GhNxkFqJj1kyKwjJ1wkl5CRoenOHzz/RtbceOKBAqX36KwJqtu7RH8
X-Gm-Gg: ASbGnctOKaQp7fJ6qZxmUi2UjAVqLqBWtVmjszSEFBtiUMTw9BpIm6eXz+05SPQ175r
	kw4CaD+0oRoJ4dGsdHCqdwXw8wRMnybvie8De/puYaDqqYFylzg0eoy2PvqF6rFaJLix63rQXz1
	DhpXEmLoavwGO0MI3hcQ5j06r7CvCbxd4m3o39zzDkj0ayTxzGiWzsCo6QfVL1oKUz73enIoI1h
	OZB4QM2wZNRgH40rYDpklulDEhS7YNmMiA9oqYQLZ0uAWNwHszapZIHfEc5BBRdjSQigo8JHTpv
	Ox/fckVSFtyHgP4BQvNkXHGkZ17fTySw+KoCgYrEPZkHQWII+IrPTYi5RVgmgA==
X-Received: by 2002:a05:622a:145:b0:467:7109:c783 with SMTP id d75a77b69052e-46e12ad54d5mr330823351cf.3.1737580249273;
        Wed, 22 Jan 2025 13:10:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEIx94YBqc4qrrHCRZNRccCQJQGXTMRVaSSjkJYJ/5qoiU2LazPB321YR2OOYrONvFimVvXCQ==
X-Received: by 2002:a05:622a:145:b0:467:7109:c783 with SMTP id d75a77b69052e-46e12ad54d5mr330822951cf.3.1737580248848;
        Wed, 22 Jan 2025 13:10:48 -0800 (PST)
Received: from thinkpad-p1.localdomain (pool-174-112-193-187.cpe.net.cable.rogers.com. [174.112.193.187])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e102ec2d9sm67756121cf.12.2025.01.22.13.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 13:10:48 -0800 (PST)
Message-ID: <4ba9c0d259e35960425ff278d20446a133853238.camel@redhat.com>
Subject: Re: [RFC PATCH] firmware: arm_scmi: Support mailbox transports with
 no completion IRQ
From: Radu Rendec <rrendec@redhat.com>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sudeep
 Holla <sudeep.holla@arm.com>
Date: Wed, 22 Jan 2025 16:10:47 -0500
In-Reply-To: <Z5DhE3-SGOP9O4NZ@pluto>
References: <20250120212418.889385-1-rrendec@redhat.com>
	 <Z497vnIasuJbVarg@pluto>
	 <5806bbd198bc4361a41e06a02f93a157bd8eb7e8.camel@redhat.com>
	 <Z5DhE3-SGOP9O4NZ@pluto>
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0NUftdzyCS7GfIu565X2d3gj8B4VbjQCl-tBmI_7Uec_1737580249
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_131052_459994_D6433579 
X-CRM114-Status: GOOD (  72.89  )
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

On Wed, 2025-01-22 at 12:14 +0000, Cristian Marussi wrote:
> On Tue, Jan 21, 2025 at 09:19:37PM -0500, Radu Rendec wrote:
>=20
> > On Tue, 2025-01-21 at 10:49 +0000, Cristian Marussi wrote:
> > > mmm...I dont think you can do this....it is a bit tricky to explain B=
UT
> > > the optional txdone_irq in the mailbox subsystem is NOT a completion
> > > interrupt as intended in the SCMI world, I'll try to explain why in t=
he
> > > following.
>=20
> [snip]
>=20
> > > Sorry for the not so short mail :P ... but if I am missing something
> > > and you are seeing anomalies, please let us know.
> >=20
> > No need to apologize, and many thanks for taking the time to explain
> > everything in such detail. Much appreciated! What you explained makes
> > perfect sense, and now I clearly understand why the changes I proposed
> > would not work.
> >=20
> > I have quite the opposite problem. I'm using a mailbox controller that
> > does *not* provide a txACK interrupt (or any kind of interrupt for that
> > matter), and the problem is that SCMI transfers do not complete because
> > scmi_wait_for_reply() times out.
>=20
> Do you mean a unidirectional mailbox controller (like ARM MHUv3) that
> allow for bidirectionality ONLY if you effectively use a pair of them,
> one for each direction ?

Yes, that's what I meant. But I had a very distorted understanding of
how that worked, and now it's much clearer after reading your email,
looking at arm,scmi.yaml and staring more at the code :) Please see
further details below.


[snip]

> > Since xfer->hdr.poll_completion defaults to false, I looked at what
> > could trigger the completion that scmi_wait_for_reply() waits on, in
> > the case of a mailbox transport. The way it's set up is quite
> > convoluted but if I'm reading the code correctly:
> > =C2=A0* core->rx_callback (in mailbox.c) is set to scmi_rx_callback()
> > =C2=A0* chan->cl->rx_callback is set to rx_callback() (in mailbox.c)
> > Therefore, the (reverse) call path leading to completion would be:
> > complete(&xfer->done)
> > scmi_handle_response()
> > scmi_rx_callback()
> > rx_callback()
> > mbox_chan_received_data()
> >=20
> > If I understand correctly, mbox_chan_received_data() is supposed to be
> > called by the mailbox provider driver when the mailbox receives data
> > e.g. the SCMI server rings the bell to indicate completion. But doesn't
> > this mean that the completion notification (through mailbox doorbell)
> > is expected to be implemented by default?
>=20
> Nope because when the SCMI client requires a polling transaction, beside
> the busy-looping on the channel BUSY bit on its side, it will also ask
> for a polling transaction by setting the proper bit in the channel flags
> (as detailed in spec chap 5.1) of the shmem area, so that the server will
> know that the completion IRQ, even if existing is NOT required for that
> transaction: in any case, polling or not, the server will clear the chann=
el
> BUSY bit when it is done, since that is the mechanism that is used by the
> client and server to pass back and forth the 'ownership' of the channel.
> [BIG RED WARNING: I never remember if the channel bit I blabbed about
> above is defined as a BUSY bit or as a FREE bit....so the logic could be
> reversed.]
>=20
> The above backtrace is only for the IRQ path...if you are polling, you
> are indeed busy looping inside scmi_wait_for_reply() and if you dont get
> a timeout (or an out of order invalid reply) the reply if picked up at
> the end of the poll loop by a fetch_reponse() inside that same
> wait_for_reply....since polling anyway is meant to pick up Delayed
> Responses OR notification that does on the P2A channel (RX in the SCMI
> stack) which needs to have an associated IRQ to work at all.
>=20
> Beside your scenario of a system lacking a completion IRQ, polling
> transactions can be asked for a speficic SCMI command at will like to
> issue a clock_enable(), so polling is generally working as far as I know
> and tested....you can easily test that also by just enaboing
> force_polling flag in the transport desc (for testing/debug purposes
> only)

I'm sorry, I didn't phrase the question very well. Polling does work as
expected, and it was clearly proven by the fact that I actually got the
SCMI communication working with the patch I sent initially - because it
was forcing the polling mode (even though the patch itself was wrong
and had no practical value).

The backtrace I mentioned is clearly for the IRQ path. What I was
getting at was that it seems to be the only way for the completion to
be completed. And since in the default configuration (with the default
flags) scmi_wait_for_reply() takes the second branch, where it waits
for that completion, it means that by default the completion IRQ needs
to exist for the kernel to know that the transfer has been replied to.

What I really meant to ask was this: does it mean that in the default
configuration (with the default flags) the completion IRQ is required?
And I think you already answered, indirectly :)

> > Now I get that the mailbox layer has no knowledge of the client layer
> > (SCMI in this case) and that the txACK IRQ in the mailbox layer is not
> > meaningful or useful to the SCMI layer. But in my (uneducated) opinion,
> > there should still be a way to set the no_completion_irq flag in struct
> > scmi_chan_info to true for the mailbox transport, for the case when the
> > SCMI server does not implement the completion notification. Perhaps
> > through the device tree?
>=20
> As I said, the flag is NOT settable, since it was a scenario that was
> never needed....but you are right.. you will have to somehow set that
> flag to handle this kind of setup.
>=20
> Now, I was hoping to be able to somehow handle this with the existing
> bindings, because if you look at 'mboxes' definition in:
>=20
> =C2=A0 Documentation/devicetree/bindings/firmware/arm,scmi.yaml
>=20
> ..you will see that we try to handle all the possible combinations of
> mailbox controller types implicitly by deducing the kind of controller
> by the combination of the number of defined shmem/mbox. (this is because
> unfortunately we cannot rely on naming for backward compatibility issue
> since mbox names was NOT required prop from the start).

That makes perfect sense, and the description in arm,scmi.yaml (which I
should have looked at in the first place) was a real eye opener. Thanks
for that!!

> So, I would have loved to be able to deduce in mailbox_chan_setup() that
> in a specific configuration there is no completion interrupt and set
> accordingly the no_completion_irq flag using the existing bindings....
>=20
> ...but seems to me that it is not possible since there is the assumption
> that unidirectional mailbox are always used in pair to provide a completi=
on
> IRQ....and we run out of possibilities to exploit this implicit info
> (again because we address the most common case with the current bindings)

True, but maybe the assumption is wrong. In the scenario I'm describing
there are 2 shmem areas and only one unidirectional mailbox for Tx. The
Rx mailbox does not exist because there is no completion IRQ, and the
only way you can implement a Rx mailbox is through an IRQ. So in theory
you could infer this configuration from a "1 mbox / 2 shmem" setup,
which is not one of the currently supported combinations. But it would
probably not scale well for the more general case.

> At the end, yes I think we should be able to describe this particular HW
> configuration somehow, so a new binding could be the answer, since this
> is exactly HW description, the tricky part would be to add something
> that can cope well with all the above existing implict combinations
> (maybe is not a great issue eh .... I have not though about it...)
>=20
> ...BUT...before all of this, just to be paranoid, I would check to make
> sure that your HW is really unidirectional in nature and not that, instea=
d,
> is a bidirectional mailbox controller, where the SCMI server is really no=
t
> taking care to ring the doorbell back ? (which usually is the same
> doorbell used in the client->server direction)

I think you nailed it. Looking at the mailbox driver implementation
(which actually has an IRQ handler that calls mbox_chan_received_data)
and the way the SCMI configuration is described in the device tree, I
think that's exactly the case. And the completion IRQ doesn't work
either because the SCMI server doesn't trigger it or there is a problem
with the IRQ plumbing along the way.

Unfortunately, because the mailboxes can be either unidirectional or
bidirectional and they are not necessarily mapped 1:1 to the SCMI
channels, it can be very confusing for the uninitiated eye (like
myself). If I had known everything I know now, it would have been
pretty obvious from the beginning that there was something wrong with
the SCMI server (or completion IRQ routing).

> (I ignore which server implementation you use...so just to make sure...)

Unfortunately the mailbox driver is not upstream (which is always a sad
thing), and that's why I didn't mention what it was. It's also based on
a 5.10.x kernel but simple enough that it compiles cleanly with the
latest upstream. With everything I have learned, now I can tell that
ironically the driver itself seems to be OK. For what it's worth, the
BSP kernel where this comes from includes an ugly hack that changes the
initialization of xfer->hdr.poll_completion to true instead of false to
force polling mode and cope with the broken completion IRQ :-/

> > Now it's my turn to apologize for a long email :) Hopefully it makes
> > sense and it's clear now what problem I'm trying to solve. Thanks again
> > for all the input provided so far, and I'm looking forward to some more
> > answers.
>=20
> ... better stop apologizing here and now, given the average payload size
> of these recent mail exchanges :P

Fair enough :) Instead, let me thank you, again, for your time and
patience, and for all the detailed information you have provided.

--=20
Best regards,
Radu


