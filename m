Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DDDC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 16:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aTjTXNevyq42H2/931vTTzWoABm8SlHb9wd21Xv3pkY=; b=pfSy4BHhADbQBRZFUD2U325Vuc
	NT66EgTO5vzlI9dpSIX5rJ7FXWPD8utVi2OAvSc4BLtSfgMtaxwNoqwysiETbSO76IinFAMyZ+v5u
	BQ7a2UFaZHdnegAmxZssIJ18XtEWNpYvXBFRl7l4tZXDx3kNRo6u57tt/LF/9kEAJbKiCQV76tQ47
	mDQoiEK4plfDlTu68hu1Zy6pXju0EGsjN7sJOJ8VKDb6zJ7MVdS2bU+xO/rFprwulT+c5+ilg48AH
	FYcdgSNRtpuPkEH3wCHY82fIcEeMZVLzSMAZcROqHSNs/PbBk8AdeoVYpDdbFwpY77g5oVbWDNGRR
	ukIFQKSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RTN-0000000Cg8l-2AU2;
	Tue, 01 Sep 2026 16:36:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RTL-0000000Cg7y-06as
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 16:36:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C58D1BD0;
	Tue,  1 Sep 2026 09:36:25 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 24FB53F85F;
	Tue,  1 Sep 2026 09:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788280588; bh=iMtaS5GWT0jFESE4RL7PHAY9JqupVahiVJckgzwls+w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SRUlRGABFptdnM91OaKeohvJHQbHyEn2+3wfjPHtipzXJaGlc2SHnJtgkYwIq9DsT
	 4pMjceAzzKGlveJpmnuT2JWOYgSHpGjOUDOWpXgPx9ftKpg47xsCKfaTdxjiCItYw1
	 xCmpAwHWrwqSQ4GwAj7XyCKQup8Evhv9J6N8JUV8=
From: Leo Yan <leo.yan@arm.com>
Date: Tue, 01 Sep 2026 17:36:15 +0100
Subject: [PATCH 1/3] perf/core: Export perf_event_itrace_started()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-perf_suppress_itrace_start_records-v1-1-c4fbc6860859@arm.com>
References: <20260901-perf_suppress_itrace_start_records-v1-0-c4fbc6860859@arm.com>
In-Reply-To: <20260901-perf_suppress_itrace_start_records-v1-0-c4fbc6860859@arm.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@arm.com>, 
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, coresight@lists.linaro.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788280584; l=763;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=iMtaS5GWT0jFESE4RL7PHAY9JqupVahiVJckgzwls+w=;
 b=woIwLWnXbrAOStcXTnYAgUT0ItWKPN5TCRiHcwDNRnJiYUEnHPoXJW0xbje5sbpQoQh4eulHW
 lhsfg+a9tr0A5nte1YqsAA1PfTBZPvmYbFbA1YsPbVtdKBTbGghkBgd
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_093631_104207_C369AFB1 
X-CRM114-Status: UNSURE (   9.72  )
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

Since Arm SPE and CoreSight drivers can be built as modules, export
perf_event_itrace_started() so that it can be used by these modules.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 kernel/events/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/events/core.c b/kernel/events/core.c
index a6c8e38a311042afab6b65814a84c67b87ba929b..8afe89179a62127eebae0f38f29cde045ba56251 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -10560,6 +10560,7 @@ void perf_event_itrace_started(struct perf_event *event)
 {
 	WRITE_ONCE(event->attach_state, event->attach_state | PERF_ATTACH_ITRACE);
 }
+EXPORT_SYMBOL_GPL(perf_event_itrace_started);
 
 static void perf_log_itrace_start(struct perf_event *event)
 {

-- 
2.34.1


