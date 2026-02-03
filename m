Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF72E8305A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 06:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EgJ2Ll3/CgFXhoIE6ohHknq/XdBboRec408Sf48XFuQ=; b=LQArpflSl8DNrMSUb5eTfjuBmG
	i0mNk5dv4BgYjgySEsMsA+GnDbL/MGiLcPWYVHxnDqG/ltHSRCEXjO4MBoXfD6Ki9enQrLnx08s9q
	2Fh5CkpUrO2CwKjTVKeWRfICrL/J3fvgg7NsyBPfos9k1ZnyU2lB+25nVvOo/vCLf4MhnLGCuW7YQ
	WydDG/1iiQH9xZZAwV3wvfglTmpDyvYiAv5ptQ4ptlnfll/fnQsduKhfyyBWL5un5DtBmCmFIxHtu
	F3X1RHZHwkMt392A3jASN2ukDnHQByY9K8/VdoN+NTkpeU4K6duot1j1NdchZKjpaGOhF8cq/UqAw
	c/M2cQmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnA6C-00000006CdK-1LRR;
	Tue, 03 Feb 2026 06:41:20 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnA67-00000006Ccu-0Ebl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 06:41:18 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-59dd4bec4ecso5955445e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Feb 2026 22:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770100873; x=1770705673; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EgJ2Ll3/CgFXhoIE6ohHknq/XdBboRec408Sf48XFuQ=;
        b=FRfTPdJ0Mk90ha4J1idhNwRbB//Fp3swoI6b4kM4TTB1fxYMFX0K2criT0pQBaLZ9Y
         nEAaAyX1P+ehYBhfLnEhLJPLrDqIqfv3NJ+5i7PD+1tl3Z7s3jMY9fBL2tUfeob4zCLp
         9gLgJx8YVWFP0rUZhfN2xcg4hzMiNhxHT5zRHp+RrqfIsS7ZaTaUOL50/VjSVs3aIA+P
         YcsmmtINBE0JP979CqHl81shDkjCDAo3YG8fvcW841dO1gxSf1rR7wbkyOpPtPrrkLE5
         NmHQFm91EztyrjNy5JpVxYLe/u3zzUxiL3nxLfno/LKepVJih+ki3p5GAaZYqgP5GoBy
         I1Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770100873; x=1770705673;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EgJ2Ll3/CgFXhoIE6ohHknq/XdBboRec408Sf48XFuQ=;
        b=ITdX4sz34idZFhRqUK9aE6Mm0/9aobsYR2kf2D5oHPUmoqYZv5SjKwaojfTaookOSz
         8Okd8pvxmMCtU1UTT6gwJZ5IktAfpWCqOPTVcSuoZjLMcaarnbF8DBI7tUdxfEdguW/c
         hXC8ATn+uaWsAd/yW3MnvpLnyEJ2IX/bOlg9j04InvqcRQdbB4OAXHEI/k4FnqBCfs9C
         jg9w+1umhRIeQYDnv0PO3fvcF/SZvMmvc5sgnZGKAcxGS11Mw1dHVpZIsu8LfWVYSf2+
         PboLfto52ZI9VQ5UVAFd433hurPb6OYZm6Uoz/yEKiAbbwIdPN5fJYiYkFIPzgqCEU3M
         w8Zg==
X-Forwarded-Encrypted: i=1; AJvYcCW3hNdM2x4+b2G/X5CFPfQXn8RDUjd9k0hnkscG/PyV1+biASXGe2oJ6MA4tsfol5xOdgrtH1xPqvwZU07qGIl9@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7p72TlUgAs0J6o1+gGbxTGneV1nlJrTjZUlTgz6mx+eUEL+2M
	qgwJPYN2zQxgOZQ1/wYzTMiEzRuSGC2c43gnNFlk86BtH8PbAhXx5ylj
X-Gm-Gg: AZuq6aLMRndkppqyDZFZ6t+acWGXH/+OCJyAdaWFdbbtICMnAt18xfesdP63MaKW3ib
	MzcaPKIQmhNACGVtZQa3z20QF2n9EGD17/X70aaCpc2fgOs8WuSjG4qfedFqzGXptk03c3iMs6f
	xsgYQfzq2LboO4QeNS8Vi5J2FU5r5QGSRR/8jF7SjSfo1VZdHnjW39yUrMsKqGrPQt3avyBmcp7
	Wiu3Gi+1YAn3Qtyb+5s03QSDbKrk7foOsPt3GB5ty/85n2lVv2kXoji9/AlR+yGWW1IVPK9Hqx6
	ze5xj3I2UVB3FYfxLypuSJiPrgg0BoFnCJtb9K2zda+JRsCQWIO9pKXSxduJOlK1ApVN+N17Eyz
	J3X10Ot5bjMM1Wpvlm3whOPFQMdbI1lHymE0B46RBWrT2yP5NH02MmrK/fC1DlbJ+GAURZzUSqG
	UYESgFJuMVrLpkEtdp6Qd+v6d2z3GiMNCW8iJyn1NuzqfD/wFdCREYJQ0Pubk=
X-Received: by 2002:a05:6512:159c:b0:598:853e:4866 with SMTP id 2adb3069b0e04-59e164314f1mr5253830e87.51.1770100872754;
        Mon, 02 Feb 2026 22:41:12 -0800 (PST)
Received: from [10.0.0.100] (host-185-69-74-59.kaisa-laajakaista.fi. [185.69.74.59])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e07481b72sm4048059e87.11.2026.02.02.22.41.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 22:41:12 -0800 (PST)
Message-ID: <030ae04b-68b4-4570-90b3-1dfc6f31b4e5@gmail.com>
Date: Tue, 3 Feb 2026 08:42:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/19] dmaengine: ti: Add support for BCDMA v2 and
 PKTDMA v2
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>, vkoul@kernel.org,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com,
 ssantosh@kernel.org, dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 vigneshr@ti.com
Cc: r-sharma3@ti.com, gehariprasath@ti.com
References: <20260130110159.359501-1-s-adivi@ti.com>
From: =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>
Content-Language: en-US
In-Reply-To: <20260130110159.359501-1-s-adivi@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_224115_152577_0F1ED9B1 
X-CRM114-Status: GOOD (  26.46  )
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

Hi

On 30/01/2026 13:01, Sai Sree Kartheek Adivi wrote:
> This series adds support for the BCDMA_V2 and PKTDMA_V2 which is
> introduced in AM62L.
> 
> The key differences between the existing DMA and DMA V2 are:
> - Absence of TISCI: Instead of configuring via TISCI calls, direct
>   register writes are required.
> - Autopair: There is no longer a need for PSIL pair and instead AUTOPAIR
>   bit needs to set in the RT_CTL register.
> - Static channel mapping: Each channel is mapped to a single peripheral.
> - Direct IRQs: There is no INT-A and interrupt lines from DMA are
>   directly connected to GIC.
> - Remote side configuration handled by DMA. So no need to write to PEER
>   registers to START / STOP / PAUSE / TEARDOWN.

I think this looks really good overall, I have few nitpicks around
variable declaration order and one bigger ask for the possibility of
introducing version member to struct udma_match_data to cut down on
changes and have more targeted handling of the differences between the
two variants.

> 
> Changes from v3 to v4:
> - Rename the dt-binding files to add "ti," prefix.
> - Update cell description in dt-bindings and add client examples.
> - Update k3_ring_intr_regs reg names
> - Rename soc specific data to bcdma_v2_data and pktdma_v2_data to
>   bcdma_v2_am62l_data and pktdma_v2_am62l_data.
> - Add a new patch [18/19] to fix a null pointer dereference issue when
>   trying to reserve a channel id that is out of bounds in
>   udma_reserve_##res macro. Also fix logging issues in this macro.
> - Add a new patch [19/19] to switch to synchronous descriptor freeing to
>   avoid running out of memory during stress tests.
> - Fix checkpatch warnings.
> link to v3:
> https://lore.kernel.org/linux-arm-kernel/20250623053716.1493974-1-s-adivi@ti.com
> 
> Changes from v2 to v3:
> - Fix checkpatch errors & spellings.
> link to v2:
> https://lore.kernel.org/linux-arm-kernel/20250612071521.3116831-1-s-adivi@ti.com
> 
> Changes from v1 to v2:
> - Split refactoring of k3-udma driver into multiple commits
> - Fix bcdma v2 and pktdma v2 dt-binding examples
> - Fix compatibles in k3-udma-v2.c
> - move udma_is_desc_really_done to k3-udma-common.c as the difference
>   between k3-udma and k3-udma-v2 implementation is minor.
> - remove udma_ prefix to function pointers in udma_dev
> - reorder the commits to first refactor the existing code completely and
>   then introduce k3-udma-v2 related commits.
> - remove redundant includes in k3-udma-common.c
> - remove ti_sci_ dependency for k3_ringacc in Kconfig
> - refactor setup_resources functions to remove ti_sci_ code from common
>   logic.
> link to v1:
> https://lore.kernel.org/linux-arm-kernel/20250428072032.946008-1-s-adivi@ti.com
> 
> Sai Sree Kartheek Adivi (19):
>   dmaengine: ti: k3-udma: move macros to header file
>   dmaengine: ti: k3-udma: move structs and enums to header file
>   dmaengine: ti: k3-udma: move static inline helper functions to header
>     file
>   dmaengine: ti: k3-udma: move descriptor management to k3-udma-common.c
>   dmaengine: ti: k3-udma: move ring management functions to
>     k3-udma-common.c
>   dmaengine: ti: k3-udma: Add variant-specific function pointers to
>     udma_dev
>   dmaengine: ti: k3-udma: move udma utility functions to
>     k3-udma-common.c
>   dmaengine: ti: k3-udma: move resource management functions to
>     k3-udma-common.c
>   dmaengine: ti: k3-udma: refactor resource setup functions
>   dmaengine: ti: k3-udma: move inclusion of k3-udma-private.c to
>     k3-udma-common.c
>   drivers: soc: ti: k3-ringacc: handle absence of tisci
>   dt-bindings: dma: ti: Add K3 BCDMA V2
>   dt-bindings: dma: ti: Add K3 PKTDMA V2
>   dmaengine: ti: k3-psil-am62l: Add AM62Lx PSIL and PDMA data
>   dmaengine: ti: k3-udma-v2: New driver for K3 BCDMA_V2
>   dmaengine: ti: k3-udma-v2: Add support for PKTDMA V2
>   dmaengine: ti: k3-udma-v2: Update glue layer to support PKTDMA V2
>   dmaengine: ti: k3-udma: Validate resource ID and fix logging in
>     reservation
>   dmaengine: ti: k3-udma: switch to synchronous descriptor freeing
> 
>  .../bindings/dma/ti/ti,k3-bcdma-v2.yaml       |  116 +
>  .../bindings/dma/ti/ti,k3-pktdma-v2.yaml      |   90 +
>  drivers/dma/ti/Kconfig                        |   21 +-
>  drivers/dma/ti/Makefile                       |    5 +-
>  drivers/dma/ti/k3-psil-am62l.c                |  132 +
>  drivers/dma/ti/k3-psil-priv.h                 |    1 +
>  drivers/dma/ti/k3-psil.c                      |    1 +
>  drivers/dma/ti/k3-udma-common.c               | 2577 ++++++++++++++
>  drivers/dma/ti/k3-udma-glue.c                 |   91 +-
>  drivers/dma/ti/k3-udma-private.c              |   48 +-
>  drivers/dma/ti/k3-udma-v2.c                   | 1472 ++++++++
>  drivers/dma/ti/k3-udma.c                      | 3095 +----------------
>  drivers/dma/ti/k3-udma.h                      |  583 ++++
>  drivers/soc/ti/Kconfig                        |    1 -
>  drivers/soc/ti/k3-ringacc.c                   |  188 +-
>  include/linux/soc/ti/k3-ringacc.h             |   20 +
>  16 files changed, 5402 insertions(+), 3039 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,k3-bcdma-v2.yaml
>  create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,k3-pktdma-v2.yaml
>  create mode 100644 drivers/dma/ti/k3-psil-am62l.c
>  create mode 100644 drivers/dma/ti/k3-udma-common.c
>  create mode 100644 drivers/dma/ti/k3-udma-v2.c
> 

-- 
Péter


