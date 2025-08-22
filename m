Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F0CECA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VAVbxvKFmubmCFIV/MmqSVaMXCvHJLOw/8uDYKGFsdk=; b=VpQixJvaCUmvfCN1B60wPpewaF
	AJEidx3AsM6JQt3fk/vgXyemQ27SJyq+dRaBtA0fKjYN9S+4lId1LKO8N1QAl6TmYyz+5pjyIzXfX
	i4gZdFUYJwyerfxjd7g/tCzjHRY+2EmJP18pY51tHFQig5DgFiYbCdZY1WkXetjxrMatBreItbOUH
	p2GSMPnul7DPPKzRbWIJJ46LRX1ZjzpuHrmuJOyqyw7SluH4A4cBF2bXYQr8jnHb2sE/BXCeRDKjG
	9N+2rnlA3JR3FQzO9hQhZiN1bsROfggLGT23hfkFss44NLV1Bz/A+nH55/Nq+LbUaSxmkVjFuCkkO
	v/Y5oiKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphxa-00000004EtJ-336h;
	Sat, 23 Aug 2025 06:42:42 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upWWs-00000003JT1-43Jv
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 18:30:24 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-e94f7232b30so2513821276.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 11:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1755887421; x=1756492221; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VAVbxvKFmubmCFIV/MmqSVaMXCvHJLOw/8uDYKGFsdk=;
        b=OfJceEC0Q5DupP0L3hbn8Gak+bEE7g2H3NqT0fuNVRmouXTKRxLQ+E2hyFjoIqt30y
         wm7mkXXE1mkThASIVCB/cm+BTSf4wSNLQed2JFKqcB+hYYVin+/w/bZnvdE/nnlVZ3z5
         zYyIR7J3SUIb7uhsxxbh44ZPswF8MreGnp9yuD4LgeIeVXacvdSwwoei+dzQxjhlkD9L
         rzEUPk9isd+Tj0u54jG+0uPEK9kl+onAEZz7pHp7VXl5LlUoTXCcqyoO8cHnuwUvRJl8
         5GA8/AvyZ/zSWJXOSWH46WBzbdHTGDm5S61JWcJJnhW0IiDbHw7wDf3xiOqjCSD+a/ha
         0GPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755887421; x=1756492221;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VAVbxvKFmubmCFIV/MmqSVaMXCvHJLOw/8uDYKGFsdk=;
        b=qJeXQvt63NUn84J4p0ws0pNQ8UHWk09P2hpUMq5hN92P9c+qzafyhCOeCkWBIcndLh
         BXFZ1C3QLKWxYSGFn6UdS5f3WZ2fQMoj1DwKvXDc1PcvMPt8XCIArm8uVbCv9SLFUpic
         MdW1J+k6GgVDeLcZ1FM+zh9rqZw6w0pabxZJ2iEC0Adv0JWPOfnwgtOnUM0FqZUOeNgh
         N00/YKWNXJn2K2pfon9yRAYqoMlNROPHK1ptr0Nv1d6TSxx6f6+3+ZVGgBTa958nxxUD
         21RM7PMtxBI9rs/IK/uvDLSTblf2XYNG5Q2L3E8GqgxFoQ50CtTZD7PTno5UIzGWlCO5
         LiUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRl+9gnrQkgsMpsLd0cUBwIiucQWBTFbgW2uWWgwST7jxvA36huaEjAw1a42LUmpmZ2SMKcvrL8tJfLYGbCAMX@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7CkWW5+kOzivQosssBbIOJFy3VclA6FgB98zqs8BdLXuIrZiU
	Mib1cfnyIM/9BePYDXss/NwwQYGDSGTGjNOINa6Wb4lnjXzJX8mmW56ZRySfECMeSURt+wqwVxL
	MuL97wV5IDzR+yNKnCYJEg0uLhVSvYQ7exNSrBugw
X-Gm-Gg: ASbGncshyrNGzeiMEp0uvbJp5d8yJRxhuS6H7dSrO550CzD+E94Fw4FsIOCjywZbUZx
	dh5xstNvWuUOFS4quJaYjUeKOeKiFDKF+9YLOv0lxgpiXqCnERfnPzri9dS2u+Mz7caLJPnEqFR
	Tf6oQ17KTYPfuPAdd51ocdZpR4TliKar3IkZ3Bf4KJIixWqKJCBXxL8VVhS9EJ2ND7A5klaHNlU
	9rO5FIcdX9R5xmR
X-Google-Smtp-Source: AGHT+IFpulQoP2yus1YpJjiAq8SECqslg0G79YGF/MlaiCfrGmAd1Wfa+eDPH6ROAf0AXOkQJfJYAMY5NjQ+s8WZELw=
X-Received: by 2002:a05:6902:1285:b0:e8f:e526:fda9 with SMTP id
 3f1490d57ef6-e951c23d0femr4833724276.22.1755887421462; Fri, 22 Aug 2025
 11:30:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250820-linux_master_ti_sci_trace-v1-0-2a69c0abf55e@criticallink.com>
 <e11fd419-1095-471e-a57f-fc5ff7ce713a@ti.com> <CADL8D3aR_ecr4q54cX7yfr_aDPA7NhXmLhkiHjUY9MjNZeg78Q@mail.gmail.com>
 <c05c0a13-e7af-4fc0-9363-b629b2c48201@ti.com>
In-Reply-To: <c05c0a13-e7af-4fc0-9363-b629b2c48201@ti.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Fri, 22 Aug 2025 14:30:09 -0400
X-Gm-Features: Ac12FXwko-lHWrKeX_HXwKQRgoNpj8lFRexnA4jkRYcVCsmVQHRfYtBjR82Lv-o
Message-ID: <CADL8D3aMOcuWY+5wy92Vvd=WK4kgOiSz2z+OEoUtwL_6Z8CDVw@mail.gmail.com>
Subject: Re: [PATCH 0/2] PATCH: firmware: ti_sci: Add trace events to TI SCI
To: Andrew Davis <afd@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Vignesh Raghavendra <vigneshr@ti.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_113023_006654_3DDD87BC 
X-CRM114-Status: GOOD (  41.28  )
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

On Fri, Aug 22, 2025 at 1:39=E2=80=AFPM Andrew Davis <afd@ti.com> wrote:
>
> On 8/22/25 11:05 AM, Jon Cormier wrote:
> > On Wed, Aug 20, 2025 at 4:04=E2=80=AFPM Andrew Davis <afd@ti.com> wrote=
:
> >>
> >> On 8/20/25 1:10 PM, Jonathan Cormier wrote:
> >>> Add trace events to help debug and measure the speed of the
> >>> communication channel.
> >>>
> >>> Add parsing of the messages types but I am not sure how to parse the
> >>> flags, since the REQ and RESP flags conflict. Left as seperate commit=
 to
> >>
> >> The REQ and RESP flags should be handled by different TRACE_EVENTs. Ri=
ght
> >> now you only dump the content of the response messages (the ones in
> >> rx_callback), also tracing what is sent is just as important, so you
> >> might want to add slightly different ti_sci_msg_dump EVENT for the
> >> sending side which uses the different REQ flag parser.
> >
> >
> > Does it make sense to have seperate trace events, one that only decode
> > the hdrs and ones that also include the buffers?
> >
> > I'm bothered by the code duplication, but am trying to convince myself
> > it doesn't matter.
> >
> > Currently, with the above updates, if you enabled all the traces,
> > you'd see something like:
> >
> > [15.579036] ti_sci_xfer_begin: type=3DSET_DEVICE_STATE host=3D0C seq=3D=
00
> > flags=3D00000402 status=3D0
> > [15.xxxxxxx] ti_sci_tx_msg_dump: type=3DSET_DEVICE_STATE host=3D0C seq=
=3D00
> > flags=3D00000402 data=3D<data>
> > [15.587595] ti_sci_rx_callback: type=3DSET_DEVICE_STATE host=3D0C seq=
=3D00
> > flags=3D00000002 status=3D0
> > [15.xxxxxxx] ti_sci_rx_msg_dump: type=3DSET_DEVICE_STATE host=3D0C seq=
=3D00
> > flags=3D00000002 data=3D<data>
> > [15.606135] ti_sci_xfer_end: type=3DSET_DEVICE_STATE host=3D0C seq=3D00
> > flags=3D00000002 status=3D0
> >
> > Presumably if you were worried about timing, you'd disable the
> > msg_dumps, avoiding the extra memcpy's.  And if you only cared about
> > the data being sent, you'd only enable the msg_dumps.  Does this make
> > sense / is it worth the extra trace calls?
> >
> > Or removing the buffer decoding in the msg_dumps, removes the duplicati=
on:
> >
> > [15.579036] ti_sci_xfer_begin: type=3DSET_DEVICE_STATE host=3D0C seq=3D=
00
> > flags=3D00000402 status=3D0
> > [15.xxxxxxx] ti_sci_msg_dump: data=3D<data>
> > [15.587595] ti_sci_rx_callback: type=3DSET_DEVICE_STATE host=3D0C seq=
=3D00
> > flags=3D00000002 status=3D0
> > [15.xxxxxxx] ti_sci_msg_dump: data=3D<data>
> > [15.606135] ti_sci_xfer_end: type=3DSET_DEVICE_STATE host=3D0C seq=3D00
> > flags=3D00000002 status=3D0
> >
>
> I like this one ^^^ but I'd also just remove the `ti_sci_rx_callback`

Sounds good
>
> trace, the contents would always be the same as `ti_sci_xfer_end`.


So in TI's 6.12 branch, there is a response_expected variable which
skips waiting for a response message. Indicating that there won't
always be a rx buffer.  If I keep the rx_callback scheme, it cleanly
handles both cases without changes.
However if I change xfer_end to track the rx buffer, sometimes it
won't have a header to parse. Or sometimes it will use the TX header
and sometimes it would be the RX header, which would be confusing.

I could keep and move the ti_sci_rx_callback trace into ti_sci_do_xfer
(-> ti_sci_xfer_rx), right after the completion and timeout check.
This would keep all the tracing in this one function, though if
someone wanted to know if there is lost time in waiting on the
completion it wouldn't be tracked.

https://lore.kernel.org/all/20241220114118.uwi5bsefxnue46re@lcpd911/
>
>
> This way you have two sets of symmetrical trace events, a "begin" and "en=
d"
> that can be used for timing measurements, and a dump message for "send" a=
nd
> "receive" that would help with debugging based on the message contents.
>
> As for the code duplication in the send/receive traces, I'm not sure
> what can be done, these trace macros already confuse me enough without
> trying to optimize them :)
>
> Andrew
>
> > Or do condense the trace calls so they all have the data into something=
 like:
> >
> > [15.579036] ti_sci_xfer_begin: type=3DSET_DEVICE_STATE host=3D0C seq=3D=
00
> > flags=3D00000402 status=3D0  data=3D<data>
> > [15.587595] ti_sci_rx_callback: type=3DSET_DEVICE_STATE host=3D0C seq=
=3D00
> > flags=3D00000002 status=3D0 data=3D<data>
> > [15.606135] ti_sci_xfer_end: type=3DSET_DEVICE_STATE host=3D0C seq=3D00
> > flags=3D00000002 status=3D0
> >
> > Simplifying the code in the trace header.
> >>
> >>
> >> Andrew
> >>
> >>> make it easier to drop or make changes depending on comments.  The tw=
o
> >>> commits should squash easily.
> >>>
> >>> Nishanth Menon and Vignesh Raghavendra requested I send this patch
> >>> upstream.
> >>>
> >>> Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
> >>> ---
> >>> Jonathan Cormier (2):
> >>>         firmware: ti_sci: Add trace events
> >>>         firmware: ti_sci: trace: Decode message types
> >>>
> >>>    MAINTAINERS                     |   1 +
> >>>    drivers/firmware/Makefile       |   3 +
> >>>    drivers/firmware/ti_sci.c       |  11 +++
> >>>    drivers/firmware/ti_sci_trace.h | 146 ++++++++++++++++++++++++++++=
++++++++++++
> >>>    4 files changed, 161 insertions(+)
> >>> ---
> >>> base-commit: d7b8f8e20813f0179d8ef519541a3527e7661d3a
> >>> change-id: 20250709-linux_master_ti_sci_trace-91fd2af65dca
> >>>
> >>> Best regards,
> >>
> >
> >
>


--=20
Jonathan Cormier
Senior Software Engineer

Voice:  315.425.4045 x222

http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211

