Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A8ACCE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 00:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ECcRFPnZSJ/74qLcUT1nDtXwbFmCLS0/Z+AkSmPgFFQ=; b=pgVG+d8VSzLuynIY8KjRqhalvd
	ca4VyOMxo0Bjzl0Uvdd3TyNo5lmdGjYV58b/AmSxXmzlLd2VkfDvU2KrJaA7dYvDfjBrxMWeZ5ql/
	9+ekdQjoBS1zBJzZQQLYMppvpUYzF/4+fDrt/hFC+XPyY8nxJwYe4BmhrJkB6Z7ohtnFW4P/8eqiK
	+Z3/TpNl34UDpTysZ9LRSGsbd9Yi0cp3OMqCBrYAw8OvD5/H7MAXiE1hgMdT+3N4CaTzis7qnKd1A
	225JmLgTPnIrslmquJeg8gmX998HMzRkzdbYKYrnEH3XXFnG5SqrGVncuLEXOWig+OuFsHwthT5KH
	J/7HxWtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9y7-0000000H5Vh-2bBu;
	Tue, 18 Nov 2025 00:53:16 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL9y5-0000000H5UW-0ef4
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 00:53:14 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-297ea4c2933so3662275ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Nov 2025 16:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrife-io.20230601.gappssmtp.com; s=20230601; t=1763427192; x=1764031992; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ECcRFPnZSJ/74qLcUT1nDtXwbFmCLS0/Z+AkSmPgFFQ=;
        b=uniamd0FJQj/5mRcHJlnSUTW3waD+y2qHkDsJ2qSi0pbSw7H7D8jiU1oEwiFHidjuB
         i2rLieai9gQD7/WeufngKDot8NNoqk4SjH3Am+efGvmmw8oHBFWTNg9MLhqLZJ244rTl
         lByyD+3CNOzLRx9w9ANhMhYtg4HqcvHhlOq3Tia1wSSCfLmQEhrwAupVISDYrtcg3Zse
         KGRiB64ZomjnXyIfGR54iAok5J51bWzw2laHANRa6bcdQchSO3jjz6n6IHHm9RKupPef
         vFnsrp8yBKJJgvaLuLunDebyXZxzy0UuyQOrEdu3XmZC3ELKexQs4a1Kchu22JIg4xEw
         5xww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763427192; x=1764031992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ECcRFPnZSJ/74qLcUT1nDtXwbFmCLS0/Z+AkSmPgFFQ=;
        b=Dzf/oHqDpORwJvHC9pe2u2DYV+LDDGLOTwgDiPu5AIx6gIk1IF3EOYm0T8zFdlQx53
         oLMcopyTFlz+vN3TuEm7wlTEreoQuIRvH2K1HMWGiQeUksMXFIBSedpBKo/8sgMVC+/3
         1OGwjsPUzfBaDeKClElRbbvqS8fgW515xoSewQqTM+yqvFialUM1DLMjESjXruKGHiAU
         RdzNvOLEaDx7Aop9ZwM6dbjIc0TWU95dlK25BuOZFC+VWH5HoDcyWpBMclhk5gjXW0Pk
         DJYr8TW2W/J65/Amo4kE1at5zo2iioqx7LGLX6j0fcSwQ0+qaOxQEmBvcZ6hFjVHq8ZZ
         YpVw==
X-Forwarded-Encrypted: i=1; AJvYcCW69ei7qMb5/9htAlyTXqgpGjo092qHHUSyKiBuyl8Sp45q29WuMZNjpitlhwIPuPC3qV/WlSjAlUoA3+1EC3aJ@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu3nR1bHDQKlXn/cA3rmd7oDcYN3P+vysIhQjpWt9ac/4gIkoE
	eSiqvBxa0xqZS5auYfa9l47wOSmtCDBUqroEnYS46GFqqvL74kwkaUdvTDiUt3XjP+4=
X-Gm-Gg: ASbGncvFFNQSnUhOdrn5jpAAumktLJXI/e+7UzfV0fSV8JxgayliV73JeT6VUIeTo0q
	3FSXyCGt2XMGcY/T+QDEoIW+qHgt+HgP3R5/4xkTug7xwITgRDJJLnc/kHXdq+wOdLhfzgAhcDN
	VWPoRLq2Bv9qraR602ffL2nyZuB44pbtnymJ4QprTu3nqHQJ8pL85307D5sH/1ycaVIB6dB5wXB
	xIyHKyMWzAyNPGKK87GLOrDVW6Ci0arhlnChkJ1/4teBQtMp72gGS4/KTE0apyimEt3/+iA3GZ6
	mt4CZAzbCyHpxya/Jx8FV/9PRKsDzfntV4m0O8JIp/lK+tNgOvW1q/dhZLdZCmJWNfZFiAHmHwD
	aQl9mdFQ8fMX7N8UF3i68rSBZP6pOz7XxaxNcQlh7VSZPhP1ZJ+YNraAT1R/g+yIK
X-Google-Smtp-Source: AGHT+IEjPzaJypGOyu7ighv5aVAvafyjybl9abS/IeF+SU6SIlOj40X9SRbCB6CrI/miT/nJFjWaxw==
X-Received: by 2002:a05:7300:fb05:b0:2a4:3593:5fc8 with SMTP id 5a478bee46e88-2a4abb56fe7mr4474649eec.2.1763427191866;
        Mon, 17 Nov 2025 16:53:11 -0800 (PST)
Received: from t14.. ([2001:5a8:47ec:d700:ef59:f68f:7ffe:54f2])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a49d9ead79sm67568555eec.1.2025.11.17.16.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 16:53:11 -0800 (PST)
From: Jordan Rife <jordan@jrife.io>
To: bpf@vger.kernel.org
Cc: Jordan Rife <jordan@jrife.io>,
	linux-arm-kernel@lists.infradead.org,
	linux-s390@vger.kernel.org,
	x86@kernel.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Puranjay Mohan <puranjay@kernel.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Ingo Molnar <mingo@redhat.com>
Subject: [RFC PATCH bpf-next 0/7] bpf: Implement BPF_LINK_UPDATE for tracing links
Date: Mon, 17 Nov 2025 16:52:52 -0800
Message-ID: <20251118005305.27058-1-jordan@jrife.io>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_165313_435089_BCC5C57D 
X-CRM114-Status: GOOD (  12.99  )
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

Implement update_prog for bpf_tracing_link_lops to enable
BPF_LINK_UPDATE for fentry, fexit, fmod_ret, freplace, etc. links.

My initial motivation for this was to enable a use case where one
process creates and owns links pointing to "hooks" within a tc, xdp, ...
attachment and an external "plugin" loads freplace programs and updates
links to these hooks. Aside from that though, it seemed like it could
be useful to be able to atomically swap out the program associated with
an freplace/fentry/fexit/fmod_ret link more generally.

Implementing program updates for freplace links was fairly
straightforward but proved more difficult for the other link types. The
third patch in this series discusses some other approaches I considered
before settling on the current approach, but I'd appreciate others'
input here to see if there is a better way to implement this that
doesn't require architecture-specific changes.

Thanks!

Jordan

Jordan Rife (7):
  bpf: Set up update_prog scaffolding for bpf_tracing_link_lops
  bpf: Enable BPF_LINK_UPDATE for freplace links
  bpf: Enable BPF_LINK_UPDATE for fentry/fexit/fmod_ret links
  bpf, x86: Make program update work for trampoline ops
  bpf, s390: Make program update work for trampoline ops
  bpf, arm64: Make program update work for trampoline ops
  selftests/bpf: Test BPF_LINK_UPDATE behavior for tracing links

 arch/arm64/net/bpf_jit_comp.c                 |  23 +-
 arch/s390/net/bpf_jit_comp.c                  |  24 +-
 arch/x86/net/bpf_jit_comp.c                   |  17 +-
 include/linux/bpf.h                           |  21 +
 kernel/bpf/syscall.c                          |  68 +++
 kernel/bpf/trampoline.c                       |  75 ++-
 .../bpf/prog_tests/prog_update_tracing.c      | 460 ++++++++++++++++++
 .../selftests/bpf/progs/prog_update_tracing.c | 133 +++++
 8 files changed, 796 insertions(+), 25 deletions(-)
 create mode 100644 tools/testing/selftests/bpf/prog_tests/prog_update_tracing.c
 create mode 100644 tools/testing/selftests/bpf/progs/prog_update_tracing.c

-- 
2.43.0


