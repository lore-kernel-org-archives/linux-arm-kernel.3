Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E363C5B552
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 09:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jLiIn9lskmH/D1eF5J4sQ0wIK0cR1ZEL8pfG/dXiLFg=; b=tDZGNd6eXjKFw99X4Zv+JpQRuK
	kWTdTuCaAMmBb2/Ej05NRWvsZUk628tWsfgGsd/uqIc77Lh/T30k06OUh20bsTo3oG0CS99JpUWDs
	vOhnv/XFQSGZGBp3ZgQgpfpq114T6M5DsuZPLRkkaqhBp77/88g14lo1RFidZBorGsvlYSX7SlTlC
	1qrxbIkDGUnqONcDuuRFP7BDx2yaN07VigOcEocYnCUulzDIaonHNJFIEvzBMF/E3GdQ6RdAV2MMw
	Fx5Cdh/li1B14cxixmblDxIOPLWK238U2bz545mYpdr8X84dm3NwCr3ZorkfDy2/dEYdZYz4qGC8Y
	nwoB8ScA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKvyE-000000006jE-1rDu;
	Fri, 30 May 2025 09:24:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKvrH-000000005pI-412K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 09:17:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A08C4A50A;
	Fri, 30 May 2025 09:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CBC3C4CEEE;
	Fri, 30 May 2025 09:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748596619;
	bh=HcxD8NTz3N/DzXNiqUMva/w8nb456E8HfOoEaE1SAos=;
	h=From:To:Cc:Subject:Date:From;
	b=ISYAZEbd9hSM5aT9ZALJd8ovz7fd4icYNneaqQlU4/HVoJV4XM2ts8Nm/iNKmb7dC
	 4mJAxksyPTECYVfFvdCNzqqPQ40SMGYjxfuOznQXWgn9VOPVTOEBQOlKB1xBpUq6cL
	 naqLBrZpAACyPlsOwbniHaimOv3yZlMiUDIoy6Ss2YDZp7U+LR2NBXVXuVXVNh2ODZ
	 zBSTJzi7vntSKcGrD/hbaNbYlgR2YH76WazQ2F0NTEGXjEfDzM3tdZhEKeU/XDQ48o
	 voawxo4jx+BzpnHtVYn/H67Rk877InzOQuoemPRp4UGFJz8Nw5rbldPiuimrNKbsLM
	 /MI5WwNJSoSAg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uKvrE-001o5V-RZ;
	Fri, 30 May 2025 10:16:56 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Jing Zhang <jingzhangos@google.com>
Subject: [PATCH] KVM: arm64: vgic-debug: Avoid dereferencing NULL ITE pointer
Date: Fri, 30 May 2025 10:16:47 +0100
Message-Id: <20250530091647.1152489-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, dan.carpenter@linaro.org, jingzhangos@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_021700_019551_19E90353 
X-CRM114-Status: GOOD (  14.49  )
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

Dan reports that iterating over a device ITEs can legitimately lead
to a NULL pointer, and that the NULL check is placed *after* the
pointer has already been dereferenced.

Hoist the pointer check as early as possible and be done with it.

Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Fixes: 30deb51a677b ("KVM: arm64: vgic-its: Add debugfs interface to expose ITS tables")
Link: https://lore.kernel.org/r/aDBylI1YnjPatAbr@stanley.mountain
Signed-off-by: Marc Zyngier <maz@kernel.org>
Cc: Jing Zhang <jingzhangos@google.com>
---
 arch/arm64/kvm/vgic/vgic-debug.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/vgic/vgic-debug.c b/arch/arm64/kvm/vgic/vgic-debug.c
index f8425f381de97..2684f273d9e17 100644
--- a/arch/arm64/kvm/vgic/vgic-debug.c
+++ b/arch/arm64/kvm/vgic/vgic-debug.c
@@ -490,6 +490,9 @@ static int vgic_its_debug_show(struct seq_file *s, void *v)
 	struct its_device *dev = iter->dev;
 	struct its_ite *ite = iter->ite;
 
+	if (!ite)
+		return 0;
+
 	if (list_is_first(&ite->ite_list, &dev->itt_head)) {
 		seq_printf(s, "\n");
 		seq_printf(s, "Device ID: 0x%x, Event ID Range: [0 - %llu]\n",
@@ -498,7 +501,7 @@ static int vgic_its_debug_show(struct seq_file *s, void *v)
 		seq_printf(s, "-----------------------------------------------\n");
 	}
 
-	if (ite && ite->irq && ite->collection) {
+	if (ite->irq && ite->collection) {
 		seq_printf(s, "%8u %8u %8u %8u %8u %2d\n",
 			   ite->event_id, ite->irq->intid, ite->irq->hwintid,
 			   ite->collection->target_addr,
-- 
2.39.2


