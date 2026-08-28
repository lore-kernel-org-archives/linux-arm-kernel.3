Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC75BC61DCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Aug 2026 20:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m8ZwWJclDPSOBvdgEydgxUAmIzPLtZQQkdqYB7g8o8E=; b=XOQer1fUcS46sf
	DOnw1zxTAaOhd+qoOyqOntQYMQ2X7zgzfVumYN/EZpFq7VjbyUXfkmlQngu4NdeGU/uc0UtqWRKOZ
	bSR8E/UnZA+COM5fg+WoAqUXKBFhIt6a3S8rj9fdvIPwgJTWIOemrOJMEgSrTHlY8ra01Bt64IBqw
	LD0le75jW+aEx5zRiPNbE1HEEcOAk08ftvW+4SbeFVwwAdVfiaX43Z4XANIayHoybL3GC97XN3dzI
	1T++XpEdSnC3yx9aefRJq/BVZbHSTawP0k0k95ThTtBYw1W5jls1BkW7WcMiTLP/gmStQGUASxqWw
	jiRnA+bjA/t6XmDMTIEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x03Fv-00000006OwV-2P7e;
	Fri, 28 Aug 2026 20:32:55 +0000
Received: from mail.andi.de1.cc ([2a02:c205:3004:2154::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x03Fs-00000006Ov5-1twF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Aug 2026 20:32:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=Cc:To:Subject:From:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=m8ZwWJclDPSOBvdgEydgxUAmIzPLtZQQkdqYB7g8o8E=; t=1787949172; x=1789158772; 
	b=9Wx/hE1U6AccCqaAUudY3/oB/WlwkPdcM09XmALuYcghbqFTfs16wlYnqkEaqtSfApB8EKrRVzW
	7boOUViFvGqAM37K5/OX3/HW0ZepYVI8ntJK9egl8ZBIunl9xLW74Hzv8cTd/s3Ceyf9Svd8pKPht
	2PWbNfjmZ3/LrqLUQOMvoJpklJ5ZyuihWzUsYDcJchWBlyrDJIan4v8eM//NS47Eg2AVRHRnEb2pJ
	JxmMSdTbeethlUur71ujKYo1PZNKYG/7FzUjnQpNfF7F9Aw6DHTABckiBEnAWqltzgXJ1F5O07BcT
	mTwy4kXL/PEr/UTu0BrDDF6FtDUtQCd76pPw==;
From: Andreas Kemnade <andreas@kemnade.info>
Subject: [PATCH v2 0/3] ARM ZSTD boot compression
Date: Fri, 28 Aug 2026 22:32:18 +0200
Message-Id: <20260828-zstd2-v2-0-4d9ce7150877@kemnade.info>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFLwkWoC/yXMQQ5AMBCF4avIrDVpJiXlKmJBDcYC6SCicXfF8
 kv+9wIIeSaBMgng6WDhZY7ANAE3NvNAirtoQI25tmjVJVuHSpvMUYGmz9FAbFdPPZ/fT1X/lr2
 dyG3vGO77AYv5Ha1pAAAA
X-Change-ID: 20260828-zstd2-045ce924f624
To: Russell King <linux@armlinux.org.uk>, Nick Terrell <terrelln@fb.com>, 
 David Sterba <dsterba@suse.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Andreas Kemnade <andreas@kemnade.info>, j.neuschaefer@gmx.net, 
 f.fainelli@gmail.com, Tony Lindgren <tony@atomide.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1615; i=andreas@kemnade.info;
 h=from:subject:message-id; bh=iKVsyQV7tKPfaDuQ+PL5CFcPAPfielgcRiVqwmMClxg=;
 b=owGbwMvMwCUm/rzkS6lq2x3G02pJDFkTP6Q2PemRDZJJeGN1y0GKqep8+iG+j1cPbd3/noGtc
 VqihXxARykLgxgXg6yYIssvawW3TyrPcoOnRtjDzGFlAhnCwMUpABP58ZqR4XtCj7kak8w5f94b
 PR8zV2X+lxO8MX29zaeLsU90N/Wb5TP8TzEv/vvmSOMZ0V0c4jYXLstcCJ31iyV0+k5ZZ4dSQ7V
 6VgA=
X-Developer-Key: i=andreas@kemnade.info; a=openpgp;
 fpr=EEC0DB858E66C0DA70620AC07DBD6AC74DE29324
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260828_133252_528626_BD202691 
X-CRM114-Status: UNSURE (   9.82  )
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

Add ZSTD compression to still have a quite high compression but with
not too much boot delay penality. 

Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
---
Changes in v2:
- rebased
- practically rewritten 3/3 (and therefore changed author)
- added more measurements
- Link to v1: https://lore.kernel.org/lkml/ZDoDYh01GYjdwp63@probook/

To: Russell King <linux@armlinux.org.uk>
To: Nick Terrell <terrelln@fb.com>
To: David Sterba <dsterba@suse.com>
To: Nathan Chancellor <nathan@kernel.org>
To: Nick Desaulniers <ndesaulniers@google.com>
To: Bill Wendling <morbo@google.com>
To: Justin Stitt <justinstitt@google.com>
Cc: j.neuschaefer@gmx.net
Cc: f.fainelli@gmail.com
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Tony Lindgren <tony@atomide.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org

---
Andreas Kemnade (1):
      ARM: compressed: Enable ZSTD compression

Jonathan Neuschäfer (2):
      ARM: compressed: Pass the actual output length to the decompressor
      ARM: compressed: Bump MALLOC_SIZE to 128 KiB

 arch/arm/Kconfig                      |  1 +
 arch/arm/boot/compressed/Makefile     |  3 ++-
 arch/arm/boot/compressed/decompress.c | 15 ++++++++++++---
 arch/arm/boot/compressed/head.S       |  4 ++--
 arch/arm/boot/compressed/misc.c       | 10 +++++++++-
 arch/arm/boot/compressed/misc.h       |  3 ++-
 6 files changed, 28 insertions(+), 8 deletions(-)
---
base-commit: 8d3ae59288f1e7d58d76558a6ee96d533bc5019f
change-id: 20260828-zstd2-045ce924f624

Best regards,
--  
Andreas Kemnade <andreas@kemnade.info>


