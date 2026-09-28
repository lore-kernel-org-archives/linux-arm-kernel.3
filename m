Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C6E8CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 17:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/R3jIsuFxLI+ycNCkUkycnkKQylo65Jf0ypcBShLiJ0=; b=JGvfKS0bEBME4U12VZHjYIL+Y/
	PmgLmHiGJVVOGOHl/9kyN34BhjRBeZcMLDw1zzoYZmaTZrPXOT5yIR9CqurCNEY9fh+0viOo/sB8i
	lBvlSR876yZZSTvSNZAXbvo7nIsDpNJVLnAOT46pB9hddr2wC1tsskK0jhIAMhX2Uoe876jxdtT7k
	3jTyxDFgiRVyjHEeYyFDrrBby/7DR+25TYB6FpnROpDqjXzYeEcVVES9gioN/OGha6EU6Nc4I1eeg
	wwrO29yR8SzezoioNOYKUrK6ynDWHp2+QxOo8JMXJKdbbY+MvBI9S+kNRyo+fNbPyrZQN1kwYs2VO
	LXOrgvfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFMa-00000001CfN-02yt;
	Mon, 28 Sep 2026 17:42:04 +0000
Received: from mail-wm1-x348.google.com ([2a00:1450:4864:20::348])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFMM-00000001CV4-3Epd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Sep 2026 17:41:52 +0000
Received: by mail-wm1-x348.google.com with SMTP id 5b1f17b1804b1-49e661c6440so22454385e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Sep 2026 10:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790617308; x=1791222108; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/R3jIsuFxLI+ycNCkUkycnkKQylo65Jf0ypcBShLiJ0=;
        b=Xfl8p0oTqj+GslDnquYOYe91NR2ELIbainXKNCTarNk6enOxOgbhoHhTIKyFvxFzoh
         Oj16Z4zkAX/Q8NbOKC/FSkv8+bkPw0nSg+YjUOWsdprJ2ECNSVbseWkBhb/JBXa2EqL5
         rwWaK+/HjK0Q8dmrcEKRoCr8u6zKtbYVx7VTJytZpA/4aSwky+zu3FzbO6Tse8M4jNq3
         thIHXBBMFkg/FX1vaUv0BrgDxiagRjYSUKNW0FNOCz0JjqVZkHFKn2bpEE0B9AFX/h3H
         hUCE0NktS/dDkI49hhBvvHmux7DLwpScq9xBPjjwZw3SDjNwId5q+2esdp7CBMionHxR
         N3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790617308; x=1791222108;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/R3jIsuFxLI+ycNCkUkycnkKQylo65Jf0ypcBShLiJ0=;
        b=YmhWJW5eDpLXFqzOc5sszSD5N1hU8HYEVu2CQwVbPa0PcA1PUVnP0W1SgFMtbzW0dD
         401ilmQSf2uSi5MdZt3CCasLN8qpE0IGGY1DwlaL0jtIDVsZeYipoRC5ypQstpxAAVdL
         mOo6NMGp3CIG4sB7BTTXI7jOHSQBtj2g2O7S4ICR7m/Mh+XoMMklVoqHEFD5hD/cTvqP
         nMdvTaLU6UDOUrSSFc8Hs+i28Ok7oSVHJPWbQwCc4TOpghhZTppwUXe2WvmWZe7//CYd
         bhXx50YlGrrpywa8sxgVUBMsK+L0GBxfXo85wBDV2IucE41KE1OthUsUpe+iMWUeIKYi
         PHWw==
X-Forwarded-Encrypted: i=1; AKwUvBwvN28VwRyf//+CLFbyYHQdC0v3MY9/w9nXsxQfba2AgaUPHVyQ0aqFqazdOH1dTvd+tDaAYJnjM660OvlHWC7Q@lists.infradead.org
X-Gm-Message-State: AFuF++k3/mZpxlhQFzV6DjARxcmFTu0iLo49VRAsHugYq9h+VvEcecyj
	rJ5uY/HlOe5zXIud2pI7yuNIV4XMgfP8m7dqTxjafENKrFVKZ+9Evr+oGUiMhtJfZXnEalesrqc
	Vwh/5apFhzjRHIA==
X-Received: from wmoy19.prod.google.com ([2002:a05:600c:17d3:b0:4a0:23b:31a7])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b1b:b0:49c:de80:b833 with SMTP id 5b1f17b1804b1-49fe66c8a1emr263025785e9.2.1790617308191;
 Mon, 28 Sep 2026 10:41:48 -0700 (PDT)
Date: Mon, 28 Sep 2026 17:41:08 +0000
In-Reply-To: <20260928174122.3380703-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260928174122.3380703-1-smostafa@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20260928174122.3380703-2-smostafa@google.com>
Subject: [RFC PATCH 01/15] fork: Remove assumption that vm_area->nr_pages
 equals to THREAD_SIZE
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
	Pasha Tatashin <pasha.tatashin@soleen.com>, Linus Walleij <linus.walleij@linaro.org>, 
	David Stevens <stevensd@google.com>, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_104150_833235_3E4FE1FB 
X-CRM114-Status: GOOD (  15.71  )
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

From: Pasha Tatashin <pasha.tatashin@soleen.com>

In many places number of pages in the stack is determined via
(THREAD_SIZE / PAGE_SIZE). There is also a BUG_ON() that ensures that
(THREAD_SIZE / PAGE_SIZE) is indeed equals to vm_area->nr_pages.

In the next patches the kernel stack size will not be a compile
time constant and would be less than or equal THREAD_SIZE based
on a command line arg. Therefore, use vm_area->nr_pages to
determine the actual number of pages allocated in stack.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
[Rebased, also skipped intermediary helper variable nr_pages]
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: David Stevens <stevensd@google.com>
[Update commit message]
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 kernel/fork.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/kernel/fork.c b/kernel/fork.c
index 5ef413368912..2065693e762c 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -315,9 +315,7 @@ static int memcg_charge_kernel_stack(struct vm_struct *vm_area)
 	int ret;
 	int nr_charged = 0;
 
-	BUG_ON(vm_area->nr_pages != THREAD_SIZE / PAGE_SIZE);
-
-	for (i = 0; i < THREAD_SIZE / PAGE_SIZE; i++) {
+	for (i = 0; i < vm_area->nr_pages; i++) {
 		ret = memcg_kmem_charge_page(vm_area->pages[i], GFP_KERNEL, 0);
 		if (ret)
 			goto err;
@@ -488,7 +486,7 @@ static void account_kernel_stack(struct task_struct *tsk, int account)
 		struct vm_struct *vm_area = task_stack_vm_area(tsk);
 		int i;
 
-		for (i = 0; i < THREAD_SIZE / PAGE_SIZE; i++)
+		for (i = 0; i < vm_area->nr_pages; i++)
 			mod_lruvec_page_state(vm_area->pages[i], NR_KERNEL_STACK_KB,
 					      account * (PAGE_SIZE / 1024));
 	} else {
@@ -509,7 +507,7 @@ void exit_task_stack_account(struct task_struct *tsk)
 		int i;
 
 		vm_area = task_stack_vm_area(tsk);
-		for (i = 0; i < THREAD_SIZE / PAGE_SIZE; i++)
+		for (i = 0; i < vm_area->nr_pages; i++)
 			memcg_kmem_uncharge_page(vm_area->pages[i], 0);
 	}
 }
-- 
2.56.0.rc1.315.gc6ed9934b7-goog


