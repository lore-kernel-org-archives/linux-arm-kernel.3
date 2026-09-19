Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06A31C982D8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 20:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUXpSKvxxMXTUlxX9mKnAwarD3gguu6C1vrYMI6hVaI=; b=X3AmkiyQmxy9MCF0h7pYMSEONs
	xttKHWW16k0LrNV7e/s2Mv3evkFiTZW15gOs+rceGMXr5VgBrulpESMcFJXEeUF1sBXZSqq6zzb7O
	umPOTxTpqszodo/JHym74/iwOhIOqKFAZxbPP9YEAtvjR3ZVGVkyz19pJlgKfZMjDmu4ARCyCa/+v
	lvze+a/weKoJDAOIVsh0/f/GjQPZ3ET+eAxJX6PLVSv/jT3tkhvJbzWF+UWQPC2HcYNjWTayZUxHo
	HB/ljHErThSd64Z9+X2TXxNPxI2wAcwly81yXc38xPrAiClPycmtR30iPd7wwVEh7QQJd6c25citT
	ctdK03Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x81rp-0000000Gcnn-3PI7;
	Sat, 19 Sep 2026 20:41:01 +0000
Received: from mail-ej2-x10.google.com ([2a00:1450:4864:34::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x81rn-0000000GcnN-1JmF
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 20:41:00 +0000
Received: by mail-ej2-x10.google.com with SMTP id a640c23a62f3a-c254f9c60b9so123365666b.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 13:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789850456; x=1790455256; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mUXpSKvxxMXTUlxX9mKnAwarD3gguu6C1vrYMI6hVaI=;
        b=ZZ56XPkU3hBs872wj4ATTIzeDkHgr8kIMORrlOxZa4TBQcFLkY230RsxHZvZcdCmuy
         1N841LnL26Jm6Rb0tGy2L/hesIi88u+oSJsJVFK5AoQHdeSueEkgbDUYFrf20LJ6kNlL
         bKhp3+rZjQMmWcBCxC/GZnmRGnOGC8uDLtPok=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789850456; x=1790455256;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mUXpSKvxxMXTUlxX9mKnAwarD3gguu6C1vrYMI6hVaI=;
        b=0H2YR4K/qw0+ULzOxveaZewTlJqkI0/8WjRZEgw1K4gw7V32S47Ry6/ZNj4uXrtNXs
         hU8H/V0CR4DAABL7CsYbqs4+jNerm86FN/E+WQvr5H8EEL5ffHpGIoN+LaPF6+o9e337
         PCOy4ytDPQareDrXDhUn9gfxLTGpe5VIBxib6s2g8kVLvSeSDQRxry/euHKI4haUTurr
         6dev1RvcpNUc9Et/olUMBN9u+b22kP3U/cgz/NeTbApYzVRr9QpTfQcuMhnv++8GnNaI
         rl3ZV1H8yYHfYs4Mf0ztYwt20XcUuqLrdIPoyCVGayb4TGWZzhogmtwYeCdPG/qVv+g9
         u3dw==
X-Forwarded-Encrypted: i=1; AKwUvBz6va83Mp05qjzhAvp5DWw+dkT1fgqo0YvuUtVs4xwwv2up6aVIFmsJlWGl+1r+apIb7R3D8/YRkHqFP2rp/ncS@lists.infradead.org
X-Gm-Message-State: AFuF++lGR69v0YE11D94Prx+OZx/lUmRsHMEuvTxecdyDqPJsmxFvlEF
	aqMmyLObqXSpaxGDJL8phZrhaaCs2Y1fTMmSsPb+4EaiIwRFSkptjfrQ7aK/IKrTIKTXaUmzgW9
	oRxU=
X-Gm-Gg: AYBFou185FbYkff69NJSdBffzXCsGrB8WtL6sfs43WtvXeYwTf/cnVzGpJJQP4vGuQu
	5v7d3U4VGCkjYtDCWasDgnzornqUl/yKO6bsrHCW24J9y6ubkinKbRDIopjtKUmrcI1FPBqdfco
	ds5zWnRHduN2pqwkdX3MUQ73jFFkk7wc4xu69MSY7A3PxHH31eSidQCbR/TxfsOCR6CPfizlZoT
	LMVKrNh4Q5KT5MN/84aW6Q1VO/O/lpVn6QIas8513HdSjU56IXTWJzZ/r4HJ8T4X7B75jTC8zHA
	hEMHZSO2J089SCji+NICpZ/vcqMYx6R/7lMdT9L3QWOm0lCqmwGIoVmpnjwkXLLoZz+N3LR3OXV
	cMo94BWT0UeWxYg2Mq2HOQt4dd/aP3kBfusyh+d9oasxl2YAPPeDdAcWEdcoEmGiQw80ZwbUk/I
	Y1s/Eg9AC38Ba04NOy/mukv5L61JHrEJLR6854Ncijqufe1BH4bplCs5Du/bfcogttlMAfiA44+
	3ERSQNlY534UOtlQ4D1EB8ck1baWuan8/uF7g==
X-Received: by 2002:a17:907:e895:b0:c29:d0a8:79d3 with SMTP id a640c23a62f3a-c2a16555ca6mr545714766b.14.1789850456483;
        Sat, 19 Sep 2026 13:40:56 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2a39dc971esm103383866b.22.2026.09.19.13.40.53
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 19 Sep 2026 13:40:53 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4843e397f74so806934f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 19 Sep 2026 13:40:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxe0KWBF7v5n+m3ly2g3oHPmKo24FXRVK4WC90OmFg0sTcpTy5UwiFSngbfkCRyOJJFtmynlukvny7FOFTUBRoW@lists.infradead.org
X-Received: by 2002:a05:6000:4715:b0:486:62c9:5452 with SMTP id
 ffacd0b85a97d-48713c72068mr16983654f8f.28.1789850452608; Sat, 19 Sep 2026
 13:40:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid>
 <CABb+yY3_xBvQVFHEs=v39u7+TLjJRaVv3sg5pGgd0YxCruZ8Tw@mail.gmail.com>
 <CAD=FV=X-fAJp=EG_yTAg+QQgNYRCt25947oHGHZuq-FEyirK0g@mail.gmail.com>
 <CABb+yY2CH5A1ixfX9czgtEwsP95FN-2JVzN_wmRDRNsSuZY5PQ@mail.gmail.com>
 <CAD=FV=XiguzS7nH1sE=BkXt+7G6-hhqyz5u3sjc4zAA9H7KqJg@mail.gmail.com> <CABb+yY2_AvcnaTDmpL8gP4H2_Pp3HddrtNr5gvL4GCW2DPPvOw@mail.gmail.com>
In-Reply-To: <CABb+yY2_AvcnaTDmpL8gP4H2_Pp3HddrtNr5gvL4GCW2DPPvOw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 19 Sep 2026 13:40:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VzJCb1nz+q5EZ33G5U6KZM_tXi8snL=KbUM3C5yymG4g@mail.gmail.com>
X-Gm-Features: AcwNN1XDU4cFXhN4eMaor0t2u3bfL215FENEBSC357QMe8ArSAuq8YdwUeQd-HA
Message-ID: <CAD=FV=VzJCb1nz+q5EZ33G5U6KZM_tXi8snL=KbUM3C5yymG4g@mail.gmail.com>
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox driver
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_134059_425512_127DD0BD 
X-CRM114-Status: GOOD (  40.05  )
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

Hi,

On Sat, Sep 19, 2026 at 11:32=E2=80=AFAM Jassi Brar <jassisinghbrar@gmail.c=
om> wrote:
>
> On Wed, Sep 9, 2026 at 11:57=E2=80=AFAM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > > I am suggesting to consider TX-Is-Done when send_data() returns, i.e
> > > tx submitted is seen as transferred. You anyway  don't catch
> > > transmission errors. That way you fill all slots without blocking on
> > > the first message and achieve this same throughput.
> > > Without knowing the clients I am not sure if that can't be done.
> >
> > We need to know the txdone and thus we can't do what you're proposing.
> > In general, queuing mailboxes are used in cases where the remote side
> > enables a resource like a clock or power domain. Different tasks in
> > the system may independently turn on/off these resources, so allowing
> > them to work "in parallel" makes sense
> >
> It will still work in parallel - you still keep writing to the h/w
> fifo without waiting for previous ones to finish as long as there is
> space. Just like you get here.
>
> . ...but each task needs to know
> > for sure when its resource is finished turning on. If we just imagine
> > 3 clocks we want to turn on.
> >
> > clk_enable(clk_a)
> > clk_enable(clk_b)
> > clk_enable(clk_c)
> >
> > Those 3 calls can be made in 3 different contexts from 3 different
> > drivers. We want all 3 enables happening in parallel with each other
> > (not one after another), but each call needs to know when its function
> > is done.
> >
> I don't see why not?  The three requests will be queued into h/w fifo
> in the order they arrive without any block - just as you do now.
>
> Btw, if you mean they need to be enabled in parallel literally, they
> should not be called from three different drivers. Instead they should
> be modelled as one "composite" clock.
>
> > Does that make sense?
> >
> The usage makes sense but I still don't see why existing api can't work.

I must be missing something because I don't see how the existing API
can work. Let me explain in more detail and maybe you can tell me what
I've got wrong.

Imagine we have three clocks: They are: "clk_i2c1", "clk_i2c2", and
"clk_spi". The "clk_i2c1" needs to be turned on when we're going to
start an I2C transfer on I2C bus 1. "clk_i2c2" is the same but for the
I2C bus 2. "clk_spi" needs to be turned on when we want to start a a
SPI transfer.

In the i2c/spi drivers, we've got "clk_prepare(clk)" calls to turn on
the clocks. The three clocks are operated independently by their
respective users. An I2C or SPI transfer may take place at any time.
The I2C and SPI drivers need to know for sure when the clock has
finished enabling because as soon as the clk_prepare() calls return
they will start transferring.

All three clocks are backed by a single clock driver. We'll call it
the "clk_mailbox" driver. The "clk_mailbox" driver takes the request
to turn on the clock and encodes it as a mailbox message to a remote
processor. Let's imagine that the mailbox message looks like a 2-word
transfer. The first word contains a 0 or a 1 for enable/disable and
the second word contains the ID of the clock: 0 for "clk_i2c1", 1 for
"clk_i2c2", and 2 for "clk_i3c3".

Now, imagine that we want to turn on all three clocks simultaneously.
The "clk_mailbox" driver will see 3 calls to turn on the clocks and it
needs to convert those to messages to send the remote processor. It
will then call mbox_send_message() to queue those messages with the
mailbox controller. In other words, we'll see these three calls happen
nearly simultaneously:

mbox_send_message(chan, &{0x1, 0x0});
mbox_send_message(chan, &{0x1, 0x1});
mbox_send_message(chan, &{0x1, 0x2});

The LGA mailbox controller knows "txdone". That is, when the remote
processor "acks" a message, the LGA mailbox controller can tell (and
get an interrupt). This "ack" signals that the clock has finished
enabling. This means that the "clk_mailbox" cannot run the state
machine and it can't call "txdone" itself.

Without my patches, when the above 3 mbox_send_message() calls are
made, the first one will go straight to the LGA mailbox controller and
the second two will be queued up. Once the "txdone" for the first
message arrives, we'll queue the second message. Once the "txdone" for
the second message arrives, we'll queue the third message. This means
that the messages are not being processed simultaneously. The third
clk_prepare() call will be processed much more slowly since it has to
wait in line. If we had 10 clocks enabling at the same time, the 10th
clock could have a pretty significant wait.

With my patches, the LGA mailbox controller is given the second and
third message even though the first message isn't done yet. The LGA
mailbox controller can queue the second and third messages even though
the txdone for the first message hasn't arrived yet. If things are
fast enough, all three messages can be queued up before the remote
processor has even started processing the first one. The remote
processor can process all three messages concurrently and acknowledge
all three at once. The LGA mailbox controller can get a single
interrupt representing all three "txdone" ACKs and call "txdone" for
all three messages simultaneously.

Does the above example make sense? Can you explain how I could make
things work without changing the mailbox core?

-Doug

