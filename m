Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12628C71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 18:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LEsltGg/noxC5plW3mBwagmInAE39UT1LVYFqPCTBPU=; b=abVztSRiSX/sxz
	I3d8hRrz9PbwYPyidazNhf/7TMncNJ+4tZV8aArfRJt9yIyJhaKD+FEmNMScjvIRTViyAIwHwmjtn
	FXZ2gy2RvCNnW+DS2BKj9kfS445GBRqJq1DU05Qfwu8j6QANUBOtHYtUGhp7pWFWfCq9X01x3tk7T
	SH2+y4MgVJFl2VNG8yalHou0JoKe57xPpXidkGvPwYVjpi7e21WkevYC53mACfyE6oWOXlNdoOSa+
	oEztZLkEx/0/l0TMVy7tlierXrQNwpjxDme5C04bnVf+IgtO4X+/m7PNeaiD9UttH3rvohyE0Idnm
	PWkKlMAUwOQWnD4CuiVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPl6-0000000AoJj-2VHx;
	Wed, 11 Jun 2025 18:01:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMga-0000000A8zV-27Wu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 14:44:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ECA7815A1;
	Wed, 11 Jun 2025 07:43:53 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B65203F673;
	Wed, 11 Jun 2025 07:44:12 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Subject: [PATCH 0/2] coresight: Dismiss smatch warnings
Date: Wed, 11 Jun 2025 15:44:00 +0100
Message-Id: <20250611-arm_cs_fix_smatch_warning_v1-v1-0-02a66c69b604@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADCWSWgC/x3M0QqDMAxA0V+RPK9gKzrZr4wRYs00D3YjkSqI/
 27x8cDlHmCswgav6gDlLCa/VOAfFcSZ0sROxmIIdWjrzntHumA0/MqOttAaZ9xIk6QJs3ddDEP
 Lz56bnqAs/solvPfvz3lej+BaIW4AAAA=
X-Change-ID: 20250611-arm_cs_fix_smatch_warning_v1-6c2b5e78e38a
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749653052; l=898;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=CfUDwEz0o4q6Tg+t8Qotnsdb9ujzfi4d8phm6HGHsRA=;
 b=szTrYED3wmaCJ78IptPhmb3eQOFfnwweHaGjljRQ2rD56J9C/JvhsSOTMNkKvtPeFNqRwLsEu
 S+rUfWEu8kXDq75jukLs8/XtQj19Hzt4LYYyLL6F/tCxR7P/MaPrdR3
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_074416_590580_9093DE8C 
X-CRM114-Status: UNSURE (   8.38  )
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

This series polishes the code to address warnings reported by the smatch
static checker.

Smatch reports a error "Function too hairy" for etm4x_sysreg_read() and
etm4x_sysreg_write(). This is a trade off to avoid large code blocks,
the implementation encapsulates logic using nested macros. But this is
not friendly to static checker. For now, the code will be kept as is.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
Leo Yan (2):
      coresight: stm: Remove redundant NULL checks
      coresight: perf: Use %px for printing pointers

 drivers/hwtracing/coresight/coresight-etm-perf.c | 4 ++--
 drivers/hwtracing/coresight/coresight-stm.c      | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)
---
base-commit: 408c97c4a5e0b634dcd15bf8b8808b382e888164
change-id: 20250611-arm_cs_fix_smatch_warning_v1-6c2b5e78e38a

Best regards,
-- 
Leo Yan <leo.yan@arm.com>


