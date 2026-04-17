Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47069F8DFE9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 08:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6+m189FrlHvlQluxfIKHyqtB0jWSsQDaVuzIa8Tqb+g=; b=fuMEaP7lsiOtISmEBMStOIq7K/
	LEMsZwj8wRPrWTaTTUuWMxgBjzbYiHh/IcJrPT4M5YTHY1nJu2Bt/tJMC0famzshZeINYz1hr7tUG
	RhEetXrP+2JyrHbfxhRb9n4t2R78+p0/7qDq3G4MA06VD4+3QYkBMu6u5Wurz0JFuWSBB3+LjUT86
	3oVOKp/So1Zfuswh4bwpjG27bDty7cXUqK/FDNYFcxjiVJO3Az57ppx2mkBOAuvD9PiI3MlDwwkRq
	OA41vDAq5twgsFbr01grbssaKC9P2T4V6O1z32AV3PsIx+Uo3pYHwkY1CycQxSFaU+aYVRrrkWaGi
	0U/chXiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDeli-00000003h11-0Diz;
	Fri, 17 Apr 2026 08:41:42 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDelf-00000003gyr-1Zrj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Apr 2026 08:41:40 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-82f37353f52so653155b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Apr 2026 01:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776415298; x=1777020098; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6+m189FrlHvlQluxfIKHyqtB0jWSsQDaVuzIa8Tqb+g=;
        b=UzcYqoVBFKEdB5pOyRibnBpth6zRm/3/Qa55/E+8RgBVUTxicSFP3JBucYK/0SfZFp
         O1HnrqbbFjjzd3sP6ghvwfp3aDhPE0clc8KPalcJjLF4lQQU6ILkD1a2sAldDyZTeXEp
         zR3FiNMgbvn+Dk0BxuvVWENNjTuEiCIuOXU9pwyCPEKUq5LU1fhuVKQilM2jgfM9neWW
         j2zsSJ8L6bV5M9ABeMwy7KPHLoxPoKOxgt1T2NoFFRsnZIo0Z5UTKNuSKOH6W1BtPK8U
         qw+qAArKkqwlmLyBJ6p0R4CqR/mA9XtaP+yIpLS3NKARc24y512esAj4W4qOxs42sVFS
         yMZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776415298; x=1777020098;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6+m189FrlHvlQluxfIKHyqtB0jWSsQDaVuzIa8Tqb+g=;
        b=WBLWF4PG3sHIRoCMew+oDNtGkVLY+/qfTlIMVslSgmrIGdmHLBId+4NXPGysLUovbz
         VqxPhbbJhrUCardkxqLdk4Yl+GyX5ykdDLXbisTH+iCKGPlqs36PNQtvY9sC/3Tgs0AX
         Tk8nf9H1OPd7Et8yo+rn7+YCzlt2FHARqY9NghP7Q1ZsfP6A0psVIMZYgkNTOwstp4kt
         SyRb1wTYE4762ZBwRXVq6TTcBS7/FRNHWRsIAFKGfjex2hkAdjSNaXIjBDt9s6DUEFKd
         j5gHSROjL0LXIFTzhQ4TITpQHUPnR/ftg7783u7QX/4+LE2UBlhnQZLNnPn+X1udnLwN
         uM5Q==
X-Forwarded-Encrypted: i=1; AFNElJ/O+D2xWeApXKoHsAGKVjinI9wNysLji/uV0P8/+G3+ZTjcICMnSIpSX6unA4xdrOUwIv7VQBst7qpFDoKLL8Ij@lists.infradead.org
X-Gm-Message-State: AOJu0YwlYVp9ilMcC4LS33lMnO5HP9Xt2Y5gnQYSX6EqWxxercS0esDz
	50Z8QOv0oyDvUnW4sWptiCCO/SfBLQoaEq+XUFLrlNur/q5jHvXAn4xDg0M9tckicYUckyCtEKb
	39SZNCTucpoTc5JdvI8cYFLkt0A==
X-Received: from pfblu1.prod.google.com ([2002:a05:6a00:7481:b0:82f:24a1:2b5a])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3cc6:b0:82f:111:61d3 with SMTP id d2e1a72fcca58-82f8c970802mr2065492b3a.44.1776415297277;
 Fri, 17 Apr 2026 01:41:37 -0700 (PDT)
Date: Fri, 17 Apr 2026 08:41:34 +0000
In-Reply-To: <CABb+yY0uDQh-3cadPQONV=NJKjMtc4mJekgjmHYVaHnfHXvGZQ@mail.gmail.com>
Mime-Version: 1.0
References: <CABb+yY0uDQh-3cadPQONV=NJKjMtc4mJekgjmHYVaHnfHXvGZQ@mail.gmail.com>
X-Mailer: git-send-email 2.54.0.rc1.555.g9c883467ad-goog
Message-ID: <20260417084135.2091007-1-joonwonkang@google.com>
Subject: Re: [PATCH v3 1/2] mailbox: Use per-thread completion to fix wrong
 completion order
From: Joonwon Kang <joonwonkang@google.com>
To: jassisinghbrar@gmail.com
Cc: angelogioacchino.delregno@collabora.com, jonathanh@nvidia.com, 
	joonwonkang@google.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-tegra@vger.kernel.org, matthias.bgg@gmail.com, stable@vger.kernel.org, 
	thierry.reding@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_014139_408607_B67261E8 
X-CRM114-Status: GOOD (  29.30  )
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

> On Fri, Apr 3, 2026 at 9:51=E2=80=AFAM Joonwon Kang <joonwonkang@google.c=
om> wrote:
> >
> > > On Thu, Apr 2, 2026 at 12:07=E2=80=AFPM Joonwon Kang <joonwonkang@goo=
gle.com> wrote:
> > > >
> > > > Previously, a sender thread in mbox_send_message() could be woken u=
p at
> > > > a wrong time in blocking mode. It is because there was only a singl=
e
> > > > completion for a channel whereas messages from multiple threads cou=
ld be
> > > > sent in any order; since the shared completion could be signalled i=
n any
> > > > order, it could wake up a wrong sender thread.
> > > >
> > > > This commit resolves the false wake-up issue with the following cha=
nges:
> > > > - Completions are created just as many as the number of concurrent =
sender
> > > >   threads
> > > > - A completion is created on a sender thread's stack
> > > > - Each slot of the message queue, i.e. `msg_data`, contains a point=
er to
> > > >   its target completion
> > > > - tx_tick() signals the completion of the currently active slot of =
the
> > > >   message queue
> > > >
> > > I think I reviewed it already or is this happening on
> > > one-channel-one-client usage? Because mailbox api does not support
> > > channels shared among multiple clients.
> >
> > Yes, this patch is handling the one-channel-one-client usage but when t=
hat
> > single channel is shared between multiple threads.
>=20
> hmm.... how is this not single-channel-multiple-clients ?
> A channel is returned as an opaque token to the clients, if that
> client shares that with other threads - they will race.
> It is the job of the original client to serialize its threads' access
> to the channel.
>=20
> > From my understanding, the
> > discussion back then ended with how to circumvent the issue rather than=
 whether
> > we will eventually solve this in the mailbox framework or not, and if y=
es, how
> > we will, and if not, why.
>=20
> It will be interesting to see how many current clients actually need
> to share channels. If there are enough, it makes sense to implement
> some helper api
> on top of existing code, instead of changing its nature totally.
>=20
> Thanks
> Jassi

Hi Jassi, can we continue discussing this matter? We can start from the rec=
ent
comments from me.

Thanks,
Joonwon Kang

