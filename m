Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EEC5C35FFF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 11:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x+mJBPP4OyRbz1YPHbK6SqYX7BZklQ1ziSixoz9Cwdg=; b=2I4/50NlJstIIqMgB1g16GxTL5
	yaaHY+ro4pt0Lu19knIth19jBfZle+VYUER+LGeuYAQXsVPK8lA84fPc5heYdKXvJkIvF3ZXer6Lb
	I3BalBqPork2Vrv9UCS2egZHZFIVRlCr4RsbMXEiGKj/fudo9ylIjsy3OBEWwk+fZ2mw61tI0HxC+
	kI8gB9IVnF9yKBE50/+x8naUGB/3Y9XzxBKVx6sOxMUNaGfcIcTcSvagL3N9N9hqErO2MlFvbLqOK
	8l3//vwsQIcaek5iQ+vC/KHvNT0GE3j/Zl4zToNLrynq7Bl+8NT/7ojax9aVOh0lXVpMGnIBvCF2S
	fdVRG3OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvaiU-0000000EgbZ-3Xs1;
	Fri, 21 Mar 2025 11:39:10 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvagh-0000000EgAm-1hcr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 11:37:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742557038;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=x+mJBPP4OyRbz1YPHbK6SqYX7BZklQ1ziSixoz9Cwdg=;
	b=OnPNOEdaUAb0603FZnGmj9qli5H1bCzRtPhd94Sq/3sry/HmD/phISU2lii4Zj8wufNqJZ
	61fJLz0t8dAoaLdQTfoDsj2QLJ4J7d8cfQmzlcSkggqmJaOxskz98K5UnicySK0+Pu6vop
	YTaSKagOoo2Nx3/h6PZHoG3kUM37FQk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-0kU0S_l7PR22YmPKNTx7pA-1; Fri, 21 Mar 2025 07:37:17 -0400
X-MC-Unique: 0kU0S_l7PR22YmPKNTx7pA-1
X-Mimecast-MFC-AGG-ID: 0kU0S_l7PR22YmPKNTx7pA_1742557036
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43cf44b66f7so13680665e9.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Mar 2025 04:37:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742557036; x=1743161836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x+mJBPP4OyRbz1YPHbK6SqYX7BZklQ1ziSixoz9Cwdg=;
        b=MB5VbAQiTYjGlFk3WsjkEmuTKpBV6s3F6lVVGykzjR+bRaf3/d6KXZbH1OkbD6uHcK
         zDRIi4W/oR+VNYI6cVZtf1LBXtkIrbQJplro/bnmkAsgbq929xCdq76oe6H8k9MdrXi9
         omoIEtD1MpnBerSehVHpFjmnbFY+OblNVyZicznws8v92O+5RpGZgllcuNIc4ITqzbzq
         aheoCdBa68iOn6ZWM6WVJ0eMyjhjCIqC0CVZcqGAp8G0qytmb09DoHUT5luzN3aCEpLs
         XkqjzY4IDZH9/V9wIfBFQZOhmdAfTDm6rmrJxnfOaMvzTEpfwPhKmGs+IYloeRY1FUq+
         HBNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUG+h0mJ0eIsUem/2Ew1IWNkvHctTkxcVVnDVw8zSM6Qf7WheaREVa3VwjJ/T03OcaD68eRWs9aSDxvZJN9cqek@lists.infradead.org
X-Gm-Message-State: AOJu0YzUShYPstTn1XeH8LmB58M5O8IQnoaf3rYRpaBbJnVPMj0v+Ewd
	L1K0Osr87aPBqPFYrMWkTneuJ+rQciVS+OiJLJX/BUhdKtcFAMyivtZWjlQ27em9ky+hFb24aWI
	AnHtr7Vo30cSBYvedI38LtRu/bx1zHYZdAJfnPt8oZ8tcx8LGdgxWj2TmBciNB9Pu0M7RSJxzu+
	rkq5ZX7vc=
X-Gm-Gg: ASbGnctIz8DiYpKfTeuW9gZH4e9h0V9FeQ57yiVYxB5/Y6rA628RVm1m4H9d3+J+itE
	SeBLLSjOKgw09t0Z3yaP43yw9ocUNtKXyu4T7G1RktDHTw0959yF7tHIo/oHJzVVepG2Wmf/n2V
	vUd+0PAaxfxFFj0UDTV1Z/QEt4owX1wo5+6MBqS/4lG8JzEmDMAy+om62D5rqUJezU2X6TbXQ7Y
	abeQ/rmDhCIu/wtM+vavNX21afb9btupTwjk4o7I+n3pBWjKhipouSSTbdKe3F2MtWhEPRVZ47x
	IK5xTvWwpn0UcmLng4XqcqK8rMEckeO7Ag43KyMtAWTztI6nzChyEQ5EyJqXGZhOCHplFRjpYkS
	t
X-Received: by 2002:a05:600c:46d4:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-43d50a3c727mr21485995e9.29.1742557035824;
        Fri, 21 Mar 2025 04:37:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8jWRwes7cQo0FozbXH73O1PRogEZobnhjyiHSnZdwP0RxfnyF5j8N2/ON0F3RDDPu3SAvoQ==
X-Received: by 2002:a05:600c:46d4:b0:43d:172:50b1 with SMTP id 5b1f17b1804b1-43d50a3c727mr21485595e9.29.1742557035319;
        Fri, 21 Mar 2025 04:37:15 -0700 (PDT)
Received: from localhost (p200300cbc72a910023d23800cdcc90f0.dip0.t-ipconnect.de. [2003:cb:c72a:9100:23d2:3800:cdcc:90f0])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3997f9957efsm2174115f8f.14.2025.03.21.04.37.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 04:37:14 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrii Nakryiko <andrii.nakryiko@gmail.com>,
	Matthew Wilcox <willy@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	"Liang, Kan" <kan.liang@linux.intel.com>,
	Tong Tiangen <tongtiangen@huawei.com>
Subject: [PATCH v3 0/3] kernel/events/uprobes: uprobe_write_opcode() rewrite
Date: Fri, 21 Mar 2025 12:37:10 +0100
Message-ID: <20250321113713.204682-1-david@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0vLlSos6X5K1rzYQweKvMH1u2XXl6npGDlOoqc_Tj9U_1742557036
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_043719_600854_C3EE6C88 
X-CRM114-Status: GOOD (  17.60  )
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

Based on mm/unstable.

Currently, uprobe_write_opcode() implements COW-breaking manually, which is
really far from ideal. Further, there is interest in supporting uprobes on
hugetlb pages [1], and leaving at least the COW-breaking to the core will
make this much easier.

Also, I think the current code doesn't really handle some things
properly (see patch #3) when replacing/zapping pages.

Let's rewrite it, to leave COW-breaking to the fault handler, and handle
registration/unregistration by temporarily unmapping the anonymous page,
modifying it, and mapping it again. We still have to implement
zapping of anonymous pages ourselves, unfortunately.

We could look into not performing the temporary unmapping if we can
perform the write atomically, which would likely also make adding hugetlb
support a lot easier. But, limited (e.g., only PMD/PUD) hugetlb support
could be added on top of this with some tweaking.

Note that we now won't have to allocate another anonymous folio when
unregistering (which will be beneficial for hugetlb as well), we can simply
modify the already-mapped one from the registration (if any). When
registering a uprobe, we'll first trigger a ptrace-like write fault to
break COW, to then modify the already-mapped page.

Briefly sanity tested with perf probes and with the bpf uprobes
selftest.

v2 -> v3:
* Fix missing folio_put()

v1 -> v2:
* "kernel/events/uprobes: uprobe_write_opcode() rewrite"
 -> hold GUP reference longer so we can see if the page is still
    mapped when performing the folio_walk
 -> Move anon-folio check
 -> Reshuffle / cleanup some related things

RFC -> v1:
* Use folio_walk and simplify the logic

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Russell King <linux@armlinux.org.uk>
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Oleg Nesterov <oleg@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Ian Rogers <irogers@google.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: "Liang, Kan" <kan.liang@linux.intel.com>
Cc: Tong Tiangen <tongtiangen@huawei.com>

[1] https://lkml.kernel.org/r/ZiK50qob9yl5e0Xz@bender.morinfr.org

David Hildenbrand (3):
  kernel/events/uprobes: pass VMA instead of MM to remove_breakpoint()
  kernel/events/uprobes: pass VMA to set_swbp(), set_orig_insn() and
    uprobe_write_opcode()
  kernel/events/uprobes: uprobe_write_opcode() rewrite

 arch/arm/probes/uprobes/core.c |   4 +-
 include/linux/uprobes.h        |   6 +-
 kernel/events/uprobes.c        | 357 +++++++++++++++++----------------
 3 files changed, 187 insertions(+), 180 deletions(-)


base-commit: a150906197a12c7b0f3f5efd844443bf98453efa
-- 
2.48.1


