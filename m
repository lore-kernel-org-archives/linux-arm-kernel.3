Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3314C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 08:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HSkAieVQa1JTe8qhVM2kCKaOCfjEKvx10b2NLcrDjss=; b=GjrO9iKvaZNxnvtejPk/iz2bgn
	AB+fhTvGLIHk09X2AVpwxqylSDDQHdRXfL2Z6TsWcdhQL6kebnc602fBtxH6Me8ew/yOWPLvKohWZ
	VmFOQezKht2Noqy4pdlNgCSnH0oP3ADLNvshGfbnh+Q07bXDbiv1cPkcLCfKB/T9Hj4S9Luio0HDU
	6BAI6nX2sOUZLuZ5JtiaS6ngON0ANHRGBR+o0d9JOlaI2+AXP+zzkU2PKCe3e7d6GbJNP9UA0nNHG
	pWxrJ79PDL2fUZZF42FwZBhI/v1Q6GzXQd6nA3HRmddePn4aVd5B/mvC5706FH+nX8Su/CJUq7R6d
	kYmffP0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQ1W-0000000GCfG-127O;
	Mon, 24 Aug 2026 08:27:18 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyQ1M-0000000GCan-3rTH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 08:27:10 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c9eefcf9175so3274268a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 01:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787560028; x=1788164828; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HSkAieVQa1JTe8qhVM2kCKaOCfjEKvx10b2NLcrDjss=;
        b=raeCKzX1qfyD25pX7BiyBWmfSm1o3gyJHac6nZJbHZwmensS5mg/TCw39RZjceoTHx
         UO50F1xkYkbIMReXssM7b9RhUQdKmRYBtZfemTfnn6PsveYG6UzKc0Nuqr8KwBdt8DZn
         VekX7ZCO5uVHXE3I0PfUzEFDvq9/U5CMTyF/Lz/g+j0Fzh0Wb9i9umjw1Drc5x9pe/o4
         l3B9KByY9k6H2lxTeZFc1sZav6p5ccNTOjoDeTmZPFLtTPzN3Trw5R8x1BtEr9VN0fsH
         gJDaTbFafU4I/odvzD7UmkKFNss3zYYmpQVbUYPoxu4b11SwK+29KrwfxTrT+0plcNd+
         b8Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787560028; x=1788164828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HSkAieVQa1JTe8qhVM2kCKaOCfjEKvx10b2NLcrDjss=;
        b=F4LKN8LVt3Q6v99o8xKedSiRilGTCTVUVPjkS1RSDTg1/3kiu9ifCocinoQP4MNqrK
         Yilwge0bQfQDSMSwyzPrqa7As5VsJI4/L2zt7muunrS3ZoVe21RHGGOA+71QouN+oVVs
         UsNUhgsZIMRIKlL3V2lIp5myKq8/z+o/47S37HkQ1+YY6I+GSFOs99RhJWDvvUXaODWr
         8ExyAOFVbMW6ZLPMhZ8aaIXC0KNbbBrK5rS+06ZbvujQg6F9zDjjo1IbUA8UNRLIrgjh
         e95SOOJjKeBWZPh0X/4tB3XTE2W0lM2aHOZFFyf7MkWQCyQ+dj3/1wfcc9gJ2pq4fxPN
         s0Bw==
X-Forwarded-Encrypted: i=1; AHgh+Rrteh9HV3iz8qsQ8M7O7XdZRuzFpqtH76Bi8laVXPopA9XABub2wRs2DXo9w42cVkEcBj8BKG0frY470jn2xnQ7@lists.infradead.org
X-Gm-Message-State: AFuF++mY36IZXfBXDwu4cZj2MgbuWJ9q6J5ZmqaoOX4bLdVCYw5LL8F+
	R/zmskXX+IyEyHnpzIahI7tlct0YrlYYx59UtIeqQipDq4M+6iz1S2xZ
X-Gm-Gg: AR+sD12z4i2hLBg5BWGzXUuXaYgb1VwElG1RHBaYW2TfWUhLD827/c5TwyvGjBcvU4d
	Mz5fpa6Pxr0/9g/J/askH40Zt4FgQB2OGL0tyF54Qtkvzs4DO4DZf6Z444ERy/g91r/pILmhYSf
	YGXR0fwq5/d2lQyubhk+CzGPFGLBv25kNIPbpFGVpmrmRqxUkyQ5nJVIum89TTx2p+48KB8XY09
	Lkp2kvmI8y7ocHo+anstNs9sKm2J5hLwaQd0f409oeXPas+F5WHDAGlo8ikMRKc32IId4yJDy05
	BegCHH/rmyC+IWGHrCFl/2R4loR6sCsJXGZ3vrNW59Qb6UvMilLnSixJQozyYMUwNIiX4T1AmUm
	qPRyudiCs6BnHPxAy4v7nVDeuOidRyXmEezHWTE310Uq6zcR6GnL/GdzDEcBoF/vzVXeBtszDCG
	FMtTaQutrI70AEbUFaC+0M88qFARd4Foozg5xTMfPyZUBIEQnDTuYnqQrGy9xgo6WE6rVBZ5hDx
	SrP248toMdAxEWhtj2QvGE+2ooa/VmGTVdeATKAFgFq0jgRLfYDfVBElvyyXs+tUoT646hKtlNq
	Fglu8y2RDiQBRUrug+kPb35SzjJvMG4N+viPY3ryk7wGBwKQs9QhcZI0XJGZkrY+NoIuTApIqUk
	w0tYylUuZom2hGg2luiRFLE1xOrLdmGgc6bgq26Hx5nt9t8I=
X-Received: by 2002:a17:90b:50c3:b0:395:5eec:b932 with SMTP id 98e67ed59e1d1-395c39e6433mr48365891a91.11.1787560027941;
        Mon, 24 Aug 2026 01:27:07 -0700 (PDT)
Received: from localhost.localdomain ([101.251.7.10])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f90c0dd3sm25994595eec.7.2026.08.24.01.27.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 24 Aug 2026 01:27:07 -0700 (PDT)
From: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
To: Sven Peter <sven@kernel.org>,
	Janne Grunau <j@jannau.net>
Cc: Neal Gompa <neal@gompa.dev>,
	Arnd Bergmann <arnd@arndb.de>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v2 4/4] soc: apple: rtkit: rate limit malformed syslog warnings
Date: Mon, 24 Aug 2026 14:11:40 +0545
Message-ID: <fa4dd49adf1579d6fa378e4115d4e678e8dc12a6.1787559303.git.acharyalaxman8848@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <cover.1787559303.git.acharyalaxman8848@gmail.com>
References: <cover.1787559303.git.acharyalaxman8848@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_012709_502882_E4FC109C 
X-CRM114-Status: GOOD (  11.38  )
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

The coprocessor can repeatedly send malformed syslog messages and flood
the kernel log with warnings. Use the rate-limited warning helper for
the validation failures in the syslog receive path.

Fixes: 9bd1d9a0d8bb ("soc: apple: Add RTKit IPC library")
Cc: stable@vger.kernel.org
Signed-off-by: Laxman Acharya Padhya <acharyalaxman8848@gmail.com>
---
 drivers/soc/apple/rtkit.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
index da766df5a6d7..e70e3d2cfa08 100644
--- a/drivers/soc/apple/rtkit.c
+++ b/drivers/soc/apple/rtkit.c
@@ -439,7 +439,8 @@ static void apple_rtkit_syslog_rx_init(struct apple_rtkit *rtk, u64 msg)
 	rtk->syslog_msg_size = FIELD_GET(APPLE_RTKIT_SYSLOG_MSG_SIZE, msg);
 
 	if (rtk->syslog_msg_size == 0) {
-		dev_warn(rtk->dev, "RTKit: syslog msg_size is zero\n");
+		dev_warn_ratelimited(rtk->dev,
+				     "RTKit: syslog msg_size is zero\n");
 		return;
 	}
 
@@ -464,26 +465,24 @@ static void apple_rtkit_syslog_rx_log(struct apple_rtkit *rtk, u64 msg)
 	int msglen;
 
 	if (!rtk->syslog_msg_buffer || rtk->syslog_msg_size == 0) {
-		dev_warn(
-			rtk->dev,
-			"RTKit: received syslog message but no syslog_msg_buffer\n");
+		dev_warn_ratelimited(rtk->dev,
+				     "RTKit: received syslog message but no syslog_msg_buffer\n");
 		goto done;
 	}
 	if (!rtk->syslog_buffer.size) {
-		dev_warn(
-			rtk->dev,
-			"RTKit: received syslog message but syslog_buffer.size is zero\n");
+		dev_warn_ratelimited(rtk->dev,
+				     "RTKit: received syslog message but syslog_buffer.size is zero\n");
 		goto done;
 	}
 	if (!rtk->syslog_buffer.buffer && !rtk->syslog_buffer.iomem) {
-		dev_warn(
-			rtk->dev,
-			"RTKit: received syslog message but no syslog_buffer.buffer or syslog_buffer.iomem\n");
+		dev_warn_ratelimited(rtk->dev,
+				     "RTKit: received syslog message but no syslog_buffer.buffer or syslog_buffer.iomem\n");
 		goto done;
 	}
 	if (idx >= rtk->syslog_n_entries) {
-		dev_warn(rtk->dev, "RTKit: syslog index %d out of range\n",
-			 idx);
+		dev_warn_ratelimited(rtk->dev,
+				     "RTKit: syslog index %d out of range\n",
+				     idx);
 		goto done;
 	}
 
-- 
2.51.2


