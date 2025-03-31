Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07260C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Mar 2025 08:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=arHVJn2tq0pISdDGhQ9lW+/SSkCbwPoa2E5hcd62Z0M=; b=inXhV5bvyjNEJH3rjV3f5YJPSU
	T3/AVlqMMZJIUcCIthswpXS4vXwAmKiKv7YxdSszu/YaY73iQgzA7eKRSoxBH9M2euImzsYAd5680
	ElXg+NuTJWTiFDu33CSAgR3o17sH37E1yFCVS7JGXxLnLyu8yRgjvCfBv5yR4aCjoxpVlFXRdohtA
	U8PpXCoE4ibXXFCzGvZw+hJ00jfRwHJjlSlYGWdmdc2hCUFPdXRghxXpLEfbtwWcPNMxqb1bQTY1+
	HUzZ1NU6BkUWc2ET1HEW+Je34hE/0R1YRs3vtmw2uPawFyDgcyHyM3eUy35bgWqJ842wUlO9+bMnJ
	AA12E7jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzAwE-0000000HQys-2qDo;
	Mon, 31 Mar 2025 08:56:10 +0000
Received: from fanzine.igalia.com ([178.60.130.6] helo=fanzine2.igalia.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzAuV-0000000HQet-2ZVl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Mar 2025 08:54:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=arHVJn2tq0pISdDGhQ9lW+/SSkCbwPoa2E5hcd62Z0M=; b=kohPfrwPEec576hyCbBc+RdrFv
	0i6lgCR+Zao4kVxQ3twr61kw0uHdberku14BCwF6arFdfrQFl9RLyiD4tJ+PkMdHbJMEyE28moqyK
	ZoOUj1arpvCLtHdUFsz6mDmyKs94U8YZjbi0ITH0EONzXYEQJ1vGvgmvL6jufPp5BPDTRjrV2qir2
	BQigfuzYNqyxJESah/FP2Tb1xYAEdV3Gwg6qfVcckdTWIsOWHEMAKXitdUbkjoyrX4bb3UbbBtanP
	UimXLy8MCCrrGxh7A6GN1phVvaQb9gBu/khHfNQDWLZPB/BcLdsPJkNOiemnL83wucWJCgmzBI7GZ
	0fz7EXIw==;
Received: from i59f7adb6.versanet.de ([89.247.173.182] helo=localhost.localdomain)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1tzAuT-0097Ke-Ku; Mon, 31 Mar 2025 10:54:21 +0200
From: Angelos Oikonomopoulos <angelos@igalia.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	Angelos Oikonomopoulos <angelos@igalia.com>
Subject: [PATCH] arm64: Don't call NULL in do_compat_alignment_fixup
Date: Mon, 31 Mar 2025 10:54:01 +0200
Message-ID: <20250331085415.122409-1-angelos@igalia.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_015423_649220_EB186F48 
X-CRM114-Status: UNSURE (   8.90  )
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

do_alignment_t32_to_handler only fixes up alignment faults for specific
instructions; it returns NULL otherwise. When that's the case, signal to
the caller that it needs to proceed with the regular alignment fault
handling (i.e. SIGBUS).

Signed-off-by: Angelos Oikonomopoulos <angelos@igalia.com>
---
 arch/arm64/kernel/compat_alignment.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/compat_alignment.c b/arch/arm64/kernel/compat_alignment.c
index deff21bfa680..b68e1d328d4c 100644
--- a/arch/arm64/kernel/compat_alignment.c
+++ b/arch/arm64/kernel/compat_alignment.c
@@ -368,6 +368,8 @@ int do_compat_alignment_fixup(unsigned long addr, struct pt_regs *regs)
 		return 1;
 	}
 
+	if (!handler)
+		return 1;
 	type = handler(addr, instr, regs);
 
 	if (type == TYPE_ERROR || type == TYPE_FAULT)
-- 
2.49.0


