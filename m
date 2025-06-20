Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3A89C7115D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 11:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l2+qlZRHRmmlBn9+0MPXqMooUbO/SI0m1+ZmobjzccU=; b=sOvZuzFo2T17QrveN0Se4VrE9O
	WcEkdUpNJw0zlm99FaRd+oTxs0YQrQRCktSfFIN3gm+sDE/4Bxgh8aDVFKAXP/2o90QwQ51ZZKLf4
	4KZKO8RiRXhPojA9E30dRgsaH6mbFm1ydY1rERAhjdzScrMnPBsMLQ5/gSChExbzAFAOquHsjSc/Z
	TpdSJ5oQZcUX3hrAQyJnd09w5MM3p7cpSfPAEauLaB8mOdwevJFl8e5Kaeg5weXhyDCF6ilfP+0iu
	d7pUhBLATrKyj8pDqOT1H1mnZTJGB8Y52iCEpPKgqBwNlyG2s0RV5CcCPCbjzgaoL/Hf/WY7Qlo4Q
	EqikR25g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSaEG-0000000FV2m-0fen;
	Fri, 20 Jun 2025 11:48:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSZdy-0000000FQxn-2D3p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 11:10:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EAE9B61786;
	Fri, 20 Jun 2025 11:10:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9B5EC4CEE3;
	Fri, 20 Jun 2025 11:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750417849;
	bh=svtDzZdrbdSl/3pbNWLxGgua09eH0cIx0j2lbmFQQ6Y=;
	h=From:To:Cc:Subject:Date:From;
	b=OE/g/KUqf6uDvHAIqq2sQf/EQI/0gI93Jut3ZlNqhccuKnf6/PxUMDSGxLZeUlqpB
	 bd+ax3IAwKsyKNGZwjpE/Ezpr5EnButk0yzGY+Y2LHoUgNdYO7EjC+LxAu9N5oW6h7
	 pnCMRHXmWcPR4v7x0fuUvkj/xC06+6BIw7kYXusfa68/irxvjtbEafa4p8FyrpCsUj
	 rfB+nxOsQC8tI9m4r+QtgtU5KpdtDM2fjjBCiAU8mSCllI+/1/skNEoQTxocPUqlWZ
	 UHRpT9BypJLuUuIUa2nvwbAjRSvpeLd7DQxe+h9939UaZvS4YvlMnvd+kUdSfhHTxC
	 37qirA946Vpyw==
From: Arnd Bergmann <arnd@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Gavin Shan <gshan@redhat.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	James Morse <james.morse@arm.com>,
	Douglas Anderson <dianders@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: move smp_send_stop() cpu mask off stack
Date: Fri, 20 Jun 2025 13:10:41 +0200
Message-Id: <20250620111045.3364827-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
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

From: Arnd Bergmann <arnd@arndb.de>

For really large values of CONFIG_NR_CPUS, a CPU mask value should
not be put on the stack:

arch/arm64/kernel/smp.c:1188:1: error: the frame size of 8544 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]

This could be achieved using alloc_cpumask_var(), which makes it
depend on CONFIG_CPUMASK_OFFSTACK, but as this function is already
serialized and can only run on one CPU, making the variable 'static'
is easier.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/kernel/smp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 15987100c0cf..5c605dc7f5be 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -1107,7 +1107,7 @@ static inline unsigned int num_other_online_cpus(void)
 void smp_send_stop(void)
 {
 	static unsigned long stop_in_progress;
-	cpumask_t mask;
+	static cpumask_t mask;
 	unsigned long timeout;
 
 	/*
-- 
2.39.5


