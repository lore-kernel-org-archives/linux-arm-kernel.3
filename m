Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6681073CA7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 12:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BHjPrtjfwAlGWJIWT48ap4PULHY0gsF9q/p9dnfj758=; b=F8/H2WMqvdjcXI23AWAqMZk1xI
	KckmOd3krs2bB2zOtgTkJ2AIFtORNxu1DW/Jdeh+JpydqtYxv+TU1hvreqQyrSIjWaBAmxU2/pyn/
	o93i0XWnD4s+lMNJWbEJxFNgq1IwhMjVRoWWajdHlHGMY6wHR7KNIDpQNzYYF+asxi1CJTrE3C7Xp
	isfB3cZhO6Kb1Q0CdBe10vKsLwBmj4yqgsG0t9Y9oZ01JJm4d4g67pQzeZSiFX5VKwFtGRaC76hqp
	0cRAIjN4QPGUPr6m5Z0KKwkDKr/fjdoPSWyNtR+vIev0ZAXV8RXgUxaH5b9Xg1vvAsB+5jk1SUPNf
	bNyddn6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAS4c-00000008qvz-1tF5;
	Wed, 08 Apr 2026 12:31:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAS4Z-00000008qvS-2Sk0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 12:31:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A5441E32;
	Wed,  8 Apr 2026 05:31:48 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 637D23F632;
	Wed,  8 Apr 2026 05:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775651513; bh=TKyDp+A1fq8pgmaCU4TVt8djQduPoqEPT/FQwY9cR/o=;
	h=From:Date:Subject:To:Cc:From;
	b=KA3gJBEwfERJbTbxXIAql0gsrDsa9nU2AH/7zGWyjnvYoAkziimxTxynnO709+yEC
	 ZwT/LkhZ+WY00dTy2YSiM9t1kNlu5RRJqvjXwDnGk2RYBqleITl1HgncJT7XtxhPeK
	 KMgcM6rc+TsojAHwL00EBDbPppSAl6KIjbTELZ/Q=
From: Leo Yan <leo.yan@arm.com>
Date: Wed, 08 Apr 2026 13:31:43 +0100
Subject: [PATCH] coresight: etm4x: Correct TRCVMIDCCTLR1 save and restore
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260408-arm_cs_fix_trcvmidcctlr1_typo-v1-1-6a5695363b46@arm.com>
X-B4-Tracking: v=1; b=H4sIAK5K1mkC/x3M3QqDMAxA4VeRXK/QxjGLryKjSJppwD/SUhziu
 6/s8oPDuSCxCifomwuUiyTZtwr3aIDmcZvYSKwGtPiyT+vNqGugFD5yhqxUVolEeVEX8vfYTdt
 6JOyiI/RQH4dyLf//4X3fPyfIWbRvAAAA
X-Change-ID: 20260408-arm_cs_fix_trcvmidcctlr1_typo-3382c27d1c28
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775651512; l=1592;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=TKyDp+A1fq8pgmaCU4TVt8djQduPoqEPT/FQwY9cR/o=;
 b=2U732zpwcRqZijRuf7mPai/6UcxcLL1/1eekIJSzAGvRrjLTgjtZ3PpHuWjxely0zgZWo+WYJ
 yKzfsvqewURDpfXp2+5EFjF/4sf2TquNqB3re/Z9fKF6mo8rfYqM066
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_053155_847698_7079EBB9 
X-CRM114-Status: UNSURE (   9.47  )
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

It is a typo to use trcvmidcctlr0 to save and restore TRCVMIDCCTLR1.
Use trcvmidcctlr1 instead.

Fixes: f5bd523690d2 ("coresight: etm4x: Convert all register accesses")
Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index d565a73f0042e3e0b21fcf9cb94009cc25834d3d..c370b6bf45ef26aff29ee71630f86eae2487069a 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -1979,7 +1979,7 @@ static int __etm4_cpu_save(struct etmv4_drvdata *drvdata)
 
 	state->trcvmidcctlr0 = etm4x_read32(csa, TRCVMIDCCTLR0);
 	if (drvdata->numvmidc > 4)
-		state->trcvmidcctlr0 = etm4x_read32(csa, TRCVMIDCCTLR1);
+		state->trcvmidcctlr1 = etm4x_read32(csa, TRCVMIDCCTLR1);
 
 	state->trcclaimset = etm4x_read32(csa, TRCCLAIMCLR);
 
@@ -2102,7 +2102,7 @@ static void __etm4_cpu_restore(struct etmv4_drvdata *drvdata)
 
 	etm4x_relaxed_write32(csa, state->trcvmidcctlr0, TRCVMIDCCTLR0);
 	if (drvdata->numvmidc > 4)
-		etm4x_relaxed_write32(csa, state->trcvmidcctlr0, TRCVMIDCCTLR1);
+		etm4x_relaxed_write32(csa, state->trcvmidcctlr1, TRCVMIDCCTLR1);
 
 	etm4x_relaxed_write32(csa, state->trcclaimset, TRCCLAIMSET);
 

---
base-commit: 971f3474f8898ae8bbab19a9b547819a5e6fbcf1
change-id: 20260408-arm_cs_fix_trcvmidcctlr1_typo-3382c27d1c28

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


