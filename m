Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E244CCF2C7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 21:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+mN2Kzlf05Vt1VICnIXW7SINAOe1Q6DRTEnGDMvqFe4=; b=oyfpx8Yxw6N7zVjKBAG8VI5w9t
	dLbi/jOzEUJftdGnXrtu+rRNWD96rpd1gjHrHN7OSMf1YlQNwnYcWwVnH0A6QdMatl/EnOyRg8Wdb
	GWPrBGoN9PiZx5gSYe0bujNgacKTzSANZ8SgWfNgHajbRcFgsb0fJLN/3MHD8NSgMG+dXg5L/+rKX
	oMJYk8TDREOGZ8YuOfo8AE6CSMs2YysMh5rxahjq1DBSu2zC4zfz1+LSbcBYn7c9cabK91lnLDe3A
	hcUsO07rG4mGKCAXSBQ86h++M9QLkTGLneg/OMrmBkIBBgm9YgXMYU2C5P64Zc++T2MNPwMxnNXq1
	2RP2SobQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHpDg-0000000444F-40AQ;
	Fri, 16 Oct 2026 21:12:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHpDc-0000000441f-2wiI
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 16 Oct 2026 21:12:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=+mN2Kzlf05Vt1VICnIXW7SINAOe1Q6DRTEnGDMvqFe4=; b=keC2e7OzfWFmOIeVozoovBt+lB
	geHF0Qf27dgRGH/diG0L9Q8FlXlY12ejbzUcE3v2g0qf8CtXzX7NRD9mzxaonCIKJ8v8BBEEcG8rg
	pEeExjUxejqIVlj3etNoplg/NH054Fwnnq7snh6l897H4stmtXEgVYfU+MkjKTBhUErmuWJAHpLpv
	SyF05THlLNWVsUv0GQOj+teUz1QPfDrC3s0bbR4wJMOD9SslwilGdkhCIjE6P5l5vZz43HU5q7DhU
	NBEKprsAak0jV7ijO4dEpilOYWte4D8CvmeEe8NNnYrtkA/XTVw4rVpk+st785JN/+fvRMwqKzz23
	18kofujw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHpDZ-00000001xRK-2DT0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 21:11:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A9EE61516;
	Fri, 16 Oct 2026 14:11:52 -0700 (PDT)
Received: from e132581.arm.com (unknown [10.2.196.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6604E3F673;
	Fri, 16 Oct 2026 14:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792185115; bh=6v8UMEXHuka5k9rxoMuSILT2vaa5s7iMzgRF1vhX86w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=il7wfM23w5c+hwRVNzHkkh2L4ZOSKqeTX9E1kGbPsWNs5foeh+ffWtaABS2Sodn/R
	 C8z4bE+oRk6AUZFApFUaNDrmk/quQLsvUjZRnicPd4F9Bln+z3VNo1gAFBPDTpRA2i
	 fPbKuYB2gAxyfgIBP1XPpIfnkWlcy6AYDi/glGTQ=
From: Leo Yan <leo.yan@arm.com>
Date: Fri, 16 Oct 2026 22:11:39 +0100
Subject: [PATCH v2 01/11] coresight: trbe: Remove misleading comment
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-trbe_buffer_refactor_v2-v2-1-383ac26382fa@arm.com>
References: <20261016-trbe_buffer_refactor_v2-v2-0-383ac26382fa@arm.com>
In-Reply-To: <20261016-trbe_buffer_refactor_v2-v2-0-383ac26382fa@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Anshuman Khandual <anshuman.khandual@arm.com>, 
 Tamas Petz <tamas.petz@arm.com>, Tamas Zsoldos <tamas.zsoldos@arm.com>, 
 Suyash Mahar <smahar@meta.com>, Amir Ayupov <aaupov@fb.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 coresight@lists.linaro.org, Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792185112; l=1975;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=6v8UMEXHuka5k9rxoMuSILT2vaa5s7iMzgRF1vhX86w=;
 b=9/hrQ62uFYqwBiE1FyM9+/w9e5H55spZ6D9uPOiLBrqtBwsWarl/MM74ekbObXSN5qtcJd0Cf
 vhUyKNjV0V5AKz2gZN5+57EJsZch1d0NPGrr7DJcEJieajUS53k79Th
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_221157_941866_55884404 
X-CRM114-Status: GOOD (  12.35  )
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

Since the rounded-up wakeup address is always higher than the head, the
limit cannot be less than the head caused by wakeup capping.

The described scenario is never valid caused by wakeup capping, remove
the comment to avoid confusion.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-trbe.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwtracing/coresight/coresight-trbe.c
index 29a1882b1f3c2eb7166f71eeef37badece67039c..ada4794c51f3eb9142cd62f4209affe308142d1b 100644
--- a/drivers/hwtracing/coresight/coresight-trbe.c
+++ b/drivers/hwtracing/coresight/coresight-trbe.c
@@ -505,10 +505,10 @@ static unsigned long __trbe_normal_offset(struct perf_output_handle *handle)
 		limit = min(limit, round_up(wakeup, PAGE_SIZE));
 
 	/*
-	 * There are two situation when this can happen i.e limit is before
+	 * There is a situation when this can happen i.e limit is before
 	 * the head and hence TRBE cannot be configured.
 	 *
-	 * 1) head < tail (aligned down with PAGE_SIZE) and also they are both
+	 * head < tail (aligned down with PAGE_SIZE) and also they are both
 	 * within the same PAGE size range.
 	 *
 	 *			PAGE_SIZE
@@ -519,18 +519,6 @@ static unsigned long __trbe_normal_offset(struct perf_output_handle *handle)
 	 * |$$$$$$$$$$$$$$$$$$$|========|$$$$$$$|
 	 * +------------|------|--------|-------+
 	 * trbe_base				trbe_base + nr_pages
-	 *
-	 * 2) head < wakeup (aligned up with PAGE_SIZE) < tail and also both
-	 * head and wakeup are within same PAGE size range.
-	 *
-	 *		PAGE_SIZE
-	 *	|----------------------|
-	 *
-	 *	limit	head	wakeup  tail
-	 * +----|------|-------|--------|-------+
-	 * |$$$$$$$$$$$|=======|========|$$$$$$$|
-	 * +----|------|-------|--------|-------+
-	 * trbe_base				trbe_base + nr_pages
 	 */
 	if (limit > head)
 		return limit;

-- 
2.34.1


