Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AA0760A2602
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 10:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=L+puA2UJ;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LmM+0VJp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=C3VO9NPx3/E/rIdxFTBZKn/RU6zkWP4meAZHmerhPjA=; b=L+puA2UJPjS/JJ
	is8EWLJfHIzEp8TG9vosNbBS7GMxnFc2nRFzJwMmDD5rZIYEB8+bj0pUAfiioUOC78+QkPOXtVMQD
	5Ubjp1trMIkojB6uXFbQMsMEaNipMDUX0dJ1IJm/ZzlT9MrJBeWd390odLnuYZm1FDTxaQDTL9oEG
	ZeDKFVku3mgKYhPkgKDlGkis1ZlGFNe6A2iL4FNS5F3Pj2kEbHWAMqjgXvf1oMlgabhzQbpBLr8K9
	Rk/PWHWA6OW9NgQ/pqrg0DP5xLKaUiJJrZ1bfOX52FIhMXMTYvTcH75vW20GYuZGipVL3U91QZzY4
	55b0iAdR1tw5YP+dIKSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLeZa-00000004JEl-47dR;
	Tue, 27 Oct 2026 10:38:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLeZY-00000004JEQ-2723
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 10:38:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4612642EB2;
	Tue, 27 Oct 2026 10:38:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A464D1F01828;
	Tue, 27 Oct 2026 10:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793097508;
	bh=C3VO9NPx3/E/rIdxFTBZKn/RU6zkWP4meAZHmerhPjA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LmM+0VJpDfIS58ptbirphpWN8wGyDC5murEJP88D6+Y9p6K35PLJzKIeZGGlDWlSz
	 ZAfg4XALpN3N6jtbtnvX7r+5M9rU3tGnTcI2ag18He8QkSFcsnnovZkGZtGlDBq5Zk
	 P+Po1a4xTxRSddhhB3S6YevC81xSJI8G5tngOXK8QcCsWDN1tUn4V59b8AU6QFPtAI
	 un3NV+QaO7k1OGEm4U1XqkOxoYjSAKrM4D+wAsCYy/a7JFlvUDo90n2zsqmOKr8QyZ
	 ZZSUzv4i3RhQIutqWk6SmB9mQCcyzGI53Ty8LJnZeDsCahBNkjMFdGKnOb+5vzpaeL
	 Uh+URw4rgzWKQ==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Srinidhi Kasagar <srinidhi.kasagar@stericsson.com>,
	Rabin Vincent <rabin.vincent@stericsson.com>,
	Mattias Wallin <mattias.wallin@stericsson.com>,
	linux-arm-kernel@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH v2 22/27] mfd: ab8500-core: Register sysfs attribute groups via devm_device_add_group()
Date: Tue, 27 Oct 2026 09:30:51 +0000
Message-ID: <20261027093306.2812695-23-lee@kernel.org>
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ab8500_probe() registers up to two sysfs attribute groups with
sysfs_create_group().  On AB8505 and AB9540 (cut 2.0 and later), the
second sysfs_create_group() call unconditionally overwrites the return
value of the first, and if the second call fails, ab8500_probe() returns
an error without removing the first group.  Because the driver context
is freed and driver data is cleared on probe failure, reading any leaked
sysfs attribute dereferences a NULL ab8500 pointer in
get_register_interruptible().

Register the attribute groups via devm_device_add_group() and only
register the second group when the first succeeds so that devres
automatically cleans up registered sysfs attributes on probe failure.

Fixes: 93ff722e8853 ("ab8500-fg: Add power cut feature for ab8505 and ab8540")
Closes: https://sashiko.dev/#/bug/linux-a9ac1a9d-5a97-4ad3-b4c5-c7775c24a333
Cc: stable@vger.kernel.org
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/mfd/ab8500-core.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/mfd/ab8500-core.c b/drivers/mfd/ab8500-core.c
index 86fa99022cb3..408bad2f577a 100644
--- a/drivers/mfd/ab8500-core.c
+++ b/drivers/mfd/ab8500-core.c
@@ -1232,16 +1232,13 @@ static int ab8500_probe(struct platform_device *pdev)
 
 	if (((is_ab8505(ab8500) || is_ab9540(ab8500)) &&
 			ab8500->chip_id >= AB8500_CUT2P0) || is_ab8540(ab8500))
-		ret = sysfs_create_group(&ab8500->dev->kobj,
-					&ab9540_attr_group);
+		ret = devm_device_add_group(ab8500->dev, &ab9540_attr_group);
 	else
-		ret = sysfs_create_group(&ab8500->dev->kobj,
-					&ab8500_attr_group);
+		ret = devm_device_add_group(ab8500->dev, &ab8500_attr_group);
 
 	if ((is_ab8505(ab8500) || is_ab9540(ab8500)) &&
-			ab8500->chip_id >= AB8500_CUT2P0)
-		ret = sysfs_create_group(&ab8500->dev->kobj,
-					 &ab8505_attr_group);
+			ab8500->chip_id >= AB8500_CUT2P0 && !ret)
+		ret = devm_device_add_group(ab8500->dev, &ab8505_attr_group);
 
 	if (ret)
 		dev_err(ab8500->dev, "error creating sysfs entries\n");
-- 
2.56.0.307.g5fe7bd680c-goog


