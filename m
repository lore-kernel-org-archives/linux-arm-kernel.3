Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3B53F588CA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 14:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UjeKjtZlwotUKGDOy+Kalk+sqs7pqDI57o31iwodyrQ=; b=ooZUcvzNWvnJOn09M0ZN+YKIX0
	Ha74/X6JTmKGEYVTqwxjdGxGrv1D5dsAGuMwJZPghUiC/aOuFdKMU8l8RcDtw6/etEE0wufZPLSQH
	uD2uq7ClsB7A7LtYmp0tFAexCkLvCP2g/BKWeptYutFaBCknqURbVcVaF1xy1RzIlx5XFgewTwcRV
	iEQzu1qzaZ/s/H2Ccb05LX7tV5jnB82Oh1d/HzmrfmrWzI7nt2IpF7Egmu4o+vjSTutAFr5UbX72p
	1/PqFfG11CsAYikIEJfvwp3LCpFBTnqwcEghp89nkebWpsxT5uoR32R/Xu+6CCk+rj6dyHVUJid7e
	JIQ32TNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEpFm-000000078Hf-2YHl;
	Mon, 20 Apr 2026 14:05:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEpFg-000000078F4-1UIv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 14:05:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3B14F16F3;
	Mon, 20 Apr 2026 07:05:21 -0700 (PDT)
Received: from eglon.cambridge.arm.com (eglon.cambridge.arm.com [10.1.196.96])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C7F0F3F7B4;
	Mon, 20 Apr 2026 07:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776693926; bh=F3U+K6ZQiMb8aa0rB/KFAjdATPzP2/rzGQFgRu8sc2w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cvCO8J4QSiNoLn0snRukEH7UDVdC4HNCPOxxy4MgSqCUaBvlKlhQTnIqqUzsqqQo+
	 fQnBQCp89nCQfIp6kQTI4OgiGKUwTb/WZTKTMUqvat/FQDZLnTs8BIhfgOUWYdi2rH
	 uiD4lNdTQzuz/dBgqDdo7x1e/ZeK3tf786XDbxsM=
From: James Morse <james.morse@arm.com>
To: catalin.marinas@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	will@kernel.org,
	Ben Horgan <ben.horgan@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	Zeng Heng <zengheng4@huawei.com>
Subject: [RESEND PATCH 2/3] arm_mpam: resctrl: Fix the check for no monitor components found
Date: Mon, 20 Apr 2026 15:05:15 +0100
Message-ID: <20260420140516.3892820-3-james.morse@arm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260420140516.3892820-1-james.morse@arm.com>
References: <20260420140516.3892820-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_070528_461575_5C4582C6 
X-CRM114-Status: GOOD (  11.55  )
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

From: Ben Horgan <ben.horgan@arm.com>

Dan Carpenter reports that, in mpam_resctrl_alloc_domain(), any_mon_comp is
used in an 'if' condition when it may be uninitialized. Initialize it to
NULL so that the check behaves correctly when no monitor components are
found.

Reported-by: Dan Carpenter <error27@gmail.com>
Fixes: 264c285999fc ("arm_mpam: resctrl: Add monitor initialisation and domain boilerplate")
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/resctrl/mpam_resctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 4205fb2ee312..1b0b37da12af 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -1407,7 +1407,7 @@ mpam_resctrl_alloc_domain(unsigned int cpu, struct mpam_resctrl_res *res)
 	}
 
 	if (r->mon_capable) {
-		struct mpam_component *any_mon_comp;
+		struct mpam_component *any_mon_comp = NULL;
 		struct mpam_resctrl_mon *mon;
 		enum resctrl_event_id eventid;
 
-- 
2.53.0


