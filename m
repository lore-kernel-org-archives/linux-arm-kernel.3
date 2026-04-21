Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84BAF327D9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Apr 2026 11:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/NV8ykGGMcTaxZaQ2zUVOv41TqUrDMHc9m56orvpcOA=; b=ZV1KLkrM8NqmteICGIqbQuQ2ho
	SWWZoAbNPGDuX6KRd53+X+DM44ENtiP7BiUzA0PeK81BMJ0vikWFePpYG5hv2Jj+d2qLh1iTYnhyw
	/HMQ0H12ilyUrGdAM6WeiZkYVvC4zoiUIXPZzlgI06NmcKWZmYodw7bZyrjqi7BmerHdXm/ZtbBGA
	dERRLSkCs9tzmDesjvcLdALjjR9slqtldEhcGsQ4Tnky2bIk49xdgEXwvL5XBBvUer6kQp13bOt67
	gYfkeggkhybS9oUAf7MKKJaXJzAK1cyJ6a7wnn2pWmWGl1w4599Okzgxu/6XpqqC0KrHqNZ275O5g
	Vj+pU2Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF9cL-00000008XMS-3nx9;
	Tue, 21 Apr 2026 11:50:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF9cI-00000008XLk-0nTO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Apr 2026 11:50:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776772207;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=/NV8ykGGMcTaxZaQ2zUVOv41TqUrDMHc9m56orvpcOA=;
	b=K1hmUjA+bhxIxpMLhfz+FyNXulyuK8PRY+MsdOMmJz2tHqDZV4L2sMj/6YbGvIf/H82Nah
	Jxd0TmBFzwZv8DfKuSGFoVIdWQ64s83w0y2bz0+6JzFA9Ups04YQxnBxfnyP1FLj3PKZCY
	oiIuPRaPcWui4nIOH43JliVQvqPXBkc=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-658-abVUpCZENIOyEYY_k6aGBQ-1; Tue,
 21 Apr 2026 07:50:05 -0400
X-MC-Unique: abVUpCZENIOyEYY_k6aGBQ-1
X-Mimecast-MFC-AGG-ID: abVUpCZENIOyEYY_k6aGBQ_1776772204
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3993C195608F;
	Tue, 21 Apr 2026 11:50:04 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.44.49.140])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 23708195608E;
	Tue, 21 Apr 2026 11:50:00 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: tegra: Replace __ASSEMBLY__ with __ASSEMBLER__
Date: Tue, 21 Apr 2026 13:49:59 +0200
Message-ID: <20260421114959.202327-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: 319Wg84Bg8Mb7Dnx2Gq2bD2wAnBY-4wvD85MUAIxPyQ_1776772204
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_045010_326981_0CEE195B 
X-CRM114-Status: GOOD (  14.09  )
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

From: Thomas Huth <thuth@redhat.com>

While the GCC and Clang compilers already define __ASSEMBLER__
automatically when compiling assembly code, __ASSEMBLY__ is a
macro that only gets defined by the Makefiles in the kernel.
This can be very confusing when switching between userspace
and kernelspace coding, or when dealing with uapi headers that
rather should use __ASSEMBLER__ instead. So let's standardize now
on the __ASSEMBLER__ macro that is provided by the compilers.

This is a completely mechanical patch (done with a simple "sed -i"
statement).

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 Note: This patch has been split from an earlier series of mine
       to ease reviewing

 arch/arm/mach-tegra/reset.h | 2 +-
 arch/arm/mach-tegra/sleep.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-tegra/reset.h b/arch/arm/mach-tegra/reset.h
index 51265592cb1ae..92a89713d5e57 100644
--- a/arch/arm/mach-tegra/reset.h
+++ b/arch/arm/mach-tegra/reset.h
@@ -21,7 +21,7 @@
 
 #define RESET_DATA(x)	((TEGRA_RESET_##x)*4)
 
-#ifndef __ASSEMBLY__
+#ifndef __ASSEMBLER__
 
 #include "irammap.h"
 
diff --git a/arch/arm/mach-tegra/sleep.h b/arch/arm/mach-tegra/sleep.h
index 4718a3cb45a16..e332d261c1dbd 100644
--- a/arch/arm/mach-tegra/sleep.h
+++ b/arch/arm/mach-tegra/sleep.h
@@ -38,7 +38,7 @@
 #define TEGRA_FLUSH_CACHE_LOUIS	0
 #define TEGRA_FLUSH_CACHE_ALL	1
 
-#ifdef __ASSEMBLY__
+#ifdef __ASSEMBLER__
 /* waits until the microsecond counter (base) is > rn */
 .macro wait_until, rn, base, tmp
 	add	\rn, \rn, #1
-- 
2.53.0


