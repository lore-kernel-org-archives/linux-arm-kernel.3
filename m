Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E14DFF6E9A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 00:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LKaGTOrqZcxKvrHo8N4IUQRt0r4j/J4rRNSb5TciUI0=; b=1NqpdSORalKQPfX3K0sng3ZV0h
	SMTfV6lscNwkJV+qydZb1qblt5WX0IhETcYVIuspXezIgeukGyZsgwa2ZP1jc5Cg8nPnA1FrwEHxF
	2PaiRYAKOKDObePQhV3pwUolIUVF84p8ttnFMgZXlDU491s1IuVu+2EshNKw6kJyLGxmP0MF4dbYf
	gxTZhHuzEzZv8kyRczj8B02vlI22amhcWD6/Of+bZH7q1lccF8Ujif9YrrbnywYZ0krFRuBLXLYnq
	to0VJOWzRSZ3n0DUtLGffrL0iIUs4deRAhIrbGBlfC+pAGJpEQl6ph4FHMZ2DbuL8Cd1GkVbBby8y
	5TDBhC1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ejs-00000007VRm-2hvK;
	Wed, 18 Mar 2026 00:26:20 +0000
Received: from out-187.mta1.migadu.com ([95.215.58.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ejq-00000007VR1-0owi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 00:26:19 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773793573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LKaGTOrqZcxKvrHo8N4IUQRt0r4j/J4rRNSb5TciUI0=;
	b=V6kUOF9izPgwxqn688/GhS2jWVlpmci1OwHZsQVdm1WMgIUlyJoWAhY5tKS/qcPMxpGlrt
	PrjQMlI+dS2XEIkpcuPWx6pAKPNiZH3/C7dfhjnLYo6aRsaTpuCN3wKt7MSsTiwdrZTWZ+
	MWnGLyv4UxUm+J9tTHRY55OmgspoZTQ=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] stm class: Remove unnecessary local variable in stm_write
Date: Wed, 18 Mar 2026 01:25:39 +0100
Message-ID: <20260318002537.3692-3-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1036; i=thorsten.blum@linux.dev; h=from:subject; bh=1wDZ/HMl0g5Jdcn/1cbS5yrAyqqs/m9L5E9FQkQO0W4=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJk7PzKt3y20ovH4r9txImzyJ3osDVPCTitNV72yhl+kc dffWcWyHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCRj28ZGc68fpNjUNzYd9lx 6irNuuuBsSWf9p6YHePCE9vJ6nF+ewnDfz8Bqy1Pm4u0VDcEiXRvWn3CIdeKQ6vl8Mc8yxo3o79 RzAA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_172618_383911_6176B691 
X-CRM114-Status: UNSURE (   8.61  )
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

The local variable 'err' and the corresponding if check in stm_write()
are unnecessary. Remove them.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/hwtracing/stm/core.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
index 37584e786bb5..4e0ee8e2e2c3 100644
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

