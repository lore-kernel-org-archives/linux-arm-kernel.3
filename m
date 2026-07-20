Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAC9C44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 18:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qLxO7C/9C4fJ8Duz1IApUTN+y+79YQnEjthyFz5HJ14=; b=iw1FjgMXoBUUgEcsUQyr8m4JwF
	GuQJVnfz4KwbFMoKI/d3GjJjLPFzVxEczeCbsM1HS+o3bTshDgxMYPfZQrw6TcIsVyCbkomrRmxax
	vJ5jFhbM5RilX4qUzOFbAE2nvARv4UW5LiQ8xXjZ3Y7gDBEWWoEgUXqNREDsMdzfTKrj0G5i4pjH0
	luL3ty85Uf08KFY7waxu3P0GxfwTYKrT7mk03BbOo3ys/pJRquUUjduwzpanE/T0dg8uQ33Q2DuET
	IPMrZ22+ICSjoEN7w6ROcWmGDDaq8kIPU+2ni1MZfges14FFiaytYMDY75hZGII12FeRsJjPDvC0I
	CskcOlEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlt2z-00000007gn5-0DjW;
	Mon, 20 Jul 2026 18:49:01 +0000
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlt2v-00000007gmd-3xUm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 18:48:59 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784573333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qLxO7C/9C4fJ8Duz1IApUTN+y+79YQnEjthyFz5HJ14=;
	b=ZflIySSLxnvigH8ilhtZi50KgPi3pESd6tjWIZ38IRHrevJstSkt/VceSNwsJRU7eD+uGt
	IGggosg6kTtPqhywq1OWa9UMQaexQBaOwLS8ENBT0S+8hIWaoyMSgco3ef3VjJtW8NIBjG
	VEbm3oiB4AfWBHVQRV1VN+7R0xA8ZWs=
From: Fuad Tabba <fuad.tabba@linux.dev>
To: maz@kernel.org,
	oupton@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: vdonnefort@google.com,
	will@kernel.org,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-kernel@vger.kernel.org,
	tabba@google.com
Subject: [PATCH] KVM: arm64: Stop the hyp trace clock worker on disable
Date: Mon, 20 Jul 2026 19:48:50 +0100
Message-Id: <20260720184850.1826630-1-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_114858_142978_13FC6A9D 
X-CRM114-Status: UNSURE (   7.89  )
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

When disabling, hyp_trace_clock_enable() cancels the clock work but then
falls through into the enable path, which re-schedules it and marks the
clock running again, so the worker never stops. Return once the work is
cancelled.

Fixes: b22888917fa41 ("KVM: arm64: Sync boot clock with the nVHE/pKVM hyp")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260720172923.E4F161F000E9@smtp.kernel.org/
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 arch/arm64/kvm/hyp_trace.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kvm/hyp_trace.c b/arch/arm64/kvm/hyp_trace.c
index 2411b4c32932c..27367843fd211 100644
--- a/arch/arm64/kvm/hyp_trace.c
+++ b/arch/arm64/kvm/hyp_trace.c
@@ -116,6 +116,7 @@ static void hyp_trace_clock_enable(struct hyp_trace_clock *hyp_clock, bool enabl
 	if (!enable) {
 		cancel_delayed_work_sync(&hyp_clock->work);
 		hyp_clock->running = false;
+		return;
 	}
 
 	ktime_get_snapshot_id(CLOCK_BOOTTIME, &snap);

base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
-- 
2.39.5


