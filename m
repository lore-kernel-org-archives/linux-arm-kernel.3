Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECF0CD13D2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 14:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5PJymOvZBuj9Xya76U38SF3/ORWqJCuOIk9n/b6JWvU=; b=rgOv7Fj+y189W2OphwNvFzNkV8
	rgNZyqUwjupuwls3YKWDzLYQDwAjTyNM3qdwhPiZbijnwS2NvRjZaT7btThgOnoA2IJoLB+xmebqg
	iO3Jfr2z2PliJO8+LLKbvl2AxIhaWEqE6BLxX5nwCwyf4STA2+fUam/PWCUvTduMtceaIf/JJYF2h
	evq1rn0TJLBQICN/1RXZERFGpsn7YUKFvjkRpcVKD5YKR6sJJCPuLPsk0Bz6gMlqXPRz+rsC32yqH
	vQJqqgMvLh+6MaeGLkbASI45qr6c3OqrYwRviqIxRAdXvYQxboAsw5+n/+jCTc84xBhEtKUc05rNx
	dPfU9Qcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITJp-00000005dNu-1haL;
	Mon, 10 Nov 2025 14:56:33 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITJj-00000005dLS-31eI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 14:56:28 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1762786581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5PJymOvZBuj9Xya76U38SF3/ORWqJCuOIk9n/b6JWvU=;
	b=1tVwv80QQi6EuIjS6GrOFcp0ICq5yEvoHW5iS/HGmdgHUIBBXTKyw+k71dxHbyFpvjBsnQ
	j6iMNgmS5vaVgLO5CScppZMNU3Wm9sOO6BJriOZAowGOS3niPHfwoEC+SrOEUo1RY8R+Wj
	aaX33Bn/vobuXq9PVIctKKUwyUuYQ9MAhqSY5MD/jAON8ZZPIK+cjaDeSBBzik3DOj4zk+
	Z2dcwWhoFBoFKnww8U5gVqtzFshuwlr0/iUJ7+VsVud+/heAGP11VlUvfRORa+yHaNbLMB
	iIOJncgs/Ru+RtNzIS26PwAyMwGzmJpipiTHJjkdM9dWrTMPAVz/bPH1tJr3hg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1762786581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5PJymOvZBuj9Xya76U38SF3/ORWqJCuOIk9n/b6JWvU=;
	b=5WVnCrtprX20wbzTV+Dl6NI9gtHrTqP3EKMfMjLVOt9e6OMuVQha0kHlVY2b4Xh4mpryQ+
	T/Q/KpTPn1nV1fBA==
To: linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Cc: Russell King <linux@armlinux.org.uk>,
	Xie Yuanbin <xieyuanbin1@huawei.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v3 5/5] ARM: Allow to enable RT
Date: Mon, 10 Nov 2025 15:55:55 +0100
Message-ID: <20251110145555.2555055-6-bigeasy@linutronix.de>
In-Reply-To: <20251110145555.2555055-1-bigeasy@linutronix.de>
References: <20251110145555.2555055-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_065627_909188_6B6D5653 
X-CRM114-Status: UNSURE (   8.01  )
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

All known issues have been adressed.
Allow to select RT.

Acked-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 822d378f81ec8..b32f85f14c28a 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -41,6 +41,7 @@ config ARM
 	select ARCH_SUPPORTS_CFI
 	select ARCH_SUPPORTS_HUGETLBFS if ARM_LPAE
 	select ARCH_SUPPORTS_PER_VMA_LOCK
+	select ARCH_SUPPORTS_RT
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select ARCH_USE_MEMTEST
--=20
2.51.0


