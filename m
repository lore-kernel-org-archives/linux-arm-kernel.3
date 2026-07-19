Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEA2C44512
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 21:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vfVcfxp6vUJ0JCSMDQ+w04nlcu7oMz5ArZqbKOQ6dJQ=; b=Ru46j4OApsxNKre8nxEOmx0cGJ
	Y5HV5ew3M1bmuscfejR99D27QJ5CONBwu9/uO7jS3AQS8scZlJTXdY+Q7UDX94YzK2+ZYDbL+sx+Z
	D+7r2NbRCx1ChrgqRiIeK8CSJQSR7D0o0JPeqjnMiR59QNlZLr8wQNQaP1Dyk8ytfeX1BRqD2jwod
	w1Pb3udGNv8Y4jJYEYS4N5VvhyN/VOVmCWuo23v+pxYbX80gZjOUX14oPmibU4gRb7Lk+F1ssCiRx
	XfeG6SpDcjk+IDV1hVRzkAQI5DDpP6rBNgaYtUx9aU5VxP0t/Hz5/pnzRw13LsikEb8vwWziKVTxW
	eiZ2+OGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlZPM-00000005OjC-0O0A;
	Sun, 19 Jul 2026 21:50:48 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlZPJ-00000005OiZ-08In
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 21:50:46 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2ceaf8a1265so91448435ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 14:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784497844; x=1785102644; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=vfVcfxp6vUJ0JCSMDQ+w04nlcu7oMz5ArZqbKOQ6dJQ=;
        b=tE27OnfvMCPit8k2fOChgRa46sV13/bcGDLPN8lD/8mMBvUzpJdeNH84BSCXVdz3bd
         2Qqo/8mcmqqNvfP5jsGYtx8vEankq2btpxnBC5cNYmzOAB/3wzmeAuCgJWYVzGtZ/Wo4
         uS7IgWTBb2+LMhPI/jQyM9iyaxUlZKepYRaLOmtURPZVgRhBquLHc9s17C9juDh38NGV
         UfyxuJtqOGisCsB+nBq58/cB7DO6kZJ/Z6H6tQZJ1to8/6ZREP3EY6Q0QSuzloLRnzp6
         WRwxJRPawcewWKX89oj98/W0qYsPHMebXAcMWUaGE2UPMV6GsMpmUZS+euTlhqpLeBJd
         zydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784497844; x=1785102644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vfVcfxp6vUJ0JCSMDQ+w04nlcu7oMz5ArZqbKOQ6dJQ=;
        b=gB0TkyZ6SEaUcDI9a1xYFClcMo6WnY6AgshGuCXhcwjFeFAmBXf1p1+qHo7cluK+q/
         eR9r02Yqbs6F5EjxntOlTGOS/lOIdC42h2HKGxPRcD9jzKtUTCfr9Bl89zCLBkw4SHmh
         t2ZSVaoJy0Plelrs05V7ls3LeMOD1Me2JYgi17gBxm5lgMLTGgfFYZ5McBda7G6atBaR
         TOXcVOYwCfUgfQewmeaLVom1rzIRUtSeVHrhiwjlJi5/IEdXLG9Meec0nLdyEhpjPF9I
         z8Qm/OgcXkpfshADx6W7by9H6JmoUMamLuCRze8raImOQlYAtTH4BDIVeMat4PbEempZ
         HbAw==
X-Forwarded-Encrypted: i=1; AHgh+RpYWhPCKVNF20pZHfb/HrR4hFYn8KrHsDJta+r/34/ir6pXNOiYDdXEGhdyNTB7Y/850LzE6OLyhODnqZmZaBl2@lists.infradead.org
X-Gm-Message-State: AOJu0YxI+3exaed2Fj3PgyOkXy7BQwBAlFO4aotJRwVEDpwrIw8Ghe6+
	dKeimx0Vh/lBsXFINaZz6TMb2uNsAYN/FWucJejC4LF/hpeg3svi0p8W
X-Gm-Gg: AfdE7cnFZkKRrM7IH5mScPKfR8JcXEu0LjeVL+0QBnd+cTQmOzytroTSNVLcux8Pag9
	XA6b7cEEJdtpGQUKFSrTy4XtHQl+q+3Sp1XSSyNCy1wymUcLmLcMd8QdxpcPVUqjS+FpDlT9126
	/9Rppnrg9ZAQGUxhVtzIJLRlCl6xpgJhWVulaIubDhAnj2lW4bZhW5K7u32wcaCfDcPVcjlPhIs
	AllassEP0QBe0O28PdIsHHvdDHU7l9g4IzYPAfh5X+GFjia4snjAynTy6QecmKHZ88cZxab3Ctw
	9G3/HceDiqOMCwavADr8HQePr3EPh8i0gC1YZSWugbCzKPKAiwRsszY+6EdAon5xXumaoLP8/7H
	D/6WyHCOlxxzc6m6GJdw4eJEUNZ+wu/WWLBIpmcmZwrW/76/Mx2ZmSjcuZSMRzhjIOHzk/eN4Wi
	iJChvXioakHUYpXCcah8y7x4OLqVj+OIibrnDI35aj3qeoPO4FQoUJWZaF2r+tzTKCcL9sn3WEw
	mp9LawDBBtICRxyyVV3m5vZMWVk7rOYWGbgSDBOEyGjNBiyw7nLNjc=
X-Received: by 2002:a17:903:298c:b0:2ca:4b7a:4a02 with SMTP id d9443c01a7336-2cf34a7bfe4mr127277915ad.43.1784497844128;
        Sun, 19 Jul 2026 14:50:44 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344b78e2sm44745845ad.24.2026.07.19.14.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 14:50:43 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
	Nicolas Le Bayon <nicolas.le.bayon@foss.st.com>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCHv2 0/2] clk: stm32: fix COMPILE_TEST builds
Date: Sun, 19 Jul 2026 14:50:38 -0700
Message-ID: <20260719215040.767232-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_145045_091183_0A52912A 
X-CRM114-Status: GOOD (  10.53  )
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

The STM32MP clock drivers have COMPILE_TEST in their Kconfig depends, but
they fail to build (and are not even compiled) when ARCH_STM32 is disabled.
The first patch adds a missing bitfield.h include so the drivers build
standalone, and the second wires up the Makefile gate to the STM32MP clock
symbol so the directory is actually traversed under COMPILE_TEST.

v2: split up in two patches.

Rosen Penev (2):
  clk: stm32: add missing bitfield.h header
  clk: stm32: allow STM32MP COMPILE_TEST builds

 drivers/clk/Makefile              | 2 +-
 drivers/clk/stm32/clk-stm32mp21.c | 1 +
 drivers/clk/stm32/clk-stm32mp25.c | 1 +
 3 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.55.0


