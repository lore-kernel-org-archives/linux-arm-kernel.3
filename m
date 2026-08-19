Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61ADDC5DF6D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Aug 2026 12:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLw7yk5kNbZMeTw+UMLOAwK7lyRv1aw53p64YFqkg7g=; b=UOUoMTicfpAuLmC4oDZD0LA/No
	NRrI9WJFceI+K8Vtn3KIg/DZk9z14Oze/UfIqGkaPAn9j+M5EzCd+eyVlqReZ8aY9yXM74Inwpz17
	bZtLcrHqGE3mI6VogxjXyMvYAB9S0//aIwAqNZVIexWdORX1TaPBRwjEjbF2zFy8GI6tCcpTabYbB
	ae5aXj3lWqKJMMhvotKl/XCjrYHRWohVstZ8B0LrspubRzrgtPA1ndWbF6Dzs42LAjoDIy/K9PG84
	ySWOFfy6Y6IU+p5ntnLWsmiv0EF6vBQlwCbNNyJ5iTlm1n13fZ4S/CxnyFOTerccOPAHRy0Py5mS+
	mqEO5XdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwfOY-00000009kBJ-0i6r;
	Wed, 19 Aug 2026 12:27:50 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwfOV-00000009kAM-1Jef
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Aug 2026 12:27:48 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-c207cb16cf5so155018966b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Aug 2026 05:27:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787142465; cv=none;
        d=google.com; s=arc-20260327;
        b=JEZhf05BHgHydxJHUo41dE2GAudFfD/C8g3s5GK6lKIiOpPmHrfXE2spR6QWgib98D
         aXVuReFzNyLREAkvtqmfzLgGVKP3V5eMVSb8lh81JpHB7+pI4mKX4NCrbb70Br0gC0R6
         yJ/YP6joKZftsJViyv2gQPzlPVCnFyH6DbL1mfkh3qle227a6U0i2al22jpxhTA8dGbe
         11/pRjnydKeDrUWoAFt36//YVxc8mUuoTq2/tiaCDBc50I0z+lrYy4O5c5mv70BTa/sG
         YFo8a5npxUiPt0dU+5tbzagHmMXlkAiYM3n0+wvrdZRajFcSIxbETJP4a5UxrAozxemE
         fjdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oLw7yk5kNbZMeTw+UMLOAwK7lyRv1aw53p64YFqkg7g=;
        fh=msVrp+C8lJdYvQT/3puZhsSmhXjTcljS/gB4wEX4GTc=;
        b=p/PCRPnU81dfXPBl8t5iPpZFBIdGHEDvpgkR6gvBlfSZZc7v9QFOMqgLwVCl2GJdsD
         nZMybYgBuTwkdCZSIs1iNFgH6K9UzQ1z7mhWVCHreZiBff27A0D4e/Mz7cbTFlEy/COo
         xqKxdjhrCwHhDjt8oBvnNAjkTID13KtftQpD+1O+goHIDOi6RnNelrseRCHtPze1jgUq
         BR9RS5W1oME4QDDUWHN96tdE1I90q4uCZeTujxw2HF6MW4e1vPfyvAEHeJAkfvH3yeUS
         6KeRHpmUwfCyGBGcjRjewqJWJDvlXWNufAmXY8k7J2qNBhJXydIgEnbK7uDMcv8JBPBn
         yesg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787142465; x=1787747265; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oLw7yk5kNbZMeTw+UMLOAwK7lyRv1aw53p64YFqkg7g=;
        b=cPK4tyuofU79qlOnWG0gK8vCni7KJkdGV5LeQ4IKKFdYAbxw7z0bSMmbi4zkTLuG+j
         Vebn0Oy4hSNUQLbZgRZrKwEPJc7js4ZPZalwZ2BOoJ2eDe0LQDbNZEt4jPNqcgLtDy1M
         tck2UiTtft65zHXzWOAInmzxHGtGMpcT4NKibU5b0SsHKsqILaYJj527qSEZXQYzvrkM
         anj24Tm7YMD/A93fhG/Sy/JEWo1ivvtdDEmcRXxP6dpUjlZKgS2XJxkRL2bpcbeLf57q
         IgitJ8g1uviMjsWTy7zuid+QUw1eH45jc4bSFzUELiQdM9E2iTEV2p3V5G0b5/Mm0aRy
         JYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787142465; x=1787747265;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oLw7yk5kNbZMeTw+UMLOAwK7lyRv1aw53p64YFqkg7g=;
        b=L4oRWwNQy4tLzARWoUxYdgMLxKbvGn2Rw4REdSadAK6MvmE87Kbf8h6fayVy8aZsBB
         ZyOBoC49GhbPzbuDDz5c+0UyOzD7C0mTXNZ+CsvxA+vR1u2VxkPjCwZOetHF65cLc7BT
         3Pc/Yx6GRxTIWE39UX9rrP/BoVBBxSo4mMo5JFjCBzAPOLKlDJGI2DjMBL5BVOFic7Tk
         vrzIovExL1oWo+rZihN7bph9AzGR7PQamKD4E24aPuRy7HWa4w5bLgz7Wk0pDERRBGdB
         6PK7jttUYsGDaVJkNczVRxYFbOL1FbSG+UgaKnx6bt2/AExeYhe5mKROwrf08RRzO6ll
         s0Yw==
X-Forwarded-Encrypted: i=1; AHgh+RqUv25+UbwywU2/Z9ZR9L1K87LetG+h24cQBadpr0N24cO2I1J9i291t8Mr3z/jXGlaSMRz1aGHfa7gMiXsanHn@lists.infradead.org
X-Gm-Message-State: AOJu0YzwUc6tq7VZY0/ru5UdSEpwDsktYc471txPxCzjmscdyYnfXNcS
	u680nf9JaSRChzzF8RwJoqF1sv/qUE1kjfo+sAR2yOH5YcdKuvCamzT9V8GpwAqaPiq+OeGsTyY
	ga+u/Xj/vEYzYKNEWZEuhDPohJB98UqQ=
X-Gm-Gg: AR+sD10foUmL+Gq+8DmtWi8RDxsQ5PfUOsaagJrWdB2RbUSI/s00kUvnQPwIVyBFH3H
	DbhF6U489PRlWDUTWnvebZCWKuUg73GqhJk7pu8C89Yb+ic6TEUh9mQfk0Ls14Xm2lMNHbo99f2
	bZXRWdljHyFErDiwKhZ22eE/g2KsqHvTF2H15wbZR4x1jFgLeAPRLeMlm0YCftGIRujG3TQOOhQ
	vLHum7dsLWae6sgBaALLeqd4nDoilgzk7zHEWxjQZ68v43qqOTPLMG+NbfV76W4Iw7lfB+cneyZ
	fGM78VH4BbNXAIiGE6WBiNESqG+U6fgGodoVg1vaQF+G0bNurWm8hAVKl4XN1ZbqPPQ89R+qOcq
	PHtiHJhMsnRZkiRKkpw1T4oOCAeIkDw==
X-Received: by 2002:a17:907:a892:b0:c1c:5c90:1bb0 with SMTP id
 a640c23a62f3a-c23f92d6210mr244553366b.8.1787142464393; Wed, 19 Aug 2026
 05:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260817090601.1256389-1-pawlik.dan@gmail.com>
 <20260817161756.5fd2185a@kernel.org> <CALC2Apj7rQv=6uUqaqBjfJ9yO+VCddQqHB=yDhXH7+QUCh2JyA@mail.gmail.com>
 <20260818082933.28b5c9d1@kernel.org>
In-Reply-To: <20260818082933.28b5c9d1@kernel.org>
From: Daniel Pawlik <pawlik.dan@gmail.com>
Date: Wed, 19 Aug 2026 14:27:33 +0200
X-Gm-Features: AcwNN1VrJEfvg5ZvmKtuPToUsD-4XONBWJ61vlul_aZ3nC7ZUbLE5WyISNTim7I
Message-ID: <CALC2Apj-KLB5CVbSvoZWvA4Oan7dmAerK=VP7W86jmErWW8OdQ@mail.gmail.com>
Subject: Re: [PATCH v8] net: airoha: npu: use cacheline-sized buffers for
 mailbox DMA
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, lorenzo@kernel.org, win847@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_052747_388402_268F0367 
X-CRM114-Status: GOOD (  19.67  )
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

I instrumented airoha_npu_send_msg() on EN7581 (Gemtek W1700K) with
DMA_BIDIRECTIONAL and the original unaligned 24-byte payload. Here is
what I found.

1) Every dma_map_single() call lands in swiotlb bounce buffers.
   The driver only calls dma_set_coherent_mask(DMA_BIT_MASK(32)) at
   probe but never calls dma_set_mask(). On this non-coherent ARM64
   platform that appears to force all streaming DMA through swiotlb.

2) The NPU permanently hangs after ~41 mailbox calls.
   The first 41 PPE SRAM-init calls succeed (mbox_status=3D0x7, ~10ms
   each). Starting at the 42nd, the NPU never sets the DONE bit =E2=80=94
   every subsequent call times out at 100ms (ret=3D-110,
   mbox_status=3D0x1), including the WLAN version query that triggers
   the "failed getting NPU fw version" probe failure.

3) Response data is never synced back through the bounce buffer.
   post-sync and post-unmap hex dumps are byte-identical to pre-map
   for both successful and timed-out calls.

4) Buffer pointer is 64-byte aligned (p_aligned=3D1), size is 24
   (sub-cacheline, cache_align=3D64). The swiotlb slot size is 2048,
   so the bounce buffer itself is always page-aligned.

5) dma_alloc_coherent mappings (shown by DMA-API debug dump) map
   P=3D=3DD at addresses around 0x91xxxxxx, bypassing swiotlb entirely.
   The mailbox works reliably through that path.

Representative trace (last success / first failure):

  [19.541] func_id=3D0 p=3D...dfc0 size=3D24 cache_align=3D64 p_aligned=3D1
  [19.545] mapped: dma=3D0xff765000 dma_aligned=3D1 is_swiotlb=3D1
  [19.541] mbox done: ret=3D0 mbox_status=3D0x7      <-- last success

  [19.588] func_id=3D0 p=3D...dfc0 size=3D24 cache_align=3D64 p_aligned=3D1
  [19.618] mapped: dma=3D0xff765800 dma_aligned=3D1 is_swiotlb=3D1
  [19.728] mbox done: ret=3D-110 mbox_status=3D0x1    <-- first timeout
  (all subsequent calls also timeout, NPU never recovers)

My working theory is that the missing dma_set_mask() is the root cause.
Without it the kernel bounces every streaming mapping through swiotlb,
and either the bounce-buffer sync path on this non-coherent platform
has a bug with sub-cacheline transfers, or the NPU firmware cannot
handle the latency/address-range change that bouncing introduces.

I plan to test next with dma_set_mask_and_coherent(DMA_BIT_MASK(32))
to see whether that eliminates the swiotlb bounce and restores the
mailbox. If it does, that narrows the bug to either the swiotlb sync
implementation or the platform DMA ops for non-coherent devices.

Debug instrumentation patch (applied on top of OpenWrt's 6.18.44):
https://github.com/openwrt/openwrt/commit/13ea79d9a411dc497882e820e4c881443=
457bd97

Full dmesg from the instrumented boot:
https://gist.github.com/danpawlik/b351e8a06218a3aaf68a2cb31a32ea8f

Thanks for help,
Dan


wt., 18 sie 2026 o 17:29 Jakub Kicinski <kuba@kernel.org> napisa=C5=82(a):
>
> On Tue, 18 Aug 2026 08:23:33 +0200 Daniel Pawlik wrote:
> > v8 does not switch to coherent DMA; it only rounds up mailbox payload
> > allocations (dma_get_cache_alignment() in v9) and maps the same rounded
> > length with DMA_BIDIRECTIONAL, while the mailbox length register still
> > uses the original payload size. On this board, mapping only the payload
> > size regresses probe back to 0.0 even with the larger allocation, so th=
e
> > rounded map length seems required here.
>
> Please trace into the dma API implementation on this platform where the
> alignment makes a difference. The "unaligned length" path must be buggy.
> We should fix it there, not in all the drivers (my concern being that
> this is not the only driver that hits the issue).



--
Z powa=C5=BCaniem,
Daniel Pawlik

