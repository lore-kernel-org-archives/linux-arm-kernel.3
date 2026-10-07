Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB89CA600D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 21:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mYZe45HeTXX9fu8FBMfQHhMULQV2A7raBUdWbHHcJ40=; b=RAU6paItmQS0R/Y7iBJvexqX4q
	aRLlKUb/zbTa1Xb9WvUR1IQkOiSWYXDTqdEcxhWww1nUn3qfoTj7u7QYNqB9yb9PKnvT8/DIQPERe
	s7jLLgZry0DleyzEwV6SPOhKOw7d9y0aNdRvrhl+umIi/ZhtmtsEIoPuaBGW5tGypDqwvb2XxKigj
	qv9eIO0WPah3y5CGB2GXNbToY7640iiFKfjt64CM9Drd6x756dmTfK6gotfioBg9l2Cg2yqu0hp9r
	wNhMDhGEOz+Yj6ha10r4Qf64IqkuUkgOBl+1RxM2NdfOxHv3itUh8lzTO+EZ1g9+8zQyFJ4uXRP6u
	HIH77uHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEZbw-00000003DoJ-34Ki;
	Wed, 07 Oct 2026 21:55:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEZbt-00000003Dne-3vow;
	Wed, 07 Oct 2026 21:55:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5582941146;
	Wed,  7 Oct 2026 21:55:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37A3DC2BCFB;
	Wed,  7 Oct 2026 21:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791410137;
	bh=NLC2QIUzt+qhz7otktUSqYZ4ASAjZabeK/4gxWnvzW8=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=sJI4cK+JHp2KDLkdWbxoCn9biWb4HZqSufQg/cYFFE6JRf74b3cFnyBeZYZ225xTg
	 i9YVhzcfZD2yoMJb3h7rJ/jp6pzoHqHTNfunqR7gw/qKrRAGNqMVrIPhfMcbOX7VGB
	 LYEtHrqW3JX85EDhcGRuR7gylYjbf3MLpCtk7TZVf6HvwEF9e9U9D7J9zxBa6hdjns
	 w7uOxUmIN4iqXsTMhZOVkcp6Jbku2Fy/RMG420RBgK/wkfJYkQ70vVq8furKpcu8wi
	 BAkO9aGY66vqgu7b/1ilEoQQfeS4EAfkGhzSTGAsg2bIomLdOzY4I+4npAfVX6DOux
	 u1ZKREcFHLySg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2737BCA6009;
	Wed,  7 Oct 2026 21:55:37 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Thu, 08 Oct 2026 00:55:32 +0300
Subject: [PATCH] irqchip/meson-gpio: Allow the GPIO interrupts to wake the
 system
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-meson-gpio-wake-v1-1-fec8a1f5d830@iav.lv>
X-B4-Tracking: v=1; b=H4sIANO/xmoC/x3MQQqAIBBA0avIrBswo4iuEi3GGmuIVBQqiO6et
 HyL/x/InIQzDOqBxKdkCb6grhTMG/mVUZZiMNp0tdY9HpyDxzVKwIt2RtdYR421hluCUsXETu7
 /OE7v+wFOugp4YQAAAA==
To: Thomas Gleixner <tglx@kernel.org>
Cc: Radu Rendec <radu@rendec.net>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1395; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=HcsigEkp72ihfLJvHs4V//Nip0TbJcUATNxrvhUqbWw=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFnH9l/pZ85tm2nLyu50TOLVtKnaz3tEPY70ltbM+qZpI
 G+b73y8o5SFQYyLQVZMkWXCIY1bGUuu/vX3MH8AM4eVCWQIAxenAEzkYCjDf/d/t1oNFjL82nnr
 j23GvtndbQwHt6mkNZfs/CZ3MPv/xBcM/4wmNt1m03hw8uOFju43ef4LLzStXt9Qv1fLaO+EppJ
 psswA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
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
Reply-To: iav@iav.lv
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Igor Velkov <iav@iav.lv>

meson_gpio_irq_chip has neither .irq_set_wake nor IRQCHIP_SKIP_SET_WAKE,
so enable_irq_wake() fails with -ENXIO for every interrupt routed through
it. Such an interrupt cannot wake the system from suspend.

Set IRQCHIP_SKIP_SET_WAKE, like the other hierarchical irqchips with a
GIC parent. The GIC sets the same flag, so irq_chip_set_wake_parent()
would end there anyway.

Tested on ODROID-HC4 with the PCF8563 alarm interrupt routed through this
controller: the alarm wakes the board from s2idle 4/4, and 0/1 without
this change.

Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 drivers/irqchip/irq-meson-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-meson-gpio.c b/drivers/irqchip/irq-meson-gpio.c
index 91a9c337fe6d..e0329ef5e4a2 100644
--- a/drivers/irqchip/irq-meson-gpio.c
+++ b/drivers/irqchip/irq-meson-gpio.c
@@ -538,7 +538,7 @@ static struct irq_chip meson_gpio_irq_chip = {
 #ifdef CONFIG_SMP
 	.irq_set_affinity	= irq_chip_set_affinity_parent,
 #endif
-	.flags			= IRQCHIP_SET_TYPE_MASKED,
+	.flags			= IRQCHIP_SET_TYPE_MASKED | IRQCHIP_SKIP_SET_WAKE,
 };
 
 static int meson_gpio_irq_domain_translate(struct irq_domain *domain,

---
base-commit: a90ee4305c4a5df72c11b31dacfdc76e00fcf78a
change-id: 20261008-meson-gpio-wake-f3bfa3bb2e5a

Best regards,
-- 
Igor Velkov <iav@iav.lv>



