Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0042BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 22:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rqZJPkrdLYhNi9RVztXsXiCAhUfQzBe3lcC9pyvgpk8=; b=hY7692H+ZExttVqwisi+Tqn88Y
	s3L9ndjHInIcc3A+e9xlrknJQkRL+oj3kykxZcXhBNkuUTcP0U6KT8ns8l3u8gzoTWYoObhQtGo29
	6/mHJHsExOVIXEGdmzXJozafagSjqgCGd4AZXHy6WpeewzVuga5GGm6xmwGs1U1X6dvgWF9gdseSg
	nKATnuu72FowcW22b6Hnhlz2bAWWL9DPrwgrNLsoKC+bNOFn8/7UsTckp2/G+4yB6DNuHcViuFZNs
	6jYxGh/y/NKop3duCcfWBP/UxwdCF0xzgPQDju3/ft4/8TqLJWxfnTsryJsMCM8NU3noWlfNoeuq6
	xvebOcBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiJIM-00000005tdI-3A3Z;
	Fri, 10 Jul 2026 22:02:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiJIK-00000005tcq-0zxr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 22:02:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783720922;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rqZJPkrdLYhNi9RVztXsXiCAhUfQzBe3lcC9pyvgpk8=;
	b=gnrZMi2Af8iQSDkxUsBBAedUqNpNl1O33ck3B21rcXdZFaSyLs/8R+n6QMVTkiMnH/V1ew
	ck5VK71ibwkH9wXATvufKp/FdusjnwdE6bRozA1xY9edKHCSzfjQ2vtktjTVRubZj6WX++
	P8ToTm7VbXHTSEQPKc91T+NwrTJIMQk=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-263-dY53x4g4NnaGmXj1PtdzFg-1; Fri, 10 Jul 2026 18:00:26 -0400
X-MC-Unique: dY53x4g4NnaGmXj1PtdzFg-1
X-Mimecast-MFC-AGG-ID: dY53x4g4NnaGmXj1PtdzFg_1783720826
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8eeba1d9e47so16747256d6.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 10 Jul 2026 15:00:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783720826; x=1784325626;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rqZJPkrdLYhNi9RVztXsXiCAhUfQzBe3lcC9pyvgpk8=;
        b=Kl35eKs8xeZ9d0RL6wt3dS6m0osYgdMfdZiU7ZdOtN3YYdDvYwQdBAt7wvC1JjWoG8
         yr8NK2T35HnMNxWxWyWyTffG7Gzf20tpFvRcVteMeDiGjo3t/8Tr25ug2iZdMf+zUo/k
         y3iO0LshTvsdIE/zM4Wd4oh0f1EtZATVnbwg1Uh0XMcu0+6vAk3kq3H165C0TR9cpYnY
         SQGe5N3i+jEfZhcJRXV6RqJOiXEGoNlkOy8zqZ6nlCG+Byqf5E4hY5clpSJKbEdwvVvh
         mn01dXfWb5i4Gzc1mT7mqRPurdEINkJ1GTs9wzKyOSqrfZtHJ8f/5TPpMeW6241cUHS7
         GyDQ==
X-Gm-Message-State: AOJu0YyolJrbizuqfVPJz850jQsjG6aZZ1Vt3p/Noq1VVD2RuV5hupbL
	eYuFYXx0y/sp3IeziZx7XO13EEReS1N9w+5VD/03El7+/pHiPmqrsozYn9nNotVcGwXUJdpFeTQ
	OFfQiSRxO4gCuanywkhhiis8VstSTYKgGdWgBL5biGVA+8cbewR9inBMlauRo+mq9s8RMy60mDN
	9mph6pulg1K/5JJMtjNL69HzkKyZr5z5i2M42Ix1mezL6gZtmsUKPRPHiCGb6x
X-Gm-Gg: AfdE7cmVzXY4aIU7TkghpF/9rGrF+jPVs6oHZ2OslGM4q+Gbw34fsuXnDDXoZWvzMXd
	uMVK/fQHLDmgSMODA4Yl5o3vH946TKb+coOBKF4dWxjkpoa283BlWyx456lcieV932Jm2uyk6I7
	Zlws1ztVTvxHgGWIHcpzxquREs052UYShk7EBjri6lpIM+ZfiQ8EKNR/oIJdf9RFGIzAbBPAiKQ
	SNJ09TuJ9lX/2YH9lNP3l5PwoG7TCMjrUNsJbEBDf08fmnv3v9w7tB1e9sA81kPTdeoZmhShpVq
	6cN0jc18wkEVALxBkf3QOjVc6RXXYAIK2DxU7hU9a1enfdMMEhv9MLeISLXfgO1AatBt7wb+4dy
	vphKfFC4Y/1Hk7XOJuKtW1mUgjZID0f0PT5Du
X-Received: by 2002:a05:622a:34a:b0:51c:7bd:2c6f with SMTP id d75a77b69052e-51cbf046dbcmr8384881cf.8.1783720825501;
        Fri, 10 Jul 2026 15:00:25 -0700 (PDT)
X-Received: by 2002:a05:622a:34a:b0:51c:7bd:2c6f with SMTP id d75a77b69052e-51cbf046dbcmr8384051cf.8.1783720824805;
        Fri, 10 Jul 2026 15:00:24 -0700 (PDT)
Received: from sbertram-thinkpadp1gen5.bos.com ([67.189.222.97])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd5bbac2asm51922246d6.21.2026.07.10.15.00.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 15:00:24 -0700 (PDT)
From: Stephen Bertram <sbertram@redhat.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Stephen Bertram <sbertram@redhat.com>,
	linux-kselftest@vger.kernel.org
Subject: [PATCH] kselftest/arm64/pauth: Scale exec_changed_keys on KSFT_MACHINE_SLOW
Date: Fri, 10 Jul 2026 17:59:59 -0400
Message-ID: <20260710220018.719573-1-sbertram@redhat.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9rcBQHKdhXF7DJzzi7TCvEQ9Qea3kOu_YbSRWg6S9nY_1783720826
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_150204_388197_A093B46A 
X-CRM114-Status: GOOD (  13.80  )
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

exec_changed_keys performs a fork+exec per PAC_COLLISION_ATTEMPTS
iteration. After raising the default to 1000, the test exceeds the
30s kselftest harness timeout on debug kernels. Use a reduced
iteration count when KSFT_MACHINE_SLOW=yes, consistent with other
kselftests slow-machine handling.

Signed-off-by: Stephen Bertram <sbertram@redhat.com>
---
 tools/testing/selftests/arm64/pauth/pac.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/arm64/pauth/pac.c b/tools/testing/selftests/arm64/pauth/pac.c
index f4b859c75a5a..fb9a1e9f8491 100644
--- a/tools/testing/selftests/arm64/pauth/pac.c
+++ b/tools/testing/selftests/arm64/pauth/pac.c
@@ -14,6 +14,8 @@
 #include "helper.h"
 
 #define PAC_COLLISION_ATTEMPTS 1000
+/* exec_changed_keys is fork+exec heavy; scale down on slow machines. */
+#define PAC_SLOW_MACHINE_COLLISION_ATTEMPTS 250
 /*
  * The kernel sets TBID by default. So bits 55 and above should remain
  * untouched no matter what.
@@ -36,6 +38,16 @@ do { \
 		SKIP(return, "Generic PAUTH not enabled");	\
 } while (0)
 
+static inline int pac_collision_attempts(void)
+{
+	const char *slow = getenv("KSFT_MACHINE_SLOW");
+
+	if (slow && !strcmp(slow, "yes"))
+		return PAC_SLOW_MACHINE_COLLISION_ATTEMPTS;
+
+	return PAC_COLLISION_ATTEMPTS;
+}
+
 void sign_specific(struct signatures *sign, size_t val)
 {
 	sign->keyia = keyia_sign(val);
@@ -301,6 +313,7 @@ TEST(exec_changed_keys)
 	int ret;
 	int same = 10;
 	int nkeys = NKEYS;
+	int attempts = pac_collision_attempts();
 	unsigned long hwcaps = getauxval(AT_HWCAP);
 
 	/* generic and data key instructions are not in NOP space. This prevents a SIGILL */
@@ -309,8 +322,7 @@ TEST(exec_changed_keys)
 		TH_LOG("WARNING: Generic PAUTH not enabled. Skipping generic key checks");
 		nkeys = NKEYS - 1;
 	}
-
-	for (int i = 0; i < PAC_COLLISION_ATTEMPTS; i++) {
+	for (int i = 0; i < attempts; i++) {
 		ret = exec_sign_all(&new_keys, i);
 		ASSERT_EQ(0, ret) TH_LOG("failed to run worker");
 
-- 
2.54.0


