Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DB5C5DF81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 08:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MGbsiYWGWZERk5A0Z+rH6uIB88SmPGF9IbaUDZNWXi4=; b=O256gYywlOyyoRn3w0hVDcJivb
	L8xz0woQT3lZ6HTKoCPfPCC0+UbUV6r+pIQDPYec6ZAg3fh7p9b7YbycHf5/pq8mOJpHF+keo1i/A
	Bm612EP1NhESiWFGrKKTgPASGB0aklkhEDJHzGNgREBX0HRU5CfVSKt4vKFESJSMMBcbfjeONIEdl
	AeDD8ND7ghz1TALv9Z+DFd20vx3FxWt6k77X2aJSwIBwBJs3cqeuC2mu+iYRrphnC+0aSUOq0e0PG
	VaMbsb+1aU2LSbH3NiXfAHHvetTVknrc/aA8ATnqu89KcSrbc9lvg6fhZwSj0hVS989Qte3cjy2cJ
	UORLG4Hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwy0f-0000000B8sK-1G7c;
	Thu, 20 Aug 2026 08:20:25 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwy0c-0000000B8rM-488S
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 08:20:24 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-6a422090b2fso10983a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 01:20:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787214021; cv=none;
        d=google.com; s=arc-20260327;
        b=nhf9SrkeAO50Kz6ii/RVyvTQTO0FHh7VMAFV2JTbf6vEdEwMTWPwA1UB/NSOIxgpVl
         BXcBl2gju7u9fmiehOx5DdyhTSumjbgQYiq7h5QkKkvP2AYDRzy7Y5JCtwl9iIYpqzwm
         TGuvcOKjvvtgl9T2DNpSf4YAZXqEXA4sBiGxtjOaOuFNnXhex1QSfw1/5AQ2O6kzcG0J
         +Y6gvsYUe6+2fbKbl0/vUGHjjUfHU9Jy39fwjjt/khx9RTAz8z8tvNMjsOF/DUakG6AV
         pTkq7dye3gPvwvfXRWFk0RTm/klGBDhBwr6UtxfgWXEeuPdEx27z7F/yID7yVzj2uP7q
         yBYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MGbsiYWGWZERk5A0Z+rH6uIB88SmPGF9IbaUDZNWXi4=;
        fh=rMiMubzIEEVIshqNwuutv1v+xDVMysFL539YrnjGY5s=;
        b=NIvQVH1sycbbXIIkbJ8sYDBKeQO+IWO71z75LY6ScdtdiLCiMvciH2hRc9RuvsNZ2P
         9o1ExLxw2r++55WUZxSLzJFU2ECE9BE/5u/UIffbzoSNRzVDLupdpQph292WwKBWGgo9
         dllIqZ/WDJiWuZFrejSHwG9CCQMjyDFMMRXQiCpchbKqyE1/VkQvVQ2QgFOo1tqWz17b
         9VfupD8pAFpsHuzSGHWCyKutA7aPycFazQcVRSg8LxZjG9hAp3S0S6soZvvH0tt5Lz2k
         HYjZ3oOwxfwpJrODK4GOvNfakQWYmCQTDitS+iK3B6g/KVWH9XM4Qk3zUxkL02v6xWCL
         rVJQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787214021; x=1787818821; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MGbsiYWGWZERk5A0Z+rH6uIB88SmPGF9IbaUDZNWXi4=;
        b=SHVEyMW3tN/HYhbnSAvvNkSCPZWDHih7Mj/j732ctc99re9pG7iogY9me2APORKpGV
         HRMhxuTxRWdiflziRka7P1EWJl2wMt1iHi+LBgGXXWxxuwdKhxu/a/p9cLmzwsMWX8nd
         8ju2HUCpvGGbfZFerbKW0z3XvbTHgd4RNIW8jFAxmK6cWNgafALy0SCjp69hIwXUa6mM
         vliRew8q1R927KCfOncFe2l/SNS4t7p7Izw65ECOpNOpgxM885dQGMcmEFY/WIgZEwe+
         PNW+FaHxFt4iEqO7pfdCqeAq0ugRgtdSCOJndiarsc/IIESX+//8e92uMdc8gJe+8nSL
         PvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787214021; x=1787818821;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MGbsiYWGWZERk5A0Z+rH6uIB88SmPGF9IbaUDZNWXi4=;
        b=DdoCdypCraLvKd5ImdVIp4dpPdphvctR6EEY3LKhRvPthkmxwDLfEv2g8BIvSKOZjV
         i7EP4IBcwWIaY3NtIpazw09lloXLlQBMIOnaR6QkgHnI27EiOr6/vmjJuiLr7MtaaUA9
         u48V7l96moRJPOxJIghxQlQ6zgdiQetAFQLlqzx2huX1q2UXaBrh5UEfstebuC7KM5hC
         +FRXmHLJqxaSCEee3gCJ/zZRHBtRkyhAPmWRWjlaqKMDe0n16e+/hyLC37S/uRCv2iI5
         JuSs8Z1O464uL10f6Jyv0gVgrQRxXorDYHfXecxQ6rrJbiwloZJbPBIP8CzzNidIdTAe
         ik0Q==
X-Forwarded-Encrypted: i=1; AHgh+RpvLqZlzLlHtGnearln1Ie71Gu1WNfE7Ndf4uiJSM9vv1uElZNs3Nd+2gPah7Lk5VKx6FxwC29WRmeLnWvvFd3T@lists.infradead.org
X-Gm-Message-State: AFuF++nbY/HQqA9dLY5ueExotIO8fFnuVqatRS5yWO8Dd7YJFOCD2e70
	tcmLLiop3bCOB7ENzSDAbkkSbpCUC9MvCaaSCjS6/2obUbirMhZYW39kNVMzk91Qb5EVMwmehmz
	GFkxQ46IKlNPId3A6qnCaVZlbr1y6pvc=
X-Gm-Gg: AR+sD11Bd0T/eZoyt1U6H15ysGU0LY2K3nC2QMBV1OnPphv42iK236yaM4MgUYGIfn1
	3nxO4gf73fvj96ptCa853YcWd4MnwvpvKuo7BZ+eiUF7QU61ay1I2t6bPkzHeqirks15XEANLbu
	FWgdEtx/+xOJIN0HKBUsUMiW5G2iy3Rz5rd4FBlo+tyLBCE80IOaYtJ+YvwYmvqu9gBF350o7GS
	Zd66pEjSPsY4CTskAYG5e/dTJC8b1+yzLTTIYjH8AGy2DbikuQs8NqmFHbMKK2zeYNggIlxoQsl
	xkgSg4CC7XA2VktXqvUjuO/PBhmqQFib8/vFGQrBBRN13UbRL8ROcb8q+TrOgKTtNapvSA/7CUJ
	Q+iyWkeiQmSBOaJfgU4M8g7InbF1B1w==
X-Received: by 2002:a05:6402:5020:b0:6a3:6c99:a5b6 with SMTP id
 4fb4d7f45d1cf-6a40330f52dmr3829731a12.14.1787214020549; Thu, 20 Aug 2026
 01:20:20 -0700 (PDT)
MIME-Version: 1.0
References: <20260817090601.1256389-1-pawlik.dan@gmail.com>
 <20260817161756.5fd2185a@kernel.org> <CALC2Apj7rQv=6uUqaqBjfJ9yO+VCddQqHB=yDhXH7+QUCh2JyA@mail.gmail.com>
 <20260818082933.28b5c9d1@kernel.org> <CALC2Apj-KLB5CVbSvoZWvA4Oan7dmAerK=VP7W86jmErWW8OdQ@mail.gmail.com>
In-Reply-To: <CALC2Apj-KLB5CVbSvoZWvA4Oan7dmAerK=VP7W86jmErWW8OdQ@mail.gmail.com>
From: Daniel Pawlik <pawlik.dan@gmail.com>
Date: Thu, 20 Aug 2026 10:20:08 +0200
X-Gm-Features: AcwNN1UAbW5mRoslcDJeKuGMNRJBvfUzgrdSLmsEfPXWjGmdPxSxk5a_KsgHoA8
Message-ID: <CALC2ApiCSY8DkVpd7puTssbJZMWBHGVtFCnG66fiK0PX7-u3Hw@mail.gmail.com>
Subject: Re: [PATCH v8] net: airoha: npu: use cacheline-sized buffers for
 mailbox DMA
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, lorenzo@kernel.org, win847@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_012023_063799_226D36A1 
X-CRM114-Status: GOOD (  31.59  )
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

TL;DR: The kernel forces swiotlb bounce for sub-cacheline-sized DMA on
non-coherent ARM64. The EN7581 NPU cannot write to the swiotlb bounce
buffer region. Cache-line-aligned buffers bypass swiotlb entirely and
streaming DMA works =E2=80=94 NPU version reads 0.1111, WiFi fully function=
al.

Test progression (EN7581 / Gemtek W1700K, kernel 6.18, cache_align=3D64):

Boot 1 - stock (dma_set_coherent_mask only):
  91/91 swiotlb bounce, NPU hangs after ~41 calls, version 0.0

Boot 2 - + dma_set_mask_and_coherent(DMA_BIT_MASK(32)):
  Still 91/91 swiotlb. Hang gone (all 116 succeed), version still 0.0.
  Bounce-direct read via phys_to_virt matches pre-map =E2=80=94 NPU never w=
rote.

Boot 3 - + dcache_inval_poc before bounce read:
  Bounce buffer still matches pre-map after cache invalidation.
  Rules out CPU cache =E2=80=94 NPU genuinely never writes to bounce region=
.

Boot 4 - + phys/mask logging:
  dma_mask=3D0xffffffff, phys fits. size=3D24 fails IS_ALIGNED(size, 64)
  in dma_direct_map_page() =E2=80=94 this is why swiotlb is forced.

Boot 5 - kmalloc(ALIGN(size, 64), GFP_KERNEL):
  is_swiotlb=3D0 on all 169 mappings. Version 0.1111. 0 timeouts.
  mt7996e firmware loaded, WiFi works.

  Version query (size=3D12):
    pre-map:    30 00 00 00 0a 00 00 00 00 00 00 00
    post-unmap: 30 00 00 00 0a 00 00 00 57 04 00 00
    Bytes 8-11 now contain response data (always zeros in boots 1-4).

Root cause:

dma_direct_map_page() forces swiotlb when:

  !dev_is_dma_coherent(dev) &&
  !IS_ALIGNED(phys | size, dma_get_cache_alignment())

size=3D24 < cache_line=3D64 fails this regardless of address alignment.
The swiotlb sync code itself is fine, but the NPU cannot DMA-write to
the bounce buffer address range (it reads commands fine, never writes
responses back). This is probably an EN7581 platform limitation.

Testing a fix:

Align the mailbox DMA buffer to cache line size:

  aligned_size =3D ALIGN(size, dma_get_cache_alignment());
  dma_buf =3D kmalloc(aligned_size, GFP_KERNEL);
  dma_map_single(dev, dma_buf, aligned_size, DMA_BIDIRECTIONAL);

This keeps streaming DMA, eliminates swiotlb, and works. The separate
dma_set_mask_and_coherent() fix is still needed (fixes hang after ~41
calls) but alone does not prevent bounce =E2=80=94 the sub-cacheline size
triggers it regardless of mask.

Debug commit:
https://github.com/openwrt/openwrt/commit/c9363b2597528eb3badef3bb04608c0d2=
1c81b6f

Boot 5 dmesg available if needed.

Regards,
Dan

=C5=9Br., 19 sie 2026 o 14:27 Daniel Pawlik <pawlik.dan@gmail.com> napisa=
=C5=82(a):
>
> Hi,
>
> I instrumented airoha_npu_send_msg() on EN7581 (Gemtek W1700K) with
> DMA_BIDIRECTIONAL and the original unaligned 24-byte payload. Here is
> what I found.
>
> 1) Every dma_map_single() call lands in swiotlb bounce buffers.
>    The driver only calls dma_set_coherent_mask(DMA_BIT_MASK(32)) at
>    probe but never calls dma_set_mask(). On this non-coherent ARM64
>    platform that appears to force all streaming DMA through swiotlb.
>
> 2) The NPU permanently hangs after ~41 mailbox calls.
>    The first 41 PPE SRAM-init calls succeed (mbox_status=3D0x7, ~10ms
>    each). Starting at the 42nd, the NPU never sets the DONE bit =E2=80=94
>    every subsequent call times out at 100ms (ret=3D-110,
>    mbox_status=3D0x1), including the WLAN version query that triggers
>    the "failed getting NPU fw version" probe failure.
>
> 3) Response data is never synced back through the bounce buffer.
>    post-sync and post-unmap hex dumps are byte-identical to pre-map
>    for both successful and timed-out calls.
>
> 4) Buffer pointer is 64-byte aligned (p_aligned=3D1), size is 24
>    (sub-cacheline, cache_align=3D64). The swiotlb slot size is 2048,
>    so the bounce buffer itself is always page-aligned.
>
> 5) dma_alloc_coherent mappings (shown by DMA-API debug dump) map
>    P=3D=3DD at addresses around 0x91xxxxxx, bypassing swiotlb entirely.
>    The mailbox works reliably through that path.
>
> Representative trace (last success / first failure):
>
>   [19.541] func_id=3D0 p=3D...dfc0 size=3D24 cache_align=3D64 p_aligned=
=3D1
>   [19.545] mapped: dma=3D0xff765000 dma_aligned=3D1 is_swiotlb=3D1
>   [19.541] mbox done: ret=3D0 mbox_status=3D0x7      <-- last success
>
>   [19.588] func_id=3D0 p=3D...dfc0 size=3D24 cache_align=3D64 p_aligned=
=3D1
>   [19.618] mapped: dma=3D0xff765800 dma_aligned=3D1 is_swiotlb=3D1
>   [19.728] mbox done: ret=3D-110 mbox_status=3D0x1    <-- first timeout
>   (all subsequent calls also timeout, NPU never recovers)
>
> My working theory is that the missing dma_set_mask() is the root cause.
> Without it the kernel bounces every streaming mapping through swiotlb,
> and either the bounce-buffer sync path on this non-coherent platform
> has a bug with sub-cacheline transfers, or the NPU firmware cannot
> handle the latency/address-range change that bouncing introduces.
>
> I plan to test next with dma_set_mask_and_coherent(DMA_BIT_MASK(32))
> to see whether that eliminates the swiotlb bounce and restores the
> mailbox. If it does, that narrows the bug to either the swiotlb sync
> implementation or the platform DMA ops for non-coherent devices.
>
> Debug instrumentation patch (applied on top of OpenWrt's 6.18.44):
> https://github.com/openwrt/openwrt/commit/13ea79d9a411dc497882e820e4c8814=
43457bd97
>
> Full dmesg from the instrumented boot:
> https://gist.github.com/danpawlik/b351e8a06218a3aaf68a2cb31a32ea8f
>
> Thanks for help,
> Dan
>
>
> wt., 18 sie 2026 o 17:29 Jakub Kicinski <kuba@kernel.org> napisa=C5=82(a)=
:
> >
> > On Tue, 18 Aug 2026 08:23:33 +0200 Daniel Pawlik wrote:
> > > v8 does not switch to coherent DMA; it only rounds up mailbox payload
> > > allocations (dma_get_cache_alignment() in v9) and maps the same round=
ed
> > > length with DMA_BIDIRECTIONAL, while the mailbox length register stil=
l
> > > uses the original payload size. On this board, mapping only the paylo=
ad
> > > size regresses probe back to 0.0 even with the larger allocation, so =
the
> > > rounded map length seems required here.
> >
> > Please trace into the dma API implementation on this platform where the
> > alignment makes a difference. The "unaligned length" path must be buggy=
.
> > We should fix it there, not in all the drivers (my concern being that
> > this is not the only driver that hits the issue).
>
>
>
> --
> Z powa=C5=BCaniem,
> Daniel Pawlik



--=20
Z powa=C5=BCaniem,
Daniel Pawlik

