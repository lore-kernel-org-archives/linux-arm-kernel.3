Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8359ECAC592
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fW0tKmArF4zWTnzVKm0mzR07hZtUDU+CloW06fiXIm4=; b=0hk4LfJed9Xnx/Ye1McWWsFzIz
	pECXhJTU+OglzlEawwOj+7IrvGgnWOnmmA4lBqYGQsxV3Dwr9vl4bE5cVXZXcIVEZgAXlSiwBR7a9
	kExbiy2Z7Q2p604XP2naewhc7j8w6GcPTXiABQWHlXTWLUOXZY1rwIRxxQw5gYuBDsVJCYeQqGzTH
	loB36U5A5i/fNGI0j+LVFyZeWQJ+6fyA3grvQjRwDpJcBkhMVcVWFQ3DPHmfsQTHSPmEVaIj1zpUz
	qmoIJCq3hfqd/L7O6R1vWWD3j5Nhe6YgZ58kFveuhhtX2++nZLUUaQt+mWRmZZSv4ZF7pX6NAddCe
	Gv5PpQAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1v4-00000008mXf-0NJv;
	Tue, 09 Sep 2025 17:14:14 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvvYE-00000006Nl7-1Byc
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Sep 2025 10:26:15 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1757413572;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fW0tKmArF4zWTnzVKm0mzR07hZtUDU+CloW06fiXIm4=;
	b=gz2LuBn4Kz9SohMA7ramk/sb7qcJNdTDI1ykKVyC4oJqUFC7NUlJMt4JVeQeUdZqxpe1IM
	8k+pqWdG5w0MszaMjPwJc8Kj0F3IdDTtzQ1ez0nqkkkoa2GHq3AKjbQ57VcvAhifvBOhYA
	E5Mli3lTsYs56sYgHA9NtAhckTiA7aI=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] stm class: Replace kzalloc() + copy_from_user() with memdup_user_nul()
Date: Tue,  9 Sep 2025 12:25:14 +0200
Message-ID: <20250909102512.694203-4-thorsten.blum@linux.dev>
In-Reply-To: <20250909102512.694203-2-thorsten.blum@linux.dev>
References: <20250909102512.694203-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_032614_474368_80475AD7 
X-CRM114-Status: GOOD (  10.38  )
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

Replace kzalloc() followed by copy_from_user() with memdup_user_nul() to
improve and simplify stm_char_policy_set_ioctl(). Remove the obsolete
comment.

No functional changes intended.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/hwtracing/stm/core.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
index 5834f796e86b..335bcf749214 100644
--- a/drivers/hwtracing/stm/core.c
+++ b/drivers/hwtracing/stm/core.c
@@ -733,18 +733,9 @@ static int stm_char_policy_set_ioctl(struct stm_file *stmf, void __user *arg)
 	if (size < sizeof(*id) || size >= PATH_MAX + sizeof(*id))
 		return -EINVAL;
 
-	/*
-	 * size + 1 to make sure the .id string at the bottom is terminated,
-	 * which is also why memdup_user() is not useful here
-	 */
-	id = kzalloc(size + 1, GFP_KERNEL);
-	if (!id)
-		return -ENOMEM;
-
-	if (copy_from_user(id, arg, size)) {
-		ret = -EFAULT;
-		goto err_free;
-	}
+	id = memdup_user_nul(arg, size);
+	if (IS_ERR(id))
+		return PTR_ERR(id);
 
 	if (id->__reserved_0 || id->__reserved_1)
 		goto err_free;
-- 
2.51.0


