Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0B0FDEE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 17:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5ER9gURroTpuT4tZlZV/ib+UUqsH+kpj9vHrGJkN3w=; b=1XULIAxN3j3nCFT1avxn1vz8dx
	oYnRtZ9JFkTnL363vYRsJm79wWQtNw9bVLfF0jQ1bG6Gls4BikCKD4Qt0R9kVi3eRSQhP78NS3q38
	319rWHJ5m8Tw72cMkEEqobgZNV0Ia3U6xZpVZbu1m9dL2z4JP5XAe24QOxXLYIQh0ZaZpxFn4cnbn
	DyA9JO4THVVschsVHEKB8KNw5pHJdMOA+IDLN1x9P81X/M5mE8JK66izhu6DFtemuRsSejpup9V/a
	zKcuoB5ruE/eFWiGONGT2iB09zGIYXd8U2f3eTfQgjCEXFHNHrU2ZIbYVzRiTA5h7LoVCksaKiNft
	HgZwPvSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxmL-0000000C2KU-0B7W;
	Thu, 23 Apr 2026 17:23:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxmI-0000000C2Jg-2yme
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 17:23:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C89D44537;
	Thu, 23 Apr 2026 17:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98BCFC2BCAF;
	Thu, 23 Apr 2026 17:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776965030;
	bh=utWF0d0OTuccjyhZepa4vlGkotpk1+a6M/3wp4m9N20=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pmxabPHxcbHN0RlKvKSMpaq9ZoNTBviY0q5JpEZT4QOAqfPRJodQGKxXema5vnoff
	 adiiBGOkPU9HizmPx3U173CKN6FnN6Gittu+j1l/0xWxRseYy1gTCsgJAGYSuU5JO5
	 xBlKIt4fLgQ/iXjGXc7kOGS3fOxfhDrRwCugxXjKyhSepnRqeuexY+1zL/UeKiDvyq
	 XuUXBHoW/b4FoSIfzzfDouQSInZj4fLa+nvRHGtLLF1VJToF/v/I3UnDaeF6SoHy9z
	 45gjmLzOlRKIRhnkcSVWxuproHIwtM+rAo5n1oDDwAlj1DlY7DS/XVX99asLEqRIGs
	 S19ptdQJ21ydg==
From: Sudeep Holla <sudeep.holla@kernel.org>
Date: Thu, 23 Apr 2026 18:22:51 +0100
Subject: [PATCH 1/8] firmware: arm_ffa: Check for NULL FF-A ID table while
 driver registration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-ffa_fixes-v1-1-61189661affe@kernel.org>
References: <20260423-ffa_fixes-v1-0-61189661affe@kernel.org>
In-Reply-To: <20260423-ffa_fixes-v1-0-61189661affe@kernel.org>
To: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Jens Wiklander <jens.wiklander@linaro.org>, 
 Sudeep Holla <sudeep.holla@kernel.org>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_102350_911718_5B448BF9 
X-CRM114-Status: GOOD (  11.42  )
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

The bus match callback assumes that every FF-A driver provides an
id_table and dereferences it unconditionally. Enforce that contract at
registration time so a buggy client driver cannot crash the bus during
match.

Fixes: e781858488b9 ("firmware: arm_ffa: Add initial FFA bus support for device enumeration")
Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>
---
 drivers/firmware/arm_ffa/bus.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/arm_ffa/bus.c b/drivers/firmware/arm_ffa/bus.c
index 9576862d89c4..601c3418e0d9 100644
--- a/drivers/firmware/arm_ffa/bus.c
+++ b/drivers/firmware/arm_ffa/bus.c
@@ -26,6 +26,8 @@ static int ffa_device_match(struct device *dev, const struct device_driver *drv)
 
 	id_table = to_ffa_driver(drv)->id_table;
 	ffa_dev = to_ffa_dev(dev);
+	if (!id_table)
+		return 0;
 
 	while (!uuid_is_null(&id_table->uuid)) {
 		/*
@@ -123,7 +125,7 @@ int ffa_driver_register(struct ffa_driver *driver, struct module *owner,
 {
 	int ret;
 
-	if (!driver->probe)
+	if (!driver->probe || !driver->id_table)
 		return -EINVAL;
 
 	driver->driver.bus = &ffa_bus_type;

-- 
2.43.0


