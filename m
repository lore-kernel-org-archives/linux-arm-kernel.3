Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF720CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 09:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yuMMfRji0QsBlO0qJt9H926jh5AK/yBWl814HSXET8M=; b=cv2zX9TA4Jq1Sc6dU2WkXPkrnu
	bPlPfiEUMBNSJlK2liaK1wZMIBYxEVcQXk8Uo28b6nLGohh4E/HwS4lW1WNo51OKHPkD3ymMb48PY
	iZCBO9k3OwzksX22WweVRIN4bbaXhTjb6npXrifVPtXPaM3pvXq4Y0XV7NfXLTMqFOyyetd5E9Tsw
	383O54F5FEjUtHqHkKfOGOy5abOpZyMETTZBMC5stxJz2lEYeuiPkFnpN2nEI/ZVglEFZzrRrV23N
	p2A5jRcjunIQAHNVYFauzsXFphDb5qY5FVljrDfWq3QetpVjwUOrpmpTkn0Z54KQ5cxsqubixyeQ0
	wesc/Yng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFqip-00000009V2q-3iZ3;
	Mon, 03 Nov 2025 09:19:31 +0000
Received: from out-170.mta1.migadu.com ([2001:41d0:203:375::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFqim-00000009UzR-2MR4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 09:19:29 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1762161488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=yuMMfRji0QsBlO0qJt9H926jh5AK/yBWl814HSXET8M=;
	b=VCc7uU0o3gSh/l2zJutUq3ddK4nxUqz1cGKERW42Fox8REh1n4QZ1C3ajAxTUc/t3yj+bK
	jNH2aLWTZ4pcGF2UCURHl76dmZqEyk1qBoGf2Qd3gooYiU4+ZXOhBrnTNyJHEAQBv6ycM0
	tDqDmry7YcsZhYMSC32HMLvzrNDlXOA=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] stm class: Remove unnecessary local variable in stm_write()
Date: Mon,  3 Nov 2025 10:17:41 +0100
Message-ID: <20251103091741.2728-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_011928_749697_CDBE1500 
X-CRM114-Status: UNSURE (   8.63  )
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
index cdba4e875b28..f3814e4ecf23 100644
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
-- 
2.51.1


