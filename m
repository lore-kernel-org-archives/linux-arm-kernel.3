Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF6F606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 10:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SYAZCAiw;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ijEVgSdB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=f117Q560NSjBr6anMxMv/fimQdDJKi1k4+mVt+CX9eI=; b=SYAZCAiw6Tsces
	t9gIoxT0kb2JTJppVTpiO0iG3jgRFjsnsQFAZWlwiwKApHp12ds2c1k5nTd9EkQsmlJBzHZ4zeR/a
	fC9ySDaxNrW6jf803Ix9xNag9BILYODuJiYIC98OHA+ULGXe+o26+/GTjQeBPpUFHHZGnrRhIqtJN
	i6gb8uVQV4VNp6y8xWW19fWpGfqOreXI9R01zPFwqOk5xH6YeceGla863Bd9qwtguMhgwiztfiNHS
	GZco0kVCH1I9buwYovJn1VjqKJxiY0TrK91n1ISSElpE4SU8onKUZHWX7lbrdwMp28KTk7COkWJtk
	E0IYgrMZxpBfqASVS7qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLeZz-00000004JRo-2tLH;
	Tue, 27 Oct 2026 10:38:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLeZx-00000004JQT-2ol1;
	Tue, 27 Oct 2026 10:38:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A2E46022B;
	Tue, 27 Oct 2026 10:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C25F1F01825;
	Tue, 27 Oct 2026 10:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793097532;
	bh=f117Q560NSjBr6anMxMv/fimQdDJKi1k4+mVt+CX9eI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ijEVgSdBPn2SY+nPgA3zsOTgz/3fSL2gxTh77xNIRsI0zEhHQAtGzO4DwTSq8Yihh
	 jFHGw8R2OnnPntv5C2P0PkaKWEpahjIfQaVRHayKivWMCn6OsYp6Xg35ZosFPzpK28
	 Ft0Hni74Pe/83iG0748ozTgPue6rUpYrxb4uZr1xv3RsiODZqnv6Pg+/PVvklplZ5N
	 m7v4C8EgWWKSl5SJjMylXyPIo4iEOWH673ZHJXSTi8Myhn9AS9lndyTlkN4+hJa00V
	 RnmGBw8EFRJjOtnagLVFjg/2P7VXfcLBlfBUmccuz6eyxdtlvHQP62A2UsSkvffdYy
	 /p3RuMcvaRmaQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 25/27] mfd: mt6397: Unregister PM notifier on probe failure and unbind
Date: Tue, 27 Oct 2026 09:30:54 +0000
Message-ID: <20261027093306.2812695-26-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.307.g5fe7bd680c-goog
In-Reply-To: <20261027093306.2812695-1-lee@kernel.org>
References: <20261027093306.2812695-1-lee@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mt6397_irq_init() registers a power management notifier block embedded
in the devres-managed struct mt6397_chip via register_pm_notifier(),
but never unregisters it if mt6397_probe() later fails or when the
driver is unbound.  Once devres frees struct mt6397_chip, the dangling
notifier block corrupts the global PM notifier chain and causes a
use-after-free on subsequent suspend or resume transitions.

Check the return value of register_pm_notifier() and register a devres
action to unregister the PM notifier on probe failure or device unbind.

Fixes: 4e2e7cfec13a ("mfd: mt6397: Modify suspend/resume behavior")
Closes: https://sashiko.dev/#/bug/linux-edb62fbc-213a-49a2-be55-c002e234e554
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/mfd/mt6397-irq.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/mt6397-irq.c b/drivers/mfd/mt6397-irq.c
index 58645dbd8095..bc7ca22d6f17 100644
--- a/drivers/mfd/mt6397-irq.c
+++ b/drivers/mfd/mt6397-irq.c
@@ -179,6 +179,13 @@ static void mt6397_irq_domain_remove(void *data)
 	irq_domain_remove(chip->irq_domain);
 }
 
+static void mt6397_unregister_pm_notifier(void *data)
+{
+	struct mt6397_chip *chip = data;
+
+	unregister_pm_notifier(&chip->pm_nb);
+}
+
 int mt6397_irq_init(struct mt6397_chip *chip)
 {
 	int ret;
@@ -247,6 +254,10 @@ int mt6397_irq_init(struct mt6397_chip *chip)
 		return ret;
 	}
 
-	register_pm_notifier(&chip->pm_nb);
-	return 0;
+	ret = register_pm_notifier(&chip->pm_nb);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(chip->dev,
+					mt6397_unregister_pm_notifier, chip);
 }
-- 
2.56.0.307.g5fe7bd680c-goog


