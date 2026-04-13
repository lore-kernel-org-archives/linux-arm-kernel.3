Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85CABE9380D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 02:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4gq5oV2Uwm1Ltd6b9FECKA8ZBvmmiMQwyALIUU23nRA=; b=Ca2hGyVBDAujVRPmi/W1TjjA+N
	tgsxivF1SHL0s4O0A2fnq6NlDreG4ajP6MVHm5t1wNuPzXDXVT/1wLYCz0jScfJITrX+b6UBgi7bk
	YTi1MYMbGPoMmA0BS7/m8ZNqE4NR8drmFa6ECWi2waEBOTz1t5a8aeIaqTLgLBXq0s8lHAF9hUAYG
	NPaKobkHnj/zWZ+dZtHUs13417Vpb2T4W490mt8qn110T+ayWvtbdzua/7hrk/B4BjYszHDXliXDo
	/bfbAMtm1xl3LHTb0dW/NR1VgqXpxhlyQdVJfCUmxaRO88hnPnrsPaBoOnAI++6bx1EUQbhsEZO1V
	Q3zMFPTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC7ML-0000000EtPs-1Dg2;
	Mon, 13 Apr 2026 02:49:09 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC7LS-0000000EsvM-1lAn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 02:48:15 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2d8a677cdfaso736114eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 12 Apr 2026 19:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776048493; x=1776653293; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4gq5oV2Uwm1Ltd6b9FECKA8ZBvmmiMQwyALIUU23nRA=;
        b=RDw7nw8Svmo/BDuQqU2xbO85XserjCxdiLdXv4LBawy9ybixtSUNldrBAQCl5NRumO
         ioJGuMS7YG/Z/7Cf7E5zggUu0eKrASyEh3nQQy2uOtT0L+ZOkOA3lkI4/+XumRLrej7U
         gxUnhV6o429R3HZEw1uXsvSd7lsEW7xsMqjYFuYOOFcaacwoDNA38LsnXPv0rA2K79vC
         QGeEGkTUFuhlnqndFm0TBltgKfukAi4s14RpJLdmwTOAGxL2AlLUtxEXwUNeMfbZ56up
         ev1opOlzu0RW1NWPFKvH+5T2oKz9+V/4+oERC+Rzy2KMciuaxNCDlDh05MogWGiNvwOf
         95rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776048493; x=1776653293;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4gq5oV2Uwm1Ltd6b9FECKA8ZBvmmiMQwyALIUU23nRA=;
        b=AX09QApauWxZ6IDEhqCBSvwSPoygZ5ijsVmHHaJmfN25YmgyapsetKueCRtgfWO+9l
         RsQGqLmRkXxMLC9c6M+WLjCGpNRZ0EnwoIPRieJpg73B7mAe8ic/0mPhapxKqr6mlRTu
         /6adZUDYR/vB6urOj3uxdHfCrS7dp39e/F3xag17lbENu8XQxNGnD9hPljpMWOHcIZ5P
         Y9jznXFqqEy2u8fjSP1TAValyW8ZDIvcQjjFZcRYAmYlsLR7a3WpXKNQQfvjAciVP/o3
         iPU3NNAQ/zIO1z3Px04huvaowmEpxSbqMGBQp5tGnsYDD8EJ0bC+19IUgsy0qNhviJa/
         mJ6A==
X-Forwarded-Encrypted: i=1; AFNElJ9ShR+6hGLWLjA335O6aLTHI7xT8U0Mn+HxZKoydOimRTn1vh6kVu7z00GTQnRQyH3/WG76NP3dS2luU7lWkhmJ@lists.infradead.org
X-Gm-Message-State: AOJu0YwbJXJAM0vfl+umqQ25lOhRvRxQo01qTvkjch/e2nV1CjlM8mlC
	/cY+oHsxaHxiaa+g5gYwOpN6WmQ/MR7IQx7Ysg7IZYHluMN1eYEFWphSLBuoP2ZKfgoBUmO7L4Z
	WnRp90mmvYg==
X-Received: from dybmf46.prod.google.com ([2002:a05:7301:92e:b0:2d9:3c6b:a26b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:6788:b0:2c4:acef:292a
 with SMTP id 5a478bee46e88-2d587d82e73mr6543730eec.12.1776048493060; Sun, 12
 Apr 2026 19:48:13 -0700 (PDT)
Date: Sun, 12 Apr 2026 19:47:59 -0700
In-Reply-To: <20260413024805.1316480-1-irogers@google.com>
Mime-Version: 1.0
References: <advv6twWCEVBo_Hc@x1> <20260413024805.1316480-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260413024805.1316480-3-irogers@google.com>
Subject: [PATCH v4 2/8] perf build loongarch: Remove reference to missing file
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org
Cc: 9erthalion6@gmail.com, adrian.hunter@intel.com, alex@ghiti.fr, 
	alexander.shishkin@linux.intel.com, andrew.jones@oss.qualcomm.com, 
	aou@eecs.berkeley.edu, atrajeev@linux.ibm.com, blakejones@google.com, 
	ctshao@google.com, dapeng1.mi@linux.intel.com, howardchu95@gmail.com, 
	irogers@google.com, james.clark@linaro.org, john.g.garry@oracle.com, 
	jolsa@kernel.org, leo.yan@linux.dev, libunwind-devel@nongnu.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	mingo@redhat.com, namhyung@kernel.org, palmer@dabbelt.com, 
	peterz@infradead.org, pjw@kernel.org, shimin.guo@skydio.com, 
	tglozar@redhat.com, tmricht@linux.ibm.com, will@kernel.org, yuzhuo@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_194814_466094_C39A156A 
X-CRM114-Status: GOOD (  10.15  )
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


