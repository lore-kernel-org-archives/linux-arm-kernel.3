Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6FCC79FA0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 16:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FqgwtArQEQvqOYaVK+gx/Kqx6LAzmgUYoWNYaDKBbKE=; b=k23fOR1xmC+4PFexW/FJcAJHTO
	lrqncAUvi+w6XIF8JABowq4L4UwtGlqEqZQquEijgd6u4d7qN8gP2CUAHOpIVxgIL69PaF5sFSkxZ
	634ADQKfSviQFqFmHiVt+ybXJbZB/GM5r4UlUfs4QX2MQGSt1mAzJhZpEjlLj21B88Zt9gkos8bI5
	s48ltUMf3xRJZzjG2c1fBu08kiWflBw3DSUuDvgDvnXJynjAjE0hMTsbWJgbCj02CpP2S0FXgYAuQ
	a7zp/MQxs7zbqj+m8NiKCklFbg8vuTO90upLtlO0WxNZVkDdchBn6RE4EMgwl3eNyMnxKL/+tpnPd
	Xt0fD7PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cOe-00000007LFH-2Ip3;
	Mon, 07 Sep 2026 16:40:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3cOc-00000007LEh-3mZe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 16:40:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5AD8460213;
	Mon,  7 Sep 2026 16:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B82701F00A3D;
	Mon,  7 Sep 2026 16:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788799238;
	bh=FqgwtArQEQvqOYaVK+gx/Kqx6LAzmgUYoWNYaDKBbKE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WEAuga3D54bnE4s0DofA7MVFKNKHnqgNmAre3Hhj0U6WmlwtuxQPCrQu+AKNUPQJo
	 tr8Lxgx/y1EH6GKMDXEpYn739KWLPguFaMoTmniBwthEdL3qQkLe3BpdlLlatkkOHO
	 jQNNzZKR52nktGtQS2W6YR2dOr3Ml+i1cHA7wCK3MJnRRyQNdPa7MHODZhNWtVIlkH
	 UbxhpAPyvsRVidn0YSO9S2rvZWnVbYK8VjmkDiDeUhVLd2Q2SECL2xOHfB+72vH8yU
	 Wz9ys7Z7cbzILEqGiUruDo2+tuLhqnpunJwAsYf7U61fsMfNAOPdtIozNcVuutqo6b
	 N7PP+WS45LgTQ==
From: Will Deacon <will@kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Borislav Petkov <bp@alien8.de>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Peter Zijlstra <peterz@infradead.org>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH 01/19] cpu/hotplug: Clean up cmpxchg() logic in cpuhp_can_boot_ap()
Date: Mon,  7 Sep 2026 17:40:04 +0100
Message-ID: <20260907164024.17164-2-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260907164024.17164-1-will@kernel.org>
References: <20260907164024.17164-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

cpuhp_can_boot_ap() uses atomic_try_cmpxchg() to transition the sync
state of the incoming CPU to SYNC_STATE_KICKED. However, this is
unnecessary if the state is SYNC_STATE_DEAD, since there will not be any
concurrent state modifications, and also if the state is already set to
SYNC_STATE_KICKED.

Restrict the use of cmpxchg() to the case where the existing state is
SYNC_STATE_ALIVE.

Signed-off-by: Will Deacon <will@kernel.org>
---
 kernel/cpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index b3c8553d7bd6..198c929c452a 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -408,22 +408,22 @@ static bool cpuhp_can_boot_ap(unsigned int cpu)
 	switch (sync) {
 	case SYNC_STATE_DEAD:
 		/* CPU is properly dead */
+		atomic_set(st, SYNC_STATE_KICKED);
 		break;
 	case SYNC_STATE_KICKED:
 		/* CPU did not come up in previous attempt */
 		break;
 	case SYNC_STATE_ALIVE:
 		/* CPU is stuck cpuhp_ap_sync_alive(). */
+		if (!atomic_try_cmpxchg_relaxed(st, &sync, SYNC_STATE_KICKED))
+			goto again;
 		break;
 	default:
 		/* CPU failed to report online or dead and is in limbo state. */
 		return false;
 	}
 
-	/* Prepare for booting */
-	if (!atomic_try_cmpxchg(st, &sync, SYNC_STATE_KICKED))
-		goto again;
-
+	/* Continue with booting */
 	return true;
 }
 
-- 
2.55.0.979.g7e5102b832-goog


