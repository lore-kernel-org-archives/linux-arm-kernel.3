Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5626FCA9EC1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 22:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=31NNt+tOEj9IETmcYC0m625yDjaTDn6gSMly4/mYoVc=; b=H9ULzgZEgHELLGZc3vFd3WzFR6
	iOm//Viir73umiYqciB6F2PA+UpLqPb/oKsJAPCo8pcghjN9zwRTIYB5iWDE+QEfRZM3WpufPzvcA
	Ajw+E9zQ77w1S1ECeC3GXAuUIGxsVRv98Ou3Ed174ycw1qO96Su8iBQsRLkolLiPAV1vxgvo6taGw
	eLjnLEDgCjva7z+y5lsTAxkWap7kj2OeLBnbh4ld3ps/YRXLCGxtvUmflJ2zt2z/xQCr+hVgeD0gP
	4kfL49Fl8czl08dJpB+nO/g3pmp7PBB++FYsUPwzMkZBUAFmKOB6SCRacFp5ucT0YV3+fhsiXBSLy
	/7TjRf9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFIyf-00000007HH3-2IsK;
	Fri, 09 Oct 2026 22:22:09 +0000
Received: from chamillionaire.breakpoint.cc ([91.216.245.30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFIya-00000007HDx-3bfy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 22:22:06 +0000
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=breakpoint.cc;
	s=2025; t=1791584523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=31NNt+tOEj9IETmcYC0m625yDjaTDn6gSMly4/mYoVc=;
	b=DLmLKbVgTcZE1nKZasoLvMV2gChjzd8BGzhYd/+vD9YWzuxffa+EdfD4MoulXpE+uRaAyN
	akBCzmQyLG8KTVQxMwYiax/Yiaf7guMeNN1OzatQCKhoxox5S4gAAFRRvXANSkn6V5cEEh
	9PwpcsZ7ziRqDNZZ7qw6ubKrAK01UAjTMsErJiTvqYeS8LWosADlGU/eCeO1xKM91+8Byp
	IDhwjAtHsJo7+AZv26gIrLNqHhr9uCjGQKRcHYBwHWGbMawSFAy7K2or799k7tZnHRIeOw
	DVmj61wWFbarSiaZE+NVLjk8sF9HNVnXynhLD9pyhUPIu/2H4o0atPUSq7f+pw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=breakpoint.cc;
	s=2025e; t=1791584523;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=31NNt+tOEj9IETmcYC0m625yDjaTDn6gSMly4/mYoVc=;
	b=5Yh7pz+LSF6hIbJ6VsWzhLqCY0m6SqX9JlqWiZGoKpFlv7vvqmt+L1A0d5YZPV2o79s7ja
	AnATYb+z3bcTX3Dg==
To: linux-arm-kernel@lists.infradead.org
Cc: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>,
	Russell King <linux@armlinux.org.uk>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 02/11] ARM: BUG: Spent each entry in __BUG__LINE() its own line
Date: Sat, 10 Oct 2026 00:21:09 +0200
Message-ID: <20261010-arm_warning-v1-2-ddf4be42ae0d@breakpoint.cc>
In-Reply-To: <20261010-arm_warning-v1-0-ddf4be42ae0d@breakpoint.cc>
References: <20261010-arm_warning-v1-0-ddf4be42ae0d@breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_152205_057432_647183B9 
X-CRM114-Status: UNSURE (   9.04  )
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

After the "3:" label the individual entries for the struct bug_entry
follow.
Move the entries into their own line which makes re-grouping later
simpler.

Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
---
 arch/arm/include/asm/bug.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/bug.h b/arch/arm/include/asm/bug.h
index 24f46d4f6e733..4c01e360ccfe0 100644
--- a/arch/arm/include/asm/bug.h
+++ b/arch/arm/include/asm/bug.h
@@ -35,8 +35,11 @@
 	.popsection;						\
 	.pushsection __bug_table,"aw";				\
 	.align 2;						\
-	3: .word 1b, 2b;					\
-	.hword __line , 0;					\
+	3:							\
+	.word 1b;						\
+	.word 2b;						\
+	.hword __line;						\
+	.hword 0;						\
 	.popsection;
=20
 /*

--=20
2.55.0


