Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FCD1C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 17:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p2Pxjq3EDch+A/Cg612+l2rXRgJSHzOfWsjrEl5gKfw=; b=erhlyoi6DxmKHEMEFTeIQW3yEX
	nw2VAZ/QZVUQu2o4ywcIT0gjxL87IPby6bG+aHOMBtAl8KORZ/3xIV759vLQa2hEH/OUU/hV/Tf4E
	fT4L9zwiQwkVC3oVPlANaPbrAg7XJTM8rE1hqTNd6dXpiz+/8uzkUm6TD8ybV7ELpu82lItaoHFXh
	hYhXsHAS94gJxEOhYJyFPZlYWSaXT6ZUGRPYKzaSOddGzeNE+gp8HeF8sZqXtNJiiFIcT4nhQ2Y5I
	eM7MIZTwx7by8WbMXtCAM0DYbiktujy7lMy+3O9LuHD2HM1LWMnFEE7qrcaVVI9h4N2NkDQZn0on/
	ArKQebug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVgY-00000005Xf7-3cG5;
	Tue, 04 Mar 2025 17:04:02 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUVp-00000005Hig-317L
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 15:48:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741103332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p2Pxjq3EDch+A/Cg612+l2rXRgJSHzOfWsjrEl5gKfw=;
	b=dSohKzmkrDbQUkbHCt5QsBwbe4/qza/EWqnuLinY9HokpoL7io1LOpl0Nrftq2FSKeTDUx
	UGVxwNI3g1W0ZBE0xHGrKWQ1/2lFL5ArF/qVbMAYlw43bKgdHZp2gDW3gairK1uOl1KHRO
	jGT/UnelDt9q8Fa7BAwmCa1u0p2pa8Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-629-NVKc7ugENn6FxTnc64-63g-1; Tue, 04 Mar 2025 10:48:50 -0500
X-MC-Unique: NVKc7ugENn6FxTnc64-63g-1
X-Mimecast-MFC-AGG-ID: NVKc7ugENn6FxTnc64-63g_1741103329
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43bcc04d2ebso7374665e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 07:48:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741103329; x=1741708129;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p2Pxjq3EDch+A/Cg612+l2rXRgJSHzOfWsjrEl5gKfw=;
        b=vjIOrIahxLQKFWQR5X0Fja4tzxF+1nMnGYNTXqZT7PeZjBIi3yBxXtJpfpeZrBfDr3
         eMmfNo+kzBJoMZy9VfupHH5+kDzg+wsm03M9GG3BwCI9RiQBX+fLl38zOc8DOBHOmnBM
         Xf9kRMfVOettHNOMu11EUFv7P4v6nY5lNIsIHfaZ1uXMdg9bQ3h+TQ2NTVggPS8wmLKS
         eACgp+mzQ2L7JH1yEJrP+10KEdSNk1o8ONN0o9n5EJHDsOFcagZ0rxC5IVcVQeVVS6Tb
         gCxGYUn3LefWeN1g9MybFjR3SUfV19gqWqMUR8MIyP9UKwYZdAwE3L9yfN2LmZmUpDep
         vRPQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7mIi+dfWD2nLapCwSrkdsRNpoRhA+nToi/HE+tv9jilb5UAZMAOxAQZgsrwEhRVi2T+fzB8InSvPzi5jPHHFL@lists.infradead.org
X-Gm-Message-State: AOJu0YwmVctyfyqrf9H3LdYT1BlsP3CglvUXTJVin/wY0uKKVSMlZQg/
	pL78VBtoW+W5RmDTkVXCPWvCFw+3kde++nMp4OmX6FcODGK0D4TZIbqgm8FuzoGFc+7ytb3LsWh
	W/QpRKxyozEzpcIqcRvkLg2xt+SVGb8SRDPpx7wtJztqjLh/aYtq/O7ACiHLB6Oiu2b5LqSge
X-Gm-Gg: ASbGncs+uh43ThBtcAYE0IUV4ovAO/Uh4hbTLSMuVeA3FvXF6413A5Rxr36iSyvegDt
	D88NkirsCPVB3duKFmPVhAE+0VFQg29J9g1kss38fLOS4Fqbl1oT1+KipuLnuDGA1LUfukDgVo/
	0TcyAu/cZfbW9oCSn3OwYl0O9lyrOsgChEaEWvVr4jbyyA7cMQIW8eArfUuUNqWZcVZFg0nYtTv
	wX1Xi2RlI3xwaAHW8RFsN8wiMg4mvit6CO6kUSkPujwQw/glc5xur5oxwb4EY1CWG+dCu66Op13
	xERNZoveFSa4yx12VLlGNPQKEuirYdc/LmdcM/c9RB7c0ICwvv6lHjP+HHa+w5WCqG4Cw8Nd3yA
	U
X-Received: by 2002:a05:600c:1ca3:b0:439:985b:17d6 with SMTP id 5b1f17b1804b1-43ba6a84156mr139615205e9.27.1741103329017;
        Tue, 04 Mar 2025 07:48:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHjd2+i+XCDKVaF6WffRx7pSoxLHgB+maZpDEGPGTkxHNk1T3itxVJ3f3AFoBMJYSPfmfvO7g==
X-Received: by 2002:a05:600c:1ca3:b0:439:985b:17d6 with SMTP id 5b1f17b1804b1-43ba6a84156mr139614845e9.27.1741103328593;
        Tue, 04 Mar 2025 07:48:48 -0800 (PST)
Received: from localhost (p200300cbc73610009e302a8acd3d419c.dip0.t-ipconnect.de. [2003:cb:c736:1000:9e30:2a8a:cd3d:419c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-390e47a7868sm17932287f8f.24.2025.03.04.07.48.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 07:48:48 -0800 (PST)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
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
Subject: [PATCH -next v1 0/3] kernel/events/uprobes: uprobe_write_opcode() rewrite
Date: Tue,  4 Mar 2025 16:48:43 +0100
Message-ID: <20250304154846.1937958-1-david@redhat.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: uXKF2jqrR91cZ55TzGeYeNOVddvwKiMq3dLwaRQx0WI_1741103329
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_074853_829045_B7492C36 
X-CRM114-Status: GOOD (  20.25  )
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

Based on -next, because a related fix [1] is not in mm.git. This is
the follow-up to [2] (later than I wanted to send it out), now that
Willy also stumbled over this [3].

Since the RFC, I rewrote it once again, now using a folio_walk instead of
our old pagewalk infrastructure.


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

Briefly sanity tested with perf:
  [root@localhost ~]# perf probe -x /usr/bin/bash -a main
  ...
  [root@localhost ~]# perf record -e probe_bash:main -aR sleep 10 &
  [1] 2196
  [root@localhost ~]# bash
  [root@localhost ~]# exit
  exit
  [root@localhost ~]# bash
  [root@localhost ~]# exit
  exit
  [root@localhost ~]# [ perf record: Woken up 1 times to write data ]
  [ perf record: Captured and wrote 0.287 MB perf.data (8 samples) ]
  ...
  [root@localhost ~]# perf report --stdio
  # To display the perf.data header info, please use --header/--header-only optio>
  #
  #
  # Total Lost Samples: 0
  #
  # Samples: 8  of event 'probe_bash:main'
  # Event count (approx.): 8
  #
  # Overhead  Command      Shared Object  Symbol
  # ........  ...........  .............  ........
  #
      75.00%  grepconf.sh  bash           [.] main
      25.00%  bash         bash           [.] main
  ...

Are there any uprobe tests / benchmarks that are worth running?

RFC -> v1:
* Use folio_walk and simplify the logic

Cc: Andrew Morton <akpm@linux-foundation.org>
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

[1] https://lkml.kernel.org/r/20250224031149.1598949-1-tongtiangen@huawei.com
[2] https://lore.kernel.org/linux-mm/20240604122548.359952-2-david@redhat.com/T/
[3] https://lore.kernel.org/all/d7971673-19ed-448a-9e54-8ffbde5059dc@redhat.com/T/
[4] https://lkml.kernel.org/r/ZiK50qob9yl5e0Xz@bender.morinfr.org

David Hildenbrand (3):
  kernel/events/uprobes: pass VMA instead of MM to remove_breakpoint()
  kernel/events/uprobes: pass VMA to set_swbp(), set_orig_insn() and
    uprobe_write_opcode()
  kernel/events/uprobes: uprobe_write_opcode() rewrite

 arch/arm/probes/uprobes/core.c |   4 +-
 include/linux/uprobes.h        |   6 +-
 kernel/events/uprobes.c        | 363 +++++++++++++++++----------------
 3 files changed, 190 insertions(+), 183 deletions(-)


base-commit: cd3215bbcb9d4321def93fea6cfad4d5b42b9d1d
-- 
2.48.1


