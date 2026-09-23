Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED0FC982FE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 00:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MKhsSlXyOKCVGmRz6Q/baoJt9IU2et11gsxgBLOMA5I=; b=vnYzwvzxDPqw6QSSSHvlffAPNJ
	ijNxk2sV01YRKMPmfqtvBO8e7rR9rUeyl8C0V5flwZEEUu+XhUhYedYQ86bdzxmUaotX+R5m6l2nP
	Jvbhukeedm0chJ4KKqqbylrCpOQ04cYvjt3HqerM4GRjoWiAq896GyG9KZYU02wBHdFzUGKKUMAFa
	JptlwdwF2fGjqHhHZSaQA41r0Uh8cu4td5naMJPtRaBd6pfjvZg4kTPaTEZIGliyb7vV2wplYizAd
	iIrhBJAWfAy1o6S8I/BRoTpRiFpmPOnQBeXG506kYKwJJfu66TWh06znjgX3mTcDaneiWGUMDkpr9
	oQCJvgSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9AmC-00000006muy-1kwz;
	Wed, 23 Sep 2026 00:23:56 +0000
Received: from mail-oa2-x10.google.com ([2607:f8b0:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Am9-00000006mud-2rRU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 00:23:54 +0000
Received: by mail-oa2-x10.google.com with SMTP id 586e51a60fabf-47c57070c52so116663fac.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 17:23:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790123032; cv=none;
        d=google.com; s=arc-20260327;
        b=Y23oDL46puhz92D0x/kgybBKXY1fKx9tHNiHtEWSMufM+BYxYHertmP86p/BaLaVzQ
         kZgZ6cnDLIwngxkQUDd5td9XzVyWqwR18vviX9z7aB7HRNiLkpMildtRifvYo7y9MPYz
         3ZeYiKZ3r64Bj5JTy7/QSTTnQ5UC5pjVtTs9NfyYyVocW+kv3j1mGlwoUsNFUSL+QbDD
         9spbYFBoetUJgf9IHvGvXXF4FQcAjwS9l8aCkaPPYW+r4chIqyR70OG2YtE3+AKMNz2Z
         7EkIMhQFOByNoT5INsvKX8uBPmakwlZoxaiBbYss6W55mHvCA1nfKdgrX6urXmKmVYni
         9Sdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MKhsSlXyOKCVGmRz6Q/baoJt9IU2et11gsxgBLOMA5I=;
        fh=8MZAVPh6Cf7Hf2uoA67jqHhCgPYTSnH4XJLGiNg74b0=;
        b=CuIZpmrjjAZweuVRogEs/yCSj+BQj3jVUTryYA4usFTKHMMGf445H9i+6Ti8M2iDaf
         pmt9Vz2pEzY39OssHnmgtE53gvQSSpf112z4qANzSgEFdD5P+kSIps0+F4NF67wjKteI
         MUytUU9c+qLcyrqTUW550ETtD4mZtSAU9Q8HLZ/pb8Uh+0S0LMUyDJweNpySYBGOWMfA
         djpgXzM2Ztr9gdJQFHM9poQfEjEJLYec2xVNQbMnMjaD9yy0rVNtwRQ/Xi9hCS+s5Hg+
         EBTPl3GL4qWIyZgviaho5PAd5WvnZm0qugSWAZp8oh11+yY8AJPg05CV+Xtui/HlhCoo
         hQfw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790123032; x=1790727832; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MKhsSlXyOKCVGmRz6Q/baoJt9IU2et11gsxgBLOMA5I=;
        b=ozYyYfH15gK2wzJnDaxjWrIP3yA9H2I2Tw+nfZTtU3v8oFsm9RI7zCxUJJ5XpxoiWK
         P5FljgCKTjE173lVtg9ooTM/nVjDFt6hozkhwljXxyKMDm9jhPkkVDmFbQivqLj0cN+Z
         adAlnQs36N9wO424xA+sBEimxsiQH1uzc6iKfJKiZ6il50ls/OcZVWqjIVeiG1bRYUGq
         D2N051/OQHSz8Z7fmOM+FrkZXzwQ1sv1AAvkJfq5C+LtdB9QghgBJaj2XIRXZp0vcn+q
         NIw+EQDRhwvry7Vs1hVoz3X64CPJSozEyXkCiUyvAdO6maH+9dP1i7eoCYBzReJnoECS
         WhDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790123032; x=1790727832;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MKhsSlXyOKCVGmRz6Q/baoJt9IU2et11gsxgBLOMA5I=;
        b=uPRjbGdqkHy0FPYXEB2tOQp3WBs39sxtC9Xu6chVd0gaLrzS8zN2yP1qbRIDNDZ6JB
         j2SZ54k2oQNs1fI3wT5hwrtE7R9qVfboFcv7qGrJ53jERmQ64hi2sFKIBXMfRzLaZ4km
         6YfhXF9Uc8aHd/KxCRfjIXEdAlBCJozuhUK2Dkn5+sBEGdXeM0VGoMvp9mBsTbGDbyAX
         +6WfKBQaDpf4X2H3eGl6TkWc778uirHlps1MkKFXo9YLImd7Se6/8MSmYAmPdTp0pCPl
         fxvUkgRkOsUv+3YvqOyqmTDWCeziI63xGhQei/VZFnAuQPcOE2tZ3VKbdo0RYNpF1iOP
         F5Tw==
X-Forwarded-Encrypted: i=1; AKwUvBy8hPBdBDVI/PgoGgSgCtIe2tpgAJAZ5bFe8j121Pdj13vR26etTa1x+2Jy7wX+VP9ZBZxzgP2HEfZ9jd7d1lBJ@lists.infradead.org
X-Gm-Message-State: AFuF++mBnOOnVG7mWVWdiMEUL9oj2Sp5gKzMKPHx0GRu8lCptGWSjoje
	Rm7N5Q2qTcR/nP6p1wwWXOayo7InwE/vcUPbuxd/qZGdoszeVqrb2n5LpDQAqAVaX1+2HCumJwu
	tH8X8idhL4Xc4EYM4fPAp+CIZmhzie8s=
X-Gm-Gg: AYBFou2lQ4kUKzh4wrWskmhwyF2pPk98q58wm43zN5J82tJblNWLYwS4AEfSkP7j+tI
	1D5gAYjJtT5+ojOhw096Zl+noPNss4/DaWCvharSJrayp4US5zl5R0ldOWry6Ypa9MJllTpRC6z
	xmkjxGMvSCb0Ii6GRwKu7uwoh78BfRW6tY9pZ04YQzPYfdiOXQckuDCZGFhAUXK3y465ul+D+pu
	mOwbPZKhrbsiirsK+TRS4n62folNX+kiHS9t9FYLytb/qZmPD5zNfIyERUfk+ZNhAdloZz6EOrE
	nKqqT9ApEMihVdPNjMVvPq216PDzn+D+6g8QvF280XNZMGlqS9No9yY=
X-Received: by 2002:a05:6871:3a0b:b0:48f:e0f6:bfec with SMTP id
 586e51a60fabf-490923b53dfmr917708fac.24.1790123030632; Tue, 22 Sep 2026
 17:23:50 -0700 (PDT)
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
 <CABb+yY0W+244qaXqHdfEq9XFuQXBez7PVcDNrKooV9cFS8TS_Q@mail.gmail.com>
 <CAD=FV=VW2h1zWDYWQ6LknX3O+3=EY665jde35Ly+UQzuscXy=Q@mail.gmail.com>
 <CABb+yY2Cc9YGKb0ej7CZ_LQLw-iMQOtcAwLPier+X2ej1fWcJQ@mail.gmail.com> <CAD=FV=U1DAuDN4eR_hZ2bbGoGkgkszDLPUDiosxh1aKg7Y1T=A@mail.gmail.com>
In-Reply-To: <CAD=FV=U1DAuDN4eR_hZ2bbGoGkgkszDLPUDiosxh1aKg7Y1T=A@mail.gmail.com>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Tue, 22 Sep 2026 19:23:38 -0500
X-Gm-Features: AclHuK_wE3olgCkrkKIbn1PfIdgGUCx_17H17uIHjPsLY1-Xg-W7zy_0cWh-1As
Message-ID: <CABb+yY3n3QmxTPOyAuHz9JkOKbhRqKok+24THc_JfdxwzROWDw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260922_172353_755865_95B6CEBD 
X-CRM114-Status: GOOD (  43.28  )
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

On Tue, Sep 22, 2026 at 11:01=E2=80=AFAM Doug Anderson <dianders@chromium.o=
rg> wrote:
> >
> > > > If you do have some real numbers and think it is worth it on your
> > > > platform, then maybe expose each doorbell/shm-slot as a generic
> > > > channel. clk_mailbox will request a generic channel, do the request
> > > > and free it. The same effect but without inventing a new api. I can
> > > > share a draft if you want, but I suggest let's not make things
> > > > complicated without proven benefit.
> > >
> > > FWIW, the downstream code in Pixel does what I think you're
> > > suggesting. I can confidently say that, while it doesn't require
> > > changes to the mailbox core, it is much more convoluted and
> > > complicated. It also bleeds into the device-tree representation, whic=
h
> > > doesn't feel great.
> > >
> > > Just to be concrete, I'll document how the downstream driver works. I=
f
> > > this isn't what you were thinking, please correct me.
> > >
> > > Back to our simplified "clk_mailbox" driver. We'll say that our
> > > "clk_mailbox" driver talks over a single mailbox to the remote
> > > processor. Let's say each message is 4 words big. The message space i=
s
> > > 32-words big. 32 / 4 =3D 8 which means this space is divided into 8
> > > queue slots. Downstream represents each of these queue slots as a
> > > generic channel. That means that, in the device tree, our
> > > "clk_mailbox" driver looks looks like this:
> > >
> > > mboxes =3D <&cpm_tx_mba 0>,
> > >          <&cpm_tx_mba 1>,
> > >          <&cpm_tx_mba 2>,
> > >          <&cpm_tx_mba 3>,
> > >          <&cpm_tx_mba 4>,
> > >          <&cpm_tx_mba 5>,
> > >          <&cpm_tx_mba 6>,
> > >          <&cpm_tx_mba 7>;
> > >
> > > Then the "clk_mailbox" driver is in charge of rotating through each o=
f
> > > the channels. First it writes to channel 0, then it writes to channel
> > > 1, etc. This works with no changes to the core, but...
> > >
> > I was thinking something like   mboxes =3D <&cpm_tx_mba>
> > clk_mailbox simply asks for some channel, gets allocated the next free
> > slot. The mailbox controller driver keeps track of the channel-slot
> > map locally and is responsible for managing contiguous slots and
> > completing the tx upon receiving ack.
>
> Hmmm. OK, so I guess you're saying that every time "clk_mailbox" wants
> to send a message, it calls mbox_request_channel(). It always requests
> the same channel over and over again, but underneath the mailbox's
> fw_xlate() function returns the next distinct channel? Then once
> "clk_mailbox" sees the tx_done then it calls mbox_free_channel()? I
> guess it would need to fork the mbox_free_channel() into a delayed
> work function since mbox_free_channel() requires grabbing a mutex and
> tx_done() is called from atomic context. It would be up to
> "clk_mailbox" to ensure that it used the interface properly: always
> send the message on the next allocated mailbox, always free the
> channels in order, etc. Also, "clk_mailbox" would still need to
> implement its own queue to handle the case where there were no more
> free channels.
>
> One thing that is important is that "clk_mailbox" needs to know when
> "tx_done". If we didn't need that, everything would be vastly simpler:
> just allocate the channel, send the message, and free it right away.
>
> Did I understand your suggestion correctly this time, or am I still
> not getting it?
>
> Assuming I understood correctly, my thoughts would be:
> 1. At least this doesn't bleed into the device tree, which is great.
> 2. I'm a little worried about all the overhead involved in constantly
> requesting / freeing channels. Maybe it's not as bad as I fear, but
> those functions don't seem intended for constant calls. Even if the
> overhead isn't that bad, the extra overhead needed to fork the free
> call to delayed work doesn't seem great.
> 3. It feels like trying to manage this from "clk_mailbox" is going to
> be a bunch of complicated code, including managing our own queue since
> we still can't use the mailbox core's queue.
>
It should be a lot simpler and neater than you anticipate.

I agree we should avoid channel request-release for every transfer.
Not due to overhead concerns but because that makes code cleaner.
(lets not forget the remote handles requests serially and it is just
the latency of incoming ack irq and programming the next xfer that we
can and want to avoid. So acquiring/releasing a channel should not be
the bottleneck).

So I think clk_mailbox can acquire all 8 channels during probe and
maintain a list of idle channels from which it picks one and uses it
for an incoming clk_prepare(). If all channels are busy, the
clk_prepare() will sleep/block on a wait-queue which is nudged by
tx_done of a transfer after the channel is added back to the idle
list.

Regards,
Jassi

