Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94880EDB7CA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Apr 2026 08:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gpY4U27Y71SwDzYx6NrKHrnXl79ZOYWYmPRAEotSW3Y=; b=xh94nCB0DGLqftSVPVvXlrS5qS
	bMz9mZjXoWGApRcjZ8pKXaAaGCSdYuiT9CViYTKeMj0E/sqezlkJMz2BEz4YqX/OzqtHSk7oGgfCU
	7Mp0cvFZiJAiosAiMGammDrbFsLOAOnhODsWdx3y0CSwJ5CV/CMq7h+u5NaQ0SYc9Sjf1hOXNjkk7
	pjxfH/9U4FLvdYG+98xhZR0qVPE0vco+i+F20K7ZTLCLfAMnx/28Kkri1gp2dXUeZggb0kK8ZtSuk
	hux+4jnXKPvRyYBabmeEkJmLyWRZdEwtlA3ckW6XX69/e9sv89qaj9R+wjGO5CMuzFgKDI8XWZAw5
	3/y45zKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1dG-0000000682o-0wp8;
	Tue, 07 Apr 2026 08:17:58 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1dD-0000000681p-3SM3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Apr 2026 08:17:57 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-35c124d2613so2730738a91.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 07 Apr 2026 01:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775549874; x=1776154674; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gpY4U27Y71SwDzYx6NrKHrnXl79ZOYWYmPRAEotSW3Y=;
        b=N8JX7vtG5RiPINMlpCAZqKdlxxr69ickmXcnJXbDBG8LSd5XIOfP8uwqumk/r/O0Ap
         UlaewYp/D1KGGHzqdXs/Kr4TeuY+cRXAIf1ntGvB+sfPKaXiOIOO4Xns0LvDx19zsnpI
         KQMt71NVpmoEoZZ07WgZOZtiw5qBrfORfilbm8cPAIm8jv2Wjj0QxdkVYga/hANOnlFm
         9CNjJxHcliSAhWGc+aiUPOlxexKQg86O4I6nMjIPP+f3vCpXhU1nkeOdGB61zMeSb/3S
         h+Kv+7fpHmZrUGITFbK0rT0lsuwJNl/KEJNXMmAxiFYYHAW/gmoZXhMtudpHDzGa08+y
         2bCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775549874; x=1776154674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gpY4U27Y71SwDzYx6NrKHrnXl79ZOYWYmPRAEotSW3Y=;
        b=Ya5T5QkaQWHwu0jgMDUsdG+n3IIrtEMFsASAb+en0+W+dMFCKsxX/5RqsMbf4viTms
         4Qwo8NFuG+NeOk+E4WgJiCDFJAnOh979GZmcz9CQk+puZ37fIV455qNdakCtCXm0p2dP
         XpoJsSzp43qDYVziGNXfyEgN7vLoZlyQ9U3mF689Jzr/CFyyP05pfJmp6/rJJjNr1zDJ
         3wIaixNPeWq+hAPt+mgrodyhCKueBGNdqCZgof+2JuClkfIYuV2zjJPVSAZNJX944DcY
         XzLZm5ydvJ/N8LbwZrEwsXHPjAqbjmWYgKnj2YE2NWehdKXjzNRY6KpvwRL3VwD0HKnG
         Weog==
X-Forwarded-Encrypted: i=1; AJvYcCXIi0KPZ/uU049X6KtUhse4vuwXrNiMvyLBhAt34A9y2PthAa+KaQJTi2FoN76xuSX8DRfc3FK7gZowvDihgyN0@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0V5ROov9fT70vjYEmTsS4JCOCBVT56Byzsl54JCrx4O9vJ5WL
	YLFRJt4cFRupDCjAB2CN8jE8a/ct7hM+QMQI7kG9MYEoF7fI6z10CmLi
X-Gm-Gg: AeBDiesqwqQBqRpKtxnAecKCNq/GzqNAg6PJULbO3Ync3WuSXCwOX8BHkt8uQRgtqy9
	GshLw9JJLhA45AUXlCaKCiw66p9gLjT44U36vmPQ9fAiGjyRuaI6XHmzjMmmknENQp3lX2XHOlm
	wKKweWU0C2Q83OYk+mHqwzad0UMXR/1qKM8jCbtwSjZCxPwaEMvWPu0QUHcMfwLF81NVwUpH8ks
	1iYDrUyPOwPk/HcCiPh7Kf1aF5gBUfWzNy+K1NbwZ3NxkmaXEXiEjNjVWu0P31VceB8zzLgvRJm
	QY3hRZglXaDEBBOcmIfwrv/D8J90dHAtzMOB3Bs9Z2ydKLNLPABxUhJYfe6AOVY+HZIwSvgX8Jy
	NQzsVuULEzErKG1yEGn/h92Varu0Jm2lVfACSskhNqw2E6SBb6+HnaPslq1dir2z5QVrUbJicXB
	UHgBW/hOJAJEXVB5rPeaEjVOGzKj4msdiemzOI3y/Sug0AjsMJHzez13nqby/w+zzyPK8HFDfBE
	FA6f8dehl5U
X-Received: by 2002:a17:90b:2b4b:b0:34c:fe7e:84fe with SMTP id 98e67ed59e1d1-35de69aec1bmr15940483a91.28.1775549874412;
        Tue, 07 Apr 2026 01:17:54 -0700 (PDT)
Received: from pk-pc.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35de6a2325bsm4592889a91.12.2026.04.07.01.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 01:17:54 -0700 (PDT)
From: "P.K. Lee" <pkleequanta@gmail.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Jason-Hsu@quantatw.com,
	p.k.lee@quantatw.com
Subject: [PATCH v13 0/2] Add Meta (Facebook) Ventura BMC (AST2600)
Date: Tue,  7 Apr 2026 16:16:58 +0800
Message-ID: <20260407081700.2658011-1-pkleequanta@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_011755_904924_D3E4734E 
X-CRM114-Status: GOOD (  14.42  )
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

Add Linux device tree entry related to Meta (Facebook) Ventura specific
devices connected to the BMC (AST2600) SoC. The purpose of Ventura is to
detect liquid leakage from all compute trays, switch trays and rack
sensors within the rack, log the events, and take necessary actions
accordingly.

---
v1:
    1. Create ventura dts file.
    2. Add commit msg.
    3. Use format-patch to generate patch.
    4. Add subject prefixes matching the subsystem.
---
v2:
    1. Modify email content.
---
v3:
    1. Add mail list.
---
v4:
    1. Apply git send-email --thread option.
    2. Sort nodes in the dts alphanumerically.
---
v5:
    1. Run scripts/checkpatch.pl and fix reported warnings.
    2. Remove unnecessary 88E6393X CONFIG FRU.
---
v6:
    1. Add a new stage for the DTS change.
    2. Run scripts/checkpatch.pl and fix reported error.
    3. Fix the issue in a separate patch.
---
v7:
    1. Fix broken indentation in the device tree file.
    2. Sort nodes alphabetically, then by address if equal.
    3. Rename fan sensor nodes from 'hwmon' to 'fan-controller'.
---
v8:
    1. This patch series has significant changes compared to
       previous versions, and quite some time has passed since the last
       submission.Therefore, previously received Acked-by/Reviewed-by/Tested-by
       tags are not included in this version.
       If needed, tags can be added again after review of thisnew version.
---
v9:
    1. Reordered the node sequence under i2c5.
    2. Added a description of the platform's intended use to the commit
       messages.
    3. Added 3 GPIO expanders to i2c10 and defined the necessary GPIO
       line names.
---
v10:
    1. Added IRQ support in GPIO expanders under i2c10 to handle edge-triggered
       events.
    2. Reordered the nodes.
---
v11:
    1. Modified the position for i2c3mux0ch6 and i2c3mux0ch7.
---
v12:
    1. Added a GPIO expander at address 0x11 on i2c10, and assign an SGPIO pin
       as the IRQ for it.
    2. Fixed the "failed to match any schema with compatible" issues.
    3. Reorder the nodes in alphabetically.
---
v13:
    1. Add two GPIO expanders (0x16 and 0x17) to i2c10 and assign two SGPIO
       pins as IRQs.
    2. Move the RPU_READY_SPARE_PLD_R and RPU_2_READY_PLD_R pins from
       SGPIO to the GPIO expander (0x10).
    3. Add all tray PWREN pins to the GPIO expanders (0x16, 0x17 and 0x1b).
    4. Add explanatory comments for "unmanaged mode" under &mac3 and
       "intentionally left empty" under &mdio.

P.K. Lee (2):
  dt-bindings: arm: aspeed: add Meta Ventura board
  arm: dts: aspeed: ventura: add Meta Ventura BMC

 .../bindings/arm/aspeed/aspeed.yaml           |    1 +
 arch/arm/boot/dts/aspeed/Makefile             |    1 +
 .../aspeed/aspeed-bmc-facebook-ventura.dts    | 1636 +++++++++++++++++
 3 files changed, 1638 insertions(+)
 create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dts

base-commit: e11fa6b1ff6c27c808d17e479bd7d5582e772062
branch: dev-6.6
-- 
2.43.0


