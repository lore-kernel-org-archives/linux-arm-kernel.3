Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BB6ECD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 22:13:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kpz3rbq9P9pH8i5JgQAH9XRkEkwWKb9Pq31/YwXsa/0=; b=r4HwT/LB7Vsc/62DTsdUTdFGcY
	VyNlpukzUJ2toAMUnYRp9jifAa90VWh2PH64Wew7hKh7T0YjAuja8d8olHQ8QWkMlBYL26yF08FUM
	QXoPLzVfEHir1oRSB2pADyKPIvWFdZNcA9EIfh82Wqvu15LDt0WFnLia2knLUcUXt1DfRmwfrsQIF
	4nU6xxOLumDq2szEjDv7jffwMVHvWD0AV+XVBpx3LI7KPfTvJYWpeuHI/OHx3IniHsbhn1coKtbYr
	sZBGWWRLWQTzQXM1Laej7wyOUZ9jplPDFWFR6NPVBtaVzla/Jgx0MIm1VPJaC8RKihCzuYsYH3VN4
	ylD6yGuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP6Cj-0000000H4JD-2w7x;
	Mon, 18 May 2026 22:12:53 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP6Cg-0000000H4Ik-0Y5T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 22:12:51 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-8353fd1cb5fso1332349b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 15:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779142369; x=1779747169; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kpz3rbq9P9pH8i5JgQAH9XRkEkwWKb9Pq31/YwXsa/0=;
        b=ZgWNupStd8slEnYzHmTgFcGof+Dkw/4N5bTXr6NU2lbVKpmMay1vHnTlV3lDlJEsEh
         Cb3gm6RxLyPE0vTccDsenlBjFEVuFXhwd0ORO1RDAE7MGsa8Taby24hv6cfUchPpMLbv
         aQSRPm6XsBQe+Rdl/JGZmOVPF1ABul5DsiDAksu8UWqNbIfzlwvZ7WSrnYl0FQdHMtEN
         KDMQYW8P5lyyhcPQiblRiz50f5jwjpClLZzN1wbO8nggVP877/kBdgPxHUhFQgvpZO5y
         GGRTRSWtUSKspP2heF3gc8O2xIfxEbDZB5ZgLfgy191sbbDlGKDLauibWueboSh6zP+O
         ARYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779142369; x=1779747169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kpz3rbq9P9pH8i5JgQAH9XRkEkwWKb9Pq31/YwXsa/0=;
        b=D4dNr6inEcyXNCFPDVmUUnhX4mUiYv28+N0Pw8vE0+VESrKCbxz2qoSajI6ixK7X78
         GNDnf5hUwoMNFEBJTr5a/dO4mFqd0ymygRUOugvZ4dIYA93cJqM/UVhOwNIAwNPQmrS8
         OFER5eIgHb8ljRV5GsGA/vBMDyDHZmdby+YurM08Vn016+6m6t6GnS7d6WktNfOhs3qi
         WzBCKdq1iTbymWaM+/NhoswwoXS9la+kz1btXrL+D3jk2FuIbLwn96VYwADkpVaPaUNB
         ip2Uzph2UQPcu0FZdRGFE94USGFE87y0mX6Oj9Cckm3fJN1+OtAYJID/OV+qxKxEHyfb
         uIDA==
X-Forwarded-Encrypted: i=1; AFNElJ+cUogOpbaa4uZpVLcmZ0QZUqs2Dnm4hU3dvvcxLKOrBO6mX70u6ZoYlGfjCRvSjUNjz9Scsxbuu2vlSxyNagQv@lists.infradead.org
X-Gm-Message-State: AOJu0YzAfCXwFwMwTZIftbt+zovW8y5ZmgHisMWv5D972x3XPio4jy52
	D/kTfWULXJFJardad6YHtoCrU+xj+CNEbJdoY59fAJm5wsS4aofScDBV
X-Gm-Gg: Acq92OEe96S4IkUhl0v5MpYV6sapRk6YpXTkb5qgVe7EEVdHMu0aOpgQFRbMZXAxYQr
	UVAs720W0BbBt6z6zMHWEjdXQyVZO3dHzQRf1paTLqi+dZxF/wdPZJ+gRg815CZ0CPxNr1wr2I9
	3nNfvKZUlQhQjOrV7UzXnnb07rCJSvSsqk5AtjZ1+E7Su3pgr7SLbRPa3n8om8RjatKUfY801bB
	SEPr1FNG7/ScrUMZrOf4PheBv7D7NHNfakx2iGyoh68CgntwXlkvoCeWO6QQdVvk5uQeYmVe6UJ
	XYhHRA20Kz/Tv3bwLX6oJp864/qcrhyDv70/YULpxciQQWn01EjoapMYHxkgCmf1BeKopc0+Ml/
	IXIgwvzBhbQe+oT3kugbsV+c2+p3qmxlyj+M2cKJcu+92xL/SPTTAyMgt6ebUhYzbLaks4YeaMD
	VNUvRZxP4UnIG7l8nNq0FfrhI2ZSQDuWCi+Z0mVQD9AWfVCnsf/vxfztZkArOP4tCFCy0rwhW8E
	dKO1YqTBPQkgs1gVTEckXW4go5nO2lNkOo=
X-Received: by 2002:a05:6a00:12c2:b0:82f:9a88:9092 with SMTP id d2e1a72fcca58-83f18ee3862mr17241901b3a.33.1779142369233;
        Mon, 18 May 2026 15:12:49 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f7cca8sm15870899b3a.56.2026.05.18.15.12.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 15:12:48 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH] clk: stm32: allow STM32MP COMPILE_TEST builds
Date: Mon, 18 May 2026 15:12:30 -0700
Message-ID: <20260518221230.19879-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_151250_174723_8DABBFBB 
X-CRM114-Status: GOOD (  11.46  )
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

COMMON_CLK_STM32MP already allows COMPILE_TEST, but the parent clock
Makefile only descends into drivers/clk/stm32 for ARCH_STM32.  Use the
STM32MP clock symbol for that directory gate instead.

Building the STM32MP21 and STM32MP25 clock drivers then requires direct
linux/bitfield.h includes for FIELD_GET(), so add them as part of exposing
that compile-test coverage.

Tested with:
make LLVM=1 ARCH=loongarch drivers/clk/stm32/

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/clk/Makefile              | 2 +-
 drivers/clk/stm32/clk-stm32mp21.c | 1 +
 drivers/clk/stm32/clk-stm32mp25.c | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 9c3a9703ad92..0cd2223de3ca 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -150,7 +150,7 @@ obj-y					+= spacemit/
 obj-$(CONFIG_PLAT_SPEAR)		+= spear/
 obj-y					+= sprd/
 obj-$(CONFIG_ARCH_STI)			+= st/
-obj-$(CONFIG_ARCH_STM32)		+= stm32/
+obj-$(CONFIG_COMMON_CLK_STM32MP)	+= stm32/
 obj-y					+= starfive/
 obj-$(CONFIG_ARCH_SUNXI)		+= sunxi/
 obj-y					+= sunxi-ng/
diff --git a/drivers/clk/stm32/clk-stm32mp21.c b/drivers/clk/stm32/clk-stm32mp21.c
index c8a37b716bd5..3c143371c77e 100644
--- a/drivers/clk/stm32/clk-stm32mp21.c
+++ b/drivers/clk/stm32/clk-stm32mp21.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/bus/stm32_firewall_device.h>
+#include <linux/bitfield.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
diff --git a/drivers/clk/stm32/clk-stm32mp25.c b/drivers/clk/stm32/clk-stm32mp25.c
index 52f0e8a12926..cc95fac66449 100644
--- a/drivers/clk/stm32/clk-stm32mp25.c
+++ b/drivers/clk/stm32/clk-stm32mp25.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/bus/stm32_firewall_device.h>
+#include <linux/bitfield.h>
 #include <linux/clk-provider.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
-- 
2.54.0


