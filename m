Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B4D3C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 22:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k/UAkoyXYAAAj8ppLHSspsrG6Ksk9pE1Zj0H/JtivFc=; b=pEQaU9u/tlitFZi3AiDiXy3SaX
	pPzjGCuJIWuWRW7YJgPpn5FJL5nivTKW3cJSGiDgZ6OL5WF98HzCIUjppMehvGE73fw3hOBvQBOQl
	zpzST66xw9uDSUaMJcrva1P5suLFhLji1aXaQrH3y0RVOBJ4LRMzUPasf+vzYItlwUa52u5h28Lqr
	MAuqGDW5aIzQCSJil+aKf4W2L9XN+qQ9jsRwaOmHRxI4ba7lkRYAo5HrWCMX1qR3Vdn7n9hz7UV2Z
	9EXi269aAqNO9QUR+Ft8GP/cuuj7kKlYIiotqlRfj2gk5DuRP2R22AobvsavFJmoa0h0AH4fNc4jJ
	ptW+Bnuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tufEx-00000007ECc-2Jes;
	Tue, 18 Mar 2025 22:16:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tufDE-00000007Duh-32ME
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 22:15:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742336102;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=k/UAkoyXYAAAj8ppLHSspsrG6Ksk9pE1Zj0H/JtivFc=;
	b=TVEDB5S3Ol6wuiAM5ezMUsr2nrTq3GB2RXaWPF7grLZvGLEQa3gVps4HWUs+oRHqW7pSzZ
	j2IgR0Wc+t5/TeVD2/N7IwdEOSJoNGCGz/UytIlK3lQWNieJw+ukocE9eBUb2vci7C7/4v
	X1znz5IEHMsCjFGCoHaO/GlOFu2xEpw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-fh1LUqaoNwCHp8sieCunAQ-1; Tue, 18 Mar 2025 18:15:00 -0400
X-MC-Unique: fh1LUqaoNwCHp8sieCunAQ-1
X-Mimecast-MFC-AGG-ID: fh1LUqaoNwCHp8sieCunAQ_1742336100
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43947a0919aso26434555e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 15:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742336100; x=1742940900;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k/UAkoyXYAAAj8ppLHSspsrG6Ksk9pE1Zj0H/JtivFc=;
        b=wwCaSD0uZIUjzFJOVBhwsVPIpsZ6cwfA7xyO9Kn2h/7TNmuCfggLV9c3A9Sp7+lmq/
         iuL6uHUj9J/cNqc1SN6bQZW+/H/Id85RGG0r5lRoTm52Gb8fD1ehQ/njWbjfJkpCAQ1n
         H3WTuLWQA/FucU0RVKsrDXntmAwN8aLtuUmOsIv4SMCbWr4hvyokSXrhnBpQ3LGI458I
         PKPvxGx/2MHOlofvs1eSO2M0fK0Mvjj1s4BoR8Yw1n6mPJjeaO1a3czmw7DJL278BXWz
         cq/RKzR24q712N4MWXVabW4PF1FVMsdd+W9ImHL8nPFPW1scNJNj4uh13v8PlcW81TWN
         VOmg==
X-Forwarded-Encrypted: i=1; AJvYcCWAk/K5hPnY+a6kxvPKTeunFP9WmdJIUJvPZjWd2l/ieq9j5dkOYTSsTnO6BwxkBnQYzyyD1wNx7yoz89vHX06B@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5BWaAG08VOdnfOqh896+QhYb1z+HsWvq3nSDK3wEv2cSnSdDH
	06V+WnyY/tqWGc3AvrQGsa9VuD/suvQxddaeh7DYqtREHgWFt5Mux5jGCrEUT5Ib0nSdgxU0VjE
	G7tkmV2mVynvF7OGuzX/NSYG+yaOdTrQaL28vxSZAO+CLUTVOqlH4S2tyYVo4fXXMhWIQzSI/
X-Gm-Gg: ASbGncs0XV7jUSHQqbRUhbhsKlbbiNm9WtBOb9OSx5pkbVCYfSRRgtmAAwoBDPJhEMZ
	9I41SCdOETFnSQCKcd/8hcvwTF2zL4eenPomCiIsM55LSS/gEoIzshSWfscmtMCfFxmMCKlLEmt
	Dwa9BujCYTV5ojNFhlenZ111/y85m6mvoyO4c2QU8SMvjfozPbdRXLkonRrq2VdhAbGGysg4JUs
	L3DKVtu7lit2jIgoGRrtGByl/fcxjnuGUjWbwH45+6mPWxG7DvNWShEDoZ7GnmxdVeuWn3aYs67
	P8fnfLptStRpB8geyAn1T8/gy3lNBCTXC3iuCuseOQvjakwBlQU4tcVSSAkTsjPWZ6e0ONZzDlo
	i
X-Received: by 2002:a05:600c:5250:b0:43c:fc0c:7f33 with SMTP id 5b1f17b1804b1-43d43781e4emr2290005e9.2.1742336099691;
        Tue, 18 Mar 2025 15:14:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4p4iEcIpIkoqdTFEFOZVeOZYDgFaQD/Z05qK3YULm0myWGBlzWfRjIZbHbmsiH0EHYYUrsQ==
X-Received: by 2002:a05:600c:5250:b0:43c:fc0c:7f33 with SMTP id 5b1f17b1804b1-43d43781e4emr2289795e9.2.1742336099275;
        Tue, 18 Mar 2025 15:14:59 -0700 (PDT)
Received: from localhost (p200300cbc72d250094b54b7dad4afd0b.dip0.t-ipconnect.de. [2003:cb:c72d:2500:94b5:4b7d:ad4a:fd0b])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43d43f556a4sm317825e9.22.2025.03.18.15.14.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Mar 2025 15:14:58 -0700 (PDT)
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
Subject: [PATCH v2 0/3] kernel/events/uprobes: uprobe_write_opcode() rewrite
Date: Tue, 18 Mar 2025 23:14:54 +0100
Message-ID: <20250318221457.3055598-1-david@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: --0F774Dquj5DNXqGLAtx8odZoIrfY_iHPf_c1kDMmM_1742336100
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_151504_835745_2D9686E3 
X-CRM114-Status: GOOD (  17.68  )
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
 kernel/events/uprobes.c        | 356 +++++++++++++++++----------------
 3 files changed, 186 insertions(+), 180 deletions(-)


base-commit: 40caf747267c18b6206e26a37d6ea6b695236c11
-- 
2.48.1


