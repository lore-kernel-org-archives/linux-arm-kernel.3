Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 663F3C55182
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 18:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YEGYHAhaI5Y4Bh50/L1Jde5LSR6VhkVNUjGLHvvRFMg=; b=l88q9bVZFV/EIY7Smq7GdV1dA7
	MAkrFglSJAhWmAVqmzIX7ApH/p7mEzTlZLezBUcYwVPCl4h1v+qi6wbnd0vw26Yfx3tyBevliVdJy
	Xrd4YJfUXBO57XP5PamgYYVli1mJ5l2b3fPJytlRfftXouyCpjBbmbWQYDow3ZyEWbN260Mwgl1kt
	5aozj1jAHyEDozy/Yf3DlztPaxzubOSiuVClz7fwQe3//ASoNvOHNgcAEJ5Pvm7KomGMlTWcfyyy+
	VZLAVNcR88Zcs3xCvt3EAfUHWmomzu8TH4L0p87RYxhczQuJE0BRe7HntHE6zyr0XgddZiM1HKDLS
	lMSh+Jew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqxmr-00000000Oun-2hlt;
	Mon, 03 Aug 2026 18:53:21 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqxmp-00000000OuS-2e0p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 18:53:20 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2cacef7d299so23215ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 11:53:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785783198; cv=none;
        d=google.com; s=arc-20260327;
        b=VTnvwSwWLGXOuvis4ZLZhEnGiD1uali87WUz35IiPZ7MBWmOn5jQacQJKlFrgzLTX+
         MNu1AVhw+LhmVNZ2aAC//HdaN1SO3ZLNLmAzn8cr8PlZbRWh0aIDOWvX/ZEKvjU826sK
         BelQH0sn91cb/KD4Z6KNAlrCLPNSOZ60hpbcjUjw3U50A/zvYUWgVN8sLzMW/6vvSeoX
         3XB3kARg7CF/fPaljY3I2RoMqkHRp6EDYHHHcznjANGpua/XvGkhspe7G4r8GeY5asBZ
         20D4dofEfNHTR+1gSliRh0aVzfxnbOElnATQShWBnvTPWRuT+OZnTQPQZcwLcDd458ZA
         rR1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YEGYHAhaI5Y4Bh50/L1Jde5LSR6VhkVNUjGLHvvRFMg=;
        fh=AMEhyNP2UrDbKsUUAmW+dxBQSA6ZvqF0DDDuRoL25g8=;
        b=cmzoMQ6C7nX+nmhV0XErgWwR/993o7tA9flsQnyJGoLFC1Ukgi7+B1xzSYbcHoGkKR
         Jbzh3gEJOFcVTO80pHF3aa+3rKzZ/0VGvhiKe6smhWTz/0xGmPl4E89oOgIq4VjbMbgT
         E7jXca11Lwzf3mh4MbLimY/r4LpceLpI7K4gd40KObycXvNqAHTKGVxe4jyEz2Fyyqaw
         CmiRjwMbgTsOKgXO3yB12N3+Egi2X2pq3F5WxdtZOyeug7oV0tawNf7IxT7j7NcsGmUf
         TykxsUUtgTALEg/APE2pSmB2ujf/WgcI55fdFMMPpXHx5xTdb+amZyrTTsWV81Giw5VS
         dWXw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785783198; x=1786387998; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YEGYHAhaI5Y4Bh50/L1Jde5LSR6VhkVNUjGLHvvRFMg=;
        b=EgYmd5karimAl/2ju86OAEWq1EYXuBttjquX+xkS5MNMNqDw/kwsUkKYoEf1gBvjU+
         3HKyX8oAenFCEsttWpu7E95zfx/KVTa7q+0p+m+aDzEBuzKEy/uc/J7lkklk3GxShf3i
         vjnqr65v4S2znMW4vGvDjgq2UWdKFyMQPmfSO/w488DjTawvAlNQb7jvdKUGCAwPDjOm
         WPd6V/CtrNsbWFM+kjkcXQuPYYUjoBw+3ByQcXL+v2Gaoyx6507g8qC91sMQv3hDY1Xk
         WoHms5v0PqMW+PhaFCIoIiCDECgaE6L9WaVKdlTBwMYkAioAoGKCs1/meLtTYF2oRHHT
         oLbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785783198; x=1786387998;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YEGYHAhaI5Y4Bh50/L1Jde5LSR6VhkVNUjGLHvvRFMg=;
        b=TvdBXiWmwFRNRvX7dxoJtk3VDuORLw0gFrk8EUC9Y2zQfAtpVzNRoTKDMRSxJw+G4P
         Jl3KgkGAolEOEHO7xbe7ZnqArT+0i6lzkEU+j7M57/mvk4api8vgQxYgR4RRyocjlwAQ
         4RbhZ9VI/FO05c9lwfWD2nfHVyGBkHxx7uTsTHqBEbeh8fLBy1NmZjLqDeLzN/cZ0dxS
         mauSfezHA0/tQYo7McVojaWPQhsVY3nrIBRdMeqGu5BEQAp0CHqWviXo9F6JM7rwIzFW
         Di5MVLg9th3mJKIMgkQUg1GrFpDzKKHaPKBVCpARJQe8Ls2iqGGFmdaqUxXXsFdoBvOx
         R4pQ==
X-Forwarded-Encrypted: i=1; AHgh+RoZ3bbApsltXccWIKWj2mpqgw54Ts59iubDTp4lfXNdjzXVmw4Z/Wekx83T7APBf9qoQVeMFWHqJIamH7CvqEqh@lists.infradead.org
X-Gm-Message-State: AOJu0YwHR30Ov6BXp786zfk+hO66Zzx3BTR58XuriUI1i1LH8ZHAiNWd
	9gjz4h7mlZRNfFTVkiaJaPCIj4mgMOLXwOg5PBz8P7ch10cT7SUyvgs6Keu7y0pXiiJIGDUMXvN
	pICySWj80C5Ksoigl7DX6HESca0m6XOlZyFzc8KSQ
X-Gm-Gg: AR+sD13W+81YvsqWKetMp1AxCty7jWNA6O+RG8IYtkXZGocsRJxD5XtGTQetr0ZXtLV
	Ge2zMFpPIfw1RjBx8/kzCUZSh/KQLxf4QWxVvaX8qZTVpCWXxvD9GvWToZw8vYUXm7h3wMcqpLc
	mlnQZ1xAedJWIV5/gSnMhoU5aI6pihTDBl+0kKOZ+2LUZ2jcOnykmHS4gdfKDwjJiMGY8qEHwoV
	Pl6j4VsXNCBuMJzW1QIePD1dl7sQk5tL3KPc6aCnPGMd3/RBRUbovoQDZC0L3pReBMM/p5QQTlg
	SUXFJ6vrkaKtn2wVUjqOdWLtn5qkMc5Glz/b1nwLYJCcVaTES59IHXo=
X-Received: by 2002:a17:902:d60f:b0:2ca:be81:b469 with SMTP id
 d9443c01a7336-2d08c64e00bmr2176265ad.0.1785783197790; Mon, 03 Aug 2026
 11:53:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260803070513.4657-1-muhammad.nazim.amirul.nazle.asmade@altera.com>
 <20260803070513.4657-3-muhammad.nazim.amirul.nazle.asmade@altera.com> <CAHS8izN1mCBH5=ERy9OKaeC4Wz2-v2N2oGDW34P=ZoS7oo2aOw@mail.gmail.com>
In-Reply-To: <CAHS8izN1mCBH5=ERy9OKaeC4Wz2-v2N2oGDW34P=ZoS7oo2aOw@mail.gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Mon, 3 Aug 2026 11:53:05 -0700
X-Gm-Features: AUfX_mxKt7Hw3ljuyeXscU2rYJEdlvkjRCcwEfsOQmBdLq4h2KD5KKl3NZxDn60
Message-ID: <CAHS8izO_wq4GRmbej=A0zQymB+mBrruD8zGtS5Afa2OGuSN9Qw@mail.gmail.com>
Subject: Re: [PATCH net-next 2/3] net: stmmac: Use pagepool instead of
 streaming buffers for Tx
To: muhammad.nazim.amirul.nazle.asmade@altera.com, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, dinguyen@kernel.org, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com, 
	kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, alexandre.torgue@foss.st.com, peppe.cavallaro@st.com, 
	joabreu@synopsys.com, mcoquelin.stm32@gmail.com, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_115319_677110_2A7B82CD 
X-CRM114-Status: GOOD (  26.81  )
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

On Mon, Aug 3, 2026 at 11:39=E2=80=AFAM Mina Almasry <almasrymina@google.co=
m> wrote:
>
> On Mon, Aug 3, 2026 at 12:08=E2=80=AFAM
> <muhammad.nazim.amirul.nazle.asmade@altera.com> wrote:
> >
> > From: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>
> >
> > Use page pool buffers instead of streaming skb buffers in stmmac_xmit
> > when snps,pagepool-tx-buf-quirk is enabled. As page pool buffers are
> > recycled, the overhead of dma map/unmap for each transmit can be
> > avoided. There is a trade-off of copying from the skb into the page
> > pool buffer, but this helps where the copy is cheaper than dma
> > map/unmap (for example with IOMMU invalidate cost).
> >
> > Currently page pool buffers are only used for single-fragment transmit
> > in the non-TSO path.
> >
> > Signed-off-by: Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.=
com>
>
> Whoa!
>
> I haven't looked at the patch deeply to be honest, but using the
> page-pool for tx is a bit interesting. There is no other code that
> uses it like that I think. I can't think of any blockers off the top
> of my head, but I think there are places where we keep a global list
> of created page_pools on the system/netdev and the code parses those
> lists may be assuming it's a normal page-pool, which is a pp used for
> rx and attached to the an rx queue.
>
> Just Ccing the maintainers of pp to know about this use case. I can't
> think of issues again, but I wonder if a more-expert has thoughts.
>

Ah, yes, gemini reminded me of the most critical bit. The page_pool
actually doesn't do concurrency checks on allocation because it
assumes allocations only-ever come from the napi, and can't race with
allocations coming from another napi. Does your patch account for that
somehow? Or can allocations in tx come from multiple cpus in parallel?

Full feedback:

```
  ### 1. Concurrency & Memory Corruption (The Lockless Fast-Path)

  page_pool allocations (page_pool_alloc_pages()) are lockless in the
fast path (pool->alloc cache). They inherently assume exactly one
allocator context (which natively maps to a single
  RX NAPI softirq).
  If this driver allows multiple CPUs to concurrently enter the TX
routine and allocate from the same page_pool, the lockless cache will
immediately corrupt. To use it in TX, they must
  guarantee:

  =E2=80=A2 They allocate 1 dedicated page_pool per TX ring.
  =E2=80=A2 The TX ring is strictly protected by a spinlock (e.g.
__netif_tx_lock) during all allocations, or they are utilizing strict
CPU-bound XPS.

  ### 2. Slow-Path Contention (ptr_ring Thrashing)

  Even if the locking is safe, performance will likely tank due to
NAPI mismatches.
  page_pool keeps its speed because pages freed by the NAPI context
are dropped directly back into the lockless alloc array. If a page is
freed by a remote CPU or an unbound context, it
  falls back to a spinlock-protected ptr_ring.
  In a TX flow, if CPU A injects the packet (ndo_start_xmit) but CPU B
handles the hardware TX-completion IRQ, CPU B will constantly push
pages into the locked ptr_ring, and CPU A will
  constantly pull from it. You lose all the lockless benefits of
page_pool and just burn cycles on cross-CPU spinlocks.

  ### 3. Memory Waste (Page Splitting)

  TX injections are usually small (e.g., bouncing a fragmented
header). page_pool allocates strictly in PAGE_SIZE chunks unless you
heavily orchestrate page_pool_alloc_frag(). Standard
  SLUB kmalloc() or skb_alloc() is almost always cheaper, more memory
efficient, and more cache-friendly for TX bounce-buffers than spinning
up dedicated page pools.

  TL;DR: Unless the TX allocations and the TX completions are strictly
pinned to the identical NAPI context/CPU, and they are allocating
massive buffers, throwing page_pool at the TX
  path usually results in lock contention and memory inefficiency.
They are almost certainly better off using standard kernel allocators,
or at minimum mapping DMA_TO_DEVICE correctly
  over standard per-CPU locked pools.
```

--=20
Thanks,
Mina

