Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A0D109E528
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 22:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jg+jxIxiDHnN00TgvSu+pP6M1fm2u7hbNztuwkGyUXY=; b=FjhqISTq1HqvpkYKxbvvXSrBTu
	4UI2zI0rOSz47Fl4CcDSCJ8hGa+s8+bXQEDwI0Clq68KKAO5KHUD1mFMzAOLKK3FV3fyJkVVhAM7u
	DDwsBeivjT0Yru/q3hCU1Q8WZ9pId+CL/7VSUv14Mpmt4pF+p9UssUMYSVzbkTp3+jGj9Xm3TrhbL
	t2XZJnomhmu7zMndsKdIExfgKhE2X5CibHwyXc+xQTc3Crwh8TUd5QFDxw/fRcy30ftn4YXVYqI6U
	5FJfaN8lnM8HvOX5M5Q20h/ccPmfCbFH+YqIDPid2XRVEW5lYQk4bmH0ul0StD4pUYlG/jsf1eDVx
	CZ8tz1nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5X85-00000004NlV-2gHJ;
	Wed, 25 Mar 2026 22:55:13 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5X83-00000004Nl5-07hA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Mar 2026 22:55:12 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-358d80f60ccso224111a91.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Mar 2026 15:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774479309; x=1775084109; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jg+jxIxiDHnN00TgvSu+pP6M1fm2u7hbNztuwkGyUXY=;
        b=UlG5im4kQ4ZPE90/s/EWcabFTpLgH3CbQTspcTRaYNtecv1ftwhoGX7qDRDBKztf8y
         OgRIYlyUsDmjDiZWSoQT1SbRhU3Z+YPGB5S6JeTSJl2amXQ+NyfzVwjtc5Xs7zlPfZ1C
         dVfx8A00bCRigag+Z7XPxs+LmI415JQm0d8RYPK100NuQ7qbyfSe752BDzc02MstlgIm
         KXUOV2TVD+MndqbgyVGdsYxzCaow/re4Ap7fzUH49GJ2yRHVz8tfXccv8WpNZ8mqz/RP
         lNilz9gdICYaoQLz97g12vpbwaXZx9xrAMwu+k+TivTn8JGyO+FBj3X7ZH5Qrm4GJGER
         UxrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774479309; x=1775084109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jg+jxIxiDHnN00TgvSu+pP6M1fm2u7hbNztuwkGyUXY=;
        b=mIVwkCgbgplumzPakTk8DCnl3yUdSRUbw8w4KRHR+jhHi50gFdN0acKCaC3IP59I0G
         4izwTQrQZIapLhxPPmTmcNXIxTvdV7FxyNuYLH/PorJ51plaCVl+6e1uInNtrQh9VvvZ
         9DnuRlVuDhpgHpUBdKixqLVCc0XetZhkn/xKQ/7BJhUI213V/BC/dnJMFzT//14fGj1F
         kkSW3feXtQwfpb3VGryFCvtCL+PlSCX4M8rRJbSMqVAfVqtcmfdWgq4UbKHAGzshbfRV
         27RwC/ZTNw7na3y0BpqZIDe23aksdSL84NbvKAmdsBVacQTorcdG2qHpm2Z0GnIybA61
         /6lg==
X-Forwarded-Encrypted: i=1; AJvYcCVIvy6+wZ8cDZf+diRDZDo9kKrJR7n1Rv1znZ5KMk+9VAjL+gMmrg5afplOc5iEXR9kewjyEuq/2cHgUrhAIu5S@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4+V0+bco81h73w6KzZPcCJcJV2n62HK4r65MWn/TDZs1BInKM
	F0rhGF73nkap7nmfRbvPEAv0ZzTXaiJiMcBdN+6tkBqQYl+zYHmEnGQ6
X-Gm-Gg: ATEYQzyEbGYvApxohBnWhc45RK4nahB86hBDu9OpgVsng5AH50MoM45/9yf/eVwqHER
	leR7HbVPe1RMS361GArhJ/0fGo379cGJiR9vlWYa8x0zs4xXD2a9AdvXf6unPC1tMQXTqBi57cT
	wQJXNJq0sE1+scacoSkBnCNQuDRwKCWj+TkyLiGXSdAYBDbK7XmcAA/gTZoHFfw5AUYvQnuyhVN
	WIFgco/UAjv7KreQLGWrucNzEldibENzutmhB1S7O6KMYHk42PR9E9XawwZp2TLPRtLUwMJWvPi
	smkfDTLydSRzh1iK9PR0zSU6MnQbPoIPt2RTxBnL71tt1qkuGUVbkskIxfF6Nhalb3aDmWdEsS4
	EzN2TziwARfDpETGWfFM5Bv4liyLJ6jyh6tSwsRWzGoHdvkMn8pgVmWRh0lVEim4iGMe+rR/qnN
	5Sl7ezpMA4jKyD/3EgaEMZoMoN
X-Received: by 2002:a17:90b:3f47:b0:356:7b41:d348 with SMTP id 98e67ed59e1d1-35c0dd95083mr4052323a91.20.1774479309361;
        Wed, 25 Mar 2026 15:55:09 -0700 (PDT)
Received: from arch ([2409:40c2:5018:3ab3:ebcf:9aee:dece:80da])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c1e1a64absm84066a91.2.2026.03.25.15.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 15:55:09 -0700 (PDT)
From: Bhargav Joshi <rougueprince47@gmail.com>
To: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	xuwei5@hisilicon.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	ulf.hansson@linaro.org,
	zhangfei.gao@linaro.org,
	linux-mmc@vger.kernel.org
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	d-gole@ti.com,
	m-chawdhry@ti.com,
	rougueprince47@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] mmc: hisilicon: Convert dw-mshc bindings and fix dtbs
Date: Thu, 26 Mar 2026 04:24:37 +0530
Message-ID: <20260325225439.68161-1-rougueprince47@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_155511_071638_FADDA901 
X-CRM114-Status: GOOD (  13.30  )
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

This series converts the Hisilicon dw-mshc text bindings to DT schema
format and cleans up legacy node names in Hisilicon board files.

While testing the new YAML schema, dtbs_check flagged the hi3660, 
hi3670, and hi6220 SoC files for using the non-standard 'dwmmc' node 
name prefix. resulting in warnings.

Patch 1 Convert to DT schema
Patch 2 updates the Hisilicon dtsi files to use standard 'mmc' 
node name.

Changes in v2:
 - Patch 1: 
    - Grouped compatible strings into an enum.
    - Replaced raw numbers with proper flags.
    - Fixed property order and removed invalid hex values.
    - Added explanation for clock order change in commit message.
    - Collected Acked-by tag.
 - Patch 2: 
    - No code changes.
    - Collected Acked-by and Reviewed-by tags.

Signed-off-by: Bhargav Joshi <rougueprince47@gmail.com>
---
Note: this patch is part of the process for applying to GSoC device
tree bindings conversion project #
https://github.com/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-Device-Tree-Bindings

- The file is enabled by arm64 defconfig (CONFIG_MMC_DW_K3=y)
- It is used in following
    /arch/arm64/boot/dts/hisilicon/hi3660.dtsi
    -included by /arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dts
    /arch/arm64/boot/dts/hisilicon/hi3670.dtsi
    -included by /arch/arm64/boot/dts/hisilicon/hi3670-hikey970.dts

Bhargav Joshi (2):
  dt-bindings: mmc: hisilicon,hi3660-dw-mshc: Convert to DT schema
  arm64: dts: hisilicon: Rename dwmmc nodes to mmc

 .../mmc/hisilicon,hi3660-dw-mshc.yaml         | 117 ++++++++++++++++++
 .../devicetree/bindings/mmc/k3-dw-mshc.txt    |  73 -----------
 arch/arm64/boot/dts/hisilicon/hi3660.dtsi     |   4 +-
 arch/arm64/boot/dts/hisilicon/hi3670.dtsi     |   4 +-
 arch/arm64/boot/dts/hisilicon/hi6220.dtsi     |   6 +-
 5 files changed, 124 insertions(+), 80 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mmc/hisilicon,hi3660-dw-mshc.yaml
 delete mode 100644 Documentation/devicetree/bindings/mmc/k3-dw-mshc.txt

-- 
2.53.0


