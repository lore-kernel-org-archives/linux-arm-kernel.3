Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB043C5DF86
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Aug 2026 20:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0kk0AVAj9nGqTqVxVL78VvobkVLKEhMiHFP97YU4FPk=; b=aT6ggGtj8uMufN89cyrv1BhOXa
	VegtWPST+3lyLT+hGENAonU1TDCJScatrBzbSWA8KYf2+B1Dph5kPTJYh6XOm5+f0E0fLA/jupfTB
	btoPXSDKJc2fMWFIQV/cV/mgIomKuEJYpfVj3G68BVgQ08p5mKQyptouN06DhARuvAiiqkA+gloCr
	p0epVNdzrpaWf+IqCgvYdrAgql1dWso2JjTuQUvRNK7VYTduOPSVliFq+HNeBtsyOFnfin51IljIX
	qCV5DZ3Gr8yMNEIvTPb173imk/46cyGuDxA6QJtbJpegw7WAZTgjdbC/znHfwvC8HZLR6XELynnSx
	GAt8TP8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx9N4-0000000CARH-0ILO;
	Thu, 20 Aug 2026 20:28:18 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx9N1-0000000CAQO-0S7v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Aug 2026 20:28:16 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-6a157f90752so618434a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 20 Aug 2026 13:28:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787257692; cv=none;
        d=google.com; s=arc-20260327;
        b=oP8faLKBTPngyoy41X8PfvdN/S7N5ltY1zp6rq0ttbpaka+Y2sGh/3xp/0vKQahlTX
         GS75KwXerqdBQrAneOZPEGmgj4fZ7nQOG4Cxvyhy39z9U9tKL52phAjW42/OjeDuhG9V
         Kt0U8I+pVknT/esAE8JTW2nwUzU93nMnXsDq/ScBWIxl/W/KJnAz6eULP07WWSQFlYsE
         XsONXxOY/Ym0D8UzYxZ9MM14vrLareL7OkpYk87A5AuXixjHcmRyL0diiU81DkxO13dX
         bAU12lc+Y6/tTUJAfx8LAnZ3dyf9uoep+AIutBjRF9b11XDXJYALSdU8hOSX24PkWYDc
         B3TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0kk0AVAj9nGqTqVxVL78VvobkVLKEhMiHFP97YU4FPk=;
        fh=3qmk9nVwywV96j9Onu5c7+HNNaxdZw4rOCUPYlbhqzM=;
        b=UM7snoS1Y1ZZyLylS18i36lzF63uHoMNAbjQAn8+r82qfnjlxVJ4N/1ErmyYOW7lXk
         OirAdrH4UBbF6agkv5sfAqelvJI5dEqPzyCguw6mE9v3W9Gb1VuAY/Kl+AaRoZISPWo3
         ZpUE69cu4RUDy4oB4PGV/w/V2iPmBayLi/dVOTPynSqSL6VsG0r92gB8rXX/Eu8/XNDV
         eckXyT2qtX1IqDYJD5kVvHD0d8H93iHBAQd3vwYNg9bxqgAXf1UiVGLckYjPv/eVaMQ+
         /ercx/r/GTzPw50Afo8Hj80YfqaLF/qYaCTIlMani8mNZhxEZ9xbNSHQAo+xPGARtXVx
         l0Ag==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787257692; x=1787862492; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0kk0AVAj9nGqTqVxVL78VvobkVLKEhMiHFP97YU4FPk=;
        b=bmef/OS9TNOOknRF3qQ2ggZOvLVqUzzUa+LryC2UOUNGK8s09gjX9lW3k0e1TeL7jQ
         FYrMf2hPS356x3ql80M6EXWNH4bWjVJydPomHcVIRUCkhadEqLLogvI553XMCPCbRfmU
         tNLN5lGAJ1pxCP7DqzbmlZQuq9dpa/Uj53w1WiXDX02GSAO0EWPePFYPe6IkQleE1dxe
         Bh1EQm57G4Z2KHXpt3Dl6jr39HG1Up06pETJshS05jFi73xt0EKdW3xsBeUYXQkxwCxe
         rZ5PKYMuDuBAiy5AgsUfy7Faz4xiR3UL86G0k3kteGQNj2c8HolZ33bJBeotSOw/jw8q
         hsTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787257692; x=1787862492;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0kk0AVAj9nGqTqVxVL78VvobkVLKEhMiHFP97YU4FPk=;
        b=bLb8Vr2ho9n6DzAEdRH2MsqPzPFV92C0Jwj1NGBajE5coRDXmwaiUbz18PUTzvpRuP
         4zyM88oPzijsHWzAqlUOBc/lCohw3U8QKSIrkMRgzQghJr7XhqcqpxihiUvQQ4QL9opl
         HbA/55uA1tCKef+QIlOqrcbEc5xn91b4tKgwL2ue7jXYLz69nxFv+vZTB+cv0yiE1pti
         1QvZ6WYXoHCWCUx55Qvd2mwWMiV0cxvu8G5uQ6HUzFK+lwE3s1oHcFZrnzoQVnigRzDQ
         bc3GNjLKjs4Uwru434brscUwPTCVB5AEYHYhXO7zE2z5nIlCyntD7MxIZJja32a8slFG
         O6nw==
X-Forwarded-Encrypted: i=1; AHgh+RrGRdhk8lHGKkTcQhil8e1xjaePGd9UeWc9ZQ2QeItWR4RpAG/qSfLQe9KvOn1xfeOFXcxchM6FGD98SBFYNrhM@lists.infradead.org
X-Gm-Message-State: AFuF++nQLk8p5kMtCn2BA+sz+Qm2ow19/rLBIhTAYwZarKyGmQ/XADgY
	4PmOoSYrZd+9vzQ9WPVIRAwxwXkA6LYf8bWZGy6BDuzrixPEIJ3DXHZE9k/UYErdovsYsKzpp8d
	SWX1VH0fTT7qvPozk8vyX7mmnv0Z+Gxo=
X-Gm-Gg: AR+sD12IcEicVPCoYUl4dqPXPPR8PrSHputokqSRnpPXJJCnNfv1obGnODQtXBv0kNp
	b74PnNXlOMGUsw2Gi5ECx+p23ghmDacVAG7oSYVUoPu3tTEmPVaXKtkUyV3hiEEUQF83ciFwk4L
	sTroj67JUmz7nQH0v66RdV5102B0cRcSbsb9DWTS6SHJQ0dixltXBigP1tAFKe9zB3uHutO/tmM
	YtVuM905qOIZxGeODrqDQPnrAhXZh9kWsIJVw4R3peOOmHeWIq2iqLKrzeeCDo5OGXmwCVuPccM
	xSkgr4IDFSde3BbTgEKyJfHCRbCntopgPkI9A3gh7aGNZjI8QmDLv9CD5Fc01dwXkCI8hJVn0nH
	b3Lp4fyT6Jgrc8Ul27oDjI7Bxsa2nPOt+cWC1FUdn
X-Received: by 2002:a05:6402:458d:b0:6a3:87b7:b5a9 with SMTP id
 4fb4d7f45d1cf-6a42f1f9d6cmr1132151a12.12.1787257692346; Thu, 20 Aug 2026
 13:28:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260817090601.1256389-1-pawlik.dan@gmail.com>
 <20260817161756.5fd2185a@kernel.org> <CALC2Apj7rQv=6uUqaqBjfJ9yO+VCddQqHB=yDhXH7+QUCh2JyA@mail.gmail.com>
 <20260818082933.28b5c9d1@kernel.org> <CALC2Apj-KLB5CVbSvoZWvA4Oan7dmAerK=VP7W86jmErWW8OdQ@mail.gmail.com>
 <CALC2ApiCSY8DkVpd7puTssbJZMWBHGVtFCnG66fiK0PX7-u3Hw@mail.gmail.com> <20260820101851.0b4c284a@kernel.org>
In-Reply-To: <20260820101851.0b4c284a@kernel.org>
From: Daniel Pawlik <pawlik.dan@gmail.com>
Date: Thu, 20 Aug 2026 22:28:00 +0200
X-Gm-Features: AcwNN1Vsd9SSDhiQPcdRUECjLI5GP2wK-pPfntddOHFbe8M7j0tkDMN1vuQpucI
Message-ID: <CALC2Apgp1rxK4d4z1XcRJv3=O+7uxLcMuNBS0OTi0TbwA+0Fzw@mail.gmail.com>
Subject: Re: [PATCH v8] net: airoha: npu: use cacheline-sized buffers for
 mailbox DMA
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, lorenzo@kernel.org, win847@gmail.com, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_132815_197677_EDD8E891 
X-CRM114-Status: GOOD (  16.13  )
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

Hi Kuba,
Fair point - the interesting part is the mechanism. I don't have the
EN7581 TRM, so I can't name the exact register. From ATF, DT, NPU
firmware, and the instrumented kernel path, the picture looks like this:

TL;DR: Sub-cacheline map length forces SWIOTLB on this non-coherent
arm64 setup. SWIOTLB sync/invalidation doesn't explain the failure -
the response never appears in the bounce buffer. Cache-line-aligned
streaming buffers avoid SWIOTLB entirely and the probe reads 0.1111. The
remaining question is why the NPU doesn't produce visible writes in
the bounce region (high phys ~0xFF6x vs vendor DMA pools ~0x84-0x91).

What's ruled out:
- No IOMMU/SMMU on this SoC; DMA addresses equal physical addresses.
- No EMI MPU - unlike MT7622/MT7986, the Airoha ATF [1] configures
  only TZPC (secure/non-secure for NPU SRAM and EFUSE), not DMA
  address ranges.
- No PMP in NPU firmware =E2=80=94 disassembly of the RISC-V binary shows
  zero accesses to pmpcfg*/pmpaddr* CSRs.
- No dma-ranges in DT - the soc node uses identity-mapped ranges;
  the kernel sees no address translation for NPU DMA.
- set_memory_decrypted() on swiotlb pages is a no-op on standard
  arm64 (no CCA/memory encryption on EN7581).

What the bus fabric looks like:
The ATF bus test code [2] reveals the internal topology. Each DMA
engine has a dedicated port through the R2C (RBUS-to-DRAM converter)
bridge:

    port 0: GDMA/HSDMA
    port 1: PPE
    port 2: QDMA LAN (TX)
    port 3: QDMA WAN (TX)
    port 4: TDMA
    port 5: NPU

The RBUS also has a "DMA block" mechanism (0x1FA000EC) that
serializes CPU writes against DMA reads within 64B/128B-masked
regions, with per-engine block counters at 0x1FA000F4-0x1FA00108.

All vendor DMA buffers sit in one contiguous region:

    npu-binary:   0x84000000 (10MB)
    qdma0-buf:    0x87000000 (32MB)
    qdma1-buf:    0x89000000 (16MB)
    npu-pkt:      0x8A000000 (44MB)
    npu-txpkt:    0x8CC00000 (64MB)
    npu-txbufid:  0x90C00000
    npu-ba:       0x90C06800

The ATF bus test uses DRAM_TEST_BASE =3D 0x84000000 exclusively -
no test exercises DMA at high physical addresses.

The NPU reads the mailbox command from the swiotlb bounce address
(~0xFF6D0000) successfully - mbox_status returns success. But it
never writes the response back; the buffer stays zero, causing a
timeout.

Read-succeeds/write-fails at a high physical address, while all
production DMA stays in 0x84-0x91, points to the R2C bridge's
write path having a narrower address reach than the read path.
Whether that's an address decode window, a write-buffer range
check, or a port-specific routing constraint isn't visible in
the open-source ATF or kernel code - likely hardwired or set by
boot ROM before ATF runs.

So I suspect this is less "swiotlb unaligned-length sync is broken"
and more "this DMA master shouldn't be bounced to that DRAM region" -
but I can't prove the bridge/decode story without vendor docs.

Regards,
Dan

[1] https://github.com/Ansuel/atf-airoha
[2] atf-airoha/plat/ecnt/en7523/cpu_bus_bl2_test.c


czw., 20 sie 2026 o 19:18 Jakub Kicinski <kuba@kernel.org> napisa=C5=82(a):
>
> On Thu, 20 Aug 2026 10:20:08 +0200 Daniel Pawlik wrote:
> > size=3D24 < cache_line=3D64 fails this regardless of address alignment.
> > The swiotlb sync code itself is fine, but the NPU cannot DMA-write to
> > the bounce buffer address range (it reads commands fine, never writes
> > responses back). This is probably an EN7581 platform limitation.
>
> Sure, that's pretty much what GPT told us some revisions ago.
> The question is why.



--=20
Z powa=C5=BCaniem,
Daniel Pawlik

