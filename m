Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED9EC624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 08:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7ppxnFvAw24ZUt3xThnNDDHvbXLEAcwoo/mw6W53hvY=; b=E/f5yr+fkZVtYdBt2opEC9gBPk
	jmNIkT++2K89ApVXpQ2i4ACkgf/y6wsWRS422I+AHXzwyJ0zskVCcQP/pUlKuNI0Qe8ymkbjekH1A
	CWcNLGozG3auOuKzUGKeiSEdLIO9MRnu+nsIhC0DS86bGm/FpnqQS0r3ED4iH+0/c01qGCIJ8nYoH
	x4ox0+7F0c07j1yYwE59MXjhGdwelHv3cFFMNUov9EzihKbSbb13XAfFVlfLxcWiV2PZ0y/IHDJR0
	TJSLhionweqi2JKIXNwYyI0oExmYzp9tdw1qZqUQdFkIpS7IMzRTMV41/Gk+fxAOh/knWCkWfvmIr
	Za8gqjhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lQN-00000003psd-1ulX;
	Sat, 05 Sep 2026 08:06:55 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2lQM-00000003psE-08cQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Sep 2026 08:06:55 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-4858be8b509so693368f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Sep 2026 01:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788595612; x=1789200412; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7ppxnFvAw24ZUt3xThnNDDHvbXLEAcwoo/mw6W53hvY=;
        b=mz9HalvHbMMcOis0OfhhOE9ywJw0qFkFS9mG+RIA2Iyaw7F0R49KSGrPBC8ODAl5KX
         RuW8HKUGUKrw24cj/1BJRmEr9jyK3yq+rxyiyItKoRyMKyhLXwlrAkzNtIvgVJLHEP7p
         ugnKcQsvPShj6n0AzY2pcoWx9wJRtUen7E+gz9lLI0BdxFR/sggpnsYEH2qatZV8iBtJ
         k1MgG9lQkDGRDZaIDQuLKOsvjFbeH2UcIgkuybXFJ3m5eRm4mKMgPLC+JxGUMGkTBEfe
         cklUZodU/1wxbE7llCqecMHcAtiV8KFTdgrl/NN/EVsSIr/MuURwVIvH8dnVq9KQ4OaQ
         ZkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788595612; x=1789200412;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ppxnFvAw24ZUt3xThnNDDHvbXLEAcwoo/mw6W53hvY=;
        b=nAWSBSn5iw0t+tkzFY4yNi1OMdPFCdAWd5zljoZ3mdZILtqIs/FSdQuoTBDv2iQp6O
         42ixnN2MnpIZk0VAd1To0KlKeHtOKFxDd01TfTFvmuMS/5WsYScdagagDNXPLobXS3kN
         h2QjAFPYPlpmWtlFHhtCmjN+Q1QZgIw+wJPOq0HK3tLw+W1xhs3S6qnBFvNKC1df85yo
         TEt9UaSHVPhSgRrUs8yhhcPcNaFM7DHlgiEbofhI5XFTULkVNi3oWNtedipxOAYlLGxx
         OFw45iMmIrjm3t3mCOL6b9fuOlY9etKo1kdKBAT09uZ37na12vsZllkywzvx8qfloOyV
         MjHA==
X-Forwarded-Encrypted: i=1; AKwUvBy2uTz0iPEvcK4YhNpql9MM3ptzCm9XGr/4svt0Npeo/4c3p+bMFq2mhnrf39TG22aQ80ZzwJr0H+fDafFGVNr/@lists.infradead.org
X-Gm-Message-State: AFuF++mP2NqslTLfDSNwBLxydkg9Rl+kcb0JxyqnBUG4hETlw58YY35B
	36hrbU+ga1uUIAivl02ifS+3pHngSeX4VINHvhYjes8KIQLXWey71AFp
X-Gm-Gg: AYBFou0xTm0ribhpw/u1qVnEWsb+ycDYn8QceWUcOMlUtkey1JBCm/6WXW9+D7y3V2H
	1nS0ZffXv6M2EXAP6mveUrtAh/9f5YZxxaZx0tZUoQMD8HaRgUrBoFbfaEFCMXO9uANsteNEyla
	aKGZaaOShCSUlpp9ciHOQvCGOrh9rlBvyWOvnFSttqf3aEyVNk39mSw9Z9zZSOB6Gkvluv4bF/j
	W9YWWHMkz2YPhypQhokCmnlaCpBPBuWysLOo1qZURnVhaB7RWCXae8mwdaKYiLBpTUokTvSav4Z
	rqEWB6qErTW5qekurJyA5cXTzB1wOU94famrFynpDocQo/ZoScRNOqwgpRYZMtGyna+KEOpdSQd
	LLsfiATcNJg3n7rEqd8dVJ7TitUG5Cw8eUp4V3v1VsYH0+MIz6WE4eyuKTxQwNMaxZOGJPeacRh
	ONex4yzE5aKx0oW66HA4mbNXGtuJ6YJZ34MM6OlgoamNPleN1C1cQnU4iWYOLvaWiQ44YCi2ZPH
	+9QCWPLKNxl86wPBLSlXGLrfK2IRlJB5THqyLw2iaytT9SJoMBzcSPJyx1OWbjZ86GVpBQhcJGX
	QLoq0uuHA6vmTii48kNQZ63tsIXlS+0akeLQ6KpnexwEAe+wEjN9aszeXGDRe3lUBlSn8VjNeNs
	a6w==
X-Received: by 2002:a05:6000:4804:b0:482:e451:6810 with SMTP id ffacd0b85a97d-4858703f65cmr15187645f8f.1.1788595611956;
        Sat, 05 Sep 2026 01:06:51 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm11006753f8f.36.2026.09.05.01.06.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 01:06:51 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Taichi Sugaya <sugaya.taichi@socionext.com>,
	Takao Orito <orito.takao@socionext.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] ARM: milbeaut: Drop the select of the nonexistent CONFIG_PINCTRL_MILBEAUT
Date: Sat,  5 Sep 2026 10:06:48 +0200
Message-Id: <20260905080648.34615-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_010654_075460_E7247023 
X-CRM114-Status: GOOD (  10.48  )
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

No Kconfig symbol CONFIG_PINCTRL_MILBEAUT exists, and git log -S finds
no Kconfig file that has ever defined one, so the select in
CONFIG_ARCH_MILBEAUT_M10V is silently ignored. Remove it.
CONFIG_PINCTRL itself is still selected on the line above.

Fixes: 9fb29c734f9e ("ARM: milbeaut: Add basic support for Milbeaut m10v SoC")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 arch/arm/mach-milbeaut/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-milbeaut/Kconfig b/arch/arm/mach-milbeaut/Kconfig
index 6a576fd8521e..f9d1006f9442 100644
--- a/arch/arm/mach-milbeaut/Kconfig
+++ b/arch/arm/mach-milbeaut/Kconfig
@@ -13,7 +13,6 @@ config ARCH_MILBEAUT_M10V
 	select ARM_ARCH_TIMER
 	select MILBEAUT_TIMER
 	select PINCTRL
-	select PINCTRL_MILBEAUT
 	help
 	  Support for Socionext's MILBEAUT M10V based systems
 
-- 
2.53.0


