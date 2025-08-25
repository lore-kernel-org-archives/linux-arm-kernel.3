Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D5FCA0FE7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Aug 2025 15:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=edGgk1ZJy7vwuvKDN+ezwtiAic05wCW0HPQEitwhEgA=; b=JWEbtm36+lAr9XeDdiGvFGf/4A
	IWArUSUycUdXOyjBXpRYwO7yj3n0F/rkeDnOcBWrHvYC6v2KA5yXBpSzwm2AKDobnOfu0QL9rZjP2
	aOAYP0JxeZM9g17encr878FpxN8zBqVOQ/bhimDadGre99G5OpI7iZMYkc+6c0Y/D7ZGGXPQXkLXP
	jXRZclG7ghZNJtIT2pSH9Q1GqcdGArHtZAYMF1MsQhTwsn0Dd2w4HtVhcGx9npESWvdWW8QcKkii1
	WZMT9duvooKh+J+Zu/0xZDg2dRrVQ1y5p+8/hdN8Qn2k1MF1AWFPSt7vI9XvxJJrdMiBpxVvjhdpJ
	nHgcEkRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZ6e-00000008VZ1-3IdZ;
	Mon, 25 Aug 2025 15:27:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqY96-00000008FOX-1eYi;
	Mon, 25 Aug 2025 14:26:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B9C2244B14;
	Mon, 25 Aug 2025 14:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81222C116C6;
	Mon, 25 Aug 2025 14:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756131963;
	bh=qKnJwvVOQdbIM7AwmZDu1aieujqnr4MVL8xJV+3xcWU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bPWPBLMJbqPu4Ihz/jn1p85BL57qjQm0GeXE5FNWeLlN++/7RKlMCJ8dHmh3NN98j
	 a2MJOEJMImQWuqo4ojpxl7wQxUW+kMSttdKngdXjPS2kCUyc+BZ+1e8oOgQ0Ti2/6m
	 reEgKi6EjffV33DLzQyIgr8V9g2nlmSVYUG7EaM/MyY7M2lKY2Zv/dN2S7hOdASMCl
	 /HccRg3BXD9cdYB8R3XGPA4vYe8uLuojG1CaSJ1AIvlscFmLwGNseHrwr/ONQGONLO
	 cnGyoQE6fc06n1ued9gtzzjBPgY/6MjOfjPP43UQ+V4sPfnprtr50fs3xdqa5Qy6Yd
	 aMsiVDBIbNsJA==
From: Kees Cook <kees@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Puranjay Mohan <puranjay@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Nathan Chancellor <nathan@kernel.org>,
	x86@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 2/5] x86/traps: Clarify KCFI instruction layout
Date: Mon, 25 Aug 2025 07:25:49 -0700
Message-Id: <20250825142603.1907143-2-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250825141316.work.967-kees@kernel.org>
References: <20250825141316.work.967-kees@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_072604_452551_FFB8D0F1 
X-CRM114-Status: GOOD (  11.42  )
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

Just a nit-picky change to the KCFI indirect call check instruction
documentation. The addl offset isn't always -4 (it depends on patchable
function entry configuration).

Signed-off-by: Kees Cook <kees@kernel.org>
---
 arch/x86/kernel/cfi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/kernel/cfi.c b/arch/x86/kernel/cfi.c
index 77086cf565ec..638eb5c933e0 100644
--- a/arch/x86/kernel/cfi.c
+++ b/arch/x86/kernel/cfi.c
@@ -27,7 +27,7 @@ static bool decode_cfi_insn(struct pt_regs *regs, unsigned long *target,
 	 * for indirect call checks:
 	 *
 	 *   movl    -<id>, %r10d       ; 6 bytes
-	 *   addl    -4(%reg), %r10d    ; 4 bytes
+	 *   addl    -<pos>(%reg), %r10d; 4 bytes
 	 *   je      .Ltmp1             ; 2 bytes
 	 *   ud2                        ; <- regs->ip
 	 *   .Ltmp1:
-- 
2.34.1


