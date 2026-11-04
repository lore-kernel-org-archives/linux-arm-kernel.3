Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C35F606A330
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 12:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XnBARsuS;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G3YnGJGA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vf9Ww/+0wywlaEvzewNdTh6CXvRx2uONOk0Ka6cW+ko=; b=XnBARsuSlN72U0
	ThVpQRHTDjvyLPR5DfzYqZjkIDSm1qY38e2vN5PhFkvduVf7AbijgjODBfzDAyVJlYDZqE8hd4pzH
	Jaf2SWLgzFYZ33iNJkY5O3n+Q7+su1g3SHMGd1tD5Vn0sHjmyBGfMml92deV7RbZUuch+nIY5HOb+
	Ftg5EH9UvpHM4t/0/LiapYZDwvHeITzBaFYO0JZvMHS+UoSrGpufHtrDfWM0ed/u+oC4mAm1S90Cj
	e/A2fq/zi3hVqqw5Mrk0wri4dwY786oZF3iy/t9qkn77JGWrAy/rZlMbrqd/pQXLxg7ZIzmVoI8zy
	Y7xuSuDNrWTF+ExT/f9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZuO-00000005HEP-2zNM;
	Wed, 04 Nov 2026 12:16:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOZuN-00000005HE2-2DpC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 12:16:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3EF6B44540;
	Wed,  4 Nov 2026 12:16:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1497E1F00919;
	Wed,  4 Nov 2026 12:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793794563;
	bh=vf9Ww/+0wywlaEvzewNdTh6CXvRx2uONOk0Ka6cW+ko=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=G3YnGJGA0XR4sIMBHklqB0vq8l9UuYP4kUgHy61YAhjEc4+RAV31VCIYgYxNPRJpB
	 oh0vvLsVdbigZUzUkbQqZMSixo8QNh2EW/jMcaVmSzF6gHbhi9ylFsZ0me0sys9wG1
	 /xafNqu/db2fAigWWhL7zF8g4Ndz1FDa5C6bql8ha5ypHugF2oWWROO1hLKCbko/EW
	 UaAjNkkg0JYIc8nC/eszcHJJxN4Cxp/LrY5JfXjC9y5DAaSMUIHyVcRITfZqM0QAv5
	 HikvlIH9h6ByoeFSVKuzsZft3kRDXDzyAElLrTDLhP52r9K2lbtto+mweq9gIyWuLe
	 njEWxoU0iGeFA==
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 04 Nov 2026 13:15:54 +0100
Subject: [PATCH 1/2] ARM: configs: multi_v5: Enable the TEO cpuidle
 governor
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261104-multi-timers-cpufreq-cpuidle-v1-1-c7fd14706715@kernel.org>
References: <20261104-multi-timers-cpufreq-cpuidle-v1-0-c7fd14706715@kernel.org>
In-Reply-To: <20261104-multi-timers-cpufreq-cpuidle-v1-0-c7fd14706715@kernel.org>
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

The multi_v5 defconfig already enables cpuidle and tickless idle. Select
TEO to use it as the default cpuidle governor instead of menu.

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


