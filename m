Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFE81FC5908
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 08:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B9dZJDtUpOpck0G5Lsqwbh7j0fGMIjR4VS5J8w9ZP+0=; b=E0td9DkON3ByD9VWKHS3U3Z5jr
	xBWIu87aPAs7g3Xpg/waFYo2NEBC0U47sBY/uGm0oDXyZ02WxIGqdrCIXI0R+YeDZFXO3kErXPvYW
	3RL3OA2mrSDz/SFi512FvS0+ZkVvL30CTL1Snon8Evmh9plMtvOQSJ+J9C/9mEipxokkGV6XhdIdk
	wngS6MCmOaXDEpod9R/xAESLg5QMjN+oGRlcfEIN6Dca1lxqW8c2k4TVE1gUdyC6JEZdGIjIfo0Ko
	Du2+aTg6WbB8Q9TUNHEJ/EZliHRMiOS7+LAu4afS/xSaOk3FtsG/rApv/+SoqM1bGMCzqt8Bje7A9
	UtF49fyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvWdu-00000005dwm-05wa;
	Thu, 26 Feb 2026 08:22:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvWds-00000005dw5-3uGa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 08:22:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2688560097;
	Thu, 26 Feb 2026 08:22:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C92DCC19424;
	Thu, 26 Feb 2026 08:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772094159;
	bh=cCBGd0NcLNHogvh1P0jaYup5QYVXFNVm+Kwupd/El0c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IyPhIuopdG3IokwirGqSLpDwqQztoKR1mqoOT+wfY+alZlyxXn9W8CwG7qx/5MGkB
	 ffIiB9DCt5SFVWJaOZiDsaV+lXViP2Yy0N9P54a+rbAiHukIp/teCD7XLpfwRcYeOt
	 5gMMn708khAQ9lshZGmAKzKl0b2sgEb3fMzQgZhgYnwUwSVideZJnObenyAB6xtQFb
	 2mIJMgLMfNya4Q5VTtWDKF9NqAWsfWBY+LcHz4oHb9zEbhN5m/+KLuPiZYNwoBTXuc
	 ziMqncm0EcA1WNckh/TqV2T1W166TYsVbEkIyUcvV1MQHWmYOjg8/edEp6+JTryyfA
	 XJLB2HikhALHw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vvWdp-0000000DyFd-3rFB;
	Thu, 26 Feb 2026 08:22:37 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 1/3] arm64: Fix sampling the "stable" virtual counter in preemptible section
Date: Thu, 26 Feb 2026 08:22:32 +0000
Message-ID: <20260226082234.26707-2-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260226082234.26707-1-maz@kernel.org>
References: <20260226082234.26707-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, will@kernel.org, catalin.marinas@arm.com, mark.rutland@arm.com, ben.horgan@arm.com, daniel.lezcano@linaro.org
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

Ben reports that when running with CONFIG_DEBUG_PREEMPT, using
__arch_counter_get_cntvct_stable() results in well deserves warnings,
as we access a per-CPU variable without preemption disabled.

Fix the issue by disabling preemption on reading the counter. We can
probably do a lot better by not disabling preemption on systems that
do not require horrible workarounds to return a valid counter value,
but this plugs the issue for the time being.

Fixes: 29cc0f3aa7c64 ("arm64: Force the use of CNTVCT_EL0 in __delay()")
Reported-by: Ben Horgan <ben.horgan@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/aZw3EGs4rbQvbAzV@e134344.arm.com
---
 arch/arm64/lib/delay.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/lib/delay.c b/arch/arm64/lib/delay.c
index d02341303899e..e278e060e78a9 100644
--- a/arch/arm64/lib/delay.c
+++ b/arch/arm64/lib/delay.c
@@ -32,7 +32,11 @@ static inline unsigned long xloops_to_cycles(unsigned long xloops)
  * Note that userspace cannot change the offset behind our back either,
  * as the vcpu mutex is held as long as KVM_RUN is in progress.
  */
-#define __delay_cycles()	__arch_counter_get_cntvct_stable()
+static cycles_t notrace __delay_cycles(void)
+{
+	guard(preempt_notrace)();
+	return __arch_counter_get_cntvct_stable();
+}
 
 void __delay(unsigned long cycles)
 {
-- 
2.47.3


