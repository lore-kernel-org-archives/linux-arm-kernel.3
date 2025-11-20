Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FBCCCF9C77
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 17:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5YnqTBojdfuw3j4mwnbE8ojK3ba46RQ+uo96izJ3Di0=; b=nTSdu3jm+DxvROpyZymkzWYHM7
	qE+rUTiEH2v4OOrgPnozJIaUTkcL9ivZmTKwqwA4C+UNSrorsUaZYoXVdR6AmT9GGcs1MQyeVxFlr
	VhVHDwb9tVALnZrLWcsuR6D2KjdhitBoZza/KcqTyp/Vm4RzzyheqRXav8+zmjgHjXEL4xBICGq7e
	RfMmiRU5eUEs4P9kZo9McB6JyJlNSTW5FY0jie/1i5V1N0Y8+yk/OJ+Pi91pJEXCw6y1Tqh1NM6L0
	fBnx/MYevQaO5aCEcfMyvTG1dZpnrzZd0rzLsGN1ivtPVFSlD3eqp11vpjxnzdYYm5fUyfuruoXuU
	GzqakrJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8SY-000000078tW-3Q60;
	Thu, 20 Nov 2025 17:28:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM8Q9-000000075mP-1TdF
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 20 Nov 2025 17:26:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5YnqTBojdfuw3j4mwnbE8ojK3ba46RQ+uo96izJ3Di0=; b=QCC1H0mV6OVOTYg6e0jU6+ATnx
	+03iPNQ+iCO4yG1uU10i3rgNKporhqq/XCvXCwugkHsIFuSK120zt8/6X74vPUn748Xl+V2h5+rrY
	3knv1uVdSsOA5JCT7mFnN6R7MBFX3c8BnY4vr5CaKyS5VxI7oYtobF7XbedQ7r76kwoI2kqrLhZ9O
	KlJU8CExFcuZYee4siEJcBuu+P+J6medmvSiwvQD+5kZImZi0d5RLhLbq2mXI8oPGlzxlp/Y2Ing/
	tK38m5vhoFLK9zaX0AQAw1B5zQZ0VF3dY0ErnFuMdoYo+1NwD/IXwV2dFlrHK5rtu6WGZEOSawkXn
	plibkcYw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM7YT-0000000F6ff-0TMz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 16:30:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B3FAF44221;
	Thu, 20 Nov 2025 17:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98A4CC16AAE;
	Thu, 20 Nov 2025 17:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763659566;
	bh=zyiuKsX0B5115ZMKFeZ/41Mad50/Irl/nrXEi1lLsNg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jrV82tA4ypohoESETfkh78HNWHFpDfHQGfJ87pxkdtoXq4jaIsWAaX0KTi7NLPXM6
	 jHD00WJpBKHSAl0GfzFAOP45iXQ6taJQqZFSzoS9fdyFffF2S4u0RSgdb4NotKlEt4
	 QsTzq3+7gTcqWc3KFMclbuLdJDCRMSwYLnQIEggNKMemkNur37uzkn7eOht1gmHO0Y
	 Es06VPYa9BHlFEF3W3Gpd4KmKyzKUhsYZSoTpfhi4v8io0RM6L5uf2Qsv7j4HzexuZ
	 s0UmSEXfkLHDsdX6unvUW+zIHTC/RpFgrH1oYtgKWhIyeY3k+UlFwsMIDcodmw7dDO
	 QYZ7P91L+c4KQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vM8Q0-00000006y6g-3Y8o;
	Thu, 20 Nov 2025 17:26:04 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v4 43/49] KVM: arm64: selftests: vgic_irq: Change configuration before enabling interrupt
Date: Thu, 20 Nov 2025 17:25:33 +0000
Message-ID: <20251120172540.2267180-44-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251120172540.2267180-1-maz@kernel.org>
References: <20251120172540.2267180-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, christoffer.dall@arm.com, tabba@google.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_163045_719123_1AE90043 
X-CRM114-Status: GOOD (  12.49  )
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

The architecture is pretty clear that changing the configuration of
an enable interrupt is not OK. It doesn't really matter here, but
doing the right thing is not more expensive.

Tested-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 tools/testing/selftests/kvm/arm64/vgic_irq.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/kvm/arm64/vgic_irq.c b/tools/testing/selftests/kvm/arm64/vgic_irq.c
index a77562b2976ae..a8919ef3cea2e 100644
--- a/tools/testing/selftests/kvm/arm64/vgic_irq.c
+++ b/tools/testing/selftests/kvm/arm64/vgic_irq.c
@@ -473,12 +473,12 @@ static void guest_code(struct test_args *args)
 
 	gic_init(GIC_V3, 1);
 
-	for (i = 0; i < nr_irqs; i++)
-		gic_irq_enable(i);
-
 	for (i = MIN_SPI; i < nr_irqs; i++)
 		gic_irq_set_config(i, !level_sensitive);
 
+	for (i = 0; i < nr_irqs; i++)
+		gic_irq_enable(i);
+
 	gic_set_eoi_split(args->eoi_split);
 
 	reset_priorities(args);
-- 
2.47.3


