Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE0D8E94116
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Dec 2025 07:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sa39lfrywozshHjUOd0QqKWLPIfeYAU14+UfJcFQKAw=; b=lsGvjRD6DCmYRe
	ENLr1arr8ngG5cpjCGq1csweDJaJhFqOwu1t+YGc+JVulQAKJqTtYzusZUq61Vsf5HGYVjTKLDpRU
	U1WSCDIBEHr/7ZyxKoi5Pfhj0fJ7RNam2ekiwd8ukbkyKdU4JTgeO0KuvmZCNpDHCLZe113siaqrX
	HH1PVxh/USeoG9WmPNcEe0E8eJwPHAewH5+Dx4gPaEYHN8dqRir58wHwevLnZleJsw0quzpup2v1D
	RrZzhzyODcf0oamEWgMtvhkCm4bPiq7WUsGroUlsKBXidhQjuQLI671K34wfCSAqBlDtWRkESYxCQ
	bVUXE8X+VV4ImxAPuLnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaTso-00000004Ulk-2Z3b;
	Tue, 30 Dec 2025 07:11:06 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaTsj-00000004Ujo-3Fo8;
	Tue, 30 Dec 2025 07:11:04 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1767078657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sa39lfrywozshHjUOd0QqKWLPIfeYAU14+UfJcFQKAw=;
	b=SasWZcLIxY1ZqsQFgmJqfPq18eV8KYliz7FxkDmpXmRXilxx2h6pDPc84OwKLSMSUx7Bj8
	sz3svT2F4w/KZAHDK+Zs4ADRpzgJ4jW6KFrBR4yz9G9962/p4C8MG+sTu52Qfk/aAQpngJ
	0euGrTcIuE+PUL2WbhEbWBRbNw8hTHw3muBBFrmcpQeuErxPDPNxRS0FC+AxAt+7TGTxS4
	ppua8FUjg0k47wbhjFyO/MIUMUrz//lvFPUhkSRX8d9AukOvLeRAS6/8BQt0gKa24AAe7S
	FPELjrsyO5qw7WnNcT42ICEwOt5glmMLCAlEK02nxsS2Q8f6Udten12heiPEhg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1767078657;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=sa39lfrywozshHjUOd0QqKWLPIfeYAU14+UfJcFQKAw=;
	b=USB0X405bczNGlaE1WzQDIIdqzYD+2mpODVHwjTpJ/pQNwUG3pXZ9BavujUpWH2nBacELY
	kVLcoUPsDC69QFBA==
Subject: [PATCH 0/5] uapi: fix remaining kconfig leaks in UAPI headers
Date: Tue, 30 Dec 2025 08:10:55 +0100
Message-Id: <20251230-headers_install-config-leak-v1-0-efba5c58073d@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAP96U2kC/x3MUQqDMAwA0KtIvg2skYHdVYZIbKOGlSqNjIF4d
 8s+3887waSoGLyaE4p81XTLFa5tIKycF0GN1UAPejoij6twlGKjZjs4JQxbnnXBJPzBqWdPzsd
 +6gLUYS8y6++/v4frugF8C0TtbQAAAA==
X-Change-ID: 20251229-headers_install-config-leak-b8a9219d8b3c
To: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Dinh Nguyen <dinguyen@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767078657; l=1197;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=ROM+0B5pgXepje/uif9VYbF7UjhihvMVKWe93PkPMFU=;
 b=btRZRWxwkyz+l3mSxrXtg+4ibvHwOXultE53vihV/3iNWtus0ZPxUB3Q0EF66yyP89dOKZ0WA
 KapArctkpS6CmWwQgfJKIYi54oqSNxnIgJxRzlE1shXgql5UhBsEZUc
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_231102_122351_5B35D255 
X-CRM114-Status: UNSURE (   5.65  )
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

A few UAPI headers still contained references to kconfig symbols.
Clean them all up and afterwards remove the now useless exception
machinery in headers_install.sh.

Intended to be routed through the kbuild tree.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Thomas Weißschuh (5):
      ARC: uapi: Stop leaking CONFIG_ARC_HAS_SWAPE reference to userspace
      ARM: uapi: Stop leaking CONFIG_CPU_ENDIAN_BE8 reference to userspace
      nios2: uapi: Stop leaking CONFIG_NIOS2_CI_SWAB_{NO,SUPPORT} references to userspace
      x86/uapi: Stop leaking kconfig references to userspace
      scripts: headers_install.sh: Remove config leak ignore machinery

 arch/arc/include/uapi/asm/swab.h   |  2 +-
 arch/arm/include/uapi/asm/ptrace.h |  2 +-
 arch/nios2/include/uapi/asm/swab.h |  2 ++
 arch/x86/include/uapi/asm/auxvec.h |  2 +-
 scripts/headers_install.sh         | 30 ++----------------------------
 5 files changed, 7 insertions(+), 31 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251229-headers_install-config-leak-b8a9219d8b3c

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


