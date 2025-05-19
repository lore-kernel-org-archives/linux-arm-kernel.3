Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2FC4C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 19:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:
	From:Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WPHkK6AJb2aIuP4Pg4NSQD55GV+jm/GYycppUOoBB24=; b=woR8FBB5eMBYbwHLp4YJ4GsCTE
	Mbd64oBWqtSUo6NONrwTPPOZ9N1+dvupY8qZzLTE6OgQ0frqI69FcHZn7NrZwLu8YStRZC9G4QanZ
	EI1hopR/bQJvORAvU9mp0YpxKNbq6G2RKpLSUFO2t1Sr/OnMC5++ZjvnPE/lD29R5LmXFgVETbLZa
	NhuW/yzJpWpz6nT/gXdWydV0zcwfDjxwJIITZ28OVeFbEe+wZw1ih56n2AVS+Eju155bXN+CrwJ9T
	95y36/e3mbKz+Q0+YzAd2VWP53FvjdZP43tD4QaFOLWYIuiBpmcnGIUi7YKHGMdf1xuQQblxigW2n
	mNNnt3JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH6aZ-0000000AIXc-0tCY;
	Mon, 19 May 2025 19:55:55 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH5e6-0000000ABPL-3JlB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 18:55:31 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b26cdc70befso3087822a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 11:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747680929; x=1748285729; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=WPHkK6AJb2aIuP4Pg4NSQD55GV+jm/GYycppUOoBB24=;
        b=zYBHU0ZkPods7BmwUZLiTUz4XwbQ65C6bu/czANe26ICGQr+L7ablb7HH6VdTBxpyt
         Afasu+TjycLy0pCOmN1+siog+LCl9lwiHAnVNG20leQ1iSj+6icFYPutztdrhBdqW55I
         uJkWJNHTzz9CWdze4gWetVpFil8/Pvl90xPKnBu8s5Ux82nb3uTTovOMRt2m8SBYcHIy
         GD1ymVZU7GUKoG4T5d9Nbtf3aVd9bbiDLNb0htevJTDf4eDoDbjG+Ry5+lt37MD4Me0e
         9fR8QN3+12fGyuZhhNiqB32J4k9ZQ5CbRJNOw+e/Qz6WSZ0bVZmagllBO/TFSzQ2YR6C
         cbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747680929; x=1748285729;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPHkK6AJb2aIuP4Pg4NSQD55GV+jm/GYycppUOoBB24=;
        b=qFuiCLHxY3GHuhoxE1TSFTreP4UlZq7BQXqLzKSnDTowMfLeaQ29U9Xk0DnqIDqN05
         69G5mU1lGItl2Zho7xM4KluMjfjN/JrM4IHTHaLW2Gvyp3hzXPJyVEklVR5BvBrRUFxi
         nAmSNR/Rnqq+OCUOxupXdRjLVShKyteJriz0pnkckedeisFkh7lfj4rTB7YonLDt3lV0
         NscdAoNgT8XGowYH8VvQotfK1pK9he2Npw3w+W0oEoVvoJsTgglpgWTHPDjRZh/67ue5
         R1B+EWu8BXarpxlA8Ad4+QlLafDN8rZcitjZFeDsyRB89/YcupdlnCLPHYUqenjWUFhw
         CPpA==
X-Forwarded-Encrypted: i=1; AJvYcCU9AX8TGr6oTaM8bPJrUIJD/3ErWybyqWeN4mkeqxUCSHLoq2eXSmjVF1pVzTBXOtBAPqL83UiDiSAHKUDI2E7u@lists.infradead.org
X-Gm-Message-State: AOJu0YwI6gWNXC66swHdRRsCQlXHuPAK8wRGUtQJ8IgHWA7H3XSqQKHG
	8Qx6KAOKHBXDPrzm9kowLKRkuPcN9wporpHyA78lcZtReTpRzpQ2khymWImB9Qh9ZsX3evCKleW
	ZAU5j3Q==
X-Google-Smtp-Source: AGHT+IHK1Zr4h0D2c9hfvihT1HBAYjdqDVsYafOfJ/1g69C6YEZd33VFtqEq4B23tLL0mdweYF147yQWVb0=
X-Received: from pjbpv10.prod.google.com ([2002:a17:90b:3c8a:b0:30e:5bd5:880d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d445:b0:30e:a1ec:68dd
 with SMTP id 98e67ed59e1d1-30ea1ec68e8mr16388245a91.8.1747680929524; Mon, 19
 May 2025 11:55:29 -0700 (PDT)
Date: Mon, 19 May 2025 11:55:08 -0700
In-Reply-To: <20250519185514.2678456-1-seanjc@google.com>
Mime-Version: 1.0
References: <20250519185514.2678456-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519185514.2678456-7-seanjc@google.com>
Subject: [PATCH v2 06/12] sched/wait: Add a waitqueue helper for fully
 exclusive priority waiters
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	K Prateek Nayak <kprateek.nayak@amd.com>, David Matlack <dmatlack@google.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_115530_827659_B78BEC12 
X-CRM114-Status: GOOD (  14.45  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Add a waitqueue helper to add a priority waiter that requires exclusive
wakeups, i.e. that requires that it be the _only_ priority waiter.  The
API will be used by KVM to ensure that at most one of KVM's irqfds is
bound to a single eventfd (across the entire kernel).

Open code the helper instead of using __add_wait_queue() so that the
common path doesn't need to "handle" impossible failures.

Note, the priority_exclusive() name is obviously confusing as the plain
priority() API also sets WQ_FLAG_EXCLUSIVE.  This will be remedied once
KVM switches to add_wait_queue_priority_exclusive(), as the only other
user of add_wait_queue_priority(), Xen's privcmd, doesn't actually operate
in exclusive mode (more than likely, the detail was overlooked when privcmd
copy-pasted (sorry, "was inspired by") KVM's implementation).

Cc: K Prateek Nayak <kprateek.nayak@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 include/linux/wait.h |  2 ++
 kernel/sched/wait.c  | 18 ++++++++++++++++++
 2 files changed, 20 insertions(+)

diff --git a/include/linux/wait.h b/include/linux/wait.h
index 965a19809c7e..09855d819418 100644
--- a/include/linux/wait.h
+++ b/include/linux/wait.h
@@ -164,6 +164,8 @@ static inline bool wq_has_sleeper(struct wait_queue_head *wq_head)
 extern void add_wait_queue(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry);
 extern void add_wait_queue_exclusive(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry);
 extern void add_wait_queue_priority(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry);
+extern int add_wait_queue_priority_exclusive(struct wait_queue_head *wq_head,
+					     struct wait_queue_entry *wq_entry);
 extern void remove_wait_queue(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry);
 
 static inline void __add_wait_queue(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry)
diff --git a/kernel/sched/wait.c b/kernel/sched/wait.c
index 51e38f5f4701..03252badb8e8 100644
--- a/kernel/sched/wait.c
+++ b/kernel/sched/wait.c
@@ -47,6 +47,24 @@ void add_wait_queue_priority(struct wait_queue_head *wq_head, struct wait_queue_
 }
 EXPORT_SYMBOL_GPL(add_wait_queue_priority);
 
+int add_wait_queue_priority_exclusive(struct wait_queue_head *wq_head,
+				      struct wait_queue_entry *wq_entry)
+{
+	struct list_head *head = &wq_head->head;
+
+	wq_entry->flags |= WQ_FLAG_EXCLUSIVE | WQ_FLAG_PRIORITY;
+
+	guard(spinlock_irqsave)(&wq_head->lock);
+
+	if (!list_empty(head) &&
+	    (list_first_entry(head, typeof(*wq_entry), entry)->flags & WQ_FLAG_PRIORITY))
+		return -EBUSY;
+
+	list_add(&wq_entry->entry, head);
+	return 0;
+}
+EXPORT_SYMBOL(add_wait_queue_priority_exclusive);
+
 void remove_wait_queue(struct wait_queue_head *wq_head, struct wait_queue_entry *wq_entry)
 {
 	unsigned long flags;
-- 
2.49.0.1101.gccaa498523-goog


