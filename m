Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 914CACD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 11:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iynfz1W1N4GfIpEnhSfMfTKqIz/C/8nZcfTGa23ppGE=; b=FGMymjWm89MlJyZxUzJkEhAHZo
	/W9dt3yuHhBCLcSdDPMrdbpD+bWtxGFh4FK2LhBA/wX/ER3lTNRGS7ywl23mOJualCUtyEPKOqnop
	Sno5uoWXF2HcMdrvBaEKxeAL2Lw4ZZTjrlIrwEbsFrHSx7DfkdUSbpir8X0421VfXhSU+c52GCS44
	TF8P/yQrY79S+kkEE2+Si7DYMvkM8598xrwiNMzzbZyVO9stLYS8wox75OcS7d95GDDGJqlIXCTo7
	7fK+eLBWsIsjm16GZ9Pq89Rw8YjZmp8qhG1K8l8OfNC9051m1TSCfAsEeOJRxZJozCg2wsTZUXJ7u
	DapPjY/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUk2f-0000000EyEd-1Co6;
	Wed, 03 Jun 2026 11:45:49 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUk2c-0000000EyDZ-2L57
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 11:45:48 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7e6d991991dso1447557a34.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Jun 2026 04:45:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780487145; cv=none;
        d=google.com; s=arc-20240605;
        b=lTliPHDyeJ9eqzWNMokX+iAVsEHc/a+tTDMK08Jp5Yu75JspWr9edyi77La/eLrBRE
         cprkRGafe0KAereadopLw24Q5dNqcgOR7wA7JILQQKz/PfYqOB7YTFhCmJrxDblqMVR3
         fdpNXiOv0zJlq6I1zcqJZCenw+IaC0GF1qVavxtQx1H7Jjqz8YSVD3PC2jpXzYCIyff1
         IRBrDNwaEb7Suh+ibRiHnad3XpVj5Gq9k3WPi/xTTSINAyquMwVWi1gbodMM6rzK/G49
         rgmKv0DfgQcMgQQMqGY5IG0yE4ukbjCp2HxdD1XktteFzvKQk0VU4OR0ZaeAqlToZdqx
         Rfjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Iynfz1W1N4GfIpEnhSfMfTKqIz/C/8nZcfTGa23ppGE=;
        fh=Wfr514vlEWJmxnXVYwkH8X3lfvE6YOVSDj0xIlBdoQs=;
        b=CLrBoVpcwhrdj4vWPPCWuVBOFv1Whl4QpsKng3sN5dMzOMyeQN7Z38276JR4z6VPc9
         PAHyFtK/6YGY4GxB2KBQPgYjbPbHIQN89DJjVDbyMDbcfrGNTYBFsNJGA1O0aj1drmrY
         OihyL6uo1RdCmAtFE4riKFSLMbX7dVHQe7cDKhZwQk7iPYontLZeouhrmtw6ZeWu4DCR
         PtygyPlJfcvYpuxYPtt0okpg5V5RzixuNYXVuohr/Ybuvf+SD4k5BRqTKrmKcZjk/Cnq
         jw7IV+1bAiBayG3BmmUUDZ6vuT0NPChxMpKCVvfitG9q7n3xxgLN10SRu7LL247mJeDf
         OHBw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780487145; x=1781091945; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Iynfz1W1N4GfIpEnhSfMfTKqIz/C/8nZcfTGa23ppGE=;
        b=KN6xKPuL4Y841FmR0A79bGsCgZBarPt6jAx8OevkH6qUUMkq+evzQ2HkLfBkfyyY7B
         roEGjc0pRf0mwlTHxah3qwr4SUOROqYA5xHGYrTGqHn5A9AOuGAHpgitPB85J1fuwP6z
         UZMnWe4QvyL9ybHsNgy0BEtgT4AyghJ3E4+CWM0Pt8ZuuSD01rwznUbA3URW1BBxN+wq
         KnQA1Cur22B0iNSod1qwY2pm5fSrVFcGPsXrh5tri7iMmpq7gveXQluFx3qe6ssFhkIa
         CK7kV2t+M8bNIP2S3MGPV6ckBVOBURJCvsvRoJRZp2YGxvIhgoKVyoDUzidf7EBkbuIe
         yFMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780487145; x=1781091945;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Iynfz1W1N4GfIpEnhSfMfTKqIz/C/8nZcfTGa23ppGE=;
        b=dyuRYyc5ivbrrGxJdLXVtCklzNz9BDqui8/DOqTtKQcdESsVXCNOYYiaUba2jJIJLI
         h3f5bXxvd573JB0P1SBSzxhZdejhKTxox91uuCWwl7K44Fuyk7ke9klPvUzOh6z0L9u2
         jwKHoAQJl4krCeC/kG2yUFkpdt/58xskjZfPvWLBwB3TfbVntcQK/i+xwuEBYAJjtom4
         2Kr+Cp1Nfi8s9qQVfrqYSkz1WWg+w2vsJsy+Gy21bORdUneo01JEVha/8KHC02+fbQ9V
         DRl8v/8DsZo+p62ETRHH/+wgurXWlkvNe9gIon/dYpYzffEuFY6cdefEf2BgAsNYmsyd
         cL5w==
X-Forwarded-Encrypted: i=1; AFNElJ8O2SjD2tkedcj3oJ0ACW1y99raM0rOt/gDOy66YFxJa+CX0Uf39JdsiqGsUpgjolzk/k+PJjCDwQY51aoZXO+8@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx2hDUBptO5ro09qw+QgOeeqbN5gFJ2cJR1WrgEvqnGN6tFBX1
	R0k/iFPDbdDacrcZWD1dgP9GWxjCIq2tiZwwJxu3AbEqUSOMxCiibujs1oSMDm/AkgNF2HdCmF5
	JHxTgvxfCR18kE/69MwnSdcQgWQHCTIA=
X-Gm-Gg: Acq92OED00/MOCC3zZ79tNJ0ZVKdlQVgzEwYiiMVE3i2N5gR+TqVvNEWo7EeeXJTZGP
	TyTFh31ZTeGuI30KyI3mi9XlXHa2v0XCyYqjW3TzlaQKexwRyhPnbgf9bLq48+K+RISSXVFwwRI
	gC2DiV6BKnK892dgeWLMErvRYr0i7ZfUDoYrjz8FrTB1LPsEh9MeWxdxdI4sFaBcTmTKbi6w66f
	/j4iTgvK35DJGgyyglY14WznqTTHNz+hYo29s6LcLdM+sHAO6Y29QjwyeRRjbw+IDMDqthN8/n5
	02gFoVtwCHgflO09j68mBcnvOWSJqOpenmlIZyRkalctx4yAXydPIyODBmnzKKgz45EvlfCDAJF
	D362YqOMIEuBKx4WNrxVHfZhVDDczm/U=
X-Received: by 2002:a05:6830:448a:b0:7e6:c734:94a with SMTP id
 46e09a7af769-7e6e9df435cmr1717770a34.23.1780487145503; Wed, 03 Jun 2026
 04:45:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260603072205.3291888-1-hanguidong02@gmail.com> <ah_5utfy2oJbUCw7@kbusch-mbp>
In-Reply-To: <ah_5utfy2oJbUCw7@kbusch-mbp>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Wed, 3 Jun 2026 19:45:35 +0800
X-Gm-Features: AVHnY4LflgzL8o28wk732XkC7u2yUcX4Dke1kxTIgi6mAtBN5-lOxr2Un6SRfDE
Message-ID: <CALbr=LbQPZNiztjqTCmw3J+iNcXuQRjNgHpbM7TJD1ib+wTZvw@mail.gmail.com>
Subject: Re: [PATCH] nvme-apple: Use acquire/release for queue enabled state
To: Keith Busch <kbusch@kernel.org>
Cc: sven@kernel.org, linux-nvme@lists.infradead.org, axboe@kernel.dk, 
	hch@lst.de, sagi@grimberg.me, j@jannau.net, neal@gompa.dev, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, baijiaju1990@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_044546_602072_DB09DF60 
X-CRM114-Status: GOOD (  18.23  )
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

On Wed, Jun 3, 2026 at 5:54=E2=80=AFPM Keith Busch <kbusch@kernel.org> wrot=
e:
>
> On Wed, Jun 03, 2026 at 03:22:05PM +0800, Gui-Dong Han wrote:
> > apple_nvme_init_queue() initializes queue state and then marks the queu=
e
> > enabled. The interrupt and request paths check enabled before using tha=
t
> > queue state.
> >
> > The existing wmb() after WRITE_ONCE(enabled, true) orders the enabled
> > store before later queue use, but it does not publish the earlier
> > initialization before enabled becomes visible.
> >
> > Use a release store when enabling the queue and acquire loads when
> > testing it. Keep the existing wmb() in place for the
> > store-before-later-use ordering.
>
> Doesn't smp_store_release() already get you those semantics?

Yes, smp_store_release() is enough for the ordering intended by that
comment.

The old wmb() after the store does not really provide that ordering.  I
kept it only because it is not identical to a release store, and I was
worried it might have some other ordering effect with later queue-start
operations.

If you prefer, I can drop the wmb() in v2.

>
> Also, there are a few other places doing the READ/WRITE_ONCE() calls in
> apple_nvme_disable. Do you want to update those too for consistency?

For apple_nvme_disable(), I left those READ_ONCE()/WRITE_ONCE() users
unchanged because they are used for the shutdown path rather than for
publishing queue initialization.

The READ_ONCE(anv->ioq.enabled) only decides whether to issue delete
SQ/CQ commands.  It does not consume the queue state initialized before
enabled is set.

The WRITE_ONCE(false) users are followed by mb(), which orders the
shutdown/quiesce path.  A release store would not replace that.

If you prefer the consistency, I can update them in v2 too.

Thanks.

