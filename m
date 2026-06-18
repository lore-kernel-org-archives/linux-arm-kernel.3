Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3FB2CD98F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 15:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PzT4ZWHN3kY7S+aQcOnEynBSiaB6UnRl0XOCvqXZNdk=; b=bizAlB+ySw265i7duBs6Ql0Yd4
	EzmSSTwi3+U/xV4q6i/UQc7UGkl6zm8GFbdsRpQpZYuCEJ6L8q3nAtGZsAZWpxpULdbAUf+xwh4Bz
	YLbCMfjtGsK+Y0zVZIJYnN+r6soi/a/5Mq8Q35sXlCBnN3nrV94Uj3VCC/sDrqfsi7k/gkUy1i49A
	9P1Cyd5X/Go601M+BBs1Wdh3yCgn5jsKoLIVcBjlqF7ShUw1m92PO+mjzB3zN6hHpcLihiw9UVWFH
	FTuwiZbDlRDdcPj+vnys1ZqhF8XXMClkXkToRpJKFIJ1P210ojP1dCOZpN+lU/K7IOuunOGDcmd76
	UqjtdyXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waF17-00000001WEV-2cYM;
	Thu, 18 Jun 2026 15:50:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waF0v-00000001W3x-34Wa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 15:50:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AAEF248FF;
	Thu, 18 Jun 2026 08:50:40 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF09C3F62B;
	Thu, 18 Jun 2026 08:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781797845; bh=bRnY8fOypMVT0Ph5FZZFEtGJVpNYUHCPksvrdnGDBx0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=o1q+t7HmdRRj37S2FcuSLCfvyeL4aSjCuajAoerz6VSXKq2wpa/n+ldVnCG5vsyIU
	 qgJWwA8YxDZpVxjwaFdl9/dveiOiBL4Ru2oT1eashH+lsMHHAIL7YDPqj14IZzIZxV
	 MyydYtB+nkLQ2wCwJGb+/iTQ3TLHNkZdPgwPeUeM=
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: will@kernel.org,
	julien.thierry.kdev@gmail.com,
	maz@kernel.org,
	oupton@kernel.org,
	jean-philippe.brucker@arm.com,
	andre.przywara@arm.com,
	suzuki.poulose@arm.com,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: [PATCH kvmtool v2 6/7] util: Allow die_perror() to take a variable list of argument
Date: Thu, 18 Jun 2026 16:50:00 +0100
Message-ID: <20260618155001.226266-7-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618155001.226266-1-alexandru.elisei@arm.com>
References: <20260618155001.226266-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_085045_826663_7A98C7F3 
X-CRM114-Status: GOOD (  12.32  )
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

Make die_perror() more similar to die() by allowing the user to specify
a format string and arguments.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 include/kvm/util.h |  2 +-
 util/util.c        | 17 +++++++++++++++--
 2 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/include/kvm/util.h b/include/kvm/util.h
index ac8515f8c46b..a6dba1147d68 100644
--- a/include/kvm/util.h
+++ b/include/kvm/util.h
@@ -41,7 +41,7 @@
 #define MAP_ANON_NORESERVE (MAP_PRIVATE | MAP_ANONYMOUS | MAP_NORESERVE)
 
 extern void die(const char *err, ...) NORETURN __attribute__((format (printf, 1, 2)));
-extern void die_perror(const char *s) NORETURN;
+extern void die_perror(const char *fmt, ...) NORETURN __attribute__((format (printf, 1, 2)));
 extern void pr_err(const char *err, ...) __attribute__((format (printf, 1, 2)));
 extern void pr_warning(const char *err, ...) __attribute__((format (printf, 1, 2)));
 extern void pr_info(const char *err, ...) __attribute__((format (printf, 1, 2)));
diff --git a/util/util.c b/util/util.c
index fc732200f2dc..6f41e2c1b008 100644
--- a/util/util.c
+++ b/util/util.c
@@ -1,6 +1,7 @@
 /*
  * Taken from perf which in turn take it from GIT
  */
+#include <stdio.h>
 
 #include "kvm/util.h"
 
@@ -98,11 +99,23 @@ void __pr_debug(const char *debug, ...)
 	va_end(params);
 }
 
-void die_perror(const char *s)
+void die_perror(const char *fmt, ...)
 {
+	char buf[1024];
+	va_list params;
 	int e = errno;
+	int ret;
+
+	va_start(params, fmt);
+	ret = vsnprintf(buf, sizeof(buf), fmt, params);
+	if (ret < 0) {
+		perror("vsnprintf");
+		buf[0] = '\0';
+	}
+	va_end(params);
 
-	perror(s);
+	errno = e;
+	perror(buf);
 	exit(e);
 }
 
-- 
2.54.0


