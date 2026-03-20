Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5CE51093163
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 01:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ayGFwySZHs4z9NIt8eLhyZLQX64EBLltnUs8BhPc48Y=; b=KhrrkWhVDOAh5Lz9pgy2OJ9WMY
	VYJMielkdtujEhQf4YFECDzfGjIajdobPZb6JOS673qcB/2ZtJC4j419ul+gss5HibY4ohDfwlmXO
	meI7Ih6ARwQDyaTXYVX7HxXKF1Pq6Rh/HeVVx03GBS/qCiN391UzetlWXkR6YAjWjeyNxWIQkOnrt
	tNSRRUAPGbDO5IxWGnt34qaVfSlfX+9n3tpWsmzO821TwtQ2fRArn0LpBLbumQ/no2Ld7Suspnoj1
	rthJFQPJ0RI6Wl2kl9pfdvnnbtAQ3/2d5dZggbGRNbsrwXE6gkqBRzY1Df9CTAFYF6tnPxuoJJRO7
	w+xysN3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3OPJ-0000000Bs1h-3tqO;
	Fri, 20 Mar 2026 01:12:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3OPH-0000000Bs1V-3VLJ
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Mar 2026 01:12:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ayGFwySZHs4z9NIt8eLhyZLQX64EBLltnUs8BhPc48Y=; b=MA97By4FX+LaS4VdAbdAA6nS8S
	aVQpzJEsX/qfE5DzX9F+gE9wOXbdyFXX81STDrF5T+KSOPj6MbOoY3tVzjExGslDnHflgB3yemGOz
	svFL00auD0T3IKjRNppRqwrs3e+GbVVgubTvwGG6fxcGlLJpTMhci/OKCHgt8Tf8Q+eQf0+6A3nkC
	pjiWonUfBykQ2MckcaUzRmHOdb9mprQbeFCfjEwaII3IXiESkDtiXxs/ceZnKrx3T/gud3/RL9tM/
	mvi25FoclFi/RDncLNUI01ItfzqlKvODlDwGNFEOy40CSe6ki6sxhGauJ5rjndEkX87tjSjvbPcIR
	nhedgitw==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3OPC-0000000Ejz5-2ijM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 01:12:05 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-486fe2024a9so609875e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Mar 2026 18:12:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773969120; cv=none;
        d=google.com; s=arc-20240605;
        b=lBIenm5PaA4AGlKFwR33oCW2HQ42wmD4g70X/+x2j0k+IWLUj6iLVUMTtIETO8TDNC
         rvBsz9Sg0hoIURkxh7+mmcg60/LSDJGApfXGOtSPZH8rAxjMqAzUAYG4imGKdS6OJYmy
         3wlE3oV4TOCOrXswlBnduY6hM4eynv6Sb2LImiXNe1QjWXUghUm4gO3g+AfWneSFIwwj
         8ydxVHBnHdRBnoVXZMGkiVowoaoCVwUK2RW1+nhS3fHZZVFUhTQJtX7Ga2fg0JaH6hng
         OAGItYhKVS5uRtrFc9nvBIbaY501aL8B9s3ypmTAvqRatmsrzsXsgubPzDNad5EGYyFJ
         tmeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ayGFwySZHs4z9NIt8eLhyZLQX64EBLltnUs8BhPc48Y=;
        fh=Qm2J8QkH2UpG0Tmw7KSdsTkMzoCwRnJHbfq7f80hBAo=;
        b=ZQp8rSs02dFT6darflIgdPPParxR8L1N+dD/JiosIm+f10Ql55geCdgp1VsrSeqgcT
         sode3Vrmn+nBr4qj1jGR7oPWB9ZGMupjMfuhL7NJkCwrRukp9fTfD3OdewonivZW3/9o
         gCUxt7+RUANaFNt5aG3e5oEJ5rpAs0jbSDjGNEd++7ZBgT5VyhSoK+LCHey+Xb901Bqy
         4XFAoTiI6Yh0NR8YcUoDxFBiR+t08HxCYpZVbgcByfPfE70fYBocc2qbog8jXxbPntTn
         7mXMa5MhQMl8ksVaOT/NTfU7lHIUDdoR2PCeZ9pStGUMYEJsO2NhgNwCgHrTgjjnNO3B
         X4PA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773969120; x=1774573920; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ayGFwySZHs4z9NIt8eLhyZLQX64EBLltnUs8BhPc48Y=;
        b=BUQ81l9awK66ZAysVVYxHaX8dqUg3GQ2DLrOUuaQKGPPrgHHecZtwxeShDgSbAd7Fy
         0VodvmxAlMSiylNKmJWSSr+sUeCUUzgcXOuOr7ITQZniPZzKBv3+xhwUXMnk+sBeHdKp
         L6jC8zC7E0sHv+KXuMvLTqA5AfzIhWBo3NMyfRU4ZFFGKOYk/aj8y+STBigdifJXbDKx
         THWv/8T5hoe+fcg7n7hSchlftOMraGlo9tjVtPPISB8BDDb3xyBen9ZYsNQLYpYahKzv
         71pq5DRMDHs9qzJB9prckbU6B+jq7KDkDdfcx2rzjpsBTZFqOIYgE/anMDw344yQQHbg
         7llw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773969120; x=1774573920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ayGFwySZHs4z9NIt8eLhyZLQX64EBLltnUs8BhPc48Y=;
        b=jCc7ZOc5VW9lkHUsF0HIOhp7rB33DiiM1bFH7lghCD26VrqDrbzVBXmWHCWE/ub6eF
         KjXLH8hNwjpxaRLXU7gPlKotoI5dd2SqO+DQYHBK8/Sj+9ZHRfumb2283fsJg9U0ikCP
         Apy1jl13loleRXlC0xuMUeoabbbBfhfrK/R/LHhpfPrE6wSS7mptavRsCmuLAxLAVjRy
         Wi7WOHJWmpkr7KqB9708/2Y2ZxDfrEnOwrwP/wQ6RarmpM5UAiy4HENIfT0kuAixatyk
         OmGDTRolwqhZzS/36D0vjra6EQ997pAu9HlG6pRkWHspdHN7DBxYFM21q1Sm8b84oY9Q
         GrvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV4lSh68gY6vx0kExQ1PIeKK2mBg/GILWG7r9cZpVtKUyqa29VeX/iIDRJ+Jxm3d24K6/dn0GntI/SKIJIGqHq@lists.infradead.org
X-Gm-Message-State: AOJu0YxQ9yZ7qq6751ag8qf8BfgXl+2SOZBdzDQVMiEoAq6mHhC9obTO
	ZtM6T+hoLKUYP/YtRhCsaoz7Zwdg2BKmk+lnpOmjv38ULaVw8edlxvmyWgyXyqeO/vHqVhtmzWQ
	VUl+HIpN/2JVEDDOK3c8NAk21uU1m7lVvA/gwqXY=
X-Gm-Gg: ATEYQzy0YSZv8tg0Gwm7VrdZddnDwM3twMMwFtVeHKAnrp8OfN4j8Xlh6A/vQq7c86P
	ZnttnAox0DpXfxsgqeasN0IAV0yMfYn0s5ylzjefFC9KOpLkuJmXOCL9RTVuKUsBWByMwms+Rgf
	WdQmAMsG4lvS0WX0xsM/giiEMS6ILg0yJrLaZhvxWDX7n1GiMpTf4QAfBOwsVW7Gi2+SRNJ8oHw
	IKM55ET4AexnDSVfIg09vOx06RfgrTzXQE2d6qAotHXXGW/Ta0wVojNX0lHjiw4kGSVZ9cnNEEF
	H2tENNSkSpNviMvCkuAqZAw+vV1jAwUiBO+EOEMi
X-Received: by 2002:a05:600c:c167:b0:486:fc94:d8f2 with SMTP id
 5b1f17b1804b1-486fedbc066mr17394635e9.14.1773969119695; Thu, 19 Mar 2026
 18:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260319184031.8596-1-CFSworks@gmail.com> <20260319184031.8596-2-CFSworks@gmail.com>
 <abxxyHVXp6QpPue5@shell.armlinux.org.uk>
In-Reply-To: <abxxyHVXp6QpPue5@shell.armlinux.org.uk>
From: Sam Edwards <cfsworks@gmail.com>
Date: Thu, 19 Mar 2026 18:11:47 -0700
X-Gm-Features: AaiRm50mRwjPccV1Lpd9XuZSBHTAzYDUmTRqARu72YFqm9lh9utWbuv6pvfVHYE
Message-ID: <CAH5Ym4htit49autJb8E=eatof23YK3qomVBCsXZi2cFR6CyViQ@mail.gmail.com>
Subject: Re: [PATCH net v2 1/2] net: stmmac: Prevent NULL deref when RX memory exhausted
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Ovidiu Panait <ovidiu.panait.rb@renesas.com>, Vladimir Oltean <vladimir.oltean@nxp.com>, 
	Baruch Siach <baruch@tkos.co.il>, Serge Semin <fancer.lancer@gmail.com>, netdev@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_011203_919316_54AC76B8 
X-CRM114-Status: GOOD (  18.48  )
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

On Thu, Mar 19, 2026 at 2:59=E2=80=AFPM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:

Hi Russell,

> Isn't the limit equivalent to:
>
>         space =3D CIRC_SPACE(rx_q->cur_rx, rx_q->dirty_rx,
>                            priv->dma_conf.dma_rx_size);
>         limit =3D min_t(unsigned int, space, limit);
>

I had to think about the edge cases for a few minutes -- yes, you're
right. However...

> (Think of the "full" and "empty" cases as "space" which can be
> consumed to provide entries for the refiller to action.)

...this seems like a double negative: We're looking at the ring from
the refiller's perspective (i.e. considering "dirty" the meaningful
state), and *then* looking at the "unused space" (i.e. "not dirty").
If I used it, I'd at least add a comment explaining that CIRC_SPACE
is, counterintuitively, not measuring "space."

After the bugs are fixed, I'll follow up with a net-next patch [1]
that removes the `min` altogether and makes the loop check for 'dirty'
directly, so my focus here is "minimal, obviously correct" and not
necessarily "tidiest." Would it be acceptable if I simplify
stmmac_rx_dirty() to use CIRC_CNT() then, instead of using
CIRC_SPACE() now?

> I think the same applies for patch 2 - when the above returns zero
> it means we have no entries in the ring that aren't due for refill.

I'm not completely satisfied with the `stmmac_rx_dirty() =3D=3D
dma_rx_size - 1` expression either. One might argue we should keep
trying until dirty=3D=3D0, because tolerating *any* dirtiness risks not
having enough buffers for the next traffic burst, causing avoidable rx
drops. But that's a discussion for patch 2. :)

> Have you checked whether stmmac_rx_zc() also buggy in this respect?

I skimmed it. I saw that it checks the return status of
stmmac_rx_refill_zc() and on failure, returns the NAPI budget to keep
polling -- which told me that the ZC author(s) at least considered
these problems.

Looking at it more thoroughly now, there are a few code smells around
the unconditional `dirty =3D 0;`, and `dirty` being used as the "budget"
for stmmac_rx_refill_zc() (why have a budget at all then?) so it looks
like something's there, but it's a separate bug if so.

Best,
Sam

[1] https://lore.kernel.org/netdev/20260316021009.262358-4-CFSworks@gmail.c=
om/

