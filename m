Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7614ECD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 09:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PfYfEUmSJJu99KFkME4QJcDO9qLVgas+BeL74XBcbcE=; b=VG8FoFowuBBuF8Kme33ZCf5mtW
	xOp7CZwtf+ZC+3TJuDGjcDIS/IjSFKyZcVNDQH88yI8W10zEw6naXkHpD6f3gnHlJlEDmge/YWhze
	oFQrjRmkWv98H3koAea8Z3Nw8dmLyzuUOg56bsUDPvbIPFr7mkbQwVunfOY+SPk46pDP2x/ImvIki
	WAyVsVv6RTU7o1DMSaLh0aomDEWNyK9Y2rbjkcwWa2AL8lIipxyjgUgaCS0T7K8aTG7OPWQ9f+l+y
	Lo75X2pjLJyvHQI/BIoUJoa3TdjUaNIFUg6bCrnbalkqabuQjMqAJn/SDL8gwQbPIHK4c9kyrNspQ
	vwtrcSTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6H-000000047HF-2DSp;
	Wed, 20 May 2026 09:20:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd6C-0000000479w-1XUK
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 20 May 2026 09:20:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=PfYfEUmSJJu99KFkME4QJcDO9qLVgas+BeL74XBcbcE=; b=Nc+6A89ZzNHOKWp1M0rwTxT9H7
	ima4nzSc3Rww7cKB1hCG95jByAWaf8wer+PKWEJEOQkDZO8StQtVSNk20VJDw5z6X4EfuH3j76BRZ
	AZu6FqWmDn0RKtvWRupXBQNGSxqlwy6zVzBo/aymWdPo/MRy0Fvmq/tC/pnMpMakL1FoVFLPq3wiw
	pGYGbLVMrcQRLxNGhMxABRyVpDYXjvT8EtWre+OXcJkUBtp/2rZI7Y6/wi8WSRItQhGcbctKqn8MU
	Srww2yf/kp+7aPBgaRx+zkXroohwAZ7YN7cuEbDrzsfE0/wCCLSA8LT/Wl/01D7yoK2tcGmKOdQF+
	7YpZ+YEA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPd65-0000000GKUE-3pIj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 09:20:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D098C43740;
	Wed, 20 May 2026 09:20:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0B491F00896;
	Wed, 20 May 2026 09:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779268812;
	bh=PfYfEUmSJJu99KFkME4QJcDO9qLVgas+BeL74XBcbcE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FHXlUFiy7h8ZDtjBYutiTRQH/JGcB8N+40Nyh+N1/RKip39QIEes+m3sz8mxNibcV
	 i9o53ToA+5yUgUr9x6cGAQbhyZsysQ8TnRVmklMFfdFNbkAeum8J0ljeRU2YSyUbAR
	 qBwrpudcNdk8+ZvMuKhp7r6+8EMOMnKW32VNfhf7omauJF0uvdtFr69/Rq3jZPRM0Z
	 XbZjIyvwi6Lubtj+INeyrcHZEhpFnnzF7PzIbQzbPoku6z9WTVNSPz1F99fQnIJtbh
	 //heNy+RDJrfp9NFSkHMBWpuQU7ctjht1ZjnNga1aCtsXEZfCsumg9iZY3H4cCiK2Z
	 tSass20ifJwFQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wPd62-00000004IaV-4AW1;
	Wed, 20 May 2026 09:20:11 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Steffen Eiden <seiden@linux.ibm.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Sascha Bischoff <sascha.bischoff@arm.com>
Subject: [PATCH v2 04/18] KVM: arm64: vgic-v5: Drop pointless ARM64_HAS_GICV5_CPUIF check
Date: Wed, 20 May 2026 10:19:35 +0100
Message-ID: <20260520091949.542365-5-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260520091949.542365-1-maz@kernel.org>
References: <20260520091949.542365-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, seiden@linux.ibm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, sascha.bischoff@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_102015_256751_DCC5F82B 
X-CRM114-Status: GOOD (  10.96  )
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

vgic_v5_get_implemented_ppis() can only be called when we have
a GICv5, by construction.

Remove the pointless check against ARM64_HAS_GICV5_CPUIF.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/vgic/vgic-v5.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm64/kvm/vgic/vgic-v5.c b/arch/arm64/kvm/vgic/vgic-v5.c
index 4d62b1c31fe8b..0101ec3f55283 100644
--- a/arch/arm64/kvm/vgic/vgic-v5.c
+++ b/arch/arm64/kvm/vgic/vgic-v5.c
@@ -18,9 +18,6 @@
  */
 static void vgic_v5_get_implemented_ppis(void)
 {
-	if (!cpus_have_final_cap(ARM64_HAS_GICV5_CPUIF))
-		return;
-
 	/*
 	 * If we have KVM, we have EL2, which means that we have support for the
 	 * EL1 and EL2 Physical & Virtual timers.
-- 
2.47.3


