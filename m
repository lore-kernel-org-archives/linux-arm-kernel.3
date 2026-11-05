Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D434606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Pj7fxOJx;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GxX4qJGB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ta81+Z++sWj/P1y8Fz5Mk7NOm+/jZXd+XAZM1x+41E4=; b=Pj7fxOJxo4Zd9v
	0Q89cx//D+O/11/4U8NkaQrbdY4JnDuEx9t5rVdCDjjm5gbdw/YkTTAo0dq/cbleGnJuKr3WhUIUZ
	x80IyYiHDFcbah4/Id7jR8Axc8eFjaSO7SwPgqr7ve70Nwiiven+tMw88y6OJVO4x3DOz2UkkPtai
	F0CJtxaOBuYWCPYUq9kNACLYBa0zcX/Ne+XJ5x3diXs7Uqy4wliIkNlc95kL1zwFKueZomal/Phlz
	sOrZPpWuC5758g1jqV43vtQtLKAgh7qkodvJWMxmvuqY7/hJWDALHnICXMcm5M68kbkOjyosZjt9L
	bnKGwUhTRe1ERKmrtrmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwIf-00000008rG6-0cpY;
	Thu, 05 Nov 2026 12:10:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwIY-00000008rBl-1Crq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:10:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 548F16062F;
	Thu,  5 Nov 2026 12:10:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02F571F00A02;
	Thu,  5 Nov 2026 12:10:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793880629;
	bh=ta81+Z++sWj/P1y8Fz5Mk7NOm+/jZXd+XAZM1x+41E4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GxX4qJGBjlSoOGGXopFcjOH7BqAU7ALzDiRXFS7xUNLWmq8N6lVyv6LMEokhMnc8a
	 eUFqftWF895xAt9pT0Y2258+A84XCqxEQvOpTfRJ4Q2QiRU1BnAbCBCKTVW6+nC5Q6
	 k0sY7mmBc/xixrazqYrkYl5qg8Y1az7i0mIFMC9+ln9vB+MhD8P8OhBNg5b6RPMv/F
	 /M+bLBGe1C/dTFcounfg7MmRzkcHBGJTkPtNzWjHcEX+4zjnCGkCiD9njPtA5ur44G
	 VWLJM0b0XrHCp0Ny35UBI8K+CHMRA5NhQj2TITuCt1/nntfr5aemvxW6TaJp+mVYPC
	 4DNieZPTU+rIw==
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 05 Nov 2026 13:10:18 +0100
Subject: [PATCH v2 2/2] ARM: configs: multi_v7: Enable the TEO cpuidle
 governor
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261105-multi-timers-cpufreq-cpuidle-v2-2-2df7a17f4835@kernel.org>
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

multi_v7_defconfig already enables CPU_IDLE and NO_HZ_IDLE. Selecting
CPU_IDLE_GOV_TEO suppresses Kconfig's automatic menu selection, making
TEO the default governor for this tickless configuration.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/configs/multi_v7_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 069d5a49f01c..b583c5db8210 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -121,6 +121,7 @@ CONFIG_ARM_RASPBERRYPI_CPUFREQ=y
 CONFIG_ARM_SCMI_CPUFREQ=y
 CONFIG_QORIQ_CPUFREQ=y
 CONFIG_CPU_IDLE=y
+CONFIG_CPU_IDLE_GOV_TEO=y
 CONFIG_ARM_CPUIDLE=y
 CONFIG_ARM_PSCI_CPUIDLE=y
 CONFIG_ARM_ZYNQ_CPUIDLE=y

-- 
2.56.0


