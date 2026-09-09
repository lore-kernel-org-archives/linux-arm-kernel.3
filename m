Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AFAC79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 15:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BvUDg/Oxz2M+0TGMqb858AQomxjddSwF9FBAvTPEnjs=; b=yaHf9pklRZtp+9e0ZNdUv2WIlA
	Ja4y18SR6morQKBv5jMZoowNla5Ge8Tccbg8XrlXcV0EDUpq+6vGYdv6QfeTZpCIxN7Fugo7RN/Vu
	NuCETr7HqSPYSnWQl9wyJiLpZkYM4M8PPgREPFpqGIQMjuvUeggi87Ca8sPgbnSMxMNEoiPVZGgjL
	C3TG5U1met9lAqgwfN10OPdckWcqpjEIwvbqeukqSS/yFjOq278sm6wHZ3JygB0W8FGkwT8ohrs7Z
	wQKGmmY4Kt5xDFWAki3+A9ndTdDo9I4Hm7xpvmuiq11/X+aqE8jXSbyQ4hYv4goTKY3tMTO8sVfbl
	U8yQxcWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Kfs-0000000CFS3-2fIS;
	Wed, 09 Sep 2026 15:57:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Kfp-0000000CFRH-2Doh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 15:57:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788969439;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BvUDg/Oxz2M+0TGMqb858AQomxjddSwF9FBAvTPEnjs=;
	b=I5TXNj55xn+OpE44syNHQU7xLJqV89N2ktNFR6IkaM30i8v4k6CtbRhAupefeN8CKrz9mk
	0SlS3DoNN3LJFPINlvZewvdpKAksbxfoAu51ZQCJrfiqgPPgv0LDjp2F4sFMyCWEZHJzG8
	+Do84dDrvLKC+6DQEeffGjnb8fGVIxI=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-261-wVMvkf5uM-Kyikrj8YapQg-1; Wed,
 09 Sep 2026 11:57:14 -0400
X-MC-Unique: wVMvkf5uM-Kyikrj8YapQg-1
X-Mimecast-MFC-AGG-ID: wVMvkf5uM-Kyikrj8YapQg_1788969432
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EA9E519540E1;
	Wed,  9 Sep 2026 15:57:11 +0000 (UTC)
Received: from thuth-p1g4.redhat.corp (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C2907195608E;
	Wed,  9 Sep 2026 15:57:08 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>,
	Shuah Khan <shuah@kernel.org>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kselftest/arm64: Fix size of thread_data values for pthread_join()
Date: Wed,  9 Sep 2026 17:57:07 +0200
Message-ID: <20260909155707.161121-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: mWK3daMPTYmN4uuDYtBX4MAKROTLWkk3QkE0-H3AatA_1788969432
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_085721_638250_F402A27D 
X-CRM114-Status: GOOD (  12.87  )
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

pthread_join() stores the thread's return value (a "void *", i.e.
8 bytes on 64 bit computers) into the address that is passed as second
parameter. However, the entries of thread_data are only normal "int"s,
i.e. only 4 bytes. The additional 4 bytes of the return value clobber
whatever is adjacent on the stack, i.e. other members of the thread_data
array (which will be re-written in the next iteration of the for-loop,
so that nobody noticed this problem), or another other local variable
on the stack for the last iteration. Use "intptr_t" to declare the
thread_data array entries with the correct size.

Fixes: 29f080881601c ("kselftest/arm64: check GCR_EL1 after context switch")
Cc: stable@vger.kernel.org
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tools/testing/selftests/arm64/mte/check_gcr_el1_cswitch.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/arm64/mte/check_gcr_el1_cswitch.c b/tools/testing/selftests/arm64/mte/check_gcr_el1_cswitch.c
index d23f154d3288c..5d9dc8bcfbf55 100644
--- a/tools/testing/selftests/arm64/mte/check_gcr_el1_cswitch.c
+++ b/tools/testing/selftests/arm64/mte/check_gcr_el1_cswitch.c
@@ -69,7 +69,7 @@ void *execute_thread(void *x)
 int execute_test(pid_t pid)
 {
 	pthread_t thread_id[MAX_THREADS];
-	int thread_data[MAX_THREADS];
+	intptr_t thread_data[MAX_THREADS];
 
 	for (int i = 0; i < MAX_THREADS; i++)
 		pthread_create(&thread_id[i], NULL,
-- 
2.55.0


