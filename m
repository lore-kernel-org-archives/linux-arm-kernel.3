Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5614CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 14:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L7c94zjHt1bNKMcE6C2ppqxs3cIZ/nVdUVOcHMFeI7c=; b=W9TvysZNkVtZLFPgsAzef4Aase
	8jfRnfOg8w7FVRhO4mad3KqqHhP35cufNjR+Nte9mVLawsqU4eyQyyWMN6XidHf27dD/Mob6zkWKj
	dUVwbSI1yB+vjfZRg06xa0ST9yoklp56Ok1l5TlGbZa6U+LG13Bp5DNRxBJ6iOz6+Og1hlyJd7h5M
	q+dZLWyjg9QS4ldY0YVhTbhGcWH1ix6AcfQfPJwEXL1NwFk8iJ0TevNimHjICQsM4NlwkgZiy+ERz
	4hlIRstdDBAJhkN5tcAykKusiAY6H1Ek5uEKBS6+2aRnZyXwCkJhOuaTqDvWm0fAALrUvaZNqbV9P
	fEsiSmsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLMUh-00000006iFb-1m1D;
	Fri, 08 May 2026 14:47:59 +0000
Received: from out-179.mta0.migadu.com ([2001:41d0:1004:224b::b3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLMUe-00000006iEj-33Ks
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 14:47:58 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1778251673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=L7c94zjHt1bNKMcE6C2ppqxs3cIZ/nVdUVOcHMFeI7c=;
	b=lAHo75R+QoYZI82YbQMcMGb15hVNWXgWNf4azy2zUL/JDFYN+CjLPtPeRuztsVaaW3YyXy
	scWI2fLEQMMQNCy1abPGVa8fESoJcHuYotameeWV5sVtdZUHffxl8HjO4ae6Ckbi3uER1e
	asU6KfQafUFiRPR6+iUlfGVpSOECw/E=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] stm class: remove unnecessary local variable in stm_write
Date: Fri,  8 May 2026 16:47:06 +0200
Message-ID: <20260508144705.3940-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1036; i=thorsten.blum@linux.dev; h=from:subject; bh=DprM5VsbFWom/d4IuDl2ijqlm6zvA0JIDercFKGcau4=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJl/v2d6q29SOBoVUOAZKRvNqntv49/Vy63urny5M1zz7 FM3N4UZHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjAR5e+MDJszmnNPBVwKe8IT ETlN21VFnev69SunZrL7FZ3R2LbkHAcjw475XPUH9TUPfgzLDyi/sifC9M5llsx5Sjtu5ajpLIj /zA4A
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_074756_975545_0C596A8B 
X-CRM114-Status: UNSURE (   8.54  )
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

The local error variable and the corresponding if check in stm_write()
are unnecessary. Remove them.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/hwtracing/stm/core.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
index f48c6a8a0654..edf3d69a84a9 100644
--- a/drivers/hwtracing/stm/core.c
+++ b/drivers/hwtracing/stm/core.c
@@ -602,17 +602,11 @@ static ssize_t notrace
 stm_write(struct stm_device *stm, struct stm_output *output,
 	  unsigned int chan, const char *buf, size_t count, struct stm_source_data *source)
 {
-	int err;
-
 	/* stm->pdrv is serialized against policy_mutex */
 	if (!stm->pdrv)
 		return -ENODEV;
 
-	err = stm->pdrv->write(stm->data, output, chan, buf, count, source);
-	if (err < 0)
-		return err;
-
-	return err;
+	return stm->pdrv->write(stm->data, output, chan, buf, count, source);
 }
 
 static ssize_t stm_char_write(struct file *file, const char __user *buf,

