Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA46FCD6E6E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 20:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JWdw38EiI9Mq6OhPMl4z+SwTGgKYfom6pjkQ6/P5SXE=; b=Fd9mT751n0e1qvaxzsX4r2YuET
	y3J/EUwJQULkrDyJZEpgnoqBXmITPceBAjfUPvIjHD7PFWS+nPrD3oPfef+canfXWmd2gnQjxGSQZ
	WfdVJ2wOXg4QZxKyN/sxG/qDleCdhLWhXbf9ibgSuIskRDO5k7Xy8Bjs86W/XYjrKumIDnyTfIMnd
	8G627h9mxZ9AA/89iRT5RpspLsyfmuXsWhoqsp35EA9O9RpANSfT69oFbcttabK6X3QKBp5nHoUZT
	dvC/shgvH3B5z+gSLTusQ6az8akkRMt4v6YV1WbOHGW3iVfYFQAztXorPBfkJvbiPToteCjEvMZvk
	B6kL2MkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVEaO-0000000HGFG-1w8g;
	Thu, 04 Jun 2026 20:22:40 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVEaJ-0000000HGBS-44Ew
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 20:22:37 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 85A301A07A0;
	Thu,  4 Jun 2026 20:22:33 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 515805FED1;
	Thu,  4 Jun 2026 20:22:33 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A8066106A1D0E;
	Thu,  4 Jun 2026 22:22:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780604551; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=JWdw38EiI9Mq6OhPMl4z+SwTGgKYfom6pjkQ6/P5SXE=;
	b=W43bDU6svXn0gZBV6DoqwOqs70uuSW0/XAyd2Q078jgcmbCzxIVTV2GdZ088o38TOj3oJ5
	4WAEW3fsczlFsEm5sGkFHT1clJKkfTDLxlfeQSVs/WLMsdKg2uWpFbiv0chnu4U+NBXTBZ
	0GAbixyfx8SqaMATSvIiSEL2CugVww/xt2ulqMPJ2kv74PE3oGqpm6lykWwUklGQPeAjVk
	/bMTlpyI/FubabCtktk0KuDFD++Q7gcMqaD3VIQg5VtuBKLk85tR/Mb6F1uOr0QnTsSb3Q
	s9kuqKANfXlFUoXBE7gH/IflXPCLYJu0Lw65kC/e4YUrHE0hndD9YUlHuj7F/Q==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Date: Thu, 04 Jun 2026 22:22:00 +0200
Subject: [PATCH bpf-next v2 2/8] bpf: add BPF_JIT_KASAN for KASAN
 instrumentation of JITed programs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260604-kasan-v2-2-c066e627fda8@bootlin.com>
References: <20260604-kasan-v2-0-c066e627fda8@bootlin.com>
In-Reply-To: <20260604-kasan-v2-0-c066e627fda8@bootlin.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Shuah Khan <shuah@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Ihor Solodrai <ihor.solodrai@linux.dev>
Cc: ebpf@linuxfoundation.org, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, bpf@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, 
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.2
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_132236_146608_2655D3EF 
X-CRM114-Status: GOOD (  11.20  )
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

Add a new Kconfig option CONFIG_BPF_JIT_KASAN that automatically enables
generic KASAN (Kernel Address SANitizer) memory access checks for
JIT-compiled BPF programs as well, when both KASAN_GENERIC and JIT
compiler are enabled. This new Kconfig is not a user selectable one: it
is either automatically enabled if KASAN is enabled on a compatible
platform, or disabled. When enabled, the JIT compiler will emit shadow
memory checks before memory loads and stores to detect use-after-free or
out-of-bounds accesses at runtime. The option is gated behind
HAVE_EBPF_JIT_KASAN, as it needs proper arch-specific implementation.

As KASAN instrumentation for eBPF program will depend on the info that
can be accessed during each instruction verification, there may be
instructions that will be instrumented even if they don't really need to
(eg: global subprograms that access caller stack memory passed as
argument). To make sure that those additional checks do not trigger any
crash, make sure that VMAP_STACK is enabled so that programs stack has
shadow memory allocated.

Signed-off-by: Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>
---
Changes in v2:
- add dependency on kasan for vmalloc and vmalloc'ed stack
---
 kernel/bpf/Kconfig | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/kernel/bpf/Kconfig b/kernel/bpf/Kconfig
index eb3de35734f0..a8e004f88b92 100644
--- a/kernel/bpf/Kconfig
+++ b/kernel/bpf/Kconfig
@@ -17,6 +17,10 @@ config HAVE_CBPF_JIT
 config HAVE_EBPF_JIT
 	bool
 
+# KASAN support for JIT compiler
+config HAVE_EBPF_JIT_KASAN
+	bool
+
 # Used by archs to tell that they want the BPF JIT compiler enabled by
 # default for kernels that were compiled with BPF JIT support.
 config ARCH_WANT_DEFAULT_BPF_JIT
@@ -101,4 +105,9 @@ config BPF_LSM
 
 	  If you are unsure how to answer this question, answer N.
 
+config BPF_JIT_KASAN
+	bool
+	depends on HAVE_EBPF_JIT_KASAN
+	default y if BPF_JIT && KASAN_GENERIC && KASAN_VMALLOC && VMAP_STACK
+
 endmenu # "BPF subsystem"

-- 
2.54.0


