Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37013CA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 06:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9ay14s/9V/qQ+ANLBTM1wZMlblZsd2ot35thfa768U=; b=kU2+x/fXWX5Ube/jP4XWdoJ7OV
	zV8dDUpBywuZTZSPrf54hgzc3yRB8ANE2gKXFHdhsobsQtObj6RMKeqkfuqNaD12Lppkb9TV3kvYL
	qkYs2pag3nE6v2yimnrpiblWV04JSTl7sCWi2bSYcOAHTdA2LYxMOxyedQmhtvYB59AE68l6Lhfnt
	1uUXOEKCFzxHgpYurYKgFw0agtWKi8aSSzkKi3UPWHbyP10+OhiCNov5jJlc9VXIJ8ajXGy8P71j9
	ecFJWj+FJKZnFoX5MAsD+ur1DIgMI9angm0XhkKF8xIktFXB78wh9h93MdRl9GsVD9v2GQwoba6pN
	xKbYkhfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphuL-00000004Agm-1y4a;
	Sat, 23 Aug 2025 06:39:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upUGd-000000038U9-3IWo
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 22 Aug 2025 16:05:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Z9ay14s/9V/qQ+ANLBTM1wZMlblZsd2ot35thfa768U=; b=FodbGFI1BizrWv/cEmxSkvYeUL
	+ZU8RH2Ek6/eNViP7X9zzUnAe/o+qPJ3l/Ac3RDxfm2YkOEZaiSDdQS3trMQj9U7ydwmkuDh53zcV
	f8kz8qSpMbT8v69Pgs9kg/wCAndpupMX73O1GZMRHm0T4s7pyUa+cY5vbWfUm/i1b+AHPCGmjk2vR
	VP8L9aNcPOYR86o8OlRG/cazyFjlbrOWpHtRIMMUOIKUhhg824Ke4l5fW9DdGatwo7GwSaQ6+kMnw
	PL1pJ/Ww3mY+ac9yGVuqObq6778QcfRBYHKoakVSc4O8dxF8wtvPahp6k7Rj6tqUWqN3PNUS7Nr6Q
	mk5LDxTA==;
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upUGa-000000010xK-1pEy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 16:05:26 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e95246bd5e8so589443276.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 09:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1755878722; x=1756483522; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z9ay14s/9V/qQ+ANLBTM1wZMlblZsd2ot35thfa768U=;
        b=WsTeuTc/KZuhhIbwxyErks5OoccPH+57qhA4SPPebwhMgLEs/RXe1MRrwAgeILy7Nl
         cf9eWix7dWWmROP839zrpSZ6Sp21TyczkP/D8YIOozns0SniWPcwPlX9wnTu1cRx50Pu
         8zryjEdiQb+fBNs8j+zgUSWNWp6bq4jVZk4t1DX+buQcIluMk4I+ChqgLuZo8gs4JnP5
         ZQacvMVUUOP7/5nf3zoNpz7lliU7Hfi66SaUJoWtCTuyOlAmIGtcGjqTNhhHz+JwgKMt
         4d7irlyyqoIqjlD2bobHQ2/ohymiqJLMdfjt3EX0esyKJ/6bz1c9A4NcnlObjdTvj2vw
         U2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755878722; x=1756483522;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z9ay14s/9V/qQ+ANLBTM1wZMlblZsd2ot35thfa768U=;
        b=W6UTbeFwUv/Iva3Uxs2Be6eBcjteO+uez4rx1zT4W1Z6EPzFpWIFrfn3pn7Bw+r8vY
         Hkrk7xb5XjodXPXdRJ4QAkd1l10ukFqZttNRCVPnBeryJSMFNVzZFHqknCZz3mVU368q
         b2yfbr2bWik1TSJQZTymwy8uDkzsPxpPS50G1O6An9uIA956fizpAXakUAlY9Jfb4Iw0
         0oOOkDe4g6RtzMThzxz1YmpDn7HHm/asAgMnyEhztZrOnl05YOfNIo2+PpvYX7bOFSXF
         RmUMQrUrtguDwK0uMFOSRzWQlNtnAG3cGhcccQbyhYXtSgHL8SF6qFrVglx7cp6ekh9h
         UiDg==
X-Forwarded-Encrypted: i=1; AJvYcCWtg9Z8saYnOqt9KaLbYXTNPxYwaCJuoKWe59jWVJhCrrrVxnQ4Xn4W8i0jPmjFNf4etbAGYHLG648dRE8yBuf4@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf5fyQYJhM2TQSluYfURUoB65WPZXCsvmoxtQJkR3IjehBrvcK
	9Fpik+E8EOBhyZ2T8Uap3b6idosZTxV+M7ASALo28aKg3lXHxmhYXVQoPnCjJpPb+IN5eqwjDUl
	p+/HWMlC0iiCm+gbJr3GWZrVbUGsGq662jweMLoOq
X-Gm-Gg: ASbGncuwr7z8UxzGMgxvNSPG5RMaUzoxOHhm9tqWXI2wRpZFYk1pPbPDZmG/4Y/3JVF
	+0C6msEhUrmlbwiHZmEA9oxpHwqiDjqQzUsCxjui5zuBILNf/ynSm7JoXE9VXBlJMxCwkyNSCX0
	xwEwagxgzlRtaxxuSMXcnof4vFywO4TCcMFSzaA4hkPw22730Ibs0kB7hOOB7gZu+HOkp9UEcUT
	979pRqqeO1iz7b1
X-Google-Smtp-Source: AGHT+IHgFTGiiSlutHh4BL3I8depbE5xMZ+e6c8q12fxs01ieSpD8QPNtz+yDLXoQoUT5WYYo25pHgJxdtdfDhYXg48=
X-Received: by 2002:a05:6902:6b11:b0:e94:dac7:25a1 with SMTP id
 3f1490d57ef6-e951c3d6404mr4039931276.37.1755878721193; Fri, 22 Aug 2025
 09:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <20250820-linux_master_ti_sci_trace-v1-0-2a69c0abf55e@criticallink.com>
 <e11fd419-1095-471e-a57f-fc5ff7ce713a@ti.com>
In-Reply-To: <e11fd419-1095-471e-a57f-fc5ff7ce713a@ti.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Fri, 22 Aug 2025 12:05:08 -0400
X-Gm-Features: Ac12FXzPWOvD617AZlYm2nxRItTWDQkM1o-McCwfQKhcE5NzzuigmYKXVsFHZVI
Message-ID: <CADL8D3aR_ecr4q54cX7yfr_aDPA7NhXmLhkiHjUY9MjNZeg78Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250822_170524_689336_586D3000 
X-CRM114-Status: GOOD (  25.99  )
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

On Wed, Aug 20, 2025 at 4:04=E2=80=AFPM Andrew Davis <afd@ti.com> wrote:
>
> On 8/20/25 1:10 PM, Jonathan Cormier wrote:
> > Add trace events to help debug and measure the speed of the
> > communication channel.
> >
> > Add parsing of the messages types but I am not sure how to parse the
> > flags, since the REQ and RESP flags conflict. Left as seperate commit t=
o
>
> The REQ and RESP flags should be handled by different TRACE_EVENTs. Right
> now you only dump the content of the response messages (the ones in
> rx_callback), also tracing what is sent is just as important, so you
> might want to add slightly different ti_sci_msg_dump EVENT for the
> sending side which uses the different REQ flag parser.


Does it make sense to have seperate trace events, one that only decode
the hdrs and ones that also include the buffers?

I'm bothered by the code duplication, but am trying to convince myself
it doesn't matter.

Currently, with the above updates, if you enabled all the traces,
you'd see something like:

[15.579036] ti_sci_xfer_begin: type=3DSET_DEVICE_STATE host=3D0C seq=3D00
flags=3D00000402 status=3D0
[15.xxxxxxx] ti_sci_tx_msg_dump: type=3DSET_DEVICE_STATE host=3D0C seq=3D00
flags=3D00000402 data=3D<data>
[15.587595] ti_sci_rx_callback: type=3DSET_DEVICE_STATE host=3D0C seq=3D00
flags=3D00000002 status=3D0
[15.xxxxxxx] ti_sci_rx_msg_dump: type=3DSET_DEVICE_STATE host=3D0C seq=3D00
flags=3D00000002 data=3D<data>
[15.606135] ti_sci_xfer_end: type=3DSET_DEVICE_STATE host=3D0C seq=3D00
flags=3D00000002 status=3D0

Presumably if you were worried about timing, you'd disable the
msg_dumps, avoiding the extra memcpy's.  And if you only cared about
the data being sent, you'd only enable the msg_dumps.  Does this make
sense / is it worth the extra trace calls?

Or removing the buffer decoding in the msg_dumps, removes the duplication:

[15.579036] ti_sci_xfer_begin: type=3DSET_DEVICE_STATE host=3D0C seq=3D00
flags=3D00000402 status=3D0
[15.xxxxxxx] ti_sci_msg_dump: data=3D<data>
[15.587595] ti_sci_rx_callback: type=3DSET_DEVICE_STATE host=3D0C seq=3D00
flags=3D00000002 status=3D0
[15.xxxxxxx] ti_sci_msg_dump: data=3D<data>
[15.606135] ti_sci_xfer_end: type=3DSET_DEVICE_STATE host=3D0C seq=3D00
flags=3D00000002 status=3D0

Or do condense the trace calls so they all have the data into something lik=
e:

[15.579036] ti_sci_xfer_begin: type=3DSET_DEVICE_STATE host=3D0C seq=3D00
flags=3D00000402 status=3D0  data=3D<data>
[15.587595] ti_sci_rx_callback: type=3DSET_DEVICE_STATE host=3D0C seq=3D00
flags=3D00000002 status=3D0 data=3D<data>
[15.606135] ti_sci_xfer_end: type=3DSET_DEVICE_STATE host=3D0C seq=3D00
flags=3D00000002 status=3D0

Simplifying the code in the trace header.
>
>
> Andrew
>
> > make it easier to drop or make changes depending on comments.  The two
> > commits should squash easily.
> >
> > Nishanth Menon and Vignesh Raghavendra requested I send this patch
> > upstream.
> >
> > Signed-off-by: Jonathan Cormier <jcormier@criticallink.com>
> > ---
> > Jonathan Cormier (2):
> >        firmware: ti_sci: Add trace events
> >        firmware: ti_sci: trace: Decode message types
> >
> >   MAINTAINERS                     |   1 +
> >   drivers/firmware/Makefile       |   3 +
> >   drivers/firmware/ti_sci.c       |  11 +++
> >   drivers/firmware/ti_sci_trace.h | 146 +++++++++++++++++++++++++++++++=
+++++++++
> >   4 files changed, 161 insertions(+)
> > ---
> > base-commit: d7b8f8e20813f0179d8ef519541a3527e7661d3a
> > change-id: 20250709-linux_master_ti_sci_trace-91fd2af65dca
> >
> > Best regards,
>


--=20
Jonathan Cormier
Senior Software Engineer

Voice:  315.425.4045 x222

http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211

