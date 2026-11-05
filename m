Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5FE606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=lQyrvz9Z;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=M3Y1LsuJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=x7AQe7KFeXSU6fqII5BxEjVO6D8yW5Usa+EB19K5zIo=; b=lQyrvz9ZJaqUMU
	XKouOyl7z/Ay/hoowEycdnAS3maNt9gYnUXKMJL1r9rP2HhPYF5PMQqku5mVVhwaN6h0i6irFhjg7
	8eAuG97AXWyDxsSVtnpP727073ZmT4svQB/6WiJUmgNKKe3JOC6YR8hSQ957xegmXJO9N46GToZc5
	JqrFcJFLCrUGIw5hMN8Tz/Jb20EHiupyIgvc1w3ogkW4YPVHA4cwCTiTQDwM+rkSA/fUsMzQ0MzRV
	DGW1Jt9jL6O8PAjjm6zdsXyzKy6UakcNhEaL32k/82lbNcoxK5dtokrzgRuqEDlvtXriQkzLsoZN7
	9I1L/vtYkhoQ/nCj3qIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwIX-00000008rBm-302U;
	Thu, 05 Nov 2026 12:10:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwIT-00000008r96-43XQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:10:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A9223433B3;
	Thu,  5 Nov 2026 12:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 813641F0093A;
	Thu,  5 Nov 2026 12:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793880625;
	bh=x7AQe7KFeXSU6fqII5BxEjVO6D8yW5Usa+EB19K5zIo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=M3Y1LsuJGddxQx6RpgYOmHLg3jdZxzHoVcNi3cJBuZHJS/OTjb68gQbASBxc/4Fg3
	 iaf5IvtiqxOrTQExd+EbBE3pJaugt8pRrzQYlYeMTPqpRckuWzxL8It8F5denkQpxk
	 1S/gBZ5MpOTjIPtZt4STkTVfERFhvPTfBkWCX5IwWkA+grJFjrL2TA3pV7JAUvyali
	 3iVfzKOWNKsYAFmB624rxO9ambgUDUWBTbzePHuT2T4RWYxT9pf76YBdA//zDW5gwa
	 UiOr3pNOD0Y0GcY52QZb77qzKBa4UyBJP/+oNQQkiV8Sez6CrIvdotjqtcinsM9uu5
	 mBfEgvxin0nDg==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 05 Nov 2026 13:10:17 +0100
Subject: [PATCH v2 1/2] ARM: configs: multi_v5: Enable the TEO cpuidle
 governor
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-multi-timers-cpufreq-cpuidle-v2-1-2df7a17f4835@kernel.org>
References: <20261105-multi-timers-cpufreq-cpuidle-v2-0-2df7a17f4835@kernel.org>
In-Reply-To: <20261105-multi-timers-cpufreq-cpuidle-v2-0-2df7a17f4835@kernel.org>
To: Russell King <linux@armlinux.org.uk>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linusw@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The TEO governor introduced in commit b26bf6ab716f ("cpuidle: New
timer events oriented governor for tickless systems") takes a different
approach to idle-state prediction from menu. The governor gives a
better behaviour than the current default for tickless idle systems,
and for the multi-platform configs that enable tickless idle, this
should be the default governor.

multi_v5_defconfig already enables CPU_IDLE and NO_HZ_IDLE. Selecting
CPU_IDLE_GOV_TEO suppresses Kconfig's automatic menu selection, making
TEO the default governor for this tickless configuration.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/configs/multi_v5_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v5_defconfig b/arch/arm/configs/multi_v5_defconfig
index a0d2fb2fcf9a..5e5c3dba1d72 100644
--- a/arch/arm/configs/multi_v5_defconfig
+++ b/arch/arm/configs/multi_v5_defconfig
@@ -34,6 +34,7 @@ CONFIG_CPU_FREQ=y
 CONFIG_CPU_FREQ_STAT=y
 CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
 CONFIG_CPU_IDLE=y
+CONFIG_CPU_IDLE_GOV_TEO=y
 CONFIG_ARM_KIRKWOOD_CPUIDLE=y
 CONFIG_KPROBES=y
 CONFIG_MODULES=y

-- 
2.56.0


