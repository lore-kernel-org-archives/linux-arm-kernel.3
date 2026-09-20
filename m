Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31988C982DA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 20:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UuxmOhA8ouqiNqWUp1uMWZH0rPNr5xGhrrIxVD6hrCI=; b=VU3/0pirdzW7xUBn5L2CyPEStr
	fFPTX/vBagz6ONhek53xpiZW/+MMc3sulRKworakjgarBLB7pEMSREW94n0iCN3YaMgKnigAUQ/q/
	F4eayfmzLSROykigyvtb/qOCm7HVTrRDWnBwcDCQ6gNFFwcPvSE+5MMKVsU//D+gI+HYtfNFWjI2E
	ckjC2DsLCQK/1QoXwrGjkYlHMshvHXdGPHIUhajUvYBcItdeisAXOiR/ynXFhc5pJPl042LdRxoZ0
	JWT7blcx1YJ6VL85kdVElWqfpmeotDTZkowAwZxbbkTeu9tfzly/+3cMcZqmc5Ykj7w3SusZrfTOU
	eG0goZtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8OAr-00000000PVq-3ldP;
	Sun, 20 Sep 2026 20:30:09 +0000
Received: from mail-oa2-x10.google.com ([2607:f8b0:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8OAn-00000000PV7-3Gl0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 20:30:06 +0000
Received: by mail-oa2-x10.google.com with SMTP id 586e51a60fabf-466ccbd478cso1068675fac.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 20 Sep 2026 13:30:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789936204; cv=none;
        d=google.com; s=arc-20260327;
        b=QowypmjR7J4pIlfIZCl5z49pblx4uT0cunTEjH5m0IXE0NSE1Qr7nyx8OtpPS2H9Y+
         G+wHfEdFdKqCt+lCOlwT1qZB0gBNeEVkpIuzB1T/Dq6JTKEjrwjWNTI9ye1XX3XIZwfO
         jzFcIWquAl4B8W9LpCwu11pcVotJ6pVCj3seFDP/dMzDm6ZrQZlLV9Mlp+QEaOq4OlMA
         w9kIxdKJTNUUGX12grO1OMdYCA94EJ6nste7KZqDGCnzsnQtTUjtWhHTEZGwaqu39CEM
         VG4/DSvU2txUpKrK8z8icDcz2/0oBKpb5OzZSgJNNBi8NNI+ttAswztggk/sLemVyF3S
         KERw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UuxmOhA8ouqiNqWUp1uMWZH0rPNr5xGhrrIxVD6hrCI=;
        fh=7knuz1DZ+CUDhv+A8tW9zACdrYS1V1MVAXmYQK0Qiew=;
        b=jTSuVoY29EC3im37/9pmuy16pdpDExeV+5LWNeQpgAgzuA09mPej94ZMfpzvDUjIeP
         x5btk2A1YXpjCRr2iPnJDFYezmDo/T+/+sfepaI4f2P2xmHhN//vMvVp0UjpLw9D9yQz
         wN9mWOvy1TOPa/BRdut6LMdfD9WlCAZ1HOX36XlmF4BmhJ5bUf404gMUUS/INGAsETsE
         Kzll1ca9oqvCSDVv88lG/ba3GjlLfXtf6FuYp5TY67bO5aVpxtiX15g+z7ovngdzs+DF
         BLLUndQZriDdeccd8OMPwtjHWb3q9NfNc6oXQMi4k1a8OKgEbHjfP0tQX1Jvt4qaZguw
         wLKg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789936204; x=1790541004; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UuxmOhA8ouqiNqWUp1uMWZH0rPNr5xGhrrIxVD6hrCI=;
        b=MjlB+LESKJiYNfdezb94aM/XC1SYHNqPlyve5zH3BK+XzRefdvZWPMYpoM3Y2QVVRM
         iouvlz01/B9ZUHnz0wPKhrJi9Fa4K8DUQZX9cZRpTvQ/7ChQI8xscCelmwxxvwgXkBxb
         rKQw3Wfh+kob14pnM0VNl7lzxjzRUR4z6IxTytMrdSbSNCIud3zNOluzFjUSCrktyT3t
         xfrVPQBR7jO05WtDAbiyWu3/XmYZhE3uAzJKDzrShfen9kVMGCi5IfAhbgno4urZRbhZ
         o6cW/LQL0+Ok5HZ4ewVdsToT5j/taLmHW8ZQtbRmvux/LJaQQr4M/9XzX+mLmicJ4aoa
         hM+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789936204; x=1790541004;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UuxmOhA8ouqiNqWUp1uMWZH0rPNr5xGhrrIxVD6hrCI=;
        b=BExKiagRu4b/qnbo9MTVdhg5aIRW6RRYRi+1usIJhh8fk6W/SkwnLxlyBQrnHPkqhp
         +DJkY1TTlNAwTnwr5EXzosY36rKapSjR34fI/G+7Wx3j6T5RhFuIy3GvyBrb1GFT6/UA
         yBNTAApI8EaIe0Xafhj6MutpZhm1yRlXzGtAKH+mkIu35ks5/vW5wwCekrvqH1nb86zG
         PKrA3PeEZLvcYpaj+WNhxzKLtHLy+FuC1P40eXeazzI7yBCrb3yicjTPx38+s8cpWlkl
         s991no4X2/OstImdnOq4pJLJLcOVKgskOocycIviI+h4TalgBbVH4SusCouNbsaD1vjR
         XGcA==
X-Forwarded-Encrypted: i=1; AKwUvBxiSCTTgHtTDyuJIjrR38UbGboqfpxPlRKlZj5ccp0pztHhWctoawB8MQTGR+QkNvPk5faSTpxoOpcU1Ch59ZLW@lists.infradead.org
X-Gm-Message-State: AFuF++m3X4W81vMRU97KD1yuyPCUTlB1ttPCvieqtTSGU49sZ9PEbs3o
	0iIeDYKR9e2Q4Aw/fGUGbKoizwEJ3VZ6JUnVYjTh1GEvysuQpBpucyo6ty609t/MVlqJbZq3qll
	DZukJwihaPbPN/SZ0qs/YjhSms3K+gGg=
X-Gm-Gg: AYBFou0WKLcMgNy6ixPldJj26zWbBcuoD6+5W5z7UEhnv5HMSOXfsTUF2vj770iu/lb
	TdV6oZgFVDUnlIcgHychAJBLl/z9WOsAesjyl4WsEga3ENQjlFUO5oew56YJCpJebqwoze69oXx
	r6RwnB+LpEeDgvGAeghmHAEk1v+rAoTnPuDXaW3VhiGfopFI/Fr9pWfQWi1sFCOiPWETRv053Wj
	WONq4JgLjByzCvLitBTaZ6j59AqaH/n3EOUb+EBNYmPuf/YZA0FDdH+Nb7yNbmPNuz1UyOTxj5B
	KjDD3PQPccRFPYRTpjx9l8zGI/iQL9IhZD+o+sToF7lHL4+aCNu/GrM=
X-Received: by 2002:a4a:e90d:0:b0:6c1:c628:b0eb with SMTP id
 006d021491bc7-6ca9aa42453mr7714964eaf.25.1789936203936; Sun, 20 Sep 2026
 13:30:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260714222338.2965707-1-dianders@chromium.org>
 <20260714152138.7.I5cef580a62c86ba6c3465ad336fa509afbdf1476@changeid>
 <CABb+yY3_xBvQVFHEs=v39u7+TLjJRaVv3sg5pGgd0YxCruZ8Tw@mail.gmail.com>
 <CAD=FV=X-fAJp=EG_yTAg+QQgNYRCt25947oHGHZuq-FEyirK0g@mail.gmail.com>
 <CABb+yY2CH5A1ixfX9czgtEwsP95FN-2JVzN_wmRDRNsSuZY5PQ@mail.gmail.com>
 <CAD=FV=XiguzS7nH1sE=BkXt+7G6-hhqyz5u3sjc4zAA9H7KqJg@mail.gmail.com>
 <CABb+yY2_AvcnaTDmpL8gP4H2_Pp3HddrtNr5gvL4GCW2DPPvOw@mail.gmail.com> <CAD=FV=VzJCb1nz+q5EZ33G5U6KZM_tXi8snL=KbUM3C5yymG4g@mail.gmail.com>
In-Reply-To: <CAD=FV=VzJCb1nz+q5EZ33G5U6KZM_tXi8snL=KbUM3C5yymG4g@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 20 Sep 2026 15:29:52 -0500
X-Gm-Features: AcwNN1X2qy6MS-yGKrhegqKCGov0t4f4n69tP_xaTdZNakOH5Wrlld7udUuHwIU
Message-ID: <CABb+yY2omp+g13UgZfiKWLux9J1P+=ed0U3F8AhS0iQK=kpN8w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260920_133005_838176_D709FB2E 
X-CRM114-Status: GOOD (  34.25  )
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

On Sat, Sep 19, 2026 at 3:40=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:

>
> Imagine we have three clocks: They are: "clk_i2c1", "clk_i2c2", and
> "clk_spi". The "clk_i2c1" needs to be turned on when we're going to
> start an I2C transfer on I2C bus 1. "clk_i2c2" is the same but for the
> I2C bus 2. "clk_spi" needs to be turned on when we want to start a a
> SPI transfer.
>
clk_prepare() is allowed to sleep, so any path, that includes the
call, can not be expected to have low or even deterministic latency.


> In the i2c/spi drivers, we've got "clk_prepare(clk)" calls to turn on
> the clocks. The three clocks are operated independently by their
> respective users. An I2C or SPI transfer may take place at any time.
> The I2C and SPI drivers need to know for sure when the clock has
> finished enabling because as soon as the clk_prepare() calls return
> they will start transferring.
>
> All three clocks are backed by a single clock driver. We'll call it
> the "clk_mailbox" driver. The "clk_mailbox" driver takes the request
> to turn on the clock and encodes it as a mailbox message to a remote
> processor. Let's imagine that the mailbox message looks like a 2-word
> transfer. The first word contains a 0 or a 1 for enable/disable and
> the second word contains the ID of the clock: 0 for "clk_i2c1", 1 for
> "clk_i2c2", and 2 for "clk_i3c3".
>
> Now, imagine that we want to turn on all three clocks simultaneously.

Why? (not that it can't be done) I2C and SPI clients run independent
of each other.


> The "clk_mailbox" driver will see 3 calls to turn on the clocks and it
> needs to convert those to messages to send the remote processor. It
> will then call mbox_send_message() to queue those messages with the
> mailbox controller. In other words, we'll see these three calls happen
> nearly simultaneously:
>
> mbox_send_message(chan, &{0x1, 0x0});
> mbox_send_message(chan, &{0x1, 0x1});
> mbox_send_message(chan, &{0x1, 0x2});
>
> The LGA mailbox controller knows "txdone". That is, when the remote
> processor "acks" a message, the LGA mailbox controller can tell (and
> get an interrupt). This "ack" signals that the clock has finished
> enabling. This means that the "clk_mailbox" cannot run the state
> machine and it can't call "txdone" itself.
>
> Without my patches, when the above 3 mbox_send_message() calls are
> made, the first one will go straight to the LGA mailbox controller and
> the second two will be queued up. Once the "txdone" for the first
> message arrives, we'll queue the second message. Once the "txdone" for
> the second message arrives, we'll queue the third message. This means
> that the messages are not being processed simultaneously. The third
> clk_prepare() call will be processed much more slowly since it has to
> wait in line. If we had 10 clocks enabling at the same time, the 10th
> clock could have a pretty significant wait.
>
> With my patches, the LGA mailbox controller is given the second and
> third message even though the first message isn't done yet. The LGA
> mailbox controller can queue the second and third messages even though
> the txdone for the first message hasn't arrived yet. If things are
> fast enough, all three messages can be queued up before the remote
> processor has even started processing the first one. The remote
> processor can process all three messages concurrently and acknowledge
> all three at once. The LGA mailbox controller can get a single
> interrupt representing all three "txdone" ACKs and call "txdone" for
> all three messages simultaneously.
>
If your remote (host) can actually act on multiple requests parallely,
you need a way to map ACKs back onto the requests. Currently you
don't.
Looking at the goog_mba_handle_tx_interrupt() implementation, consider
the situation when 5 requests are submitted in the h/w fifo and 3 are
reported ACKed by the interrupt after some time.
You assume the three done are the first three -- which implies that
the remote handles requests in the order they arrive i.e, serially.
Otherwise, say, request-1 may be wrongly completed if the ACKs were
for requests 2, 3 & 4.
So it seems mostly an illusion of parallelism - remote is acting on
requests (or atleast sending ACKs) serially. We can keep the core
unchanged and the driver much simpler if we simply use the buffering
in the core.

Regards,
Jassi

