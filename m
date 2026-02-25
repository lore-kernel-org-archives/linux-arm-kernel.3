Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F25FEFD202
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 08:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qbXEkZK+UBZ3F7j2MH1sXu6emUlCr8xCSA0nHJ3EKL0=; b=GbyZrG/CA+0QHVcIx81NpHyGDf
	TXJ1B7oe5eHw3HFuHl9k6xr1jo5ddPCiTtkJ+eYojVByYtZYWvjkOShmxzZ7AzksDVQvRr81yrfak
	JWwRmk3ZKPt4kFy2yuCqEtuWvY9zp1uMpJNecjtYT6tmdi36LjRMnVZ3czWcWtjxcOA9+cLrpj0j4
	w3ZaunTpgCToLtxUeyNvR43uHEKJsaFeVEsQ7iuldP4Ppuyo1kpXFLXNdAxRQjVp6nMaaT23jCHCl
	GstBrh5j8d5LCBrCq5DvNyzPFwcPXn8kaR7E3cktDOl/RmTWjnc8KsvBS6YB/J2JXgptGa3af4i/P
	GW1U6uMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvA3q-00000003V50-1beb;
	Wed, 25 Feb 2026 08:15:58 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvA3n-00000003V0R-2rAM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 08:15:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772007354;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qbXEkZK+UBZ3F7j2MH1sXu6emUlCr8xCSA0nHJ3EKL0=;
	b=V05vutQRqBf9h7tY4tzubeoZFRBlno0ELN3CUrsLkAINB3FbYIYR/Z3IQ3Ent1pVKAsYiT
	4Y6gh+rrjqRGKL9p0Gm2bjdWZl2bA2aEPRAES0rzay52YvHPNRrvmwIAd2q4bhgGsroE2v
	M78GaeMlbG4j4ZtQAHvgyPpWWxa0Mjs=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-304-4chxBKYfMym28iynbNI3jg-1; Wed,
 25 Feb 2026 03:15:50 -0500
X-MC-Unique: 4chxBKYfMym28iynbNI3jg-1
X-Mimecast-MFC-AGG-ID: 4chxBKYfMym28iynbNI3jg_1772007348
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0CB5F195609F;
	Wed, 25 Feb 2026 08:15:48 +0000 (UTC)
Received: from MiWiFi-R3L-srv.redhat.com (unknown [10.72.112.55])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C1E3A1800286;
	Wed, 25 Feb 2026 08:15:38 +0000 (UTC)
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
Subject: [PATCH v5 07/15] arch/arm64: don't initialize kasan if it's disabled
Date: Wed, 25 Feb 2026 16:14:04 +0800
Message-ID: <20260225081412.76502-8-bhe@redhat.com>
In-Reply-To: <20260225081412.76502-1-bhe@redhat.com>
References: <20260225081412.76502-1-bhe@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: 0ND6_zqcpANHPm1y1xvUVUVs1r1kc4pINipunpVbW1k_1772007348
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_001555_863167_1588BF73 
X-CRM114-Status: UNSURE (   9.11  )
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

Here, kasan is disabled if specified 'kasan=off' in kernel cmdline.

And also need skip kasan_populate_early_vm_area_shadow() if kasan
is disabled.

Signed-off-by: Baoquan He <bhe@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 arch/arm64/mm/kasan_init.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index abeb81bf6ebd..4a58e609c81b 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -384,6 +384,9 @@ void __init kasan_populate_early_vm_area_shadow(void *start, unsigned long size)
 {
 	unsigned long shadow_start, shadow_end;
 
+	if (!kasan_enabled())
+		return;
+
 	if (!is_vmalloc_or_module_addr(start))
 		return;
 
@@ -397,6 +400,10 @@ void __init kasan_populate_early_vm_area_shadow(void *start, unsigned long size)
 
 void __init kasan_init(void)
 {
+	/* If KASAN is disabled via command line, don't initialize it. */
+	if (kasan_arg_disabled)
+		return;
+
 	kasan_init_shadow();
 	kasan_init_depth();
 	kasan_init_generic();
-- 
2.52.0


