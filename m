Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C96EDCFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 12:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=krb7EEbjnCJlqDlFJhfMfbekuOjtWLFmpcBCzcnf0BY=; b=DctGpjavUcjpmQkvvthN7QVQw+
	wEy7S1+iEakZPpD3ROnZ4EF/xkK/KQGqBRy3VQrQIz6hNOcX9qQ6O+66EPxCb5/OIs2QSGghN9sTo
	R3vd8/DzXHh0Fvca17yPYZWFz6wUJg4ZVI6UPx7JCdBHSo0M+TOIvwFjCv+2VzQDvq/M8AocV6+PU
	Xvu2+fXIGp7c5WU1agaA6JLwhLhvOVMDNzzoylvkAzaf0SEziJTHQLOD6wnYIMYz5yMNOARw2+dQH
	Awz1dwQa8ZqTiibm0shs7K0+amY/Eb7Zv0buDak/iihkk7GlB+l/T09cZKUYHE1XYWxZK2L4mceC3
	RM5egj0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObAq-0000000GYzd-23Up;
	Thu, 27 Nov 2025 12:32:36 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObAm-0000000GYyH-2AuP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 12:32:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1764246617;
	bh=krb7EEbjnCJlqDlFJhfMfbekuOjtWLFmpcBCzcnf0BY=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Z28ZEOkeaBsL+JpbaeVrASQFoo3kQzmL7+f3wPwELJ49XhZoN47LhMrY42LVuWqhM
	 2eMrixaTaaFIM61YS1lfLecd+BZPqzZxtZJRS0e5vjxbLFt3P2j4PJL4ZGdS0/UkmT
	 jv3xD/X1DSdUZAT/zQYegMeDLMTygwxnofwR6LBs=
X-QQ-mid: esmtpsz18t1764246613t76497497
X-QQ-Originating-IP: OplZC0hT8YGmLS8dR6g2F9qWe1UPFncKT/Ok7qW4ad0=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 27 Nov 2025 20:30:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9852922858654569101
From: Wentao Guan <guanwentao@uniontech.com>
To: leitao@debian.org
Cc: catalin.marinas@arm.com,
	kernel-team@meta.com,
	linux-arm-kernel@lists.infradead.org,
	mark.rutland@arm.com,
	paulmck@kernel.org,
	rmikey@meta.com,
	will@kernel.org
Subject: Re: Overhead of arm64 LSE per-CPU atomics?
Date: Thu, 27 Nov 2025 20:29:54 +0800
Message-Id: <20251127122954.1600968-1-guanwentao@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <ahkk2r22peni4s7j6c7tnv3uajvwiaeg3vwyusppblcokpvgjw@zuuzipntgu7x>
References: <ahkk2r22peni4s7j6c7tnv3uajvwiaeg3vwyusppblcokpvgjw@zuuzipntgu7x>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MWdgP8+gtiFRRmw8BOS6jnfCnII2k7MZfAm58ulX5XB4SFs6rNGfCmUs
	IJLCZyHw7Nmw/iUubdJV2HVky7c5u9H8UACBwpsvWrHkS1IeE3m4CTdQBwT5i43xFNslX7L
	TAKsUr7qNuc/MId7SuTgSGvouwHwVt0TwDjKsjSVkMwKfPNsMLcz5kyLTYrxZZRAe7tY+le
	ipDcdQj7L4npI3RjxmtxnIImXdZYUeylBQKtxKuklp4kCcoVrc+lNIp2h6wtdkUwNgEOOBA
	klyfjKGDP/qMTXbLZQP4Xyh+pJYlTzP+eUm4MYjFK2GHr+dKmvYpzv1EILZ0UF0k3u63sXr
	8bzsEOM0cKzvDUABIubu2VR5CVvk4Stp8/mAxFQdx0TNsV7gLT9TtueXUvdzU1LCKvYQRmU
	E9RFvCxGl2Vup9Nl9id17GGfrC/nWvxULLAgGsawaVG5XOOrBiakEJEgxkFp+tdRgkV38od
	hKbP/pbcoXo8cb/xe3jwYz3ZLMDOYTD5sgqk6OraDtIksy0QW3n9MLBfuZO5ovQuwS4Dpyj
	549XEFUV3I38l64B1b4ti/lNTZYWB11UCkk9ebvwCMYLtHJ3boPiIpL1aOLrEU8YLPzOjxY
	ZXczm4Z2H5QeT3f3Q2r9Qr8hMLnOaezmwjdnElEe6aTU3OfYHDZPJhqjhdzuIf5R7YJUF5k
	p71kr0pnEaGsFOYC89etXQJHBybkGHPdrdp8L6E0VTm9R0LvuF3rIz/HYusuFMDQm7+VS0A
	pVhqqWa++8d1DBygZ/Kr4/ZEViq438MK8AVDIhpJIcy+GMeOEvukLVGnLmdLJb3VHY7XcWJ
	tAlty53WJ8LvywJ4YEL12pOFBgcN5dA+b/1IhWFCYJF0ElD7HBYF0h3fTVttzZ+oS7zYYhY
	lR19U9+2fCvaIO5VKpIaIQJem2tDy1Q2oE/0sR+7mGXQBWyHSEHjSdoWI60EsA+jxBt9e9N
	Myruu18DDISqn3XMdpkEl5KB+BcasTBelkGDAcaSBVH4Ihv4hpvYZM7Y/wqAiabOyRqcjXL
	iS6QlxTLGGqxeJbPww
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
X-QQ-RECHKSPAM: 0
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

Hello All,

Here is my result with HUAWEI HUAWEIPGU-WBY0, which has 24c TSV110 core.(kunpeng920),
little strange --- stadd sometimes very fast, ldadd always slow, llsc always stable...
I thought change detect cap ARM64_HAS_LSE_ATOMICS in arm64_features is little dirty, any good idea?

Best Regrads
Wentao Guan

ARM64 Per-CPU Atomic Add Benchmark
===================================
Running percentile measurements (100 iterations)...
Detected 24 CPUs

 CPU: 0 - Latency Percentiles:
====================
LSE (stadd)     (c                0, d                0):   p50: 029.00 ns        p95: 029.09 ns          p99: 029.12 ns
LSE (stadd)     (c                0, d              100):   p50: 048.31 ns        p95: 048.74 ns          p99: 048.95 ns
LSE (stadd)     (c                0, d              200):   p50: 086.32 ns        p95: 086.60 ns          p99: 086.75 ns
sched_setaffinity: Invalid argument
LSE (stadd)     (c               10, d                0):   p50: 058.10 ns        p95: 058.32 ns          p99: 058.49 ns
sched_setaffinity: Invalid argument
LSE (stadd)     (c               10, d              300):   p50: 248.03 ns        p95: 248.31 ns          p99: 248.55 ns
sched_setaffinity: Invalid argument
LSE (stadd)     (c               10, d              500):   p50: 402.60 ns        p95: 403.10 ns          p99: 403.24 ns
sched_setaffinity: Invalid argument
LSE (stadd)     (c               30, d                0):   p50: 058.02 ns        p95: 058.31 ns          p99: 058.33 ns
LL/SC           (c                0, d                0):   p50: 006.57 ns        p95: 006.57 ns          p99: 006.57 ns
LL/SC           (c                0, d               10):   p50: 008.50 ns        p95: 008.50 ns          p99: 008.51 ns
LL/SC           (c                0, d               20):   p50: 011.67 ns        p95: 011.67 ns          p99: 011.68 ns
sched_setaffinity: Invalid argument
LL/SC           (c               10, d                0):   p50: 013.16 ns        p95: 013.46 ns          p99: 013.47 ns
sched_setaffinity: Invalid argument
LL/SC           (c               10, d               10):   p50: 017.00 ns        p95: 017.20 ns          p99: 017.29 ns
sched_setaffinity: Invalid argument
LL/SC           (c               10, d               20):   p50: 023.37 ns        p95: 023.57 ns          p99: 023.67 ns
sched_setaffinity: Invalid argument
LL/SC           (c             1000, d                0):   p50: 013.16 ns        p95: 013.37 ns          p99: 013.47 ns
sched_setaffinity: Invalid argument
LL/SC           (c             1000, d               10):   p50: 017.00 ns        p95: 017.21 ns          p99: 017.40 ns
sched_setaffinity: Invalid argument
LL/SC           (c          1000000, d                0):   p50: 013.17 ns        p95: 013.37 ns          p99: 013.37 ns
sched_setaffinity: Invalid argument
LL/SC           (c          1000000, d               10):   p50: 017.00 ns        p95: 017.20 ns          p99: 017.30 ns
LDADD           (c                0, d                0):   p50: 069.55 ns        p95: 069.57 ns          p99: 069.71 ns
LDADD           (c                0, d              100):   p50: 107.71 ns        p95: 108.11 ns          p99: 108.20 ns
LDADD           (c                0, d              200):   p50: 152.85 ns        p95: 152.91 ns          p99: 152.93 ns
LDADD           (c                0, d              300):   p50: 193.50 ns        p95: 193.54 ns          p99: 193.62 ns
sched_setaffinity: Invalid argument
LDADD           (c                1, d               10):   p50: 139.04 ns        p95: 139.34 ns          p99: 139.43 ns
sched_setaffinity: Invalid argument
LDADD           (c               10, d                0):   p50: 139.04 ns        p95: 139.44 ns          p99: 139.68 ns
sched_setaffinity: Invalid argument
LDADD           (c               10, d               10):   p50: 139.04 ns        p95: 139.33 ns          p99: 139.34 ns
sched_setaffinity: Invalid argument
LDADD           (c              100, d                0):   p50: 139.04 ns        p95: 139.40 ns          p99: 139.43 ns
PFRM_KEEP+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.80 ns          p99: 006.06 ns
sched_setaffinity: Invalid argument
PFRM_KEEP+STADD (c               10, d                0):   p50: 011.59 ns        p95: 011.89 ns          p99: 011.99 ns
sched_setaffinity: Invalid argument
PFRM_KEEP+STADD (c             1000, d                0):   p50: 011.59 ns        p95: 011.79 ns          p99: 011.89 ns
sched_setaffinity: Invalid argument
PFRM_KEEP+STADD (c          1000000, d                0):   p50: 011.59 ns        p95: 011.79 ns          p99: 011.80 ns
PFRM_STRM+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.80 ns          p99: 007.82 ns
sched_setaffinity: Invalid argument
PFRM_STRM+STADD (c               10, d                0):   p50: 011.59 ns        p95: 011.80 ns          p99: 011.89 ns
sched_setaffinity: Invalid argument
PFRM_STRM+STADD (c             1000, d                0):   p50: 011.59 ns        p95: 011.79 ns          p99: 011.89 ns
sched_setaffinity: Invalid argument
PFRM_STRM+STADD (c          1000000, d                0):   p50: 011.59 ns        p95: 011.80 ns          p99: 013.47 ns

 CPU: 1 - Latency Percentiles:
====================
LSE (stadd)     (c                0, d                0):   p50: 005.79 ns        p95: 029.00 ns          p99: 029.01 ns
LSE (stadd)     (c                0, d              100):   p50: 048.53 ns        p95: 048.96 ns          p99: 049.05 ns
LSE (stadd)     (c                0, d              200):   p50: 086.26 ns        p95: 087.25 ns          p99: 087.37 ns
LSE (stadd)     (c               10, d                0):   p50: 038.29 ns        p95: 038.31 ns          p99: 038.52 ns
LSE (stadd)     (c               10, d              300):   p50: 123.81 ns        p95: 123.92 ns          p99: 124.56 ns
LSE (stadd)     (c               10, d              500):   p50: 201.16 ns        p95: 201.20 ns          p99: 201.22 ns
LSE (stadd)     (c               30, d                0):   p50: 038.30 ns        p95: 038.31 ns          p99: 038.32 ns
LL/SC           (c                0, d                0):   p50: 006.56 ns        p95: 006.58 ns          p99: 006.58 ns
LL/SC           (c                0, d               10):   p50: 008.50 ns        p95: 008.51 ns          p99: 008.51 ns
LL/SC           (c                0, d               20):   p50: 011.67 ns        p95: 011.68 ns          p99: 011.68 ns
LL/SC           (c               10, d                0):   p50: 012.97 ns        p95: 013.04 ns          p99: 013.06 ns
LL/SC           (c               10, d               10):   p50: 020.93 ns        p95: 021.06 ns          p99: 021.16 ns
LL/SC           (c               10, d               20):   p50: 051.95 ns        p95: 064.63 ns          p99: 076.34 ns
LL/SC           (c             1000, d                0):   p50: 012.81 ns        p95: 012.83 ns          p99: 012.84 ns
LL/SC           (c             1000, d               10):   p50: 020.72 ns        p95: 020.73 ns          p99: 020.74 ns
LL/SC           (c          1000000, d                0):   p50: 008.65 ns        p95: 009.03 ns          p99: 009.11 ns
LL/SC           (c          1000000, d               10):   p50: 012.03 ns        p95: 012.74 ns          p99: 013.09 ns
LDADD           (c                0, d                0):   p50: 010.04 ns        p95: 010.06 ns          p99: 010.06 ns
LDADD           (c                0, d              100):   p50: 049.48 ns        p95: 107.89 ns          p99: 108.48 ns
LDADD           (c                0, d              200):   p50: 152.75 ns        p95: 152.89 ns          p99: 152.90 ns
LDADD           (c                0, d              300):   p50: 193.52 ns        p95: 193.54 ns          p99: 193.58 ns
LDADD           (c                1, d               10):   p50: 069.49 ns        p95: 069.51 ns          p99: 069.51 ns
LDADD           (c               10, d                0):   p50: 069.67 ns        p95: 069.69 ns          p99: 069.69 ns
LDADD           (c               10, d               10):   p50: 069.67 ns        p95: 069.69 ns          p99: 069.70 ns
LDADD           (c              100, d                0):   p50: 070.91 ns        p95: 070.95 ns          p99: 071.00 ns
PFRM_KEEP+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.81 ns
PFRM_KEEP+STADD (c               10, d                0):   p50: 082.54 ns        p95: 082.62 ns          p99: 082.68 ns
PFRM_KEEP+STADD (c             1000, d                0):   p50: 065.04 ns        p95: 065.39 ns          p99: 065.62 ns
PFRM_KEEP+STADD (c          1000000, d                0):   p50: 019.55 ns        p95: 020.03 ns          p99: 020.15 ns
PFRM_STRM+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.81 ns
PFRM_STRM+STADD (c               10, d                0):   p50: 082.51 ns        p95: 082.61 ns          p99: 082.63 ns
PFRM_STRM+STADD (c             1000, d                0):   p50: 064.35 ns        p95: 064.81 ns          p99: 065.25 ns
PFRM_STRM+STADD (c          1000000, d                0):   p50: 019.52 ns        p95: 020.08 ns          p99: 020.27 ns

 CPU: 2 - Latency Percentiles:
====================
LSE (stadd)     (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
LSE (stadd)     (c                0, d              100):   p50: 048.68 ns        p95: 049.06 ns          p99: 049.11 ns
LSE (stadd)     (c                0, d              200):   p50: 087.28 ns        p95: 087.39 ns          p99: 087.45 ns
LSE (stadd)     (c               10, d                0):   p50: 038.28 ns        p95: 038.29 ns          p99: 038.31 ns
LSE (stadd)     (c               10, d              300):   p50: 123.80 ns        p95: 123.85 ns          p99: 123.93 ns
LSE (stadd)     (c               10, d              500):   p50: 201.18 ns        p95: 203.31 ns          p99: 203.39 ns
LSE (stadd)     (c               30, d                0):   p50: 038.31 ns        p95: 038.35 ns          p99: 038.52 ns
LL/SC           (c                0, d                0):   p50: 006.57 ns        p95: 006.57 ns          p99: 006.57 ns
LL/SC           (c                0, d               10):   p50: 008.50 ns        p95: 008.50 ns          p99: 008.50 ns
LL/SC           (c                0, d               20):   p50: 011.67 ns        p95: 011.67 ns          p99: 011.67 ns
LL/SC           (c               10, d                0):   p50: 012.97 ns        p95: 013.05 ns          p99: 013.06 ns
LL/SC           (c               10, d               10):   p50: 020.97 ns        p95: 021.06 ns          p99: 021.10 ns
LL/SC           (c               10, d               20):   p50: 032.91 ns        p95: 037.12 ns          p99: 037.74 ns
LL/SC           (c             1000, d                0):   p50: 012.82 ns        p95: 012.83 ns          p99: 012.83 ns
LL/SC           (c             1000, d               10):   p50: 020.71 ns        p95: 020.73 ns          p99: 020.74 ns
LL/SC           (c          1000000, d                0):   p50: 008.40 ns        p95: 008.96 ns          p99: 009.07 ns
LL/SC           (c          1000000, d               10):   p50: 011.66 ns        p95: 012.39 ns          p99: 012.59 ns
LDADD           (c                0, d                0):   p50: 069.53 ns        p95: 069.56 ns          p99: 069.58 ns
LDADD           (c                0, d              100):   p50: 107.80 ns        p95: 108.25 ns          p99: 108.35 ns
LDADD           (c                0, d              200):   p50: 152.45 ns        p95: 152.50 ns          p99: 152.74 ns
LDADD           (c                0, d              300):   p50: 193.48 ns        p95: 193.49 ns          p99: 193.52 ns
LDADD           (c                1, d               10):   p50: 069.47 ns        p95: 069.50 ns          p99: 069.51 ns
LDADD           (c               10, d                0):   p50: 069.65 ns        p95: 069.67 ns          p99: 069.69 ns
LDADD           (c               10, d               10):   p50: 069.65 ns        p95: 069.67 ns          p99: 069.68 ns
LDADD           (c              100, d                0):   p50: 070.90 ns        p95: 070.94 ns          p99: 071.01 ns
PFRM_KEEP+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_KEEP+STADD (c               10, d                0):   p50: 082.57 ns        p95: 082.69 ns          p99: 082.75 ns
PFRM_KEEP+STADD (c             1000, d                0):   p50: 065.07 ns        p95: 065.41 ns          p99: 065.53 ns
PFRM_KEEP+STADD (c          1000000, d                0):   p50: 019.52 ns        p95: 020.06 ns          p99: 020.25 ns
PFRM_STRM+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_STRM+STADD (c               10, d                0):   p50: 082.54 ns        p95: 082.64 ns          p99: 082.68 ns
PFRM_STRM+STADD (c             1000, d                0):   p50: 064.39 ns        p95: 065.05 ns          p99: 075.52 ns
PFRM_STRM+STADD (c          1000000, d                0):   p50: 019.57 ns        p95: 020.00 ns          p99: 020.24 ns

 CPU: 3 - Latency Percentiles:
====================
LSE (stadd)     (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
LSE (stadd)     (c                0, d              100):   p50: 048.55 ns        p95: 049.01 ns          p99: 049.13 ns
LSE (stadd)     (c                0, d              200):   p50: 086.33 ns        p95: 087.29 ns          p99: 087.36 ns
LSE (stadd)     (c               10, d                0):   p50: 038.28 ns        p95: 038.29 ns          p99: 038.30 ns
LSE (stadd)     (c               10, d              300):   p50: 123.79 ns        p95: 124.84 ns          p99: 125.07 ns
LSE (stadd)     (c               10, d              500):   p50: 202.45 ns        p95: 202.92 ns          p99: 203.01 ns
LSE (stadd)     (c               30, d                0):   p50: 038.29 ns        p95: 038.35 ns          p99: 038.46 ns
LL/SC           (c                0, d                0):   p50: 006.57 ns        p95: 006.57 ns          p99: 006.57 ns
LL/SC           (c                0, d               10):   p50: 008.50 ns        p95: 008.50 ns          p99: 008.50 ns
LL/SC           (c                0, d               20):   p50: 011.67 ns        p95: 011.67 ns          p99: 011.67 ns
LL/SC           (c               10, d                0):   p50: 012.98 ns        p95: 013.05 ns          p99: 013.08 ns
LL/SC           (c               10, d               10):   p50: 020.95 ns        p95: 021.05 ns          p99: 021.07 ns
LL/SC           (c               10, d               20):   p50: 037.82 ns        p95: 041.67 ns          p99: 045.06 ns
LL/SC           (c             1000, d                0):   p50: 012.82 ns        p95: 012.84 ns          p99: 012.84 ns
LL/SC           (c             1000, d               10):   p50: 020.72 ns        p95: 020.74 ns          p99: 020.74 ns
LL/SC           (c          1000000, d                0):   p50: 008.43 ns        p95: 008.95 ns          p99: 009.07 ns
LL/SC           (c          1000000, d               10):   p50: 011.70 ns        p95: 012.22 ns          p99: 012.43 ns
LDADD           (c                0, d                0):   p50: 010.04 ns        p95: 010.04 ns          p99: 010.04 ns
LDADD           (c                0, d              100):   p50: 107.34 ns        p95: 107.98 ns          p99: 108.17 ns
LDADD           (c                0, d              200):   p50: 152.46 ns        p95: 152.82 ns          p99: 152.84 ns
LDADD           (c                0, d              300):   p50: 193.48 ns        p95: 193.49 ns          p99: 193.49 ns
LDADD           (c                1, d               10):   p50: 069.47 ns        p95: 069.51 ns          p99: 069.62 ns
LDADD           (c               10, d                0):   p50: 069.64 ns        p95: 069.67 ns          p99: 069.68 ns
LDADD           (c               10, d               10):   p50: 069.65 ns        p95: 069.67 ns          p99: 069.68 ns
LDADD           (c              100, d                0):   p50: 070.90 ns        p95: 070.92 ns          p99: 070.95 ns
PFRM_KEEP+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_KEEP+STADD (c               10, d                0):   p50: 082.62 ns        p95: 082.73 ns          p99: 083.09 ns
PFRM_KEEP+STADD (c             1000, d                0):   p50: 065.16 ns        p95: 065.46 ns          p99: 065.57 ns
PFRM_KEEP+STADD (c          1000000, d                0):   p50: 019.52 ns        p95: 020.09 ns          p99: 020.39 ns
PFRM_STRM+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_STRM+STADD (c               10, d                0):   p50: 082.59 ns        p95: 082.68 ns          p99: 082.69 ns
PFRM_STRM+STADD (c             1000, d                0):   p50: 064.32 ns        p95: 064.77 ns          p99: 064.94 ns
PFRM_STRM+STADD (c          1000000, d                0):   p50: 019.41 ns        p95: 019.96 ns          p99: 020.30 ns

 CPU: 4 - Latency Percentiles:
====================
LSE (stadd)     (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
LSE (stadd)     (c                0, d              100):   p50: 048.69 ns        p95: 049.16 ns          p99: 049.22 ns
LSE (stadd)     (c                0, d              200):   p50: 087.26 ns        p95: 087.41 ns          p99: 087.47 ns
LSE (stadd)     (c               10, d                0):   p50: 038.14 ns        p95: 038.16 ns          p99: 038.16 ns
LSE (stadd)     (c               10, d              300):   p50: 125.32 ns        p95: 125.77 ns          p99: 125.88 ns
LSE (stadd)     (c               10, d              500):   p50: 202.66 ns        p95: 203.15 ns          p99: 203.23 ns
LSE (stadd)     (c               30, d                0):   p50: 038.14 ns        p95: 038.16 ns          p99: 038.16 ns
LL/SC           (c                0, d                0):   p50: 006.57 ns        p95: 006.57 ns          p99: 006.57 ns
LL/SC           (c                0, d               10):   p50: 008.50 ns        p95: 008.50 ns          p99: 008.50 ns
LL/SC           (c                0, d               20):   p50: 011.67 ns        p95: 011.67 ns          p99: 011.67 ns
LL/SC           (c               10, d                0):   p50: 043.72 ns        p95: 044.52 ns          p99: 044.79 ns
LL/SC           (c               10, d               10):   p50: 051.37 ns        p95: 051.43 ns          p99: 051.87 ns
LL/SC           (c               10, d               20):   p50: 061.52 ns        p95: 061.56 ns          p99: 061.58 ns
LL/SC           (c             1000, d                0):   p50: 014.23 ns        p95: 014.47 ns          p99: 014.54 ns
LL/SC           (c             1000, d               10):   p50: 019.74 ns        p95: 020.47 ns          p99: 020.79 ns
LL/SC           (c          1000000, d                0):   p50: 006.61 ns        p95: 006.63 ns          p99: 006.63 ns
LL/SC           (c          1000000, d               10):   p50: 008.64 ns        p95: 008.67 ns          p99: 008.67 ns
LDADD           (c                0, d                0):   p50: 057.96 ns        p95: 058.04 ns          p99: 058.06 ns
LDADD           (c                0, d              100):   p50: 049.59 ns        p95: 096.48 ns          p99: 096.69 ns
LDADD           (c                0, d              200):   p50: 140.93 ns        p95: 141.00 ns          p99: 141.02 ns
LDADD           (c                0, d              300):   p50: 181.95 ns        p95: 181.98 ns          p99: 182.00 ns
LDADD           (c                1, d               10):   p50: 069.52 ns        p95: 069.54 ns          p99: 069.54 ns
LDADD           (c               10, d                0):   p50: 070.01 ns        p95: 070.02 ns          p99: 070.02 ns
LDADD           (c               10, d               10):   p50: 070.02 ns        p95: 070.04 ns          p99: 070.05 ns
LDADD           (c              100, d                0):   p50: 067.33 ns        p95: 067.55 ns          p99: 067.63 ns
PFRM_KEEP+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_KEEP+STADD (c               10, d                0):   p50: 115.30 ns        p95: 116.98 ns          p99: 117.09 ns
PFRM_KEEP+STADD (c             1000, d                0):   p50: 068.71 ns        p95: 068.88 ns          p99: 068.98 ns
PFRM_KEEP+STADD (c          1000000, d                0):   p50: 019.23 ns        p95: 019.89 ns          p99: 019.93 ns
PFRM_STRM+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_STRM+STADD (c               10, d                0):   p50: 114.81 ns        p95: 116.05 ns          p99: 116.11 ns
PFRM_STRM+STADD (c             1000, d                0):   p50: 068.68 ns        p95: 068.89 ns          p99: 068.96 ns
PFRM_STRM+STADD (c          1000000, d                0):   p50: 019.31 ns        p95: 019.81 ns          p99: 019.98 ns

 CPU: 5 - Latency Percentiles:
====================
LSE (stadd)     (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
LSE (stadd)     (c                0, d              100):   p50: 048.54 ns        p95: 048.93 ns          p99: 049.19 ns
LSE (stadd)     (c                0, d              200):   p50: 086.28 ns        p95: 087.13 ns          p99: 087.26 ns
LSE (stadd)     (c               10, d                0):   p50: 038.14 ns        p95: 038.15 ns          p99: 038.16 ns
LSE (stadd)     (c               10, d              300):   p50: 125.04 ns        p95: 125.59 ns          p99: 125.65 ns
LSE (stadd)     (c               10, d              500):   p50: 200.96 ns        p95: 201.00 ns          p99: 201.02 ns
LSE (stadd)     (c               30, d                0):   p50: 038.15 ns        p95: 038.17 ns          p99: 038.17 ns
LL/SC           (c                0, d                0):   p50: 006.57 ns        p95: 006.57 ns          p99: 006.57 ns
LL/SC           (c                0, d               10):   p50: 008.50 ns        p95: 008.50 ns          p99: 008.50 ns
LL/SC           (c                0, d               20):   p50: 011.67 ns        p95: 011.67 ns          p99: 011.67 ns
LL/SC           (c               10, d                0):   p50: 043.73 ns        p95: 044.24 ns          p99: 044.26 ns
LL/SC           (c               10, d               10):   p50: 051.38 ns        p95: 051.42 ns          p99: 051.43 ns
LL/SC           (c               10, d               20):   p50: 061.49 ns        p95: 061.58 ns          p99: 061.58 ns
LL/SC           (c             1000, d                0):   p50: 014.21 ns        p95: 014.47 ns          p99: 014.61 ns
LL/SC           (c             1000, d               10):   p50: 019.83 ns        p95: 020.69 ns          p99: 020.92 ns
LL/SC           (c          1000000, d                0):   p50: 006.61 ns        p95: 006.63 ns          p99: 006.63 ns
LL/SC           (c          1000000, d               10):   p50: 008.63 ns        p95: 008.66 ns          p99: 008.67 ns
LDADD           (c                0, d                0):   p50: 058.00 ns        p95: 058.07 ns          p99: 058.12 ns
LDADD           (c                0, d              100):   p50: 096.16 ns        p95: 096.58 ns          p99: 096.71 ns
LDADD           (c                0, d              200):   p50: 140.94 ns        p95: 141.01 ns          p99: 141.14 ns
LDADD           (c                0, d              300):   p50: 182.00 ns        p95: 182.20 ns          p99: 182.25 ns
LDADD           (c                1, d               10):   p50: 069.52 ns        p95: 069.54 ns          p99: 069.55 ns
LDADD           (c               10, d                0):   p50: 070.00 ns        p95: 070.01 ns          p99: 070.02 ns
LDADD           (c               10, d               10):   p50: 070.01 ns        p95: 070.03 ns          p99: 070.09 ns
LDADD           (c              100, d                0):   p50: 067.22 ns        p95: 067.37 ns          p99: 067.39 ns
PFRM_KEEP+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_KEEP+STADD (c               10, d                0):   p50: 115.40 ns        p95: 117.17 ns          p99: 117.25 ns
PFRM_KEEP+STADD (c             1000, d                0):   p50: 068.72 ns        p95: 068.89 ns          p99: 068.94 ns
PFRM_KEEP+STADD (c          1000000, d                0):   p50: 019.10 ns        p95: 019.79 ns          p99: 019.95 ns
PFRM_STRM+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_STRM+STADD (c               10, d                0):   p50: 114.82 ns        p95: 114.97 ns          p99: 114.99 ns
PFRM_STRM+STADD (c             1000, d                0):   p50: 065.97 ns        p95: 066.10 ns          p99: 066.17 ns
PFRM_STRM+STADD (c          1000000, d                0):   p50: 019.18 ns        p95: 019.69 ns          p99: 019.91 ns

 CPU: 6 - Latency Percentiles:
====================
LSE (stadd)     (c                0, d                0):   p50: 024.33 ns        p95: 024.33 ns          p99: 024.33 ns
LSE (stadd)     (c                0, d              100):   p50: 048.69 ns        p95: 049.12 ns          p99: 049.30 ns
LSE (stadd)     (c                0, d              200):   p50: 087.26 ns        p95: 087.45 ns          p99: 087.68 ns
LSE (stadd)     (c               10, d                0):   p50: 038.16 ns        p95: 038.17 ns          p99: 038.18 ns
LSE (stadd)     (c               10, d              300):   p50: 123.87 ns        p95: 124.02 ns          p99: 125.13 ns
LSE (stadd)     (c               10, d              500):   p50: 201.00 ns        p95: 201.23 ns          p99: 201.36 ns
LSE (stadd)     (c               30, d                0):   p50: 038.14 ns        p95: 038.16 ns          p99: 038.17 ns
LL/SC           (c                0, d                0):   p50: 006.57 ns        p95: 006.57 ns          p99: 006.57 ns
LL/SC           (c                0, d               10):   p50: 008.50 ns        p95: 008.50 ns          p99: 008.50 ns
LL/SC           (c                0, d               20):   p50: 011.67 ns        p95: 011.67 ns          p99: 011.67 ns
LL/SC           (c               10, d                0):   p50: 043.71 ns        p95: 044.23 ns          p99: 044.71 ns
LL/SC           (c               10, d               10):   p50: 051.36 ns        p95: 051.44 ns          p99: 051.90 ns
LL/SC           (c               10, d               20):   p50: 061.50 ns        p95: 061.56 ns          p99: 061.57 ns
LL/SC           (c             1000, d                0):   p50: 014.20 ns        p95: 014.50 ns          p99: 014.63 ns
LL/SC           (c             1000, d               10):   p50: 019.64 ns        p95: 020.58 ns          p99: 020.98 ns
LL/SC           (c          1000000, d                0):   p50: 006.61 ns        p95: 006.63 ns          p99: 006.64 ns
LL/SC           (c          1000000, d               10):   p50: 008.64 ns        p95: 008.67 ns          p99: 008.70 ns
LDADD           (c                0, d                0):   p50: 057.97 ns        p95: 058.02 ns          p99: 058.05 ns
LDADD           (c                0, d              100):   p50: 095.93 ns        p95: 096.45 ns          p99: 096.57 ns
LDADD           (c                0, d              200):   p50: 141.19 ns        p95: 141.39 ns          p99: 141.41 ns
LDADD           (c                0, d              300):   p50: 181.97 ns        p95: 182.07 ns          p99: 182.12 ns
LDADD           (c                1, d               10):   p50: 069.52 ns        p95: 069.54 ns          p99: 069.54 ns
LDADD           (c               10, d                0):   p50: 070.00 ns        p95: 070.06 ns          p99: 070.08 ns
LDADD           (c               10, d               10):   p50: 069.99 ns        p95: 070.00 ns          p99: 070.00 ns
LDADD           (c              100, d                0):   p50: 067.25 ns        p95: 067.32 ns          p99: 067.36 ns
PFRM_KEEP+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_KEEP+STADD (c               10, d                0):   p50: 115.46 ns        p95: 117.05 ns          p99: 117.10 ns
PFRM_KEEP+STADD (c             1000, d                0):   p50: 066.10 ns        p95: 066.25 ns          p99: 066.30 ns
PFRM_KEEP+STADD (c          1000000, d                0):   p50: 019.30 ns        p95: 019.87 ns          p99: 020.07 ns
PFRM_STRM+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_STRM+STADD (c               10, d                0):   p50: 114.77 ns        p95: 114.97 ns          p99: 115.71 ns
PFRM_STRM+STADD (c             1000, d                0):   p50: 066.07 ns        p95: 068.72 ns          p99: 068.80 ns
PFRM_STRM+STADD (c          1000000, d                0):   p50: 019.29 ns        p95: 019.96 ns          p99: 020.11 ns

 CPU: 7 - Latency Percentiles:
====================
LSE (stadd)     (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.80 ns
LSE (stadd)     (c                0, d              100):   p50: 048.44 ns        p95: 048.83 ns          p99: 048.89 ns
LSE (stadd)     (c                0, d              200):   p50: 086.35 ns        p95: 087.11 ns          p99: 087.19 ns
LSE (stadd)     (c               10, d                0):   p50: 038.16 ns        p95: 038.18 ns          p99: 038.18 ns
LSE (stadd)     (c               10, d              300):   p50: 123.87 ns        p95: 124.31 ns          p99: 125.36 ns
LSE (stadd)     (c               10, d              500):   p50: 201.00 ns        p95: 201.04 ns          p99: 201.08 ns
LSE (stadd)     (c               30, d                0):   p50: 038.15 ns        p95: 038.16 ns          p99: 038.16 ns
LL/SC           (c                0, d                0):   p50: 006.57 ns        p95: 006.57 ns          p99: 006.57 ns
LL/SC           (c                0, d               10):   p50: 008.50 ns        p95: 008.50 ns          p99: 008.50 ns
LL/SC           (c                0, d               20):   p50: 011.67 ns        p95: 011.67 ns          p99: 011.67 ns
LL/SC           (c               10, d                0):   p50: 043.72 ns        p95: 044.24 ns          p99: 045.35 ns
LL/SC           (c               10, d               10):   p50: 051.37 ns        p95: 051.44 ns          p99: 051.99 ns
LL/SC           (c               10, d               20):   p50: 061.54 ns        p95: 061.57 ns          p99: 061.58 ns
LL/SC           (c             1000, d                0):   p50: 014.18 ns        p95: 014.48 ns          p99: 014.59 ns
LL/SC           (c             1000, d               10):   p50: 019.64 ns        p95: 020.38 ns          p99: 020.71 ns
LL/SC           (c          1000000, d                0):   p50: 006.61 ns        p95: 006.63 ns          p99: 006.63 ns
LL/SC           (c          1000000, d               10):   p50: 008.64 ns        p95: 008.67 ns          p99: 008.67 ns
LDADD           (c                0, d                0):   p50: 058.00 ns        p95: 058.05 ns          p99: 058.07 ns
LDADD           (c                0, d              100):   p50: 049.28 ns        p95: 049.81 ns          p99: 049.93 ns
LDADD           (c                0, d              200):   p50: 140.93 ns        p95: 141.31 ns          p99: 141.36 ns
LDADD           (c                0, d              300):   p50: 181.93 ns        p95: 181.98 ns          p99: 182.00 ns
LDADD           (c                1, d               10):   p50: 069.52 ns        p95: 069.62 ns          p99: 069.68 ns
LDADD           (c               10, d                0):   p50: 069.99 ns        p95: 070.00 ns          p99: 070.01 ns
LDADD           (c               10, d               10):   p50: 070.00 ns        p95: 070.01 ns          p99: 070.01 ns
LDADD           (c              100, d                0):   p50: 067.24 ns        p95: 067.31 ns          p99: 067.33 ns
PFRM_KEEP+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_KEEP+STADD (c               10, d                0):   p50: 115.22 ns        p95: 116.94 ns          p99: 117.03 ns
PFRM_KEEP+STADD (c             1000, d                0):   p50: 068.76 ns        p95: 068.89 ns          p99: 068.95 ns
PFRM_KEEP+STADD (c          1000000, d                0):   p50: 019.15 ns        p95: 019.78 ns          p99: 020.08 ns
PFRM_STRM+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_STRM+STADD (c               10, d                0):   p50: 115.86 ns        p95: 116.02 ns          p99: 116.06 ns
PFRM_STRM+STADD (c             1000, d                0):   p50: 068.69 ns        p95: 068.92 ns          p99: 069.31 ns
PFRM_STRM+STADD (c          1000000, d                0):   p50: 019.32 ns        p95: 019.77 ns          p99: 019.91 ns

 CPU: 8 - Latency Percentiles:
====================
LSE (stadd)     (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
LSE (stadd)     (c                0, d              100):   p50: 048.73 ns        p95: 049.11 ns          p99: 049.16 ns
LSE (stadd)     (c                0, d              200):   p50: 087.27 ns        p95: 087.45 ns          p99: 087.51 ns
LSE (stadd)     (c               10, d                0):   p50: 038.15 ns        p95: 038.16 ns          p99: 038.16 ns
LSE (stadd)     (c               10, d              300):   p50: 124.75 ns        p95: 125.94 ns          p99: 126.04 ns
LSE (stadd)     (c               10, d              500):   p50: 202.94 ns        p95: 203.22 ns          p99: 203.27 ns
LSE (stadd)     (c               30, d                0):   p50: 038.18 ns        p95: 038.20 ns          p99: 038.33 ns
LL/SC           (c                0, d                0):   p50: 006.57 ns        p95: 006.57 ns          p99: 006.57 ns
LL/SC           (c                0, d               10):   p50: 008.50 ns        p95: 008.50 ns          p99: 008.50 ns
LL/SC           (c                0, d               20):   p50: 011.67 ns        p95: 011.67 ns          p99: 011.67 ns
LL/SC           (c               10, d                0):   p50: 040.89 ns        p95: 041.37 ns          p99: 041.38 ns
LL/SC           (c               10, d               10):   p50: 047.73 ns        p95: 048.20 ns          p99: 048.63 ns
LL/SC           (c               10, d               20):   p50: 057.68 ns        p95: 057.74 ns          p99: 057.75 ns
LL/SC           (c             1000, d                0):   p50: 013.79 ns        p95: 014.37 ns          p99: 014.50 ns
LL/SC           (c             1000, d               10):   p50: 013.02 ns        p95: 013.47 ns          p99: 013.56 ns
LL/SC           (c          1000000, d                0):   p50: 006.63 ns        p95: 006.65 ns          p99: 006.66 ns
LL/SC           (c          1000000, d               10):   p50: 008.54 ns        p95: 008.56 ns          p99: 008.56 ns
LDADD           (c                0, d                0):   p50: 066.45 ns        p95: 066.47 ns          p99: 066.48 ns
LDADD           (c                0, d              100):   p50: 104.69 ns        p95: 105.07 ns          p99: 105.19 ns
LDADD           (c                0, d              200):   p50: 149.37 ns        p95: 149.43 ns          p99: 149.77 ns
LDADD           (c                0, d              300):   p50: 190.40 ns        p95: 190.42 ns          p99: 190.49 ns
LDADD           (c                1, d               10):   p50: 069.49 ns        p95: 069.52 ns          p99: 069.53 ns
LDADD           (c               10, d                0):   p50: 069.67 ns        p95: 069.70 ns          p99: 069.71 ns
LDADD           (c               10, d               10):   p50: 069.68 ns        p95: 069.72 ns          p99: 069.75 ns
LDADD           (c              100, d                0):   p50: 070.93 ns        p95: 070.95 ns          p99: 071.00 ns
PFRM_KEEP+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_KEEP+STADD (c               10, d                0):   p50: 119.70 ns        p95: 120.06 ns          p99: 120.20 ns
PFRM_KEEP+STADD (c             1000, d                0):   p50: 069.04 ns        p95: 069.28 ns          p99: 069.42 ns
PFRM_KEEP+STADD (c          1000000, d                0):   p50: 018.98 ns        p95: 019.60 ns          p99: 019.66 ns
PFRM_STRM+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_STRM+STADD (c               10, d                0):   p50: 120.95 ns        p95: 121.22 ns          p99: 121.27 ns
PFRM_STRM+STADD (c             1000, d                0):   p50: 077.95 ns        p95: 078.32 ns          p99: 078.42 ns
PFRM_STRM+STADD (c          1000000, d                0):   p50: 020.04 ns        p95: 020.73 ns          p99: 020.89 ns

 CPU: 9 - Latency Percentiles:
====================
LSE (stadd)     (c                0, d                0):   p50: 005.79 ns        p95: 027.54 ns          p99: 027.61 ns
LSE (stadd)     (c                0, d              100):   p50: 048.42 ns        p95: 048.91 ns          p99: 049.00 ns
LSE (stadd)     (c                0, d              200):   p50: 087.26 ns        p95: 087.45 ns          p99: 087.54 ns
LSE (stadd)     (c               10, d                0):   p50: 038.18 ns        p95: 038.19 ns          p99: 038.19 ns
LSE (stadd)     (c               10, d              300):   p50: 123.95 ns        p95: 125.95 ns          p99: 126.02 ns
LSE (stadd)     (c               10, d              500):   p50: 201.11 ns        p95: 201.20 ns          p99: 201.23 ns
LSE (stadd)     (c               30, d                0):   p50: 038.18 ns        p95: 038.19 ns          p99: 038.20 ns
LL/SC           (c                0, d                0):   p50: 006.57 ns        p95: 006.57 ns          p99: 006.57 ns
LL/SC           (c                0, d               10):   p50: 008.50 ns        p95: 008.50 ns          p99: 008.50 ns
LL/SC           (c                0, d               20):   p50: 011.67 ns        p95: 011.67 ns          p99: 011.67 ns
LL/SC           (c               10, d                0):   p50: 046.94 ns        p95: 049.33 ns          p99: 050.68 ns
LL/SC           (c               10, d               10):   p50: 048.15 ns        p95: 048.21 ns          p99: 050.57 ns
LL/SC           (c               10, d               20):   p50: 057.73 ns        p95: 057.77 ns          p99: 058.22 ns
LL/SC           (c             1000, d                0):   p50: 013.96 ns        p95: 014.56 ns          p99: 014.70 ns
LL/SC           (c             1000, d               10):   p50: 012.99 ns        p95: 013.43 ns          p99: 013.70 ns
LL/SC           (c          1000000, d                0):   p50: 006.64 ns        p95: 006.65 ns          p99: 006.66 ns
LL/SC           (c          1000000, d               10):   p50: 008.55 ns        p95: 008.56 ns          p99: 008.57 ns
LDADD           (c                0, d                0):   p50: 066.44 ns        p95: 066.45 ns          p99: 066.46 ns
LDADD           (c                0, d              100):   p50: 049.38 ns        p95: 049.76 ns          p99: 049.93 ns
LDADD           (c                0, d              200):   p50: 149.39 ns        p95: 149.77 ns          p99: 149.79 ns
LDADD           (c                0, d              300):   p50: 190.42 ns        p95: 190.43 ns          p99: 190.44 ns
LDADD           (c                1, d               10):   p50: 069.48 ns        p95: 069.52 ns          p99: 069.61 ns
LDADD           (c               10, d                0):   p50: 069.68 ns        p95: 069.71 ns          p99: 069.73 ns
LDADD           (c               10, d               10):   p50: 069.68 ns        p95: 069.71 ns          p99: 069.72 ns
LDADD           (c              100, d                0):   p50: 070.91 ns        p95: 070.94 ns          p99: 070.98 ns
PFRM_KEEP+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_KEEP+STADD (c               10, d                0):   p50: 120.35 ns        p95: 121.25 ns          p99: 121.38 ns
PFRM_KEEP+STADD (c             1000, d                0):   p50: 069.06 ns        p95: 069.28 ns          p99: 069.39 ns
PFRM_KEEP+STADD (c          1000000, d                0):   p50: 019.26 ns        p95: 019.96 ns          p99: 020.13 ns
PFRM_STRM+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_STRM+STADD (c               10, d                0):   p50: 121.02 ns        p95: 121.28 ns          p99: 121.48 ns
PFRM_STRM+STADD (c             1000, d                0):   p50: 077.56 ns        p95: 078.35 ns          p99: 078.83 ns
PFRM_STRM+STADD (c          1000000, d                0):   p50: 019.18 ns        p95: 019.84 ns          p99: 020.04 ns

 CPU: 10 - Latency Percentiles:
====================
LSE (stadd)     (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.80 ns
LSE (stadd)     (c                0, d              100):   p50: 048.69 ns        p95: 049.10 ns          p99: 049.35 ns
LSE (stadd)     (c                0, d              200):   p50: 086.24 ns        p95: 086.49 ns          p99: 087.15 ns
LSE (stadd)     (c               10, d                0):   p50: 038.17 ns        p95: 038.19 ns          p99: 038.19 ns
LSE (stadd)     (c               10, d              300):   p50: 123.87 ns        p95: 125.86 ns          p99: 125.99 ns
LSE (stadd)     (c               10, d              500):   p50: 202.59 ns        p95: 203.18 ns          p99: 203.32 ns
LSE (stadd)     (c               30, d                0):   p50: 038.20 ns        p95: 038.22 ns          p99: 038.22 ns
LL/SC           (c                0, d                0):   p50: 006.56 ns        p95: 006.57 ns          p99: 006.57 ns
LL/SC           (c                0, d               10):   p50: 008.50 ns        p95: 008.50 ns          p99: 008.50 ns
LL/SC           (c                0, d               20):   p50: 011.67 ns        p95: 011.67 ns          p99: 011.67 ns
LL/SC           (c               10, d                0):   p50: 040.89 ns        p95: 041.36 ns          p99: 041.38 ns
LL/SC           (c               10, d               10):   p50: 048.16 ns        p95: 048.20 ns          p99: 048.21 ns
LL/SC           (c               10, d               20):   p50: 057.72 ns        p95: 058.19 ns          p99: 058.22 ns
LL/SC           (c             1000, d                0):   p50: 013.55 ns        p95: 014.22 ns          p99: 014.44 ns
LL/SC           (c             1000, d               10):   p50: 013.19 ns        p95: 013.60 ns          p99: 013.79 ns
LL/SC           (c          1000000, d                0):   p50: 006.64 ns        p95: 006.66 ns          p99: 006.66 ns
LL/SC           (c          1000000, d               10):   p50: 008.55 ns        p95: 008.56 ns          p99: 008.56 ns
LDADD           (c                0, d                0):   p50: 010.04 ns        p95: 066.46 ns          p99: 066.48 ns
LDADD           (c                0, d              100):   p50: 104.62 ns        p95: 105.05 ns          p99: 105.17 ns
LDADD           (c                0, d              200):   p50: 149.38 ns        p95: 149.42 ns          p99: 149.62 ns
LDADD           (c                0, d              300):   p50: 190.40 ns        p95: 190.42 ns          p99: 190.48 ns
LDADD           (c                1, d               10):   p50: 069.49 ns        p95: 069.51 ns          p99: 069.52 ns
LDADD           (c               10, d                0):   p50: 069.67 ns        p95: 069.70 ns          p99: 069.70 ns
LDADD           (c               10, d               10):   p50: 069.68 ns        p95: 069.70 ns          p99: 069.72 ns
LDADD           (c              100, d                0):   p50: 070.93 ns        p95: 070.96 ns          p99: 071.01 ns
PFRM_KEEP+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_KEEP+STADD (c               10, d                0):   p50: 119.69 ns        p95: 120.18 ns          p99: 120.30 ns
PFRM_KEEP+STADD (c             1000, d                0):   p50: 068.96 ns        p95: 069.20 ns          p99: 069.26 ns
PFRM_KEEP+STADD (c          1000000, d                0):   p50: 019.28 ns        p95: 019.85 ns          p99: 019.95 ns
PFRM_STRM+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 006.32 ns
PFRM_STRM+STADD (c               10, d                0):   p50: 121.20 ns        p95: 121.47 ns          p99: 121.51 ns
PFRM_STRM+STADD (c             1000, d                0):   p50: 077.93 ns        p95: 078.36 ns          p99: 078.60 ns
PFRM_STRM+STADD (c          1000000, d                0):   p50: 020.10 ns        p95: 020.70 ns          p99: 020.95 ns

 CPU: 11 - Latency Percentiles:
====================
LSE (stadd)     (c                0, d                0):   p50: 010.43 ns        p95: 027.56 ns          p99: 027.57 ns
LSE (stadd)     (c                0, d              100):   p50: 048.64 ns        p95: 049.06 ns          p99: 049.12 ns
LSE (stadd)     (c                0, d              200):   p50: 087.28 ns        p95: 087.49 ns          p99: 087.53 ns
LSE (stadd)     (c               10, d                0):   p50: 038.18 ns        p95: 038.19 ns          p99: 038.20 ns
LSE (stadd)     (c               10, d              300):   p50: 123.88 ns        p95: 123.93 ns          p99: 123.96 ns
LSE (stadd)     (c               10, d              500):   p50: 201.13 ns        p95: 201.19 ns          p99: 201.27 ns
LSE (stadd)     (c               30, d                0):   p50: 038.18 ns        p95: 038.19 ns          p99: 038.20 ns
LL/SC           (c                0, d                0):   p50: 006.57 ns        p95: 006.57 ns          p99: 006.57 ns
LL/SC           (c                0, d               10):   p50: 008.50 ns        p95: 008.50 ns          p99: 008.50 ns
LL/SC           (c                0, d               20):   p50: 011.67 ns        p95: 011.67 ns          p99: 011.67 ns
LL/SC           (c               10, d                0):   p50: 040.89 ns        p95: 041.37 ns          p99: 041.38 ns
LL/SC           (c               10, d               10):   p50: 048.16 ns        p95: 048.21 ns          p99: 048.23 ns
LL/SC           (c               10, d               20):   p50: 057.73 ns        p95: 057.77 ns          p99: 058.28 ns
LL/SC           (c             1000, d                0):   p50: 013.59 ns        p95: 014.21 ns          p99: 014.60 ns
LL/SC           (c             1000, d               10):   p50: 013.06 ns        p95: 013.38 ns          p99: 013.60 ns
LL/SC           (c          1000000, d                0):   p50: 006.64 ns        p95: 006.66 ns          p99: 006.67 ns
LL/SC           (c          1000000, d               10):   p50: 008.55 ns        p95: 008.55 ns          p99: 008.56 ns
LDADD           (c                0, d                0):   p50: 066.45 ns        p95: 066.47 ns          p99: 066.48 ns
LDADD           (c                0, d              100):   p50: 104.62 ns        p95: 105.09 ns          p99: 105.30 ns
LDADD           (c                0, d              200):   p50: 149.38 ns        p95: 149.73 ns          p99: 149.91 ns
LDADD           (c                0, d              300):   p50: 190.39 ns        p95: 190.41 ns          p99: 190.41 ns
LDADD           (c                1, d               10):   p50: 069.49 ns        p95: 069.51 ns          p99: 069.52 ns
LDADD           (c               10, d                0):   p50: 069.68 ns        p95: 069.74 ns          p99: 069.77 ns
LDADD           (c               10, d               10):   p50: 069.67 ns        p95: 069.70 ns          p99: 069.71 ns
LDADD           (c              100, d                0):   p50: 070.93 ns        p95: 070.94 ns          p99: 070.99 ns
PFRM_KEEP+STADD (c                0, d                0):   p50: 005.79 ns        p95: 010.08 ns          p99: 010.32 ns
PFRM_KEEP+STADD (c               10, d                0):   p50: 119.88 ns        p95: 120.38 ns          p99: 120.56 ns
PFRM_KEEP+STADD (c             1000, d                0):   p50: 069.03 ns        p95: 069.26 ns          p99: 069.33 ns
PFRM_KEEP+STADD (c          1000000, d                0):   p50: 019.33 ns        p95: 019.90 ns          p99: 019.98 ns
PFRM_STRM+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 009.76 ns
PFRM_STRM+STADD (c               10, d                0):   p50: 121.10 ns        p95: 121.30 ns          p99: 121.40 ns
PFRM_STRM+STADD (c             1000, d                0):   p50: 068.90 ns        p95: 078.29 ns          p99: 078.66 ns
PFRM_STRM+STADD (c          1000000, d                0):   p50: 019.32 ns        p95: 019.84 ns          p99: 020.14 ns

 CPU: 12 - Latency Percentiles:
====================
LSE (stadd)     (c                0, d                0):   p50: 026.02 ns        p95: 026.03 ns          p99: 026.03 ns
LSE (stadd)     (c                0, d              100):   p50: 048.45 ns        p95: 048.85 ns          p99: 049.00 ns
LSE (stadd)     (c                0, d              200):   p50: 087.27 ns        p95: 087.52 ns          p99: 087.59 ns
LSE (stadd)     (c               10, d                0):   p50: 038.17 ns        p95: 038.18 ns          p99: 038.30 ns
LSE (stadd)     (c               10, d              300):   p50: 125.28 ns        p95: 125.78 ns          p99: 125.90 ns
LSE (stadd)     (c               10, d              500):   p50: 200.99 ns        p95: 202.74 ns          p99: 202.87 ns
LSE (stadd)     (c               30, d                0):   p50: 038.16 ns        p95: 038.34 ns          p99: 038.62 ns
LL/SC           (c                0, d                0):   p50: 006.56 ns        p95: 006.57 ns          p99: 006.57 ns
LL/SC           (c                0, d               10):   p50: 008.50 ns        p95: 008.50 ns          p99: 008.50 ns
LL/SC           (c                0, d               20):   p50: 011.67 ns        p95: 011.67 ns          p99: 011.67 ns
LL/SC           (c               10, d                0):   p50: 048.25 ns        p95: 051.04 ns          p99: 052.49 ns
LL/SC           (c               10, d               10):   p50: 049.65 ns        p95: 057.90 ns          p99: 060.36 ns
LL/SC           (c               10, d               20):   p50: 059.60 ns        p95: 059.65 ns          p99: 059.66 ns
LL/SC           (c             1000, d                0):   p50: 016.79 ns        p95: 016.95 ns          p99: 016.97 ns
LL/SC           (c             1000, d               10):   p50: 018.73 ns        p95: 019.36 ns          p99: 019.60 ns
LL/SC           (c          1000000, d                0):   p50: 006.68 ns        p95: 006.70 ns          p99: 006.71 ns
LL/SC           (c          1000000, d               10):   p50: 008.60 ns        p95: 008.62 ns          p99: 008.63 ns
LDADD           (c                0, d                0):   p50: 017.77 ns        p95: 063.38 ns          p99: 063.39 ns
LDADD           (c                0, d              100):   p50: 101.71 ns        p95: 102.20 ns          p99: 102.32 ns
LDADD           (c                0, d              200):   p50: 146.30 ns        p95: 146.38 ns          p99: 146.40 ns
LDADD           (c                0, d              300):   p50: 187.31 ns        p95: 187.33 ns          p99: 187.37 ns
LDADD           (c                1, d               10):   p50: 069.49 ns        p95: 069.51 ns          p99: 069.52 ns
LDADD           (c               10, d                0):   p50: 069.67 ns        p95: 069.69 ns          p99: 069.78 ns
LDADD           (c               10, d               10):   p50: 069.66 ns        p95: 069.68 ns          p99: 069.69 ns
LDADD           (c              100, d                0):   p50: 070.91 ns        p95: 070.94 ns          p99: 070.98 ns
PFRM_KEEP+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.80 ns
PFRM_KEEP+STADD (c               10, d                0):   p50: 119.07 ns        p95: 119.29 ns          p99: 119.35 ns
PFRM_KEEP+STADD (c             1000, d                0):   p50: 066.09 ns        p95: 066.35 ns          p99: 066.47 ns
PFRM_KEEP+STADD (c          1000000, d                0):   p50: 018.46 ns        p95: 019.26 ns          p99: 019.66 ns
PFRM_STRM+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_STRM+STADD (c               10, d                0):   p50: 119.36 ns        p95: 119.71 ns          p99: 119.76 ns
PFRM_STRM+STADD (c             1000, d                0):   p50: 065.43 ns        p95: 066.03 ns          p99: 066.11 ns
PFRM_STRM+STADD (c          1000000, d                0):   p50: 019.02 ns        p95: 019.62 ns          p99: 020.02 ns

 CPU: 13 - Latency Percentiles:
====================
LSE (stadd)     (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
LSE (stadd)     (c                0, d              100):   p50: 048.52 ns        p95: 049.01 ns          p99: 049.08 ns
LSE (stadd)     (c                0, d              200):   p50: 086.40 ns        p95: 087.37 ns          p99: 087.41 ns
LSE (stadd)     (c               10, d                0):   p50: 038.17 ns        p95: 038.18 ns          p99: 038.18 ns
LSE (stadd)     (c               10, d              300):   p50: 125.61 ns        p95: 125.94 ns          p99: 126.08 ns
LSE (stadd)     (c               10, d              500):   p50: 201.14 ns        p95: 203.16 ns          p99: 203.20 ns
LSE (stadd)     (c               30, d                0):   p50: 038.15 ns        p95: 038.16 ns          p99: 038.17 ns
LL/SC           (c                0, d                0):   p50: 006.57 ns        p95: 006.57 ns          p99: 006.57 ns
LL/SC           (c                0, d               10):   p50: 008.50 ns        p95: 008.50 ns          p99: 008.50 ns
LL/SC           (c                0, d               20):   p50: 011.67 ns        p95: 011.67 ns          p99: 011.67 ns
LL/SC           (c               10, d                0):   p50: 048.28 ns        p95: 052.02 ns          p99: 053.32 ns
LL/SC           (c               10, d               10):   p50: 049.67 ns        p95: 060.85 ns          p99: 062.39 ns
LL/SC           (c               10, d               20):   p50: 059.43 ns        p95: 059.65 ns          p99: 060.10 ns
LL/SC           (c             1000, d                0):   p50: 016.75 ns        p95: 016.93 ns          p99: 017.01 ns
LL/SC           (c             1000, d               10):   p50: 018.90 ns        p95: 019.80 ns          p99: 019.99 ns
LL/SC           (c          1000000, d                0):   p50: 006.68 ns        p95: 006.71 ns          p99: 006.72 ns
LL/SC           (c          1000000, d               10):   p50: 008.60 ns        p95: 008.62 ns          p99: 008.62 ns
LDADD           (c                0, d                0):   p50: 063.35 ns        p95: 063.37 ns          p99: 063.37 ns
LDADD           (c                0, d              100):   p50: 101.69 ns        p95: 102.10 ns          p99: 102.26 ns
LDADD           (c                0, d              200):   p50: 146.67 ns        p95: 146.70 ns          p99: 146.77 ns
LDADD           (c                0, d              300):   p50: 187.32 ns        p95: 187.33 ns          p99: 187.34 ns
LDADD           (c                1, d               10):   p50: 069.49 ns        p95: 069.52 ns          p99: 069.53 ns
LDADD           (c               10, d                0):   p50: 069.66 ns        p95: 069.72 ns          p99: 069.79 ns
LDADD           (c               10, d               10):   p50: 069.67 ns        p95: 069.70 ns          p99: 069.71 ns
LDADD           (c              100, d                0):   p50: 070.90 ns        p95: 070.93 ns          p99: 070.94 ns
PFRM_KEEP+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_KEEP+STADD (c               10, d                0):   p50: 119.09 ns        p95: 119.46 ns          p99: 119.51 ns
PFRM_KEEP+STADD (c             1000, d                0):   p50: 066.19 ns        p95: 066.49 ns          p99: 066.53 ns
PFRM_KEEP+STADD (c          1000000, d                0):   p50: 019.20 ns        p95: 019.66 ns          p99: 019.78 ns
PFRM_STRM+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_STRM+STADD (c               10, d                0):   p50: 119.03 ns        p95: 119.64 ns          p99: 119.69 ns
PFRM_STRM+STADD (c             1000, d                0):   p50: 065.49 ns        p95: 066.52 ns          p99: 067.66 ns
PFRM_STRM+STADD (c          1000000, d                0):   p50: 019.12 ns        p95: 019.68 ns          p99: 019.94 ns

 CPU: 14 - Latency Percentiles:
====================
LSE (stadd)     (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
LSE (stadd)     (c                0, d              100):   p50: 048.53 ns        p95: 048.88 ns          p99: 049.02 ns
LSE (stadd)     (c                0, d              200):   p50: 087.29 ns        p95: 087.44 ns          p99: 087.47 ns
LSE (stadd)     (c               10, d                0):   p50: 038.15 ns        p95: 038.17 ns          p99: 038.24 ns
LSE (stadd)     (c               10, d              300):   p50: 123.85 ns        p95: 125.01 ns          p99: 125.28 ns
LSE (stadd)     (c               10, d              500):   p50: 202.79 ns        p95: 203.27 ns          p99: 203.33 ns
LSE (stadd)     (c               30, d                0):   p50: 038.15 ns        p95: 038.17 ns          p99: 038.25 ns
LL/SC           (c                0, d                0):   p50: 006.57 ns        p95: 006.57 ns          p99: 006.57 ns
LL/SC           (c                0, d               10):   p50: 008.50 ns        p95: 008.50 ns          p99: 008.50 ns
LL/SC           (c                0, d               20):   p50: 011.67 ns        p95: 011.67 ns          p99: 011.77 ns
LL/SC           (c               10, d                0):   p50: 042.23 ns        p95: 042.74 ns          p99: 042.78 ns
LL/SC           (c               10, d               10):   p50: 049.30 ns        p95: 049.71 ns          p99: 049.73 ns
LL/SC           (c               10, d               20):   p50: 059.19 ns        p95: 059.62 ns          p99: 059.66 ns
LL/SC           (c             1000, d                0):   p50: 016.75 ns        p95: 016.92 ns          p99: 016.95 ns
LL/SC           (c             1000, d               10):   p50: 018.88 ns        p95: 019.55 ns          p99: 019.72 ns
LL/SC           (c          1000000, d                0):   p50: 006.67 ns        p95: 006.69 ns          p99: 006.70 ns
LL/SC           (c          1000000, d               10):   p50: 008.59 ns        p95: 008.62 ns          p99: 008.70 ns
LDADD           (c                0, d                0):   p50: 063.35 ns        p95: 063.39 ns          p99: 063.46 ns
LDADD           (c                0, d              100):   p50: 049.45 ns        p95: 101.79 ns          p99: 101.92 ns
LDADD           (c                0, d              200):   p50: 146.30 ns        p95: 146.49 ns          p99: 146.68 ns
LDADD           (c                0, d              300):   p50: 187.32 ns        p95: 187.42 ns          p99: 187.43 ns
LDADD           (c                1, d               10):   p50: 069.49 ns        p95: 069.59 ns          p99: 069.60 ns
LDADD           (c               10, d                0):   p50: 069.68 ns        p95: 069.77 ns          p99: 069.79 ns
LDADD           (c               10, d               10):   p50: 069.68 ns        p95: 069.78 ns          p99: 069.79 ns
LDADD           (c              100, d                0):   p50: 070.92 ns        p95: 071.02 ns          p99: 071.05 ns
PFRM_KEEP+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.80 ns
PFRM_KEEP+STADD (c               10, d                0):   p50: 119.52 ns        p95: 119.73 ns          p99: 119.84 ns
PFRM_KEEP+STADD (c             1000, d                0):   p50: 065.78 ns        p95: 066.00 ns          p99: 066.17 ns
PFRM_KEEP+STADD (c          1000000, d                0):   p50: 019.15 ns        p95: 019.65 ns          p99: 019.87 ns
PFRM_STRM+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_STRM+STADD (c               10, d                0):   p50: 119.62 ns        p95: 119.89 ns          p99: 119.92 ns
PFRM_STRM+STADD (c             1000, d                0):   p50: 065.29 ns        p95: 065.57 ns          p99: 065.71 ns
PFRM_STRM+STADD (c          1000000, d                0):   p50: 019.17 ns        p95: 019.69 ns          p99: 019.78 ns

 CPU: 15 - Latency Percentiles:
====================
LSE (stadd)     (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
LSE (stadd)     (c                0, d              100):   p50: 048.76 ns        p95: 049.11 ns          p99: 049.19 ns
LSE (stadd)     (c                0, d              200):   p50: 087.27 ns        p95: 087.41 ns          p99: 087.48 ns
LSE (stadd)     (c               10, d                0):   p50: 038.14 ns        p95: 038.18 ns          p99: 038.30 ns
LSE (stadd)     (c               10, d              300):   p50: 123.83 ns        p95: 124.09 ns          p99: 124.45 ns
LSE (stadd)     (c               10, d              500):   p50: 200.99 ns        p95: 201.05 ns          p99: 201.59 ns
LSE (stadd)     (c               30, d                0):   p50: 038.16 ns        p95: 038.17 ns          p99: 038.18 ns
LL/SC           (c                0, d                0):   p50: 006.56 ns        p95: 006.57 ns          p99: 006.57 ns
LL/SC           (c                0, d               10):   p50: 008.50 ns        p95: 008.50 ns          p99: 008.50 ns
LL/SC           (c                0, d               20):   p50: 011.67 ns        p95: 011.67 ns          p99: 011.67 ns
LL/SC           (c               10, d                0):   p50: 048.21 ns        p95: 051.07 ns          p99: 052.42 ns
LL/SC           (c               10, d               10):   p50: 058.72 ns        p95: 061.74 ns          p99: 063.14 ns
LL/SC           (c               10, d               20):   p50: 058.09 ns        p95: 060.97 ns          p99: 061.95 ns
LL/SC           (c             1000, d                0):   p50: 013.06 ns        p95: 013.43 ns          p99: 013.72 ns
LL/SC           (c             1000, d               10):   p50: 019.01 ns        p95: 019.47 ns          p99: 019.62 ns
LL/SC           (c          1000000, d                0):   p50: 006.67 ns        p95: 006.69 ns          p99: 006.70 ns
LL/SC           (c          1000000, d               10):   p50: 008.60 ns        p95: 008.61 ns          p99: 008.62 ns
LDADD           (c                0, d                0):   p50: 063.35 ns        p95: 063.38 ns          p99: 063.38 ns
LDADD           (c                0, d              100):   p50: 049.22 ns        p95: 101.66 ns          p99: 102.02 ns
LDADD           (c                0, d              200):   p50: 146.29 ns        p95: 146.48 ns          p99: 146.68 ns
LDADD           (c                0, d              300):   p50: 187.31 ns        p95: 187.32 ns          p99: 187.32 ns
LDADD           (c                1, d               10):   p50: 069.49 ns        p95: 069.51 ns          p99: 069.51 ns
LDADD           (c               10, d                0):   p50: 069.67 ns        p95: 069.69 ns          p99: 069.70 ns
LDADD           (c               10, d               10):   p50: 069.67 ns        p95: 069.70 ns          p99: 069.92 ns
LDADD           (c              100, d                0):   p50: 070.91 ns        p95: 070.92 ns          p99: 070.93 ns
PFRM_KEEP+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_KEEP+STADD (c               10, d                0):   p50: 119.36 ns        p95: 119.68 ns          p99: 119.78 ns
PFRM_KEEP+STADD (c             1000, d                0):   p50: 066.18 ns        p95: 066.54 ns          p99: 066.63 ns
PFRM_KEEP+STADD (c          1000000, d                0):   p50: 019.12 ns        p95: 019.70 ns          p99: 019.87 ns
PFRM_STRM+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_STRM+STADD (c               10, d                0):   p50: 118.91 ns        p95: 119.18 ns          p99: 119.32 ns
PFRM_STRM+STADD (c             1000, d                0):   p50: 066.00 ns        p95: 066.39 ns          p99: 066.48 ns
PFRM_STRM+STADD (c          1000000, d                0):   p50: 019.14 ns        p95: 019.73 ns          p99: 019.87 ns

 CPU: 16 - Latency Percentiles:
====================
LSE (stadd)     (c                0, d                0):   p50: 010.43 ns        p95: 010.43 ns          p99: 010.44 ns
LSE (stadd)     (c                0, d              100):   p50: 048.54 ns        p95: 048.96 ns          p99: 049.08 ns
LSE (stadd)     (c                0, d              200):   p50: 086.26 ns        p95: 086.77 ns          p99: 087.02 ns
LSE (stadd)     (c               10, d                0):   p50: 040.49 ns        p95: 040.51 ns          p99: 040.51 ns
LSE (stadd)     (c               10, d              300):   p50: 123.88 ns        p95: 124.55 ns          p99: 125.15 ns
LSE (stadd)     (c               10, d              500):   p50: 201.12 ns        p95: 202.73 ns          p99: 202.98 ns
LSE (stadd)     (c               30, d                0):   p50: 040.47 ns        p95: 040.49 ns          p99: 040.49 ns
LL/SC           (c                0, d                0):   p50: 006.57 ns        p95: 006.57 ns          p99: 006.57 ns
LL/SC           (c                0, d               10):   p50: 008.50 ns        p95: 008.50 ns          p99: 008.50 ns
LL/SC           (c                0, d               20):   p50: 011.67 ns        p95: 011.67 ns          p99: 011.67 ns
LL/SC           (c               10, d                0):   p50: 050.75 ns        p95: 052.20 ns          p99: 052.57 ns
LL/SC           (c               10, d               10):   p50: 057.55 ns        p95: 059.27 ns          p99: 060.80 ns
LL/SC           (c               10, d               20):   p50: 058.58 ns        p95: 059.07 ns          p99: 059.08 ns
LL/SC           (c             1000, d                0):   p50: 012.37 ns        p95: 012.78 ns          p99: 012.83 ns
LL/SC           (c             1000, d               10):   p50: 014.40 ns        p95: 015.00 ns          p99: 015.16 ns
LL/SC           (c          1000000, d                0):   p50: 006.60 ns        p95: 006.61 ns          p99: 006.61 ns
LL/SC           (c          1000000, d               10):   p50: 008.55 ns        p95: 008.56 ns          p99: 008.56 ns
LDADD           (c                0, d                0):   p50: 017.77 ns        p95: 074.18 ns          p99: 074.19 ns
LDADD           (c                0, d              100):   p50: 056.67 ns        p95: 112.40 ns          p99: 112.60 ns
LDADD           (c                0, d              200):   p50: 157.10 ns        p95: 157.15 ns          p99: 157.30 ns
LDADD           (c                0, d              300):   p50: 198.13 ns        p95: 198.16 ns          p99: 198.16 ns
LDADD           (c                1, d               10):   p50: 074.15 ns        p95: 074.17 ns          p99: 074.28 ns
LDADD           (c               10, d                0):   p50: 074.49 ns        p95: 074.50 ns          p99: 074.51 ns
LDADD           (c               10, d               10):   p50: 074.48 ns        p95: 074.50 ns          p99: 074.54 ns
LDADD           (c              100, d                0):   p50: 074.10 ns        p95: 074.12 ns          p99: 074.12 ns
PFRM_KEEP+STADD (c                0, d                0):   p50: 005.79 ns        p95: 006.02 ns          p99: 006.15 ns
PFRM_KEEP+STADD (c               10, d                0):   p50: 123.62 ns        p95: 124.06 ns          p99: 124.37 ns
PFRM_KEEP+STADD (c             1000, d                0):   p50: 077.18 ns        p95: 077.43 ns          p99: 077.64 ns
PFRM_KEEP+STADD (c          1000000, d                0):   p50: 018.93 ns        p95: 019.81 ns          p99: 020.00 ns
PFRM_STRM+STADD (c                0, d                0):   p50: 006.40 ns        p95: 009.75 ns          p99: 010.36 ns
PFRM_STRM+STADD (c               10, d                0):   p50: 124.78 ns        p95: 125.10 ns          p99: 125.23 ns
PFRM_STRM+STADD (c             1000, d                0):   p50: 088.70 ns        p95: 089.01 ns          p99: 089.12 ns
PFRM_STRM+STADD (c          1000000, d                0):   p50: 020.20 ns        p95: 020.95 ns          p99: 021.07 ns

 CPU: 17 - Latency Percentiles:
====================
LSE (stadd)     (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
LSE (stadd)     (c                0, d              100):   p50: 048.75 ns        p95: 049.08 ns          p99: 049.19 ns
LSE (stadd)     (c                0, d              200):   p50: 086.21 ns        p95: 086.89 ns          p99: 087.07 ns
LSE (stadd)     (c               10, d                0):   p50: 040.48 ns        p95: 040.50 ns          p99: 040.58 ns
LSE (stadd)     (c               10, d              300):   p50: 123.84 ns        p95: 125.56 ns          p99: 125.76 ns
LSE (stadd)     (c               10, d              500):   p50: 200.99 ns        p95: 201.53 ns          p99: 201.84 ns
LSE (stadd)     (c               30, d                0):   p50: 040.47 ns        p95: 040.48 ns          p99: 040.49 ns
LL/SC           (c                0, d                0):   p50: 006.57 ns        p95: 006.57 ns          p99: 006.57 ns
LL/SC           (c                0, d               10):   p50: 008.50 ns        p95: 008.50 ns          p99: 008.50 ns
LL/SC           (c                0, d               20):   p50: 011.67 ns        p95: 011.67 ns          p99: 011.67 ns
LL/SC           (c               10, d                0):   p50: 041.36 ns        p95: 042.29 ns          p99: 042.31 ns
LL/SC           (c               10, d               10):   p50: 048.59 ns        p95: 049.10 ns          p99: 049.58 ns
LL/SC           (c               10, d               20):   p50: 058.60 ns        p95: 059.53 ns          p99: 060.02 ns
LL/SC           (c             1000, d                0):   p50: 012.33 ns        p95: 012.65 ns          p99: 012.81 ns
LL/SC           (c             1000, d               10):   p50: 014.34 ns        p95: 014.91 ns          p99: 014.96 ns
LL/SC           (c          1000000, d                0):   p50: 006.60 ns        p95: 006.61 ns          p99: 006.62 ns
LL/SC           (c          1000000, d               10):   p50: 008.54 ns        p95: 008.56 ns          p99: 008.56 ns
LDADD           (c                0, d                0):   p50: 074.16 ns        p95: 074.19 ns          p99: 074.22 ns
LDADD           (c                0, d              100):   p50: 112.12 ns        p95: 112.65 ns          p99: 113.08 ns
LDADD           (c                0, d              200):   p50: 157.11 ns        p95: 157.50 ns          p99: 157.52 ns
LDADD           (c                0, d              300):   p50: 198.12 ns        p95: 198.13 ns          p99: 198.14 ns
LDADD           (c                1, d               10):   p50: 074.14 ns        p95: 074.15 ns          p99: 074.16 ns
LDADD           (c               10, d                0):   p50: 074.48 ns        p95: 074.50 ns          p99: 074.60 ns
LDADD           (c               10, d               10):   p50: 074.48 ns        p95: 074.50 ns          p99: 074.52 ns
LDADD           (c              100, d                0):   p50: 074.09 ns        p95: 074.12 ns          p99: 074.13 ns
PFRM_KEEP+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_KEEP+STADD (c               10, d                0):   p50: 123.87 ns        p95: 124.64 ns          p99: 124.82 ns
PFRM_KEEP+STADD (c             1000, d                0):   p50: 077.16 ns        p95: 077.49 ns          p99: 077.56 ns
PFRM_KEEP+STADD (c          1000000, d                0):   p50: 019.28 ns        p95: 019.99 ns          p99: 020.10 ns
PFRM_STRM+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_STRM+STADD (c               10, d                0):   p50: 124.58 ns        p95: 124.91 ns          p99: 125.03 ns
PFRM_STRM+STADD (c             1000, d                0):   p50: 089.03 ns        p95: 089.41 ns          p99: 089.52 ns
PFRM_STRM+STADD (c          1000000, d                0):   p50: 019.93 ns        p95: 020.85 ns          p99: 021.25 ns

 CPU: 18 - Latency Percentiles:
====================
LSE (stadd)     (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
LSE (stadd)     (c                0, d              100):   p50: 048.62 ns        p95: 049.08 ns          p99: 049.14 ns
LSE (stadd)     (c                0, d              200):   p50: 086.36 ns        p95: 087.28 ns          p99: 087.45 ns
LSE (stadd)     (c               10, d                0):   p50: 040.46 ns        p95: 040.49 ns          p99: 040.49 ns
LSE (stadd)     (c               10, d              300):   p50: 123.84 ns        p95: 123.89 ns          p99: 123.95 ns
LSE (stadd)     (c               10, d              500):   p50: 202.59 ns        p95: 202.96 ns          p99: 203.02 ns
LSE (stadd)     (c               30, d                0):   p50: 040.46 ns        p95: 040.49 ns          p99: 040.62 ns
LL/SC           (c                0, d                0):   p50: 006.57 ns        p95: 006.57 ns          p99: 006.57 ns
LL/SC           (c                0, d               10):   p50: 008.50 ns        p95: 008.50 ns          p99: 008.50 ns
LL/SC           (c                0, d               20):   p50: 011.67 ns        p95: 011.67 ns          p99: 011.67 ns
LL/SC           (c               10, d                0):   p50: 050.70 ns        p95: 052.22 ns          p99: 052.64 ns
LL/SC           (c               10, d               10):   p50: 057.53 ns        p95: 059.50 ns          p99: 059.82 ns
LL/SC           (c               10, d               20):   p50: 058.31 ns        p95: 059.81 ns          p99: 060.28 ns
LL/SC           (c             1000, d                0):   p50: 011.99 ns        p95: 012.66 ns          p99: 012.82 ns
LL/SC           (c             1000, d               10):   p50: 016.97 ns        p95: 017.73 ns          p99: 018.05 ns
LL/SC           (c          1000000, d                0):   p50: 006.60 ns        p95: 006.61 ns          p99: 006.61 ns
LL/SC           (c          1000000, d               10):   p50: 008.55 ns        p95: 008.56 ns          p99: 008.56 ns
LDADD           (c                0, d                0):   p50: 010.04 ns        p95: 074.17 ns          p99: 074.17 ns
LDADD           (c                0, d              100):   p50: 111.99 ns        p95: 112.57 ns          p99: 112.70 ns
LDADD           (c                0, d              200):   p50: 157.37 ns        p95: 157.49 ns          p99: 157.49 ns
LDADD           (c                0, d              300):   p50: 198.12 ns        p95: 198.13 ns          p99: 198.18 ns
LDADD           (c                1, d               10):   p50: 074.14 ns        p95: 074.17 ns          p99: 074.20 ns
LDADD           (c               10, d                0):   p50: 074.49 ns        p95: 074.54 ns          p99: 074.58 ns
LDADD           (c               10, d               10):   p50: 074.48 ns        p95: 074.52 ns          p99: 074.59 ns
LDADD           (c              100, d                0):   p50: 074.10 ns        p95: 074.13 ns          p99: 074.15 ns
PFRM_KEEP+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.80 ns
PFRM_KEEP+STADD (c               10, d                0):   p50: 124.63 ns        p95: 124.92 ns          p99: 125.07 ns
PFRM_KEEP+STADD (c             1000, d                0):   p50: 089.19 ns        p95: 089.47 ns          p99: 089.56 ns
PFRM_KEEP+STADD (c          1000000, d                0):   p50: 019.29 ns        p95: 020.18 ns          p99: 020.37 ns
PFRM_STRM+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_STRM+STADD (c               10, d                0):   p50: 124.55 ns        p95: 124.83 ns          p99: 124.97 ns
PFRM_STRM+STADD (c             1000, d                0):   p50: 088.71 ns        p95: 089.11 ns          p99: 089.17 ns
PFRM_STRM+STADD (c          1000000, d                0):   p50: 020.39 ns        p95: 020.98 ns          p99: 021.19 ns

 CPU: 19 - Latency Percentiles:
====================
LSE (stadd)     (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
LSE (stadd)     (c                0, d              100):   p50: 048.63 ns        p95: 048.97 ns          p99: 049.24 ns
LSE (stadd)     (c                0, d              200):   p50: 087.30 ns        p95: 087.45 ns          p99: 087.50 ns
LSE (stadd)     (c               10, d                0):   p50: 040.49 ns        p95: 040.50 ns          p99: 040.51 ns
LSE (stadd)     (c               10, d              300):   p50: 123.89 ns        p95: 124.31 ns          p99: 124.79 ns
LSE (stadd)     (c               10, d              500):   p50: 202.37 ns        p95: 203.12 ns          p99: 203.23 ns
LSE (stadd)     (c               30, d                0):   p50: 040.47 ns        p95: 040.48 ns          p99: 040.48 ns
LL/SC           (c                0, d                0):   p50: 006.57 ns        p95: 006.57 ns          p99: 006.57 ns
LL/SC           (c                0, d               10):   p50: 008.50 ns        p95: 008.50 ns          p99: 008.50 ns
LL/SC           (c                0, d               20):   p50: 011.67 ns        p95: 011.67 ns          p99: 011.67 ns
LL/SC           (c               10, d                0):   p50: 041.34 ns        p95: 041.83 ns          p99: 042.27 ns
LL/SC           (c               10, d               10):   p50: 048.47 ns        p95: 048.64 ns          p99: 050.53 ns
LL/SC           (c               10, d               20):   p50: 058.56 ns        p95: 059.05 ns          p99: 059.52 ns
LL/SC           (c             1000, d                0):   p50: 012.16 ns        p95: 012.57 ns          p99: 012.67 ns
LL/SC           (c             1000, d               10):   p50: 014.43 ns        p95: 014.92 ns          p99: 014.97 ns
LL/SC           (c          1000000, d                0):   p50: 006.60 ns        p95: 006.61 ns          p99: 006.62 ns
LL/SC           (c          1000000, d               10):   p50: 008.54 ns        p95: 008.56 ns          p99: 008.56 ns
LDADD           (c                0, d                0):   p50: 010.04 ns        p95: 010.04 ns          p99: 010.04 ns
LDADD           (c                0, d              100):   p50: 112.14 ns        p95: 112.61 ns          p99: 112.74 ns
LDADD           (c                0, d              200):   p50: 157.39 ns        p95: 157.51 ns          p99: 157.51 ns
LDADD           (c                0, d              300):   p50: 198.12 ns        p95: 198.16 ns          p99: 198.56 ns
LDADD           (c                1, d               10):   p50: 074.14 ns        p95: 074.16 ns          p99: 074.32 ns
LDADD           (c               10, d                0):   p50: 074.47 ns        p95: 074.49 ns          p99: 074.49 ns
LDADD           (c               10, d               10):   p50: 074.48 ns        p95: 074.51 ns          p99: 074.72 ns
LDADD           (c              100, d                0):   p50: 074.10 ns        p95: 074.11 ns          p99: 074.12 ns
PFRM_KEEP+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_KEEP+STADD (c               10, d                0):   p50: 123.66 ns        p95: 124.13 ns          p99: 124.46 ns
PFRM_KEEP+STADD (c             1000, d                0):   p50: 077.11 ns        p95: 077.35 ns          p99: 077.46 ns
PFRM_KEEP+STADD (c          1000000, d                0):   p50: 019.62 ns        p95: 020.17 ns          p99: 020.38 ns
PFRM_STRM+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_STRM+STADD (c               10, d                0):   p50: 124.71 ns        p95: 124.94 ns          p99: 125.07 ns
PFRM_STRM+STADD (c             1000, d                0):   p50: 088.79 ns        p95: 089.13 ns          p99: 089.18 ns
PFRM_STRM+STADD (c          1000000, d                0):   p50: 020.42 ns        p95: 021.01 ns          p99: 021.54 ns

 CPU: 20 - Latency Percentiles:
====================
LSE (stadd)     (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
LSE (stadd)     (c                0, d              100):   p50: 048.72 ns        p95: 049.11 ns          p99: 049.25 ns
LSE (stadd)     (c                0, d              200):   p50: 087.31 ns        p95: 087.48 ns          p99: 087.61 ns
LSE (stadd)     (c               10, d                0):   p50: 038.15 ns        p95: 038.20 ns          p99: 038.41 ns
LSE (stadd)     (c               10, d              300):   p50: 123.87 ns        p95: 124.01 ns          p99: 124.91 ns
LSE (stadd)     (c               10, d              500):   p50: 201.04 ns        p95: 202.93 ns          p99: 203.03 ns
LSE (stadd)     (c               30, d                0):   p50: 038.15 ns        p95: 038.17 ns          p99: 038.17 ns
LL/SC           (c                0, d                0):   p50: 006.57 ns        p95: 006.57 ns          p99: 006.57 ns
LL/SC           (c                0, d               10):   p50: 008.50 ns        p95: 008.50 ns          p99: 008.50 ns
LL/SC           (c                0, d               20):   p50: 011.67 ns        p95: 011.67 ns          p99: 011.67 ns
LL/SC           (c               10, d                0):   p50: 045.37 ns        p95: 046.08 ns          p99: 046.46 ns
LL/SC           (c               10, d               10):   p50: 053.40 ns        p95: 053.46 ns          p99: 053.49 ns
LL/SC           (c               10, d               20):   p50: 064.12 ns        p95: 064.63 ns          p99: 064.65 ns
LL/SC           (c             1000, d                0):   p50: 010.25 ns        p95: 010.64 ns          p99: 010.70 ns
LL/SC           (c             1000, d               10):   p50: 014.76 ns        p95: 015.15 ns          p99: 015.33 ns
LL/SC           (c          1000000, d                0):   p50: 006.61 ns        p95: 006.62 ns          p99: 006.63 ns
LL/SC           (c          1000000, d               10):   p50: 008.57 ns        p95: 008.58 ns          p99: 008.59 ns
LDADD           (c                0, d                0):   p50: 064.90 ns        p95: 064.92 ns          p99: 065.00 ns
LDADD           (c                0, d              100):   p50: 102.83 ns        p95: 103.27 ns          p99: 103.39 ns
LDADD           (c                0, d              200):   p50: 101.11 ns        p95: 148.21 ns          p99: 148.23 ns
LDADD           (c                0, d              300):   p50: 188.86 ns        p95: 188.87 ns          p99: 188.96 ns
LDADD           (c                1, d               10):   p50: 069.50 ns        p95: 069.52 ns          p99: 069.53 ns
LDADD           (c               10, d                0):   p50: 069.67 ns        p95: 069.69 ns          p99: 069.70 ns
LDADD           (c               10, d               10):   p50: 069.69 ns        p95: 069.72 ns          p99: 069.81 ns
LDADD           (c              100, d                0):   p50: 070.94 ns        p95: 070.96 ns          p99: 070.97 ns
PFRM_KEEP+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_KEEP+STADD (c               10, d                0):   p50: 118.46 ns        p95: 119.09 ns          p99: 119.23 ns
PFRM_KEEP+STADD (c             1000, d                0):   p50: 067.08 ns        p95: 067.40 ns          p99: 068.06 ns
PFRM_KEEP+STADD (c          1000000, d                0):   p50: 018.78 ns        p95: 019.44 ns          p99: 019.59 ns
PFRM_STRM+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_STRM+STADD (c               10, d                0):   p50: 116.67 ns        p95: 120.14 ns          p99: 120.18 ns
PFRM_STRM+STADD (c             1000, d                0):   p50: 066.58 ns        p95: 066.84 ns          p99: 067.00 ns
PFRM_STRM+STADD (c          1000000, d                0):   p50: 019.21 ns        p95: 019.72 ns          p99: 019.98 ns

 CPU: 21 - Latency Percentiles:
====================
LSE (stadd)     (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
LSE (stadd)     (c                0, d              100):   p50: 048.46 ns        p95: 048.82 ns          p99: 048.88 ns
LSE (stadd)     (c                0, d              200):   p50: 086.27 ns        p95: 086.43 ns          p99: 087.07 ns
LSE (stadd)     (c               10, d                0):   p50: 038.17 ns        p95: 038.19 ns          p99: 038.19 ns
LSE (stadd)     (c               10, d              300):   p50: 125.71 ns        p95: 126.00 ns          p99: 126.08 ns
LSE (stadd)     (c               10, d              500):   p50: 202.44 ns        p95: 203.04 ns          p99: 203.15 ns
LSE (stadd)     (c               30, d                0):   p50: 038.17 ns        p95: 038.18 ns          p99: 038.18 ns
LL/SC           (c                0, d                0):   p50: 006.57 ns        p95: 006.57 ns          p99: 006.57 ns
LL/SC           (c                0, d               10):   p50: 008.50 ns        p95: 008.50 ns          p99: 008.50 ns
LL/SC           (c                0, d               20):   p50: 011.67 ns        p95: 011.67 ns          p99: 011.67 ns
LL/SC           (c               10, d                0):   p50: 045.37 ns        p95: 045.91 ns          p99: 045.92 ns
LL/SC           (c               10, d               10):   p50: 052.97 ns        p95: 053.51 ns          p99: 054.67 ns
LL/SC           (c               10, d               20):   p50: 064.10 ns        p95: 064.63 ns          p99: 064.66 ns
LL/SC           (c             1000, d                0):   p50: 010.17 ns        p95: 010.49 ns          p99: 010.62 ns
LL/SC           (c             1000, d               10):   p50: 014.86 ns        p95: 015.25 ns          p99: 015.40 ns
LL/SC           (c          1000000, d                0):   p50: 006.61 ns        p95: 006.62 ns          p99: 006.63 ns
LL/SC           (c          1000000, d               10):   p50: 008.56 ns        p95: 008.58 ns          p99: 008.58 ns
LDADD           (c                0, d                0):   p50: 064.90 ns        p95: 064.93 ns          p99: 065.00 ns
LDADD           (c                0, d              100):   p50: 049.28 ns        p95: 049.82 ns          p99: 049.99 ns
LDADD           (c                0, d              200):   p50: 148.22 ns        p95: 148.25 ns          p99: 148.27 ns
LDADD           (c                0, d              300):   p50: 188.86 ns        p95: 188.89 ns          p99: 188.89 ns
LDADD           (c                1, d               10):   p50: 069.49 ns        p95: 069.53 ns          p99: 069.67 ns
LDADD           (c               10, d                0):   p50: 069.69 ns        p95: 069.73 ns          p99: 069.73 ns
LDADD           (c               10, d               10):   p50: 069.69 ns        p95: 069.73 ns          p99: 069.75 ns
LDADD           (c              100, d                0):   p50: 070.93 ns        p95: 070.95 ns          p99: 070.96 ns
PFRM_KEEP+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_KEEP+STADD (c               10, d                0):   p50: 120.29 ns        p95: 120.64 ns          p99: 120.83 ns
PFRM_KEEP+STADD (c             1000, d                0):   p50: 066.97 ns        p95: 067.27 ns          p99: 067.35 ns
PFRM_KEEP+STADD (c          1000000, d                0):   p50: 019.23 ns        p95: 019.75 ns          p99: 019.89 ns
PFRM_STRM+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_STRM+STADD (c               10, d                0):   p50: 116.26 ns        p95: 116.67 ns          p99: 116.71 ns
PFRM_STRM+STADD (c             1000, d                0):   p50: 067.20 ns        p95: 067.54 ns          p99: 067.89 ns
PFRM_STRM+STADD (c          1000000, d                0):   p50: 019.17 ns        p95: 019.76 ns          p99: 019.91 ns

 CPU: 22 - Latency Percentiles:
====================
LSE (stadd)     (c                0, d                0):   p50: 010.43 ns        p95: 026.99 ns          p99: 026.99 ns
LSE (stadd)     (c                0, d              100):   p50: 048.80 ns        p95: 049.18 ns          p99: 049.31 ns
LSE (stadd)     (c                0, d              200):   p50: 087.29 ns        p95: 087.45 ns          p99: 087.49 ns
LSE (stadd)     (c               10, d                0):   p50: 038.15 ns        p95: 038.16 ns          p99: 038.17 ns
LSE (stadd)     (c               10, d              300):   p50: 123.84 ns        p95: 123.88 ns          p99: 123.89 ns
LSE (stadd)     (c               10, d              500):   p50: 202.65 ns        p95: 203.00 ns          p99: 203.05 ns
LSE (stadd)     (c               30, d                0):   p50: 038.17 ns        p95: 038.19 ns          p99: 038.37 ns
LL/SC           (c                0, d                0):   p50: 006.57 ns        p95: 006.57 ns          p99: 006.57 ns
LL/SC           (c                0, d               10):   p50: 008.50 ns        p95: 008.50 ns          p99: 008.50 ns
LL/SC           (c                0, d               20):   p50: 011.67 ns        p95: 011.67 ns          p99: 011.67 ns
LL/SC           (c               10, d                0):   p50: 045.36 ns        p95: 045.90 ns          p99: 045.93 ns
LL/SC           (c               10, d               10):   p50: 052.90 ns        p95: 053.44 ns          p99: 053.49 ns
LL/SC           (c               10, d               20):   p50: 064.10 ns        p95: 064.62 ns          p99: 065.14 ns
LL/SC           (c             1000, d                0):   p50: 010.18 ns        p95: 010.52 ns          p99: 010.66 ns
LL/SC           (c             1000, d               10):   p50: 014.70 ns        p95: 015.15 ns          p99: 015.37 ns
LL/SC           (c          1000000, d                0):   p50: 006.60 ns        p95: 006.61 ns          p99: 006.62 ns
LL/SC           (c          1000000, d               10):   p50: 008.57 ns        p95: 008.59 ns          p99: 008.61 ns
LDADD           (c                0, d                0):   p50: 064.91 ns        p95: 064.93 ns          p99: 065.10 ns
LDADD           (c                0, d              100):   p50: 103.09 ns        p95: 103.53 ns          p99: 103.63 ns
LDADD           (c                0, d              200):   p50: 147.83 ns        p95: 147.96 ns          p99: 148.18 ns
LDADD           (c                0, d              300):   p50: 188.86 ns        p95: 188.88 ns          p99: 188.88 ns
LDADD           (c                1, d               10):   p50: 069.50 ns        p95: 069.51 ns          p99: 069.52 ns
LDADD           (c               10, d                0):   p50: 069.67 ns        p95: 069.69 ns          p99: 069.70 ns
LDADD           (c               10, d               10):   p50: 069.68 ns        p95: 069.71 ns          p99: 069.84 ns
LDADD           (c              100, d                0):   p50: 070.91 ns        p95: 070.93 ns          p99: 070.95 ns
PFRM_KEEP+STADD (c                0, d                0):   p50: 007.04 ns        p95: 007.71 ns          p99: 007.88 ns
PFRM_KEEP+STADD (c               10, d                0):   p50: 118.50 ns        p95: 118.99 ns          p99: 119.34 ns
PFRM_KEEP+STADD (c             1000, d                0):   p50: 067.13 ns        p95: 067.52 ns          p99: 067.95 ns
PFRM_KEEP+STADD (c          1000000, d                0):   p50: 018.40 ns        p95: 019.36 ns          p99: 019.67 ns
PFRM_STRM+STADD (c                0, d                0):   p50: 009.59 ns        p95: 010.03 ns          p99: 010.16 ns
PFRM_STRM+STADD (c               10, d                0):   p50: 116.54 ns        p95: 117.08 ns          p99: 117.22 ns
PFRM_STRM+STADD (c             1000, d                0):   p50: 066.99 ns        p95: 067.24 ns          p99: 067.35 ns
PFRM_STRM+STADD (c          1000000, d                0):   p50: 019.27 ns        p95: 019.77 ns          p99: 020.07 ns

 CPU: 23 - Latency Percentiles:
====================
LSE (stadd)     (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
LSE (stadd)     (c                0, d              100):   p50: 048.60 ns        p95: 048.97 ns          p99: 049.01 ns
LSE (stadd)     (c                0, d              200):   p50: 087.26 ns        p95: 087.42 ns          p99: 087.48 ns
LSE (stadd)     (c               10, d                0):   p50: 038.17 ns        p95: 038.19 ns          p99: 038.29 ns
LSE (stadd)     (c               10, d              300):   p50: 123.87 ns        p95: 123.93 ns          p99: 123.99 ns
LSE (stadd)     (c               10, d              500):   p50: 202.76 ns        p95: 203.10 ns          p99: 203.16 ns
LSE (stadd)     (c               30, d                0):   p50: 038.17 ns        p95: 038.39 ns          p99: 038.68 ns
LL/SC           (c                0, d                0):   p50: 006.57 ns        p95: 006.57 ns          p99: 006.57 ns
LL/SC           (c                0, d               10):   p50: 008.50 ns        p95: 008.50 ns          p99: 008.50 ns
LL/SC           (c                0, d               20):   p50: 011.67 ns        p95: 011.67 ns          p99: 011.67 ns
LL/SC           (c               10, d                0):   p50: 045.37 ns        p95: 045.91 ns          p99: 045.91 ns
LL/SC           (c               10, d               10):   p50: 052.91 ns        p95: 053.50 ns          p99: 055.37 ns
LL/SC           (c               10, d               20):   p50: 064.11 ns        p95: 064.65 ns          p99: 065.10 ns
LL/SC           (c             1000, d                0):   p50: 010.27 ns        p95: 010.62 ns          p99: 010.71 ns
LL/SC           (c             1000, d               10):   p50: 014.77 ns        p95: 015.15 ns          p99: 015.26 ns
LL/SC           (c          1000000, d                0):   p50: 006.61 ns        p95: 006.62 ns          p99: 006.62 ns
LL/SC           (c          1000000, d               10):   p50: 008.56 ns        p95: 008.58 ns          p99: 008.58 ns
LDADD           (c                0, d                0):   p50: 064.93 ns        p95: 064.95 ns          p99: 064.97 ns
LDADD           (c                0, d              100):   p50: 049.43 ns        p95: 103.16 ns          p99: 103.40 ns
LDADD           (c                0, d              200):   p50: 147.83 ns        p95: 148.03 ns          p99: 148.13 ns
LDADD           (c                0, d              300):   p50: 188.86 ns        p95: 188.90 ns          p99: 188.92 ns
LDADD           (c                1, d               10):   p50: 069.50 ns        p95: 069.52 ns          p99: 069.53 ns
LDADD           (c               10, d                0):   p50: 069.68 ns        p95: 069.70 ns          p99: 069.85 ns
LDADD           (c               10, d               10):   p50: 069.67 ns        p95: 069.69 ns          p99: 069.69 ns
LDADD           (c              100, d                0):   p50: 070.92 ns        p95: 070.94 ns          p99: 070.95 ns
PFRM_KEEP+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_KEEP+STADD (c               10, d                0):   p50: 120.24 ns        p95: 120.51 ns          p99: 120.61 ns
PFRM_KEEP+STADD (c             1000, d                0):   p50: 066.93 ns        p95: 067.12 ns          p99: 067.21 ns
PFRM_KEEP+STADD (c          1000000, d                0):   p50: 019.19 ns        p95: 019.77 ns          p99: 020.00 ns
PFRM_STRM+STADD (c                0, d                0):   p50: 005.79 ns        p95: 005.79 ns          p99: 005.79 ns
PFRM_STRM+STADD (c               10, d                0):   p50: 120.13 ns        p95: 120.35 ns          p99: 120.48 ns
PFRM_STRM+STADD (c             1000, d                0):   p50: 066.58 ns        p95: 067.48 ns          p99: 069.22 ns
PFRM_STRM+STADD (c          1000000, d                0):   p50: 019.19 ns        p95: 019.70 ns          p99: 019.92 ns

=== Benchmark Complete ===

