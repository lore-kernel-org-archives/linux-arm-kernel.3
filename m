Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DF16606A328
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 12:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=No124X7U;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EQi2mDqU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=UT2bhfJPakwe9j2dLSC+DY8J4CfLe5CxwZabWLy4JS0=; b=No124X7U2NFfR/TkaksdFnKnol
	B8l5CHLLi+70jQgyv2kvANtDvTnN6xwtT+otXwpT9rJ8LO/xxdGkUl49jwCwtW31/XUzxg/6P2LvN
	1uo1PMr4ikzxHGJ9KFNqK3iR9fg5JPv5lMycgZ70Y+ouluQEAnmIbQg1C8iKC1HxxBna7MPvLyMgM
	kVyUnzHQamJpfufqS3gTZ0PrssdFizlmKR405Q42xZVaISmGlYyDdRZtAUaMQAUycIzGf0WWyXlRT
	ciTN2fX6dQjrd1DVmWBHgPABUy+H1VLFlXtIhSQRl+2SUEaFqe6A2IBXUgjo1cOpikfajcZ5vuFD7
	hjOd7H9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwIZ-00000008rCo-49KF;
	Thu, 05 Nov 2026 12:10:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOwIQ-00000008r81-3LcT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 12:10:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 32FC543214;
	Thu,  5 Nov 2026 12:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 084021F000C1;
	Thu,  5 Nov 2026 12:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793880622;
	bh=UT2bhfJPakwe9j2dLSC+DY8J4CfLe5CxwZabWLy4JS0=;
	h=From:Subject:Date:To:Cc;
	b=EQi2mDqUszZHlnoDVptK+pRNgC/HdzxBpLEqckFPfRXrryPL45UVNlnIHA6PkghVh
	 eJeXcXUTOLFn2l2F7TCkHPUINMxNSJYJmLBCdclZrOFsKWWJR4J+4r3Bpv7lkXGm34
	 4fUu63uF47PrnV4iuEqlRDPmIU+BHZ11+YgadcaC7Pel+x/YI9wLaC2+G8NMrSINCZ
	 xu7qhUoM+cd9Sy+p/hjXBWI64qW9kCW/gVaVYEoqXHGh0t/qN/W+ZZ0v74L8wXq1f8
	 qw847BFuPN31CMPhHiWBTnYmEGSYurikcoYcKs6dZ5Ey5IzZFaNWC1KoM+UWiM5RCT
	 GCBIWDaUlovBA==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v2 0/2] ARM: configs: Enable the TEO cpuidle governor in
 multi-platform defconfigs
Date: Thu, 05 Nov 2026 13:10:16 +0100
Message-Id: <20261105-multi-timers-cpufreq-cpuidle-v2-0-2df7a17f4835@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NSw6DMAwFr4K8rqsk/NSuuEfFghIHrPKrA6gV4
 u4NnKCrp3mLmQ08CZOHe7SB0MqexyGAuURQt9XQELINDEaZTGuVYL90M+PMPYnHelqc0PtYth1
 haisTqzi2t6eDoJiEHH9O/aMM3LKfR/metVUf75/iVaPCOndWJ7nKcp0WL5KBuusoDZT7vv8An
 RghUMkAAAA=
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
Changes in v2:
- Explain the TEO selection rationale in both patch changelogs.
- Link to v1: https://patch.msgid.link/20261104-multi-timers-cpufreq-cpuidle-v1-0-c7fd14706715@kernel.org

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


