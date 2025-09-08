Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A528CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 09:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bblp97OOL1aWrtKopF8NdvsXkogfbkqEK3YE6s8LSRM=; b=SPGxjoR4DpPZQinvhXvXRybAlt
	e+e8Tk2s9Q9UESxney3Veo5sVAuLtGB9q9DXZteKC3PRQv9fAAeAGJf8zSF+4/Gv+mg0kPQv7h/Hj
	5T8oG+hiBZIuCErfVruH5ANRpxtFjoQHrZqoA+/jy816OWLiVsvzfKyC+ipkA7blreQ6/DmCpz893
	WvQJMdOM+Gdyg3WANen0Bf9Kl0Mto1VjlgBCVVeCyE89QpjFBwEkTkHSSdzrMa35109bv5hD3r4dP
	TBr6JoyrBTvsZFBUKCSfpO93AJ7+j6tnkkcR46gPHDtvIzRovU4n+9DnDf4Vl+TJUOZp0yRRBPsQM
	58xOvckg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvY6A-0000000G07D-16lB;
	Mon, 08 Sep 2025 09:23:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvXEA-0000000FhSu-0uTc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 08:27:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F1D3044733;
	Mon,  8 Sep 2025 08:27:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29F76C4CEF5;
	Mon,  8 Sep 2025 08:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757320073;
	bh=P/vlG6t4K0nRMEfMtDS6pVBd3+VY1KFLZviC+h88F5I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JUhJopxZVT0XDCNhhdmGwvnjr5AQ++YQD87Z5jb/6SjmVJkLJo37/tKfhl0NOFw0m
	 ikYD4dJRS1uXcK/+coDje9w8jchfyBXBKBdkrkscxIkXknclhJPHHcKZQ9LdCj2n9s
	 wA+CCfn97QsArsl4FtosaA0gwbSJtUN/iYjmneda2ABluTgPS98Q9tLqV019rN1Ua0
	 vYnk2hOAyrd4lieVwva8//OIZ1CY3xTO0cXGKz7HGQoGnvhngp5rdJosD1pDAVDWKH
	 kVWyq4zPmy5lLhgId+45y4urANQwajoNIB09Z7tgDexSVY3pF7fQjEP/9B3q9JqbTG
	 /ESCYn9Kr5DeQ==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH v2 RESEND 2/3] irqchip/gic-v5: Fix loop in gicv5_its_create_itt_two_level() cleanup path
Date: Mon,  8 Sep 2025 10:27:44 +0200
Message-ID: <20250908082745.113718-3-lpieralisi@kernel.org>
X-Mailer: git-send-email 2.48.0
In-Reply-To: <20250908082745.113718-1-lpieralisi@kernel.org>
References: <20250908082745.113718-1-lpieralisi@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_012754_276691_5AB40DFC 
X-CRM114-Status: GOOD (  12.23  )
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

From: Dan Carpenter <dan.carpenter@linaro.org>

The "i" variable in gicv5_its_create_itt_two_level() needs to be signed
otherwise it would cause a forever loop in the function cleanup path.

[lpieralisi: reworded commit log]

Fixes: 57d72196dfc8 ("irqchip/gic-v5: Add GICv5 ITS support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Marc Zyngier <maz@kernel.org>
---
 drivers/irqchip/irq-gic-v5-its.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v5-its.c b/drivers/irqchip/irq-gic-v5-its.c
index 9290ac741949..4701ef62b8b2 100644
--- a/drivers/irqchip/irq-gic-v5-its.c
+++ b/drivers/irqchip/irq-gic-v5-its.c
@@ -191,9 +191,9 @@ static int gicv5_its_create_itt_two_level(struct gicv5_its_chip_data *its,
 					  unsigned int num_events)
 {
 	unsigned int l1_bits, l2_bits, span, events_per_l2_table;
-	unsigned int i, complete_tables, final_span, num_ents;
+	unsigned int complete_tables, final_span, num_ents;
 	__le64 *itt_l1, *itt_l2, **l2ptrs;
-	int ret;
+	int i, ret;
 	u64 val;
 
 	ret = gicv5_its_l2sz_to_l2_bits(itt_l2sz);
-- 
2.48.0


