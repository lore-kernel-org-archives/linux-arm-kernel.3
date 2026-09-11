Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDA7CC88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 20:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gMonAExe1+8sA/MtVTtiNlRpTj5I89UKSQ+s0kX1ltM=; b=dxy1/oHAK3EvrTp1QaE2NzRT63
	byGs/SLtFzV2rHBMOaWYypP5O7olFw55sXlB/B980pHxFc77OKjTxbqkt4GG3tquTS0Ogmcv7Vy1I
	WwAv7O8jvIkM3pd+nsnv0PSvvwZEOYC1jNI8tyR/Lcez04+4Ncp5XUa+IDWxxCaHR65MpIqG4S9Lv
	7dORwjkq7QI4yTwUn2wHBuj8FQgoCy5af8HVpU33Dw9KFJCpwdv8VO5iZ5ijcGDAaEhHncXShYUCc
	w8NCSjttQKx/6VSXTNZ2KZ47c/mWDiyFi5h8+p7svLg9GXuD2iIm3iG/f/qy6ZRbbYce7g1f8wkMf
	RTRZT5CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x58Ha-000000007wQ-3AYx;
	Fri, 11 Sep 2026 20:55:38 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x58HY-000000007va-2MSi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 20:55:37 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-49cf4f81d86so10462425e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 13:55:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789160133; x=1789764933; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gMonAExe1+8sA/MtVTtiNlRpTj5I89UKSQ+s0kX1ltM=;
        b=FTq5HQVRfkiwGxBR1WqJdIrMxi+sEjGEhHME2Udu8EtdmfwDxt9ofRxWNF8NVSbdQv
         9QS0wShxLB00sWW6VH3+4s/fIJ7d676FQdsbhfvp9ic1d80Xr0gllgcjXB1nGkbwYp+P
         +5+N43JwHwyTAUFdxTkixggqfEo2W2UHQFKhE5WgfkyMOHnwS6ba/a1sMQ24QMTw/5QS
         OtoDCBf4c5Fuv7ntR5HdUi8lnipYQ1ChXV1Y3W7QjI2/xu8AB2Hs5lmRAdnWeiz+Jpxw
         3p5XSMozhquTUN/dE0d4dwOEjSWQ0wFAWqcmVKVqzQXk3kpaqvyRq/wuGElExOlre84m
         jrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789160133; x=1789764933;
        h=content-transfer-encoding:content-type:subject:from:cc:to
         :content-language:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gMonAExe1+8sA/MtVTtiNlRpTj5I89UKSQ+s0kX1ltM=;
        b=RqkhlT5Pp1JSb4J9YlH5dAl4fvhGzzt99yP09m/43Hk/EJFeWI0mB7MG0qnBv8H2lB
         0NoyQRApZc68M5cls/wyJ03cZEbVFoWB9LJfck2Lcyqmxz59YGA0UKJDKhmGhG3i05Hi
         Mirj6/WpoFXEsFZ/W6aA4djJd0Li92GnX6oqIxzS7R08FCqHdnZd1Ipz03yvRGaaRiMJ
         wvyKlVILlN9orymUC9L4NkU1I48ieZVgnnnTbr09jmtQGCW0NT9fdURBFUAqTSi4rdwK
         1a1v9n5+sfehJgaaPfGl+y7Imm3+lzRgAvhBsC7koFauDpKaTDEioH2c8CxLenMUBsWO
         ySdw==
X-Gm-Message-State: AFuF++le59MHwEdeh6riadXM0OrMh0cxDYmFnYTR6Ua9onWWND3Qc51z
	DiNXBi2iwJJxDp+JaCkhV/MgMuqr6n4yqIj45yh1E6uDkoHoD58LIfxE
X-Gm-Gg: AYBFou19SYE183msk/Il/Hy6vnD+IMBLMLSlbM5HhRpt9h1pAP8xoRER3yXavanNuNp
	7iw3+tO9CoB2dSoo88sw+sC3ksA1D2t3TcDAI5IZQydsqcKTeOhTwqNYBJ52obvtrvn1H7ZFVDE
	y9rn6dcoUU7pOZn/mFAFXSnY+qVAYeV2RR1N4oS5bir5H3E188XXuqcApLUrqy9Rm6t7zu3nETh
	Wk14NIs0ns96mcYzktlGpR0fqYInsNmpSZawOgmXkGDFvmaYN7cqx3WTS31KJfMx7+upLrbohRe
	46OiB4qwoKAGiElMxZsbVc0BUlu3FnI6b2MfFmcFtpfjynXytsf0y13+9Mhoj3IdiAgkPrEK9EJ
	NowzODrFag4205KmrHv4IEfITWqkdemsipVrLf8+NVtHylh3Wlq8oq8Kaf81bqWiDfuZQN3Aq1w
	m7eky8JiS7BUjhnQO/VhioQHcDGbkwFqyxRCXwY7uF16wCWkdwtQV7YYXvl30A/2ITmGxlSJutC
	ebElElSiX6k3GqlAQ8v3K19aOWxnraCD2yWU5hy9VxY+p4Q/WWQplkpu0r9jwPRhH2Y5T39gVSY
	DV61NK6rtq70cABBT1+6j/kYthDdK2Z0iQ==
X-Received: by 2002:a05:600c:3513:b0:49d:28c4:b304 with SMTP id 5b1f17b1804b1-49e619d479emr67841455e9.29.1789160132668;
        Fri, 11 Sep 2026 13:55:32 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f48:7f00:ac37:967b:87e:e5c3? (p200300ea8f487f00ac37967b087ee5c3.dip0.t-ipconnect.de. [2003:ea:8f48:7f00:ac37:967b:87e:e5c3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26be3e35sm176876975e9.2.2026.09.11.13.55.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2026 13:55:31 -0700 (PDT)
Message-ID: <3cec5f38-e0d6-4d12-88d4-74cb0000a2f2@gmail.com>
Date: Fri, 11 Sep 2026 22:55:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>, Tom Rini <trini@konsulko.com>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Stefano Babic <sbabic@nabladev.com>, "NXP i.MX U-Boot Team"
 <uboot-imx@nxp.com>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] ARM: imx6q: remove unused header includes
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_135536_612695_42E6BBCE 
X-CRM114-Status: UNSURE (   8.99  )
X-CRM114-Notice: Please train this message.
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

After 8392af7be78d ("ARM: imx6q: remove KSZ9021 PHY fixup") there's
no user of phy.h and micrel_phy.h left.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/arm/mach-imx/mach-imx6q.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/mach-imx/mach-imx6q.c b/arch/arm/mach-imx/mach-imx6q.c
index 58f53fba2..00ac52cf2 100644
--- a/arch/arm/mach-imx/mach-imx6q.c
+++ b/arch/arm/mach-imx/mach-imx6q.c
@@ -8,9 +8,7 @@
 #include <linux/irqchip.h>
 #include <linux/of_platform.h>
 #include <linux/pci.h>
-#include <linux/phy.h>
 #include <linux/regmap.h>
-#include <linux/micrel_phy.h>
 #include <linux/mfd/syscon.h>
 #include <linux/mfd/syscon/imx6q-iomuxc-gpr.h>
 #include <asm/mach/arch.h>
-- 
2.55.0


