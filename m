Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DBDEEFD208
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 08:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+N2FdzBXq7d0qBg17oIVx0hpSGWg6PAf2XJ4iYnD3A=; b=pYdJQ9CBPWzly5bGFWkXdmqJal
	eK/+ypo+eWIgaNitMKiuvd/we6wZn3UT6JXnOnhjW7Zy3BRoNxVazAgt5Z7SLhvpNO3qBzM/bEZXO
	968kGa/TMio8Qg0KAd0eNZ2dFxChVH/csbCdtk7+tYN+o8DSNG6uRepdUrAugpfJYRIe9ylio3T1e
	hwU+mjTmsEFV8bT8o4g9oHaiR+fsV8c/bvkYLeUYyOmdIYhtzPeyLmp1caYe70zvL7+9mGaZ1KBks
	C2UWTSbqIyW6ggkwnz0Bw/WrtJkQPnQlPPMGRurGD8qjZPiKAWM+dLvmeSxszQs98DaqoMWbwwA34
	L3U8dTew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvA4P-00000003Ve1-2X5n;
	Wed, 25 Feb 2026 08:16:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvA4I-00000003VWV-2PyT
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Feb 2026 08:16:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=3+N2FdzBXq7d0qBg17oIVx0hpSGWg6PAf2XJ4iYnD3A=; b=OayJAdilQHrRMy6cuj8lkRpNo8
	MDCI/nEizeJZyFhbJ+8tleRlvavi1B5W/YVxYREE8o2zcla515WWlmV4h2bl6JzWyG1u3AlhU9n7b
	nIEVWTW236paixbcbuLlKRENFnzOC2oLgIsKiZQ1GXHZAL4+Fo8kVA/9GaGf4r4iKuE4EB3uZLYVn
	U2aD/oifcgpgt+f5HyMhSJ3U6G40h1Kkw7HOoscl4AzcsPbg4f997qssUoeRLwQ3fL/vzxUxrlA12
	1QSI7UmQSqq8+pqE8Ek64RlZzkpDfg5oADmONUKaqi1GmW83zxV4f3tc/DIND5lZMGKYZSYUTCRhr
	rLB/IbBQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvA4F-00000000jRg-3cx4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 08:16:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772007375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3+N2FdzBXq7d0qBg17oIVx0hpSGWg6PAf2XJ4iYnD3A=;
	b=Dp7SnWCawm8+4nWspuj5hLUUPXVqBm3HzPbJvsx8pgiErXugpu83I5/fAacQQLUZampiv9
	HFiZAZXox7LSiwJxd9HdhkSFuY9pCCe2Yw06EN0dJSMgdHjdYTSe8lQ01azCl/ZJHYVmm7
	ybbRfybPzV+shcBxMzoxuFscYLauKv8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772007375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3+N2FdzBXq7d0qBg17oIVx0hpSGWg6PAf2XJ4iYnD3A=;
	b=Dp7SnWCawm8+4nWspuj5hLUUPXVqBm3HzPbJvsx8pgiErXugpu83I5/fAacQQLUZampiv9
	HFiZAZXox7LSiwJxd9HdhkSFuY9pCCe2Yw06EN0dJSMgdHjdYTSe8lQ01azCl/ZJHYVmm7
	ybbRfybPzV+shcBxMzoxuFscYLauKv8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772007375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3+N2FdzBXq7d0qBg17oIVx0hpSGWg6PAf2XJ4iYnD3A=;
	b=Dp7SnWCawm8+4nWspuj5hLUUPXVqBm3HzPbJvsx8pgiErXugpu83I5/fAacQQLUZampiv9
	HFiZAZXox7LSiwJxd9HdhkSFuY9pCCe2Yw06EN0dJSMgdHjdYTSe8lQ01azCl/ZJHYVmm7
	ybbRfybPzV+shcBxMzoxuFscYLauKv8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-36-5bDMHpyIN7qY2J9aFw6T_w-1; Wed,
 25 Feb 2026 03:16:11 -0500
X-MC-Unique: 5bDMHpyIN7qY2J9aFw6T_w-1
X-Mimecast-MFC-AGG-ID: 5bDMHpyIN7qY2J9aFw6T_w_1772007369
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4C83718003F6;
	Wed, 25 Feb 2026 08:16:09 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.55])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 50E031800465;
	Wed, 25 Feb 2026 08:15:58 +0000 (UTC)
From: Baoquan He <bhe@redhat.com>
To: kasan-dev@googlegroups.com
Cc: linux-mm@kvack.org,
	andreyknvl@gmail.com,
	ryabinin.a.a@gmail.com,
	glider@google.com,
	dvyukov@google.com,
	linux-kernel@vger.kernel.org,
	linux-um@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	chris@zankel.net,
	jcmvbkbc@gmail.com,
	linux-s390@vger.kernel.org,
	hca@linux.ibm.com,
	Baoquan He <bhe@redhat.com>
Subject: [PATCH v5 09/15] arch/powerpc: don't initialize kasan if it's disabled
Date: Wed, 25 Feb 2026 16:14:06 +0800
Message-ID: <20260225081412.76502-10-bhe@redhat.com>
In-Reply-To: <20260225081412.76502-1-bhe@redhat.com>
References: <20260225081412.76502-1-bhe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: rZDPE5U1Zmv2rQinSS8QAC4DeRuYNIMl_a9bOwcN9L8_1772007369
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_081624_022127_B5FBCE60 
X-CRM114-Status: GOOD (  10.57  )
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

Here, kasan is disabled if specified 'kasan=off' in kernel cmdline.

This includes 32bit, book3s/64 and book3e/64.

Signed-off-by: Baoquan He <bhe@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/mm/kasan/init_32.c        | 6 +++++-
 arch/powerpc/mm/kasan/init_book3e_64.c | 4 ++++
 arch/powerpc/mm/kasan/init_book3s_64.c | 4 ++++
 3 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/kasan/init_32.c b/arch/powerpc/mm/kasan/init_32.c
index 1d083597464f..0ea2a636c992 100644
--- a/arch/powerpc/mm/kasan/init_32.c
+++ b/arch/powerpc/mm/kasan/init_32.c
@@ -141,6 +141,10 @@ void __init kasan_init(void)
 	u64 i;
 	int ret;
 
+	/* If KASAN is disabled via command line, don't initialize it. */
+	if (kasan_arg_disabled)
+		return;
+
 	for_each_mem_range(i, &base, &end) {
 		phys_addr_t top = min(end, total_lowmem);
 
@@ -170,7 +174,7 @@ void __init kasan_init(void)
 
 void __init kasan_late_init(void)
 {
-	if (IS_ENABLED(CONFIG_KASAN_VMALLOC))
+	if (IS_ENABLED(CONFIG_KASAN_VMALLOC) && kasan_enabled())
 		kasan_unmap_early_shadow_vmalloc();
 }
 
diff --git a/arch/powerpc/mm/kasan/init_book3e_64.c b/arch/powerpc/mm/kasan/init_book3e_64.c
index 0d3a73d6d4b0..fbe4c9a7e460 100644
--- a/arch/powerpc/mm/kasan/init_book3e_64.c
+++ b/arch/powerpc/mm/kasan/init_book3e_64.c
@@ -111,6 +111,10 @@ void __init kasan_init(void)
 	u64 i;
 	pte_t zero_pte = pfn_pte(virt_to_pfn(kasan_early_shadow_page), PAGE_KERNEL_RO);
 
+	/* If KASAN is disabled via command line, don't initialize it. */
+	if (kasan_arg_disabled)
+		return;
+
 	for_each_mem_range(i, &start, &end)
 		kasan_init_phys_region(phys_to_virt(start), phys_to_virt(end));
 
diff --git a/arch/powerpc/mm/kasan/init_book3s_64.c b/arch/powerpc/mm/kasan/init_book3s_64.c
index dcafa641804c..f7906f9ef9be 100644
--- a/arch/powerpc/mm/kasan/init_book3s_64.c
+++ b/arch/powerpc/mm/kasan/init_book3s_64.c
@@ -54,6 +54,10 @@ void __init kasan_init(void)
 	u64 i;
 	pte_t zero_pte = pfn_pte(virt_to_pfn(kasan_early_shadow_page), PAGE_KERNEL);
 
+	/* If KASAN is disabled via command line, don't initialize it. */
+	if (kasan_arg_disabled)
+		return;
+
 	if (!early_radix_enabled()) {
 		pr_warn("KASAN not enabled as it requires radix!");
 		return;
-- 
2.52.0


