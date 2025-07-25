Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C99DC83F26
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 07:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M6nuRxtELZntDjB9h69rDkTQPFgdfIrPnrFInhSdP8E=; b=L7vryw0CeQdClsiXwzXfk9gRKn
	csKf39sHYnVAkY9UGSOxqVVWS2BWCfLA2XFRx/YDwvhjLjm11rRgOT4vfb09AGn2/BFAcvBVNmi4D
	VJ4DYKnF2BZn24Ww89OsN35gno21cs3QK+hkAeB0CrsxmdWcgdVok8JHoTYwXxzoelDlDM9aQeTZ8
	iqo0ui0WgkSEYy8Y0jtLl8+ay/hwMz1uqV0wBRF3DURDpGiCIhETyKTj43Me+nEHzXjrWASI4Odz5
	ZN3ZncNGtKynZu3vfYWYCy6/rMzaEDgTXrngmXUfoCMTLZ0RdQaRMmTmVhTnnSPu8ffJKIq68cpKt
	0e/egBdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufCeZ-00000009FBb-1kj2;
	Fri, 25 Jul 2025 07:15:39 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufCXM-00000009EBY-0qKO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 07:08:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1753427292; x=1784963292;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=M6nuRxtELZntDjB9h69rDkTQPFgdfIrPnrFInhSdP8E=;
  b=QXrfRCB0trK882GStpOVfWSeMs5wNPmxu5c+OhfVtEo+/Q5mbs+aYAbJ
   cyepXnhniKjWwXuG5E/8O1OsfETp50hg3v39hd3x22WHC4PdnhoTVqxzm
   KcnBkyl73up8mEpul+0UzIZfbbj+wf7hQcKNb2+chyPcN+xIkIohE13dH
   IlfxM1ZH5J05nLCWVbrvLQA+pTdiESlMDxUz3bkK6o9SH9FDNdu++tNdY
   7gyytnQQHdhKw4Eyhbq/UnAsSbvNJsFG5TIB0Bv/xj5Guxskv3aI0gYdL
   iJAykn8JGXa9xaLWg3oqTuFHz8ciEDdaueX+cqkB829igRyFnR+hSLjRP
   A==;
X-CSE-ConnectionGUID: gHxpVgQ/SjC1lUFhmXG7vQ==
X-CSE-MsgGUID: GnFy7sS6SDuH0SIgq5Y/AQ==
X-IronPort-AV: E=Sophos;i="6.16,338,1744063200"; 
   d="scan'208";a="45414673"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 25 Jul 2025 09:08:10 +0200
X-CheckPoint: {68832D5A-3-4FC15ADB-CD71293B}
X-MAIL-CPID: E5C49D879E08C065B2E90774F3BA4A44_0
X-Control-Analysis: str=0001.0A002121.68832D05.0045,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id AC9D41736DA;
	Fri, 25 Jul 2025 09:08:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1753427285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=M6nuRxtELZntDjB9h69rDkTQPFgdfIrPnrFInhSdP8E=;
	b=V7u/p1g/N6DiURgk4wF4ZlDZs+EGZwvvq/6FM+Ys/prtGOGgRIujY0SQoo4LjmJhLlGZ5a
	0t8XZLY1HR+8uCGrwzTBVoPQZji/TASEuCLiURSk4SKt5RWZiYgsOdUe0z0BEAcRn0lQLc
	Pe93BaY67Rxh5Gz/c+MmDkiWrmFPhSRwRWJp1+bdhzbBnbH4hAfwiYLY6vgc/pr9wRNHQE
	eXADSWyzUb8BJ4VQoudX17idCUkOcUahbpRoDAAt+t+0IYonp7GYnACOjg8Fm/ctqt5+Zq
	YC483H/69EgGAuXgo4FWH7tfiLcsHDadwwp1arL4eVpQa8xOEfv/iDk6GBvNcQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] mfd: stmpe-i2c: Use module_i2c_driver to remove boilerplate
Date: Fri, 25 Jul 2025 09:07:50 +0200
Message-ID: <20250725070752.338376-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250725070752.338376-1-alexander.stein@ew.tq-group.com>
References: <20250725070752.338376-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_000812_395659_969D4F87 
X-CRM114-Status: UNSURE (   9.39  )
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

Driver implements feature of module_i2c_driver() manually. Replace it by
that macro instead.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 drivers/mfd/stmpe-i2c.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/mfd/stmpe-i2c.c b/drivers/mfd/stmpe-i2c.c
index fe018bedab983..145836320c170 100644
--- a/drivers/mfd/stmpe-i2c.c
+++ b/drivers/mfd/stmpe-i2c.c
@@ -122,18 +122,7 @@ static struct i2c_driver stmpe_i2c_driver = {
 	.remove		= stmpe_i2c_remove,
 	.id_table	= stmpe_i2c_id,
 };
-
-static int __init stmpe_init(void)
-{
-	return i2c_add_driver(&stmpe_i2c_driver);
-}
-subsys_initcall(stmpe_init);
-
-static void __exit stmpe_exit(void)
-{
-	i2c_del_driver(&stmpe_i2c_driver);
-}
-module_exit(stmpe_exit);
+module_i2c_driver(stmpe_i2c_driver);
 
 MODULE_DESCRIPTION("STMPE MFD I2C Interface Driver");
 MODULE_AUTHOR("Rabin Vincent <rabin.vincent@stericsson.com>");
-- 
2.43.0


