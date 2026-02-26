Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82FE4FC592F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 11:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LEGKQUY3P/ldkHZI7vdWyqz71XJp0++m8PAVddsvFcM=; b=OowIwVJf+BWb0a7LmaT9xPkbJg
	t9omPVEa4Y6C7m7h66bUhwz/j5lUE9jOFvej8T9h27MnvehfuoJt7nUU+K69UZ97FSAfATNzlEoiA
	T1WIM78UyPqrPbWtNtMMdhIPUFwzRJgG5XWKRnx1BCoPrAhVuCde6aIbLyTA7uJmTbzaWFkdKEdTl
	dirw33HRgQgUD2yHIGSY/suLlHe0jOpCf7m4sLa+HoXF6KkeZKJBU0WvI5718JNXs8SdmF/+Uo/Ze
	t45Cnx6K2rv6XW4ytxlDMnWayBpnPPC1copsacZ3TQ8F6hoLMuXcqkE3qW8N5e+M2cAP7YqMqoh07
	rEFv1XIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZNX-000000061ML-2Ved;
	Thu, 26 Feb 2026 11:17:59 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvZNU-000000061Jm-2bOT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 11:17:57 +0000
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772104672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LEGKQUY3P/ldkHZI7vdWyqz71XJp0++m8PAVddsvFcM=;
	b=NH8KbA/vpUBsiB7XbEhJehmDnS4Pef6bahDF+mgIbeH0Qkm1dFuK69BPMz9BfiYFrKVSfL
	gbsI0zLOsnASijXSM8eW4mqQxH+bLuOlBa0BBxfFMG04UbrbtgiyS+9LC5cxAlyRm7pjGi
	TzJtRRpf1QiTeCj6sE8a6bqnH+q1iylWVJUzPoQI4sCDUrHxaYlr5p/uE4RSeUNXzHbcNh
	dxHTRnt5JymGmzJc03TS39rpB9rUVNZfvj845SabEovxs+q6+SuZBYDhpCKO4yX0nxBBnL
	JZr0ilZqv/RngoU/q16ClfKRWCVSRycQztyyRL9c7ItUw5mFb9oajJjQKQxBTA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772104672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LEGKQUY3P/ldkHZI7vdWyqz71XJp0++m8PAVddsvFcM=;
	b=SMKMJR9RYhrFqHjNliI9wvA0kMYVeyaPgOai9PUF13+UwjI1Kkjo3xQUpnvLM/n+Zt1kYo
	Xht0SBxgdJeD7RBg==
To: linux-arm-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Cc: Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: [PATCH v5 2/2] ARM: Allow to enable RT
Date: Thu, 26 Feb 2026 12:17:42 +0100
Message-ID: <20260226111742.3598421-3-bigeasy@linutronix.de>
In-Reply-To: <20260226111742.3598421-1-bigeasy@linutronix.de>
References: <20260226111742.3598421-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_031756_833771_40B335DF 
X-CRM114-Status: UNSURE (   7.86  )
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
index ec33376f8e2ba..71fc5dd4123f3 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -42,6 +42,7 @@ config ARM
 	select ARCH_SUPPORTS_CFI
 	select ARCH_SUPPORTS_HUGETLBFS if ARM_LPAE
 	select ARCH_SUPPORTS_PER_VMA_LOCK
+	select ARCH_SUPPORTS_RT
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select ARCH_USE_MEMTEST
--=20
2.51.0


