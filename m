Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D5DC88E66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 12:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wbA4A44AQIVhmbRAMLUtO9C6G7AT1PTFjms0gASvDFQ=; b=NrKdGeMn26cg6TdFYzO0BcTt3B
	qC6akTnsfwBmqV9MTkCNEelkoqnZAOpgzeH4xTC67gkF0BJ/D52RGX4H1tjQJZyuMEZBA0GAWT9ke
	CSk1QAgMr6lWbkNW9hFfHlXRfFC/fOECsZFiwpE4R1bZctXufC8DTaWXix6+aUOb50ZFoAF11ASA+
	xc1KqADu8JA4ajcMI8YXZudb/SQkDyLyVHrnaZWkZ0N5VTDHnHqgRQSryYRtzUlmFaCf0tyqX5F3G
	f/VDtkKWZJ4TcjZAhrbJkYs6OqvxXNuAydL8RPmM4C/pR//YRXtZieGJdm6FHunL4V4ixpnBI7Z9L
	3VzQGbHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65ee-00000003Voj-2Ip5;
	Mon, 14 Sep 2026 12:19:24 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x65eV-00000003VhU-0x8r
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 12:19:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1789388349; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=wbA4A44AQIVhmbRAMLUtO9C6G7AT1PTFjms0gASvDFQ=;
	b=Gw/nakddmE0uYf0PVhAjM2FP0GrqMUxrpfacDfU+Ono8v2ewY4HxgmjiyH0eOIVhCk7a4nHIcQPpuuwk1CnH6q9jx33uGR++fKWZmDGgeNTgeUPpSf4/nNRE53TK6SGDCAguEz2ORVdC3LReRvJ0q4MnDrgfccW5IMx1yuqUM6M=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=17;SR=0;TI=SMTPD_---0XAwT2Pv_1789388343;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XAwT2Pv_1789388343 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 14 Sep 2026 20:19:08 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: irogers@google.com,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	john.g.garry@oracle.com,
	will@kernel.org,
	mike.leach@arm.com,
	leo.yan@linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] perf test: Fix a leaked map reference in the arch dwarf unwind tests
Date: Mon, 14 Sep 2026 20:19:03 +0800
Message-ID: <20260914121903.1212-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_051915_836965_EA2A3644 
X-CRM114-Status: UNSURE (   6.97  )
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

maps__find() has returned a reference to the map it finds since
commit 42fd623b58db ("perf maps: Get map before returning in
maps__find"), which updated arch/x86/tests/dwarf-unwind.c but missed
the arm, arm64 and powerpc copies. Release the map after reading its
end, as x86 does. All other callers of maps__find() already release
what they get.

Fixes: 42fd623b58db ("perf maps: Get map before returning in maps__find")
Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 tools/perf/arch/arm/tests/dwarf-unwind.c     | 1 +
 tools/perf/arch/arm64/tests/dwarf-unwind.c   | 1 +
 tools/perf/arch/powerpc/tests/dwarf-unwind.c | 1 +
 3 files changed, 3 insertions(+)

diff --git a/tools/perf/arch/arm/tests/dwarf-unwind.c b/tools/perf/arch/arm/tests/dwarf-unwind.c
index f421910e0709..d4707e9ffd2a 100644
--- a/tools/perf/arch/arm/tests/dwarf-unwind.c
+++ b/tools/perf/arch/arm/tests/dwarf-unwind.c
@@ -34,6 +34,7 @@ static int sample_ustack(struct perf_sample *sample,
 	}
 
 	stack_size = map__end(map) - sp;
+	map__put(map);
 	stack_size = stack_size > STACK_SIZE ? STACK_SIZE : stack_size;
 
 	memcpy(buf, (void *) sp, stack_size);
diff --git a/tools/perf/arch/arm64/tests/dwarf-unwind.c b/tools/perf/arch/arm64/tests/dwarf-unwind.c
index 440d00f0de14..fbc161a49369 100644
--- a/tools/perf/arch/arm64/tests/dwarf-unwind.c
+++ b/tools/perf/arch/arm64/tests/dwarf-unwind.c
@@ -34,6 +34,7 @@ static int sample_ustack(struct perf_sample *sample,
 	}
 
 	stack_size = map__end(map) - sp;
+	map__put(map);
 	stack_size = stack_size > STACK_SIZE ? STACK_SIZE : stack_size;
 
 	memcpy(buf, (void *) sp, stack_size);
diff --git a/tools/perf/arch/powerpc/tests/dwarf-unwind.c b/tools/perf/arch/powerpc/tests/dwarf-unwind.c
index 66af884baa66..b4bade5d59e2 100644
--- a/tools/perf/arch/powerpc/tests/dwarf-unwind.c
+++ b/tools/perf/arch/powerpc/tests/dwarf-unwind.c
@@ -34,6 +34,7 @@ static int sample_ustack(struct perf_sample *sample,
 	}
 
 	stack_size = map__end(map) - sp;
+	map__put(map);
 	stack_size = stack_size > STACK_SIZE ? STACK_SIZE : stack_size;
 
 	memcpy(buf, (void *) sp, stack_size);
-- 
2.50.1


