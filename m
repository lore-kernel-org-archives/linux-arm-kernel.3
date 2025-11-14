Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95E45CE8D4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 16:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QZlnloDVP5vmwxiC7EMfXur1lHp1LWIvnS5y5fvEpOE=; b=S8/EwTs/myhgBzmJcMx8D7x70s
	X4ikblEcX2c+IzARCeCb00Pa70PCn39MhqWgDk23rt54E7ABhydDQ+jr8BPFEVJbwjs1LgzxAS5fH
	mnXCPDHFpSnc1HR0t+NcAneCtInZjaP53ly2rgEh3IE2KgOsyw1XAfIlK8qbnHePpIYV5vPoFuS4T
	/NQFNvPFA68BmzNoDDBX5ZVXSNS6XL7MDAEinlaW0hEPvsluJV/j9fsl/X9lce0M3oFQltxWWA+u7
	tQsoRAhasvtkaP/GQpH049BhbWhWZ5rkJpKWa5IFigbih5m6SuDXQiCGGKi/542hmp98clMUsCYaW
	SXPnWXtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwI6-0000000Ceem-2oy8;
	Fri, 14 Nov 2025 16:04:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJwI5-0000000CeeI-0H6C
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 14 Nov 2025 16:04:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=QZlnloDVP5vmwxiC7EMfXur1lHp1LWIvnS5y5fvEpOE=; b=ER5q5PEPeq1k9ePXCbBDw+sSpf
	LE1CWxUKkiV/1um9TRZCqK546lUYs2rF6urZws2k33P/fjvUdhod/GUZ63aSJGBoKeAKk1miSvNES
	5y9v0vuepLeXc2olsQ/ejTO0q9rtGRKOda9O2W0tOJGEupGfhqN6NFl1FjLKgohzjiAFHwE/UnbtO
	qZFetOOeidu7HU8WH4f6BGK5XHnhjYIHFbSudAF2+lumFeDkTSVcfpEPch7pS6UzOMSWTQUFQzYG6
	ju864Zk98Pwh4LYYfqHPXC7EBWD3pGkoBAHUbF5Y1T9eDyO+KfgkZ7a0Y+UFL8T/7Fj/F0yJxH20n
	TT3UDgTA==;
Received: from out-180.mta1.migadu.com ([95.215.58.180])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJvQM-00000002uub-37QY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 15:09:21 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1763136269;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QZlnloDVP5vmwxiC7EMfXur1lHp1LWIvnS5y5fvEpOE=;
	b=bIA4w7bzP88K201RhO5wgzEJc4E+yc81fX+/ClZ34zg3Ee855ptxF7vsJXwi4Xffp52W0k
	3QD6nUyZBUOEdTiszymEMGmkm9nduLAmgLiAjr0CMakO0Ro4xBhgDd4Jxta9gZusRXO7SM
	D6MwQBNdufxYJ11gBziSzddjs0Nlakg=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 1/2] stm class: Replace kmalloc + copy_from_user with memdup_user
Date: Fri, 14 Nov 2025 17:04:14 +0100
Message-ID: <20251114160416.230513-1-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_150918_957231_976EE65F 
X-CRM114-Status: UNSURE (   7.74  )
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
index cdba4e875b28..5834f796e86b 100644
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
 
-- 
2.51.1


