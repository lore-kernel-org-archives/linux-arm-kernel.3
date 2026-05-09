Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56F1CCD3445
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 May 2026 00:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TPu/RkDwR7YvogozdUsQJGqDvuX7QJ4yb5QSBtBcOm4=; b=tTHzdJaowVj3XIG3qM1kL1Semc
	yqh/mECivEiKta4agxYdq2yYdVdI4kFo1R5ePw6l5WOSTdgL3LEBws0tb6oddkYp/Weqb69ul/+DC
	81lonvDUk+z6vkmmzTSDv+78rUgyjQe5Twxf99UwicEofYN6qKxTlrrzUJL2CMxFelQFM3zZDgEKP
	8yzBl6OfVn2FsWK09ptCxDfnVlkD8p/BU1aGXK7HKxn/yjdKRkvSJnvZh/3V20UdDXvumyQ2oyCTo
	xEHPuItNbYtMZzSYwtQ1I6w1mOcnQy9P58MSaIQrI9kXajQn+fjf/9k7TTdPiVzJVRDg6g1FRvqF0
	LRlqhbSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLVg8-00000007pdm-2bVl;
	Sat, 09 May 2026 00:36:24 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLVg5-00000007pcn-3w4v
	for linux-arm-kernel@lists.infradead.org;
	Sat, 09 May 2026 00:36:23 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so1494618a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 08 May 2026 17:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778286981; x=1778891781; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TPu/RkDwR7YvogozdUsQJGqDvuX7QJ4yb5QSBtBcOm4=;
        b=YtDXP3uLtaqlLXNIEh91HZR48h3HCQ320gMensWs/Uf9I+2YnhhJEIHgA4gmgoEk4x
         1JJfvr1VFLMuQYHH/Lz2ynx3jPuRHGg9w4vOVNjBZO6lcR/QqKMm6jkxGABtHmznmhrO
         2GRWbeSWn4Pij47Jkuw+uEzXwibTUGjT3uB4p17DhXjukqG50jqY8vfVqSW1s7sIru8n
         UJkkP2PBAlHidb2/AUuOzKcDIjld8pb91g5tUqqDuVzz957CLU/8Blo2X46246qsKNoV
         YlNEofj4vKHOvZssL+MbhzIGYDGbBsBbRkeV+bfx1EYMlvAT/5O0VL6Z527mQYKYWH0/
         g6ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778286981; x=1778891781;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TPu/RkDwR7YvogozdUsQJGqDvuX7QJ4yb5QSBtBcOm4=;
        b=nQhLUp9uvLQW7EW29+ife/ziJOwwfiNHPgMW+c+IEtnqiviZ5waJ38h9kpq6tDbMoJ
         yVo13ErmT0vHw1AA+EqdHJl2IcBL46e+cnu4zo9wnKXLqAfXj+WBmNANU1/mY1qsN0dG
         mFAnDzyNgCe9E5MczfsTSjkci23++xZcXwylTimxQKb8OZwOBt+G4gyeJUEsuJnOnYiR
         trv+G3OON/p/JBnIyvAWpKe9u4S73STuWwmdeD2EYUAaJJAOSmQiIw7M/7cH41CHIxtd
         5ZgRTW2/qhtHT6uRvq+3G98w0emg52w0PcHhp1Nm51XftC3g6r98Q60JJSKJfb21zmDQ
         ouTQ==
X-Forwarded-Encrypted: i=1; AFNElJ+7lSqAMB+qCUncxtRyinvWZqgJoUECpG7JCqA8keDXVcmHYKeB7xRe5sAp0migu4z7NNyo50TaXavQfEU7pvw7@lists.infradead.org
X-Gm-Message-State: AOJu0YxMO2E9S5YOSgGfJtkD6h63Ib96ZNdia72jaac7fvZDi7clUh6y
	SwYjVu06dxmMRVugelS9LwUc0gt0bJYp6d0OdXnx2hCz6WRyegVhgxKe
X-Gm-Gg: Acq92OH6z8ebbZZNUbQxsurgXkTi9qkxstl3XWcXfoT/Trgp5Tfu60H8in9sIhj6Uw8
	HsDxfz8vwCbx1IhnxTNpPesGMQQTsUUuupremmycXgSUdZB8yrH8bwLVb9AtCGyUPZhkGwnsvHn
	GVdp2Clv4JH9/kEi68U7Yz7iAF6cVgqrCjKWVw0227GpidDl+LTKOkRiUQEIS9XaF/bJGVfbZuw
	bYH85uDwPR1FFykmA2AyKofoQV/PwBw0tLWR5t/jGkajQurq0IFUq55ejMSQ1762v7Q8+Ql7103
	K9Z2YQrMZhjbzlBtaFcR2QcHmuOYGRrpjLlBoR4jAEytestEXdf0qM8js87UMtX1549W2Z3B0Yk
	HsmXuZKBN90ZhjDLzyUkm2rK8XOzr+6lOvqFdbLySLkSDvZhgPZfeVeryJRd325lmE0et8AOwzM
	rVuW+Ey1ZNdH2s9RGn/6JqMhmeL6ZiC2llt171dKZcbkuRg7CDS0UeC74QioyAYouZnEGx/uG+5
	0aGNFKwuB7KNMembAAXXQZw9gdHN3tpuw0=
X-Received: by 2002:a17:90b:5343:b0:367:d9cb:fdb3 with SMTP id 98e67ed59e1d1-367d9cc08dbmr72836a91.24.1778286980922;
        Fri, 08 May 2026 17:36:20 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d609dd0asm288566a91.0.2026.05.08.17.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 17:36:20 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-rockchip@lists.infradead.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	linux-kernel@vger.kernel.org (open list),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] clk: rockchip: allow COMPILE_TEST builds
Date: Fri,  8 May 2026 17:36:02 -0700
Message-ID: <20260509003602.956186-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_173621_979702_0E72C11F 
X-CRM114-Status: GOOD (  12.54  )
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

COMMON_CLK_ROCKCHIP already gates the Rockchip clock objects inside the
Rockchip clock Makefile.  Allow selecting it for COMPILE_TEST and use it
for the parent Makefile descent instead of ARCH_ROCKCHIP.

The per-SoC Rockchip clock symbols already have COMPILE_TEST dependencies,
so this exposes the existing build coverage to other architectures without
selecting the Rockchip platform.

Tested with:
make LLVM=1 ARCH=loongarch drivers/clk/rockchip/

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/Makefile         | 2 +-
 drivers/clk/rockchip/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 3aa6241fd2ec..4b81757f9090 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -141,7 +141,7 @@ obj-$(CONFIG_COMMON_CLK_PXA)		+= pxa/
 obj-$(CONFIG_COMMON_CLK_QCOM)		+= qcom/
 obj-y					+= ralink/
 obj-y					+= renesas/
-obj-$(CONFIG_ARCH_ROCKCHIP)		+= rockchip/
+obj-$(CONFIG_COMMON_CLK_ROCKCHIP)	+= rockchip/
 obj-$(CONFIG_COMMON_CLK_SAMSUNG)	+= samsung/
 obj-$(CONFIG_CLK_SIFIVE)		+= sifive/
 obj-y					+= socfpga/
diff --git a/drivers/clk/rockchip/Kconfig b/drivers/clk/rockchip/Kconfig
index 7e1433502061..85133498f013 100644
--- a/drivers/clk/rockchip/Kconfig
+++ b/drivers/clk/rockchip/Kconfig
@@ -3,7 +3,7 @@
 
 config COMMON_CLK_ROCKCHIP
 	bool "Rockchip clock controller common support"
-	depends on ARCH_ROCKCHIP
+	depends on ARCH_ROCKCHIP || COMPILE_TEST
 	default ARCH_ROCKCHIP
 	help
 	  Say y here to enable common clock controller for Rockchip platforms.
-- 
2.54.0


