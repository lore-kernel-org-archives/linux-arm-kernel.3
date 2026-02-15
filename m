Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D7F2E63F08
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Feb 2026 22:55:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0dol+NHPLVxGBr7EwvvNg45Z62kDSE3DsrG/8LSLc64=; b=OFBVamlX+HUITsv/IZoRupin4Q
	VSJH7nzm6qptjS3VmjDeXYIj7QxzwcJmqphUYsyDy01mxx2F8YXdm+/M3Ne0KZEiIj0/+rBp0Xlcw
	k47iRa6asMFZG1pucOepFqtRaLJDisP6yU8hvoLB7yi4nEsDuYJa1F4XFF2y54Y/6I6QAAXEMjIL+
	KdJSQjH7exBr3cpSkBB8fFBGHXjCwfReDEaZOFwZ36DZMJ8qCPcuYW+dY+cjlVNVp3CLhNWLOoOwU
	Cfxw7Q+R+vM8Ske5qF6qZ+HjYBUO4Jef967rVuK3M6MiK6JV0iAdxnuhpIu61W+c0+MCXctX6oVuH
	MHPH+8qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrl1Q-00000005jL1-3Zfd;
	Sun, 15 Feb 2026 22:55:24 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrl1N-00000005jJb-1qhN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Feb 2026 22:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=0dol+NHPLVxGBr7EwvvNg45Z62kDSE3DsrG/8LSLc64=; b=jrpVXE
	P2V4+0gOuzeaBVEVegS/MACha0j3v0mfLtRZFfOHftDT6MPGlnFmHZn24f2Xue2c
	Iie7NZkDxmzzP96pPRqHNDQBEaiEGjeeeK1+tv4XDeOnnm7p4CPVRHEwVPLuTtm4
	LXpMlGAyZOUmwjZ9ZJycTrzowCtoFawe2o+XmFkX35RDcVtum1Ikou17zWWh+m91
	Pxls5i64DncEY0+oqyMT0zrors+iuwsYMId+FEmOGEtFCRfrJykZbUTt10z8AvAw
	WoiG/AQRqwVQZ3vltK4IytxwG1NcB8/BC2SWyaR27Zioz/kNDuD+FMN/nLaGG6JS
	4hKe6CnZ1oUTQtnA==
Received: (qmail 3011387 invoked from network); 15 Feb 2026 23:55:07 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Feb 2026 23:55:07 +0100
X-UD-Smtp-Session: l3s3148p1@6tnRuuRKeIQujns5
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	linux-omap@vger.kernel.org,
	linux-remoteproc@vger.kernel.org
Subject: [RFC PATCH v2 03/13] hwspinlock: omap: use new callback to initialize hwspinlock priv
Date: Sun, 15 Feb 2026 23:54:43 +0100
Message-ID: <20260215225501.6365-4-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
References: <20260215225501.6365-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_145521_790512_2937981A 
X-CRM114-Status: GOOD (  12.65  )
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

Apply the new helper to avoid using internal structures from the core.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 drivers/hwspinlock/omap_hwspinlock.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/hwspinlock/omap_hwspinlock.c b/drivers/hwspinlock/omap_hwspinlock.c
index 5bf0061d3fd6..9a9cb3692348 100644
--- a/drivers/hwspinlock/omap_hwspinlock.c
+++ b/drivers/hwspinlock/omap_hwspinlock.c
@@ -66,10 +66,18 @@ static void omap_hwspinlock_relax(struct hwspinlock *lock)
 	ndelay(50);
 }
 
+static void *omap_hwspinlock_init_priv(int local_id, void *init_data)
+{
+	void __iomem *io_base_ofs = init_data;
+
+	return io_base_ofs + sizeof(u32) * local_id;
+}
+
 static const struct hwspinlock_ops omap_hwspinlock_ops = {
 	.trylock = omap_hwspinlock_trylock,
 	.unlock = omap_hwspinlock_unlock,
 	.relax = omap_hwspinlock_relax,
+	.init_priv = omap_hwspinlock_init_priv,
 };
 
 static int omap_hwspinlock_probe(struct platform_device *pdev)
@@ -116,11 +124,8 @@ static int omap_hwspinlock_probe(struct platform_device *pdev)
 	if (!bank)
 		return -ENOMEM;
 
-	for (i = 0; i < num_locks; i++)
-		bank->lock[i].priv = io_base + LOCK_BASE_OFFSET + sizeof(u32) * i;
-
 	return devm_hwspin_lock_register(&pdev->dev, bank, &omap_hwspinlock_ops,
-						base_id, num_locks);
+					 base_id, num_locks, io_base + LOCK_BASE_OFFSET);
 }
 
 static const struct of_device_id omap_hwspinlock_of_match[] = {
-- 
2.51.0


