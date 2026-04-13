Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF80F531C3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 18:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nPa2ZZONaBOGLFMfEfBDzaDZgsD31jakJQraeqbgRCw=; b=Qhr3pio4WZWg2ZNbyZHj5IF8sN
	IXBt4B3cfAcbL/S1OdzUF5xMHV7DJzHEub1+7srHxLY21RL67pKsU44/sEhCUkTja4/vP1gtpNzA0
	1ipCuQjU3Pcxyyv5Sf7upoqRz+c3gTSfzd+vE56s24UpRBO/9ytBTx7MSbetEPET/Aou6fuj1U1cm
	qoh0Mia/mMqO0fiyICoG4BWzrHqx53eWF1aGtbzTmE1/imDcjLqqal5/tnPS+ziq+lAiMu644/u5f
	SMTezd7t1w5lPZcsqnMVzIbZpevrNRLfaMfz4m+dz7N/T2Cr6F2GhNUF7iSwdH5bYM1wv2ET9O3ru
	J3IQSSfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCM2I-0000000GCFm-1cGg;
	Mon, 13 Apr 2026 18:29:28 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCM2G-0000000GCCi-1VII
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 18:29:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id F09E31A322D;
	Mon, 13 Apr 2026 18:29:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C3B5B5FFB9;
	Mon, 13 Apr 2026 18:29:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 001941045055E;
	Mon, 13 Apr 2026 20:29:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776104960; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=nPa2ZZONaBOGLFMfEfBDzaDZgsD31jakJQraeqbgRCw=;
	b=Qm0jaSwT24/GdK/EsyzadjCMRmdSwzojdFiBoEhz9mF9mr7uXKqUeMuFzrXmwZ8OzPseYj
	rTiosoU1qw/9rhsO2QAeObwHnb3U0BdA/GKu2X7zqF4XwbXU+sdENJYYJMHV+epMpE+WAE
	5wXX4mFLdnQpzrapducllk94LpMksGi5QQSsfjn+ECbIMOEFADC7qab70hxaKQz0r/EyiW
	+qT+y9jj+fwS4YIkWHcExGPabkcLddCDpfG8oxYqSCHg5OjMFegpaJ+esDIoGjiCGVX++x
	o1cerD3IbFhwDzv5lAIPNVJ37KUVFvTRPwtdsH6wD3ffqjvZudD30QIMdhw1KQ==
From: =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
Date: Mon, 13 Apr 2026 20:28:46 +0200
Subject: [PATCH RFC bpf-next 6/8] selftests/bpf: do not run verifier JIT
 tests when BPF_JIT_KASAN is enabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260413-kasan-v1-6-1a5831230821@bootlin.com>
References: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
In-Reply-To: <20260413-kasan-v1-0-1a5831230821@bootlin.com>
To: Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, 
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, David Ahern <dsahern@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Shuah Khan <shuah@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>, 
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: ebpf@linuxfoundation.org, 
 Bastien Curutchet <bastien.curutchet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Xu Kuohai <xukuohai@huawei.com>, bpf@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, kasan-dev@googlegroups.com, 
 linux-mm@kvack.org, 
 =?utf-8?q?Alexis_Lothor=C3=A9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
X-Mailer: b4 0.15.1
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_112924_533736_8A117736 
X-CRM114-Status: GOOD (  11.49  )
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

Multiple verifier tests validate the exact list of JITed instructions.
Even if the test offers some flexibility in its checks (eg: not
enforcing the first instruction to be verified right at the beginning of
jited code, but rather searching where the expected JIT instructions
could be located), it is confused by the new KASAN instrumentation JITed
in programs: this instrumentation can be inserted anywhere in-between
searched instructions, leading to test failures despite the correct
instructions being generated.

Prevent those failures by skipping tests involving JITed instructions
checks when kernel is built with KASAN _and_ JIT is enabled, as those
two conditions lead the JITed code to contains KASAN checks.

Signed-off-by: Alexis Lothoré (eBPF Foundation) <alexis.lothore@bootlin.com>
---
 tools/testing/selftests/bpf/test_loader.c    | 5 +++++
 tools/testing/selftests/bpf/unpriv_helpers.c | 5 +++++
 tools/testing/selftests/bpf/unpriv_helpers.h | 1 +
 3 files changed, 11 insertions(+)

diff --git a/tools/testing/selftests/bpf/test_loader.c b/tools/testing/selftests/bpf/test_loader.c
index c4c34cae6102..d2c0062ef31a 100644
--- a/tools/testing/selftests/bpf/test_loader.c
+++ b/tools/testing/selftests/bpf/test_loader.c
@@ -1175,6 +1175,11 @@ void run_subtest(struct test_loader *tester,
 		return;
 	}
 
+	if (is_jit_enabled() && subspec->jited.cnt && get_kasan_jit_enabled()) {
+		test__skip();
+		return;
+	}
+
 	if (unpriv) {
 		if (!can_execute_unpriv(tester, spec)) {
 			test__skip();
diff --git a/tools/testing/selftests/bpf/unpriv_helpers.c b/tools/testing/selftests/bpf/unpriv_helpers.c
index f997d7ec8fd0..25bd08648f5f 100644
--- a/tools/testing/selftests/bpf/unpriv_helpers.c
+++ b/tools/testing/selftests/bpf/unpriv_helpers.c
@@ -142,3 +142,8 @@ bool get_unpriv_disabled(void)
 	}
 	return mitigations_off;
 }
+
+bool get_kasan_jit_enabled(void)
+{
+	return config_contains("CONFIG_BPF_JIT_KASAN=y");
+}
diff --git a/tools/testing/selftests/bpf/unpriv_helpers.h b/tools/testing/selftests/bpf/unpriv_helpers.h
index 151f67329665..bc5f4c953c9d 100644
--- a/tools/testing/selftests/bpf/unpriv_helpers.h
+++ b/tools/testing/selftests/bpf/unpriv_helpers.h
@@ -5,3 +5,4 @@
 #define UNPRIV_SYSCTL "kernel/unprivileged_bpf_disabled"
 
 bool get_unpriv_disabled(void);
+bool get_kasan_jit_enabled(void);

-- 
2.53.0


