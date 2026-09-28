Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D3C8CA5FA3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Sep 2026 09:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EMqR6vKqG0eu05A9NobGOudkspzGkyf5Myx8wtsS/mc=; b=sftfmb6uEaNzVzQKtUY7XJVOkd
	ENJ2n7j6YmyZ0HRSlTo/4XKWBEke7iLAQgApRnen3uPFknB5EkIAyDjHBR/tWDPKwB9vAk8UAGo+G
	qTj3gw9eolh4BZRF+KliA4epQ2f6ffD7+4E0Aw8RcZ52W1q7ZIbdqwjiv+38vYczWsQqyK3eboyS6
	/RrIv14l0uGlqT1+78oeU/Hl+A0g9VLJTXO1nKOJwiRYzLuXXj5mR+FZBkw8GnRnbqW5sBImxTcZj
	W4ZISRbEyo27zkdtnZEerjgmcFiZuxYn6Kz/YsCD4wCsr1Ubc4goAEzI0p4R830tspb9RC7s/+OU/
	mivJzvxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7xu-00000000Gou-1Z3g;
	Mon, 28 Sep 2026 09:48:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB7xq-00000000Gmk-3IjO;
	Mon, 28 Sep 2026 09:48:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=EMqR6vKqG0eu05A9NobGOudkspzGkyf5Myx8wtsS/mc=; b=c83lEO3t1By6HM120bk23LVdvJ
	EZG96rPpfWMKFsWFTzpCsqJ1IRiweNS1+Ul0OHuo006QDQtmqlKkoPQwx9XbgHfYOUpA6IRqBecAc
	X5UP8jWwWKW66Fsci3150y5g2IQ0Dw7hjM6oJxn2mBIgTV2APpOmcPXc5HmkqP55PX4GCa3dPS3bD
	hzW/Ll1eBDfLCZWJud1d3Svr1iP0PBE/5eBqB7Fiq6ZdhdQtLL3g7lq2qd63Cvf/93YP/ipQDwp2o
	8rA3wYlAtWUFKrKMQRgfeNuEQUiD5WjVRJwaqJVRG0MvXt/GpgHj/FFRFdjy1U5mGC2BD2hv5TxCE
	GEqzc1+g==;
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xB7xm-00000001KK2-3zXD;
	Mon, 28 Sep 2026 09:48:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1790588865; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=EMqR6vKqG0eu05A9NobGOudkspzGkyf5Myx8wtsS/mc=;
	b=h/GLixwKtVEJnsNZvjgtVnvFxdgxmJotz3Kf1VYdIIemaS2HpupGq88aaWDiWvTts4oH5/lak7qu6gLWWmxUZnF8whgREoN0So7R7p7FEpnA3SwnWbLF95UkIgKtL58xo+xl0ywAl8x89kVgQs/YKpsEOfLwC4nhZ4+Cq2oEEzQ=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=cp0613@linux.alibaba.com;NM=1;PH=DS;RN=21;SR=0;TI=SMTPD_---0XBlsELq_1790588859;
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0XBlsELq_1790588859 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 28 Sep 2026 17:47:44 +0800
From: Chen Pei <cp0613@linux.alibaba.com>
To: acme@kernel.org,
	peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org
Cc: mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	leo.yan@linux.dev,
	john.g.garry@oracle.com,
	will@kernel.org,
	mike.leach@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	guoren@kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] perf riscv: Implement rdtsc()
Date: Mon, 28 Sep 2026 17:47:37 +0800
Message-ID: <20260928094739.2605-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_104759_342851_48E74E72 
X-CRM114-Status: GOOD (  15.77  )
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

tools/perf falls back to the __weak rdtsc() stub in tools/perf/util/tsc.c
on every architecture that does not override it, riscv included.  The
stub returns a constant 0, so anything that reaches for the counter gets
a value that means nothing and cannot tell it apart from a counter that
happens to be at 0.

The time CSR is a natural TSC equivalent on riscv: readable from user
mode, constant frequency, and the same counter that riscv's
arch_perf_update_userpage() feeds the user page conversion fields from,
ever since commit 83c5e13b8cbb ("riscv: Prepare for user-space perf
event mmap support").  This series registers that on the tools side.

The two patches are split so that the first stands on its own:

1. Implement rdtsc() over the time CSR for riscv.

2. Replace the compile-time TSC support check with a weak
   arch__rdtsc_supported() hook, so that support is declared next to
   the rdtsc() it describes rather than in the central list of compiler
   macros.

What this is worth beyond the subtest result:

1. The subtest is the only reader of those conversion fields riscv
   can run, so it guards arithmetic that has shipped unexercised;
   registering the counter at the same time leaves a future riscv
   auxtrace driver the reading and the conversion already in place.

2. The hook gives a caller something to ask the architecture before
   it uses the counter value, instead of each caller keeping its own
   copy of the macro list.

Tests:
======
- The "Convert perf time to TSC" test in a riscv64 QEMU virt guest
  with sscofpmf: the subtest skips before the series, passes after it.
- With the riscv implementation left out of the build, so that the
  weak defaults are in effect, the subtest still skips: the behaviour
  of an architecture without a counter is unchanged.

Chen Pei (2):
  perf riscv: Implement rdtsc()
  perf tsc: Replace the compile-time TSC support check with a weak hook

 tools/perf/arch/arm64/util/tsc.c    |  5 +++++
 tools/perf/arch/riscv/util/Build    |  1 +
 tools/perf/arch/riscv/util/tsc.c    | 24 ++++++++++++++++++++++++
 tools/perf/arch/x86/util/tsc.c      |  5 +++++
 tools/perf/tests/perf-time-to-tsc.c | 12 +-----------
 tools/perf/util/tsc.c               |  9 +++++++++
 tools/perf/util/tsc.h               |  1 +
 7 files changed, 46 insertions(+), 11 deletions(-)
 create mode 100644 tools/perf/arch/riscv/util/tsc.c

-- 
2.50.1


