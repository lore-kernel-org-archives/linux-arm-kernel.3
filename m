Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A540FC55177
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 16:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IPrlliaNT6d54S3Oz/pAE+1e1wLs+2Mvnn7Uhn7fUaM=; b=wsDs/hs6Kgxo+Wfd548G2JbuBq
	iEO+byMRk9LDxKA6J6LzPNbPhjA5zGN10TGuju0mQ8uLwiZkZqkv9PzjknoDzCMJGo04QimiN4Zah
	n79Z2dfcwDOYJpMGd8GlrTBK1jtdaupSWmQobJoyUazbmCdrb7IIO/DACuLj3lkuKG0WGOJI3Ghes
	Sv1AarZFW0bKuhAV2s3vq/yJ/M+xYKymTHJ78ZLAr5kNi/+nykwUEyRIk5SopCMsQkeELMiIg71sl
	iAqbkTJ+Mcl2RYnoYnZpBkFDYk89B5RMKyliexaUNITiDU8AZu0SIRHnJdhOzmJOD9UEn6WZRrYWK
	YZphL4FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqZRa-0000000Fqqm-37fR;
	Sun, 02 Aug 2026 16:53:46 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqZRY-0000000FqmT-0foA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 16:53:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D1FD044FFF;
	Sun,  2 Aug 2026 16:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3B461F01559;
	Sun,  2 Aug 2026 16:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785689623;
	bh=IPrlliaNT6d54S3Oz/pAE+1e1wLs+2Mvnn7Uhn7fUaM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HWqIds1JtqxoC+GXg+J61Hb/rl+q23KepnybmBwzwlbJW9acaz/wb0XEcS1Tmz7Ul
	 Sw6zLP7QaMh53864joQB3Tk+CLRt+l+qa3d4mqwaNt9QK7OYaQLDH/Hlwa59wXSOh4
	 qQ8XAocO5+86eR3C7qHx7O8XsbOtZvgJ2AEfpWvFwF5HxCCo9Vfsn+gdmh+Vf3fADg
	 bz3BPlgm5YbLrkJZ3H0M1f6OeN8yr7e8PnO0Y8ZE62T44TS3g2i7RAt2w3+r0mp8bo
	 WTQJpfIGyvIaRbF7P8swq164KxT6zVmPq73/rdXigAmcK0FWRBovF+a4o1WlKEfeJv
	 22yp6tbStDCgQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wqZRV-0000000BVIZ-3G7g;
	Sun, 02 Aug 2026 16:53:42 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH v3 7/8] clocksource/drivers/arm_arch_timer: Expose a direct accessor for the virtual counter
Date: Sun,  2 Aug 2026 17:53:26 +0100
Message-ID: <20260802165327.385217-8-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260802165327.385217-1-maz@kernel.org>
References: <20260802165327.385217-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, tglx@kernel.org, ben.horgan@arm.com, daniel.lezcano@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

We allow access to the architected counter via arch_timer_read_counter().
However, this accessor can either be the virtual or the physical
view of the counter, depending on how the kernel has been booted.

At the same time, we have some architectural features (such as WFIT,
WFET) that rely on the virtual counter, and nothing else.

If implementations were perfect, we'd rely on reading CNTVCT_EL0,
and be done with it. However, we have a bunch of broken implementations
in the wild, which rely on preemption being disabled and other
costly workarounds.

In order to provide decent performance on non-broken HW while still
supporting the legacy horrors, expose arch_timer_read_vcounter() as
a new helper that hides this complexity. Obviously, this is simply
a global alias of arch_counter_get_cntvct().

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 drivers/clocksource/arm_arch_timer.c | 2 ++
 include/clocksource/arm_arch_timer.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/clocksource/arm_arch_timer.c b/drivers/clocksource/arm_arch_timer.c
index b3b31d4f4815f..9c7501ce57073 100644
--- a/drivers/clocksource/arm_arch_timer.c
+++ b/drivers/clocksource/arm_arch_timer.c
@@ -128,6 +128,8 @@ static notrace u64 arch_counter_get_cntvct(void)
 	return __arch_counter_get_cntvct();
 }
 
+u64 arch_timer_read_vcounter(void) __attribute__((alias("arch_counter_get_cntvct")));
+
 /*
  * Default to cp15 based access because arm64 uses this function for
  * sched_clock() before DT is probed and the cp15 method is guaranteed
diff --git a/include/clocksource/arm_arch_timer.h b/include/clocksource/arm_arch_timer.h
index 8deb815ed0a08..32fd531ac009f 100644
--- a/include/clocksource/arm_arch_timer.h
+++ b/include/clocksource/arm_arch_timer.h
@@ -90,6 +90,7 @@ struct clock_read_data;
 
 extern u32 arch_timer_get_rate(void);
 extern u64 arch_timer_read_counter(void);
+extern u64 arch_timer_read_vcounter(void);
 extern struct arch_timer_kvm_info *arch_timer_get_kvm_info(void);
 extern bool arch_timer_evtstrm_available(void);
 extern bool read_sched_clock_is_arch_counter(const struct clock_read_data *);
-- 
2.47.3


