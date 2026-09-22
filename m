Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8185DC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 00:11:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Gr7FFBApV4XH6jYqrgqIyc8MK/Sktc4ULtEkmcVSaY=; b=G0jV3YX4AaV4e2ekli38Bt02Yn
	NOKhNytJA0DrqcltDHVQJtYUvkeLVeCg9BYKUhzOZQDvtxwQSUJ6RP2GT2UncMRbRvE7Q4xTTIrHa
	8eyJsoEgOvAQLMKoQCZ7HXXm+NN9zxiRJvGMnC8s71l1clhPwhKFU1Huw1rUqFyUh+n4LeZdLC1cc
	VRs6qJAAYoioqNHFExVq/gn8lKq3Hz4lpxdrsEGH17EbPlvUzRqIvrkM8jnQJjwlSjIN6nR4HtWW1
	j6mIfbNVzMARc/69bokrbeYRb7KLW0JGQx/C3la70DN8HgksnhHtYdRXG3cT5wN0kSNJgG1KYAEr2
	69gTqvvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8o6U-00000003lMi-0zwX;
	Tue, 22 Sep 2026 00:11:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8o6T-00000003lMb-2LFj
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 00:11:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2Gr7FFBApV4XH6jYqrgqIyc8MK/Sktc4ULtEkmcVSaY=; b=LzIVYO9WLcDaMT9Cff0bHKTPz8
	cudERgnoRI4BYZGS+f+xtDzny8SeRZcC7IKHvTKhomQfhtnnqV6TjCNGcgiMb2hmaHFPqJzdeFHFt
	a24KaiMYm21ki/zHs3SnRJh38lz5DFBXesBcXjEUtBNq6xCa8zb9iBSYzImzdmJ/y0h6hAy5cunEk
	LLskW17DCW3abC2NZf/AX5oUIOnIlfAIBeWdsqEoBNtfSJYPDW3cxFbv0ypFjFw91GF53x62qFAfY
	Tkw/RfqvT05r/UaxVIP4ypIai23YmrheHycw1AWjjBGX0fYZDbVffdg3cIb6xR48Uydjk4wGmj8U0
	yjCoxGIA==;
Received: from mail-oi2-x10.google.com ([2607:f8b0:4864:32::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8o6Q-0000000CwB0-2700
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 00:11:20 +0000
Received: by mail-oi2-x10.google.com with SMTP id 5614622812f47-4b37a2ffee6so1340680b6e.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Sep 2026 17:11:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790035875; cv=none;
        d=google.com; s=arc-20260327;
        b=Va5memW4LQdvGgGmNVp4LpWSv9zXmoN4/0P+BKCwAwjYBr/0dW0SbFxL1OIdlUWYjl
         wfiP8lvpM5qxgzi+TiR3jnzunqXNBIdu579T5kw0vQOTgHmQxK1MxM8tDvsN9F/Ko6kF
         bT0BlsoOgj05j1w9X6SzgPNl5Rdeogkud4gEL3Kl1Ag/PwlYsZ94iQ9xU2q8WaGjVojR
         2w83fOZwXuGP/tGV2WzbNAEcEn3EX8M7IpsisHc1A8l3maes3oxW1N4AuV89gtqy4v/S
         rIc4ZxYfCs8aYb5OpS/sAok5MZbrmQe/DHMQr3LSGEt22klXtYm29Y38AoAfSkqSfSrG
         Ar5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2Gr7FFBApV4XH6jYqrgqIyc8MK/Sktc4ULtEkmcVSaY=;
        fh=mz8+tWWgGZzG1+m/x0dBhJluEWlI26nipMC0ps7B8aw=;
        b=JEqFrRXLY36fUUdxMKsahxDt1cH9Z4B5AzqIHQJy1FFd4V6teVmHNx0wtCbFslE0Xd
         dzKtvtGqbH0azxsARGb2NSkosUweqNy6lru1lYrj80Gc/11D//PArflF1j0j8uYaws4e
         IB0+Q9G/6cqS/xM5SSEbw3LcJfOWZsyUtlcb4oHtFiDA0aNw/8WYkbRIIX+XElKIAVGx
         F7fCzbi7eQWO/VUR25cTgym6pFmM2MvqlncXb5EVkMt7mmIWs4tTTc324kwF8zdRa6P0
         nS7BmPDAISdQpdmXW1bkfx3vi5CfMk4BBYcR+IUaUzUfxvaT34JXNkTpAwMyTbblyE1w
         7T3w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790035875; x=1790640675; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2Gr7FFBApV4XH6jYqrgqIyc8MK/Sktc4ULtEkmcVSaY=;
        b=YEIv86sMs1fCoIUBHD/9G1OMF7Yv6JR4xdEP1dUlIrrvCOv+hM0oFRzWvzOkPf8VLx
         ny23WRtcFvBL2HWYVQEn4YHXsczYrChDR0I5GFkxTTKpynTqBb7Qe1uHO10WqSjefwTn
         VCXbOfNdeBkbB75jXrdPRqPwzmuuY/kYxX/ZnLTKtke6S9kK8/HuiuDk84pH5XmkFG6v
         MyOyTGQ+lu8cYJUN5YxVe81/cJJAkPVw6GMGkp1GQh6cHdUOdCpZw6j+5T4LHrJfgI7j
         rvsUloGBsh1G9hs0LjLLUbIElQyK/x8hg9nEXZpN299PTKSrpo1eK8UdodBcGQDpk/VU
         31Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790035875; x=1790640675;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2Gr7FFBApV4XH6jYqrgqIyc8MK/Sktc4ULtEkmcVSaY=;
        b=2xNzKRd7fX8VLNRfybMZP3PDuSKz4gtszw+UR7D+dnsYQwoMGJjx51JFWy9J+si70t
         eoMyYGPVpGHIeC75gh4c898v8efnigE/+qdjUUl6maQy71ftGr3w33FR/ACLE00/8EEo
         CPfI/7NP4XQX9BmYoTrdHPjAAa68eZASPLQloSFivnvag5fJCamrj6ZSM1WCOb2kqC5o
         83mn3r0/Ik0G847luSwHFgOQRYi9SRXVfufCiZSS21poydVQU05Ij69nosHseMdVYmKZ
         NUQm8+8oVsWNWvuZmfpYlHKNw02NcjB7QrYmoeFNgON0JvF3XvRH8tXuYDJ/pEl6OXPv
         jzrQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0g8mV75rC/RT0jQqfgjMBwEyrGHX5BKlHTA5WKN+RUTtklvDaWeGd7NUc2oGahQzSMMWq+9snR31MMB6znp+Q@lists.infradead.org
X-Gm-Message-State: AFuF++nrQfpaa+VvICeFwC7A00M6waUfROJrnkUD7rT6p874JvSzWgIp
	BtL1DYBE8TClYD3xIHWAhpCqBZ8JM6gvRQjsWyBDyFT5CQCNeDPgcBpEr5Mx4XeTKwjb4zqxqTz
	5EFnjh8e5NblrQSCYvvFKRmhKUjHHGek=
X-Gm-Gg: AYBFou0IQnhdyvhbCtesRMOt7NiKvyXQZ6AXKDculJrvDulF2j5RiAtX2POmDmPYGXK
	83pTxC82A5WgAdB2OePo4N1KQ82e/+asMkNvrlXmFxfiLSyb2jG2WH/XpOa97WPpM1dRz3UijFZ
	u8S9NqfRwLqACRIZmEPZZVdbLAzBlDeXvF5RHuqhJG9dp7V5NGXCM9ojkN55zRKufeB9HHd34iI
	D2eV/mshLjCzCFdffRMwDc7gmqG07Nz5KvIuZwzaVUw0K87nObrwwSfEorWAE3pIRq/JhUt65DE
	c/CgtgPEGYxmccdoCtpV9Zc+FDzOSscEwEnpOqCbhzf91JSnzTXkJT5Reg6iLItu8B8=
X-Received: by 2002:a05:6820:4b90:b0:6b1:d09d:6d73 with SMTP id
 006d021491bc7-6ca9a13380dmr11540114eaf.8.1790035875157; Mon, 21 Sep 2026
 17:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid>
 <CABb+yY3_xBvQVFHEs=v39u7+TLjJRaVv3sg5pGgd0YxCruZ8Tw@mail.gmail.com>
 <CAD=FV=X-fAJp=EG_yTAg+QQgNYRCt25947oHGHZuq-FEyirK0g@mail.gmail.com>
 <CABb+yY2CH5A1ixfX9czgtEwsP95FN-2JVzN_wmRDRNsSuZY5PQ@mail.gmail.com>
 <CAD=FV=XiguzS7nH1sE=BkXt+7G6-hhqyz5u3sjc4zAA9H7KqJg@mail.gmail.com>
 <CABb+yY2_AvcnaTDmpL8gP4H2_Pp3HddrtNr5gvL4GCW2DPPvOw@mail.gmail.com>
 <CAD=FV=VzJCb1nz+q5EZ33G5U6KZM_tXi8snL=KbUM3C5yymG4g@mail.gmail.com>
 <CABb+yY2omp+g13UgZfiKWLux9J1P+=ed0U3F8AhS0iQK=kpN8w@mail.gmail.com>
 <CAD=FV=WA2wFbk0=qFE0aZs9E5jg-EXzcrkPCk6VOMhbDroOQCw@mail.gmail.com>
 <CABb+yY0W+244qaXqHdfEq9XFuQXBez7PVcDNrKooV9cFS8TS_Q@mail.gmail.com> <CAD=FV=VW2h1zWDYWQ6LknX3O+3=EY665jde35Ly+UQzuscXy=Q@mail.gmail.com>
In-Reply-To: <CAD=FV=VW2h1zWDYWQ6LknX3O+3=EY665jde35Ly+UQzuscXy=Q@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Mon, 21 Sep 2026 19:11:02 -0500
X-Gm-Features: AcwNN1XZ5MoTljZYH3yCjsHWlUM_5F4f5Rqvk0Vh6rm-kZrbrStI4re6dazWG9c
Message-ID: <CABb+yY2Cc9YGKb0ej7CZ_LQLw-iMQOtcAwLPier+X2ej1fWcJQ@mail.gmail.com>
Subject: Re: [PATCH 7/7] mailbox: goog-mba: Introduce the goog-mba mailbox driver
To: Doug Anderson <dianders@chromium.org>
Cc: Joonwon Kang <joonwonkang@google.com>, Subhash Jadavani <sjadavani@google.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Lucas Wei <lucaswei@google.com>, 
	Brian Norris <briannorris@chromium.org>, Peter Griffin <peter.griffin@linaro.org>, 
	=?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_011118_752146_CABD7CC6 
X-CRM114-Status: GOOD (  50.42  )
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

On Mon, Sep 21, 2026 at 5:19=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Sun, Sep 20, 2026 at 3:46=E2=80=AFPM Jassi Brar <jassisinghbrar@gmail.=
com> wrote:
> >
> > > The numbers here for interrupt latency are made up for my example and
> > > I haven't personally measured them, but I think it's not completely
> > > absurd to say that interrupt latency (on both the Linux and remote
> > > sides) dominates the communication path.
> > >
> > Yes, the numbers do look biased. It takes 50us for remote to get the
> > irq and act upon it before ACKing but it takes 100us for that ACK to
> > get back.
> > And the benefit will be hard to achieve - it involves three unrelated
> > clk_prepare() requests done within 50us often enough. When the stars
> > align you save 300us on a clk_prepare()
> >
> > It feels you are trying to optimize a non-issue. clk_prepare() is
> > expected to be slow and anyways shouldn't be frequent enough from all
> > devices to give noticeable benefit.
>
> Fair enough. I've jumped into a pre-existing design. Let me see if I
> can find old information or gather evidence myself. Then with real
> data we can figure out what makes sense. OK, gathered some data...
>
> FWIW, to explain things clearly, I have been simplifying by saying
> that just clock prepare/unprepare goes over this channel. In reality,
> there is much more traffic. On Pixel 10, the mailbox using queue mode
> like this connects to the "CPM" (central power manager). Looking at
> the device tree, we see the following things using this mailbox:
> * One of the main clock controllers in the system.
> * Most of the power domains in the system
> * Devfreq controllers
> * Thermal controllers
> * A GPIO controller
> * A reset controller
> * An interrupt controller
> * A RTC
> * A pile of other stuff
>
> So basically a whole crap-ton of resources are managed over this
> mailbox. The team designing this Phone apparently decided that the
> mailbox is one of the primary communication pipelines in the system.
> Yes, everything that communicates over the mailbox needs to be able to
> sleep, but that doesn't mean we shouldn't keep it fast if possible.
>
> On an off-the-shelf Pixel 10, one can spy on the CPM mailbox like this:
>
> echo 1 > /sys/kernel/tracing/events/goog_mba_ctrl/enable
> echo 1 > /sys/kernel/tracing/tracing_on
> echo "" > /sys/kernel/tracing/trace
> cat /sys/kernel/tracing/trace_pipe | grep 'process_q_t\|send_data_q'
>
> When I do that, messages spew by pretty much constantly showing just
> how busy this mailbox is. I can see instances where the queue is
> actually utilized like this:
>
> cat /sys/kernel/tracing/trace_pipe | \
>   grep 'process_q_t\|send_data_q' | \
>   grep -C10 'eqs_completed=3D[^1]\|anding_msg=3D[^0]'
>
> If I do that, it's quite easy to see the queue being used. If I use
> the device actively, I get several hits per second. A few examples
> traces (using sed to shorten them slightly):
>
> 6946.884142: send_q: {0xa0016969,0xf,0x2,0x0} tx_q_wr_ptr=3D4
> 6946.884496: send_q: {0xa0026969,0x7,0x1,0x0} tx_q_wr_ptr=3D5
> 6946.884851: q_txdone: tx_q_rd_ptr=3D4 reqs_completed=3D2 outstanding_msg=
s=3D0
> 6946.884880: q_txdone: tx_q_rd_ptr=3D5 reqs_completed=3D1 outstanding_msg=
s=3D0
>
> Here you can see that it took 709 us to get the response to the first
> message. ...but, luckily we didn't have to wait for that 709 us before
> sending the second message. That means we still got both responses at
> once. Note that things aren't always so slow. The next messages
> through this mailbox only took 42 us.
>
> 6946.885000: send_q: {0xa0036969,0x7,0x1,0x0} tx_q_wr_ptr=3D6
> 6946.885042: q_txdone: tx_q_rd_ptr=3D6 reqs_completed=3D1 outstanding_msg=
s=3D0
>
> Here's a pretty big usage of the queue. I assume the CPM was busy at the =
time:
>
> 7751.863328: send_q: {0xa0050708,0x1020001,0x0,0x0} tx_q_wr_ptr=3D7
> 7751.863619: send_q: {0xa0060708,0x1030001,0x0,0x0} tx_q_wr_ptr=3D0
> 7751.863850: send_q: {0xa0070708,0x1000001,0x0,0x0} tx_q_wr_ptr=3D1
> 7751.864123: send_q: {0xa0080708,0x1010001,0x0,0x0} tx_q_wr_ptr=3D2
> 7751.864329: q_txdone: tx_q_rd_ptr=3D7 reqs_completed=3D4 outstanding_msg=
s=3D0
> 7751.864338: q_txdone: tx_q_rd_ptr=3D0 reqs_completed=3D3 outstanding_msg=
s=3D0
> 7751.864347: q_txdone: tx_q_rd_ptr=3D1 reqs_completed=3D2 outstanding_msg=
s=3D0
> 7751.864378: q_txdone: tx_q_rd_ptr=3D2 reqs_completed=3D1 outstanding_msg=
s=3D0
>
> A full millisecond before the first response, but luckily we got them
> all at once.
>
> ...and this one is pretty interesting here:
>
> 7782.321344: send_q: {0xa0040708,0x30001,0x0,0x0} tx_q_wr_ptr=3D4
> 7782.321481: send_q: {0xa0150708,0x10001,0x0,0x0} tx_q_wr_ptr=3D5
> 7782.321769: send_q: {0xa0060708,0x1,0x0,0x0} tx_q_wr_ptr=3D6
> 7782.321799: q_txdone: tx_q_rd_ptr=3D4 reqs_completed=3D2 outstanding_msg=
s=3D1
> 7782.321813: q_txdone: tx_q_rd_ptr=3D5 reqs_completed=3D1 outstanding_msg=
s=3D1
> 7782.321842: q_txdone: tx_q_rd_ptr=3D6 reqs_completed=3D1 outstanding_msg=
s=3D0
>
> This one is interesting because we can see that the remote side first
> ACKed two of the three outstanding messages. Then a short time later
> it managed to ACK the last message.
>
> ...and just to show the queue being used quite often, here are two
> instances right in a row (it's not hard to see this happening):
>
> 8521.693559: send_q: {0xa0010708,0x1030001,0x0,0x0} tx_q_wr_ptr=3D5
> 8521.693649: send_q: {0xa0120708,0x10001,0x0,0x0} tx_q_wr_ptr=3D6
> 8521.693690: q_txdone: tx_q_rd_ptr=3D5 reqs_completed=3D2 outstanding_msg=
s=3D0
> 8521.693701: q_txdone: tx_q_rd_ptr=3D6 reqs_completed=3D1 outstanding_msg=
s=3D0
> 8521.693920: send_q: {0xa0030708,0x1,0x0,0x0} tx_q_wr_ptr=3D7
> 8521.693956: q_txdone: tx_q_rd_ptr=3D7 reqs_completed=3D1 outstanding_msg=
s=3D0
> 8521.694171: send_q: {0xa0040705,0x2,0x14,0x1} tx_q_wr_ptr=3D0
> 8521.694194: send_q: {0xa0150708,0x1000001,0x0,0x0} tx_q_wr_ptr=3D1
> 8521.694214: q_txdone: tx_q_rd_ptr=3D0 reqs_completed=3D2 outstanding_msg=
s=3D0
> 8521.694226: q_txdone: tx_q_rd_ptr=3D1 reqs_completed=3D1 outstanding_msg=
s=3D0
>
> ...and in case you want to see an even bigger use of the queue, here
> are 6 queued up at once:
>
> 9223.248560: send_q: {0xa0060403,0x3050600,0x0,0x0} tx_q_wr_ptr=3D7
> 9223.248598: q_txdone: tx_q_rd_ptr=3D7 reqs_completed=3D1 outstanding_msg=
s=3D0
> 9223.248824: send_q: {0xa007000b,0x1,0x418,0x7} tx_q_wr_ptr=3D0
> 9223.248960: send_q: {0xa008000b,0x1,0x18,0x7} tx_q_wr_ptr=3D1
> 9223.249289: send_q: {0xa0090008,0xa1800,0x0,0x0} tx_q_wr_ptr=3D2
> 9223.249489: send_q: {0xa00a0008,0x1803,0x0,0x0} tx_q_wr_ptr=3D3
> 9223.249612: send_q: {0xa00b0008,0xa1900,0x0,0x0} tx_q_wr_ptr=3D4
> 9223.250046: send_q: {0xa01c0403,0x3050600,0xffffffff,0x0} tx_q_wr_ptr=3D=
5
> 9223.250232: q_txdone: tx_q_rd_ptr=3D0 reqs_completed=3D6 outstanding_msg=
s=3D0
> 9223.250236: q_txdone: tx_q_rd_ptr=3D1 reqs_completed=3D5 outstanding_msg=
s=3D0
> 9223.250237: q_txdone: tx_q_rd_ptr=3D2 reqs_completed=3D4 outstanding_msg=
s=3D0
> 9223.250239: q_txdone: tx_q_rd_ptr=3D3 reqs_completed=3D3 outstanding_msg=
s=3D0
> 9223.250240: q_txdone: tx_q_rd_ptr=3D4 reqs_completed=3D2 outstanding_msg=
s=3D0
> 9223.250241: q_txdone: tx_q_rd_ptr=3D5 reqs_completed=3D1 outstanding_msg=
s=3D0
> 9223.250406: send_q: {0xa00d0008,0x1903,0x0,0x0} tx_q_wr_ptr=3D6
> 9223.250437: q_txdone: tx_q_rd_ptr=3D6 reqs_completed=3D1 outstanding_msg=
s=3D0
>
>
> This looks pretty clearly worth it. Have I convinced you? Is there
> other data you'd like to see?
>
OK, let's work with the assumption that it is really needed.  Though I
would still explore the option of lazy/debounced disabling of clocks
and other resources controlled by the remote host.

>
> > If you do have some real numbers and think it is worth it on your
> > platform, then maybe expose each doorbell/shm-slot as a generic
> > channel. clk_mailbox will request a generic channel, do the request
> > and free it. The same effect but without inventing a new api. I can
> > share a draft if you want, but I suggest let's not make things
> > complicated without proven benefit.
>
> FWIW, the downstream code in Pixel does what I think you're
> suggesting. I can confidently say that, while it doesn't require
> changes to the mailbox core, it is much more convoluted and
> complicated. It also bleeds into the device-tree representation, which
> doesn't feel great.
>
> Just to be concrete, I'll document how the downstream driver works. If
> this isn't what you were thinking, please correct me.
>
> Back to our simplified "clk_mailbox" driver. We'll say that our
> "clk_mailbox" driver talks over a single mailbox to the remote
> processor. Let's say each message is 4 words big. The message space is
> 32-words big. 32 / 4 =3D 8 which means this space is divided into 8
> queue slots. Downstream represents each of these queue slots as a
> generic channel. That means that, in the device tree, our
> "clk_mailbox" driver looks looks like this:
>
> mboxes =3D <&cpm_tx_mba 0>,
>          <&cpm_tx_mba 1>,
>          <&cpm_tx_mba 2>,
>          <&cpm_tx_mba 3>,
>          <&cpm_tx_mba 4>,
>          <&cpm_tx_mba 5>,
>          <&cpm_tx_mba 6>,
>          <&cpm_tx_mba 7>;
>
> Then the "clk_mailbox" driver is in charge of rotating through each of
> the channels. First it writes to channel 0, then it writes to channel
> 1, etc. This works with no changes to the core, but...
>
I was thinking something like   mboxes =3D <&cpm_tx_mba>
clk_mailbox simply asks for some channel, gets allocated the next free
slot. The mailbox controller driver keeps track of the channel-slot
map locally and is responsible for managing contiguous slots and
completing the tx upon receiving ack.

> I'm also a little confused about the resistance. I don't feel like the
> mailbox core change is that complicated. The diffstat shows 58
> insertions and 17 deletions. 14 of those added lines are comments.
> While we certainly don't want to add useless APIs, to me this truly
> seems like the correct way to add the functionality. It also doesn't
> seem absurd to me that some future mailbox controller out there will
> also support queuing like this.
>
It is not the diff stat but about inserting a flag in the api to
introduce special case behavior. It is like adding one person to the
party introduces N-1 handshakes - the has_queue flag doesn't play well
with other configurations and may allow future platforms to abuse
has_queue to implement hacks.

Regards
Jassi

