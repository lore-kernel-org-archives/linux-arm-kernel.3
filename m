Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EE9D2D8FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 11:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PhbuZflrYoZI1s9xrK2220SYSdiXayJsomDwy3Z3JgA=; b=VUjBzn4cM8Z7KzdeHonTu6l1Xj
	BC0OOZ+B1cIOnTu8w6X8RykQwc2d0HhzRpAFw76DVqXOMZy8qGJkG7lYcCmxnWjXoZlBuPcrMVUEg
	kAts+0KZmqjlZMm4YiULm0dXRHzhXqKl1+fqhIvyeJLMvxTmoz2ZVCPUXXysrAzlPYqYd+0FYOf44
	0Afhj5yFVg/5qx41jVCHAz2NqTUbs32jCstSkgjgMkJbVImXDy3fzjNIvljLXkvPetHn41Qq0lVGm
	2zLIoncqq6jsJ7ph4F7tEwUtYhoP74T4IV2n5IsLe693rYNR2wmotMcaL4VOgTcKf+NHQSGkooduz
	E+HpQD0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgpd-0000000E73E-3yiZ;
	Tue, 27 Jan 2026 11:02:01 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgpb-0000000E72U-0yDW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 11:02:00 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-59de38466c2so5722113e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 03:01:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769511715; cv=none;
        d=google.com; s=arc-20240605;
        b=bfihQfu9UB3AVp5Y4+PnsvMUf8YpGPfB6jPOcHbxgaMamjNtEjzv5tg+92QcG/9e4A
         u8MFxZjx/lrVje6eLTbmDLdcN1/m9ps1och7akw4+61Q5hjx4CZsp/4UH0vgHqCkLPog
         f8q0m5cEa0WBYaeiwdVAvTe96rWa+iBZ6GT9/HDdeSryHcmOBLUk5gzMbqgcDNUmgCeK
         VU5fi8vF3m+OJApG3hAsLhNNkAopVzkTZtniVhB92+Owd9IwZISp0/2VU6iZp03LL+6X
         oPOTYFiZzeMI7a6rmAtU6AZcd8PhnH46nGDDUeM1FxrC0X4UUNF2yyaldE2lONyozEPm
         ksOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=PhbuZflrYoZI1s9xrK2220SYSdiXayJsomDwy3Z3JgA=;
        fh=E625lgveLD+dlxs1onOqK1MWI7PLX3a0/PD31+yWPV0=;
        b=hpcjjIxHue9QG+4i+n8c5pdOjA5ntexUMjTsFIdkYJcPMJwkML4w9PLPo8ZBi6XRGN
         O3QhbZAy1V9fygcJNeKsTI+7eTWp0EI0fa3j2P6Nu60VP5nseoIDoqTRhEl6yDRUEozP
         4J3Z88v+1h459EJ1U5BoBBf9ytNdGQOHeQtM67BDk7DdqwA4Jmz2J5yhoQMvFuV4X/xM
         kUZQmmwEMG7APLop2hF8kcCNinhFi59Ia6qX8/nU7nA5b5iPBJb4BoaprfvBJKqR6mhs
         4ehGgThoj+swDelPlO2+09Bm0A/S/0ofbmIoCL99BOEH2lgOnBiobSQNN3799x4ppJiW
         KeBg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769511715; x=1770116515; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PhbuZflrYoZI1s9xrK2220SYSdiXayJsomDwy3Z3JgA=;
        b=gW7zYUEHmfDaZu1Xj1Uj/6CKD7YVa88W2yQguO+AFbi2TmdbzOYkpdu0IrbgrBkeRA
         X4zsjKGcaJFOHzSkrdVXXGiXka2TrwKexqEiX4QdfS/iCMqx+6TV3IQ21QkF4h/9m9lS
         9omDiTfW9IGvEOwAFCEYSGGkhREnBo1Rg7NYJsWOWV1GEyfhP6JEF1LUmz8j69RObrc2
         a/Wm7qYtZ2ExqFEEIQw7P+ViFLQoo1WrOl0qMs8Gjj997xrG9TiRuWa9IeVD6LkZWejV
         C+KrZEDgbABVBTaHHL/++hnS7uu+QSxO/6bqPWZlO+y/B680QjGq2GtKdk2Tng7EQrK/
         vnsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769511715; x=1770116515;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhbuZflrYoZI1s9xrK2220SYSdiXayJsomDwy3Z3JgA=;
        b=b9wVEhfqwt7ibHDPVwsV2SCDlSAZ7jiaflH5KHBvZDc+7fauGuAkz+X5+bB0GpWb6V
         bf+kwYIe5v0aB7vGVzj546tC1SGsZHU6vmK+3d+GZ4m3qgIwzCV73KWAKxvnsbpVqxnf
         kImW9l3pXofnyAD48RSiriXKZzJJbVuolDWMSED5VliS04SQPtYVDRrgweXIt8k6SGk9
         rK40Sg+zs2X3iJ5DY3SwXNEaioEdl0MOdUQcgmSE40lrh7/NlIkHMjDBmaf8Tprqt/LV
         RsexOEBjwLXfn23kHLJLfZoWBCa+Rk0YEpi3haNMP+VcEDY4nKHaKTk/poIasP5fhZ8+
         /47A==
X-Forwarded-Encrypted: i=1; AJvYcCWDS2VOqlz6gQ7nfT0ZPo3kDqLkKTp64XaaKKvNbfpHh9AlEg9eqtk/nS05gEeA1LFhX911gMyv6JbpCO6LlZ35@lists.infradead.org
X-Gm-Message-State: AOJu0YzhckChcUiQeUxiq33YSUOnIc1xOjwEruYOfUmv+1klzc3WQ3OZ
	JXv0PJnirThfQ5SUQGVW8yl7buvRMhlH7RDQ22aksegTpQaaIMKojLpc/AIPFoYBxQKYzWKyI+x
	RJ80k8GXZvuBZyyMpNlFN12LPo9W7bkt0hIQyAqTgoA==
X-Gm-Gg: AZuq6aJGykPFUdCa5ak30qUz5VS6TlOntvMguYayLpHptUEt6X/6EQmIsrxzVMrnJVG
	pgCHW3Oe1Djs5u2kzm4+90yQKYkwpj4eAevhDfWHm8/PV+CAqkfx3GedkSO/oLji4Z5eT4dNTx/
	gA3wgRgq+1Z91Ex5571DEqqSqsxTy6jko6Hrb5VgFgx1Fqp4OL+Q9kirTcE1CMTP2ePskzsunN9
	MLMhIDrVxxgwSP8YkNIZxXwicWB8bSGhBzddYnmIlShDW+aRaMqO6hC1RYj9m03h1osPhfH
X-Received: by 2002:a05:6512:2510:b0:59d:fbea:2c05 with SMTP id
 2adb3069b0e04-59e04025390mr519384e87.24.1769511714445; Tue, 27 Jan 2026
 03:01:54 -0800 (PST)
MIME-Version: 1.0
References: <20260123095342.272505-1-yangzh0906@thundersoft.com>
In-Reply-To: <20260123095342.272505-1-yangzh0906@thundersoft.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 27 Jan 2026 12:01:18 +0100
X-Gm-Features: AZwV_QjQJQRTg1ti0bxzkqTQwuY-jbSIMpY2vglnNnSJTkeJy2p56e4qMngTfno
Message-ID: <CAPDyKFroOi-7Dir_H2fPX9Ne6zFeM4=XD0eMMrX+iJ_si1n2sA@mail.gmail.com>
Subject: Re: [PATCH v5 0/6] mmc: add support for BST C1200 SDHCI controller
To: Albert Yang <yangzh0906@thundersoft.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Ge Gordon <gordon.ge@bst.ai>, 
	Arnd Bergmann <arnd@arndb.de>, BST Linux Kernel Upstream Group <bst-upstream@bstai.top>, linux-mmc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_030159_309653_7DCD6A1B 
X-CRM114-Status: GOOD (  20.47  )
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

On Fri, 23 Jan 2026 at 10:53, Albert Yang <yangzh0906@thundersoft.com> wrote:
>
> This series adds MMC/eMMC controller support for Black Sesame Technologies
> C1200 SoC. BST is a leading automotive-grade computing SoC provider focusing
> on intelligent driving, computer vision, and AI capabilities for ADAS and
> autonomous driving applications. More information: https://bst.ai
>
> == Background ==
>
> This is the MMC portion split from the original v4 series [1] following
> feedback from Arnd Bergmann [2]. The platform support (vendor-prefix,
> SoC bindings, Kconfig ARCH_BST, base DTS, defconfig ARCH_BST) has already
> been merged into Linux 6.19 through the SoC tree [3].
>
> == Series Overview ==
>
> Patch 1: dt-bindings: mmc: add binding for BST DWCMSHC SDHCI controller
> Patch 2: mmc: sdhci: allow drivers to pre-allocate bounce buffer
> Patch 3: mmc: sdhci: add Black Sesame Technologies BST C1200 controller driver
> Patch 4: arm64: dts: bst: enable eMMC controller in C1200 CDCU1.0 board
> Patch 5: arm64: defconfig: enable BST SDHCI controller
> Patch 6: MAINTAINERS: add MMC files to BST entry
>
> == Testing ==
>
>   - checkpatch.pl: PASS (all patches)
>   - dt_binding_check: PASS
>   - dtbs_check (CHECK_DTBS=y): PASS
>   - Build tested with ARCH=arm64 defconfig
>
> == Changes since v4 ==
>
>   - Split: Platform patches merged separately via SoC tree; this series is
>     MMC-only, submitted to MMC maintainers
>
>   DT binding (patch 1):
>   - Rename file from bst,dwcmshc-sdhci.yaml to bst,c1200-sdhci.yaml
>   - Fix example compatible string to match property definition
>
>   Driver (patch 3):
>   - Fix compatible string to match dt-bindings (bst,c1200-sdhci)
>   - Simplify clock divider calculation with clearer frequency range logic
>   - Add linux/bits.h and linux/bitfield.h headers
>   - Remove unused linux/ioport.h header
>   - Rename SDHCI_TUNING_COUNT to BST_TUNING_COUNT
>   - Rename BST_EMMC_CTRL_BIT2 to BST_EMMC_CTRL_RST_N
>   - Fix BST_DEFAULT_MAX_FREQ from 2MHz to 200MHz
>   - Convert kernel-doc to regular comments (per Adrian Hunter)
>   - Add sdhci_bst_free_bounce_buffer() helper (per Adrian Hunter)
>
>
> == References ==
>
> [1] v4: https://lore.kernel.org/lkml/20250923-v4-patch-final-v1-0-2283ad7cbf88@thundersoft.com/
> [2] Split: https://lore.kernel.org/lkml/09b1318e-21dc-4354-8733-866b70696295@app.fastmail.com/
> [3] Merged via soc-newsoc-6.19
>
> Albert Yang (6):
>   dt-bindings: mmc: add binding for BST DWCMSHC SDHCI controller
>   mmc: sdhci: allow drivers to pre-allocate bounce buffer
>   mmc: sdhci: add Black Sesame Technologies BST C1200 controller driver
>   arm64: dts: bst: enable eMMC controller in C1200 CDCU1.0 board
>   arm64: defconfig: enable BST SDHCI controller
>   MAINTAINERS: add MMC files to BST entry
>
>  .../bindings/mmc/bst,c1200-sdhci.yaml         |  70 +++
>  MAINTAINERS                                   |   2 +
>  .../dts/bst/bstc1200-cdcu1.0-adas_4c2g.dts    |  19 +
>  arch/arm64/boot/dts/bst/bstc1200.dtsi         |  18 +
>  arch/arm64/configs/defconfig                  |   1 +
>  drivers/mmc/host/Kconfig                      |  14 +
>  drivers/mmc/host/Makefile                     |   1 +
>  drivers/mmc/host/sdhci-of-bst.c               | 521 ++++++++++++++++++
>  drivers/mmc/host/sdhci.c                      |   7 +
>  9 files changed, 653 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mmc/bst,c1200-sdhci.yaml
>  create mode 100644 drivers/mmc/host/sdhci-of-bst.c
>
> base-commit: 0f61b1860cc3f52aef9036d7235ed1f017632193
> --
> 2.43.0
>

Patch 1 to 3 and patch 6 applied for next, thanks!

The DTS patches (patch 4 and patch 5) should be picked up by the SoC maintainer.

Kind regards
Uffe

