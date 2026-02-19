Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C06E9A048
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 12:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A38pWY1RZMuoMAUnXA7bYRaxUuEoHlRtdEk4zIu3MNw=; b=nlKNUY1nvIii50yIYYt/F7DgTO
	jLpRMcX1C89Ugqu8C65J0GT5z31Ze4eMgjOGz3H/aZEj14uy8asykd2OjAZYNnqxL4WLZml3Cddyj
	eZ/IYb3PK90Bcqd6+NqCRf4vWrFTovr8QflWE6/0HKgXNj/auXQDkx5LORnq8xbeKmXY3hofie7Z0
	wevlKJvN0FDNSt611nPUarJYK0haC/shQ6nUtrTN6e7goObQpz+W5dIxXyfnTqRd1jOURzKNBiwlf
	RilY4+mSj+ANQrmoQ5GTGNtHcBcOSSOgPMOts0jr+ohPKhK3nANQCabgtqpz19Tl7PEAUGvhH0nPZ
	LgD2yyuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt3BW-0000000BKz6-3Qdt;
	Thu, 19 Feb 2026 12:31:10 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt3BU-0000000BKyK-1wGc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 12:31:09 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-4362197d174so595787f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Feb 2026 04:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771504266; x=1772109066; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A38pWY1RZMuoMAUnXA7bYRaxUuEoHlRtdEk4zIu3MNw=;
        b=B5zDOC42Le9Nq2nFuHw4kQ8YIhcyRFVQv+CueRuISXVWNQCeYijUDRU9fHj78m8Kox
         bbaH7IyVmt11nveSzKrwT0wAKz6w3FJs7wGRwBklViCQmTEKSHWahu0jV6uceEQ9W+md
         0yYpofDfTSwcyx2vJNIaWeXPkF3pSjbUoN6Eu1ymNeM/b0HZgUQ3y5/D9FGTyHWmxaP8
         6D+xgOMCLJ/ma8srxEPqs8HjxkAeBVmLfFvoh8esbohMim3ncgZQ0piiPQoLh7xThV+y
         oqOTU2DJUonsNq3VZmwOooTcVm1hz/7UEWtoaBR5UF2yc8CYGSMsLW0w8raG9nwzr79E
         xFxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771504266; x=1772109066;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A38pWY1RZMuoMAUnXA7bYRaxUuEoHlRtdEk4zIu3MNw=;
        b=gNDyUtMgnf06rS+VdKTsiiam1ZXJoqAJBOe/MPa+dUISVFP9s3hthyDlT/4JUQKybF
         mwM7Xt4chtf1ZcGQZ3ZJYpp3ylpz311nYe4kjXvM0ws2BIjKTOF4WZ/qdxSi4omNMUUe
         IJOCSdXjhyqw130FWlDb+uQn+jrx0jYVI9olE/yjlNeNLhZawNB2yw4ZcUmdrKLTL3pn
         REerYOvAoeVL/ngz/Tsgmn5KNDfH5QqDTD2IgMjNxrmrs639hR9sXCr+FdhYpp6Yj1Yn
         alClCfurmJeKMaZFht3rIsFPzonW0jYppQviTeEewItrGiavP18hGG3JTE/fnvXRW0B9
         KPnQ==
X-Gm-Message-State: AOJu0YwZyLf/3UgetLZ5bjIXxNzkDc7z9eM+fNi27nSMavYneINKIK5y
	2jGL3A+ntEaKBegKQbQgNHXFPWda097gv9Ly1hhL8vYh2dWmIVfbuxbtReoDcLaaPQc=
X-Gm-Gg: AZuq6aKQOuT2VSATQHVXUKm3axkpF8DJcpdbLri6hyqJhNOd4jQnQ0Wd23D3VjXg1cS
	0S4TXN2qRiPmZij6xGde7c4JreDdb+tXsqPe95DUAZ2xjoeExyA4xupkBdCgzbRbbEgwj+VUCUK
	JIPzRZ2IkWN9nJlcRjc7nWfnCcmxAruIA6s16htsTislshpluC+akXc24sOgcSS0EBKK9YxmfsV
	sF7B2Z6755optK0wrH9DuQFRBT/bQy5MQh+dsUXlA/kBM4Eh482+chf6P/1rDLQ05tvJQT5HiR6
	DzGFFnq0669CbXd/4I51Bw4ALA03RtpNC/IcfrlX8UC+CDoITy/TbpX88NQQXRaLfa3vs5HgDDY
	ZXzyEV+u31yCQhwWursUprpTQztiAQhikL8jh8opcIN+ivq/skFeVJoTk/4hMwSQU9UeMevBTx1
	3JsUYqpDhvLEMSc+zvnHFpyudwWrF/M1cjxSkI3mv4Hh64XjPQs3y8eI/t6Tud4t/In3XtFMnHj
	/u6nA==
X-Received: by 2002:a05:6000:1a8d:b0:436:8061:7f91 with SMTP id ffacd0b85a97d-43958e3b989mr9948997f8f.41.1771504265971;
        Thu, 19 Feb 2026 04:31:05 -0800 (PST)
Received: from localhost.localdomain ([196.119.106.230])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43796a6ba57sm40206990f8f.15.2026.02.19.04.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 04:31:05 -0800 (PST)
From: Reda CHERKAOUI <redacherkaoui67@gmail.com>
To: catalin.marinas@arm.com,
	will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Reda CHERKAOUI <redacherkaoui67@gmail.com>
Subject: [PATCH 2/2] arm64/mm: avoid max_pinned_asids underflow
Date: Thu, 19 Feb 2026 12:30:07 +0000
Message-ID: <20260219123007.9101-1-redacherkaoui67@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_043108_529605_D0CB035F 
X-CRM114-Status: GOOD (  13.58  )
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

Signed-off-by: Reda CHERKAOUI <redacherkaoui67@gmail.com>
---
 arch/arm64/mm/context.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/mm/context.c b/arch/arm64/mm/context.c
index 74c1ece7db78..fdcee1127954 100644
--- a/arch/arm64/mm/context.c
+++ b/arch/arm64/mm/context.c
@@ -386,11 +386,7 @@ static int asids_update_limit(void)
 		if (pinned_asid_map)
 			set_kpti_asid_bits(pinned_asid_map);
 	}
-	/*
-	 * Expect allocation after rollover to fail if we don't have at least
-	 * one more ASID than CPUs. ASID #0 is reserved for init_mm.
-	 */
-	WARN_ON(num_available_asids - 1 <= num_possible_cpus());
+
 	pr_info("ASID allocator initialised with %lu entries\n",
 		num_available_asids);
 
@@ -399,7 +395,11 @@ static int asids_update_limit(void)
 	 * even if all CPUs have a reserved ASID and the maximum number of ASIDs
 	 * are pinned, there still is at least one empty slot in the ASID map.
 	 */
-	max_pinned_asids = num_available_asids - num_possible_cpus() - 2;
+	if (WARN_ON(num_available_asids <= num_possible_cpus() + 2))
+		max_pinned_asids = 0;
+	else
+		max_pinned_asids = num_available_asids - num_possible_cpus() - 2;
+
 	return 0;
 }
 arch_initcall(asids_update_limit);
-- 
2.43.0


