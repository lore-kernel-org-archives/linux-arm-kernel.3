Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C5ED2D8F9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 11:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nnKd7x/vUhOTzGd8FoCvZV6tIq7PhtSSkjGuWUY1hLg=; b=K+0HTMW90zyzjpwT8JRK3dJ+zG
	PaQHh/ZGRNg/wlogBMQqJXA32kzYMboiLFYFibrYrE2EDimu3PZxAtrSclvUk49+iNUHV2HV4D55w
	Bqke/ovlsQStXY5c+EMfIyhTjp4rpeOl0YUkhS/n0ZHW6JD+yJLq8/s+gMQioT7bDxkmkXLkevx4h
	h5eJhMamjrop9U2rE28TeSAwtUTMoHD7ugcJh6bzRA+DAbgY9+mixt+CKGbloQggie0ul440awiDO
	yglVbJ98jmyBs8fRZW9Vztq9vE1qmruZtLbCnTaqLy2V6cBRi0qwhbxbFGIAQEA8C6/CnkqfJb6wU
	+/7p/sYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkguy-0000000E84P-2f6W;
	Tue, 27 Jan 2026 11:07:32 +0000
Received: from out-179.mta0.migadu.com ([91.218.175.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkgut-0000000E828-01pU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 11:07:29 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769512044;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nnKd7x/vUhOTzGd8FoCvZV6tIq7PhtSSkjGuWUY1hLg=;
	b=GUnq+62+JIvt2L6syHkyb4wlqFvKZ+plmGGr2LRmJ31JSFcdYZe8UNoVCUIGyMGFcOMizN
	7RruA3EgntlZQH9DfgsHOnbyeNw47OlNL1IA1mw0t8llsJ6P2Tsrkjh6Bl5Bwcnni4SOQn
	stU/B0Bq56oLlp6dehK6ekQxRRewAFs=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 2/2] stm class: Replace kzalloc + copy_from_user with memdup_user_nul
Date: Tue, 27 Jan 2026 12:06:53 +0100
Message-ID: <20260127110654.436657-2-thorsten.blum@linux.dev>
In-Reply-To: <20260127110654.436657-1-thorsten.blum@linux.dev>
References: <20260127110654.436657-1-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_030728_368395_433275A0 
X-CRM114-Status: GOOD (  10.08  )
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
simplify and improve stm_char_policy_set_ioctl(). Remove the obsolete
comment.

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
Thorsten Blum <thorsten.blum@linux.dev>
GPG: 1D60 735E 8AEF 3BE4 73B6  9D84 7336 78FD 8DFE EAD4


