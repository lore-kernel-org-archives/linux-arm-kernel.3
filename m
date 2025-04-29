Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5D28C3ABAB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 15:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Fj7yCWcGZQiD0Ep5PKSnDUN4f4uh1dr4fMtp7fqSvPc=; b=1NGP05NtpXV2pd
	l/iyYfqH/udJIzLToKG+AxMp0zi8I9/gzq3mUsqZ+wlc+PESzfs75biRkGx/JI3MM89FBnrrLXxAT
	Xo/aaTuqNFNWrxYPKE3syvacCZCfwm5RDc4E7TTnzihzHZwzxspecKTmteRVB3TzN2wqr54SwHMS7
	hU9/q68UBOsBvQslXuG0bvNyaGl0QRm27uCdlKWG20uuM16ENPHATwiJG8jieb1Js5SV84JJrPI5e
	irD6VH8NE+ZvCvyLrhz52GBSQy8cKGTUMbY20PygH4u0Ei/03f1tKsJMpZCHTODJ3rEXSrit9h5/Y
	jl03jsM69ph221HHkb5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9mgw-0000000A4sj-0LEO;
	Tue, 29 Apr 2025 15:16:14 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9kVM-00000009hPz-2NKc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 12:56:09 +0000
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745931365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Fj7yCWcGZQiD0Ep5PKSnDUN4f4uh1dr4fMtp7fqSvPc=;
	b=HzUh/C13+77GwXny9TqEo0iTIKybWr3W933yiu7g0B4mCzqAJIuyEIxtvkPy44+VhHI0Xf
	F/vLnoGOtbmDs7b9VKqpB89/PFZjaQGJ4CaaswUuos+R7s9OS3rx4Tfh2NLqhzwMC2tLaR
	CkwsMysjEHCsPiE2DPQL15aNuBdETyF+ycfH7s1ekloZMfI4DFwruDg2TW+sVu6cfOrzPc
	x2n2oovwmMDdOhXbkWOudSGVQ4umb3nWO4vtIEeVkrUY0YFF0yTG2uTrZehiJh0poh/H1z
	JimdL8uJe6x22NloIbNt1FdiLXeayNDplh/evXJeOV1RN3eT6zC4Pmqo3NiaVA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745931365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Fj7yCWcGZQiD0Ep5PKSnDUN4f4uh1dr4fMtp7fqSvPc=;
	b=xVp6GDZpQUELM7yLjLGY3YMF9QVLXybnhWGoEKcTIV1WBdnYTpHci8B+52Z0mutL4FuZ4X
	D4VSGzZfzcrZJSAA==
Subject: [PATCH 0/2] vdso: Work around and reject absolute relocations
Date: Tue, 29 Apr 2025 14:55:35 +0200
Message-Id: <20250429-vdso-absolute-reloc-v1-0-987a0afd10b5@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEfMEGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyML3bKU4nzdxKTi/JzSklTdotSc/GTdRCMjMyNL42RDczNDJaDOgqL
 UtMwKsKnRsbW1ADtzfKhlAAAA
X-Change-ID: 20250428-vdso-absolute-reloc-a226293c1761
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Nam Cao <namcao@linutronix.de>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Jan Stancek <jstancek@redhat.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745931364; l=701;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=6bf90b6PKN1yy2IB4q4zQXvYLjO8EsLV4LaVCDD5H2c=;
 b=2BaLI788qKSQNwcRUt1VMFS0fOMU7pPi8jwA3BpsT6XkRK2kVcvuPS7TX9v9E35zc96MLg59W
 kQ0Xa6Mp6UbDOecUQomGGb4cTOO5ucX0t1kCmrgm0EA+twcb0Ao61nb
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_055608_750216_268197B7 
X-CRM114-Status: UNSURE (   4.69  )
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

GCC on arm64 would incorrectly emit absolute relocations in vDSO code.
Work around those and break the build if new ones appear.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Thomas Weißschuh (2):
      arm64: vdso: Work around invalid absolute relocations from GCC
      vdso: Reject absolute relocations during build

 arch/arm64/include/asm/vdso/gettimeofday.h | 13 +++++++++++++
 lib/vdso/Makefile.include                  |  5 +++++
 2 files changed, 18 insertions(+)
---
base-commit: b4432656b36e5cc1d50a1f2dc15357543add530e
change-id: 20250428-vdso-absolute-reloc-a226293c1761

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


