Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9366CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 08:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0bQRlmnKfDqgMf8snk80FkB/8ickhLw4rD40tCbpRQ=; b=TNRDNiNU4LMovQHYljithudRCF
	FivfK7Cpq72UM009+oX2QcTeXVKToJDXQn1xIZlohBmLnluUnG4fBp1cPFtNH5dK9enJjfS5vxOGw
	P5r1iWurOjDkLnaah/nefVaO5w0VIA6z9+A1FaQFSlb/oPQ7xMQSnSeOW4EkDMAjysrwEqVbv8IOZ
	N2Ez2Pp3fyHsFISx5haHBX/4mf8PvI/8KZIAC3M7adefhsxmu1wY6YlNUsX3gZtqhtUpGgrhEQCJd
	dO63sKq6wHpUXOxZ3z7ZQBG4Y9Jvo0hHRksKaABJokGQmxWl//lu8BGRgXZzpk5CKQtkKtMKatx5r
	RJshd3ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4ef-00000003EAc-27zX;
	Mon, 15 Sep 2025 08:33:45 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy4ec-00000003E63-1kkV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 08:33:43 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5608b619cd8so4794074e87.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 01:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757925220; x=1758530020; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r0bQRlmnKfDqgMf8snk80FkB/8ickhLw4rD40tCbpRQ=;
        b=dPhC1rTnfMwjMg++P+XAoA5boru25x0Ac+JKCwxNHrfB8IAR3R5vPPqcP/TTUg1Pcy
         fHigAKFWlB6Q3AQq6T6YB7RxgoLuoUxs5nqvM0hzB7SDVSguNzCt3ee4TPnGqiZrxiR6
         JEWzhMDXovZUJZJ15lgR6puAG5nL8Po/liirzLucimYguzRAlFLnAvL8YRYQjnRaLHoS
         g3cmDtgpyeuMajSQ7jjmD4E+vIcZVFUbu3y7inMELx9S6NJF5gtjVg4wbvfkiJrVitH1
         elsTkFD8yFCaCQsNp0R2JXiMDmydVztr447rIc6QfFXnBaUSYBmrstaY42NaAzh0C0B6
         CTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757925220; x=1758530020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r0bQRlmnKfDqgMf8snk80FkB/8ickhLw4rD40tCbpRQ=;
        b=DTtYm2vflqXqV4alTmGJxhJfXfi/5TMu/CQm4+Futu3likpr2223JB+G1Fkfd/KTZE
         KR5raYChUreqU7DnRmT13p28lF+KlKMe6mXifr5SSqL7FpNuFixDGgFqBXFJlVGXnvTm
         fZMQSdSwBB13B3MBcfct5YN9cM5sIAFIuRXxflhflSbhRBBzkhrp90VHaeJwgVLw0jIM
         Hm/9akNVe26TVmvuIgkTSwDszkzOainKvEasLNHmf7SMXACkhEGfsz6ZuGjYUAOxUP2C
         fW63NtI9EekeHGqRNqo/3CYevBURe+iQnmQyqBU8KNm2ekQr/mEbOWog8vg3U2lFzZ3C
         wOXg==
X-Forwarded-Encrypted: i=1; AJvYcCU5zfVHjz4C8TNyCLp5g9pa94UTxKE61lRF8LbrFHY81Dz04q24sf3STYY2cLUXUUHdrq5KwRK4rx249wAKU/hB@lists.infradead.org
X-Gm-Message-State: AOJu0YyoqfxHeF5WXEG0AFiK5vf+Pyhi3K0oIxsYe2L3d68+BFPhORir
	bwHGijXQqD1rUU3YIuyeyFU2bPP37WF3R5OiA/ATE23PKix8FxsskTAQFB+IVSZObGQ=
X-Gm-Gg: ASbGncuh4tMfBMrCb1EX1nxv0Cijw2yxti8ozCPbb+0fw3/mK/Z0faTHXtQVDtplkvT
	/l4M0lOnf7yHhTFMJBplNxNT4FiFyoO9lGBxzpNcEIQ85uTJzLpqrx2QuVYaSoR7W+km6aK7Pnb
	bjCwo1qzUl32kmqVx6Hb70LRiN52rks4QGb5jo0hmz6FUdtDVq+Zv5ed83ccAk8ZUc01hcTDxTF
	BcCxoY7Cm+elgY5JxxMzpXAH7ieqZL3x7AAySmYUvhRHQ6/RVymix+W+TzHajVfYl//EcJldt7M
	Tzi6ERekRDIIGV9s1i7Q7PsbaQc0NICMNzMG3MntOkcuNr2RpY9PnJKcn2Jlqdj8yy4wTz5qLTy
	mz6FU64Kyu1korb6UXL3xDFqIbYoYCeCI1urm+KVx8U99oSWS7KOnWHQ=
X-Google-Smtp-Source: AGHT+IGPhTuEG2m4SiCDqh898kzAlhbg8Uvlnka6m56w2D7gJmLC1nJiufAqd/hfn5WD27cwWn5ytA==
X-Received: by 2002:ac2:4cb1:0:b0:55f:6d28:bcee with SMTP id 2adb3069b0e04-5704f1cf24amr2705611e87.34.1757925220270;
        Mon, 15 Sep 2025 01:33:40 -0700 (PDT)
Received: from nuoska (87-100-249-247.bb.dnainternet.fi. [87.100.249.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-571a6a33ba8sm2335142e87.46.2025.09.15.01.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Sep 2025 01:33:39 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Mikko Rapeli <mikko.rapeli@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v4 2/4] mmc: add COMPILE_TEST to multiple drivers
Date: Mon, 15 Sep 2025 11:33:15 +0300
Message-ID: <20250915083317.2885761-3-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250915083317.2885761-1-mikko.rapeli@linaro.org>
References: <20250915083317.2885761-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_013342_495887_1A6EB6FC 
X-CRM114-Status: GOOD (  11.86  )
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

These compile on x86_64 with =y and =m.

Acked-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 drivers/mmc/host/Kconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
index 7232de1c06887..b14daa045eff9 100644
--- a/drivers/mmc/host/Kconfig
+++ b/drivers/mmc/host/Kconfig
@@ -56,7 +56,7 @@ config MMC_STM32_SDMMC
 
 config MMC_PXA
 	tristate "Intel PXA25x/26x/27x Multimedia Card Interface support"
-	depends on ARCH_PXA
+	depends on ARCH_PXA || COMPILE_TEST
 	help
 	  This selects the Intel(R) PXA(R) Multimedia card Interface.
 	  If you have a PXA(R) platform with a Multimedia Card slot,
@@ -608,7 +608,7 @@ config MMC_SDHCI_MSM
 
 config MMC_MXC
 	tristate "Freescale i.MX21/27/31 or MPC512x Multimedia Card support"
-	depends on ARCH_MXC || PPC_MPC512x
+	depends on ARCH_MXC || PPC_MPC512x || COMPILE_TEST
 	help
 	  This selects the Freescale i.MX21, i.MX27, i.MX31 or MPC512x
 	  Multimedia Card Interface. If you have an i.MX or MPC512x platform
@@ -866,7 +866,8 @@ config MMC_DW_PCI
 
 config MMC_DW_ROCKCHIP
 	tristate "Rockchip specific extensions for Synopsys DW Memory Card Interface"
-	depends on MMC_DW && ARCH_ROCKCHIP
+	depends on MMC_DW
+	depends on ARCH_ROCKCHIP || COMPILE_TEST
 	select MMC_DW_PLTFM
 	help
 	  This selects support for Rockchip SoC specific extensions to the
@@ -948,7 +949,7 @@ config MMC_USHC
 
 config MMC_WMT
 	tristate "Wondermedia SD/MMC Host Controller support"
-	depends on ARCH_VT8500
+	depends on ARCH_VT8500 || COMPILE_TEST
 	default y
 	help
 	  This selects support for the SD/MMC Host Controller on
-- 
2.34.1


