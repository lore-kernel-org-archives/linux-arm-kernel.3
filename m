Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37BF3D6AAEC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 17:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hnQnlRNLWRBYJ2adhkVyrZB6k8P/ZToXFqlxV/C+eno=; b=pFNcKBztVozH9nqafxNC7uQfZr
	QOrWo8oU2iA6OJm+3TSVNmSd7sIvoguIgAlhdX0Tl+APtKGO6DMsWomH0PD/1l+L+Dto20GSDaCjZ
	2hFTnKctwxCwzjjPMw8XFEP/meraUUtPizhUU0YNNMjBjXEAWDVzTMehWPJngN57HHT1Ol6stgNTP
	6IqxFO6hboWXaUxKwjsZodQroTM2QEHCXVAqod1kra9spPj+futCvrnXHjcUyDQRjYZdxsbGn4J9l
	1bywQzbufwPkSmxaF2N8dJP/QIPvGL1oQXxM+MBoTiPvVmRiIxHPssYwe77sWP+Z9yc3LqrsnB1+O
	O42Y+1aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8LOh-00000000Z3Y-0KoT;
	Thu, 02 Apr 2026 16:59:59 +0000
Received: from out-170.mta0.migadu.com ([2001:41d0:1004:224b::aa])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8LOe-00000000Z2u-16s8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 16:59:57 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775149192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=hnQnlRNLWRBYJ2adhkVyrZB6k8P/ZToXFqlxV/C+eno=;
	b=jhPLdVJ3ZrNZYk3Pyt/IoBeHl4k5e3RUV8qzh5weS9XrgSLmTwfWasLfnWiTqts2mCqd6a
	Gxp9X/3iw9Eatu+/e6EIdNfcFtDnwmd+7A3qlK2BGUO+eNArIk+bTRPDZPHRWiyB/I0vh/
	bjFbNLEEfTuwy6CIpbyTr+WZKFHR5hY=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 1/2] stm class: Replace kmalloc + copy_from_user with memdup_user
Date: Thu,  2 Apr 2026 18:59:35 +0200
Message-ID: <20260402165933.895706-4-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=978; i=thorsten.blum@linux.dev; h=from:subject; bh=KGm3LCDb6uenDpT0wQR4w1aCAHUzrT837r/6S14WP6A=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDJnnFpRe3nauPGqvvLiv1KTjYt2X3dqjf7suXOHAW3Ti9 F/ujTFKHaUsDGJcDLJiiiwPZv2Y4VtaU7nJJGInzBxWJpAhDFycAjCR+fMY/me4qykubbzvExdV dOPQ7Vn3tev2HFSUv/a5/ovLOcH+jJ2MDNtCHIKaYlc7NGzq8726P3t3f/Raw5WzV/dNnHyp5Lp MFxMA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_095956_446929_48D06905 
X-CRM114-Status: UNSURE (   7.68  )
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

Replace kmalloc() followed by copy_from_user() with memdup_user() to
simplify and improve stm_char_write().

Allocate and copy only 'count' bytes instead of 'count + 1' since the
extra byte is unused.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/hwtracing/stm/core.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/hwtracing/stm/core.c b/drivers/hwtracing/stm/core.c
index 37584e786bb5..49791024bb86 100644
--- a/drivers/hwtracing/stm/core.c
+++ b/drivers/hwtracing/stm/core.c
@@ -645,15 +645,9 @@ static ssize_t stm_char_write(struct file *file, const char __user *buf,
 			return err;
 	}
 
-	kbuf = kmalloc(count + 1, GFP_KERNEL);
-	if (!kbuf)
-		return -ENOMEM;
-
-	err = copy_from_user(kbuf, buf, count);
-	if (err) {
-		kfree(kbuf);
-		return -EFAULT;
-	}
+	kbuf = memdup_user(buf, count);
+	if (IS_ERR(kbuf))
+		return PTR_ERR(kbuf);
 
 	pm_runtime_get_sync(&stm->dev);
 

