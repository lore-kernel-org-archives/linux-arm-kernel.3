Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0997C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 19:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aydqIscEVKUeWIOVWUYKOFd//aT5Ovli2QGBmscbD9M=; b=HBAI3BeHg0lWQy
	Aww9S6DDFJIU9ENRyWRG16MGPImG76piBMkNH+YH9vpZDU9p2o613RC4SMs9Fqfbdxt+f8142VVyz
	DmQLKqorBUovkd/F6/9HStWfAswCrzD84NlAlPSiupd2aWATfayCj1CCvxu+xRIXxir9wV3cFpuEk
	GN55LsJosJUUr4Ha+j1OM4vRlu2RqO7FUYEZBE2WNrgFlyc6prTlB5h9oulFL8LhfHxWspCyOG/Q2
	/xe3pT+iHbvPBxrn2SBG0KISfIMCveHuhIBPFNgNVTs4syVUBsZW4gxFVxcslZCoMHD79r+kBFVtr
	xDkcuOddRWLBnfma3z/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5cY-00000006ppw-2YUU;
	Tue, 11 Mar 2025 19:50:34 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts5W9-00000006o1i-0NSA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 19:43:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 096A3A4605B;
	Tue, 11 Mar 2025 19:38:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7B5BC4CEE9;
	Tue, 11 Mar 2025 19:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741722235;
	bh=6CumdRSXH7JR76ASCBI2D6itGYdbqs/RRrbSSuL1/1E=;
	h=From:Subject:Date:To:Cc:From;
	b=dtJ8QrRGG1PP7j6FoFhKm+bfdhMkba2frzhFSbOX8g2w1NZGS2XyJa5+XaXumZZpV
	 WSmIv+iZaVNENj/I/wTv8FOFabN3LpjFE5YQ2fRXPe5cKE85G/UrNCsfZqegWy5JoF
	 uU/oXQ64QfuHAfip+wSLAC9vqcnKHbZXk5RDScrQCSZLiHNB8uCBp9JtX3jo+tTzcv
	 OV5BUYTUbFcmWQvN7xy0/DwrDBdN4NuSaCLI6XknNU3ghU1wengnkrfopfpQy8Oryp
	 aRjrgU3kH8u8bg/lHh4GToTCpv22PZI6cXgWO99FAlvw/nUwFpwgC2c3gdmreGTc/i
	 i8iH+nlNB9d+A==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/2] ARM: Fix ARM_VECTORS with
 CONFIG_LD_DEAD_CODE_DATA_ELIMINATION
Date: Tue, 11 Mar 2025 20:43:41 +0100
Message-Id: <20250311-arm-fix-vectors-with-linker-dce-v1-0-ec4c382e3bfd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG2S0GcC/x2N0QpAQBAAf0X7bOsOF/kVeXBnseFoTyj5d5fHq
 WnmgUDCFKBOHhA6OfDmI+g0ATd1fiTkPjJkKjMq1xo7WXHgG09yxyYBLz4mXNjPJNg7wiovSmO
 VrQZjIVZ2oaj/h6Z93w+tnhrGcQAAAA==
X-Change-ID: 20250311-arm-fix-vectors-with-linker-dce-83475b0b8f5b
To: Russell King <linux@armlinux.org.uk>
Cc: Christian Eggers <ceggers@arri.de>, Arnd Bergmann <arnd@arndb.de>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Yuntao Liu <liuyuntao12@huawei.com>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, stable@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1114; i=nathan@kernel.org;
 h=from:subject:message-id; bh=6CumdRSXH7JR76ASCBI2D6itGYdbqs/RRrbSSuL1/1E=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOkXJlUyCyWuT3ta8MFbRfqN5bXL3AG9EpufZe80mL/p8
 ZprUknGHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAiTpGMDKfPHKsTUHnVV2C7
 5Hh1HPvUkpl/TOcu51l69v5t5srZP2IZ/meu10lad/WXl9Tc4J81TXMffVBfqBG+L+b7pf51Llv
 dalkA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_124357_221979_7AC41BF4 
X-CRM114-Status: UNSURE (   9.31  )
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

Hi all,

Christian sent a fix [1] for ARM_VECTORS with
CONFIG_LD_DEAD_CODE_DATA_ELIMINATION that exposed a deficiency in ld.lld
with regards to KEEP() within an OVERLAY description. I have fixed that
in ld.lld [2] and added a patch before Christian's to disallow
CONFIG_LD_DEAD_CODE_DATA_ELIMINATION when KEEP() cannot be used within
OVERLAY to keep everything working for all linkers.

[1]: https://lore.kernel.org/20250221125520.14035-1-ceggers@arri.de/
[2]: https://github.com/llvm/llvm-project/commit/381599f1fe973afad3094e55ec99b1620dba7d8c

---
Christian Eggers (1):
      ARM: add KEEP() keyword to ARM_VECTORS

Nathan Chancellor (1):
      ARM: Require linker to support KEEP within OVERLAY for DCE

 arch/arm/Kconfig                   |  2 +-
 arch/arm/include/asm/vmlinux.lds.h | 12 +++++++++---
 init/Kconfig                       |  5 +++++
 3 files changed, 15 insertions(+), 4 deletions(-)
---
base-commit: 80e54e84911a923c40d7bee33a34c1b4be148d7a
change-id: 20250311-arm-fix-vectors-with-linker-dce-83475b0b8f5b

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


