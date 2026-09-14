Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0117C88E70
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 10:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c1BcAT+r9CbkliWowJZ73u9jiJtIo8EE4/JHPK3wQFQ=; b=UshN4g0bHfOVxwGmbsEZzP5ZBM
	ahBvzYLUe9eCULUc68MBclxbeoI/CSd0f+2r+ii2h5V15HH+erpEtMN1Va75NhOBG4d3K5Jx7CMms
	MkEEHiyXuJ7as8lx5oehL+/pSXsjLYQHxD9EVtZ8J0qIfr1i8qvd0nq3KnIdUtp4G2tNkGPctfVFh
	UveU3Vn204RHLQmnwJKcf4uoBYYk2zcxCVwg9UzB5LS4fxb2OrV3V3SCuX6tlrBJoU3L6+5te54Pq
	svJB9DWb/BaIQxp0gjqkPGHhTFZN12NXypK1YRY/nGtHvrNUwQaKmUGEgsp3Khsv8gaDXLT2vOXY3
	Xluq8XiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63qq-000000037mj-3Vtv;
	Mon, 14 Sep 2026 10:23:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x63pQ-0000000362C-2yJZ
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 14 Sep 2026 10:22:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=c1BcAT+r9CbkliWowJZ73u9jiJtIo8EE4/JHPK3wQFQ=; b=YeBbkRTOI5OhFxTfvEu2doQZ16
	8L45Hr/c8myfT5Bi2hySiY+K9ZAXqUd8LTgQVYs76/HGuTsJGprYhH7XWK/RhlSFJ5Lk10jO1Mcbx
	14MxNTCsye4DBqWiX0UijgbLRDZxB6nGOg+ETZPdLh/BCVpzMiJrvKD5wB6KAfIQmNMQr9tjTgOd4
	2aKUYaMSW1VfFdx12TPcTV7o3RIY/qjMnVjHJwWBqR+pD7Yc3YrK6Q1/1YCymx8DeURt4KrXeBmUB
	8xEAyU5CTjypMa/tMiavjroO7dnGbSCum9PJsCKcKc2xejeqd5ey3PzCPSyV/hOd4POIv0HYoe6Xj
	otrRWb+A==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x63pN-00000005UAL-2D1U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 10:22:23 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3FEB11570;
	Mon, 14 Sep 2026 03:22:17 -0700 (PDT)
Received: from login2.euhpc2.arm.com (login2.euhpc2.arm.com [10.58.100.22])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B5FA63F7B4;
	Mon, 14 Sep 2026 03:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789381340; bh=UcEfT1Th/lwVg2ygQQWM2w8ASkn1bsoefpeQd9TrOS0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hnsq8n//Va2+VO8Lp+NYPFPLw7tC1UqDImmqzyxiqn1VRGINh3nMNS4yLN9iRXpbC
	 L//nFCjSYrDhM62cVP9BXxntti29BXiYid4bjLhcnTqVL9iKRmOsMFBVnU1Bd2Uasz
	 NZ+JmAueNk8Iz7ook7DbWleqA99o/e1vGbEQ2B10=
From: Vladimir Murzin <vladimir.murzin@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	maz@kernel.org,
	lpieralisi@kernel.org,
	ruanjinjie@huawei.com,
	liaochang1@huawei.com
Subject: [PATCH 37/38] genirq: Do not call add_interrupt_randomness() in NMI context
Date: Mon, 14 Sep 2026 11:21:01 +0100
Message-Id: <20260914102102.68597-38-vladimir.murzin@arm.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20260914102102.68597-1-vladimir.murzin@arm.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_112221_814764_2C3E347B 
X-CRM114-Status: UNSURE (   8.52  )
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

handle_irq_event_percpu() calls add_interrupt_randomness(). Similarly
to 512718bbc51b ("genirq/chip: Don't call add_interrupt_randomness()
for NMIs"), calling it while handling an NMI is not safe.

Stop calling add_interrupt_randomness() when handle_irq_event_percpu()
runs in NMI context.

Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
---
 kernel/irq/handle.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/irq/handle.c b/kernel/irq/handle.c
index b7d52821837b..114fd63b0210 100644
--- a/kernel/irq/handle.c
+++ b/kernel/irq/handle.c
@@ -245,7 +245,8 @@ irqreturn_t handle_irq_event_percpu(struct irq_desc *desc)
 
 	retval = __handle_irq_event_percpu(desc);
 
-	add_interrupt_randomness(desc->irq_data.irq);
+	if (!in_nmi())
+		add_interrupt_randomness(desc->irq_data.irq);
 
 	if (!irq_settings_no_debug(desc))
 		note_interrupt(desc, retval);
-- 
2.34.1


