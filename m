Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435E6C43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 16:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k7WWDimv3b4NdwES6tpNCGufjtNL62BZYyk5PVukc5o=; b=Jqqh7WPOCzMJIOH0Mbtb7SKI+z
	7UQPoDlJxW0xO/kA/lumMRH05n/fY/PWyA4CzZpcgdKlKf2iFSEGx8fswK6F3DYe8MchcPArQeqYX
	FpWWcRwcoRKWqBh0DJdnckg5Cz9Yv3Xzfg9222sJJPG6zYwrlwk8VBjzlaf6sh1C9bp+LxuoXc0TQ
	PrCmWg5uF/nSSiEvFuQQ5YEi8ymexBAZDSuAuIbpGfKF8sDD9FUDEIqY6+q6j/o3vw2GqER1AjFsS
	924v5MqDsh4mjA8YjTCEZg5ixWWBhZFj0ZmkI8GscqKnnA2kdJwl4+7UFftdSus5HyA4qdu5Uf32t
	/zPHQEtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiwfM-00000007bJU-0xrf;
	Sun, 12 Jul 2026 16:04:28 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiwfK-00000007bJ0-0IOe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Jul 2026 16:04:27 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-472326ca506so1844052f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Jul 2026 09:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783872264; x=1784477064; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k7WWDimv3b4NdwES6tpNCGufjtNL62BZYyk5PVukc5o=;
        b=SKkW2A3wIxBLUrca2A8qghd0pvdsDeLeKpISbCSphyKwkkK+7l1PTrj1V2op342uqv
         Pjo5XqPkRQ9zYm8Q25TmI7kKqt5RLgXbo4NoCNvpsq44E1RBzODeZqFnDdLHS2HVb5CU
         g+nqXWhr2VeqoLn8AE+wI5XySsWgLb32GfQcZxutr0RWbwkKTru4ZvrVfGrH9z2YZ+0O
         ujA6VLTcZ++N2jchEQxeaew8Uh08tFsrohcMyiGC+Xe+DYyaCUHAyw16Xq8zdb1/LQ66
         nPHC7wp5SbgLf9zGw9BczU4Lc9Js4exj5hYDFUsMR7Zv6eL9Wp/Lcf9/SWv9QTk9vT8r
         8HUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783872264; x=1784477064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k7WWDimv3b4NdwES6tpNCGufjtNL62BZYyk5PVukc5o=;
        b=DSRYRjudmx+jyC/76MByT5Mif8hfpkjlkoKa0xduYxp8YR2NYpZCgoVU/jOGiTM6I0
         y+/Bhb1W0ZFKQ4NsrV1zAXh6HLk4u18cT3XtpswNs6v3nU0KwSjggPH/mySNNI15SVUw
         ZjA0X4fqs1VFeq5Ut+yYAdcECGsBVhYgWjPtalkONPMPTcAHOC1x4lz12jgaoHHBySZI
         tzkaHBqmr5v7G8dfx5oHiRbulb+JQI/l1Cr+SVqNbygWlURtNsM8Jo8JV+mZ8LU1xONQ
         z1J8rwVj3YYqJUfyW6mf9g6exIqb087yvlzjtMwuHIHuhLrnL3aL0rqQ61m1rALJeqyv
         65EQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq55hj8DrMgAWH5PBBh4D/S9ExOUYFOIjlUU4qlXbC7ZCCjayz2KcRU4jmT4U/tbSPtz8uNjoLYekocLklwaH0F@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3N4u1r64a5/uRCALyrRzVDl6otTQOhN8mF8niHV0IwXZxMYCR
	/9db9dJ4Hpz9B7Clj/Ll2kvvr5otGXxUf/ylBGOso8QJZMLVaF8q5AGe2j9Sq5hK
X-Gm-Gg: AfdE7ckSm7GBf0alhYmDNM09doiSKmx/M193JudP4YyKfRS2fH6pf49aA1cA3NfEQtA
	E2oBuyl0WWvDK/yL3uM2a68HQpfr6pxzhBUGTxSPPmwR7sROKjIC8yNqEBwosadFt1FV2LhiYGa
	UdPFLxdI1TPuKmhyM305lgxDLhwVuBzT1KneoUJhJh5plqqB8O3q8JMGorJ6VaGU0uviLcMH0vM
	N47FDpd5PuvgFdY00cBDy1RUHrEanYUdtf88DQFZOS6emXymmq5TxOvI2zZV4dZ1tqlL51KmxjG
	puv1ymSerS3DiCpefAhuGjU3/tTLviXna12mKAb2WELLdaltnRJwOLzZo42mDr7+mzVpcps9cP9
	S59aK/6G4claBw2vO3CMH/rHcbnpWcSZmQ00nwkK/FkzvXMLj6Rc2vYw5YwBCx65g7sXJ56jOHA
	Sx9XdA6RvJZtzejKzaBpNv4iJoy2L2FJa6ip0YBKTxBc3guc41y7OrJehsYRJvV2wTFxJWXnLAp
	KjwjYW4JuAyWomE6SDqcjaKPS5VXR3nFvpZSJC/+OPhdCQYvgOMPzXR
X-Received: by 2002:a05:600c:5392:b0:493:b811:e549 with SMTP id 5b1f17b1804b1-493f8829963mr60790915e9.29.1783872263381;
        Sun, 12 Jul 2026 09:04:23 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-117-112-249.95.117.pool.telefonica.de. [95.117.112.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493f2c8de2asm204774265e9.1.2026.07.12.09.04.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 12 Jul 2026 09:04:22 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Joel Stanley <joel@jms.id.au>,
	Brian Masney <bmasney@redhat.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-clk@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [PATCH] clk: aspeed: ast2700: select AUXILIARY_BUS
Date: Sun, 12 Jul 2026 18:03:01 +0200
Message-Id: <20260712160301.98941-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_090426_148250_FF8AEA4F 
X-CRM114-Status: GOOD (  12.90  )
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

The AST2700 clock driver also exposes the SoC reset controller: it hands
its register base to a reset auxiliary device via
devm_auxiliary_device_create(), which the separate ASPEED reset driver
(RESET_ASPEED) then binds to. That create call needs the auxiliary bus
core (AUXILIARY_BUS), not the reset driver itself, but COMMON_CLK_AST2700
does not select AUXILIARY_BUS.

It builds today only because RESET_ASPEED selects AUXILIARY_BUS and is
normally enabled alongside the clock driver. On a randconfig with
COMMON_CLK_AST2700=y and RESET_ASPEED=n, nothing pulls the auxiliary bus
in and the kernel fails to link:

  ld: drivers/clk/aspeed/clk-ast2700.o: in function `ast2700_soc_clk_probe':
  clk-ast2700.c:(.text+0x147c): undefined reference to `__devm_auxiliary_device_create'

Select AUXILIARY_BUS directly, as other clock drivers that create
auxiliary devices do, so it builds regardless of the reset driver.

Fixes: fdc1eb624ddc ("clk: aspeed: add AST2700 clock driver")
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/clk/aspeed/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/aspeed/Kconfig b/drivers/clk/aspeed/Kconfig
index ef50481c31ff..2f505eb3ca95 100644
--- a/drivers/clk/aspeed/Kconfig
+++ b/drivers/clk/aspeed/Kconfig
@@ -15,6 +15,7 @@ config COMMON_CLK_ASPEED
 config COMMON_CLK_AST2700
         bool "Clock driver for AST2700 SoC"
         depends on ARCH_ASPEED || COMPILE_TEST
+        select AUXILIARY_BUS
         help
           This driver provides support for clock on AST2700 SoC.
           The driver is responsible for managing the various clocks required
-- 
2.39.5 (Apple Git-154)


