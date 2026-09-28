Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 872C6CA5FA2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 17:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ci6kw3U2QUuQ8iEQWyGnN3yV0fEIMUBiQ7ACCZCMmiU=; b=HbQ9rzVFOwFzd8GqPHegxqAalj
	Wnff0Ix1QrkfawJ14V+OJA1/TLtkDH5c1f/msbEpFx1dScxoh8cweZUKGhApAcF67H3WoYtLiJ3Y/
	JBeyqM0KHmVJj0b/MsMpUCs1egqdMlv4uTGUejOflleOtVzMiFINz3xKPuR+4htC3EYeU889ZBYgf
	H0oIP1s8gOgwPRIZrL1ofGfIJNMTfPhwFO1Lg52yziowSW6k6w3kGPk7QabbWKKTkUIIN44Seh4xU
	9xTnYlRnYcgYgRPNAJ7Rb1bo+HL9GmIH5dL5d5I8Ka7K89ChRtm9xYOt9bVCdSMrZ03slmd6cVwOH
	+5ZKNdzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFMa-00000001Chu-3fep;
	Mon, 28 Sep 2026 17:42:04 +0000
Received: from mail-wm1-x347.google.com ([2a00:1450:4864:20::347])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFMT-00000001CZN-3L7e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 17:41:58 +0000
Received: by mail-wm1-x347.google.com with SMTP id 5b1f17b1804b1-49e6ba4abdfso35203605e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 10:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790617316; x=1791222116; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ci6kw3U2QUuQ8iEQWyGnN3yV0fEIMUBiQ7ACCZCMmiU=;
        b=WOYmZFjWDMc1o857unRWoUYedOPYUyGF6YOZYySwNOuXAfIhilf4QCJkUN6RqYjpvW
         3dDhE3S9rNU8rpT5MhLRKKhfHmP6C331z7O92p2DuvyuUCZ6dk0HMLM8LP718RVrQn8d
         RcrztqMH9ABp0NrULmrVEhCuF1iqEXkab0035mMtpMT8AlIUolZK58mFCKQUd/M5HJ1S
         MalYcEsgf+l13ZkLO3OCycDWdpbAkDkAWJM5Oj0XntcsyOC1szFeI1n42exzo7kcPZYN
         yjK2lD5z7Gg+vYF32AZS0+TJYwq3sC8bVjtx+YH36bRcVuGNmKfcisUs6RB3zBbwkdYX
         3XXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617316; x=1791222116;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ci6kw3U2QUuQ8iEQWyGnN3yV0fEIMUBiQ7ACCZCMmiU=;
        b=j4YuKAFZGR3tV2ggt8MrZuEW7zL5Op2F6Ko4+kFofjZj/P9c0ZTgXPAB1IQBcLXCb7
         4PYCql+LJi7+Y8/hs1qkmuJhR6SJHRmGlMv9DVeonY8jDe510BScJjrUPM6Q/n9ronLI
         zF8AntUBYF4ClDG2g3S28OWH5I/eb3tD3YL9mSkmk92YCcCJJNrOiM6AUm+idv9mjGRP
         p1tGlQ1Br9/N5O1Fd2TgbP4M6JpkUWj4RmXMlhS+h+4vM3Ysm2h18M15rx8kFzR/4cff
         fslyisZuDQuC0TgKmIzEd8MKeaWdKPa9TCdd90fU583ZUL+IooJ+m5HWu80Uxh/rdIdN
         XGyg==
X-Forwarded-Encrypted: i=1; AKwUvBze1fR2RHKj95KrxJUI7gLmkRER/vGuzGQMD7eYROLpBWaL/BdugM2N1Xn906WynXoQPaLqjyVVXwCp6N0qcyx3@lists.infradead.org
X-Gm-Message-State: AFuF++mwiCDOEvGVND3KUdYMzkEZtyEnXO6/hgATfFPbqaAHetWUYzg6
	lli5YXkk4FECd6RhotxnX0tDcQvQU/748VSlQ/91gmZRfpvnBuQceLYp0Qb377PwS0TKdPsfaUo
	s+bTHwj34hEDK1g==
X-Received: from wmoz7.prod.google.com ([2002:a05:600c:787:b0:49f:e26d:37ea])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a16:b0:49f:eddb:bcb1 with SMTP id 5b1f17b1804b1-49feddbbe6dmr202116635e9.25.1790617315540;
 Mon, 28 Sep 2026 10:41:55 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:41:14 +0000
In-Reply-To: <20260928174122.3380703-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260928174122.3380703-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928174122.3380703-8-smostafa@google.com>
Subject: [RFC PATCH 07/15] usercopy: Don't assume the kernel stack size
From: Mostafa Saleh <smostafa@google.com>
To: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, linux-rt-devel@lists.linux.dev
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org, 
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, 
	akpm@linux-foundation.org, urezki@gmail.com, mingo@redhat.com, 
	peterz@infradead.org, juri.lelli@redhat.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, kprateek.nayak@amd.com, kees@kernel.org, 
	david@kernel.org, ljs@kernel.org, liam@infradead.org, vbabka@kernel.org, 
	rppt@kernel.org, surenb@google.com, mhocko@suse.com, gustavoars@kernel.org, 
	bigeasy@linutronix.de, clrkwllms@kernel.org, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_104157_859568_B51FDC89 
X-CRM114-Status: GOOD (  12.80  )
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

check_stack_object() assumes that the kernel stack size is
THREAD_SIZE.

The allocated kernel stack size may not be THREAD_SIZE anymore, rely
on the newly introduced helper task_stack_{low, high}()

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 mm/usercopy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/usercopy.c b/mm/usercopy.c
index 5de7a518b1b1..f31a42b9f9c4 100644
--- a/mm/usercopy.c
+++ b/mm/usercopy.c
@@ -36,8 +36,8 @@
  */
 static noinline int check_stack_object(const void *obj, unsigned long len)
 {
-	const void * const stack = task_stack_page(current);
-	const void * const stackend = stack + THREAD_SIZE;
+	const void * const stack = task_stack_low(current);
+	const void * const stackend = task_stack_high(current);
 	int ret;
 
 	/* Object is not on the stack at all. */
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


