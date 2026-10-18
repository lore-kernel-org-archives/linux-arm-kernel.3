Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A55CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 19:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QHwvsvqVjCSuPQ9w9gIFwqDJ0IFeW7rQfd/iiwke0Ww=; b=HPqgtezOx/kr8J3Cvv2q+owm6L
	WXEEj+Yyowbb0r9dk4m3r2Y6DdvD8cELH7vaqqnumdZ4X3UDX3UuqiUJzH/YyVwBBPqjkpPNu8wmR
	/Wl0gZKX6yhV/O9k6nIoHzi0jPR7SS0Bi9QsXl8kHBL1V09VD2LCFn5YrCPOxwBXaIxJN0YGPUny8
	fowvLYOWFbYtUTieYx7Ze/eSVwTWCQmNRicV9UEmCHh1czIq+BOqEs8q/BxgpS35c2HdhrioxJkTX
	qWGKkwBpS/ZkBpKuF3A1TUH3lGbSlwESFYuxtwIFWvQ3zHYqRltOIvxTuSyvxTMcRSXDqDCCT/KfN
	8+JGl7uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIWlp-00000006BF8-3sZb;
	Sun, 18 Oct 2026 19:42:13 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIWln-00000006BES-0me7
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 19:42:12 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-c2e8c710847so166208866b.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 12:42:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792352528; cv=none;
        d=google.com; s=arc-20260327;
        b=YAwVD66nyiLcR8T/Vl+D9A0zcyF6JQnVNn7+93d7t9wa4+KUKQGWpMBEXscg/ZJ5v8
         MDNuFJ6A2wToHoU6Wg41+DohrkrcioR9Ejlu2KC2hV7/u6SQehidI8SNlzBH3CjsYc1X
         GtpGnj6cXpxaqGrmdBhatuhdFCpLpMXLXcD2j5bHLohAL464pjrSiJtcxV12AijC1CQv
         5NCGr/ERGZiEwK8r7huysnoUoKKqOg1flZlKeew+RWtcb5HRVPQA/nc5KFyeCwAUF8rC
         tLMszep6X0urfOYzcs9BVoLXYD7KztEaO6YUiCw+2A6S3PgAx49cp7yG8d0MXOk53ZvY
         K9Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QHwvsvqVjCSuPQ9w9gIFwqDJ0IFeW7rQfd/iiwke0Ww=;
        fh=Tt0qffLz3L0O42EQbJLzXytQcigboqSmv0YrYU1RfwI=;
        b=E1Plotlr8b/cxgJNjDm2yxk8HK1pTCCetqWo26uhl2syXTNaek5WZPjIcLwxShNcf5
         6RovRGTNdvU2xOgmMVVXbZncD2Je+/+vQFSl6+kO/+CWUjOQDYNs2NEN5UQyafX4QdVT
         Nsh/JEN4xT9GvFCaQlBAigDwioyk+ssGzWDaS3IG3tyAlDpEQ80B+Ko+KEUPmuFs4K+Z
         +dp/tPplTKMU6Zc7JhACqv9ixzjmHEcjgqRK6jnZVlT8L4Qg9YCGyqMQThHYu7wHmlIp
         9Wf7Bu/A+cBNkEgn7TpgyIfnANI17znfut3rAbzyjDdFR4cVWauSMZbwmciVmGr7UYvq
         Ucow==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792352528; x=1792957328; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QHwvsvqVjCSuPQ9w9gIFwqDJ0IFeW7rQfd/iiwke0Ww=;
        b=Dq+SuamBXXmlk7UB/dbBtfYdfFgcUK6QSz6ajQrFXh2wYbJlIBrT4/r/vX/pvDEvHG
         /Xf1tseQvjSTrinGEFP4gMPAv8nLXjdlaJrXi2uXzcU6wNot0m7rpX1GAiRZLbjD3KJ8
         Mso6AFo2BwIT8Xew6gHfRphMV6zpfIBcDO6QElSAK947SoU7ofjIcYqeDVU7SZ3hsKrb
         UTvuIZ0ikEeq2e6tNsVkm2/ShX07AAxrCYLRzsuIqDoo/3CtB9fG/REkI4796nKMdZ+0
         4ha2i95q4P/fp+bUKUUyqYhH0ZeaV9ncze23a0aV6XJoe01AkovwWOCVnmrMQbgVlwht
         KAyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792352528; x=1792957328;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QHwvsvqVjCSuPQ9w9gIFwqDJ0IFeW7rQfd/iiwke0Ww=;
        b=J1ibtO47+7q94fzztkL2H4+frbH/0IFKrJigO2/yItBQ9pfx9x4ieWi3SEnYyIKCgz
         mLI5o3H/wCmlrI5vIEEm9TOFjdsERwOz7/MKSUZRirSh671J6Fw6pd3C3mmd3UqR9hqG
         puzoIRsiI3QMiHl91dA3TV3swcUKEM4i8FdZe0j3OD3GdL71J1VvXJ6doILKHvDI8onT
         hBEwocClXmg49Fms/l0L0G7QuvqD3wCZ+gL0dqyUUy/icmQP1yrUzM4OLcG5gI6t4di8
         fUcRmqxqbaMiMHL/96KjrUtBVrXumYRIOb6QQKoRdZibIrIsJd64wv1uK/EyCfczxaCB
         y6nw==
X-Forwarded-Encrypted: i=1; AKwUvBxt1o8GTHE/x/Cw0304YfVJ75Wwzy72DedI718SAEtNsu0iY4KOb16HjSuo6kgRzYj1wPeWSVDBjweIq59vI27I@lists.infradead.org
X-Gm-Message-State: AFq9FYJOB/o8l/aCes0q0QUkb0uXBgWrV6s8WBX64sYu29y8NE3rQund
	CIJQp3FcwL6mRncGNFbo/w/95yKtyA6vuOxX4IuOPoN93UC1BV5KS1PW9kibV024igwuSrBpNYc
	dnrnvPJtpRTdPwF9EFk2kkLXqUY6Z4Ug=
X-Gm-Gg: AYBFou33yZe5ymknyALTAoSo8YYPglgfNcr6b2vJrj28nfbFVGo1CqKmAzIy2Vcm0ww
	UUlOijJGNvWPbfkUC5Bl7OT2/c8bS3zyr6g67hL8LmqnJuELEnTzJe9kLUPzlvgYRZYgLjz+Pf7
	8LEWVFRG9xvNRvKB2jWhKJstFzWB/QhXbSB+X8Lh95zvX20c9OQnUW90jeOf4pVD47p+wVUR6mR
	DFfJl8KdHA/BtQNipFD+QUE58fbj1Uc07ft5ndFddJT4Hh6HZl7DG+bjHYzYBAzGdfh8JPMhvXX
	x394qnFeglRYkgqhQUUda0nnfuo/Y/N5QzwElbJj1fyO0VX9HSnxeKH2hDm7+GHCXFElkGPK8Ag
	MmjNnga5boPz2He/psV8BXKkIc5vQWvZ30kkoxIyQXkM=
X-Received: by 2002:a17:907:e1c5:20b0:c41:cf68:bbd0 with SMTP id
 a640c23a62f3a-c41cf68f3a2mr204540166b.26.1792352528196; Sun, 18 Oct 2026
 12:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260820085941.380401-1-pawlik.dan@gmail.com> <20260820085941.380401-2-pawlik.dan@gmail.com>
 <CALC2AphzQ=dHOk2Yjtaw=i2euCLxo+Lk0kO50ixtYydO0yzBHA@mail.gmail.com> <atCRsquzA1UxSpCc@mediatek.com>
In-Reply-To: <atCRsquzA1UxSpCc@mediatek.com>
From: Daniel Pawlik <pawlik.dan@gmail.com>
Date: Sun, 18 Oct 2026 21:41:56 +0200
X-Gm-Features: AclHuK-9M52vzlkmmRQHSoaXu2S7CfmvA6Nr1UPIKXQnzj9cVhweDgXmDdWoET0
Message-ID: <CALC2ApgG7gQx7af_6_barG_mxMY90Q5JGrCF1uHa3j=B67p6Ag@mail.gmail.com>
Subject: Re: [PATCH v10 2/2] net: airoha: npu: use cacheline-sized buffers for
 mailbox DMA
To: Zhengping Zhang <zhengping.zhang@airoha.com>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, nbd@nbd.name, sean.wang@mediatek.com, 
	Mark-MC.Lee@mediatek.com, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, andrew+netdev@lunn.ch, yangshiji66@outlook.com, 
	upstream@airoha.com, szymon.datko@gmail.com, lei.dong@airoha.com, 
	ansuelsmth@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_124211_283294_453D60D4 
X-CRM114-Status: GOOD (  32.58  )
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

Hi Zhengping, Kuba,

Thanks for confirming the NPU address window.

Please consider v10 2/2 withdrawn. It avoids the observed SWIOTLB bounce
path but does not ensure that DMA addresses stay within the NPU window.

I tested W1700K with all 2 GiB of RAM and the upstream DMA_BIDIRECTIONAL
mailbox path, using a restricted DMA pool at 0xbc000000-0xbfffffff,
without either the cacheline patch or the coherent-mailbox workaround.
Both the NPU and MT7996 drivers report version 0.1111, and all three
Wi-Fi APs are enabled.

The OpenWrt change is posted for review [1]

[1] https://github.com/openwrt/openwrt/pull/25928


Thanks,
Dan

czw., 15 pa=C5=BA 2026, 10:41 u=C5=BCytkownik Zhengping Zhang
<zhengping.zhang@airoha.com> napisa=C5=82:
>
> Hi Daniel,
>
> We investigated the NPU V2 address handling and confirmed that the NPU
> exposes only a 1 GiB DRAM address window.
>
> The relevant vendor definitions are:
>
>     #define DRAM_RANGE_1GB 0xbfffffff
>
>     #define DRAM_CAC_TO_UNC(x) \
>             ((x & 0x3fffffff) | 0x40000000)
>
>     #define DRAM_UNC_TO_CAC(x) \
>             ((x & 0x3fffffff) | 0x80000000)
>
> Therefore, the supported host cached DRAM range is:
>
>     0x80000000 - 0xbfffffff
>
> The corresponding NPU uncached address range is:
>
>     0x40000000 - 0x7fffffff
>
> As a result, the upper 1 GiB of a 2 GiB DRAM configuration aliases the
> lower 1 GiB from the NPU's point of view.
>
> The WLAN NPU firmware also checks the address range for packet buffers
> and TX ring addresses:
>
>     if (addr > DRAM_RANGE_1GB)
>             printf("out of available range");
>
> NPU debug output is disabled by default. To enable it for debugging,
> change the value written to REG_CR_NPU_MIB(21) from 1 to 0 in
> airoha_npu.c:
>
> -    regmap_write(npu->regmap, REG_CR_NPU_MIB(21), 1);
> +    regmap_write(npu->regmap, REG_CR_NPU_MIB(21), 0);
>
> The recommended platform integration is to reserve all NPU-owned WLAN
> buffers inside the supported DRAM window. For example:
>
>     reserved-memory {
>             #address-cells =3D <2>;
>             #size-cells =3D <2>;
>             ranges;
>
>             npu_pkt: npu-pkt@8a000000 {
>                     no-map;
>                     reg =3D <0x0 0x8a000000 0x0 0x2c00000>;
>             };
>
>             npu_txpkt: npu-txpkt@8cc00000 {
>                     no-map;
>                     reg =3D <0x0 0x8cc00000 0x0 0x4000000>;
>             };
>
>             npu_txbufid: npu-txbufid@90c00000 {
>                     no-map;
>                     reg =3D <0x0 0x90c00000 0x0 0x6800>;
>             };
>
>             npu_ba: npu-ba@90c06800 {
>                     no-map;
>                     reg =3D <0x0 0x90c06800 0x0 0x200000>;
>             };
>     };
>
> The regions should then be referenced by name from the NPU device node:
>
>     npu {
>             memory-region =3D <&npu_pkt>,
>                             <&npu_txpkt>,
>                             <&npu_txbufid>,
>                             <&npu_ba>;
>             memory-region-names =3D "pkt", "tx-pkt", "tx-bufid", "ba";
>     };
>
> This reserved-memory configuration covers the NPU WLAN packet buffers,
> TX packet buffers, buffer IDs, and BA memory.
>
> It does not automatically constrain the temporary mailbox buffers
> allocated with kzalloc(). If the same NPU address-window restriction
> also applies to mailbox DMA, those buffers must be allocated from a
> low-address DMA pool or otherwise guaranteed to map to an address
> within the supported window.
>
> Best regards,
> Zhengping
>
> Wed, Sep 30, 2026 at 06:19:31PM +0200, Daniel Pawlik wrote:
> > Hi Kuba, Lorenzo, Airoha team,
> >
> > I found a concrete lead for the unresolved cacheline patch in the vendo=
r
> > firmware. The installed en7581_MT7996_npu_rv32.bin matches the blob in
> > linux-firmware commit 1043c0303910 by SHA-256.
> >
> > At file offset 0x3a9c, the Wi-Fi mailbox handler converts the supplied
> > buffer address before reading the command:
> >
> >   lui   a5,0x40000
> >   addi  a4,a5,-1
> >   and   a4,a4,a0
> >   or    a4,a4,a5
> >   lw    a1,0(a4)
> >
> > This implements (address & 0x3fffffff) | 0x40000000. Both 0xbf6cf000
> > and 0xff6cf000 produce 0x7f6cf000. W1700K has 2 GiB of RAM starting
> > at 0x80000000; its current SWIOTLB pool starts at 0xff6cf000.
> >
> > The handler also returns 1 (success) for an unsupported operation type
> > at file offset 0x3b4a. My earlier claim that mailbox success proved a
> > correct command read was therefore unjustified. The traces do not
> > establish a read-succeeds/write-fails limitation.
> >
> > This suggests an address-window problem, but the NPU-side bus mapping
> > still needs confirmation. The cacheline patch avoids the observed bounc=
e
> > path without constraining the address of future direct allocations.
> >
> > Can Airoha confirm which host DRAM range this alias covers, and whether
> > mailbox buffers above 0xbfffffff are supported?
> >
> > I have prepared, but not yet run, a test retaining all 2 GiB of RAM and
> > the 12-byte DMA_BIDIRECTIONAL mapping, with the SWIOTLB boot pool below
> > 0xc0000000. A successful version response through a verified bounced
> > mapping there would help distinguish the address limitation from a
> > SWIOTLB copy/cache issue.
> >
> > Thanks,
> > Dan
> >

