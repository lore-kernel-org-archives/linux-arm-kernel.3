Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC65960A6F63
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 12:16:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=evq+3jLn;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XgQaPU/t
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3sV2BVll+rmA+nzXI9MkZz3cUVSsRVhz3ZropH017dE=; b=evq+3jLnLlB+aScfE+YrLPpZbe
	77xI9xzHBhz87LxRVoyPa0WD4eLD96rZk4xtQsBUDt7X+XLHnwRxT3/bBMuZuFggO58+OwJmBBEcz
	PG94xBGUWibSMrsPwTPexi7+p4jy8kRp4aFRK2JLHiSdzHyhNDtFoUMABiSFFHY+kxchTZv36eTPg
	aO/BDV56OPshhlxd8d52YCixyq/AvgPGhCUdJe89ppktvVMzAhu3LC9GIwAaorrdI/CXgdy5upKxf
	z7DkPEKNXjESffrzW13TWIaZxGarHmMzp8N4BAMaKhyXx8ZzY5297LX5KT1DG6W0q/f+HN8ODTeUd
	ZUjUdAlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJVEy-0000000Bmfs-45gW;
	Wed, 21 Oct 2026 12:16:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJVEy-0000000Bmfh-0el3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 12:16:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C1AD7406CF;
	Wed, 21 Oct 2026 12:16:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 267711F000C4;
	Wed, 21 Oct 2026 12:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792584979;
	bh=3sV2BVll+rmA+nzXI9MkZz3cUVSsRVhz3ZropH017dE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=XgQaPU/tHQ9qG5+iV9rAw//oA7KdsmgdtJivOyAzjRyPRZhJyaUG8Qmo7JlBY5qTu
	 nrTF6ZrnMzc5lpbtM2AwahvSfgGOFd/7DXE3cyMAJywI9mm5dfP9dJWWX8Nr9sl7iA
	 rDxHBhN1UJDOsEFqj8feYfo5Xs8GFo+yfoqTCDsPzLph07QM3Zp5JKv4mcKtFT4OIe
	 Nvxpvz3MrQVhSAjwNYErptApnZNz5Wj3egVYqWoTOsBicl06purDm7MYA2HL6BB1BU
	 aMfM/E2CHHg1ZjCX3ERNx7fMVSBk+eZrG+nT+iS7Sdki1LWfiuSZJhdJyILcnKpgBq
	 0aMsEnmmmHnqA==
From: Lee Jones <lee@kernel.org>
To: lee@kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Mattias Wallin <mattias.wallin@stericsson.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
Subject: [PATCH 22/28] mfd: abx500-core: Unregister device ops on devm release
Date: Wed, 21 Oct 2026 12:09:44 +0000
Message-ID: <20261021121245.3111563-22-lee@kernel.org>
X-Mailer: git-send-email 2.56.0.218.g1ec904b173-goog
In-Reply-To: <20261021121245.3111563-1-lee@kernel.org>
References: <20261021121245.3111563-1-lee@kernel.org>
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

abx500_register_ops() allocates struct abx500_device_entry via
devm_kzalloc() and links it into the global abx500_list without
registering a devres cleanup action.  If a caller's probe function
subsequently fails, devres frees the entry while it remains linked in
abx500_list, causing use-after-free and list corruption on later
traversals.

Register a devm_add_action_or_reset() callback in abx500_register_ops()
to remove the entry from abx500_list before devres frees it.

Fixes: c211b6b9c014 ("mfd: abx500-core: Convert to managed resources for allocating memory")
Closes: https://sashiko.dev/#/bug/linux-6a9c6b8b-8f89-4af5-8cb1-102822e44e6e
Cc: stable@vger.kernel.org
Signed-off-by: Lee Jones <lee@kernel.org>
---
 drivers/mfd/abx500-core.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/mfd/abx500-core.c b/drivers/mfd/abx500-core.c
index e896531d0354..5873e335c395 100644
--- a/drivers/mfd/abx500-core.c
+++ b/drivers/mfd/abx500-core.c
@@ -5,6 +5,7 @@
  * Author: Mattias Wallin <mattias.wallin@stericsson.com>
  */
 
+#include <linux/device.h>
 #include <linux/list.h>
 #include <linux/slab.h>
 #include <linux/err.h>
@@ -33,6 +34,21 @@ static void lookup_ops(struct device *dev, struct abx500_ops **ops)
 	}
 }
 
+void abx500_remove_ops(struct device *dev)
+{
+	struct abx500_device_entry *dev_entry, *tmp;
+
+	list_for_each_entry_safe(dev_entry, tmp, &abx500_list, list)
+		if (dev_entry->dev == dev)
+			list_del(&dev_entry->list);
+}
+EXPORT_SYMBOL(abx500_remove_ops);
+
+static void abx500_unregister_ops(void *data)
+{
+	abx500_remove_ops(data);
+}
+
 int abx500_register_ops(struct device *dev, struct abx500_ops *ops)
 {
 	struct abx500_device_entry *dev_entry;
@@ -45,20 +61,11 @@ int abx500_register_ops(struct device *dev, struct abx500_ops *ops)
 	memcpy(&dev_entry->ops, ops, sizeof(*ops));
 
 	list_add_tail(&dev_entry->list, &abx500_list);
-	return 0;
+
+	return devm_add_action_or_reset(dev, abx500_unregister_ops, dev);
 }
 EXPORT_SYMBOL(abx500_register_ops);
 
-void abx500_remove_ops(struct device *dev)
-{
-	struct abx500_device_entry *dev_entry, *tmp;
-
-	list_for_each_entry_safe(dev_entry, tmp, &abx500_list, list)
-		if (dev_entry->dev == dev)
-			list_del(&dev_entry->list);
-}
-EXPORT_SYMBOL(abx500_remove_ops);
-
 int abx500_set_register_interruptible(struct device *dev, u8 bank, u8 reg,
 	u8 value)
 {
-- 
2.56.0.218.g1ec904b173-goog


