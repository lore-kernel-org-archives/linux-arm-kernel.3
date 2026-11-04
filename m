Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 434E1606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TBVo8pZk;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EUEur2Jp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=KbmkajyfFV3udbEtJGrmA3+mmB8dwA1xxk3Neh9mt9o=; b=TBVo8pZkcE8tzmyv83SOg7U7XN
	dKvmjxIPLXO03QNNqArY6U//tZECzwApgWOdBxA1DctxkMnobK6LJJOHTmRT3J/7qmTFwj5bpL5aQ
	wBwYVuPMnrw4pLmO/vzImYFS9KXZ3qKSILHFHw42ZHqTf/FYcDF8BQmqezSG4zg4Zze0MRH0uxwdX
	LLZfWL9xQaORnOYiz96e6VkdaBEOWTKAIDkCIQ0sWWkc0UNZaMmxWDfuXzq1RAgJHo8XPPRj+sbV8
	EAqtSFFt32nG5liLynXY5dXrO8j6+fWNBsVzEjI+M19ORYcSJjUlVUaDVsBV7Yb3TpJN0eIbKhboi
	oW0qWK3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZuL-00000005HDe-2f4z;
	Wed, 04 Nov 2026 12:16:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZuK-00000005HDW-2a40
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 12:16:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BBB7440657;
	Wed,  4 Nov 2026 12:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C31A21F000C1;
	Wed,  4 Nov 2026 12:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793794559;
	bh=KbmkajyfFV3udbEtJGrmA3+mmB8dwA1xxk3Neh9mt9o=;
	h=From:Subject:Date:To:Cc;
	b=EUEur2JphXwpoZ4tHxAj2WhlM0C5UdBaVipHPNJ080rKeMF2BCPCCK8bv4Uody99k
	 nkuTsM1stI7355+eJsS/UTQyky4ILP8cyOjCi9VheSX4Hyt+AU0nTo5SQQZo7X1+cB
	 1qbJZrukyHPwuOl9BTJ4ex0RNvIplJCFIKdnjQiqN6soqpaKhJdDWoabANpZOSTUz9
	 +FtH4IFYzZ92nmIvdK1K2aeWWntHQqBuQrN4nrK0WbctOMFKnRD9pX14Dkxppz2AL4
	 EwAuZrV3wXPqM/CVVfig81ZXBYCQLIiJ2m19oyyDG7Ds1Kg/AZCElCU7FYrvXLJp+5
	 Cy/eGuRmQfusg==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH 0/2] ARM: configs: Enable the TEO cpuidle governor in
 multi-platform defconfigs
Date: Wed, 04 Nov 2026 13:15:53 +0100
Message-Id: <20261104-multi-timers-cpufreq-cpuidle-v1-0-c7fd14706715@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MTQrCMBBA4auEWTuQnyroVcRFTSY60NY6SaQQc
 vemrh7f5lVIJEwJbqqC0I8Tf5YOc1Lg3+PyIuTQDVbbizF6wLlMmTHzTJLQryUKfY9ymAjPYbR
 OOxeuzwh9sQpF3v77+6O1HW0esF9uAAAA
X-Change-ID: 20261104-multi-timers-cpufreq-cpuidle-5da23033d9bf
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

Enable the Timer Events Oriented (TEO) cpuidle governor in the ARM
multi_v5 and multi_v7 defconfigs.

The upsides of the TEO governor are described in
commit b26bf6ab716f27955e2a503ffca1691582127cbb
"cpuidle: New timer events oriented governor for tickless systems"
by Rafael.

We need to gain some traction for this governor.

Both defconfigs already enable CPU_IDLE and NO_HZ_IDLE. Selecting
CPU_IDLE_GOV_TEO suppresses Kconfig's automatic menu selection, so TEO
becomes the default governor on these tickless configurations.

Leave multi_v4t_defconfig unchanged. It uses periodic ticks, which
select the ladder governor and give it a higher runtime rating than
TEO. Enabling TEO alone would not make it the default.

Configuration generation was checked for both patches. No hardware
runtime testing was performed.

Prepared with OpenAI Codex assistance.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Linus Walleij (2):
      ARM: configs: multi_v5: Enable the TEO cpuidle governor
      ARM: configs: multi_v7: Enable the TEO cpuidle governor

 arch/arm/configs/multi_v5_defconfig | 1 +
 arch/arm/configs/multi_v7_defconfig | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261104-multi-timers-cpufreq-cpuidle-5da23033d9bf

Best regards,
--  
Linus Walleij <linusw@kernel.org>


