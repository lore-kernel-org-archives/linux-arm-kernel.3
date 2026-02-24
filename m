Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 520FAF357B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 14:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:From:Subject
	:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SF/9HIjbc6rTAg6numLxHr5OltI8HDgFivsZ6NrsbUM=; b=N+f6K8UnsHBVo5i6EcSd9tstnf
	v8HIYvdK9uVwsabrh+Nkuy6j8yLr0s5xI0/uNzLOYQngXtU6LkKGKqm5LclVmRwZUGn0NXAaW3ajl
	a2qJgd6BYH5egtbtjBzcyeYZEwzYfMct6/mNxWCMF6qrQ3P0DobBmRbfArE691xq4MmvRqWkZcmFx
	rkUBCEe7ZmlG5+hGNMWN/2EEt/HM/7aW8OYeqtG2GhZxMUIpSCHJ+fLVfl4GJzmqt2I9qPEpWSrif
	9EN3nlwnq0heKJrqQx2lOz5R1h0mMrh4tmGbI3a1LTYaw1NekJr/4ytaOxpw71iRsCm4qeduSHyaf
	uy7dsxrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutQG-00000002Crd-2yB5;
	Tue, 24 Feb 2026 14:30:00 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vutQE-00000002Cp8-0FGj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 14:29:59 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-12721cd1a2aso27834387c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 06:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771943397; x=1772548197; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SF/9HIjbc6rTAg6numLxHr5OltI8HDgFivsZ6NrsbUM=;
        b=pZhRiFyfz3KWOQ83IB0wt2rJ6999AuiKdBEKrQgp0blKFMVU2KVLaom9qsY4Iq1vJW
         sBiHymtEwnPLxAvFnYlGpUBRJm3PrTuCmClkYD58uRArajjEWk0aXr7ZCv2LYpVT0y1R
         ptKdclnZxnlgfUXZYHcTjHM4QFQqpnG+QZGUizD7GA0KCChys0G1qNJTOoySeElf01tW
         AKd4q8uQIwTzNlbUK1eo7lXD5qhsYmN4QSZDg2tEfJj4Ai5DvSUfa9bVsJ4Xu3ajxn7U
         RkeafKxXZc4f8ETyS2aFJHswq3jyBiudMnkntxupq30JiRm0cFmrfO+qu3MpNocUSKBr
         uGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771943397; x=1772548197;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SF/9HIjbc6rTAg6numLxHr5OltI8HDgFivsZ6NrsbUM=;
        b=HeUwtPGjkMRfpuOLr2TkzfaO02eOMaWgaGde5FdgSXTGAQ8eCmo7spqiCDWA5ctaEG
         1ECRz4mnrP4/AAq/HbvH+ysYkT//icqH23ryurhmoKkFOXp6LnHuKMRZCkn8K5Ltk5iX
         LqvpV3ZQOFSmQDoef39OgyZJ3mF71jenIFzZ0N0ykCL9HW6PKXxXCrBAyVqSi8Wceltk
         L7SdlYdf9zdFG8XMqDF567dyJZQsfdy5fgXIRq20dcqAPbBVhk9RZfS3t0/mSVaQAzZ5
         XPOmvVWOlWlmZDQQh7vY2aJYdzpcBuywOqYwmryjYhWA0vCFQ6D+JHxStIAoqzHT2Jk9
         4R1g==
X-Forwarded-Encrypted: i=1; AJvYcCUylpGQZJKTpnulKTCwfj7axbNq8fwa3W5ZEHi9EGZ75gYMlA5kWzZe1nEx8lpAli6gii7jql6dDX1RaKvZxmLW@lists.infradead.org
X-Gm-Message-State: AOJu0YzJalzUY1AzYi/1j8QWa/C0d0WjQeZquRanRgmmPZUhaUiDSUAT
	R+UrhGIgH2ff+zVmKjWRePf/Mo9UZ5zpIcnFZxG2yH3kikTEPkbuC65+dpY40VuwSxEdvVkQtYf
	CIgZFefwWYw==
X-Received: from dybgx25.prod.google.com ([2002:a05:7301:2419:b0:2ba:7b4a:c331])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:6428:b0:2ba:6458:b325
 with SMTP id 5a478bee46e88-2bd7bd0974cmr5588226eec.23.1771943396789; Tue, 24
 Feb 2026 06:29:56 -0800 (PST)
Date: Tue, 24 Feb 2026 06:29:33 -0800
In-Reply-To: <20260224142938.26088-1-irogers@google.com>
Mime-Version: 1.0
References: <20260224142938.26088-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.371.g1d285c8824-goog
Message-ID: <20260224142938.26088-4-irogers@google.com>
Subject: [RFC PATCH v1 3/7] perf build loongarch: Remove reference to missing file
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dmitrii Dolgov <9erthalion6@gmail.com>, 
	Blake Jones <blakejones@google.com>, Tomas Glozar <tglozar@redhat.com>, 
	Yuzhuo Jing <yuzhuo@google.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, 
	Shimin Guo <shimin.guo@skydio.com>, Athira Rajeev <atrajeev@linux.ibm.com>, 
	Chun-Tse Shao <ctshao@google.com>, Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Thomas Richter <tmricht@linux.ibm.com>, 
	libunwind-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_062958_121870_7CA43AD7 
X-CRM114-Status: GOOD (  11.40  )
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

The file was removed in commit e62fae9d9e85 ("perf unwind-libdw: Fix a
cross-arch unwinding bug") but the Build file not updated.

Fixes: commit e62fae9d9e85 ("perf unwind-libdw: Fix a cross-arch unwinding bug")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/loongarch/util/Build | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/perf/arch/loongarch/util/Build b/tools/perf/arch/loongarch/util/Build
index 3ad73d0289f3..8d91e78d31c9 100644
--- a/tools/perf/arch/loongarch/util/Build
+++ b/tools/perf/arch/loongarch/util/Build
@@ -1,4 +1,3 @@
 perf-util-y += header.o
 
 perf-util-$(CONFIG_LOCAL_LIBUNWIND) += unwind-libunwind.o
-perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
-- 
2.53.0.371.g1d285c8824-goog


