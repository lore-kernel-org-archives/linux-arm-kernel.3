Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F970E88D85
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 05:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4gq5oV2Uwm1Ltd6b9FECKA8ZBvmmiMQwyALIUU23nRA=; b=oKL73cYJFhQpw1agc6fGGUcO9M
	nURdKkgn7k5rE4qR8HvlSxsQVpZfTFUrEE47oEGGY7oWzZyX4kmDDWphCbfX8JtAEgK/5oWUrX5bm
	FEFmeV8BjfmHOH7pv6NNTF9D9kwuJxxno6RQgThvHBbIUlXaMHOzmUEM4HUQ6NcXd3K4aEzDdyorg
	y2ngvCrattj/ZXBprD6/3HwfhxL/6e64A+bZO902caYX3onIT15NlYqrgRXi9ceUU47ylN6OejtZ9
	xyrcEQJLRwFGeCOWO85YFwRjDGqcUnBfscjhXkQDXF2ccoSMFdxMNk9XA+J4dCfa4pGAmTpXru7c3
	Tx+awfcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8tkd-00000003ADw-24F5;
	Sat, 04 Apr 2026 05:40:55 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8tkZ-00000003AB2-3Zcf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Apr 2026 05:40:52 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so3049525eec.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 22:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775281250; x=1775886050; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4gq5oV2Uwm1Ltd6b9FECKA8ZBvmmiMQwyALIUU23nRA=;
        b=HuzYXbkcoWifFtSNyw112IWl2hH04m1oUnGobDtJnqkyh/uvERF+/au5ajGPiJVWq2
         6Od1wTCc0lUObn1L+7qKRA6bLQMYkxKjALcjS5qQFSLe23O35pjiC45Y7R/w3YkK1tK1
         HWyAwxJfPNdE1fpXFe56sKNeg72GyD7xaDGsvjE6fIqh/9Ug586NefUZsUVt4/Hk5sfl
         nP/wFpA2wpw8JyPXFWNqy2qWk0rB6R9dSYRGnwe7Pn4Dnk0vwAeUPf+7c/NGSQ1qYgn/
         LyiNxYJFNbjP0zmaLycvV6+VZq7HcSDy7DZ4jwugNIaWPQdo50U/C4OvZ/5cZudp2RCC
         3tVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775281250; x=1775886050;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4gq5oV2Uwm1Ltd6b9FECKA8ZBvmmiMQwyALIUU23nRA=;
        b=jNebDCknwQT8jNpNldqoVN5xIXOzFx8Y1iveax+JrAVSK2i5gr8MCNC0qnXI4+NyIb
         Uxl57g90n9hQu1oKNk4FsPDWHZHzN16UvlqOrq83EThadM3xcqGJnNHjJJGUgYmCO3iE
         6v1RPe2qmNM7lus3m4FZ4qHh4fRhd+F+/MuAAzboPfkRMm1bF64hXS76mCWv+7ZCs09Q
         SynAqpWtQjHvKFa7XOgbTOIQZe16IMxxmFoFUu+TS/8efTAJfFA5HMF528YhlJBWpt9B
         s7taBiPhd0jA/sROasyXSGqRYKQfvDmePBF3ocGJbPMeLBTqNkvdbyixAm5k+4+85SmD
         tNEA==
X-Forwarded-Encrypted: i=1; AJvYcCXSp7gwEAZ+XKRNHaDmW4U+MM09sfZd9hUe6BJn7PLmh1IXEt5R4i5CFX1mbm998NqsfIW/y3nU7t1kcZyQb00l@lists.infradead.org
X-Gm-Message-State: AOJu0YxOLiJh0sh5f+bXALkSIKR++tIrDactgH9wqjQpFr+QNdJ//0jn
	BI0ea9+aSaMyAAZs7qN2pQBolDX/kNmatFZDcYT6WNV0w3DZ/vdzqFu9p7rKboCK2ZV7fAV/pLG
	1V+hazwTlxg==
X-Received: from dlbuy23.prod.google.com ([2002:a05:7022:1e17:b0:12c:5db:d6d1])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:fe08:b0:128:d577:dc21
 with SMTP id a92af1059eb24-12bfb700f3dmr2718425c88.13.1775281250318; Fri, 03
 Apr 2026 22:40:50 -0700 (PDT)
Date: Fri,  3 Apr 2026 22:40:26 -0700
In-Reply-To: <20260404054032.1538095-1-irogers@google.com>
Mime-Version: 1.0
References: <20260305221927.3237145-1-irogers@google.com> <20260404054032.1538095-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260404054032.1538095-3-irogers@google.com>
Subject: [PATCH v3 2/8] perf build loongarch: Remove reference to missing file
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org
Cc: irogers@google.com, 9erthalion6@gmail.com, adrian.hunter@intel.com, 
	alex@ghiti.fr, alexander.shishkin@linux.intel.com, 
	andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu, atrajeev@linux.ibm.com, 
	blakejones@google.com, ctshao@google.com, dapeng1.mi@linux.intel.com, 
	howardchu95@gmail.com, james.clark@linaro.org, john.g.garry@oracle.com, 
	jolsa@kernel.org, leo.yan@linux.dev, libunwind-devel@nongnu.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	mingo@redhat.com, namhyung@kernel.org, palmer@dabbelt.com, 
	peterz@infradead.org, pjw@kernel.org, shimin.guo@skydio.com, 
	tglozar@redhat.com, tmricht@linux.ibm.com, will@kernel.org, yuzhuo@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_224051_889110_763AE9D8 
X-CRM114-Status: GOOD (  10.10  )
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

Fixes: e62fae9d9e85 ("perf unwind-libdw: Fix a cross-arch unwinding bug")
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
2.53.0.1213.gd9a14994de-goog


